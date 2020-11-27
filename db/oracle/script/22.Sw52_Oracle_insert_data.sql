INSERT INTO XEDRM5.SAAS_TENANT (TENANT_TYPE,URL,USERNAME,PASSWD,TENANT_ID,DEMO_START_DATE,DEMO_END_DATE,VOLUME_SIZE,USERS_LIMIT,NONFREE_START_DATE,NONFREE_END_DATE,SUBSCRIPTION,USER_ID,ACTIVE_YN,COMPANY_ID,PAYMENT_ID,DISABLE_DT,REG_DT,CHG_DT) VALUES 
('NONE',NULL,NULL,NULL,'public',NULL,NULL,NULL,300,NULL,NULL,'enterprise',NULL,'Y',NULL,NULL,NULL,NULL,NULL)
;


INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0604','퇴근','A06',1,'Y','','','','A0604','Work Off');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010201','연차','A0102',1,'Y','','','','A010201','Closed');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0301','기본 근로시간제','A03',1,'Y','','','','A0301','기본 근로시간제');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010101','당직근무','A0101',1,'Y','','','','On_call','On call');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010102','예비군','A0101',2,'Y','','','','Reserve_Forces','Reserve Forces');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010103','민방위','A0101',3,'Y','','','','Go_to_remote_work_directly','민방위');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010106','파견','A0101',6,'Y','','','','A010106','파견');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010107','직출','A0101',7,'Y','','','','A010107','직출');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0704','해지','A07',4,'Y','','','','A0704','Termination');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0705','비밀번호 찾기','A07',5,'Y','','','','A0705','Find Password');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0805','발송 완료','A08',1,'Y','','','','A0805','Send Completed');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010208','포상휴가','A0102',8,'Y','','','','A010208','포상휴가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010604','근무지 정정','A0106',1,'Y','','','','A010604','Workplace modification');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0605','커피','A06',1,'Y','','','','A0605','커피');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A06','외출 종류','A',1,'Y','','','','A06','외출종류');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0601','외출','A06',1,'Y','','','','A0601','외출');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0802','미승인','A08',1,'Y','','','','A0802','Not Approved');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A04','유저상태','A',1,'Y','','','','A04','	유저 상태');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0503','근무지 추가','A05',1,'Y','','','','A0503','근무지 추가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010601','근무 정책 정정','A0106',1,'Y','','','','A010601','Work policy modification');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0701','관리자가입','A07',1,'Y','','','','A0701','Admin Registration');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0702','구성원 초대','A07',2,'Y','','','','A0702','Member Invitation');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0703','만기안내','A07',3,'Y','','','','A0703','Expiration Info.');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0102','부회장','P01',2,'Y','','','','P0102','부회장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0107','상무보','P01',7,'Y','','','','P0107','상무보');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0109','이사대우','P01',9,'Y','','','','P0109','이사대우');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0121','촉탁(p)','P01',21,'Y','','','','P0121','촉탁(p)');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A','SW52H','-1',1,'Y','','','','','');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010206','산전후휴가','A0102',6,'Y','','','','A010206','산전후휴가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0118','6급','P01',18,'Y','','','','P0118','6급');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0120','촉탁','P01',18,'Y','','','','P0120','촉탁');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0103','사장','P01',3,'Y','','','','P0103','사장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0106','상무','P01',6,'Y','','','','P0106','상무');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0111','부장','P01',11,'Y','','','','P0111','부장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0115','사원','P01',15,'Y','','','','P0115','사원');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0606','식사','A06',1,'Y','','','','A0606','식사');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010105','교육(강사)','A0101',5,'N','','','','A010105','교육(강사)');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010108','복직','A0101',8,'N','','','','A010108','복직');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010109','징검다리근무','A0101',9,'N','','','','A010109','징검다리근무');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0116','4급','P01',18,'Y','','','','P0118','6급');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0107','기기 초기화','A01',5,'Y','','','','A0105','Initialize Device');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A09','현재상태','A',1,'Y','','','','A09','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0602','화장실','A06',1,'Y','','','','A0602','화장실');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0304','간주 근로시간제','A03',4,'Y','','','','A0304','간주 근로시간제');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010207','출산휴가','A0102',7,'Y','','','','A010207','출산휴가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0102','휴무','A01',2,'Y','','','','A0102','Closed');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0205','회수','A02',5,'N','','','','A0205','회수');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0203','완료','A02',3,'Y','','','','A0203','완료');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0305','재량 근로시간제','A03',5,'Y','','','','A0305','재량 근로시간제');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0112','차장','P01',12,'Y','','','','P0112','차장');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A08','이메일 상태','A',1,'Y','','','','A08','Email Status');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010204','경조휴가','A0102',4,'Y','','','','A010204','경조휴가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0502','직원요청','A05',1,'Y','','','','A0502','직원 요청');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A01','HR결재','A',1,'Y','','','','A01','HR결재');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0114','대리','P01',14,'Y','','','','P0114','대리');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0108','이사','P01',8,'Y','','','','P0108','이사');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A05','요청 타입','A',1,'Y','','','',' A05',' 요청 타입');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0117','5급','P01',17,'Y','','','','P0117','5급');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0202','승인대기','A02',2,'Y','','','','A0202','Standby for approval');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0201','진행 중','A02',1,'Y','','','','A0201','진행 중');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010203','반차(오후)','A0102',3,'Y','','','','A010203','반차(오후)');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0804','발송 오류','A08',1,'Y','','','','A0804','Send Error');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010104','교육','A0101',4,'Y','','','','A010104','교육');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0103','출장','A01',3,'Y','','','','A0103','Business trip');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0204','반려','A02',4,'Y','','','','A0204','반려');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0105','전무','P01',5,'Y','','','','P0105','전무');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0902','회의','A09',1,'Y','Y','','','A0902','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0101','회장','P01',1,'Y','','','','P0101','회장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0903','외근','A09',1,'Y','N','','','A0903','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0110','수석부장','P01',10,'Y','','','','P0110','수석부장');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010602','출퇴근 시간 정정','A0106',1,'Y','','','','A010602','Off work modification');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0904','휴식','A09',1,'Y','Y','','','A0904','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0401','활성','A04',1,'Y','','','','A04','Activation');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010202','반차(오전)','A0102',2,'Y','','','','A010202','반차(오전)');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0801','발송','A08',1,'Y','','','','A0801','To send');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0113','과장','P01',13,'Y','','','','P0113','과장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A07','이메일유형','A',1,'Y','','','','A07','Email Type');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0402','비활성','A04',1,'Y','','','','A04','Inactive');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A03','근로시간제 분류','A',1,'Y','','','','A03','근로시간제 분류');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0706','회원 가입','A07',6,'Y','','','','A0706','Member Registration');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0303','선택적 근로시간제','A03',3,'Y','','','','A0303','선택적 근로시간제');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010205','보건휴가','A0102',5,'Y','','','','A010205','보건휴가');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P01','직위','A',1,'Y','','','','P01','position');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0101','근무','A01',1,'Y','','','','A0101','Work Type');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0119','인턴','P01',18,'Y','','','','P0119','인턴');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0105','연장근로','A01',5,'Y','','','','A0105','Overtime work');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0302','탄력적 근로시간제','A03',2,'Y','','','','A0302','탄력적 근로시간제');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0603','흡연','A06',1,'Y','','','','A0603','흡연');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A02','결재 상태','A',2,'Y','','','','A02','결재 상태');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0106','정정','A01',6,'Y','','','','A0106','Modification');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('P0104','부사장','P01',4,'Y','','','','P0104','부사장');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0901','근무 중','A09',1,'Y','Y','','','A0901','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0906','출근 전','A09',1,'Y','N',NULL,NULL,'A0906','Before working');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010603','기간내 근무 정책 정정','A0106',1,'Y',NULL,NULL,NULL,'A010603','Temperary Policy modification');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010605','기본 근무지 정정','A0106',1,'Y',NULL,NULL,NULL,'A010605','Default Workplace modification');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090407','직접입력','A0904',1,'N','N','','','A090407','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0905','자리비움(인정)','A09',1,'Y','N','','','A0905','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0104','외근','A01',4,'N','','','','A0104','Outing');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0907','미출근','A09',NULL,'N','N',NULL,NULL,'A0907','Not going to work');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0908','퇴근 기록 누락','A09',NULL,'Y','N',NULL,NULL,'A09','Missing off record');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0909','결근','A09',NULL,'Y','N',NULL,NULL,'A0909','Absent');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090501','회의','A0905',1,'Y','Y','','','A090501','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090401','외출','A0904',1,'Y','N','','','A090401','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090402','화장실','A0904',1,'Y','N','','','A090402','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090403','흡연','A0904',1,'Y','N','','','A090403','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090405','커피','A0904',1,'Y','N','','','A090405','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090408','점심','A0904',2,'Y','N',NULL,NULL,'A090408','Lunch');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090409','휴식','A0904',1,'Y','Y','','','A090409','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0108','휴일','A01',7,'Y',NULL,NULL,NULL,'A0108','Holiday');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A010801','공휴일','A0108',1,'Y',NULL,NULL,NULL,'A010801','Public Holiday');

INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A090502','외근','A0905',1,'Y','Y','','','A090502','Presence');
INSERT INTO XEDRM5.sw_code (code_id,code_name,parent_code,code_order,use_yn,code_ref1,code_ref2,code_ref3,code_key,code_enm) VALUES ('A0910','자리비움(인정,비인정)-UI용','A09',1,'Y',NULL,NULL,NULL,'A0910','Away');




INSERT INTO XEDRM5.sw_company (company_id,company_name,homepage,address,tel,enabled,employee_num,ceo_name,off_work_image,policy_id,agt_include_process,agt_exclude_process,agt_log_upload_type,work_place_id,wizard_step,sw52_gps_check_yn) VALUES ('public','','http://','서울',NULL,'Y',NULL,'',NULL,'P2019103017443850355',NULL,NULL,NULL,'COMPANY',NULL,NULL);

INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','00:00:00','00:00:00','Y','0','0','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','09:00:00','18:00:00','Y','1','1','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','09:00:00','18:00:00','Y','2','1','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','09:00:00','18:00:00','Y','3','1','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','09:00:00','18:00:00','Y','4','1','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','09:00:00','18:00:00','Y','5','1','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');
INSERT INTO XEDRM5.sw_policy (policy_id,policy_type,policy_name,work_start_time,work_end_time,enabled,day_of_week,day_type,lunch_start,lunch_end,work_place_id,gps_check_yn,absence_time,alarm_time,agt_include_process,agt_exclude_process,agt_log_upload_period,start_before_use_time,temporary_use_time,commute_radius,sw52_auto_commute_yn,sw52_pc_lock_yn,sw52_pc_shutdown_yn,sw52_alarm_yn,sw52_send_alarm_mins,sw52_pc_commute_only_yn) VALUES ('P2019103017443850355','A0301','기본 근무정책(오전9시~오후6시)','00:00:00','00:00:00','Y','6','0','12:00:00','13:00:00',NULL,' ',15,'5','','',-1,60,30,0.1,'N','N','N','N',10,'N');

INSERT INTO XEDRM5.sw_workplace (user_id,work_place_nm,latitude,longitude,work_place_id,address) VALUES ('admin@inzent.com','본사',37.52361,126.92382,'COMPANY','대한민국 서울특별시 영등포구 여의도동 23-7');



