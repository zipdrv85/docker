CREATE OR REPLACE FUNCTION XEDRM5.GETCODENAME(i_code VARCHAR2, i_lan VARCHAR2)
 RETURN VARCHAR2

IS
	r_codename varchar(200) := '';

BEGIN

  IF i_lan = 'KO' OR  i_lan = 'ko' THEN

    SELECT code_name INTO r_codename FROM XEDRM5.sw_code WHERE code_id = i_code;

  END IF;

  IF i_lan = 'EN' OR  i_lan = 'en' THEN

    SELECT code_enm INTO r_codename FROM XEDRM5.sw_code WHERE code_id = i_code;

  END IF;

  RETURN r_codename;

END ;
/
CREATE OR REPLACE FUNCTION XEDRM5.GETGROUPNAME(i_code VARCHAR2)
 RETURN VARCHAR2

IS
	r_codename varchar(200) := '';

BEGIN

  SELECT  GROUP_NM INTO r_codename FROM XEDRM5.SYS_GROUP WHERE group_id = i_code;

  RETURN r_codename;

END;
/

create or replace FUNCTION   XEDRM5.GETUSERINFOBYID(i_userid VARCHAR2, i_type VARCHAR2, i_lan VARCHAR2)
 RETURN VARCHAR2

IS

	r_name VARCHAR2(200) := '';

BEGIN


    IF i_lan = 'KO' OR  i_lan = 'ko'  THEN

    IF i_type = 'U' THEN

      SELECT user_nm INTO r_name FROM XEDRM5.sys_user WHERE user_id = i_userid;

    END IF;

    IF i_type = 'D' THEN

      SELECT group_nm INTO r_name FROM XEDRM5.sys_group WHERE group_id = ( SELECT rep_group_id FROM XEDRM5.sys_user WHERE user_id = i_userid );

    END IF;

    IF i_type = 'P' THEN

      SELECT code_name INTO r_name FROM XEDRM5.sw_code WHERE code_id = ( SELECT POSITION_CD FROM XEDRM5.sys_user WHERE user_id = i_userid ) AND use_yn = 'Y';



    END IF;

  END IF;

  IF i_lan = 'EN' OR  i_lan = 'en'  THEN

    IF i_type = 'U' THEN

      SELECT user_enm INTO r_name FROM XEDRM5.sys_user WHERE user_id = i_userid;

    END IF;

    IF i_type = 'D' THEN

      SELECT group_enm INTO r_name FROM XEDRM5.sys_group WHERE group_id = ( SELECT rep_group_id FROM XEDRM5.sys_user WHERE user_id = i_userid )  AND use_yn = 'Y';

    END IF;

    IF i_type = 'P' THEN

      SELECT code_enm INTO r_name FROM XEDRM5.sw_code WHERE  code_id = ( SELECT POSITION_CD FROM XEDRM5.sys_user WHERE user_id = i_userid );


    END IF;

  END IF;

  RETURN r_name;

END;
/

create or replace PROCEDURE XEDRM5.WORK_STATISTIC
(p_before_day integer)
AS
BEGIN 
 -- 실제 근무 시간 갱신 
	MERGE INTO sw_work  sw
    USING(
    		select sw.user_id, sw.work_day as work_day, sum(sgo.goout_time) as goout_time from 
			( 
				select
				   to_char(sysdate - p_before_day + ROWNUM - 1, 'YYYY-MM-DD') AS work_day
				from
				   all_objects
				where
				   rownum <=
				   to_date(SYSDATE ,'yyyy-mm-dd')-to_date(SYSDATE - p_before_day,'yyyy-mm-dd')+1
							
					)  gs
				left outer join XEDRM5.sw_work sw
				on gs.work_day = sw.work_day
				left outer join XEDRM5.sw_go_out sgo
				on sw.work_day = sgo.work_day and sw.user_id = sgo.user_id 
				and (sgo.tag is null or sgo.tag ='Y')
				and (sgo.type like 'A0904%' or sgo.type is null)
				where sw.user_id is not null
				group by sw.user_id, sw.work_day
        ) B
        ON(
        sw.work_day between TO_CHAR(SYSDATE- p_before_day,'YYYY-MM-DD') and TO_CHAR(SYSDATE,'YYYY-MM-DD')
        and real_end_cputime is not null and real_start_cputime is not null
        and sw.user_id = B.user_id
        and sw.work_day = B.work_day
        )
        WHEN MATCHED THEN
    UPDATE SET 		real_working_time = 
            case when (sw.work_day = B.work_day and B.goout_time is not null and sw.user_id=B.user_id) 
                then case when (real_end_cputime - real_start_cputime)/60 - B.goout_time > 0  then (real_end_cputime - real_start_cputime)/60 - B.goout_time 
                else 0 
                end 
            else (real_end_cputime - real_start_cputime)/60
            end
    ;

	-- 실제 미인정 외출 시간 갱신
    MERGE INTO sw_work A
    USING 
            (
            select sw_go_out.user_id, sw_go_out.work_day, sum(sw_go_out.goout_time) as goout_time 
            from XEDRM5.sw_go_out
            inner join XEDRM5.sw_work
            on sw_work.user_id = sw_go_out.user_id and sw_work.work_day = sw_go_out.work_day
            where sw_go_out.work_day between TO_CHAR(TRUNC(SYSDATE)- p_before_day,'YYYY-MM-DD') and TO_CHAR(TRUNC(SYSDATE),'YYYY-MM-DD')
            and type like 'A0904%'
            group by sw_go_out.user_id, sw_go_out.work_day
            ) B
    ON ( 
            A.work_day between TO_CHAR(TRUNC(SYSDATE)- p_before_day,'YYYY-MM-DD') and TO_CHAR(TRUNC(SYSDATE),'YYYY-MM-DD')
            and A.user_id = B.user_id and A.work_day = B.work_day
    )
    WHEN MATCHED THEN
    UPDATE
       SET  A.goout_time   =  B.goout_time
;
	
	-- insert stat
    MERGE INTO sw_work_week a
    USING (
          SELECT
              h.user_id   AS user_id,
              h.dept_id   AS dept_id,
              year,
              week,
              SUM(h.work_end_cputime - h.work_start_cputime) / 60 AS working_time, -- 총 정책 근로시간(분) 
              SUM(h.over_times) AS over_time, -- 총 연장근로 시간(분) 
              SUM(
                  CASE
                      WHEN h.work_type IN(
                          'A0103'
                      ) THEN
                          1
                      ELSE
                          0
                  END
              ) AS business_trip_time, -- 출장일수  
              SUM(
                  CASE
                      WHEN h.work_type IN(
                          'A010202', 'A010203'
                      ) THEN
                          0.5
                      WHEN h.work_type LIKE 'A0102%' THEN
                          1
                      ELSE
                          0
                  END
              ) AS closed_time, -- 휴무일수 
              SUM(h.goout_time) AS go_out_time, --  총 미인정 자리비움(분)
              SUM(h.real_working_time) AS real_working_time, -- 총 실 근로시간(분)
              CEIL(avg(H.real_start_cputime - ((to_date(work_day, 'YYYY-MM-DD') - to_date('1970-01-01', 'YYYY-MM-DD')))*24*60*60  )) as avg_start_time,	-- 평균출근
	          CEIL(avg(H.real_end_cputime   - ((to_date(work_day, 'YYYY-MM-DD') - to_date('1970-01-01', 'YYYY-MM-DD')))*24*60*60  )) as avg_end_time, -- 평균퇴근


              SUM(
                  CASE
                      WHEN h.real_working_time IS NULL THEN
                          0
                      WHEN h.real_working_time < 1 THEN
                          0
                      ELSE
                          1
                  END
              ) AS worked_days	-- 실제 일한 일 수 
          FROM
              XEDRM5.sw_work h
          WHERE
              h.work_day BETWEEN to_char(sysdate - p_before_day, 'YYYY-MM-DD') AND to_char(sysdate, 'YYYY-MM-DD')
          GROUP BY
              h.user_id,
              year,
              week,
              h.dept_id
      )
    b ON ( a.user_id = b.user_id
           AND a.dept_id = b.dept_id
           AND a.year = b.year
           AND a.week = b.week )
    WHEN MATCHED THEN UPDATE
    SET a.over_time = b.over_time,
        a.closed_time = b.closed_time,   
        a.avg_start_time = b.avg_start_time,
        a.avg_end_time = b.avg_end_time,
        a.go_out_time = b.go_out_time,
        a.real_working_time = b.real_working_time,
        a.worked_days = b.worked_days
    WHEN NOT MATCHED THEN
    INSERT (
        user_id,
        dept_id,
        year,
        week,
        over_time,
        closed_time,
        go_out_time,
        real_working_time,
        avg_start_time,
        avg_end_time,
        worked_days )
    VALUES
        ( b.user_id,
          b.dept_id,
          b.year,
          b.week,
          b.over_time,
          b.closed_time,
          b.go_out_time,
          b.real_working_time,
          b.avg_start_time,
          b.avg_end_time,
          b.worked_days );
          
commit;
END WORK_STATISTIC;
/