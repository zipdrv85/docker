-- CREATE TABLESPACE
 CREATE TABLESPACE XEDRM5_TABLESPACE
  DATAFILE 'xedm.dbf' SIZE 50M
  AUTOEXTEND ON NEXT 4M MAXSIZE UNLIMITED ; 

-- 사용자 생성 중 아래 오류 출력 시 주석처리된 쿼리 실행 (12c 버전 이후 공통 사용자 생성 시 c## 를 붙여야함.) 
-- ORA-65096: 공통 사용자 또는 롤 이름이 부적합합니다.
-- ALTER SESSION SET "_ORACLE_SCRIPT"=true;
 
-- USER SQL
CREATE USER "XEDRM5" IDENTIFIED BY "XEDRM5"  
DEFAULT TABLESPACE "XEDRM5_TABLESPACE"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER "XEDRM5" QUOTA UNLIMITED ON "XEDRM5_TABLESPACE";

-- ROLES
GRANT "CONNECT" TO "XEDRM5" ;
GRANT "RESOURCE" TO "XEDRM5" ;
GRANT CREATE VIEW TO "XEDRM5";
GRANT CREATE DATABASE LINK TO XEDRM5;

-- SYSTEM PRIVILEGES
