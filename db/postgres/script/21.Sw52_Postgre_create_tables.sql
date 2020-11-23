

CREATE TABLE public.saas_mail (
	mail_id varchar(20) NULL,
	tenant_id varchar(20) NULL,
	mail_subject varchar(1000) NULL,
	mail_addr varchar(256) NULL,
	mail_content varchar(5000) NULL,
	mail_type varchar(30) NULL,
	send_user_id varchar(20) NULL,
	send_date timestamp NULL,
	mail_status varchar(30) NULL,
	verification_code varchar(50) NULL,
	aprv_status_code varchar(30) NULL,
	user_nm varchar(128) NULL
);



-- Drop table

-- DROP TABLE public.saas_tenant;

CREATE TABLE public.saas_tenant (
	tenant_type varchar(256) NULL,
	url varchar(256) NULL,
	username varchar(256) NULL,
	passwd varchar(256) NULL,
	tenant_id varchar(256) NOT NULL,
	demo_start_date varchar(20) NULL,
	demo_end_date varchar(20) NULL,
	volume_size numeric(38) NULL,
	users_limit numeric(38) NULL,
	nonfree_start_date varchar(20) NULL,
	nonfree_end_date varchar(20) NULL,
	subscription varchar(32) NULL,
	user_id varchar(256) NULL,
	active_yn bpchar(1) NOT NULL,
	company_id varchar(256) NULL,
	payment_id varchar(20) NULL,
	disable_dt varchar(20) NULL,
	reg_dt timestamp NULL,
	chg_dt timestamp NULL,
	CONSTRAINT saas_tenant_pkey PRIMARY KEY (tenant_id)
);

-- Drop table

-- DROP TABLE public.sw_approval;

CREATE TABLE public.sw_approval (
	aprv_id varchar(22) NOT NULL,
	aprv_create_datetime timestamp NULL,
	aprv_cplt_datetime timestamp NULL,
	writer varchar(256) NULL,
	dept_id varchar(22) NULL,
	aprv_content varchar(100) NULL,
	work_place_id varchar(22) NULL,
	work_start_time varchar(20) NULL,
	work_end_time varchar(20) NULL,
	aprv_type_code varchar(30) NULL,
	work_start_date varchar(100) NULL,
	work_end_date varchar(100) NULL,
	aprv_status_code varchar(30) NULL,
	work_apply_yn bpchar(1) NULL,
	policy_id varchar(22) NULL,
	CONSTRAINT sw_approval_pkey PRIMARY KEY (aprv_id)
);


-- Drop table

-- DROP TABLE public.sw_aprv_line;

CREATE TABLE public.sw_aprv_line (
	aprv_id varchar(22) NOT NULL,
	rewriterid varchar(256) NOT NULL,
	aprv_comment varchar(2000) NULL,
	completedate timestamp NULL,
	"position" numeric(5) NULL,
	"type" varchar(20) NULL,
	aprv_status_code varchar(30) NULL,
	CONSTRAINT sw_aprv_line_pkey PRIMARY KEY (aprv_id, rewriterid)
);

-- Drop table

-- DROP TABLE public.sw_code;

CREATE TABLE public.sw_code (
	code_id varchar(30) NOT NULL,
	code_name varchar(100) NULL,
	parent_code varchar(30) NULL,
	code_type varchar(2) NULL,
	create_date timestamp NULL,
	creator varchar(128) NULL,
	modify_date timestamp NULL,
	modifier varchar(128) NULL,
	code_order numeric(38) NULL,
	use_yn bpchar(1) NULL,
	code_ref1 varchar(100) NULL,
	code_ref2 varchar(100) NULL,
	code_ref3 varchar(100) NULL,
	code_key varchar(50) NULL,
	code_enm varchar(100) NULL,
	CONSTRAINT sw_code_pkey PRIMARY KEY (code_id)
);

-- Drop table

-- DROP TABLE public.sw_company;

CREATE TABLE public.sw_company (
	company_id varchar(20) NOT NULL,
	company_name varchar(100) NULL,
	homepage varchar(100) NULL,
	address varchar(100) NULL,
	tel varchar(20) NULL,
	enabled bpchar(1) NULL,
	logo bytea NULL,
	employee_num varchar(100) NULL,
	ceo_name varchar(100) NULL,
	off_work_image varchar(3000) NULL,
	policy_id varchar(22) NULL,
	agt_include_process varchar(8000) NULL,
	agt_exclude_process varchar(8000) NULL,
	agt_log_upload_type numeric(38) NULL,
	work_place_id varchar(22) NULL,
	wizard_step numeric(38) NULL,
	sw52_gps_check_yn bpchar(1) NULL,
	CONSTRAINT sw_company_pkey PRIMARY KEY (company_id)
);

-- Drop table

-- DROP TABLE public.sw_go_out;

CREATE TABLE public.sw_go_out (
	user_id varchar(256) NOT NULL,
	work_day varchar(20) NOT NULL,
	start_time varchar(20) NULL,
	end_time varchar(20) NULL,
	"type" varchar(30) NOT NULL,
	status numeric(1) NOT NULL,
	"content" varchar(100) NULL,
	tag varchar(512) NULL,
	"year" numeric(38) NULL,
	week numeric(38) NULL,
	goout_time numeric(38) NOT NULL,
	dept_id varchar(256) NOT NULL,
	start_cputime numeric(38) NOT NULL,
	end_cputime numeric(38) NOT NULL
);

-- Drop table

-- DROP TABLE public.sw_group;

CREATE TABLE public.sw_group (
	group_id varchar(256) NOT NULL,
	reg_id varchar(256) NULL,
	reg_dt timestamp NULL,
	chg_id varchar(256) NULL,
	chg_dt timestamp NULL,
	sw52_alarm_yn varchar(1) NULL,
	sw52_pc_lock_yn bpchar(1) NULL,
	sw52_pc_shutdown_yn bpchar(1) NULL,
	sw52_auto_commute_yn bpchar(1) NULL,
	sw52_gps_check_yn bpchar(1) NULL,
	sw52_policy_id varchar(22) NULL,
	CONSTRAINT sw_group_pkey PRIMARY KEY (group_id)
);

-- Drop table

-- DROP TABLE public.sw_holiday;

CREATE TABLE public.sw_holiday (
	holiday varchar(30) NOT NULL,
	holiday_name varchar(200) NULL,
	repeat_yn bpchar(1) NULL,
	reg_date timestamp NULL,
	reg_id varchar(256) NULL,
	CONSTRAINT sw_holiday_pkey PRIMARY KEY (holiday)
);

-- Drop table

-- DROP TABLE public.sw_notice;

CREATE TABLE public.sw_notice (
	title varchar(100) NULL,
	"content" varchar(4000) NULL,
	create_datetime timestamp NULL,
	modify_datetime timestamp NULL,
	notice_id varchar(22) NOT NULL,
	creator varchar(256) NULL,
	modifier varchar(256) NULL,
	CONSTRAINT sw_notice_pkey PRIMARY KEY (notice_id)
);

-- Drop table

-- DROP TABLE public.sw_notice_read;

CREATE TABLE public.sw_notice_read (
	notice_id varchar(22) NOT NULL,
	user_id varchar(256) NOT NULL,
	read_datetime timestamp NULL,
	CONSTRAINT sw_notice_read_pkey PRIMARY KEY (notice_id, user_id)
);

-- Drop table

-- DROP TABLE public.sw_policy;

CREATE TABLE public.sw_policy (
	policy_id varchar(22) NOT NULL,
	policy_type varchar(22) NULL,
	policy_name varchar(100) NULL,
	work_start_time varchar(11) NULL,
	work_end_time varchar(11) NULL,
	enabled bpchar(1) NULL,
	day_of_week varchar(100) NOT NULL,
	day_type varchar(100) NULL,
	lunch_start varchar(100) NULL,
	lunch_end varchar(100) NULL,
	work_place_id varchar(20) NULL,
	gps_check_yn bpchar(1) NULL,
	absence_time numeric(7) NULL,
	alarm_time varchar(100) NULL,
	agt_include_process varchar(8000) NULL,
	agt_exclude_process varchar(8000) NULL,
	agt_log_upload_period numeric(38) NULL,
	start_before_use_time numeric(38) NULL,
	temporary_use_time numeric(38) NULL,
	commute_radius float8 NULL,
	sw52_auto_commute_yn bpchar(1) NULL,
	sw52_pc_lock_yn bpchar(1) NULL,
	sw52_pc_shutdown_yn bpchar(1) NULL,
	sw52_alarm_yn bpchar(1) NULL,
	sw52_send_alarm_mins numeric(38) NULL,
	sw52_pc_commute_only_yn bpchar(1) NULL,
	deleted_yn bpchar(1) NULL,
	CONSTRAINT sw_policy_pkey PRIMARY KEY (policy_id, day_of_week)
);

-- Drop table

-- DROP TABLE public.sw_user_action;

CREATE TABLE public.sw_user_action (
	user_id varchar(256) NOT NULL,
	work_day varchar(20) NULL,
	client_ip varchar(20) NULL,
	watch_start_datetime timestamp NULL,
	process_id varchar(20) NULL,
	process_end_time timestamp NULL,
	process_name varchar(20) NULL,
	process_path varchar(256) NULL,
	caption_name varchar(4000) NULL,
	week numeric(3) NULL,
	sw_code varchar(30) NULL,
	sw_comment varchar(4000) NULL,
	rsc_type varchar(100) NULL,
	duration numeric(38) NULL,
	compact_datetime varchar(20) NOT NULL,
	"year" numeric(5) NULL
);

-- Drop table

-- DROP TABLE public.sw_work;

CREATE TABLE public.sw_work (
	user_id varchar(256) NOT NULL,
	work_day varchar(20) NOT NULL,
	policy_id varchar(20) NULL,
	work_start_time varchar(20) NULL,
	work_end_time varchar(20) NULL,
	real_start_datetime timestamp NULL,
	real_end_datetime timestamp NULL,
	work_type varchar(22) NULL,
	work_place_id varchar(100) NULL,
	over_times numeric(38) NULL,
	day_of_week varchar(100) NULL,
	lunch_start varchar(100) NULL,
	lunch_end varchar(100) NULL,
	dept_id varchar(256) NOT NULL,
	is_alarm_send varchar(1) NULL,
	"year" numeric(38) NULL,
	week numeric(38) NULL,
	tag varchar(100) NULL,
	agent_install_yn bpchar(1) NULL,
	hq_id varchar(256) NULL,
	rank1_proc_name varchar(256) NULL,
	rank1_proc_time numeric(5) NULL,
	rank2_proc_name varchar(256) NULL,
	rank2_proc_time numeric(5) NULL,
	rank3_proc_name varchar(256) NULL,
	rank3_proc_time numeric(5) NULL,
	status_id varchar(30) NULL,
	work_start_cputime numeric(38) NOT NULL,
	work_end_cputime numeric(38) NOT NULL,
	real_start_cputime numeric(38) NULL,
	real_end_cputime numeric(38) NULL,
	lunch_start_cputime numeric(38) NULL,
	lunch_end_cputime numeric(38) NULL,
	real_working_time numeric(38) NULL,
	goout_time numeric(38) NULL,
	CONSTRAINT sw_work_pkey PRIMARY KEY (work_day, user_id)
);

-- Drop table

-- DROP TABLE public.sw_work_week;

CREATE TABLE public.sw_work_week (
	user_id varchar(256) NOT NULL,
	dept_id varchar(256) NOT NULL,
	"year" varchar(30) NOT NULL,
	week numeric(3) NOT NULL,
	working_time numeric(38) NULL,
	over_time numeric(38) NULL,
	outing_time numeric(38) NULL,
	closed_time float4 NULL,
	business_trip_time float4 NULL,
	avg_start_time varchar(30) NULL,
	avg_end_time varchar(30) NULL,
	go_out_time numeric(38) NULL,
	hq_id varchar(256) NULL,
	real_working_time numeric(38) NULL,
	agent_install_yn bpchar(1) NULL,
	rank1_proc_name varchar(256) NULL,
	rank1_proc_time numeric(5) NULL,
	rank2_proc_name varchar(256) NULL,
	rank2_proc_time numeric(5) NULL,
	rank3_proc_name varchar(256) NULL,
	rank3_proc_time numeric(5) NULL,
	away_time numeric(38) NULL,
	worked_days numeric(1) NULL,
	CONSTRAINT sw_work_week_pkey PRIMARY KEY (user_id, dept_id, year, week)
);

-- Drop table

-- DROP TABLE public.sw_workplace;

CREATE TABLE public.sw_workplace (
	user_id varchar(256) NOT NULL,
	work_place_nm varchar(20) NOT NULL,
	latitude float4 NOT NULL,
	longitude float4 NOT NULL,
	create_date timestamp NULL,
	work_place_id varchar(22) NOT NULL,
	address varchar(100) NULL,
	deleted_yn bpchar(1) NULL,
	CONSTRAINT sw_workplace_pkey PRIMARY KEY (work_place_id)
);





