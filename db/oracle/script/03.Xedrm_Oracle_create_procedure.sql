--------------------------------------------------------
--  DDL for Procedure ES_ADMINDELGROUP
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.ES_ADMINDELGROUP
(sRoleId VARCHAR2, iType smallint)
AS 
BEGIN
	delete from XEDRM5.SYS_GROUP_MEMBER where GROUP_ID=sRoleId or (Member_Id=sRoleId and Member_Type=iType);
  delete from XEDRM5.SYS_GROUP_MANAGER where GROUP_ID=sRoleId or (USER_ID=sRoleId);
  delete from XEDRM5.SYS_GROUP where GROUP_ID=sRoleId;
	delete from XEDRM5.es_AdhocAuth where UserRole=sRoleId and (PrivilegeType=2 or PrivilegeType=4 or PrivilegeType=6 or PrivilegeType=7 );
	delete from XEDRM5.es_SecureAccess where RoleId=sRoleId;
	delete from XEDRM5.es_shareAccess where RoleId=sRoleId;
END es_AdminDelGroup;
/
--------------------------------------------------------
--  DDL for Procedure ES_ADMINDELUSER
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.ES_ADMINDELUSER
(sUserId VARCHAR2, iType smallint, sEncUserId VARCHAR2)
AS 
BEGIN
  delete from XEDRM5.SYS_GROUP_MANAGER where USER_ID=sUserId;
	delete from XEDRM5.SYS_GROUP_MEMBER where Member_Id=sUserId and Member_Type=iType;
	delete from XEDRM5.SYS_GROUP_MEMBER where group_Id='_user_' || sUserId;
	delete from XEDRM5.SYS_USER_ATTR where User_Id=sUserId;
	delete from XEDRM5.SYS_USER where User_Id=sUserId;
  delete from XEDRM5.SYS_GROUP where GROUP_ID='_user_' || sUserId;
	delete from XEDRM5.es_SecureAccess where RoleId='_user_' || sUserId;
	delete from XEDRM5.es_shareAccess where RoleId='_user_' || sUserId;
	delete from XEDRM5.es_AdhocAuth where UserRole='_user_' || sUserId;
END es_ADMINDELUSER;
/
--------------------------------------------------------
--  DDL for Procedure MOVE_FOLDER
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.MOVE_FOLDER
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
    FROM XEDRM5.asyselement where elementid = sElementId;

    -- t_userSClass
    SELECT usersclass 
        INTO t_userSClass
    FROM XEDRM5.asyselement where elementid = tElementId;
    
    -- t_parentACLID
    if(t_userSClass = 'ACL             ') then
        t_parentACLID := tElementId;
    elsif( t_userSClass = 'INHERITED       ') then
        SELECT parentACLid 
            INTO t_parentACLID
        FROM XEDRM5.asyselement where elementid = tElementId;
    end if;
    
    --s_path
    SELECT path||'%'
        INTO s_path
    FROM XEDRM5.asyselement where elementid = sElementId;
    
    --t_path
    SELECT path
        INTO t_path
    FROM XEDRM5.asyselement where elementid = tElementId;

--1. ASYSSTATICCONTAINER 변경
--    update asysstaticcontainer set elementid = tElementId where contentid = sElementId;
    
--2. parentId 변경. 
-- parentId가 null인 엘리먼트는 갱신 안함.
    update XEDRM5.asyselement set parentid = tElementId
    where elementid = sElementId and parentid is not null;

--3. parentACLid 변경
 /* soure의 parentACLid 값이 존재할 때,
    parentACLid가 source의 parentACLid와 동일한 엘리먼트들에 대해서
    parentACLid 값을 target의 parentACLid으로 변경한다.*/
    if (s_parentACLID is not null) then
        update XEDRM5.asyselement E set parentACLid = t_parentACLID
        where parentACLid = s_parentACLID
        and usersclass = 'INHERITED       '
        and exists (select elementid from XEDRM5.asyselement where path like s_path);
                          --from asyselementattr ATTR
                          --where attrname = 'p:path' and attrvalue like s_path and E.elementid = ATTR.elementid);
    end if;
    
--4. folderPath 변경
  SELECT folderpath 
    INTO s_folderpath
  FROM XEDRM5.asyselement where elementid = sElementId;
  
  SELECT folderpath||descr||'/'
    INTO t_folderpath
  FROM XEDRM5.asyselement where elementid = tElementId;
  
  update XEDRM5.asysElement set folderpath = replace(folderpath, s_folderpath, t_folderpath)
  where path like s_path;    

--6. groupId 변경  
  update XEDRM5.asysElement set groupId = tGroupId
  where path like s_path;
    
--5. path 변경
  s_path_length := length(s_path) - 17;

  update XEDRM5.ASYSELEMENT aa
  set aa.path = t_path || substr(path, s_path_length) 
  where aa.path like s_path;

  commit;
END MOVE_FOLDER;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDCONTENTELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.SP_ASYSADDCONTENTELEMENT
(sElementId char, sVolumeId char, sFileKey varchar2, iFileSize integer, dtCreateDate date, dtLastAccess date, iContentType smallint, sContentClassId char, sGeneralData varchar2, iCheckHint integer, dtWriteDate date, iRetention integer, sCheckSum varchar2)
AS
BEGIN
insert into XEDRM5.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, GeneralData, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate, dtLastAccess, iContentType, sContentClassId, sGeneralData, iCheckHint, dtWriteDate, iRetention, sCheckSum);
END sp_asysAddContentElement;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDCONTENTELEMENTEX
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.SP_ASYSADDCONTENTELEMENTEX
(sElementId char, sVolumeId char, sFileKey varchar2, iFileSize integer, dCreateDate date, dLastAccess date, iContentType smallint, sContentClassId char, sGeneralData varchar2, iCheckHint integer, dtWriteDate date, iRetention integer, sCheckSum varchar2)
AS
BEGIN 
insert into XEDRM5.asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, GeneralData, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dCreateDate, dLastAccess, iContentType, sContentClassId, sGeneralData, iCheckHint, dtWriteDate, iRetention, sCheckSum);
END sp_asysAddContentElementEx;
/
--------------------------------------------------------
--  DDL for Procedure SP_ASYSADDELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.SP_ASYSADDELEMENT
(sElementId char, sDescr varchar2, sUserSClass char, sEClassId char)
AS 
BEGIN
   insert into XEDRM5.asysElement (ElementId, Descr, UserSClass, EClassId)
	   values (sElementId, sDescr, sUserSClass, sEClassId); 
END sp_asysAddElement;
/
--------------------------------------------------------
--  DDL for Procedure SP_ES_DELELEMENT
--------------------------------------------------------


  CREATE OR REPLACE PROCEDURE XEDRM5.SP_ES_DELELEMENT
(sElementId char, srElementId char)
AS
BEGIN
   delete from XEDRM5.asysContentElement where ElementId=sElementId;
   delete from XEDRM5.asysElementAttr where ElementId=sElementId or ElementId=srElementId;
   delete from XEDRM5.es_AdhocAuth where ElementId=sElementId;
   delete from XEDRM5.es_rewritedoc where elementId=sElementId;

   delete from XEDRM5.asysElement where ElementId=sElementId;
   delete from XEDRM5.es_VersionElement where ElementId=sElementId;
   delete from XEDRM5.es_Version where ElementId=sElementId;
   delete from XEDRM5.es_XRef where ElementId=sElementId or AttachId=sElementId;
   delete from XEDRM5.es_bookmark where es_targetId=sElementId;
   delete from XEDRM5.es_share where elementId=sElementId;
   delete from XEDRM5.es_listItems where id=sElementId;
END sp_es_DelElement;
/

COMMIT;