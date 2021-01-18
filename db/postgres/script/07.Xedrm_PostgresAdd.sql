-----------2020.05.18 대시보드 통계기능 관련 테이블 추가-----------
CREATE TABLE public."es_statlogicvolume"
  (
    "elementid" character(16),
    "userid"    character varying(256),
    "groupid"   character varying(256),
    "folder"    numeric(14,0),
    "doc"       numeric(14,0),
    "filesize"  numeric(19,0)
  ) ;
CREATE TABLE public."es_statphyvolume"
  (
    "volumeid"    character(16),
    "regdate"     character varying(10),
    "usedspace"   numeric(14,0),
    "total"       numeric(14,0),
    "usablespace" numeric(14,0)
  ) ;
CREATE TABLE public."es_statsummary"
  (
    "es_event" character varying(255),
    "userid"   character varying(256),
    "roleid"   character varying(256),
    "summary"  numeric(19,0)
  ) ;

  ALTER TABLE only public."es_statlogicvolume" alter column "filesize" SET NOT null ;
  ALTER TABLE only public."es_statlogicvolume" alter column "doc" SET NOT null ;
  ALTER TABLE only public."es_statlogicvolume" alter column "folder" SET NOT null ;
  ALTER TABLE only public."es_statlogicvolume" alter column "elementid" SET NOT null ;
  ALTER TABLE only public."es_statphyvolume" alter column "usablespace" SET NOT null ;
  ALTER TABLE only public."es_statphyvolume" alter column "total" SET NOT null ;
  ALTER TABLE only public."es_statphyvolume" alter column "usedspace" SET NOT null ;
  ALTER TABLE only public."es_statphyvolume" alter column "regdate" SET NOT null ;
  ALTER TABLE only public."es_statphyvolume" alter column "volumeid" SET NOT null ;
  ALTER TABLE only public."es_statsummary" alter column "summary" SET NOT null ;
  ALTER TABLE only public."es_statsummary" alter column "es_event" SET NOT null ;
 
 --협업--
insert into public.ASYSELEMENT (ELEMENTID,DESCR,USERSCLASS,ECLASSID,EXPIRATION,UUID,CREATOR,CREATED,MODIFIER,MODIFIED,ACCESSED,TRANSACTION_ID,DELETED,STATUS,PARENTACLID,PATH,FOLDERPATH,PARENTID) values ('Coop            ','Coop','NONE            ','FOLDER          ',null,null,'SUPER',to_date('17/02/10','YY/MM/DD'),'SUPER',to_date('17/01/20','YY/MM/DD'),to_date('17/01/20','YY/MM/DD'),null,0,0,null,'/Coop/','/','SPACE_ROOT      ');

COMMIT;