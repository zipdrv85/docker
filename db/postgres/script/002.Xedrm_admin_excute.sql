-- 반드시 관리자 계정으로 수행시켜야 하는 쿼리입니다.
-- TOC entry 3010 (class 1259 OID 17123)
-- Name: asyse_descr; Type: INDEX; Schema: public; Owner: XEDRM5
--
DROP EXTENSION IF EXISTS pg_trgm;
CREATE EXTENSION pg_trgm SCHEMA public;
CREATE INDEX idx_text ON public.asyselement USING GIN("descr" gin_trgm_ops);
