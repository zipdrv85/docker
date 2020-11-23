CREATE OR REPLACE FUNCTION public.distance(h_lat numeric, h_lng numeric, t_lat numeric, t_lng numeric)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$

BEGIN

	RETURN ( 6371.0 * acos( 

          cos( radians( H_LAT ) )*cos( radians( T_LAT /* 위도 */ ) )

          *cos( radians( T_LNG /* 경도 */ )-radians( H_LNG ) )

          +

          sin( radians( H_LAT ) )*sin( radians( T_LAT /* 위도 */ ) )       

         ));

END;

$function$
;
CREATE OR REPLACE FUNCTION public.getcodename(i_code character varying, i_lan character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

declare

	r_codename varchar(200);

BEGIN

  IF i_lan = 'KO' THEN

    SELECT code_name INTO r_codename FROM sw_code WHERE code_id = i_code;

  END IF;

  IF i_lan = 'EN' THEN

    SELECT code_enm INTO r_codename FROM sw_code WHERE code_id = i_code;

  END IF;

  RETURN r_codename;

END;

$function$
;

CREATE OR REPLACE FUNCTION public.getgroupname(i_code character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

declare

	r_codename varchar(200);

BEGIN

  SELECT  GROUP_NM INTO r_codename FROM SYS_GROUP WHERE group_id = i_code;

  RETURN r_codename;

END;

$function$
;
CREATE OR REPLACE FUNCTION public.getpolicyname(i_code character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

declare

	r_codename varchar(200);

BEGIN

  SELECT   POLICY_NAME INTO r_codename FROM SW_POLICY WHERE policy_id = i_code limit 1;

  RETURN r_codename;

END;

$function$
;
CREATE OR REPLACE FUNCTION public.getuserinfobyid(i_userid character varying, i_type character varying, i_lan character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

declare

	r_name varchar(200);

BEGIN

    IF i_lan = 'KO' THEN

    IF i_type = 'U' THEN

      SELECT user_nm INTO r_name FROM public.sys_user WHERE user_id = i_userid;

    END IF;

    IF i_type = 'D' THEN

      SELECT group_nm INTO r_name FROM sys_group WHERE group_id = ( SELECT rep_group_id FROM public.sys_user WHERE user_id = i_userid );

    END IF;

    IF i_type = 'P' THEN

      SELECT code_name INTO r_name FROM sw_code WHERE code_id = ( SELECT POSITION_CD FROM public.sys_user WHERE user_id = i_userid ) AND use_yn = 'Y';

      /* SELECT '직위' INTO r_name FROM dual; */

    END IF;

  END IF;

  IF i_lan = 'EN' THEN

    IF i_type = 'U' THEN

      SELECT user_enm INTO r_name FROM public.sys_user WHERE user_id = i_userid;

    END IF;

    IF i_type = 'D' THEN

      SELECT group_enm INTO r_name FROM sys_group WHERE group_id = ( SELECT rep_group_id FROM public.sys_user WHERE user_id = i_userid )  AND use_yn = 'Y';

    END IF;

    IF i_type = 'P' THEN

      SELECT code_enm INTO r_name FROM sw_code WHERE  code_id = ( SELECT POSITION_CD FROM public.sys_user WHERE user_id = i_userid );

      /* SELECT 'postion' INTO r_name FROM dual; */

    END IF;

  END IF;

  RETURN r_name;

END;

$function$
;


CREATE OR REPLACE FUNCTION public.radians(ndegrees numeric)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$

BEGIN

	RETURN nDegrees / 57.29577951308232087679815481410517033235;

END;

$function$
;

CREATE OR REPLACE FUNCTION public.work_statistic(p_before_day integer)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$

declare
	n_count integer;
	total_count numeric(38) := 0;
    tenant_list record;
begin
-- (현재는, 1주일 전 시점부터) 갱신

FOR tenant_list IN (SELECT distinct tenant_id from public.saas_tenant st where active_yn = 'y')
LOOP      
	RAISE notice 'Processing tenant -  %', tenant_list.tenant_id; 

	IF tenant_list.tenant_id is not null THEN
	   execute concat('set schema ','''',tenant_list.tenant_id,'''');
	end if;

	-- 실제 근무 시간 갱신 
	update sw_work as sw
	set
		real_working_time = 
		case when (sw.work_day = B.work_day and B.goout_time is not null and sw.user_id=B.user_id)
			then (real_end_cputime - real_start_cputime)/60 - B.goout_time
		else (real_end_cputime - real_start_cputime)/60
		end
	from 
	(
		select sw.user_id, sw.work_day, sum(sgo.goout_time) as goout_time from 
			( select to_char(generate_series, 'YYYY-MM-DD') as work_day FROM generate_series(current_date-p_before_day, current_date, '1 days') )as gs
			left outer join sw_work sw 
			on gs.work_day = sw.work_day
			left outer join sw_go_out sgo 
			on sw.work_day = sgo.work_day and sw.user_id = sgo.user_id 
			and (sgo.tag is null or sgo.tag ='Y')
			and (sgo.type like 'A0904%' or sgo.type is null)
			where sw.user_id is not null
			group by sw.user_id, sw.work_day
		) as B 
	where 1=1
	and sw.work_day between TO_CHAR(CURRENT_DATE-p_before_day,'YYYY-MM-DD') and TO_CHAR(CURRENT_DATE,'YYYY-MM-DD')
	and real_end_cputime is not null and real_start_cputime is not null
	and sw.user_id = B.user_id
	and sw.work_day = B.work_day;
	GET DIAGNOSTICS n_count = ROW_COUNT;
	RAISE notice 'sw_work affected count -  %', n_count; 
	
	-- 실제 미인정 외출 시간 갱신
	update sw_work as A
	set goout_time = B.goout_time
	from (
		select sw_go_out.user_id, sw_go_out.work_day, sum(sw_go_out.goout_time) as goout_time 
		from sw_go_out
		inner join sw_work
		on sw_work.user_id = sw_go_out.user_id and sw_work.work_day = sw_go_out.work_day
		and (sw_go_out.tag is null or sw_go_out.tag = 'Y')
		where sw_go_out.work_day between TO_CHAR(CURRENT_DATE-p_before_day,'YYYY-MM-DD') and TO_CHAR(CURRENT_DATE,'YYYY-MM-DD')
		and type like 'A0904%'
		group by sw_go_out.user_id, sw_go_out.work_day
		) as B 
	where 1=1
	and A.work_day between TO_CHAR(CURRENT_DATE-p_before_day,'YYYY-MM-DD') and TO_CHAR(CURRENT_DATE,'YYYY-MM-DD')
	and A.user_id = B.user_id and A.work_day = B.work_day
	;
	GET DIAGNOSTICS n_count = ROW_COUNT;
	RAISE notice 'goout affected count -  %', n_count; 
	
	--
	-- 비어있는 실 퇴근시간(real_end_cputime) 갱신 (하지 않기로 함. 퇴근을 직접 하고/하지않고 구분하기 위해) 
	--
	 
	-- sw_go_out 자리비움 테이블에서 대상 제외 status <- 1 (update하는것이 힘들기 때문에, 모두 갱신하는 것으로 하면 아래 로직 필요없음)
--	update sw_go_out
--	set status = 0
--	where work_day between TO_CHAR(CURRENT_DATE-p_before_day,'YYYY-MM-DD') and TO_CHAR(CURRENT_DATE,'YYYY-MM-DD')
--	and status = 1;
--	GET DIAGNOSTICS n_count = ROW_COUNT;
--	RAISE notice 'affected count -  %', n_count; 
	
	-- insert stat
	insert into sw_work_week (user_id, dept_id, year, week, working_time,
		over_time, business_trip_time, closed_time, avg_start_time, avg_end_time, go_out_time, real_working_time, worked_days )
	select
	  H.user_id as user_id,
	  H.dept_id as dept_id,
	  year, week,
	  sum(H.work_end_cputime - H.work_start_cputime)/60 as working_time, -- 총 정책 근로시간(분) 
	  sum(H.over_times) as over_time, -- 총 연장근로 시간(분) 
	  sum(CASE WHEN H.work_type in ('A0103') THEN 1 
	  		ELSE 0 END) as business_trip_time, -- 출장일수  
	  sum(CASE WHEN H.work_type in ('A010202','A010203') THEN 0.5 
	  		WHEN H.work_type like 'A0102%' THEN 1
	  		ELSE 0 END) as closed_time, -- 휴무일수 
	  avg(H.real_start_cputime - date_part('epoch',to_timestamp(work_day, 'YYYY-MM-DD'))::int) as avg_start_time,	-- 평균출근
	  avg(H.real_end_cputime - date_part('epoch',to_timestamp(work_day, 'YYYY-MM-DD'))::int) as avg_end_time, -- 평균퇴근
	  sum(H.goout_time ) as go_out_time, --  총 미인정 자리비움(분)
	  sum(H.real_working_time) as real_working_time, -- 총 실 근로시간(분)
	  sum(CASE WHEN H.real_working_time is null THEN 0
  		WHEN H.real_working_time < 1 THEN 0
  		ELSE 1 END) as worked_days	-- 실제 일한 일 수 
	FROM sw_work H
	WHERE 
		H.work_day between TO_CHAR(CURRENT_DATE-p_before_day,'YYYY-MM-DD') and TO_CHAR(CURRENT_DATE,'YYYY-MM-DD')
	    GROUP by
	    	user_id
			,year
			,week
			,H.dept_id
	on conflict (user_id, dept_id, year, week)
	do
		update
		set	over_time = EXCLUDED.over_time 
		,closed_time = EXCLUDED.closed_time 
		,avg_start_time = EXCLUDED.avg_start_time
		,avg_end_time = EXCLUDED.avg_end_time 
		,go_out_time = EXCLUDED.go_out_time 
		,real_working_time = EXCLUDED.real_working_time
		,worked_days = EXCLUDED.worked_days
	;
	GET DIAGNOSTICS n_count = ROW_COUNT;
	RAISE notice 'stat affected count -  %', n_count; 

	total_count := total_count + n_count;

-- TODO : 중간커밋 
--	commit;

END LOOP;

RETURN total_count;

END;

$function$
;



