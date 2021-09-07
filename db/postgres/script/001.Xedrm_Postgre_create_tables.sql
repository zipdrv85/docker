\c xedrm5 xedrm5;
CREATE SEQUENCE ES_STICK MINVALUE 0 MAXVALUE 1295 START WITH 1 INCREMENT BY 1 CYCLE;
grant select on sequence ES_STICK to XEDRM5;
grant usage on sequence ES_STICK to XEDRM5; 
grant update on sequence ES_STICK to XEDRM5;

create sequence es_volume_history_stick increment by 1 no minvalue maxvalue 1295 start 1 cache 1 cycle;
grant select on sequence es_volume_history_stick to XEDRM5;
grant usage on sequence es_volume_history_stick to XEDRM5; 
grant update on sequence es_volume_history_stick to XEDRM5;

CREATE TABLE public.asyscontentelement (
    elementid character(16) NOT NULL,
    volumeid character(16) NOT NULL,
    filekey character varying(64) NOT NULL,
    filesize numeric(38,0) NOT NULL,
    createdate timestamp without time zone NOT NULL,
    lastaccess timestamp without time zone NOT NULL,
    contenttype numeric(38,0) NOT NULL,
    contentclassid character(16),
    generaldata character varying(64),
    checkhint numeric(38,0),
    writedate timestamp without time zone,
    retention numeric(38,0),
    checksum character varying(64)
);


ALTER TABLE public.asyscontentelement OWNER TO XEDRM5;

--
-- TOC entry 197 (class 1259 OID 16779)
-- Name: asyselement; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.asyselement (
    elementid character(16) NOT NULL,
    descr character varying(4000) NOT NULL,
    usersclass character(16) NOT NULL,
    eclassid character(16) NOT NULL,
    expiration timestamp without time zone,
    uuid character varying(36),
    creator character varying(255),
    created timestamp without time zone,
    modifier character varying(255),
    modified timestamp without time zone,
    accessed timestamp without time zone,
    transaction_id numeric(38,0),
    deleted numeric(19,0) DEFAULT 0,
    status numeric(19,0) DEFAULT 0,
    rating numeric(38,1) DEFAULT 0 NOT NULL,
    parentaclid character(16),
    path character varying(4000),
    folderpath character varying(4000),
    producer character varying(256),
    parentid character(16),
    filesize numeric(38,0),
    encryptfilesize numeric(38,0),
    deadline timestamp without time zone,
    ruleid character(16),
    commentsid character(16),
    ratingsid character(16),
    lockuserid character varying(256),
    enable numeric(38,0),
    groupid character varying(256),
    indexed numeric(38,0),
    version character varying(36),
    templateid numeric(18,0),
    description character varying(4000)
);


ALTER TABLE public.asyselement OWNER TO XEDRM5;

ALTER TABLE public.ASYSELEMENT ADD COLUMN ADMIN_ID character varying(256);
ALTER TABLE public.ASYSELEMENT ADD COLUMN PRIV_OWNER character varying(20);
ALTER TABLE public.ASYSELEMENT ADD COLUMN PRIV_GROUP character varying(20);
ALTER TABLE public.ASYSELEMENT ADD COLUMN PRIV_OTHER character varying(20);
ALTER TABLE public.ASYSELEMENT ADD COLUMN PRIV_ADMIN character varying(20);
ALTER TABLE public.ASYSELEMENT ADD rcupath character varying(64);

COMMENT ON COLUMN public.ASYSELEMENT.ADMIN_ID IS 'ADMIN 아이디';
COMMENT ON COLUMN public.ASYSELEMENT.PRIV_OWNER IS 'OWNER 권한(CREATOR)';
COMMENT ON COLUMN public.ASYSELEMENT.PRIV_GROUP IS 'GROUP 권한';
COMMENT ON COLUMN public.ASYSELEMENT.PRIV_OTHER IS 'OTHER 권한';
COMMENT ON COLUMN public.ASYSELEMENT.PRIV_ADMIN IS 'ADMIN 권한';

--
-- TOC entry 198 (class 1259 OID 16787)
-- Name: asyselementattr; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.asyselementattr (
    elementid character(16) NOT NULL,
    attrname character varying(64) NOT NULL,
    attrvalue character varying(4000),
    label character varying(255),
    mandatory character(1) DEFAULT '0'::bpchar,
    type numeric(19,0) DEFAULT 0,
    editor numeric(19,0) DEFAULT 0,
    position numeric(19,0) DEFAULT 0,
    serializablevalue bytea,
    doublevalue numeric(38,3)
);


ALTER TABLE public.asyselementattr OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 200 (class 1259 OID 16800)
-- Name: com_workflow_item; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.com_workflow_item (
    item_idx numeric(5,0) NOT NULL,
    item_nm character varying(64),
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    chk_type character varying(20),
    chk_content character varying(4000)
);


ALTER TABLE public.com_workflow_item OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 201 (class 1259 OID 16806)
-- Name: com_workflow_list; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.com_workflow_list (
    item_idx numeric(5,0),
    list_idx numeric(5,0) NOT NULL,
    workflow_cl character varying(32),
    list_order numeric(3,0),
    policy_id character varying(20),
    chg_id character varying(256),
    chg_dt timestamp without time zone
);


ALTER TABLE public.com_workflow_list OWNER TO XEDRM5;


-- TOC entry 203 (class 1259 OID 16812)
-- Name: es_adminmenu; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_adminmenu (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_title character varying(255),
    es_parentid numeric(19,0) NOT NULL,
    es_icon character varying(255),
    es_description character varying(4000),
    es_url character varying(1000),
    es_order numeric(38,0)
);


ALTER TABLE public.es_adminmenu OWNER TO XEDRM5;

--
-- TOC entry 204 (class 1259 OID 16818)
-- Name: es_audit; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_audit (
    es_type numeric(38,0) NOT NULL,
    es_targetid character varying(20) NOT NULL,
    es_parentid character varying(20),
    es_hasfile numeric(38,0) NOT NULL,
    es_hastable numeric(38,0) NOT NULL,
    es_events character varying(1000)
);


ALTER TABLE public.es_audit OWNER TO XEDRM5;

--
-- TOC entry 205 (class 1259 OID 16824)
-- Name: es_bookmark; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_bookmark (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_userid character varying(20) NOT NULL,
    es_targetid character varying(20) NOT NULL,
    es_type numeric(10,0) NOT NULL,
    es_title character varying(255) NOT NULL,
    es_description character varying(4000),
    es_position numeric(10,0) NOT NULL
);


ALTER TABLE public.es_bookmark OWNER TO XEDRM5;

--
-- TOC entry 206 (class 1259 OID 16830)
-- Name: es_codes; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_codes (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_code character varying(255) NOT NULL,
    es_name character varying(255) NOT NULL,
    es_value character varying(255) NOT NULL,
    es_description character varying(1000)
);


ALTER TABLE public.es_codes OWNER TO XEDRM5;

--
-- TOC entry 207 (class 1259 OID 16836)
-- Name: es_comments; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_comments (
    commentid numeric(19,0) NOT NULL,
    elementid character(16) NOT NULL,
    es_comment character varying(4000) NOT NULL,
    creatorid character varying(256),
    creator_nm character varying(128),
    created timestamp without time zone,
    deleted numeric(38,0),
    lastmodified timestamp without time zone,
    version character varying(36),
    ratevalue numeric(3,1) DEFAULT 0
);


ALTER TABLE public.es_comments OWNER TO XEDRM5;

--
-- TOC entry 208 (class 1259 OID 16842)
-- Name: es_dashboard; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_dashboard (
    es_id numeric(19,0) NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_userid character varying(20) NOT NULL,
    es_targetid character varying(20) NOT NULL,
    es_dashname character varying(64) NOT NULL
);


ALTER TABLE public.es_dashboard OWNER TO XEDRM5;

--
-- TOC entry 209 (class 1259 OID 16845)
-- Name: es_dashboardwidget; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_dashboardwidget (
    es_widgettype character varying(64) NOT NULL,
    es_widgetname character varying(64) NOT NULL,
    es_widgeticon character varying(64) NOT NULL,
    es_widgettext character varying(64) NOT NULL,
    es_widgetenabled numeric(2,0) NOT NULL,
    es_widgetpath character varying(64),
    admin_widget numeric(2,0) NOT NULL
);


ALTER TABLE public.es_dashboardwidget OWNER TO XEDRM5;

--
-- TOC entry 210 (class 1259 OID 16848)
-- Name: es_delegation; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_delegation (
    es_id numeric(19,0),
    es_lastmodified timestamp without time zone,
    es_deleted numeric(38,0),
    es_mandatorid character varying(20),
    es_delegatorid character varying(20),
    es_comment character varying(1000),
    es_expiredate timestamp without time zone,
    es_allowed character varying(255)
);


ALTER TABLE public.es_delegation OWNER TO XEDRM5;

--
-- TOC entry 211 (class 1259 OID 16854)
-- Name: es_docstat; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_docstat (
    es_creationdate character(8) NOT NULL,
    es_creationuserid character varying(20) NOT NULL,
    es_doctypeid numeric(19,0),
    es_path character varying(4000) NOT NULL,
    es_count numeric(19,0) NOT NULL,
    es_size numeric(19,0) NOT NULL
);


ALTER TABLE public.es_docstat OWNER TO XEDRM5;

--
-- TOC entry 212 (class 1259 OID 16860)
-- Name: es_eclass; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_eclass (
    eclassid character(16) NOT NULL,
    descr character varying(64) NOT NULL,
    internalcontainer numeric(38,0) NOT NULL,
    externalcontainer numeric(38,0) NOT NULL,
    dynamiccontainer numeric(38,0) NOT NULL,
    parentid character(16)
);


ALTER TABLE public.es_eclass OWNER TO XEDRM5;

--
-- TOC entry 213 (class 1259 OID 16863)
-- Name: es_eclassattribute; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_eclassattribute (
    eclassid character(16) NOT NULL,
    attrname character varying(64) NOT NULL,
    attrvalue character varying(255) NOT NULL
);


ALTER TABLE public.es_eclassattribute OWNER TO XEDRM5;

--
-- TOC entry 214 (class 1259 OID 16866)
-- Name: es_generic; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_generic (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_type character varying(255) NOT NULL,
    es_subtype character varying(255) NOT NULL,
    es_qualifier numeric(19,0),
    es_string1 character varying(4000),
    es_string2 character varying(4000),
    es_string3 character varying(4000),
    es_integer1 numeric(19,0),
    es_integer2 numeric(19,0),
    es_integer3 numeric(19,0),
    es_double1 real,
    es_double2 real,
    es_date1 timestamp without time zone,
    es_date2 timestamp without time zone
);


ALTER TABLE public.es_generic OWNER TO XEDRM5;

--
-- TOC entry 215 (class 1259 OID 16879)
-- Name: es_history; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_history (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_docid character varying(20),
    es_doctypeid character varying(20),
    es_folderid character varying(20),
    es_path character varying(4000),
    es_filename character varying(255),
    es_userid character varying(256) NOT NULL,
    es_username character varying(255),
    es_date timestamp without time zone,
    es_event character varying(255),
    es_comment character varying(4000),
    es_version character varying(10),
    es_title character varying(255),
    es_folderpath character varying(4000),
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    s6 character varying(256),
    s7 character varying(256),
    s8 character varying(256),
    s9 character varying(256),
    s10 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    l3 numeric(38,0),
    l4 numeric(38,0),
    l5 numeric(38,0),
    serializable bytea,
    es_ip character varying(40),
    es_hostname character varying(200),
    es_useragent character varying(128),
    es_mac character varying(20),
    es_serverip character varying(40),
    es_serverport numeric(5,0),
    es_clientversion character varying(20)
);


ALTER TABLE public.es_history OWNER TO XEDRM5;

--
-- TOC entry 216 (class 1259 OID 16885)
-- Name: es_keyword; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_keyword (
    elementid character(16) NOT NULL,
    eclassid character(16) NOT NULL,
    type numeric(19,0) NOT NULL,
    descr character varying(1000)
);


ALTER TABLE public.es_keyword OWNER TO XEDRM5;

--
-- TOC entry 217 (class 1259 OID 16891)
-- Name: es_listitems; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_listitems (
    id character varying(36),
    name character varying(256),
    seq numeric(38,0),
    value character varying(4000)
);


ALTER TABLE public.es_listitems OWNER TO XEDRM5;

--
-- TOC entry 218 (class 1259 OID 16897)
-- Name: es_menu; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_menu (
    es_id character varying(20) NOT NULL,
    es_title character varying(255),
    es_parentid character varying(20) NOT NULL,
    es_order numeric(38,0) DEFAULT 0 NOT NULL,
    es_url character varying(255),
    es_default numeric(38,0) DEFAULT 1 NOT NULL,
    es_use numeric(38,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.es_menu OWNER TO XEDRM5;

--
-- TOC entry 220 (class 1259 OID 16909)
-- Name: es_menu_uuid; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_menu_uuid (
    es_menuid character varying(20),
    es_user_or_group_id character varying(36),
    es_user_or_group_type character varying(36)
);


ALTER TABLE public.es_menu_uuid OWNER TO XEDRM5;

--
-- TOC entry 219 (class 1259 OID 16906)
-- Name: es_menurights; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_menurights (
    es_menuid numeric(19,0),
    es_securityref numeric(19,0)
);


ALTER TABLE public.es_menurights OWNER TO XEDRM5;

--
-- TOC entry 221 (class 1259 OID 16912)
-- Name: es_recipient; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_recipient (
    es_messageid numeric(19,0) NOT NULL,
    es_name character varying(255) NOT NULL,
    es_address character varying(255) NOT NULL,
    es_mode character varying(255) NOT NULL,
    es_type numeric(38,0) NOT NULL,
    es_read numeric(38,0) NOT NULL
);


ALTER TABLE public.es_recipient OWNER TO XEDRM5;

--
-- TOC entry 222 (class 1259 OID 16918)
-- Name: es_rewrite; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_rewrite (
    es_id numeric(19,0) NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_authorid character varying(20) NOT NULL,
    es_command numeric(38,0) NOT NULL,
    es_createdate timestamp without time zone,
    es_completedate timestamp without time zone,
    es_currentrewriter character varying(20) NOT NULL,
    es_targetid character varying(20),
    es_status numeric(38,0) NOT NULL,
    es_expiredate timestamp without time zone,
    es_data character varying(1000),
    es_groupid character varying(20),
    es_contents character varying(4000),
    es_linkid numeric(19,0),
    es_securitytype numeric(38,0),
    es_subject character varying(1000),
    es_startdate timestamp without time zone,
    es_enddate timestamp without time zone
);


ALTER TABLE public.es_rewrite OWNER TO XEDRM5;

--
-- TOC entry 223 (class 1259 OID 16924)
-- Name: es_rewritecc; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_rewritecc (
    es_rewriteid numeric(19,0) NOT NULL,
    es_rewriterccid character varying(20) NOT NULL
);


ALTER TABLE public.es_rewritecc OWNER TO XEDRM5;

--
-- TOC entry 224 (class 1259 OID 16927)
-- Name: es_rewritedoc; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_rewritedoc (
    rewriteid numeric(19,0) NOT NULL,
    elementid character(16) NOT NULL,
    version character varying(20)
);


ALTER TABLE public.es_rewritedoc OWNER TO XEDRM5;

--
-- TOC entry 225 (class 1259 OID 16930)
-- Name: es_rewriteprocess; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_rewriteprocess (
    es_rewriteid numeric(19,0) NOT NULL,
    es_rewriterid character varying(20) NOT NULL,
    es_comment character varying(4000),
    es_completedate timestamp without time zone,
    es_position numeric(38,0) NOT NULL,
    es_type numeric(38,0) DEFAULT 0
);


ALTER TABLE public.es_rewriteprocess OWNER TO XEDRM5;

--
-- TOC entry 226 (class 1259 OID 16937)
-- Name: es_searches; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_searches (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_userid character varying(20) NOT NULL,
    es_name character varying(1000) NOT NULL,
    es_description character varying(1000),
    es_elementid character varying(16) NOT NULL
);


ALTER TABLE public.es_searches OWNER TO XEDRM5;

--
-- TOC entry 230 (class 1259 OID 16952)
-- Name: es_share; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_share (
    es_id numeric(38,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_ticketid character varying(255),
    es_userid character varying(64) NOT NULL,
    elementid character(16) NOT NULL,
    es_creation timestamp without time zone NOT NULL,
    es_version character varying(20),
    anonymous numeric(19,0)
);


ALTER TABLE public.es_share OWNER TO XEDRM5;

--
-- TOC entry 231 (class 1259 OID 16955)
-- Name: es_shareaccess; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_shareaccess (
    shareid numeric(38,0),
    roleid character varying(64) NOT NULL,
    privilege character varying(20) NOT NULL
);


ALTER TABLE public.es_shareaccess OWNER TO XEDRM5;

ALTER TABLE public.ES_SHAREACCESS ADD COLUMN templateId character varying(20);
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN START_DT timestamp without time zone;
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN END_DT timestamp without time zone;
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN ES_COUNT numeric(38,0);
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN PRIVILEGETYPE numeric(38,0);
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN ELEMENTID  character varying(16);
ALTER TABLE public.ES_SHAREACCESS ADD COLUMN DESCR  character varying(64);

COMMENT ON COLUMN public.ES_SHAREACCESS.START_DT IS '권한유효기간 시작일';
COMMENT ON COLUMN public.ES_SHAREACCESS.END_DT IS '권한유효기간 만기일';
COMMENT ON COLUMN public.ES_SHAREACCESS.ES_COUNT IS '접근가능회수';
COMMENT ON COLUMN public.ES_SHAREACCESS.PRIVILEGETYPE IS '권한유형 (사용자:1, 그룹:2, USER_OWNER(엑스톰에서 사용):3, GROUP_OWNER(엑스톰에서 사용):4, 결재승인권한:5, 편집불가한 권한그룹:6, 편집가능한 권한그룹:7, 공유권한:8)';
COMMENT ON COLUMN public.ES_SHAREACCESS.ELEMENTID IS '엘리먼트 아이디';
COMMENT ON COLUMN public.ES_SHAREACCESS.DESCR IS '설명';

ALTER TABLE public.ES_SHAREACCESS alter column SHAREID set default NULL;
ALTER TABLE public.es_shareaccess ALTER COLUMN shareid DROP NOT NULL;

--
-- TOC entry 232 (class 1259 OID 16958)
-- Name: es_stat; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_stat (
    es_regdate character(8) NOT NULL,
    es_event character varying(255) NOT NULL,
    es_doctypeid character varying(20),
    es_userid character varying(20) NOT NULL,
    es_folder character varying(4000),
    es_count numeric(19,0) NOT NULL
);


ALTER TABLE public.es_stat OWNER TO XEDRM5;

--
-- TOC entry 233 (class 1259 OID 16964)
-- Name: es_sysmessage; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_sysmessage (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_author character varying(255),
    es_messagetext character varying(2000),
    es_subject character varying(255),
    es_sentdate timestamp without time zone NOT NULL,
    es_lastnotified timestamp without time zone,
    es_status numeric(38,0) NOT NULL,
    es_trials numeric(38,0),
    es_type numeric(38,0) NOT NULL,
    es_category character varying(40),
    es_parentid numeric(19,0)
);


ALTER TABLE public.es_sysmessage OWNER TO XEDRM5;

--
-- TOC entry 234 (class 1259 OID 16970)
-- Name: es_template; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_template (
    es_id numeric(19,0) NOT NULL,
    es_lastmodified timestamp without time zone NOT NULL,
    es_deleted numeric(38,0) NOT NULL,
    es_name character varying(255) NOT NULL,
    es_description character varying(1000),
    es_readonly numeric(38,0),
    es_docid numeric(19,0),
    es_rule character varying(255)
);


ALTER TABLE public.es_template OWNER TO XEDRM5;

--
-- TOC entry 235 (class 1259 OID 16976)
-- Name: es_template_ext; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_template_ext (
    es_templateid numeric(19,0) NOT NULL,
    es_name character varying(255) NOT NULL,
    es_label character varying(255) NOT NULL,
    es_mandatory numeric(38,0) NOT NULL,
    es_type numeric(38,0) NOT NULL,
    es_editor numeric(38,0) NOT NULL,
    es_position numeric(38,0) NOT NULL,
    es_stringvalue character varying(4000),
    es_intvalue numeric(19,0),
    es_doublevalue real,
    es_datevalue timestamp without time zone,
    es_description character varying(1000),
    es_priority numeric(38,0)
);


ALTER TABLE public.es_template_ext OWNER TO XEDRM5;

--
-- TOC entry 209 (class 1259 OID 16845)
-- Name: es_user_widget; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_user_widget (
    es_widgettext character varying(64) NOT NULL,
    user_id character varying(256) NOT NULL,
    enabled numeric(2,0) NOT NULL
);


ALTER TABLE public.es_user_widget OWNER TO XEDRM5;


--
-- TOC entry 236 (class 1259 OID 16982)
-- Name: es_version; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_version (
    elementid character(16) NOT NULL,
    currentversion character varying(64) NOT NULL,
    currentrevision character varying(64) NOT NULL,
    status numeric(38,0) NOT NULL
);


ALTER TABLE public.es_version OWNER TO XEDRM5;

--
-- TOC entry 237 (class 1259 OID 16985)
-- Name: es_versionelement; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_versionelement (
    elementid character(16) NOT NULL,
    compelement character(16),
    version character varying(64) NOT NULL,
    revision character varying(64) NOT NULL
);


ALTER TABLE public.es_versionelement OWNER TO XEDRM5;

--
-- TOC entry 238 (class 1259 OID 16988)
-- Name: es_volume; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_volume (
    volumeid character(16) NOT NULL,
    descr character varying(64) NOT NULL,
    maxspace numeric(14,0) NOT NULL,
    spaceleft numeric(14,0) NOT NULL,
    recoverspace numeric(38,0) NOT NULL,
    status numeric(38,0) NOT NULL,
    adminsclass character(16) NOT NULL,
    parameter character varying(64),
    usablespace numeric(14,0),
    fillorder numeric(38,0),
    startdate timestamp without time zone,
    enddate timestamp without time zone
);


ALTER TABLE public.es_volume OWNER TO XEDRM5;

--
-- TOC entry 239 (class 1259 OID 16991)
-- Name: es_xref; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_xref (
    elementid character(16) NOT NULL,
    attachid character(16) NOT NULL,
    descr character varying(64) NOT NULL,
    connection character varying(64),
    content character varying(255),
    contenttype numeric(38,0) NOT NULL,
    isredaction numeric(38,0) NOT NULL,
    usersclass character(16)
);


ALTER TABLE public.es_xref OWNER TO XEDRM5;

--
-- TOC entry 240 (class 1259 OID 16994)
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.hibernate_unique_key (
    tablename character varying(40) NOT NULL,
    next_hi numeric(19,0) NOT NULL
);


ALTER TABLE public.hibernate_unique_key OWNER TO XEDRM5;

--
-- TOC entry 241 (class 1259 OID 16997)
-- Name: ht_asyselement; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.ht_asyselement (
    elementid character varying(255) NOT NULL
);


ALTER TABLE public.ht_asyselement OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 242 (class 1259 OID 17000)
-- Name: pol_client; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_client (
    prod_no character(23) NOT NULL,
    prod_ver character varying(16),
    mac_addr character varying(20),
    ip_addr character varying(40),
    hostname character varying(64),
    user_id character varying(256),
    policy_id character varying(20),
    policy_ymdtime character(14),
    policy_level numeric(2,0),
    patch_no character varying(20),
    last_access_dt timestamp without time zone,
    onoff_yn character(1),
    workflow_chg_yn character(1),
    policy_chg_yn character(1),
    patch_chg_yn character(1),
    reg_dt timestamp without time zone,
    del_dt timestamp without time zone,
    patch_delay_dt timestamp without time zone,
    relay_dt timestamp without time zone,
    notice_yn character(1),
    relay_prod_no character varying(23),
    prod_state numeric(1,0),
    smartwork_chg_yn character(1),
    user_nm character varying(128),
    group_id character varying(256),
    group_nm character varying(128),
    patch_delay_max_cnt numeric(3,0),
    patch_delay_cnt numeric(3,0)
);


ALTER TABLE public.pol_client OWNER TO XEDRM5;

-- 20210430
--
-- TOC entry 243 (class 1259 OID 17006)
-- Name: pol_list; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_list (
    policy_id character varying(20) NOT NULL,
    policy_nm character varying(256),
    descr character varying(256),
    use_yn character(1),
    policy_ymdtime character(14),
    chg_id character varying(256),
    chg_dt timestamp without time zone
);


ALTER TABLE public.pol_list OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 246 (class 1259 OID 17024)
-- Name: sys_code; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_code (
    cd_id character varying(32) NOT NULL,
    cd_key character varying(64),
    cd_ko character varying(128),
    cd_en character varying(128),
    p_cd_id character varying(32),
    cd_order numeric(5,0),
    use_yn character(1),
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    cd_zh character varying(128),
    cd_ja character varying(128),
    s6 character varying(256),
    s7 character varying(256),
    s8 character varying(256),
    s9 character varying(256),
    s10 character varying(256)
);


ALTER TABLE public.sys_code OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 247 (class 1259 OID 17030)
-- Name: sys_group; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_group (
    group_id character varying(256) NOT NULL,
    group_nm character varying(128),
    hr boolean DEFAULT FALSE,
    owner character varying(256),
	role_id numeric(19,0),
    group_enm character varying(128),
    group_type numeric(19,0),
    group_order numeric(6,0),
    parent_id character varying(256),
    serializable bytea,
    hr_except_yn character(1),
    use_yn character(1),
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    rank numeric (38,0),
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    s6 character varying(256),
    s7 character varying(256),
    s8 character varying(256),
    s9 character varying(256),
    s10 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    l3 numeric(38,0),
    l4 numeric(38,0),
    l5 numeric(38,0)
);


ALTER TABLE public.sys_group OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 248 (class 1259 OID 17036)
-- Name: sys_group_manager; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_group_manager (
    group_id character varying(256) NOT NULL,
    user_id character varying(256) NOT NULL,
    hr boolean DEFAULT FALSE,
    type numeric(19,0) DEFAULT 0
);


ALTER TABLE public.sys_group_manager OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 249 (class 1259 OID 17042)
-- Name: sys_group_member; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_group_member (
    group_id character varying(256) NOT NULL,
    member_id character varying(256) NOT NULL,
    member_type numeric(38,0) DEFAULT 1 NOT NULL,
    hr boolean DEFAULT FALSE,
    es_expired timestamp without time zone
);


ALTER TABLE public.sys_group_member OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 250 (class 1259 OID 17049)
-- Name: sys_menu; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_menu (
    menu_id character varying(128) NOT NULL,
    p_menu_id character varying(128),
    menu_order numeric(3,0),
    descr character varying(256),
    menu_url character varying(512),
    use_yn character(1),
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    menu_ko character varying(256),
    icon_url character varying(512),
    menu_width numeric(5,0),
    menu_en character varying(256),
    menu_zh character varying(256),
    menu_ja character varying(256),
    icon_type character varying(8),
    access_level numeric(3,0)
);


ALTER TABLE public.sys_menu OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 253 (class 1259 OID 17067)
-- Name: sys_pgm; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_pgm (
    pgm_id character varying(128) NOT NULL,
    pgm_type character varying(16),
    record_add_yn character(1),
    record_del_yn character(1),
    record_modify_yn character(1),
    use_yn character(1),
    record_click_func character varying(128),
    record_dclick_func character varying(128),
    record_chg_func character varying(128),
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    pgm_init_search_yn character(1),
    pgm_ko character varying(128),
    sub_pgm_id character varying(1024),
    pgm_en character varying(128),
    pgm_zh character varying(128),
    pgm_ja character varying(128),
    pgm_tree_cd character varying(16),
    pgm_mapping_type character varying(8),
    url_select character varying(2048),
    url_save character varying(2048),
    policy_apply_yn character(1),
    ref_pgm_id character varying(1024),
    service_select_func character varying(256),
    service_save_func character varying(256),
    trigger_select_func character varying(256),
    trigger_save_func character varying(256)
);


ALTER TABLE public.sys_pgm OWNER TO XEDRM5;

-- 20200910: 컬럼 추가(LINK_COL), 컬럼 제거(SORT_TYPE, PINNED_TYPE, URL, FILTER_TYPE, FILTER_DEFAULT_DATA, FILTER_USE_YN, COMBO_DATA_ID)
--
-- TOC entry 254 (class 1259 OID 17073)
-- Name: sys_pgm_column; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_pgm_column (
    pgm_id character varying(128) NOT NULL,
    col_id character varying(30) NOT NULL,
    col_ko character varying(512),
    col_en character varying(512),
    col_width numeric(5,0),
    col_order numeric(3,0),
    pk_yn character(1),
    required_yn character(1),
    edit_yn character(1),
    hide_yn character(1),
    edit_type character varying(16),
    data_type character varying(16),
    mapping_type character varying(16),
    mapping_id character varying(128),
    mask_id character varying(128),
    default_data character varying(512),
    click_func character varying(128),
    dclick_func character varying(128),
    rclick_func character varying(128),
    chg_func character varying(128),
    tooltip character varying(1024),
    use_yn character(1),
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    sub_pgm_id character varying(128),
    col_zh character varying(512),
    col_ja character varying(512),
    search_type character(1),
    policy_apply_yn character(1),
    group_id character varying(30),
    group_data character varying(256),
    ref_id character varying(256),
    data_length numeric(38,0),
    ref_type character varying(16),
    ref_data character varying(256),
	link_col character varying(1024)
);


ALTER TABLE public.sys_pgm_column OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 255 (class 1259 OID 17079)
-- Name: sys_pgm_column_data; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_pgm_column_data (
    data_id character varying(64) NOT NULL,
    data_value character varying(256),
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    row_idx numeric(38,0) NOT NULL,
    pgm_id character varying(128) NOT NULL,
    col_id character varying(30) NOT NULL
);


ALTER TABLE public.sys_pgm_column_data OWNER TO XEDRM5;

-- 20200910: 컬럼 추가(CASCADE_TYPE, GROUP_ID, GROUP_DATA, GROUP_OBJECT), 컬럼 제거(SUB_MAPPING_YN)
--
-- TOC entry 257 (class 1259 OID 17091)
-- Name: sys_tree_node; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_tree_node (
    node_id character varying(128) NOT NULL,
    p_node_id character varying(128),
    node_type character varying(8),
    node_val character varying(128),
    data_type character varying(4),
    cd_mapping_yn character(1),
    tree_type character varying(8) NOT NULL,
	cascade_type character varying(16),
	group_id character varying(256),
	group_data character varying(1024),
	group_object character varying(1024)
);


ALTER TABLE public.sys_tree_node OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 251 (class 1259 OID 17055)
-- Name: pol_schedule; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_schedule (	
    sched_idx numeric(38,0),
    sched_nm character varying(128),
    sched_type character(4),
    sched_state character(2),
    origin_pol_id character varying(20),
    apply_pol_id character varying(20),
    return_pol_id character varying(20),
    user_id character varying(256),
    group_id character varying(256),
    position_cd character varying(32),
    pol_group_id character varying(128),
    ip_addr character varying(40),
    start_ymdtime character(14),
    end_ymdtime character(14),
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    use_yn character(1)
);


ALTER TABLE public.pol_schedule OWNER TO XEDRM5;

-- 20210628
--
-- Name: pol_environment; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_environment (	
    env_cd character varying(64),
    ip_addr character varying(2048),
    default_policy_id character varying(20)
);

ALTER TABLE public.pol_environment OWNER TO XEDRM5;

-- 20210628
--
-- Name: pol_apply; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_apply (	
    policy_id character varying(20),
    env_cd character varying(64)
);

ALTER TABLE public.pol_apply OWNER TO XEDRM5;

-- 20210628
--
-- TOC entry 251 (class 1259 OID 17055)
-- Name: pol_apply_client; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_apply_client (	
    env_cd character varying(64),
    policy_id character varying(20),
    client_idx numeric(38,0),
    ip_addr character varying(40),
    mac_addr character varying(20),
    descr character varying(256),
    chg_id character varying(256),
    chg_dt timestamp without time zone
);

ALTER TABLE public.pol_apply_client OWNER TO XEDRM5;

-- 20210628
--
-- TOC entry 251 (class 1259 OID 17055)
-- Name: pol_apply_user; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pol_apply_user (
    policy_id character varying(20),
    env_cd character varying(64),
    user_id character varying(256),
    user_cl character varying(8),
    sub_data_check_yn character(1),
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    descr character varying(256),
    user_nm character varying(256)
);

ALTER TABLE public.pol_apply_user OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 251 (class 1259 OID 17055)
-- Name: pat_list; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pat_list (	
    patch_no character varying(20) NOT NULL,
	patch_type character(1),
	deploy_status character(1),
	patch_ymdtime character(14),
	show_type character(1),
	hash_cd character(32),
	descr character varying(1024),
	reg_id character varying(256),
    reg_dt timestamp without time zone,
	chg_id character varying(256),
    chg_dt timestamp without time zone,
	prod_ver character varying(20),
	reboot_type character(1),
	patch_path character varying(1024),
	hash_chk_yn character(1),
	delay_max_cnt numeric(3,0),
	site_ver character varying(20)
);

ALTER TABLE public.pat_list OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 251 (class 1259 OID 17055)
-- Name: pat_object; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.pat_object (
    object_idx numeric(38,0) NOT NULL,
	object_type character varying(8),
	object_cd character varying(256),
	deploy_range character varying(8),
	object_nm character varying(128),
    patch_no character varying(20) NOT NULL
);

CREATE TABLE public.es_priv_template (
    TEMPLATEID  character varying(20),
    TEMPLATE_NM character varying(64),
    PRIV_VAL  numeric,
	PRIV_MODIFY_YN character(1),
	PRIV_TYPE character varying(20)
);

alter table public.ES_PRIV_TEMPLATE add constraint ES_TEMPLATEID_UNIQUE unique(TEMPLATEID);
ALTER TABLE public.ES_PRIV_TEMPLATE alter column PRIV_MODIFY_YN set default 'Y';
ALTER TABLE public.ES_PRIV_TEMPLATE alter column PRIV_MODIFY_YN set NOT NULL;
COMMENT ON COLUMN public.ES_PRIV_TEMPLATE.TEMPLATEID IS '템플릿 아이디';
COMMENT ON COLUMN public.ES_PRIV_TEMPLATE.PRIV_VAL IS '권한';
COMMENT ON COLUMN public.ES_PRIV_TEMPLATE.PRIV_MODIFY_YN IS '권한 수정 가능 여부';
COMMENT ON COLUMN public.ES_PRIV_TEMPLATE.PRIV_TYPE IS '권한 템플릿 구분';

CREATE TABLE public.ES_ROLE (
    role_id numeric(19,0),
    role_name  character varying(255),
    role_auth  character varying(255)
);

COMMENT ON COLUMN public.ES_ROLE.ROLE_ID IS '';
COMMENT ON COLUMN public.ES_ROLE.ROLE_NAME IS 'ROLE_NAME 에 대한 권한';
COMMENT ON COLUMN public.ES_ROLE.ROLE_AUTH IS 'ROLE_AUTH 에 대한 권한';
 
   
ALTER TABLE public.pat_object OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 260 (class 1259 OID 17100)
-- Name: sys_user; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_user (
    user_id character varying(256) NOT NULL,
    user_nm character varying(128) NOT NULL,
    email character varying(256),
    hr boolean DEFAULT FALSE,
    user_priority numeric(38,0) NOT NULL,
    last_passwd_chg_dt timestamp without time zone,
    login_dt timestamp without time zone,
    login_ip character varying(32),
    dashboard_id character varying(256),
    language_cd character varying(256),
    home_id character varying(256),
    address character varying(256),
    serializable bytea,
    passwd character varying(256),
    admin_passwd character varying(256),
    position_cd character varying(32),
    hr_except_yn character(1),
    user_enm character varying(128),
    tel_1 character varying(16),
    tel_2 character varying(16),
    login_fail_cnt numeric(3,0),
    rep_group_id character varying(256) NOT NULL,
    reg_id character varying(256),
    reg_dt timestamp without time zone,
    chg_id character varying(256),
    chg_dt timestamp without time zone,
    rank numeric (38,0),
    s1 character varying(256),
    s2 character varying(256),
    s3 character varying(256),
    s4 character varying(256),
    s5 character varying(256),
    s6 character varying(256),
    s7 character varying(256),
    s8 character varying(256),
    s9 character varying(256),
    s10 character varying(256),
    l1 numeric(38,0),
    l2 numeric(38,0),
    l3 numeric(38,0),
    l4 numeric(38,0),
    l5 numeric(38,0),
	mobile character varying(16) NULL,
	use_yn character(1),
	tenant_id character varying(256)
);


ALTER TABLE public.sys_user OWNER TO XEDRM5;

-- 20200910
--
-- TOC entry 262 (class 1259 OID 17112)
-- Name: sys_user_attr; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.sys_user_attr (
    user_id character varying(256) NOT NULL,
    attrname character varying(64) NOT NULL,
    attrvalue character varying(256),
    serializablevalue bytea
);


ALTER TABLE public.sys_user_attr OWNER TO XEDRM5;

-- 20210125: 기능 추가로 인한 테이블 추가 
--
-- TOC entry ??? (class ???? OID ?????)
-- Name: es_ecm_file; Type: TABLE; Schema: public; Owner: XEDRM5
--

CREATE TABLE public.es_ecm_file (
	ecmid character(20) NOT NULL,
	elementid character(16) NOT NULL,
	status numeric(19,0) DEFAULT 0,
	created timestamp without time zone,
	expiration timestamp without time zone
);


ALTER TABLE public.es_ecm_file OWNER TO XEDRM5;

--
-- TOC entry 3024 (class 2606 OID 17134)
-- Name: es_adminmenu es_pk_adminmenu; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_adminmenu
    ADD CONSTRAINT es_pk_adminmenu PRIMARY KEY (es_id);


--
-- TOC entry 3026 (class 2606 OID 17136)
-- Name: es_audit es_pk_audit; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_audit
    ADD CONSTRAINT es_pk_audit PRIMARY KEY (es_type, es_targetid);


--
-- TOC entry 3028 (class 2606 OID 17138)
-- Name: es_bookmark es_pk_bookmark; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_bookmark
    ADD CONSTRAINT es_pk_bookmark PRIMARY KEY (es_id);


--
-- TOC entry 3030 (class 2606 OID 17140)
-- Name: es_codes es_pk_codes; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_codes
    ADD CONSTRAINT es_pk_codes PRIMARY KEY (es_id);


--
-- TOC entry 3034 (class 2606 OID 17144)
-- Name: es_dashboard es_pk_dashboard; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_dashboard
    ADD CONSTRAINT es_pk_dashboard PRIMARY KEY (es_id);


--
-- TOC entry 3036 (class 2606 OID 17146)
-- Name: es_dashboardwidget es_pk_dashboardwidget; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_dashboardwidget
    ADD CONSTRAINT es_pk_dashboardwidget PRIMARY KEY (es_widgettext);


--
-- TOC entry 3041 (class 2606 OID 17151)
-- Name: es_generic es_pk_generic; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_generic
    ADD CONSTRAINT es_pk_generic PRIMARY KEY (es_id);


--
-- TOC entry 3048 (class 2606 OID 17154)
-- Name: es_history es_pk_history; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_history
    ADD CONSTRAINT es_pk_history PRIMARY KEY (es_id);


--
-- TOC entry 3052 (class 2606 OID 17160)
-- Name: es_keyword es_pk_keyword; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_keyword
    ADD CONSTRAINT es_pk_keyword PRIMARY KEY (elementid, eclassid);


--
-- TOC entry 3058 (class 2606 OID 17168)
-- Name: es_rewrite es_pk_rewrite; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_rewrite
    ADD CONSTRAINT es_pk_rewrite PRIMARY KEY (es_id);


--
-- TOC entry 3063 (class 2606 OID 17173)
-- Name: es_rewriteprocess es_pk_rewriteproc; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_rewriteprocess
    ADD CONSTRAINT es_pk_rewriteproc PRIMARY KEY (es_rewriteid, es_rewriterid);


--
-- TOC entry 3065 (class 2606 OID 17175)
-- Name: es_searches es_pk_searches; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_searches
    ADD CONSTRAINT es_pk_searches PRIMARY KEY (es_id);


--
-- TOC entry 3069 (class 2606 OID 17179)
-- Name: es_share es_pk_share; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_share
    ADD CONSTRAINT es_pk_share PRIMARY KEY (es_id);


--
-- TOC entry 3076 (class 2606 OID 17186)
-- Name: es_sysmessage es_pk_sysmessage; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_sysmessage
    ADD CONSTRAINT es_pk_sysmessage PRIMARY KEY (es_id);


--
-- TOC entry 3079 (class 2606 OID 17189)
-- Name: es_template es_pk_template; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_template
    ADD CONSTRAINT es_pk_template PRIMARY KEY (es_id);


--
-- TOC entry 3082 (class 2606 OID 17192)
-- Name: es_template_ext es_pk_templateext; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_template_ext
    ADD CONSTRAINT es_pk_templateext PRIMARY KEY (es_templateid, es_name);


--
-- TOC entry 3013 (class 2606 OID 17121)
-- Name: asyselement pk_asyselement; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.asyselement
    ADD CONSTRAINT pk_asyselement PRIMARY KEY (elementid);


--
-- TOC entry 3032 (class 2606 OID 17142)
-- Name: es_comments pk_commentid; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_comments
    ADD CONSTRAINT pk_commentid PRIMARY KEY (commentid);


--
-- TOC entry 3084 (class 2606 OID 17194)
-- Name: es_version pk_es_version; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_version
    ADD CONSTRAINT pk_es_version PRIMARY KEY (elementid);


--
-- TOC entry 3020 (class 2606 OID 17130)
-- Name: com_workflow_item xpk_com_workflow_item; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.com_workflow_item
    ADD CONSTRAINT xpk_com_workflow_item PRIMARY KEY (item_idx);


--
-- TOC entry 3022 (class 2606 OID 17132)
-- Name: com_workflow_list xpk_com_workflow_list; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.com_workflow_list
    ADD CONSTRAINT xpk_com_workflow_list PRIMARY KEY (list_idx);


--
-- TOC entry 3089 (class 2606 OID 17199)
-- Name: pol_client xpk_pol_client; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_client
    ADD CONSTRAINT xpk_pol_client PRIMARY KEY (prod_no);


ALTER TABLE ONLY public.pol_schedule
    ADD CONSTRAINT xpk_pol_schedule PRIMARY KEY (sched_idx);

ALTER TABLE ONLY public.pol_environment
    ADD CONSTRAINT xpk_pol_environment PRIMARY KEY (env_cd);
    
ALTER TABLE ONLY public.pol_apply
    ADD CONSTRAINT xpk_pol_apply PRIMARY KEY (env_cd, policy_id);
    
ALTER TABLE ONLY public.pol_apply_client
    ADD CONSTRAINT xpk_pol_apply_client PRIMARY KEY (client_idx);
    
ALTER TABLE ONLY public.pol_apply_user
    ADD CONSTRAINT xpk_pol_apply_user PRIMARY KEY (env_cd, user_cl, user_id);
    
--
-- TOC entry 3091 (class 2606 OID 17201)
-- Name: pol_list xpk_pol_list; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_list
    ADD CONSTRAINT xpk_pol_list PRIMARY KEY (policy_id);

--
-- TOC entry 3097 (class 2606 OID 17207)
-- Name: sys_code xpk_sys_code; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_code
    ADD CONSTRAINT xpk_sys_code PRIMARY KEY (cd_id);


--
-- TOC entry 3099 (class 2606 OID 17209)
-- Name: sys_group xpk_sys_group; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT xpk_sys_group PRIMARY KEY (group_id);


--
-- TOC entry 3101 (class 2606 OID 17211)
-- Name: sys_group_manager xpk_sys_group_manager; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_group_manager
    ADD CONSTRAINT xpk_sys_group_manager PRIMARY KEY (group_id, user_id, type);


--
-- TOC entry 3103 (class 2606 OID 17213)
-- Name: sys_group_member xpk_sys_group_member; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_group_member
    ADD CONSTRAINT xpk_sys_group_member PRIMARY KEY (group_id, member_id);


--
-- TOC entry 3105 (class 2606 OID 17215)
-- Name: sys_menu xpk_sys_menu; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT xpk_sys_menu PRIMARY KEY (menu_id);

--
-- TOC entry 3111 (class 2606 OID 17221)
-- Name: sys_pgm xpk_sys_pgm; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_pgm
    ADD CONSTRAINT xpk_sys_pgm PRIMARY KEY (pgm_id);


--
-- TOC entry 3113 (class 2606 OID 17223)
-- Name: sys_pgm_column xpk_sys_pgm_column; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_pgm_column
    ADD CONSTRAINT xpk_sys_pgm_column PRIMARY KEY (pgm_id, col_id);


--
-- TOC entry 3116 (class 2606 OID 17225)
-- Name: sys_pgm_column_data xpk_sys_pgm_column_data; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_pgm_column_data
    ADD CONSTRAINT xpk_sys_pgm_column_data PRIMARY KEY (pgm_id, data_id, row_idx, col_id);


--
-- TOC entry 3118 (class 2606 OID 17228)
-- Name: sys_tree_node xpk_sys_tree_node; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_tree_node
    ADD CONSTRAINT xpk_sys_tree_node PRIMARY KEY (tree_type, node_id);


--
-- TOC entry 3122 (class 2606 OID 17232)
-- Name: sys_user xpk_sys_user; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT xpk_sys_user PRIMARY KEY (user_id);

    
ALTER TABLE ONLY public.sys_user_attr
    ADD CONSTRAINT fk_asysuserattr_userid FOREIGN KEY (user_id) REFERENCES public.sys_user(user_id);
    
--
-- TOC entry x (class x OID x)
-- Name: pat_list xpk_pat_list; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pat_list
    ADD CONSTRAINT xpk_pat_list PRIMARY KEY (patch_no);
    
--
-- TOC entry x (class x OID x)
-- Name: pat_object xpk_pat_object; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pat_object
    ADD CONSTRAINT xpk_pat_object PRIMARY KEY (patch_no, object_idx);

--
-- TOC entry ???? (class ???? OID ?????)
-- Name: es_ecm_file es_pk_ecm_file; Type: CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_ecm_file
    ADD CONSTRAINT es_pk_ecm_file PRIMARY KEY (ecmid);
    
--
-- TOC entry 3005 (class 1259 OID 17115)
-- Name: asysce_cclassid_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysce_cclassid_elementid ON public.asyscontentelement USING btree (contentclassid, elementid);


--
-- TOC entry 3006 (class 1259 OID 17116)
-- Name: asysce_checksum; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysce_checksum ON public.asyscontentelement USING btree (checksum);


--
-- TOC entry 3007 (class 1259 OID 17117)
-- Name: asysce_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX asysce_elementid ON public.asyscontentelement USING btree (elementid);


--
-- TOC entry 3008 (class 1259 OID 17118)
-- Name: asysce_filekey; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysce_filekey ON public.asyscontentelement USING btree (filekey);


--
-- TOC entry 3009 (class 1259 OID 17119)
-- Name: asysce_volumeid_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysce_volumeid_elementid ON public.asyscontentelement USING btree (volumeid, elementid);


--
-- TOC entry 3010 (class 1259 OID 17123)
-- Name: asyse_descr; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asyse_descr ON public.asyselement USING btree (descr);


--
-- TOC entry 3011 (class 1259 OID 17122)
-- Name: asyse_modifier; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asyse_modifier ON public.asyselement USING btree (modifier);

CREATE INDEX ASYSE_PARENTID ON public.asyselement USING btree (parentid);

CREATE INDEX IF NOT EXISTS ASYSE_created_idx  ON PUBLIC.asyselement(created);
CREATE INDEX IF NOT EXISTS ASYSE_modified_idx ON PUBLIC.asyselement(modified);
CREATE INDEX IF NOT EXISTS ASYSE_path ON public.ASYSELEMENT (PATH );
--
-- TOC entry 3014 (class 1259 OID 17125)
-- Name: asysea_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysea_elementid ON public.asyselementattr USING btree (elementid);


--
-- TOC entry 3015 (class 1259 OID 17124)
-- Name: asysea_elementid_attr; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX asysea_elementid_attr ON public.asyselementattr USING btree (elementid, attrname);


--
-- TOC entry 3016 (class 1259 OID 17126)
-- Name: asysea_namevalue; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX asysea_namevalue ON public.asyselementattr USING btree (attrname, attrvalue);


--
-- TOC entry 3039 (class 1259 OID 17149)
-- Name: es_docstat_date; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_docstat_date ON public.es_docstat USING btree (es_creationdate);


--
-- TOC entry 3043 (class 1259 OID 17155)
-- Name: es_hist_date; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_hist_date ON public.es_history USING btree (es_date);


--
-- TOC entry 3044 (class 1259 OID 17156)
-- Name: es_hist_docid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_hist_docid ON public.es_history USING btree (es_docid);


--
-- TOC entry 3045 (class 1259 OID 17157)
-- Name: es_hist_event; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_hist_event ON public.es_history USING btree (es_event);


--
-- TOC entry 3046 (class 1259 OID 17158)
-- Name: es_hist_uid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_hist_uid ON public.es_history USING btree (es_userid);

CREATE INDEX es_hist_folderid ON public.es_history USING btree (es_folderid);  
CREATE INDEX es_hist_deleted ON public.es_history USING btree (es_deleted); 


--
-- TOC entry 3049 (class 1259 OID 17162)
-- Name: es_keyword_docid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_keyword_docid ON public.es_keyword USING btree (elementid);


--
-- TOC entry 3050 (class 1259 OID 17161)
-- Name: es_keyword_keyword; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_keyword_keyword ON public.es_keyword USING btree (eclassid);


--
-- TOC entry 3053 (class 1259 OID 17163)
-- Name: es_listitems_key; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_listitems_key ON public.es_listitems USING btree (id, name);


--
-- TOC entry 3037 (class 1259 OID 17147)
-- Name: es_pk_delegation; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_pk_delegation ON public.es_delegation USING btree (es_id);


--
-- TOC entry 3054 (class 1259 OID 17164)
-- Name: es_pk_menurights; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_pk_menurights ON public.es_menurights USING btree (es_menuid, es_securityref);


--
-- TOC entry 3055 (class 1259 OID 17165)
-- Name: es_pk_recipient; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_pk_recipient ON public.es_recipient USING btree (es_messageid, es_address);


--
-- TOC entry 3056 (class 1259 OID 17166)
-- Name: es_recipient_address_read; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_recipient_address_read ON public.es_recipient USING btree (es_address, es_read);


--
-- TOC entry 3059 (class 1259 OID 17169)
-- Name: es_rewrite_current; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_rewrite_current ON public.es_rewrite USING btree (es_currentrewriter);


--
-- TOC entry 3060 (class 1259 OID 17170)
-- Name: es_rewrite_expire; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_rewrite_expire ON public.es_rewrite USING btree (es_expiredate);


--
-- TOC entry 3061 (class 1259 OID 17171)
-- Name: es_rewrite_target; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_rewrite_target ON public.es_rewrite USING btree (es_targetid);


--
-- TOC entry 3072 (class 1259 OID 17182)
-- Name: es_sa_roleid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_sa_roleid ON public.es_shareaccess USING btree (roleid);


--
-- TOC entry 3073 (class 1259 OID 17183)
-- Name: es_sa_shareid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_sa_shareid ON public.es_shareaccess USING btree (shareid);


--
-- TOC entry 3070 (class 1259 OID 17180)
-- Name: es_share_ticketid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_share_ticketid ON public.es_share USING btree (es_ticketid);


--
-- TOC entry 3071 (class 1259 OID 17181)
-- Name: es_share_userid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_share_userid ON public.es_share USING btree (es_userid, elementid);


--
-- TOC entry 3074 (class 1259 OID 17184)
-- Name: es_stat_date; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_stat_date ON public.es_stat USING btree (es_regdate);


--
-- TOC entry 3077 (class 1259 OID 17187)
-- Name: es_sysmessage_author; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_sysmessage_author ON public.es_sysmessage USING btree (es_author);


--
-- TOC entry 3038 (class 1259 OID 17148)
-- Name: es_uk_delegation; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_uk_delegation ON public.es_delegation USING btree (es_mandatorid, es_delegatorid);


--
-- TOC entry 3042 (class 1259 OID 17152)
-- Name: es_uk_generic; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_uk_generic ON public.es_generic USING btree (es_subtype, es_qualifier);


--
-- TOC entry 3080 (class 1259 OID 17190)
-- Name: es_uk_template; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_uk_template ON public.es_template USING btree (es_name);


--
-- TOC entry 3085 (class 1259 OID 17195)
-- Name: es_ve_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_ve_elementid ON public.es_versionelement USING btree (elementid);


--
-- TOC entry 3086 (class 1259 OID 17197)
-- Name: es_xr_elementid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX es_xr_elementid ON public.es_xref USING btree (elementid);


--
-- TOC entry 3087 (class 1259 OID 17196)
-- Name: es_xr_elementid_attachid; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE UNIQUE INDEX es_xr_elementid_attachid ON public.es_xref USING btree (elementid, attachid);


CREATE INDEX asysua_userid ON public.sys_user_attr (user_id);

--
-- TOC entry 3114 (class 1259 OID 17226)
-- Name: xak1_sys_pgm_column_data; Type: INDEX; Schema: public; Owner: XEDRM5
--

CREATE INDEX xak1_sys_pgm_column_data ON public.sys_pgm_column_data USING btree (data_id);


--
-- TOC entry 3128 (class 2606 OID 17242)
-- Name: es_comments fk_elementid; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.es_comments
    ADD CONSTRAINT fk_elementid FOREIGN KEY (elementid) REFERENCES public.asyselement(elementid);


--
-- TOC entry 3133 (class 2606 OID 17267)
-- Name: sys_pgm r_11; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_pgm
    ADD CONSTRAINT r_11 FOREIGN KEY (pgm_id) REFERENCES public.sys_menu(menu_id);


--
-- TOC entry 3127 (class 2606 OID 17237)
-- Name: com_workflow_list r_36; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.com_workflow_list
    ADD CONSTRAINT r_36 FOREIGN KEY (item_idx) REFERENCES public.com_workflow_item(item_idx) ON DELETE SET NULL;

--
-- TOC entry 3134 (class 2606 OID 17272)
-- Name: sys_pgm_column r_68; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.sys_pgm_column
    ADD CONSTRAINT r_68 FOREIGN KEY (pgm_id) REFERENCES public.sys_pgm(pgm_id);


--
-- TOC entry 3135 (class 2606 OID 17277)
-- Name: sys_pgm_column_data r_79; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--  20201022: 테스트 데이터 충돌로 인한 제약사항 비활성화
--

-- ALTER TABLE ONLY public.sys_pgm_column_data
--    ADD CONSTRAINT r_79 FOREIGN KEY (pgm_id, col_id) REFERENCES public.sys_pgm_column(pgm_id, col_id);
    
    
--
-- TOC entry x (class x OID x)
-- Name: pat_object r_81; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pat_object
    ADD CONSTRAINT r_81 FOREIGN KEY (patch_no) REFERENCES public.pat_list(patch_no);


--
-- TOC entry x (class x OID x)
-- Name: pol_apply r_83; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_apply
    ADD CONSTRAINT r_83 FOREIGN KEY (policy_id) REFERENCES public.pol_list(policy_id);
    

--
-- TOC entry x (class x OID x)
-- Name: pol_apply r_84; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_apply
    ADD CONSTRAINT r_84 FOREIGN KEY (env_cd) REFERENCES public.pol_environment(env_cd);
    

--
-- TOC entry x (class x OID x)
-- Name: pol_apply_client r_87; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_apply_client
    ADD CONSTRAINT r_87 FOREIGN KEY (env_cd,policy_id) REFERENCES public.pol_apply(env_cd,policy_id);
    
    
--
-- TOC entry x (class x OID x)
-- Name: pol_apply_user r_86; Type: FK CONSTRAINT; Schema: public; Owner: XEDRM5
--

ALTER TABLE ONLY public.pol_apply_user
    ADD CONSTRAINT r_86 FOREIGN KEY (env_cd,policy_id) REFERENCES public.pol_apply(env_cd,policy_id);
    
    
-- Completed on 2019-08-01 10:34:38

--
-- XEDRM5QL database dump complete
--


-- 20200910
CREATE TABLE public.AGT_DISABLE 
   (	
    REQUEST_IDX numeric(38,0) NOT NULL, 
	USER_ID character varying(256), 
	USER_NM character varying(128), 
	GROUP_ID character varying(256), 
	GROUP_NM character varying(128), 
	IP_ADDR character varying(40), 
	MAC_ADDR character varying(20), 
	PROD_NO character(23), 
	REQUEST_DT timestamp without time zone, 
	REQUEST_TYPE character varying(16), 
	APPROVAL_YN character(1), 
	APPROVAL_LIMIT_YMDTIME character(14), 
	RESPONSE_DT timestamp without time zone, 
	CHG_ID character varying(256), 
	CHG_DT timestamp without time zone, 
	REQUEST_CHECK_YN character(1), 
	REQUEST_REASON character varying(256)
);

ALTER TABLE public.AGT_DISABLE OWNER TO XEDRM5;

ALTER TABLE ONLY public.AGT_DISABLE
    ADD CONSTRAINT XPK_AGT_DISABLE PRIMARY KEY (REQUEST_IDX);


--------------------------------------------------------
--  20210223: 성능개선용 인덱스 추가
--------------------------------------------------------
-- ASYSELEMENT : PARENTID & LOWER("DESCR")
CREATE INDEX ASYSE_LOWER_DESCR_PARENTID ON public.ASYSELEMENT USING btree (PARENTID, LOWER(DESCR));
-- ES_VERSIONELEMENT : COMPELEMENT
CREATE INDEX ES_VERSIONELEMENT_COMPELEMENT ON public.ES_VERSIONELEMENT USING btree (COMPELEMENT);

--------------------------------------------------------
--  DDL for Table ES_EFFECTIVE_ACCESS
--------------------------------------------------------

CREATE TABLE public.ES_EFFECTIVE_ACCESS
   (	
   	ELEMENTID character (16), 
	USERROLE character varying(256), 
	PRIVILEGE character varying(30), 
	TEMPLATEID character varying(20), 
	PRIVILEGETYPE numeric(38), 
	DESCR character varying(64), 
	STARTDATE timestamp without time zone, 
	ENDDATE timestamp without time zone,
	INDEXED character varying(20),
	PRIV_ID numeric(38)
   ) 
  ;
ALTER TABLE public.ES_EFFECTIVE_ACCESS OWNER TO XEDRM5;
  
--------------------------------------------------------
--  Constraints for Table ES_EFFECTIVE_ACCESS
--------------------------------------------------------
ALTER TABLE ES_EFFECTIVE_ACCESS alter column PRIVILEGETYPE set NOT NULL;
ALTER TABLE ES_EFFECTIVE_ACCESS alter column USERROLE set NOT NULL;
ALTER TABLE ES_EFFECTIVE_ACCESS alter column ELEMENTID set NOT NULL;

CREATE OR REPLACE VIEW public.ES_SECUREACCESS AS
SELECT *
FROM public.es_effective_access;
ALTER VIEW public.ES_SECUREACCESS OWNER TO XEDRM5;

--------------------------------------------------------
--  Constraints for Table SYS_THEME
--------------------------------------------------------

CREATE TABLE public.SYS_THEME (
	THEME_ID VARCHAR(128) NOT NULL,
	THEME_TYPE CHAR(1),
	THEME_VALUE VARCHAR(128),
	THEME_FILEYN CHAR(1),
	THEME_FILENAME VARCHAR(128),
	THEME_EXT VARCHAR(10),
    THEME_SERIALIZABLE bytea,
	S1 VARCHAR(256),
	S2 VARCHAR(256),
	S3 VARCHAR(256),
	LAST_CHG_DT TIMESTAMP,
	CONSTRAINT XPK_SYS_THEME PRIMARY KEY (THEME_ID, THEME_TYPE)
);
ALTER TABLE public.SYS_THEME OWNER TO XEDRM5;

--------------------------------------------------------
--  20210514: 성능개선용 인덱스, 제약 조건 추가
--------------------------------------------------------
CREATE UNIQUE INDEX IF NOT EXISTS es_volume_idx_vid ON public.es_volume(volumeId);
CREATE INDEX if not exists es_effective_access_idx_eid ON public.ES_EFFECTIVE_ACCESS(elementid);
alter table public.es_volume add constraint es_volume_pk_vid primary key(volumeid);

--------------------------------------------------------
--  20210514: 성능개선용 인덱스, 제약 조건 추가
--------------------------------------------------------
ALTER TABLE public.ASYSELEMENT add FOREIGN KEY(PRIV_OWNER) REFERENCES public.ES_PRIV_TEMPLATE(TEMPLATEID);
ALTER TABLE public.ASYSELEMENT add FOREIGN KEY(PRIV_GROUP) REFERENCES public.ES_PRIV_TEMPLATE(TEMPLATEID);
ALTER TABLE public.ASYSELEMENT add FOREIGN KEY(PRIV_OTHER) REFERENCES public.ES_PRIV_TEMPLATE(TEMPLATEID);
ALTER TABLE public.ASYSELEMENT add FOREIGN KEY(PRIV_ADMIN) REFERENCES public.ES_PRIV_TEMPLATE(TEMPLATEID);


-----------2020.05.18 대시보드 통계기능 관련 테이블 추가-----------

--
-- Name: es_statlogicvolume; Type: TABLE; Schema: public; Owner: XEDRM5
--
CREATE TABLE public."es_statlogicvolume"
  (
    "elementid" character(16),
    "userid"    character varying(256),
    "groupid"   character varying(256),
    "folder"    numeric(14,0),
    "doc"       numeric(14,0),
    "filesize"  numeric(19,0)
  ) ;
  
  
ALTER TABLE public.es_statlogicvolume OWNER TO XEDRM5;
  
--
-- Name: es_statphyvolume; Type: TABLE; Schema: public; Owner: XEDRM5
--
CREATE TABLE public."es_statphyvolume"
  (
    "volumeid"    character(16),
    "regdate"     character varying(10),
    "usedspace"   numeric(14,0),
    "total"       numeric(14,0),
    "usablespace" numeric(14,0)
  ) ;

  
ALTER TABLE public.es_statphyvolume OWNER TO XEDRM5;
  
--
-- Name: es_statsummary; Type: TABLE; Schema: public; Owner: XEDRM5
--
CREATE TABLE public."es_statsummary"
  (
    "es_event" character varying(255),
    "userid"   character varying(256),
    "roleid"   character varying(256),
    "summary"  numeric(19,0)
  ) ;
  
ALTER TABLE public.es_statsummary OWNER TO XEDRM5;


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
  
  
  -- 20210705 : #980 캐시용 테이블 추가
CREATE TABLE public.es_cache 
	(
		CACHE_ID character varying(256), 
		CREATE_YMDTIME character varying(14)
	);
ALTER TABLE public.es_cache ADD CONSTRAINT XPK_ES_CACHE PRIMARY KEY (cache_id);
ALTER TABLE public.es_cache OWNER TO XEDRM5;

CREATE INDEX if not exists SYS_GROUP_PARENTID ON public.SYS_GROUP (PARENT_ID);



CREATE TABLE public.ES_VOLUME_HISTORY
(	
    es_id VARCHAR(20) NOT NULL, 
	es_lastmodified TIMESTAMP (6) NOT NULL, 
	es_event VARCHAR(255), 
	es_elementid VARCHAR(20), 
	es_volumeid VARCHAR(20), 
	es_updatesize numeric(14), 
	es_deleted numeric(2) NOT NULL, 
	es_date TIMESTAMP (6) NOT NULL, 
	s1 VARCHAR(256), 
	s2 VARCHAR(256), 
	s3 VARCHAR(256), 
	l1 numeric, 
	l2 numeric
);
ALTER TABLE public.ES_VOLUME_HISTORY OWNER TO XEDRM5;   
ALTER TABLE public.ES_VOLUME_HISTORY ADD CONSTRAINT ES_VOLUME_HISTORY_PK PRIMARY KEY(es_id);
create index ES_VOLUME_HISTORY_idx1 on ES_VOLUME_HISTORY(es_date);
create index ES_VOLUME_HISTORY_idx2 on ES_VOLUME_HISTORY(es_deleted);
create index ES_VOLUME_HISTORY_idx3 on ES_VOLUME_HISTORY(es_volumeid);
