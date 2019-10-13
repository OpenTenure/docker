--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = transaction, pg_catalog;

--
-- Data for Name: transaction; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE transaction DISABLE TRIGGER ALL;


ALTER TABLE transaction ENABLE TRIGGER ALL;

--
-- Data for Name: transaction_source; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE transaction_source DISABLE TRIGGER ALL;



ALTER TABLE transaction_source ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

