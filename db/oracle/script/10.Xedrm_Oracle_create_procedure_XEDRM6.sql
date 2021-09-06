--------------------------------------------------------
--  DDL for Procedure ES_ADMINDELGROUP
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.ES_ADMINDELGROUP
(sRoleId VARCHAR2, iType smallint)
AS 
BEGIN
	delete from XEDRM6.SYS_GROUP_MEMBER where GROUP_ID=sRoleId or (Member_Id=sRoleId and Member_Type=iType);
  delete from XEDRM6.SYS_GROUP_MANAGER where GROUP_ID=sRoleId or (USER_ID=sRoleId);
  delete from XEDRM6.SYS_GROUP where GROUP_ID=sRoleId;
	delete from XEDRM6.es_shareAccess where RoleId=sRoleId;
	
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));

END es_AdminDelGroup;
/
--------------------------------------------------------
--  DDL for Procedure ES_ADMINDELUSER
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.ES_ADMINDELUSER
(sUserId VARCHAR2, iType smallint, sEncUserId VARCHAR2)
AS 
BEGIN
  delete from XEDRM6.SYS_GROUP_MANAGER where USER_ID=sUserId;
	delete from XEDRM6.SYS_GROUP_MEMBER where Member_Id=sUserId and Member_Type=iType;
	delete from XEDRM6.SYS_GROUP_MEMBER where group_Id='_user_' || sUserId;
	delete from XEDRM6.SYS_USER_ATTR where User_Id=sUserId;
	delete from XEDRM6.SYS_USER where User_Id=sUserId;
  delete from XEDRM6.SYS_GROUP where GROUP_ID='_user_' || sUserId;
	delete from XEDRM6.es_shareAccess where RoleId='_user_' || sUserId;
	
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));

END es_ADMINDELUSER;
/
--------------------------------------------------------
--  DDL for Procedure MOVE_FOLDER
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.MOVE_FOLDER
(sElementId char, tElementId char, tGroupId char)
AS 
-- s_ : source, t_ : target
s_parentACLID  char(16)  := '';
t_parentACLID  char(16)  := '';
t_userSClass  char(16)  := ''; 
s_path varchar(4000) := '';
t_path varchar(4000) := '';
s_path_length smallint := 0;
s_folderpath varchar(4000) := '';
t_folderpath varchar(4000) := '';
BEGIN
--0. 변수값 저장
    -- s_parentACLID
    SELECT parentACLid 
        INTO s_parentACLID
    FROM XEDRM6.asyselement where elementid = sElementId;

    -- t_userSClass
    SELECT usersclass 
        INTO t_userSClass
    FROM XEDRM6.asyselement where elementid = tElementId;
    
    -- t_parentACLID
    if(t_userSClass = 'ACL             ') then
        t_parentACLID := tElementId;
    elsif( t_userSClass = 'INHERITED       ') then
        SELECT parentACLid 
            INTO t_parentACLID
        FROM XEDRM6.asyselement where elementid = tElementId;
    end if;
    
    --s_path
    SELECT path||'%'
        INTO s_path
    FROM XEDRM6.asyselement where elementid = sElementId;
    
    --t_path
    SELECT path
        INTO t_path
    FROM XEDRM6.asyselement where elementid = tElementId;

--1. ASYSSTATICCONTAINER 변경
--    update asysstaticcontainer set elementid = tElementId where contentid = sElementId;
    
--2. parentId 변경. 
-- parentId가 null인 엘리먼트는 갱신 안함.
    update XEDRM6.asyselement set parentid = tElementId
    where elementid = sElementId and parentid is not null;

--3. parentACLid 변경
 /* soure의 parentACLid 값이 존재할 때,
    parentACLid가 source의 parentACLid와 동일한 엘리먼트들에 대해서
    parentACLid 값을 target의 parentACLid으로 변경한다.*/
    if (s_parentACLID is not null) then
        update XEDRM6.asyselement E set parentACLid = t_parentACLID
        where parentACLid = s_parentACLID
        and usersclass = 'INHERITED       '
        and exists (select elementid from XEDRM6.asyselement where path like s_path);
                          --from asyselementattr ATTR
                          --where attrname = 'p:path' and attrvalue like s_path and E.elementid = ATTR.elementid);
    end if;
    
--4. folderPath 변경
  SELECT folderpath 
    INTO s_folderpath
  FROM XEDRM6.asyselement where elementid = sElementId;
  
  SELECT folderpath||descr||'/'
    INTO t_folderpath
  FROM XEDRM6.asyselement where elementid = tElementId;
  
  update XEDRM6.asysElement set folderpath = replace(folderpath, s_folderpath, t_folderpath)
  where path like s_path;    

--6. groupId 변경  
  update XEDRM6.asysElement set groupId = tGroupId
  where path like s_path;
    
--5. path 변경
  s_path_length := length(s_path) - 17;

  update XEDRM6.ASYSELEMENT aa
  set aa.path = t_path || substr(path, s_path_length) 
  where aa.path like s_path;

	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));

END MOVE_FOLDER;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDCONTENTELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.SP_ASYSADDCONTENTELEMENT
(sElementId char, sVolumeId char, sFileKey varchar2, iFileSize integer, dtCreateDate date, dtLastAccess date, iContentType smallint, sContentClassId char, sGeneralData varchar2, iCheckHint integer, dtWriteDate date, iRetention integer, sCheckSum varchar2)
AS
BEGIN
insert into XEDRM6.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, GeneralData, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate, dtLastAccess, iContentType, sContentClassId, sGeneralData, iCheckHint, dtWriteDate, iRetention, sCheckSum);
 
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));
 
END sp_asysAddContentElement;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDCONTENTELEMENTEX
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.SP_ASYSADDCONTENTELEMENTEX
(sElementId char, sVolumeId char, sFileKey varchar2, iFileSize integer, dCreateDate date, dLastAccess date, iContentType smallint, sContentClassId char, sGeneralData varchar2, iCheckHint integer, dtWriteDate date, iRetention integer, sCheckSum varchar2)
AS
BEGIN 
insert into XEDRM6.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, GeneralData, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dCreateDate, dLastAccess, iContentType, sContentClassId, sGeneralData, iCheckHint, dtWriteDate, iRetention, sCheckSum);
 
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));

END sp_asysAddContentElementEx;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.SP_ASYSADDELEMENT
(sElementId char, sDescr varchar2, sUserSClass char, sEClassId char)
AS 
BEGIN
   insert into XEDRM6.asysElement (ElementId, Descr, UserSClass, EClassId)
	   values (sElementId, sDescr, sUserSClass, sEClassId); 
	   
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));

END sp_asysAddElement;
/
--------------------------------------------------------
--  DDL for Procedure SP_ES_DELELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM6.SP_ES_DELELEMENT
(sElementId char, srElementId char)
AS
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
 
	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));
   
END sp_es_DelElement;
/

--------------------------------------------------------
--  DDL for Trigger TR_DELETE_CACHE_ACL
--------------------------------------------------------

create or replace TRIGGER XEDRM6.TR_DELETE_CACHE_ACL
    AFTER DELETE ON XEDRM6.ES_SHAREACCESS
    FOR EACH ROW
    BEGIN
    	IF (:OLD.SHAREID IS NOT NULL) THEN
         	DELETE FROM XEDRM6.ES_EFFECTIVE_ACCESS WHERE ELEMENTID=:OLD.ELEMENTID AND PRIV_ID=:OLD.SHAREID AND USERROLE=:OLD.ROLEID AND privilegetype=:old.privilegetype;
        ELSE
        	DELETE FROM XEDRM6.ES_EFFECTIVE_ACCESS WHERE ELEMENTID=:OLD.ELEMENTID AND PRIV_ID IS NULL AND USERROLE=:OLD.ROLEID AND privilegetype=:old.privilegetype;
        END IF;
   END;
/   
--------------------------------------------------------
--  DDL for Trigger TR_DELETE_SECUREACCESS
--------------------------------------------------------

create or replace TRIGGER XEDRM6.TR_DELETE_SECUREACCESS
    INSTEAD OF DELETE ON XEDRM6.ES_SECUREACCESS
    BEGIN
         DELETE FROM XEDRM6.ES_SHAREACCESS WHERE ELEMENTID=:OLD.ELEMENTID AND SHAREID IS NULL and roleid=:old.userrole and privilegetype=:old.privilegetype;
   END;
/

--------------------------------------------------------
--  DDL for Trigger TR_INSERT_CACHE_ACL
--------------------------------------------------------

create or replace TRIGGER XEDRM6.TR_INSERT_CACHE_ACL
AFTER INSERT ON XEDRM6.ES_SHAREACCESS
FOR EACH ROW
 BEGIN
   INSERT INTO XEDRM6.ES_EFFECTIVE_ACCESS (ELEMENTID, USERROLE, PRIVILEGETYPE, ENDDATE, PRIV_ID, TEMPLATEID, STARTDATE, PRIVILEGE)
   SELECT :new.ELEMENTID, :new.ROLEID, :new.PRIVILEGETYPE, :new.END_DT, :new.SHAREID, :new.PRIVILEGE, :new.START_DT, (SELECT PRIV_VAL FROM XEDRM6.ES_PRIV_TEMPLATE WHERE TEMPLATEID =:new.PRIVILEGE ) AS PRIVILEGE
   FROM DUAL  ;
 END;
 /

 --------------------------------------------------------
--  DDL for Trigger TR_INSERT_SECUREACCESS
--------------------------------------------------------

 
 create or replace TRIGGER XEDRM6.TR_INSERT_SECUREACCESS 
 INSTEAD OF INSERT ON XEDRM6.ES_SECUREACCESS
 BEGIN
   INSERT INTO XEDRM6.ES_SHAREACCESS (ROLEID, PRIVILEGE, START_DT, END_DT, PRIVILEGETYPE, ELEMENTID)
   VALUES(:new.USERROLE, :new.TEMPLATEID, :new.STARTDATE, :new.ENDDATE, :new.PRIVILEGETYPE, :new.ELEMENTID);
 END;
 /

 --------------------------------------------------------
--  DDL for Procedure ES_EFFECTIVE_ACCESS_COPY
--------------------------------------------------------

create or replace PROCEDURE          XEDRM6.ES_EFFECTIVE_ACCESS_COPY
(parentEid VARCHAR2)
AS
pid varchar(16) :=parentEid;

BEGIN 

	-- 1. 자식 권한 삭제
	DELETE FROM XEDRM6.ES_EFFECTIVE_ACCESS 
	WHERE ELEMENTID IN (
		-- 자식값 추출
		SELECT ELEMENTID FROM (		
			SELECT
				e.ELEMENTID
			FROM 
				XEDRM6.ASYSELEMENT E
			START WITH E.ELEMENTID = parentEid	-- eid 매개변수 (부모값)
			CONNECT BY PRIOR E.ELEMENTID = E.PARENTID AND ( E.USERSCLASS = 'INHERITED' OR E.ELEMENTID = parentEid) -- 자식값(권한 상속) 하위 노드 매핑
		)  childList
	) AND ABS(PRIVILEGETYPE) = 13;

    for eid in (
				SELECT
					ELEMENTID
				FROM 
					XEDRM6.ASYSELEMENT e
                    WHERE E.USERSCLASS='INHERITED'
				START WITH E.ELEMENTID = parentEid	-- eid 매개변수 (부모값)
				CONNECT BY PRIOR E.ELEMENTID = E.PARENTID AND E.USERSCLASS = 'INHERITED' -- 자식값(권한 상속) 하위 노드 매핑
                order by level
                )  
    loop
        select parentid into pid from asyselement where elementid = eid.elementid;
        
        INSERT INTO XEDRM6.es_effective_access (ELEMENTID, USERROLE, PRIVILEGE, TEMPLATEID, PRIVILEGETYPE, DESCR, STARTDATE, ENDDATE, INDEXED, PRIV_ID) 
		SELECT eid.elementid, USERROLE, PRIVILEGE, TEMPLATEID, CASE WHEN PRIVILEGETYPE != 15 THEN 13 ELSE -13 END, DESCR, STARTDATE, ENDDATE, INDEXED, PRIV_ID 
		FROM XEDRM6.ES_EFFECTIVE_ACCESS where pid=elementid;

        -- 선택된 elementId(parentid) 와 EID.ELEMENTID 가 같을경우는 update 하지 않는다 (선택된 부모 parent 정보가 overwrite 된다)
        if parentEid != EID.ELEMENTID then
        update asyselement
        set (groupid, admin_id, priv_owner, priv_group, priv_other, priv_admin) = (
            select groupid, admin_id, priv_owner, priv_group, priv_other, priv_admin
            from asyselement ae where ae.elementid = pid)
        WHERE elementid = EID.ELEMENTID;
        end if;
    end loop;

	COMMIT;

	EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20001, 'RAISE_APPLICATION_ERROR : ' || SQLCODE || ' : ' ||SUBSTR(SQLERRM, 1, 200));


END ES_EFFECTIVE_ACCESS_COPY;
/


 --------------------------------------------------------
--  DDL for FUNCTION FUNC_GET_GROUP_PERMISSION_PRIV
--------------------------------------------------------
COMMIT;
CREATE OR replace FUNCTION XEDRM6.FUNC_GET_GROUP_PERMISSION_PRIV (f_bit number , f_userId CHAR, f_elementId CHAR)
	RETURN NUMBER
IS
 priv_num NUMBER := 0;
 group_str varchar(256) := '';
 cnt_num NUMBER := 0;
 need_chk_subgroup number := 0;
BEGIN 
	SELECT nvl(max(a.groupid),''), nvl(max(et.priv_val),0), nvl(max(bitand(1048576,et.priv_val)),0)
	INTO group_str, priv_num , need_chk_subgroup
	FROM ASYSELEMENT a, es_priv_template et 
	WHERE a.PRIV_GROUP = et.TEMPLATEID AND a.ELEMENTID = f_elementId ;
	
	if need_chk_subgroup = 0 then
		SELECT count(*)
		INTO cnt_num
		from sys_group_member sgm
		where sgm.group_id = group_str and sgm.member_id = f_userId;
	else 
		select count(*) 
		into cnt_num
		from sys_group_member where group_id in(
			select group_id
			from sys_group sg
			start with sg.group_id = group_str
			connect by NOCYCLE prior sg.parent_id = sg.group_id
		) and member_id = f_userId;
	end if ;
  
	IF cnt_num != 0 then 
		RETURN nvl(priv_num, 0);
	end if;
    RETURN 0;
END func_get_group_permission_priv;
/

 --------------------------------------------------------
--  DDL for FUNCTION func_get_permission_priv
--------------------------------------------------------
CREATE OR REPLACE FUNCTION XEDRM6.func_get_permission_priv(f_bit numeric, f_userid character, f_elementid character)
 RETURN numeric
is
    user_str varchar(256) := '';
	priv_all integer := 0;
	priv_num integer := 0;
	cnt_num numeric := 0;
	need_chk_subgroup numeric := 0;
	group_str varchar(256) := '';
	deny_priv integer := 0;
    result_priv integer := 0;
	deny_exist integer := 0;
begin
    -- 소유자 권한
	SELECT max(a.creator), max(et.priv_val)
	INTO user_str, priv_num 
	FROM ASYSELEMENT a, es_priv_template et
	WHERE a.PRIV_OWNER = et.TEMPLATEID AND a.ELEMENTID = f_elementId  ;
    if user_str=f_userid then 
      priv_all:=priv_num; 
   end if;
	
	-- 모든 사용자 권한
	SELECT et.priv_val INTO priv_num
	FROM ASYSELEMENT a, es_priv_template et
	WHERE a.PRIV_OTHER = et.TEMPLATEID AND a.ELEMENTID = f_elementId ;
	
	priv_all :=   utl_raw.cast_to_binary_integer(utl_raw.bit_or(utl_raw.cast_from_binary_integer(priv_all ),utl_raw. cast_from_binary_integer(coalesce(priv_num,0))));
    -- 그룹 권한
    
	SELECT a.groupid, et.priv_val, bitand(f_bit ,et.priv_val )
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
             select * from sys_group_member where group_id in(
                 with childlist(group_id,parent_id, path) as (
                     select group_id, parent_id, group_id as path
                     from sys_group sg
                     where group_id = group_str
                     union all
                     select c.group_id,c.parent_id, p.path||'/'||c.group_id as path
                     from sys_group c, childlist p
                     where c.parent_id = p.group_id
                 )
                          cycle group_id set is_cycle to '1' default '0'
                 select group_id
                 from childlist
             ) and member_id = f_userId
         ) a;
	end if;
	
	IF cnt_num != 0 then
		priv_all := utl_raw.cast_to_binary_integer(utl_raw.bit_or(utl_raw.cast_from_binary_integer(priv_all ),utl_raw. cast_from_binary_integer(coalesce(priv_num,0))));
	end if;
	
	-- 관리자 권한
	priv_num := 0;
	
	SELECT nvl(max(et.priv_val),0) INTO priv_num
	FROM ASYSELEMENT a, es_priv_template et
	WHERE a.PRIV_ADMIN = et.TEMPLATEID AND a.ELEMENTID = f_elementId
      AND (a.admin_id = f_userId or f_userId in (select member_id from sys_group_member where group_id=a.admin_id) )	;
	
    priv_all := utl_raw.cast_to_binary_integer(utl_raw.bit_or(utl_raw.cast_from_binary_integer(priv_all ),utl_raw. cast_from_binary_integer(coalesce(priv_num,0))));
	
	
    -- ACE 조회
    FOR priv_rec IN
        (SELECT privilege FROM es_effective_access ef
         WHERE ef.ELEMENTID = f_elementId
		 AND ef.privilegetype != 15
		 AND ef.privilegetype != -13
         AND f_userId in (select member_id from sys_group_member where group_id=ef.userrole )
         AND ( ( ef.startDate IS NULL
				OR ef.startDate < CURRENT_TIMESTAMP)
				AND (ef.endDate IS NULL
				OR ef.endDate > CURRENT_TIMESTAMP - INTERVAL '24' HOUR ) ))
    LOOP
    if priv_rec.privilege is not null then
    	priv_all := utl_raw.cast_to_binary_integer(utl_raw.bit_or(utl_raw.cast_from_binary_integer(priv_all ),utl_raw. cast_from_binary_integer(coalesce(priv_rec.privilege,0))));
    end if;
    END loop;
    
    -- 거부 ACE 조회
    FOR priv_rec IN
        (SELECT privilege FROM es_effective_access ef
         WHERE ef.ELEMENTID = f_elementId
         AND ( ef.privilegetype = 15 or ef.privilegetype = -13)
         AND f_userId in (select member_id from sys_group_member where group_id=ef.userrole )
         AND ( ( ef.startDate IS NULL
				OR ef.startDate < CURRENT_TIMESTAMP)
				AND (ef.endDate IS NULL
				OR ef.endDate > CURRENT_TIMESTAMP - INTERVAL '24' HOUR ) ))
    LOOP
    if priv_rec.privilege is not null then
    	deny_priv := utl_raw.cast_to_binary_integer(utl_raw.bit_or(utl_raw.cast_from_binary_integer(deny_priv ),utl_raw. cast_from_binary_integer(coalesce(priv_rec.privilege,0))));
		deny_exist := 1;
    end if;
    END loop;
    
	if deny_exist = 1 then
		SELECT BITAND(priv_all, deny_priv) INTO result_priv FROM DUAL;
	else
		result_priv := priv_all;
	end if;

    RETURN result_priv;
    
end;
/