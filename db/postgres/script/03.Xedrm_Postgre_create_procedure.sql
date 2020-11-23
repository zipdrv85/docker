CREATE OR REPLACE FUNCTION public.es_admindelgroup(sroleid character varying, itype smallint)
 RETURNS void
 LANGUAGE plpgsql
AS $function$

BEGIN

  	delete from SYS_GROUP_MEMBER where GROUP_ID=sRoleId or (Member_Id=sRoleId and Member_Type=iType);

  	delete from SYS_GROUP_MANAGER where GROUP_ID=sRoleId or (USER_ID=sRoleId);

  	delete from SYS_GROUP where GROUP_ID=sRoleId;

 	delete from es_AdhocAuth where UserRole=sRoleId and (PrivilegeType=2 or PrivilegeType=4 or PrivilegeType=6 or PrivilegeType=7 );

	delete from es_SecureAccess where RoleId=sRoleId;

	delete from es_shareAccess where RoleId=sRoleId;

END;

$function$
;


CREATE OR REPLACE FUNCTION public.es_admindeluser(suserid character varying, itype smallint, sencuserid character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$

BEGIN

  	delete from SYS_GROUP_MANAGER where USER_ID=sUserId;

	delete from SYS_GROUP_MEMBER where Member_Id=sUserId and Member_Type=iType;

	delete from SYS_GROUP_MEMBER where group_Id='_user_' || sUserId;
    
    delete from sys_user_attr where User_Id=sUserId;

	delete from SYS_USER where User_Id=sUserId;

  	delete from SYS_GROUP where GROUP_ID='_user_' || sUserId;

	delete from es_SecureAccess where RoleId='_user_' || sUserId;

	delete from es_shareAccess where RoleId='_user_' || sUserId;

	delete from es_AdhocAuth where UserRole='_user_' || sUserId;

END;

$function$
;


create or replace FUNCTION public.sp_asysAddContentElement
(sElementId character varying, sVolumeId character varying, sFileKey character varying, iFileSize bigint, dtCreateDate character varying, dtLastAccess character varying, iContentType bigint, sContentClassId character varying, iCheckHint bigint, dtWriteDate character varying, iRetention bigint, sCheckSum character varying)
returns void
AS $$ 
BEGIN
insert into asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate::date, dtLastAccess::date, iContentType, sContentClassId, iCheckHint, dtWriteDate::date, iRetention, sCheckSum);
END;
$$LANGUAGE plpgsql;

create or replace FUNCTION public.sp_asysAddContentElementEx
(sElementId character varying, sVolumeId character varying, sFileKey character varying, iFileSize bigint, dtCreateDate character varying, dtLastAccess character varying, iContentType bigint, sContentClassId character varying, iCheckHint bigint, dtWriteDate character varying, iRetention bigint, sCheckSum character varying)
returns void
AS $$ 
BEGIN
insert into asysContentElement
 (ElementId, VolumeId, FileKey, FileSize, CreateDate, LastAccess, ContentType, ContentClassId, CheckHint, WriteDate, Retention, CheckSum)
 values (sElementId, sVolumeId, sFileKey, iFileSize, dtCreateDate::date, dtLastAccess::date, iContentType, sContentClassId, iCheckHint, dtWriteDate::date, iRetention, sCheckSum);
END;
$$LANGUAGE plpgsql;


create or replace FUNCTION public.sp_asysAddElement 
(sElementId character, sDescr character varying, sUserSClass character, sEClassId character)
returns void
AS $$ 
BEGIN
   insert into asysElement (ElementId, Descr, UserSClass, EClassId) 
	   values (sElementId, sDescr, sUserSClass, sEClassId); 
END;
$$ LANGUAGE plpgsql;

create or replace FUNCTION public.sp_es_DelElement 
(sElementId character varying, srElementId character varying)
returns void
AS $$ 
BEGIN
   delete from asysContentElement where ElementId=sElementId;
   delete from asysElementAttr where ElementId=sElementId or ElementId=srElementId;
   delete from es_AdhocAuth where ElementId=sElementId;
   delete from es_rewritedoc where elementId=sElementId;

   delete from asysElement where ElementId=sElementId;
   delete from es_VersionElement where ElementId=sElementId;
   delete from es_Version where ElementId=sElementId;
   delete from es_XRef where ElementId=sElementId or AttachId=sElementId;
   delete from es_bookmark where es_targetId=sElementId;
   delete from es_share where elementId=sElementId;
   delete from es_listItems where id=sElementId;
END;
$$LANGUAGE plpgsql;


create or replace FUNCTION publicsp_es_DelElement 
(sElementId character, srElementId character)
returns void
AS $$ 
BEGIN
   delete from asysContentElement where ElementId=sElementId;
   delete from asysElementAttr where ElementId=sElementId or ElementId=srElementId;
   delete from es_AdhocAuth where ElementId=sElementId;
   delete from es_rewritedoc where elementId=sElementId;

   delete from asysElement where ElementId=sElementId;
   delete from es_VersionElement where ElementId=sElementId;
   delete from es_Version where ElementId=sElementId;
   delete from es_XRef where ElementId=sElementId or AttachId=sElementId;
   delete from es_bookmark where es_targetId=sElementId;
   delete from es_share where elementId=sElementId;
   delete from es_listItems where id=sElementId;
END;
$$LANGUAGE plpgsql;