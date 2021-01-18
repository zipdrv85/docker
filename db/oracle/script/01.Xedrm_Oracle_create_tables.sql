--------------------------------------------------------
--  DDL for Sequence ES_STICK
--------------------------------------------------------

   CREATE SEQUENCE XEDRM5.ES_STICK  MINVALUE 0 MAXVALUE 1295 INCREMENT BY 1 START WITH 646 NOCACHE  NOORDER  CYCLE;
--------------------------------------------------------
--  DDL for Table ASYSCONTENTELEMENT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ASYSCONTENTELEMENT 
   (	ELEMENTID CHAR(16), 
	VOLUMEID CHAR(16), 
	FILEKEY VARCHAR2(64), 
	FILESIZE NUMBER(*,0), 
	CREATEDATE DATE, 
	LASTACCESS DATE, 
	CONTENTTYPE NUMBER(*,0), 
	CONTENTCLASSID CHAR(16), 
	GENERALDATA VARCHAR2(64), 
	CHECKHINT NUMBER(*,0), 
	WRITEDATE DATE, 
	RETENTION NUMBER(*,0), 
	CHECKSUM VARCHAR2(64)
   ) TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ASYSELEMENT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ASYSELEMENT 
   (	ELEMENTID CHAR(16), 
	DESCR VARCHAR2(4000), 
	USERSCLASS CHAR(16), 
	ECLASSID CHAR(16), 
	EXPIRATION DATE, 
	UUID VARCHAR2(36), 
	CREATOR VARCHAR2(255), 
	CREATED DATE, 
	MODIFIER VARCHAR2(255), 
	MODIFIED DATE, 
	ACCESSED DATE, 
	TRANSACTION_ID NUMBER(38,0), 
	DELETED NUMBER(19,0) DEFAULT 0, 
	STATUS NUMBER(19,0) DEFAULT 0, 
	PARENTACLID CHAR(16), 
	PATH VARCHAR2(4000), 
	FOLDERPATH VARCHAR2(4000), 
	PRODUCER VARCHAR2(256), 
	PARENTID CHAR(16), 
	FILESIZE NUMBER(38,0), 
	DEADLINE DATE, 
	RULEID CHAR(16), 
	COMMENTSID CHAR(16), 
	RATINGSID CHAR(16), 
	LOCKUSERID VARCHAR2(256), 
	ENABLE NUMBER, 
	GROUPID VARCHAR2(256), 
	INDEXED NUMBER, 
	VERSION VARCHAR2(36), 
	TEMPLATEID NUMBER(18,0), 
	DESCRIPTION VARCHAR2(4000)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ASYSELEMENTATTR
--------------------------------------------------------

  CREATE TABLE XEDRM5.ASYSELEMENTATTR 
   (	ELEMENTID CHAR(16), 
	ATTRNAME VARCHAR2(64), 
	ATTRVALUE VARCHAR2(4000), 
	LABEL VARCHAR2(255), 
	MANDATORY CHAR(1) DEFAULT 0, 
	TYPE NUMBER(19,0) DEFAULT 0, 
	EDITOR NUMBER(19,0) DEFAULT 0, 
	POSITION NUMBER(19,0) DEFAULT 0, 
	SERIALIZABLEVALUE BLOB, 
	DOUBLEVALUE NUMBER(38,3)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ASYSVOLUME
--------------------------------------------------------

  CREATE TABLE XEDRM5.ASYSVOLUME 
   (	VOLUMEID CHAR(16), 
	DESCR VARCHAR2(64), 
	MAXSPACE NUMBER(14,0), 
	SPACELEFT NUMBER(14,0), 
	RECOVERSPACE NUMBER(*,0), 
	STATUS NUMBER(*,0), 
	ADMINSCLASS CHAR(16), 
	PARAMETER VARCHAR2(64), 
	USABLESPACE NUMBER(14,0), 
	STARTDATE DATE, 
	ENDDATE DATE
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table COM_WORKFLOW_ITEM
--------------------------------------------------------

  CREATE TABLE XEDRM5.COM_WORKFLOW_ITEM 
   (	ITEM_IDX NUMBER(5,0), 
	ITEM_NM VARCHAR2(64), 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	CHK_TYPE VARCHAR2(20), 
	CHK_CONTENT VARCHAR2(4000)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table COM_WORKFLOW_LIST
--------------------------------------------------------

  CREATE TABLE XEDRM5.COM_WORKFLOW_LIST 
   (	ITEM_IDX NUMBER(5,0), 
	LIST_IDX NUMBER(5,0), 
	WORKFLOW_CL VARCHAR2(32), 
	LIST_ORDER NUMBER(3,0), 
	POLICY_ID VARCHAR2(20), 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_ADHOCAUTH
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_ADHOCAUTH 
   (	ELEMENTID CHAR(16), 
	USERROLE VARCHAR2(256), 
	PRIVILEGE NUMBER, 
	PRIVILEGETYPE NUMBER(*,0), 
	DESCR VARCHAR2(64), 
	STARTDATE DATE, 
	ENDDATE DATE,
	INDEXED NUMBER
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_ADMINMENU
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_ADMINMENU 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_TITLE VARCHAR2(255), 
	ES_PARENTID NUMBER(19,0), 
	ES_ICON VARCHAR2(255), 
	ES_DESCRIPTION VARCHAR2(4000), 
	ES_URL VARCHAR2(1000), 
	ES_ORDER NUMBER
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_AUDIT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_AUDIT 
   (	ES_TYPE NUMBER(*,0), 
	ES_TARGETID VARCHAR2(20), 
	ES_PARENTID VARCHAR2(20), 
	ES_HASFILE NUMBER(*,0), 
	ES_HASTABLE NUMBER(*,0), 
	ES_EVENTS VARCHAR2(1000)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_BOOKMARK
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_BOOKMARK 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_USERID VARCHAR2(20), 
	ES_TARGETID VARCHAR2(20), 
	ES_TYPE NUMBER(10,0), 
	ES_TITLE VARCHAR2(255), 
	ES_DESCRIPTION VARCHAR2(4000), 
	ES_POSITION NUMBER(10,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_CODES
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_CODES 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_CODE VARCHAR2(255), 
	ES_NAME VARCHAR2(255), 
	ES_VALUE VARCHAR2(255), 
	ES_DESCRIPTION VARCHAR2(1000)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_COMMENTS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_COMMENTS 
   (	COMMENTID NUMBER(19,0), 
	ELEMENTID CHAR(16), 
	ES_COMMENT VARCHAR2(4000), 
	CREATORID VARCHAR2(256), 
	CREATOR_NM VARCHAR2(128), 
	CREATED TIMESTAMP (6), 
	DELETED NUMBER(38,0), 
	LASTMODIFIED TIMESTAMP (6), 
	VERSION VARCHAR2(36)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_DASHBOARD
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_DASHBOARD 
   (	ES_ID NUMBER(19,0), 
	ES_DELETED NUMBER(*,0), 
	ES_USERID VARCHAR2(20), 
	ES_TARGETID VARCHAR2(20), 
	ES_DASHNAME VARCHAR2(64)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_DASHBOARDWIDGET
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_DASHBOARDWIDGET 
   (	ES_WIDGETTYPE VARCHAR2(64), 
	ES_WIDGETNAME VARCHAR2(64), 
	ES_WIDGETICON VARCHAR2(64), 
	ES_WIDGETTEXT VARCHAR2(64), 
	ES_WIDGETENABLED NUMBER(2,0), 
	ES_WIDGETPATH VARCHAR2(64), 
	ADMIN_WIDGET NUMBER(2,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_DELEGATION
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_DELEGATION 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_MANDATORID VARCHAR2(20), 
	ES_DELEGATORID VARCHAR2(20), 
	ES_COMMENT VARCHAR2(1000), 
	ES_EXPIREDATE TIMESTAMP (6), 
	ES_ALLOWED VARCHAR2(255)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_DOCSTAT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_DOCSTAT 
   (	ES_CREATIONDATE CHAR(8), 
	ES_CREATIONUSERID VARCHAR2(20), 
	ES_DOCTYPEID NUMBER(19,0), 
	ES_PATH VARCHAR2(4000), 
	ES_COUNT NUMBER(19,0), 
	ES_SIZE NUMBER(19,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_ECLASS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_ECLASS 
   (	ECLASSID CHAR(16), 
	DESCR VARCHAR2(64), 
	INTERNALCONTAINER NUMBER(*,0), 
	EXTERNALCONTAINER NUMBER(*,0), 
	DYNAMICCONTAINER NUMBER(*,0), 
	PARENTID CHAR(16)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_ECLASSATTRIBUTE
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_ECLASSATTRIBUTE 
   (	ECLASSID CHAR(16), 
	ATTRNAME VARCHAR2(64), 
	ATTRVALUE VARCHAR2(255)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_GENERIC
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_GENERIC 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_TYPE VARCHAR2(255), 
	ES_SUBTYPE VARCHAR2(255), 
	ES_QUALIFIER NUMBER(19,0), 
	ES_STRING1 VARCHAR2(4000), 
	ES_STRING2 VARCHAR2(4000), 
	ES_STRING3 VARCHAR2(4000), 
	ES_INTEGER1 NUMBER(19,0), 
	ES_INTEGER2 NUMBER(19,0), 
	ES_INTEGER3 NUMBER(19,0), 
	ES_DOUBLE1 FLOAT(126), 
	ES_DOUBLE2 FLOAT(126), 
	ES_DATE1 TIMESTAMP (6), 
	ES_DATE2 TIMESTAMP (6)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_HISTORY
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_HISTORY 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_DOCID VARCHAR2(20), 
	ES_DOCTYPEID VARCHAR2(20), 
	ES_FOLDERID VARCHAR2(20), 
	ES_PATH VARCHAR2(4000), 
	ES_FILENAME VARCHAR2(255), 
	ES_USERID VARCHAR2(256), 
	ES_USERNAME VARCHAR2(255), 
	ES_DATE TIMESTAMP (6), 
	ES_EVENT VARCHAR2(255), 
	ES_COMMENT VARCHAR2(4000), 
	ES_VERSION VARCHAR2(10), 
	ES_TITLE VARCHAR2(520), 
	ES_FOLDERPATH VARCHAR2(4000), 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256), 
	S6 VARCHAR2(256), 
	S7 VARCHAR2(256), 
	S8 VARCHAR2(256), 
	S9 VARCHAR2(256), 
	S10 VARCHAR2(256), 
	L1 NUMBER, 
	L2 NUMBER, 
	L3 NUMBER, 
	L4 NUMBER, 
	L5 NUMBER, 
	SERIALIZABLE BLOB, 
	ES_IP VARCHAR2(40),
	ES_HOSTNAME VARCHAR2(200), 
	ES_USERAGENT VARCHAR2(128), 
	ES_MAC VARCHAR2(20), 
	ES_SERVERIP VARCHAR2(40), 
	ES_SERVERPORT NUMBER(5,0), 
	ES_CLIENTVERSION VARCHAR2(20)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_KEYWORD
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_KEYWORD 
   (	ELEMENTID CHAR(16), 
	ECLASSID CHAR(16), 
	TYPE NUMBER(19,0), 
	DESCR VARCHAR2(1000)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_LISTITEMS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_LISTITEMS 
   (	ID VARCHAR2(36), 
	NAME VARCHAR2(256), 
	SEQ NUMBER(*,0), 
	VALUE VARCHAR2(4000)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_MENU
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_MENU 
   (	ES_ID VARCHAR2(20), 
	ES_TITLE VARCHAR2(255), 
	ES_PARENTID VARCHAR2(20), 
	ES_ORDER NUMBER DEFAULT 0, 
	ES_URL VARCHAR2(255), 
	ES_DEFAULT NUMBER DEFAULT 1, 
	ES_USE NUMBER DEFAULT 0
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_MENURIGHTS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_MENURIGHTS 
   (	ES_MENUID NUMBER(19,0), 
	ES_SECURITYREF NUMBER(19,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_MENU_UUID
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_MENU_UUID 
   (	ES_MENUID VARCHAR2(20), 
	ES_USER_OR_GROUP_ID VARCHAR2(36), 
	ES_USER_OR_GROUP_TYPE VARCHAR2(36)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_RECIPIENT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_RECIPIENT 
   (	ES_MESSAGEID NUMBER(19,0), 
	ES_NAME VARCHAR2(255), 
	ES_ADDRESS VARCHAR2(255), 
	ES_MODE VARCHAR2(255), 
	ES_TYPE NUMBER(*,0), 
	ES_READ NUMBER(*,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_REWRITE
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_REWRITE 
   (	ES_ID NUMBER(19,0), 
	ES_DELETED NUMBER(*,0), 
	ES_AUTHORID VARCHAR2(20), 
	ES_COMMAND NUMBER(*,0), 
	ES_CREATEDATE TIMESTAMP (6), 
	ES_COMPLETEDATE TIMESTAMP (6), 
	ES_CURRENTREWRITER VARCHAR2(20), 
	ES_TARGETID VARCHAR2(20), 
	ES_STATUS NUMBER(*,0), 
	ES_EXPIREDATE TIMESTAMP (6), 
	ES_DATA VARCHAR2(1000), 
	ES_GROUPID VARCHAR2(20), 
	ES_CONTENTS VARCHAR2(4000), 
	ES_LINKID NUMBER(19,0), 
	ES_SECURITYTYPE NUMBER(*,0), 
	ES_SUBJECT VARCHAR2(1000), 
	ES_STARTDATE TIMESTAMP (6), 
	ES_ENDDATE TIMESTAMP (6)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_REWRITECC
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_REWRITECC 
   (	ES_REWRITEID NUMBER(19,0), 
	ES_REWRITERCCID VARCHAR2(20)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_REWRITEDOC
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_REWRITEDOC 
   (	REWRITEID NUMBER(19,0), 
	ELEMENTID CHAR(16), 
	VERSION VARCHAR2(20)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_REWRITEPROCESS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_REWRITEPROCESS 
   (	ES_REWRITEID NUMBER(19,0), 
	ES_REWRITERID VARCHAR2(20), 
	ES_COMMENT VARCHAR2(4000), 
	ES_COMPLETEDATE TIMESTAMP (6), 
	ES_POSITION NUMBER(*,0), 
	ES_TYPE NUMBER DEFAULT 0
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SEARCHES
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SEARCHES 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_USERID VARCHAR2(20), 
	ES_NAME VARCHAR2(1000), 
	ES_DESCRIPTION VARCHAR2(1000), 
	ES_ELEMENTID VARCHAR2(16)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SECUREACCESS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SECUREACCESS 
   (	SECURECLASSID CHAR(16), 
	ROLEID CHAR(16), 
	PRIVILEDGE NUMBER(*,0), 
	STARTDATE DATE, 
	ENDDATE DATE
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SECUREACCESSEXT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SECUREACCESSEXT 
   (	AUTHMNGRID CHAR(16), 
	SECURECLASSID CHAR(16), 
	ROLEID CHAR(32), 
	PRIVILEDGE NUMBER(*,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SECURECLASS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SECURECLASS 
   (	SECURECLASSID CHAR(16), 
	DESCR VARCHAR2(64), 
	SECURETYPE NUMBER(*,0), 
	ADMINSCLASS CHAR(16)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SHARE
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SHARE 
   (	ES_ID NUMBER(38,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_TICKETID VARCHAR2(255), 
	ES_USERID VARCHAR2(64), 
	ELEMENTID CHAR(16), 
	ES_CREATION TIMESTAMP (6), 
	ES_EXPIRED TIMESTAMP (6), 
	ES_COUNT NUMBER(*,0), 
	ES_VERSION VARCHAR2(20),
	ANONYMOUS NUMBER(19,0) DEFAULT 0
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SHAREACCESS
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SHAREACCESS 
   (	SHAREID NUMBER(38,0), 
	ROLEID VARCHAR2(64), 
	PRIVILEGE VARCHAR2(20)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_STAT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_STAT 
   (	ES_REGDATE CHAR(8), 
	ES_EVENT VARCHAR2(255), 
	ES_DOCTYPEID VARCHAR2(20), 
	ES_USERID VARCHAR2(20), 
	ES_FOLDER VARCHAR2(4000), 
	ES_COUNT NUMBER(19,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_SYSMESSAGE
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_SYSMESSAGE 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_AUTHOR VARCHAR2(255), 
	ES_MESSAGETEXT VARCHAR2(2000), 
	ES_SUBJECT VARCHAR2(255), 
	ES_SENTDATE TIMESTAMP (6), 
	ES_LASTNOTIFIED TIMESTAMP (6), 
	ES_STATUS NUMBER(*,0), 
	ES_TRIALS NUMBER(*,0), 
	ES_TYPE NUMBER(*,0), 
	ES_CATEGORY VARCHAR2(40), 
	ES_PARENTID NUMBER(19,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_TEMPLATE
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_TEMPLATE 
   (	ES_ID NUMBER(19,0), 
	ES_LASTMODIFIED TIMESTAMP (6), 
	ES_DELETED NUMBER(*,0), 
	ES_NAME VARCHAR2(255), 
	ES_DESCRIPTION VARCHAR2(1000), 
	ES_READONLY NUMBER(*,0), 
	ES_DOCID NUMBER(19,0), 
	ES_RULE VARCHAR2(255)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_TEMPLATE_EXT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_TEMPLATE_EXT 
   (	ES_TEMPLATEID NUMBER(19,0), 
	ES_NAME VARCHAR2(255), 
	ES_LABEL VARCHAR2(255), 
	ES_MANDATORY NUMBER(*,0), 
	ES_TYPE NUMBER(*,0), 
	ES_EDITOR NUMBER(*,0), 
	ES_POSITION NUMBER(*,0), 
	ES_STRINGVALUE VARCHAR2(4000), 
	ES_INTVALUE NUMBER(19,0), 
	ES_DOUBLEVALUE FLOAT(126), 
	ES_DATEVALUE TIMESTAMP (6), 
	ES_DESCRIPTION VARCHAR2(1000), 
	ES_PRIORITY NUMBER(*,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_VERSION
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_VERSION 
   (	ELEMENTID CHAR(16), 
	CURRENTVERSION VARCHAR2(64), 
	CURRENTREVISION VARCHAR2(64), 
	STATUS NUMBER(*,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_VERSIONELEMENT
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_VERSIONELEMENT 
   (	ELEMENTID CHAR(16), 
	COMPELEMENT CHAR(16), 
	VERSION VARCHAR2(64), 
	REVISION VARCHAR2(64)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_VOLUME
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_VOLUME 
   (	VOLUMEID CHAR(16), 
	DESCR VARCHAR2(64), 
	MAXSPACE NUMBER(14,0), 
	SPACELEFT NUMBER(14,0), 
	RECOVERSPACE NUMBER(*,0), 
	STATUS NUMBER(*,0), 
	ADMINSCLASS CHAR(16), 
	PARAMETER VARCHAR2(64), 
	USABLESPACE NUMBER(14,0), 
	FILLORDER NUMBER, 
	STARTDATE DATE, 
	ENDDATE DATE
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_XREF
--------------------------------------------------------

  CREATE TABLE XEDRM5.ES_XREF 
   (	ELEMENTID CHAR(16), 
	ATTACHID CHAR(16), 
	DESCR VARCHAR2(64), 
	CONNECTION VARCHAR2(64), 
	CONTENT VARCHAR2(255), 
	CONTENTTYPE NUMBER(*,0), 
	ISREDACTION NUMBER(*,0), 
	USERSCLASS CHAR(16)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table HIBERNATE_UNIQUE_KEY
--------------------------------------------------------

  CREATE TABLE XEDRM5.HIBERNATE_UNIQUE_KEY 
   (	TABLENAME VARCHAR2(40), 
	NEXT_HI NUMBER(19,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table HT_ASYSELEMENT
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE XEDRM5.HT_ASYSELEMENT 
   (	ELEMENTID VARCHAR2(255 CHAR)
   ) ON COMMIT DELETE ROWS;
   
-- 20200910
--------------------------------------------------------
--  DDL for Table POL_CLIENT
--------------------------------------------------------

  CREATE TABLE XEDRM5.POL_CLIENT 
   (	PROD_NO CHAR(23), 
	PROD_VER VARCHAR2(16), 
	MAC_ADDR VARCHAR2(20), 
	IP_ADDR VARCHAR2(40), 
	HOSTNAME VARCHAR2(64), 
	USER_ID VARCHAR2(256), 
	POLICY_ID VARCHAR2(20), 
	POLICY_YMDTIME CHAR(14), 
	POLICY_LEVEL NUMBER(2,0), 
	PATCH_NO VARCHAR2(20), 
	LAST_ACCESS_DT DATE, 
	ONOFF_YN CHAR(1), 
	WORKFLOW_CHG_YN CHAR(1), 
	POLICY_CHG_YN CHAR(1), 
	PATCH_CHG_YN CHAR(1),
	REG_DT DATE, 
	DEL_DT DATE,
	PATCH_DELAY_DT DATE,
	RELAY_DT DATE, 
	NOTICE_YN CHAR(1),
	RELAY_PROD_NO CHAR(23),
	PROD_STATE NUMBER(1,0),
	SMARTWORK_CHG_YN CHAR(1), 
	USER_NM VARCHAR2(128),
	GROUP_ID VARCHAR2(256),
	GROUP_NM VARCHAR2(128),
	PATCH_DELAY_MAX_CNT NUMBER(3,0),
	PATCH_DELAY_CNT NUMBER(3,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table POL_LIST
--------------------------------------------------------

  CREATE TABLE XEDRM5.POL_LIST 
   (	POLICY_ID VARCHAR2(20), 
	POLICY_NM VARCHAR2(64), 
	DESCR VARCHAR2(256), 
	DEFAULT_POLICY_YN CHAR(1), 
	USE_YN CHAR(1), 
	POLICY_YMDTIME CHAR(14), 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE
   )TABLESPACE "XEDRM5_TABLESPACE";

-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_CODE
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_CODE 
   (	CD_ID VARCHAR2(32), 
	CD_KEY VARCHAR2(64), 
	CD_KO VARCHAR2(128), 
	CD_EN VARCHAR2(128), 
	P_CD_ID VARCHAR2(32), 
	CD_ORDER NUMBER(5,0), 
	USE_YN CHAR(1), 
	REG_ID VARCHAR2(256), 
	REG_DT DATE, 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256),
	CD_ZH VARCHAR2(128), 
	CD_JA VARCHAR2(128),
	S6 VARCHAR2(256),
	S7 VARCHAR2(256),
	S8 VARCHAR2(256),
	S9 VARCHAR2(256),
	S10 VARCHAR2(256)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_GROUP
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_GROUP 
   (	GROUP_ID VARCHAR2(256), 
	GROUP_NM VARCHAR2(128), 
	GROUP_ENM VARCHAR2(128), 
	GROUP_TYPE NUMBER(19,0), 
	GROUP_ORDER NUMBER(6,0), 
	PARENT_ID VARCHAR2(256), 
	SERIALIZABLE BLOB, 
	HR_EXCEPT_YN CHAR(1), 
	USE_YN CHAR(1), 
	REG_ID VARCHAR2(256), 
	REG_DT DATE, 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256), 
	S6 VARCHAR2(256), 
	S7 VARCHAR2(256), 
	S8 VARCHAR2(256), 
	S9 VARCHAR2(256), 
	S10 VARCHAR2(256), 
	L1 NUMBER(38,0), 
	L2 NUMBER(38,0), 
	L3 NUMBER(38,0), 
	L4 NUMBER(38,0), 
	L5 NUMBER(38,0)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_GROUP_MANAGER
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_GROUP_MANAGER 
   (	GROUP_ID VARCHAR2(256), 
	USER_ID VARCHAR2(256),
	type NUMBER(19,0) DEFAULT 0
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910   
--------------------------------------------------------
--  DDL for Table SYS_GROUP_MEMBER
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_GROUP_MEMBER 
   (	GROUP_ID VARCHAR2(256), 
	MEMBER_ID VARCHAR2(256), 
	MEMBER_TYPE NUMBER(38,0) DEFAULT 1, 
	ES_EXPIRED DATE
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_MENU
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_MENU 
   (	"MENU_ID" VARCHAR2(128 BYTE), 
	"P_MENU_ID" VARCHAR2(128 BYTE), 
	"MENU_ORDER" NUMBER(3,0), 
	"DESCR" VARCHAR2(256 BYTE), 
	"MENU_URL" VARCHAR2(512 BYTE), 
	"USE_YN" CHAR(1 BYTE), 
	"REG_ID" VARCHAR2(256 BYTE), 
	"REG_DT" DATE, 
	"CHG_ID" VARCHAR2(256 BYTE), 
	"CHG_DT" DATE, 
	"S1" VARCHAR2(256 BYTE), 
	"S2" VARCHAR2(256 BYTE), 
	"S3" VARCHAR2(256 BYTE), 
	"S4" VARCHAR2(256 BYTE), 
	"S5" VARCHAR2(256 BYTE), 
	"L1" NUMBER(38,0), 
	"L2" NUMBER(38,0), 
	"MENU_KO" VARCHAR2(256 BYTE), 
	"ICON_URL" VARCHAR2(512 BYTE), 
	"MENU_WIDTH" NUMBER(5,0), 
	"MENU_EN" VARCHAR2(256 BYTE), 
	"MENU_ZH" VARCHAR2(256 BYTE), 
	"MENU_JA" VARCHAR2(256 BYTE), 
	"ICON_TYPE" VARCHAR2(8 BYTE), 
	"ACCESS_LEVEL" NUMBER(3,0)
   )TABLESPACE "XEDRM5_TABLESPACE";

-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_PGM
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_PGM 
   (	PGM_ID VARCHAR2(128), 
	PGM_TYPE VARCHAR2(16), 
	RECORD_ADD_YN CHAR(1), 
	RECORD_DEL_YN CHAR(1), 
	RECORD_MODIFY_YN CHAR(1), 
	USE_YN CHAR(1), 
	RECORD_CLICK_FUNC VARCHAR2(128), 
	RECORD_DCLICK_FUNC VARCHAR2(128), 
	RECORD_CHG_FUNC VARCHAR2(128), 
	REG_ID VARCHAR2(256), 
	REG_DT DATE, 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256), 
	L1 NUMBER(38,0), 
	L2 NUMBER(38,0), 
	PGM_INIT_SEARCH_YN CHAR(1), 
	PGM_KO VARCHAR2(128), 
	SUB_PGM_ID VARCHAR2(1024), 
	PGM_EN VARCHAR2(128), 
	PGM_ZH VARCHAR2(128), 
	PGM_JA VARCHAR2(128), 
	PGM_TREE_CD VARCHAR2(16), 
	PGM_MAPPING_TYPE VARCHAR2(8), 
	URL_SELECT VARCHAR2(2048), 
	URL_SAVE VARCHAR2(2048), 
	POLICY_APPLY_YN CHAR(1), 
	REF_PGM_ID VARCHAR2(1024), 
	SERVICE_SELECT_FUNC VARCHAR2(256), 
	SERVICE_SAVE_FUNC VARCHAR2(256), 
	TRIGGER_SELECT_FUNC VARCHAR2(256), 
	TRIGGER_SAVE_FUNC VARCHAR2(256)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910: 컬럼 추가(LINK_COL), 컬럼 제거(SORT_TYPE, PINNED_TYPE, URL, FILTER_TYPE, FILTER_DEFAULT_DATA, FILTER_USE_YN, COMBO_DATA_ID)
--------------------------------------------------------
--  DDL for Table SYS_PGM_COLUMN
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_PGM_COLUMN 
   (	PGM_ID VARCHAR2(128), 
	COL_ID VARCHAR2(30), 
	COL_KO VARCHAR2(512), 
	COL_EN VARCHAR2(512), 
	COL_WIDTH NUMBER(5,0), 
	COL_ORDER NUMBER(3,0), 
	PK_YN CHAR(1), 
	REQUIRED_YN CHAR(1), 
	EDIT_YN CHAR(1), 
	HIDE_YN CHAR(1), 
	EDIT_TYPE VARCHAR2(16), 
	DATA_TYPE VARCHAR2(16), 
	MAPPING_TYPE VARCHAR2(16), 
	MAPPING_ID VARCHAR2(128), 
	MASK_ID VARCHAR2(128),  
	DEFAULT_DATA VARCHAR2(512), 
	CLICK_FUNC VARCHAR2(128), 
	DCLICK_FUNC VARCHAR2(128), 
	RCLICK_FUNC VARCHAR2(128), 
	CHG_FUNC VARCHAR2(128), 
	TOOLTIP VARCHAR2(1024), 
	USE_YN CHAR(1), 
	REG_ID VARCHAR2(256), 
	REG_DT DATE, 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256), 
	L1 NUMBER(38,0), 
	L2 NUMBER(38,0), 
	SUB_PGM_ID VARCHAR2(128), 
	COL_ZH VARCHAR2(512), 
	COL_JA VARCHAR2(512), 
	SEARCH_TYPE CHAR(1), 
	POLICY_APPLY_YN CHAR(1), 
	GROUP_ID VARCHAR2(30), 
	GROUP_DATA VARCHAR2(256),
	REF_ID VARCHAR2(256),
	DATA_LENGTH NUMBER(38,0),
	REF_TYPE VARCHAR2(16),
	REF_DATA VARCHAR2(256),
	LINK_COL VARCHAR2(1024)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_PGM_COLUMN_DATA
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_PGM_COLUMN_DATA 
   (	DATA_ID VARCHAR2(64), 
	DATA_VALUE VARCHAR2(256), 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	ROW_IDX NUMBER(38,0), 
	PGM_ID VARCHAR2(128), 
	COL_ID VARCHAR2(30)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table SYS_TREE_NODE
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_TREE_NODE 
   (	NODE_ID VARCHAR2(128),
   P_NODE_ID VARCHAR2(128),
   NODE_TYPE VARCHAR2(8),
   NODE_VAL VARCHAR2(128),
   DATA_TYPE VARCHAR2(4),
   CD_MAPPING_YN CHAR(1),
   TREE_TYPE VARCHAR2(8),
   CASCADE_TYPE VARCHAR2(16),
   GROUP_ID VARCHAR2(256),
   GROUP_DATA VARCHAR2(1024),
   GROUP_OBJECT VARCHAR2(1024)
   )TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table SYS_USER
--------------------------------------------------------

  CREATE TABLE XEDRM5.SYS_USER 
   (	USER_ID VARCHAR2(256), 
	USER_NM VARCHAR2(128), 
	EMAIL VARCHAR2(256), 
	USER_PRIORITY NUMBER(38,0), 
	LAST_PASSWD_CHG_DT DATE, 
	LOGIN_DT DATE, 
	LOGIN_IP VARCHAR2(32), 
	DASHBOARD_ID VARCHAR2(256), 
	LANGUAGE_CD VARCHAR2(256), 
	HOME_ID VARCHAR2(256), 
	ADDRESS VARCHAR2(256), 
	SERIALIZABLE BLOB, 
	PASSWD VARCHAR2(256), 
	ADMIN_PASSWD VARCHAR2(256), 
	POSITION_CD VARCHAR2(32), 
	HR_EXCEPT_YN CHAR(1), 
	USER_ENM VARCHAR2(128), 
	TEL_1 VARCHAR2(16), 
	TEL_2 VARCHAR2(16), 
	LOGIN_FAIL_CNT NUMBER(3,0), 
	REP_GROUP_ID VARCHAR2(256), 
	REG_ID VARCHAR2(256), 
	REG_DT DATE, 
	CHG_ID VARCHAR2(256), 
	CHG_DT DATE, 
	S1 VARCHAR2(256), 
	S2 VARCHAR2(256), 
	S3 VARCHAR2(256), 
	S4 VARCHAR2(256), 
	S5 VARCHAR2(256), 
	S6 VARCHAR2(256), 
	S7 VARCHAR2(256), 
	S8 VARCHAR2(256), 
	S9 VARCHAR2(256), 
	S10 VARCHAR2(256), 
	L1 NUMBER(38,0), 
	L2 NUMBER(38,0), 
	L3 NUMBER(38,0), 
	L4 NUMBER(38,0), 
	L5 NUMBER(38,0),
	MOBILE VARCHAR2(16),
	USE_YN CHAR(1),
	TENANT_ID VARCHAR2(256)
   )TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Table ES_USER_WIDGET
--------------------------------------------------------

   CREATE TABLE XEDRM5.ES_USER_WIDGET
   (   
   ES_WIDGETTEXT VARCHAR2(64 BYTE) NOT NULL ENABLE, 
   USER_ID VARCHAR2(256 BYTE) NOT NULL ENABLE, 
   ENABLED NUMBER(2,0) DEFAULT 1 NOT NULL ENABLE
   )TABLESPACE "XEDRM5_TABLESPACE" ;

-- 20200910
--------------------------------------------------------
--  DDL for Table AGT_DISABLE
--------------------------------------------------------
   
   CREATE TABLE XEDRM5.AGT_DISABLE
   (
   REQUEST_IDX           NUMBER(38,0),
   USER_ID               VARCHAR2(256),
   USER_NM               VARCHAR2(128),
   GROUP_ID              VARCHAR2(256),
   GROUP_NM              VARCHAR2(128),
   IP_ADDR               VARCHAR2(40),
   MAC_ADDR              VARCHAR2(20),
   PROD_NO               CHAR(23),
   REQUEST_DT            DATE,
   REQUEST_TYPE          VARCHAR2(16),
   APPROVAL_YN           CHAR(1),
   APPROVAL_LIMIT_YMDTIME  CHAR(14),
   RESPONSE_DT           DATE,
   CHG_ID                VARCHAR2(256),
   CHG_DT                DATE,
   REQUEST_CHECK_YN      CHAR(1),
   REQUEST_REASON        VARCHAR2(256)
   )TABLESPACE "XEDRM5_TABLESPACE" ;
   
-- 20200910
--------------------------------------------------------
--  DDL for Table PAT_LIST
--------------------------------------------------------

   CREATE TABLE XEDRM5.PAT_LIST
   (
   PATCH_NO              VARCHAR2(20),
   PATCH_TYPE            CHAR(1),
   DEPLOY_STATUS         CHAR(1),
   PATCH_YMDTIME         VARCHAR2(14),
   SHOW_TYPE             CHAR(1),
   HASH_CD               CHAR(32),
   DESCR                 VARCHAR2(1024),
   REG_ID                VARCHAR2(256),
   REG_DT                DATE,
   CHG_ID                VARCHAR2(256),
   CHG_DT                DATE,
   PROD_VER              VARCHAR2(20),
   REBOOT_TYPE           CHAR(1),
   PATCH_PATH            VARCHAR2(1024), 
   HASH_CHK_YN           CHAR(1),
   DELAY_MAX_CNT         NUMBER(3,0),
   SITE_VER              VARCHAR2(20)   
   )TABLESPACE "XEDRM5_TABLESPACE" ;
   
-- 20200910
--------------------------------------------------------
--  DDL for Table PAT_OBJECT
--------------------------------------------------------

   CREATE TABLE XEDRM5.PAT_OBJECT
   (
   OBJECT_IDX            NUMBER(38,0),
   OBJECT_TYPE           VARCHAR2(8),
   OBJECT_CD             VARCHAR2(256),
   DEPLOY_RANGE          VARCHAR2(8),
   OBJECT_NM             VARCHAR2(128),
   PATCH_NO              VARCHAR2(20) 
   )TABLESPACE "XEDRM5_TABLESPACE" ;

--------------------------------------------------------
--  DDL for Index ASYSCE_CCLASSID_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSCE_CCLASSID_ELEMENTID ON XEDRM5.ASYSCONTENTELEMENT (CONTENTCLASSID, ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSCE_CHECKSUM
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSCE_CHECKSUM ON XEDRM5.ASYSCONTENTELEMENT (CHECKSUM)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSCE_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSCE_ELEMENTID ON XEDRM5.ASYSCONTENTELEMENT (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSCE_FILEKEY
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSCE_FILEKEY ON XEDRM5.ASYSCONTENTELEMENT (FILEKEY)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSCE_VOLUMEID_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSCE_VOLUMEID_ELEMENTID ON XEDRM5.ASYSCONTENTELEMENT (VOLUMEID, ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSEA_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSEA_ELEMENTID ON XEDRM5.ASYSELEMENTATTR (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSEA_ELEMENTID_ATTR
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ASYSEA_ELEMENTID_ATTR ON XEDRM5.ASYSELEMENTATTR (ELEMENTID, ATTRNAME)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSEA_NAMEVALUE
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSEA_NAMEVALUE ON XEDRM5.ASYSELEMENTATTR (ATTRNAME, ATTRVALUE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSE_DESCR
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSE_DESCR ON XEDRM5.ASYSELEMENT (DESCR)TABLESPACE "XEDRM5_TABLESPACE";
  
--------------------------------------------------------
--  DDL for Index ASYSE_MODIFIER
--------------------------------------------------------

  CREATE INDEX XEDRM5.ASYSE_MODIFIER ON XEDRM5.ASYSELEMENT (MODIFIER)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ASYSE_PARENTID
-------------------------------------------------------- 

  CREATE INDEX XEDRM5.ASYSE_PARENTID ON XEDRM5.ASYSELEMENT (parentid)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_DOCSTAT_DATE
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_DOCSTAT_DATE ON XEDRM5.ES_DOCSTAT (ES_CREATIONDATE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_ECLASS
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_ECLASS ON XEDRM5.ES_ECLASS (ECLASSID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_HIST_DATE
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_HIST_DATE ON XEDRM5.ES_HISTORY (ES_DATE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_HIST_DOCID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_HIST_DOCID ON XEDRM5.ES_HISTORY (ES_DOCID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_HIST_EVENT
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_HIST_EVENT ON XEDRM5.ES_HISTORY (ES_EVENT)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_HIST_UID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_HIST_UID ON XEDRM5.ES_HISTORY (ES_USERID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_KEYWORD_DOCID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_KEYWORD_DOCID ON XEDRM5.ES_KEYWORD (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_KEYWORD_KEYWORD
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_KEYWORD_KEYWORD ON XEDRM5.ES_KEYWORD (ECLASSID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_LISTITEMS_KEY
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_LISTITEMS_KEY ON XEDRM5.ES_LISTITEMS (ID, NAME)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_ADMINMENU
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_ADMINMENU ON XEDRM5.ES_ADMINMENU (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_AUDIT
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_AUDIT ON XEDRM5.ES_AUDIT (ES_TYPE, ES_TARGETID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_BOOKMARK
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_BOOKMARK ON XEDRM5.ES_BOOKMARK (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_CODES
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_CODES ON XEDRM5.ES_CODES (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_DASHBOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_DASHBOARD ON XEDRM5.ES_DASHBOARD (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_DASHBOARDWIDGET
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_DASHBOARDWIDGET ON XEDRM5.ES_DASHBOARDWIDGET (ES_WIDGETTEXT)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_DELEGATION
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_DELEGATION ON XEDRM5.ES_DELEGATION (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_GENERIC
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_GENERIC ON XEDRM5.ES_GENERIC (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_HISTORY
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_HISTORY ON XEDRM5.ES_HISTORY (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_KEYWORD
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_KEYWORD ON XEDRM5.ES_KEYWORD (ELEMENTID, ECLASSID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_MENURIGHTS
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_MENURIGHTS ON XEDRM5.ES_MENURIGHTS (ES_MENUID, ES_SECURITYREF)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_RECIPIENT
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_RECIPIENT ON XEDRM5.ES_RECIPIENT (ES_MESSAGEID, ES_ADDRESS)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_REWRITE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_REWRITE ON XEDRM5.ES_REWRITE (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_REWRITEPROC
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_REWRITEPROC ON XEDRM5.ES_REWRITEPROCESS (ES_REWRITEID, ES_REWRITERID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_SEARCHES
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_SEARCHES ON XEDRM5.ES_SEARCHES (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_SHARE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_SHARE ON XEDRM5.ES_SHARE (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_SYSMESSAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_SYSMESSAGE ON XEDRM5.ES_SYSMESSAGE (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_TEMPLATE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_TEMPLATE ON XEDRM5.ES_TEMPLATE (ES_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_PK_TEMPLATEEXT
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_PK_TEMPLATEEXT ON XEDRM5.ES_TEMPLATE_EXT (ES_TEMPLATEID, ES_NAME)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_RECIPIENT_ADDRESS_READ
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_RECIPIENT_ADDRESS_READ ON XEDRM5.ES_RECIPIENT (ES_ADDRESS, ES_READ)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_REWRITE_CURRENT
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_REWRITE_CURRENT ON XEDRM5.ES_REWRITE (ES_CURRENTREWRITER)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_REWRITE_EXPIRE
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_REWRITE_EXPIRE ON XEDRM5.ES_REWRITE (ES_EXPIREDATE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_REWRITE_TARGET
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_REWRITE_TARGET ON XEDRM5.ES_REWRITE (ES_TARGETID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_SA_ROLEID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_SA_ROLEID ON XEDRM5.ES_SHAREACCESS (ROLEID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_SA_SHAREID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_SA_SHAREID ON XEDRM5.ES_SHAREACCESS (SHAREID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_SHARE_TICKETID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_SHARE_TICKETID ON XEDRM5.ES_SHARE (ES_TICKETID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_SHARE_USERID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_SHARE_USERID ON XEDRM5.ES_SHARE (ES_USERID, ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_STAT_DATE
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_STAT_DATE ON XEDRM5.ES_STAT (ES_REGDATE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_SYSMESSAGE_AUTHOR
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_SYSMESSAGE_AUTHOR ON XEDRM5.ES_SYSMESSAGE (ES_AUTHOR)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_UK_DELEGATION
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_UK_DELEGATION ON XEDRM5.ES_DELEGATION (ES_MANDATORID, ES_DELEGATORID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_UK_GENERIC
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_UK_GENERIC ON XEDRM5.ES_GENERIC (ES_SUBTYPE, ES_QUALIFIER)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_UK_TEMPLATE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_UK_TEMPLATE ON XEDRM5.ES_TEMPLATE (ES_NAME)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_VE_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_VE_ELEMENTID ON XEDRM5.ES_VERSIONELEMENT (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_XR_ELEMENTID
--------------------------------------------------------

  CREATE INDEX XEDRM5.ES_XR_ELEMENTID ON XEDRM5.ES_XREF (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index ES_XR_ELEMENTID_ATTACHID
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.ES_XR_ELEMENTID_ATTACHID ON XEDRM5.ES_XREF (ELEMENTID, ATTACHID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index PK_ASYSELEMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.PK_ASYSELEMENT ON XEDRM5.ASYSELEMENT (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index PK_ASYSVOLUME
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.PK_ASYSVOLUME ON XEDRM5.ASYSVOLUME (VOLUMEID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index PK_COMMENTID
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.PK_COMMENTID ON XEDRM5.ES_COMMENTS (COMMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index PK_ESSECURECLASS
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.PK_ESSECURECLASS ON XEDRM5.ES_SECURECLASS (SECURECLASSID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index PK_ES_VERSION
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.PK_ES_VERSION ON XEDRM5.ES_VERSION (ELEMENTID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XAK1_SYS_PGM_COLUMN_DATA
--------------------------------------------------------

  CREATE INDEX XEDRM5.XAK1_SYS_PGM_COLUMN_DATA ON XEDRM5.SYS_PGM_COLUMN_DATA (DATA_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_COM_WORKFLOW_ITEM
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_COM_WORKFLOW_ITEM ON XEDRM5.COM_WORKFLOW_ITEM (ITEM_IDX)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_COM_WORKFLOW_LIST
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_COM_WORKFLOW_LIST ON XEDRM5.COM_WORKFLOW_LIST (LIST_IDX)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_POL_CLIENT
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_POL_CLIENT ON XEDRM5.POL_CLIENT (PROD_NO)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_POL_LIST
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_POL_LIST ON XEDRM5.POL_LIST (POLICY_ID)TABLESPACE "XEDRM5_TABLESPACE";

--------------------------------------------------------
--  DDL for Index XPK_SYS_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_CODE ON XEDRM5.SYS_CODE (CD_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_GROUP
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_GROUP ON XEDRM5.SYS_GROUP (GROUP_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_GROUP_MANAGER
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_GROUP_MANAGER ON XEDRM5.SYS_GROUP_MANAGER (GROUP_ID, USER_ID, TYPE)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_GROUP_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_GROUP_MEMBER ON XEDRM5.SYS_GROUP_MEMBER (GROUP_ID, MEMBER_ID, MEMBER_TYPE) TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_MENU
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_MENU ON XEDRM5.SYS_MENU (MENU_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_PGM
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_PGM ON XEDRM5.SYS_PGM (PGM_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_PGM_COLUMN
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_PGM_COLUMN ON XEDRM5.SYS_PGM_COLUMN (PGM_ID, COL_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_PGM_COLUMN_DATA
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_PGM_COLUMN_DATA ON XEDRM5.SYS_PGM_COLUMN_DATA (PGM_ID, DATA_ID, ROW_IDX, COL_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_TREE_NODE
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_TREE_NODE ON XEDRM5.SYS_TREE_NODE (TREE_TYPE, NODE_ID)TABLESPACE "XEDRM5_TABLESPACE";
--------------------------------------------------------
--  DDL for Index XPK_SYS_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_SYS_USER ON XEDRM5.SYS_USER (USER_ID)TABLESPACE "XEDRM5_TABLESPACE";

--------------------------------------------------------
--  DDL for Index XPK_AGT_DISABLE
--------------------------------------------------------  

  CREATE UNIQUE INDEX XEDRM5.XPK_AGT_DISABLE ON XEDRM5.AGT_DISABLE (REQUEST_IDX)TABLESPACE "XEDRM5_TABLESPACE";

--------------------------------------------------------
--  DDL for Index XPK_PAT_LIST
--------------------------------------------------------

  CREATE UNIQUE INDEX XEDRM5.XPK_PAT_LIST ON XEDRM5.PAT_LIST (PATCH_NO)TABLESPACE "XEDRM5_TABLESPACE";
  
--------------------------------------------------------
--  DDL for Index XPK_PAT_OBJECT
--------------------------------------------------------
  
  CREATE UNIQUE INDEX XEDRM5.XPK_PAT_OBJECT ON XEDRM5.PAT_OBJECT (PATCH_NO, OBJECT_IDX)TABLESPACE "XEDRM5_TABLESPACE";

--------------------------------------------------------
--  Constraints for Table ASYSCONTENTELEMENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (VOLUMEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (FILEKEY NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (FILESIZE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (CREATEDATE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (LASTACCESS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSCONTENTELEMENT MODIFY (CONTENTTYPE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ASYSELEMENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ASYSELEMENT ADD CONSTRAINT PK_ASYSELEMENT PRIMARY KEY (ELEMENTID) ENABLE;
 
  ALTER TABLE XEDRM5.ASYSELEMENT MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSELEMENT MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSELEMENT MODIFY (USERSCLASS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSELEMENT MODIFY (ECLASSID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ASYSELEMENTATTR
--------------------------------------------------------

  ALTER TABLE XEDRM5.ASYSELEMENTATTR MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSELEMENTATTR MODIFY (ATTRNAME NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ASYSVOLUME
--------------------------------------------------------

  ALTER TABLE XEDRM5.ASYSVOLUME ADD CONSTRAINT PK_ASYSVOLUME PRIMARY KEY (VOLUMEID) ENABLE;
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (VOLUMEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (MAXSPACE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (SPACELEFT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (RECOVERSPACE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (STATUS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ASYSVOLUME MODIFY (ADMINSCLASS NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COM_WORKFLOW_ITEM
--------------------------------------------------------

  ALTER TABLE XEDRM5.COM_WORKFLOW_ITEM MODIFY (ITEM_IDX NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.COM_WORKFLOW_ITEM ADD CONSTRAINT XPK_COM_WORKFLOW_ITEM PRIMARY KEY (ITEM_IDX) ENABLE;
--------------------------------------------------------
--  Constraints for Table COM_WORKFLOW_LIST
--------------------------------------------------------

  ALTER TABLE XEDRM5.COM_WORKFLOW_LIST MODIFY (LIST_IDX NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.COM_WORKFLOW_LIST ADD CONSTRAINT XPK_COM_WORKFLOW_LIST PRIMARY KEY (LIST_IDX) ENABLE;
--------------------------------------------------------
--  Constraints for Table ES_ADHOCAUTH
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_ADHOCAUTH MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ADHOCAUTH MODIFY (USERROLE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ADHOCAUTH MODIFY (PRIVILEGETYPE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_ADMINMENU
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_ADMINMENU ADD CONSTRAINT ES_PK_ADMINMENU PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_ADMINMENU MODIFY (ES_PARENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ADMINMENU MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ADMINMENU MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ADMINMENU MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_AUDIT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_AUDIT ADD CONSTRAINT ES_PK_AUDIT PRIMARY KEY (ES_TYPE, ES_TARGETID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_AUDIT MODIFY (ES_HASTABLE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_AUDIT MODIFY (ES_HASFILE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_AUDIT MODIFY (ES_TARGETID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_AUDIT MODIFY (ES_TYPE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_BOOKMARK
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_BOOKMARK ADD CONSTRAINT ES_PK_BOOKMARK PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_POSITION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_TITLE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_TARGETID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_BOOKMARK MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_CODES
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_CODES ADD CONSTRAINT ES_PK_CODES PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_VALUE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_NAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_CODE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_CODES MODIFY (ES_DELETED NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_COMMENTS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_COMMENTS ADD CONSTRAINT PK_COMMENTID PRIMARY KEY (COMMENTID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_COMMENTS MODIFY (ES_COMMENT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_COMMENTS MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_COMMENTS MODIFY (COMMENTID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_DASHBOARD
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_DASHBOARD ADD CONSTRAINT ES_PK_DASHBOARD PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_DASHBOARD MODIFY (ES_DASHNAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARD MODIFY (ES_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARD MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARD MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARD MODIFY (ES_TARGETID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_DASHBOARDWIDGET
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET ADD CONSTRAINT ES_PK_DASHBOARDWIDGET PRIMARY KEY (ES_WIDGETTEXT) ENABLE;
 
  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET MODIFY (ADMIN_WIDGET NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET MODIFY (ES_WIDGETENABLED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET MODIFY (ES_WIDGETICON NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET MODIFY (ES_WIDGETNAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DASHBOARDWIDGET MODIFY (ES_WIDGETTYPE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_DOCSTAT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_DOCSTAT MODIFY (ES_SIZE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DOCSTAT MODIFY (ES_COUNT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DOCSTAT MODIFY (ES_PATH NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DOCSTAT MODIFY (ES_CREATIONUSERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_DOCSTAT MODIFY (ES_CREATIONDATE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_ECLASS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_ECLASS ADD CONSTRAINT ES_ECLASS PRIMARY KEY (ECLASSID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_ECLASS MODIFY (ECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASS MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASS MODIFY (INTERNALCONTAINER NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASS MODIFY (EXTERNALCONTAINER NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASS MODIFY (DYNAMICCONTAINER NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_ECLASSATTRIBUTE
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_ECLASSATTRIBUTE MODIFY (ECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASSATTRIBUTE MODIFY (ATTRNAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_ECLASSATTRIBUTE MODIFY (ATTRVALUE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_GENERIC
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_GENERIC ADD CONSTRAINT ES_PK_GENERIC PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_GENERIC MODIFY (ES_SUBTYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_GENERIC MODIFY (ES_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_GENERIC MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_GENERIC MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_GENERIC MODIFY (ES_ID NOT NULL ENABLE);
 
--------------------------------------------------------
--  Constraints for Table ES_HISTORY
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_HISTORY ADD CONSTRAINT ES_PK_HISTORY PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_HISTORY MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_HISTORY MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_HISTORY MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_HISTORY MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_KEYWORD
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_KEYWORD ADD CONSTRAINT ES_PK_KEYWORD PRIMARY KEY (ELEMENTID, ECLASSID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_KEYWORD MODIFY (TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_KEYWORD MODIFY (ECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_KEYWORD MODIFY (ELEMENTID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_MENU
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_MENU MODIFY (ES_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_MENU MODIFY (ES_PARENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_MENU MODIFY (ES_ORDER NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_MENU MODIFY (ES_DEFAULT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_MENU MODIFY (ES_USE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_RECIPIENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_READ NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_MODE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_ADDRESS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_NAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_RECIPIENT MODIFY (ES_MESSAGEID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_REWRITE
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_REWRITE ADD CONSTRAINT ES_PK_REWRITE PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_STATUS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_CURRENTREWRITER NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_COMMAND NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_AUTHORID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITE MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_REWRITECC
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_REWRITECC MODIFY (ES_REWRITERCCID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITECC MODIFY (ES_REWRITEID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_REWRITEDOC
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_REWRITEDOC MODIFY (REWRITEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITEDOC MODIFY (ELEMENTID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_REWRITEPROCESS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_REWRITEPROCESS ADD CONSTRAINT ES_PK_REWRITEPROC PRIMARY KEY (ES_REWRITEID, ES_REWRITERID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_REWRITEPROCESS MODIFY (ES_POSITION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITEPROCESS MODIFY (ES_REWRITERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_REWRITEPROCESS MODIFY (ES_REWRITEID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SEARCHES
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SEARCHES ADD CONSTRAINT ES_PK_SEARCHES PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_NAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SEARCHES MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SECUREACCESS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SECUREACCESS MODIFY (SECURECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECUREACCESS MODIFY (ROLEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECUREACCESS MODIFY (PRIVILEDGE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SECUREACCESSEXT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SECUREACCESSEXT MODIFY (AUTHMNGRID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECUREACCESSEXT MODIFY (SECURECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECUREACCESSEXT MODIFY (ROLEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECUREACCESSEXT MODIFY (PRIVILEDGE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SECURECLASS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SECURECLASS ADD CONSTRAINT PK_ESSECURECLASS PRIMARY KEY (SECURECLASSID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_SECURECLASS MODIFY (SECURECLASSID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECURECLASS MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SECURECLASS MODIFY (SECURETYPE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SHARE
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SHARE ADD CONSTRAINT ES_PK_SHARE PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ES_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHARE MODIFY (ES_CREATION NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SHAREACCESS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SHAREACCESS MODIFY (SHAREID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHAREACCESS MODIFY (ROLEID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SHAREACCESS MODIFY (PRIVILEGE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_STAT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_STAT MODIFY (ES_COUNT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_STAT MODIFY (ES_USERID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_STAT MODIFY (ES_EVENT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_STAT MODIFY (ES_REGDATE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_SYSMESSAGE
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_SYSMESSAGE ADD CONSTRAINT ES_PK_SYSMESSAGE PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_STATUS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_SENTDATE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_SYSMESSAGE MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_TEMPLATE
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_TEMPLATE ADD CONSTRAINT ES_PK_TEMPLATE PRIMARY KEY (ES_ID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_TEMPLATE MODIFY (ES_NAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE MODIFY (ES_DELETED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE MODIFY (ES_LASTMODIFIED NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE MODIFY (ES_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_TEMPLATE_EXT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT ADD CONSTRAINT ES_PK_TEMPLATEEXT PRIMARY KEY (ES_TEMPLATEID, ES_NAME) ENABLE;
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_POSITION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_EDITOR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_MANDATORY NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_LABEL NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_NAME NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_TEMPLATE_EXT MODIFY (ES_TEMPLATEID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_VERSION
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_VERSION ADD CONSTRAINT PK_ES_VERSION PRIMARY KEY (ELEMENTID) ENABLE;
 
  ALTER TABLE XEDRM5.ES_VERSION MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VERSION MODIFY (CURRENTVERSION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VERSION MODIFY (CURRENTREVISION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VERSION MODIFY (STATUS NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_VERSIONELEMENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_VERSIONELEMENT MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VERSIONELEMENT MODIFY (VERSION NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VERSIONELEMENT MODIFY (REVISION NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_VOLUME
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (ADMINSCLASS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (STATUS NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (RECOVERSPACE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (SPACELEFT NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (MAXSPACE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_VOLUME MODIFY (VOLUMEID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ES_XREF
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_XREF MODIFY (ELEMENTID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_XREF MODIFY (ATTACHID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_XREF MODIFY (DESCR NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_XREF MODIFY (CONTENTTYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.ES_XREF MODIFY (ISREDACTION NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HIBERNATE_UNIQUE_KEY
--------------------------------------------------------

  ALTER TABLE XEDRM5.HIBERNATE_UNIQUE_KEY MODIFY (NEXT_HI NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.HIBERNATE_UNIQUE_KEY MODIFY (TABLENAME NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HT_ASYSELEMENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.HT_ASYSELEMENT MODIFY (ELEMENTID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POL_CLIENT
--------------------------------------------------------

  ALTER TABLE XEDRM5.POL_CLIENT MODIFY (PROD_NO NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.POL_CLIENT ADD CONSTRAINT XPK_POL_CLIENT PRIMARY KEY (PROD_NO) ENABLE;
--------------------------------------------------------
--  Constraints for Table POL_LIST
--------------------------------------------------------

  ALTER TABLE XEDRM5.POL_LIST MODIFY (POLICY_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.POL_LIST ADD CONSTRAINT XPK_POL_LIST PRIMARY KEY (POLICY_ID) ENABLE;

--------------------------------------------------------
--  Constraints for Table SYS_CODE
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_CODE MODIFY (CD_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_CODE ADD CONSTRAINT XPK_SYS_CODE PRIMARY KEY (CD_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_GROUP
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_GROUP MODIFY (GROUP_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP ADD CONSTRAINT XPK_SYS_GROUP PRIMARY KEY (GROUP_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_GROUP_MANAGER
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_GROUP_MANAGER MODIFY (GROUP_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP_MANAGER MODIFY (USER_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP_MANAGER ADD CONSTRAINT XPK_SYS_GROUP_MANAGER PRIMARY KEY (GROUP_ID, USER_ID, TYPE) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_GROUP_MEMBER
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_GROUP_MEMBER MODIFY (GROUP_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP_MEMBER MODIFY (MEMBER_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP_MEMBER MODIFY (MEMBER_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_GROUP_MEMBER ADD CONSTRAINT XPK_SYS_GROUP_MEMBER PRIMARY KEY (GROUP_ID, MEMBER_ID, MEMBER_TYPE) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_MENU
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_MENU MODIFY (MENU_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_MENU ADD CONSTRAINT XPK_SYS_MENU PRIMARY KEY (MENU_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_PGM
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_PGM MODIFY (PGM_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM ADD CONSTRAINT XPK_SYS_PGM PRIMARY KEY (PGM_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_PGM_COLUMN
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_PGM_COLUMN MODIFY (COL_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN MODIFY (PGM_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN ADD CONSTRAINT XPK_SYS_PGM_COLUMN PRIMARY KEY (PGM_ID, COL_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_PGM_COLUMN_DATA
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA MODIFY (COL_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA MODIFY (PGM_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA MODIFY (ROW_IDX NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA MODIFY (DATA_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA ADD CONSTRAINT XPK_SYS_PGM_COLUMN_DATA PRIMARY KEY (PGM_ID, DATA_ID, ROW_IDX, COL_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_TREE_NODE
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_TREE_NODE MODIFY (TREE_TYPE NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_TREE_NODE MODIFY (NODE_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_TREE_NODE ADD CONSTRAINT XPK_SYS_TREE_NODE PRIMARY KEY (TREE_TYPE, NODE_ID) ENABLE;
--------------------------------------------------------
--  Constraints for Table SYS_USER
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_USER MODIFY (USER_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_USER MODIFY (USER_NM NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_USER MODIFY (USER_PRIORITY NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_USER MODIFY (REP_GROUP_ID NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.SYS_USER ADD CONSTRAINT XPK_SYS_USER PRIMARY KEY (USER_ID) ENABLE;

--------------------------------------------------------
--  Constraints for Table AGT_DISABLE
--------------------------------------------------------

  ALTER TABLE XEDRM5.AGT_DISABLE MODIFY (REQUEST_IDX NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5.AGT_DISABLE ADD CONSTRAINT XPK_AGT_DISABLE PRIMARY KEY (REQUEST_IDX) ENABLE;

--------------------------------------------------------
--  Constraints for Table PAT_LIST
--------------------------------------------------------

  ALTER TABLE XEDRM5.PAT_LIST MODIFY (PATCH_NO NOT NULL ENABLE);  
  
  ALTER TABLE XEDRM5.PAT_LIST ADD CONSTRAINT XPK_PAT_LIST PRIMARY KEY (PATCH_NO) ENABLE;
  
  
--------------------------------------------------------
--  Constraints for Table PAT_OBJECT
--------------------------------------------------------

  ALTER TABLE XEDRM5.PAT_OBJECT MODIFY (PATCH_NO NOT NULL ENABLE);
  
  ALTER TABLE XEDRM5.PAT_OBJECT MODIFY (OBJECT_IDX NOT NULL ENABLE);
  
  ALTER TABLE XEDRM5.PAT_OBJECT ADD CONSTRAINT XPK_PAT_OBJECT PRIMARY KEY (PATCH_NO, OBJECT_IDX) ENABLE;
  
--------------------------------------------------------
--  Ref Constraints for Table COM_WORKFLOW_LIST
--------------------------------------------------------

  ALTER TABLE XEDRM5.COM_WORKFLOW_LIST ADD CONSTRAINT R_36 FOREIGN KEY (ITEM_IDX)
	  REFERENCES XEDRM5.COM_WORKFLOW_ITEM (ITEM_IDX) ON DELETE SET NULL ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table ES_COMMENTS
--------------------------------------------------------

  ALTER TABLE XEDRM5.ES_COMMENTS ADD CONSTRAINT FK_ELEMENTID FOREIGN KEY (ELEMENTID)
	  REFERENCES XEDRM5.ASYSELEMENT (ELEMENTID) ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SYS_PGM
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_PGM ADD CONSTRAINT R_11 FOREIGN KEY (PGM_ID)
	  REFERENCES XEDRM5.SYS_MENU (MENU_ID) ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SYS_PGM_COLUMN
--------------------------------------------------------

  ALTER TABLE XEDRM5.SYS_PGM_COLUMN ADD CONSTRAINT R_68 FOREIGN KEY (PGM_ID)
	  REFERENCES XEDRM5.SYS_PGM (PGM_ID) ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SYS_PGM_COLUMN_DATA
--  20201022: 테스트 데이터 충돌로 인한 제약사항 비활성화
--------------------------------------------------------

--  ALTER TABLE XEDRM5.SYS_PGM_COLUMN_DATA ADD CONSTRAINT R_79 FOREIGN KEY (PGM_ID, COL_ID)
--	  REFERENCES XEDRM5.SYS_PGM_COLUMN (PGM_ID, COL_ID) ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table ES_USER_WIDGET
--------------------------------------------------------	

  ALTER TABLE XEDRM5.ES_USER_WIDGET ADD CONSTRAINT "ES_USER_WIDGET_PK" PRIMARY KEY ("ES_WIDGETTEXT", "USER_ID") ENABLE;  
  
  ALTER TABLE XEDRM5.ES_USER_WIDGET ADD CONSTRAINT "ES_USER_WIDGET_FK1" FOREIGN KEY ("ES_WIDGETTEXT")
     REFERENCES XEDRM5."ES_DASHBOARDWIDGET" ("ES_WIDGETTEXT") ON DELETE CASCADE ENABLE;  
     
  ALTER TABLE XEDRM5.ES_USER_WIDGET ADD CONSTRAINT "ES_USER_WIDGET_FK2" FOREIGN KEY ("USER_ID")
     REFERENCES XEDRM5."SYS_USER" ("USER_ID") ON DELETE CASCADE ENABLE;  

--------------------------------------------------------
--  Ref Constraints for Table PAT_OBJECT
--------------------------------------------------------

  ALTER TABLE XEDRM5.PAT_OBJECT ADD CONSTRAINT R_81 FOREIGN KEY (PATCH_NO)
	  REFERENCES XEDRM5.PAT_LIST (PATCH_NO) ENABLE;
	  
-- 20200910
--------------------------------------------------------
--  Create User Attribute Table
--------------------------------------------------------
  
CREATE TABLE XEDRM5.sys_user_attr
(
	USER_ID VARCHAR2(256) NOT NULL ,
	AttrName varchar2(64) NOT NULL ,
	AttrValue varchar2(255) ,
	SERIALIZABLEVALUE BLOB, 
	CONSTRAINT FK_sysUserAttr_UserId FOREIGN KEY (USER_ID)
	REFERENCES XEDRM5.sys_user (USER_ID) ON DELETE CASCADE
) TABLESPACE "XEDRM5_TABLESPACE";

update XEDRM5.sys_user_attr set	user_id = trim(user_id);

CREATE INDEX XEDRM5.SYSUA_USERID ON XEDRM5.sys_user_attr (USER_ID) TABLESPACE "XEDRM5_TABLESPACE" ;

--------------------------------------------------------
--  파일이 생성됨 - 목요일-11월-14-2019   
--------------------------------------------------------
--------------------------------------------------------
--  테이블 최신화
--------------------------------------------------------

-- 20200910
--------------------------------------------------------
--  DDL for Table POL_SCHEDULE
--------------------------------------------------------

  CREATE TABLE XEDRM5."POL_SCHEDULE" 
   (	"SCHED_IDX" NUMBER(38,0), 
	"SCHED_NM" VARCHAR2(128 BYTE), 
	"SCHED_TYPE" CHAR(4 BYTE), 
	"SCHED_STATE" CHAR(2 BYTE), 
	"ORIGIN_POL_ID" VARCHAR2(20 BYTE), 
	"APPLY_POL_ID" VARCHAR2(20 BYTE), 
	"RETURN_POL_ID" VARCHAR2(20 BYTE), 
	"USER_ID" VARCHAR2(256 BYTE), 
	"GROUP_ID" VARCHAR2(256 BYTE), 
	"POSITION_CD" VARCHAR2(32 BYTE), 
	"POL_GROUP_ID" VARCHAR2(128 BYTE), 
	"IP_ADDR" VARCHAR2(40 BYTE), 
	"START_YMDTIME" CHAR(14 BYTE), 
	"END_YMDTIME" CHAR(14 BYTE), 
	"CHG_ID" VARCHAR2(256 BYTE), 
	"CHG_DT" DATE, 
	"USE_YN" CHAR(1 BYTE)
   ) TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table POL_APPLY_CLIENT
--------------------------------------------------------

  CREATE TABLE XEDRM5."POL_APPLY_CLIENT" 
   (	"POLICY_ID" VARCHAR2(20 BYTE), 
	"CLIENT_IDX" NUMBER(38,0), 
	"IP_ADDR" VARCHAR2(40 BYTE), 
	"MAC_ADDR" VARCHAR2(20 BYTE), 
	"DESCR" VARCHAR2(256 BYTE), 
	"CHG_ID" VARCHAR2(256 BYTE), 
	"CHG_DT" DATE
   ) TABLESPACE "XEDRM5_TABLESPACE";
   
-- 20200910
--------------------------------------------------------
--  DDL for Table POL_APPLY_USER
--------------------------------------------------------

  CREATE TABLE XEDRM5."POL_APPLY_USER" 
   (	"POLICY_ID" VARCHAR2(20 BYTE), 
	"USER_ID" VARCHAR2(256 BYTE), 
	"USER_CL" VARCHAR2(8 BYTE), 
	"SUB_DATA_CHECK_YN" CHAR(1 BYTE), 
	"CHG_ID" VARCHAR2(256 BYTE), 
	"CHG_DT" DATE, 
	"DESCR" VARCHAR2(256 BYTE), 
	"USER_NM" VARCHAR2(256 BYTE)
   ) TABLESPACE "XEDRM5_TABLESPACE";


--------------------------------------------------------
--  Constraints for Table POL_SCHEDULE
--------------------------------------------------------

  ALTER TABLE XEDRM5."POL_SCHEDULE" MODIFY ("SCHED_IDX" NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5."POL_SCHEDULE" ADD CONSTRAINT "XPK_POL_SCHEDULE" PRIMARY KEY ("SCHED_IDX") ENABLE;
--------------------------------------------------------
--  Constraints for Table POL_APPLY_CLIENT
--------------------------------------------------------

  ALTER TABLE XEDRM5."POL_APPLY_CLIENT" MODIFY ("CLIENT_IDX" NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5."POL_APPLY_CLIENT" ADD CONSTRAINT "XPK_POL_APPLY_CLIENT" PRIMARY KEY ("CLIENT_IDX") ENABLE;
--------------------------------------------------------
--  Constraints for Table POL_APPLY_USER
--------------------------------------------------------

  ALTER TABLE XEDRM5."POL_APPLY_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5."POL_APPLY_USER" MODIFY ("USER_CL" NOT NULL ENABLE);
 
  ALTER TABLE XEDRM5."POL_APPLY_USER" ADD CONSTRAINT "XPK_POL_APPLY_USER" PRIMARY KEY ("USER_CL", "USER_ID") ENABLE;

--------------------------------------------------------
--  DDL for Index T1_IDX1 
--  ** SYSTEM 계정으로 실행해야 함. 
--------------------------------------------------------
  
  create index T1_IDX1 on XEDRM5."ASYSELEMENT"(DESCR) indextype is ctxsys.context parameters ('sync(on commit)');
  
  exec ctx_ddl.create_preference ( 'mystore', 'BASIC_STORAGE'); 
  exec ctx_ddl.set_attribute ( 'mystore', 'STAGE_ITAB', 'YES');
  

	