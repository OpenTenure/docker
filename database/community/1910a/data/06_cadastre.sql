--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: spatial_unit; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE spatial_unit DISABLE TRIGGER ALL;



ALTER TABLE cadastre_object ENABLE TRIGGER ALL;

--
-- Data for Name: cadastre_object_node_target; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE cadastre_object_node_target DISABLE TRIGGER ALL;



ALTER TABLE cadastre_object_node_target ENABLE TRIGGER ALL;

--
-- Data for Name: cadastre_object_target; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE cadastre_object_target DISABLE TRIGGER ALL;



ALTER TABLE cadastre_object_target ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_unit_address; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE spatial_unit_address DISABLE TRIGGER ALL;



ALTER TABLE spatial_unit_address ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_unit_group; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE spatial_unit_group DISABLE TRIGGER ALL;



ALTER TABLE spatial_unit_group ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_unit_in_group; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE spatial_unit_in_group DISABLE TRIGGER ALL;



ALTER TABLE spatial_unit_in_group ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_value_area; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE spatial_value_area DISABLE TRIGGER ALL;



ALTER TABLE spatial_value_area ENABLE TRIGGER ALL;

--
-- Data for Name: survey_point; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE survey_point DISABLE TRIGGER ALL;



ALTER TABLE survey_point ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

