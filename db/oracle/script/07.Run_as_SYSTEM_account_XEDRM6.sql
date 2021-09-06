--------------------------------------------------------
--  DDL for Index T1_IDX1 
--  ** SYSTEM 계정으로 실행해야 함. 
--------------------------------------------------------
  
  create index T1_IDX1 on XEDRM6."ASYSELEMENT"(DESCR) indextype is ctxsys.context parameters ('sync(on commit)');
  
  exec ctx_ddl.create_preference ( 'mystore', 'BASIC_STORAGE'); 
  exec ctx_ddl.set_attribute ( 'mystore', 'STAGE_ITAB', 'YES');
  