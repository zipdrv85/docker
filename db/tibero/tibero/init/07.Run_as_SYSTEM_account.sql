--------------------------------------------------------
--  DDL for Index T1_IDX1 
--  ** SYSTEM 계정으로 실행해야 함. 
--------------------------------------------------------
  
  DROP INDEX XEDRM5.ASYSE_DESCR;
  create index XEDRM5.T1_IDX1 on XEDRM5."ASYSELEMENT"(DESCR) indextype is ctxsys.context parameters ('sync(on commit)');
  