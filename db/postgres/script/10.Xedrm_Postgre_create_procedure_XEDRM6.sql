CREATE OR REPLACE FUNCTION XEDRM6.es_admindelgroup(sroleid character varying, itype smallint)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
BEGIN
  	delete from XEDRM6.SYS_GROUP_MEMBER where GROUP_ID=sRoleId or (Member_Id=sRoleId and Member_Type=iType);
  	delete from XEDRM6.SYS_GROUP_MANAGER where GROUP_ID=sRoleId or (USER_ID=sRoleId);
  	delete from XEDRM6.SYS_GROUP where GROUP_ID=sRoleId;
	delete from XEDRM6.es_shareAccess where RoleId=sRoleId;
END;
$function$
;

CREATE OR REPLACE FUNCTION XEDRM6.es_admindeluser(suserid character varying, itype smallint, sencuserid character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
BEGIN
  	delete from XEDRM6.SYS_GROUP_MANAGER where USER_ID=sUserId;
	delete from XEDRM6.SYS_GROUP_MEMBER where Member_Id=sUserId and Member_Type=iType;
	delete from XEDRM6.SYS_GROUP_MEMBER where group_Id='_user_' || sUserId;   
    delete from XEDRM6.sys_user_attr where User_Id=sUserId;
	delete from XEDRM6.SYS_USER where User_Id=sUserId;
  	delete from XEDRM6.SYS_GROUP where GROUP_ID='_user_' || sUserId;
	delete from XEDRM6.es_shareAccess where RoleId='_user_' || sUserId;
END;
$function$
;

create or replace FUNCTION XEDRM6.sp_asysAddContentElement
(sElementId character varying, sVolumeId character varying, sFileKey character varying, iFileSize bigint, dtCreateDate character varying, dtLastAccess character varying, iContentType bigint, sContentClassId character varying, iCheckHint bigint, dtWriteDate character varying, iRetention bigint, sCheckSum character varying)
returns void
AS $$ 
BEGIN
insert into XEDRM6.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate::date, dtLastAccess::date, iContentType, sContentClassId, iCheckHint, dtWriteDate::date, iRetention, sCheckSum);
END;
$$LANGUAGE plpgsql;

create or replace FUNCTION XEDRM6.sp_asysAddContentElementEx
(sElementId character varying, sVolumeId character varying, sFileKey character varying, iFileSize bigint, dtCreateDate character varying, dtLastAccess character varying, iContentType bigint, sContentClassId character varying, iCheckHint bigint, dtWriteDate character varying, iRetention bigint, sCheckSum character varying)
returns void
AS $$ 
BEGIN
insert into XEDRM6.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate::date, dtLastAccess::date, iContentType, sContentClassId, iCheckHint, dtWriteDate::date, iRetention, sCheckSum);
END;
$$LANGUAGE plpgsql;

create or replace FUNCTION XEDRM6.sp_asysAddElement 
(sElementId character, sDescr character varying, sUserSClass character, sEClassId character)
returns void
AS $$ 
BEGIN
   insert into XEDRM6.asysElement (ElementId, Descr, UserSClass, EClassId) 
	   values (sElementId, sDescr, sUserSClass, sEClassId); 
END;
$$ LANGUAGE plpgsql;

create or replace FUNCTION XEDRM6.sp_es_DelElement 
(sElementId character varying, srElementId character varying)
returns void
AS $$ 
BEGIN
   delete from XEDRM6.asysContentElement where ElementId=sElementId;
   delete from XEDRM6.asysElementAttr where ElementId=sElementId or ElementId=srElementId;
   delete from XEDRM6.es_shareaccess where ElementId=sElementId;
   delete from XEDRM6.es_rewritedoc where elementId=sElementId;
   delete from XEDRM6.es_comments where ElementId=sElementId;
   
   delete from XEDRM6.asysElement where ElementId=sElementId;
   delete from XEDRM6.es_VersionElement where ElementId=sElementId;
   delete from XEDRM6.es_Version where ElementId=sElementId;
   delete from XEDRM6.es_XRef where ElementId=sElementId or AttachId=sElementId;
   delete from XEDRM6.es_bookmark where es_targetId=sElementId;
   delete from XEDRM6.es_share where elementId=sElementId;
   delete from XEDRM6.es_listItems where id=sElementId;
END;
$$LANGUAGE plpgsql;

--------------------------------------------------------
--  DDL for FUNCTION fn_TR_DELETE_CACHE_ACL
--------------------------------------------------------
create or replace FUNCTION XEDRM6.fn_TR_DELETE_CACHE_ACL()
  returns trigger AS
$$
DECLARE
BEGIN
	IF (OLD.SHAREID IS NOT NULL) THEN
		DELETE FROM XEDRM6.ES_EFFECTIVE_ACCESS WHERE ELEMENTID=OLD.ELEMENTID AND PRIV_ID=OLD.SHAREID AND USERROLE = OLD.ROLEID and privilegetype = old.privilegetype ;
	ELSE
		DELETE FROM XEDRM6.ES_EFFECTIVE_ACCESS WHERE ELEMENTID=OLD.ELEMENTID AND PRIV_ID IS null AND USERROLE = OLD.ROLEID and privilegetype = old.privilegetype ;
	END IF;
RETURN NULL;	
END;
$$ LANGUAGE PLPGSQL;

DROP TRIGGER IF EXISTS TR_DELETE_CACHE_ACL ON XEDRM6.ES_SHAREACCESS CASCADE;

CREATE TRIGGER TR_DELETE_CACHE_ACL
AFTER DELETE ON XEDRM6.ES_SHAREACCESS
FOR EACH ROW
EXECUTE PROCEDURE fn_TR_DELETE_CACHE_ACL();

--------------------------------------------------------
--  DDL for FUNCTION fn_TR_DELETE_SECUREACCESS
--------------------------------------------------------
create or replace FUNCTION XEDRM6.fn_TR_DELETE_SECUREACCESS()
  returns trigger AS
$$
DECLARE
BEGIN
	DELETE FROM XEDRM6.ES_SHAREACCESS WHERE ELEMENTID=OLD.ELEMENTID AND SHAREID IS null and roleid = old.userrole and privilegetype = old.privilegetype;
RETURN NULL;	
END;
$$ LANGUAGE PLPGSQL;

drop trigger if exists TR_DELETE_SECUREACCESS on XEDRM6.ES_SECUREACCESS CASCADE;
CREATE TRIGGER TR_DELETE_SECUREACCESS
INSTEAD OF DELETE ON XEDRM6.ES_SECUREACCESS
FOR EACH ROW
EXECUTE PROCEDURE fn_TR_DELETE_SECUREACCESS();

--------------------------------------------------------
--  DDL for Trigger TR_INSERT_CACHE_ACL
--------------------------------------------------------

create or replace FUNCTION XEDRM6.fn_TR_INSERT_CACHE_ACL()
  returns trigger AS
$$
DECLARE
BEGIN
   INSERT INTO XEDRM6.ES_EFFECTIVE_ACCESS (ELEMENTID, USERROLE, PRIVILEGETYPE, ENDDATE, PRIV_ID, TEMPLATEID, STARTdate, PRIVILEGE)
   SELECT new.ELEMENTID, new.ROLEID, new.PRIVILEGETYPE, new.END_DT, new.SHAREID, new.PRIVILEGE, new.START_DT, (SELECT PRIV_VAL FROM XEDRM6.ES_PRIV_TEMPLATE WHERE TEMPLATEID =new.PRIVILEGE ) AS PRIVILEGE;
RETURN new;
END;
$$ LANGUAGE PLPGSQL;

drop trigger if exists TR_INSERT_CACHE_ACL on XEDRM6.ES_EFFECTIVE_ACCESS CASCADE;

CREATE TRIGGER TR_INSERT_CACHE_ACL
AFTER INSERT ON XEDRM6.ES_SHAREACCESS 
FOR EACH row 
EXECUTE PROCEDURE fn_TR_INSERT_CACHE_ACL();

--------------------------------------------------------
--  DDL for Trigger TR_INSERT_SECUREACCESS
--------------------------------------------------------

drop trigger if exists TR_INSERT_SECUREACCESS on XEDRM6.ES_SECUREACCESS;

create or replace function instead_of_secureaccess()
returns trigger as 
$$
BEGIN
  INSERT INTO XEDRM6.ES_SHAREACCESS (ROLEID, PRIVILEGE, START_DT, END_DT, PRIVILEGETYPE, ELEMENTID)
  VALUES(new.USERROLE, new.TEMPLATEID, new.STARTDATE, new.ENDDATE, new.PRIVILEGETYPE, new.ELEMENTID);
 return new;
END;
$$ LANGUAGE PLPGSQL;

create TRIGGER TR_INSERT_SECUREACCESS
INSTEAD OF INSERT ON XEDRM6.ES_SECUREACCESS
for each row
execute procedure instead_of_secureaccess();

--------------------------------------------------------
--  DDL for Procedure ES_EFFECTIVE_ACCESS_COPY
--------------------------------------------------------
create or replace procedure XEDRM6.ES_EFFECTIVE_ACCESS_COPY
(parentEid VARCHAR)
AS $$
DECLARE
  pid varchar(16) := parentEid;
  eid record;
BEGIN
  -- 1. 자식 권한 삭제
  DELETE FROM PUBLIC.ES_EFFECTIVE_ACCESS
  WHERE ELEMENTID IN (
            WITH RECURSIVE CHILDLIST(ELEMENTID, LEVEL, USERSCLASS) AS (
            SELECT ELEMENTID, 0, USERSCLASS
            FROM PUBLIC.ASYSELEMENT
            WHERE ELEMENTID = pid
            UNION ALL
            SELECT C.ELEMENTID, P.LEVEL + 1, C.USERSCLASS
            FROM PUBLIC.ASYSELEMENT C, CHILDLIST P
            WHERE C.PARENTID = P.ELEMENTID
              AND ( C.USERSCLASS = 'INHERITED')
            )
            SELECT ELEMENTID
            FROM CHILDLIST
            ORDER BY LEVEL
  )
  AND ABS(PRIVILEGETYPE) = 13;
FOR EID IN (
               WITH RECURSIVE CHILDLIST(ELEMENTID, LEVEL, USERSCLASS) AS (
                  --INITIAL QUERY
                  SELECT ELEMENTID, 0, USERSCLASS FROM PUBLIC.ASYSELEMENT
                  WHERE ELEMENTID=pid
                  UNION ALL
                  --RECURSIVE QUERY
                  SELECT C.ELEMENTID, P.LEVEL+1, C.USERSCLASS FROM PUBLIC.ASYSELEMENT C, CHILDLIST P
                  WHERE C.PARENTID=P.ELEMENTID
                    AND C.USERSCLASS ='INHERITED'
               )
               SELECT ELEMENTID
                 FROM CHILDLIST
                WHERE USERSCLASS='INHERITED'
                ORDER BY LEVEL
      )
    loop
        SELECT PARENTID INTO pid FROM ASYSELEMENT WHERE ELEMENTID = EID.ELEMENTID;
        INSERT INTO PUBLIC.ES_EFFECTIVE_ACCESS (ELEMENTID, USERROLE, PRIVILEGE, TEMPLATEID, PRIVILEGETYPE, DESCR, STARTDATE, ENDDATE, INDEXED, PRIV_ID)
            SELECT EID.ELEMENTID, USERROLE, PRIVILEGE, TEMPLATEID, CASE WHEN PRIVILEGETYPE != 15 THEN 13 ELSE -13 END, DESCR, STARTDATE, ENDDATE, INDEXED, PRIV_ID
            FROM PUBLIC.ES_EFFECTIVE_ACCESS WHERE ELEMENTID=pid;

        -- 선택된 elementId(parentid) 와 EID.ELEMENTID 가 같을경우는 update 하지 않는다 (선택된 부모 parent 정보가 overwrite 된다)
        if parentEid != EID.ELEMENTID then
            update asyselement
            set (groupid, admin_id, priv_owner, priv_group, priv_other, priv_admin) = (
                select groupid, admin_id, priv_owner, priv_group, priv_other, priv_admin
                from asyselement ae where ae.elementid = pid)
            WHERE elementid = EID.ELEMENTID;
        end if;
    END LOOP;
END; $$
LANGUAGE PLPGSQL;

--------------------------------------------------------
--  DDL for Procedure FUNC_GET_GROUP_PERMISSION_PRIV 
--------------------------------------------------------

create or replace function XEDRM6.FUNC_GET_GROUP_PERMISSION_PRIV (f_bit numeric, f_userId char, f_elementId CHAR)
 returns numeric
 language plpgsql
as $function$
declare
	priv_num numeric := 0;
	cnt_num numeric := 0;
	need_chk_subgroup numeric := 0;
	group_str varchar(256) := '';
begin
	SELECT a.groupid, et.priv_val, (f_bit::int & et.priv_val::int )
	INTO group_str, priv_num , need_chk_subgroup
	FROM ASYSELEMENT a, es_priv_template et 
	WHERE a.PRIV_GROUP = et.TEMPLATEID AND a.ELEMENTID = f_elementId ;

	if need_chk_subgroup = 0 then
		select count(*)
		into cnt_num
		from sys_group_member sgm
		where sgm.group_id = group_str and sgm.member_id = f_userId;
	else
		select count(*)
		into cnt_num
		from (
			select *from sys_group_member where group_id in(
				with recursive childlist(group_id,parent_id, path, cycle) as (
					select group_id, parent_id, array[sg.group_id ::text], false	
					from sys_group sg
					where group_id = group_str
					union all 
					select c.group_id,c.parent_id, array_append(p.path, c.group_id ::text), c.group_id = any(p.path)
					from sys_group c, childlist p
					where c.parent_id = p.group_id and not cycle
				) select group_id from childlist
			) and member_id = f_userId
		) a;
	end if;
	IF cnt_num != 0 then 
		RETURN coalesce(priv_num, 0);
	end if;
    RETURN 0;
end;
$function$
;
-- FUNCTION: XEDRM6.func_get_permission_priv(numeric, character, character)

-- DROP FUNCTION XEDRM6.func_get_permission_priv(numeric, character, character);

CREATE OR REPLACE FUNCTION XEDRM6.func_get_permission_priv(
	f_bit numeric,
	f_userid character,
	f_elementid character)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
    user_str varchar(256) := '';
	priv_all integer := 0;
	priv_num integer := 0;
	cnt_num numeric := 0;
	need_chk_subgroup numeric := 0;
	group_str varchar(256) := '';
begin

    -- 소유자 권한 
	SELECT a.creator, et.priv_val
	INTO user_str, priv_num 
	FROM ASYSELEMENT a, es_priv_template et
	WHERE a.PRIV_OWNER = et.TEMPLATEID AND a.ELEMENTID = f_elementId  ;

    if user_str=f_userid then priv_all=priv_num; end if;
	
	-- 모든 사용자 권한 
	SELECT et.priv_val INTO priv_num
	FROM ASYSELEMENT a, es_priv_template et
	WHERE a.PRIV_OTHER = et.TEMPLATEID AND a.ELEMENTID = f_elementId ;
	
	priv_all := priv_all | coalesce(priv_num,0);
    -- 그룹 권한
	SELECT a.groupid, et.priv_val, (f_bit::int & et.priv_val::int )
	INTO group_str, priv_num , need_chk_subgroup
	FROM ASYSELEMENT a, es_priv_template et 
	WHERE a.PRIV_GROUP = et.TEMPLATEID AND a.ELEMENTID = f_elementId ;

	if need_chk_subgroup = 0 then
		select count(*)
		into cnt_num
		from sys_group_member sgm
		where sgm.group_id = group_str and sgm.member_id = f_userId;
	else
		select count(*)
		into cnt_num
		from (
			select *from sys_group_member where group_id in(
				with recursive childlist(group_id,parent_id, path, cycle) as (
					select group_id, parent_id, array[sg.group_id ::text], false	
					from sys_group sg
					where group_id = group_str
					union all 
					select c.group_id,c.parent_id, array_append(p.path, c.group_id ::text), c.group_id = any(p.path)
					from sys_group c, childlist p
					where c.parent_id = p.group_id and not cycle
				) select group_id from childlist
			) and member_id = f_userId
		) a;
	end if;
	
	IF cnt_num != 0 then 
		priv_all := priv_all | coalesce(priv_num,0);
	end if;
	
	-- 관리자 권한
	priv_num := 0;
	
	SELECT et.priv_val INTO priv_num
	FROM ASYSELEMENT a, es_priv_template et 
	WHERE a.PRIV_ADMIN = et.TEMPLATEID AND a.ELEMENTID = f_elementId
      AND (a.admin_id = f_userId or f_userId in (select member_id from sys_group_member where group_id=a.admin_id) )	;
	
    priv_all := priv_all | coalesce(priv_num,0);
	
	
    -- ACL 조회
	priv_num := 0;
	
	SELECT bit_or(privilege::integer) into priv_num
	FROM es_effective_access ef
	where ef.ELEMENTID = f_elementId
	  AND ef.privilegetype != 15
      AND ef.privilegetype != -13
      AND f_userId in (select member_id from sys_group_member where group_id=ef.userrole )
	  AND ( ( ef.startDate IS NULL
					OR ef.startDate < CURRENT_TIMESTAMP)
					AND (ef.endDate IS NULL
					OR ef.endDate > CURRENT_TIMESTAMP - INTERVAL '24' HOUR ) )	  ;
	
	priv_all := priv_all | coalesce(priv_num,0);
	
	-- DENY ACL 조회
	priv_num := 0;

	SELECT bit_or(privilege::integer) into priv_num
	FROM es_effective_access ef
	where ef.ELEMENTID = f_elementId
	  AND ( ef.privilegetype = 15 or ef.privilegetype = -13)
      AND f_userId in (select member_id from sys_group_member where group_id=ef.userrole ) 
   	  AND ( ( ef.startDate IS NULL
				OR ef.startDate < CURRENT_TIMESTAMP)
				AND (ef.endDate IS NULL
				OR ef.endDate > CURRENT_TIMESTAMP - INTERVAL '24' HOUR ) )	;
     
    if priv_num is not null then priv_all := priv_all & priv_num; end if;
	
    RETURN priv_all;
end;
$BODY$;


COMMIT;