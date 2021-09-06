-- 반드시 관리자 계정으로 수행시켜야 하는 쿼리입니다.
-- TOC entry 3010 (class 1259 OID 17123)
-- Name: asyse_descr; Type: INDEX; Schema: XEDRM5; Owner: XEDRM5
--
DROP EXTENSION IF EXISTS pg_trgm;
CREATE EXTENSION pg_trgm SCHEMA XEDRM5;
CREATE INDEX idx_text ON XEDRM5.asyselement USING GIN("descr" gin_trgm_ops);
