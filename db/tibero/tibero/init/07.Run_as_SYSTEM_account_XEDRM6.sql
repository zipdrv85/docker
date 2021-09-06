--------------------------------------------------------
--  DDL for Index T1_IDX1 
--  ** SYSTEM 계정으로 실행해야 함. 
--------------------------------------------------------
  
  DROP INDEX XEDRM6.ASYSE_DESCR;
  create index XEDRM6.T1_IDX1 on XEDRM6."ASYSELEMENT"(DESCR) indextype is ctxsys.context parameters ('sync(on commit)');
  