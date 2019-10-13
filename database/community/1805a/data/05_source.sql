--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = source, pg_catalog;

--
-- Data for Name: archive; Type: TABLE DATA; Schema: source; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE archive DISABLE TRIGGER ALL;

INSERT INTO archive (id, name, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('archive-id', 'Land Information New Zealand Landonline', '0e20efb6-99de-11e3-860a-437de73932f9', 1, 'i', 'test', '2014-02-20 16:21:15.006');


ALTER TABLE archive ENABLE TRIGGER ALL;

--
-- Data for Name: source; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE source DISABLE TRIGGER ALL;


ALTER TABLE source ENABLE TRIGGER ALL;

SET search_path = administrative, pg_catalog;

--
-- Data for Name: source_describes_ba_unit; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE source_describes_ba_unit DISABLE TRIGGER ALL;



ALTER TABLE source_describes_ba_unit ENABLE TRIGGER ALL;

--
-- Data for Name: source_describes_rrr; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE source_describes_rrr DISABLE TRIGGER ALL;



ALTER TABLE source_describes_rrr ENABLE TRIGGER ALL;

SET search_path = application, pg_catalog;

--
-- Data for Name: application_uses_source; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_uses_source DISABLE TRIGGER ALL;


ALTER TABLE application_uses_source ENABLE TRIGGER ALL;

SET search_path = source, pg_catalog;

--
-- Data for Name: power_of_attorney; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE power_of_attorney DISABLE TRIGGER ALL;



ALTER TABLE power_of_attorney ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_source; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE spatial_source DISABLE TRIGGER ALL;



ALTER TABLE spatial_source ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_source_measurement; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE spatial_source_measurement DISABLE TRIGGER ALL;



ALTER TABLE spatial_source_measurement ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

