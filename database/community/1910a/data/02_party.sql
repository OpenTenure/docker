--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = party, pg_catalog;

--
-- Data for Name: party; Type: TABLE DATA; Schema: party; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE party DISABLE TRIGGER ALL;



ALTER TABLE party_role ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

