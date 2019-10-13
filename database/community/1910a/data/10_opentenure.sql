--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

-- Started on 2019-08-29 13:52:48 NZST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4790 (class 0 OID 23813)
-- Dependencies: 326
-- Data for Name: administrative_boundary; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.administrative_boundary DISABLE TRIGGER ALL;

INSERT INTO opentenure.administrative_boundary VALUES ('4ded5ee8-9ac1-474e-9128-2a7e39219aa7', 'test area', 'district', NULL, NULL, '010300000001000000050000001CF373A488506540E9153E3528EE46C058F3735AF05065402462D43F26EE46C0CDF27360EA506540B0BCF8EA21EF46C03EF3733C875065404B91393015EF46C01CF373A488506540E9153E3528EE46C0', 'approved', 'cb60417c-3a36-487c-8c13-9c513de31fe4', 3, 'u', 'test', '2019-10-04 09:18:15.835847', 'test');

ALTER TABLE opentenure.administrative_boundary ENABLE TRIGGER ALL;


--
-- TOC entry 4794 (class 0 OID 23848)
-- Dependencies: 330
-- Data for Name: attachment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.attachment DISABLE TRIGGER ALL;


ALTER TABLE opentenure.attachment ENABLE TRIGGER ALL;


--
-- TOC entry 4795 (class 0 OID 23859)
-- Dependencies: 331
-- Data for Name: attachment_chunk; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4796 (class 0 OID 23867)
-- Dependencies: 332
-- Data for Name: attachment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4825 (class 0 OID 24088)
-- Dependencies: 361
-- Data for Name: party; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.party DISABLE TRIGGER ALL;

INSERT INTO opentenure.party VALUES ('475051ff-dc2c-4cca-bc04-dfb5ae79635a', 'University of Otago Hockey Club', NULL, NULL, NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'test', '5a36689c-1959-4493-a20b-dd39dfc69052', 1, 'i', 'test', '2019-10-04 21:05:02.243121', false);
INSERT INTO opentenure.party VALUES ('302381ca-5dec-4588-9b05-d8057d7be6e0', 'University of Otago Hockey Club', NULL, NULL, NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'test', 'fefea10c-e14b-418a-9b16-64d06edd2e05', 1, 'i', 'test', '2019-10-04 21:05:02.243121', false);

ALTER TABLE opentenure.party ENABLE TRIGGER ALL;

--
-- TOC entry 4797 (class 0 OID 23874)
-- Dependencies: 333
-- Data for Name: claim; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.claim DISABLE TRIGGER ALL;

INSERT INTO opentenure.claim VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'moderated', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 6, 'u', 'test', '2019-10-07 22:39:38.62623', 'occupation', '1900-01-01', 'commercial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33000, NULL, '2019-10-07 22:31:25.042', NULL, NULL, NULL, NULL);

ALTER TABLE opentenure.claim ENABLE TRIGGER ALL;

--
-- TOC entry 4798 (class 0 OID 23888)
-- Dependencies: 334
-- Data for Name: claim_comment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4799 (class 0 OID 23899)
-- Dependencies: 335
-- Data for Name: claim_comment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4800 (class 0 OID 23906)
-- Dependencies: 336
-- Data for Name: claim_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

--
-- TOC entry 4801 (class 0 OID 23913)
-- Dependencies: 337
-- Data for Name: claim_location; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4802 (class 0 OID 23925)
-- Dependencies: 338
-- Data for Name: claim_location_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 339
-- Name: claim_nr_seq; Type: SEQUENCE SET; Schema: opentenure; Owner: postgres
--

SELECT pg_catalog.setval('opentenure.claim_nr_seq', 7, true);


--
-- TOC entry 4804 (class 0 OID 23934)
-- Dependencies: 340
-- Data for Name: claim_share; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.claim_share DISABLE TRIGGER ALL;

INSERT INTO opentenure.claim_share VALUES ('98b15511-8c68-4bc5-b2f8-9a6130fa2b19', '4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', NULL, NULL, '59148fe7-4c9a-469f-9105-7c01f1aece50', 1, 'i', 'test', '2019-10-04 21:05:02.243121', 100, 'a', NULL, NULL);

ALTER TABLE opentenure.claim_share ENABLE TRIGGER ALL;

--
-- TOC entry 4805 (class 0 OID 23942)
-- Dependencies: 341
-- Data for Name: claim_share_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4807 (class 0 OID 23954)
-- Dependencies: 343
-- Data for Name: claim_uses_attachment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.claim_uses_attachment DISABLE TRIGGER ALL;


ALTER TABLE opentenure.claim_uses_attachment ENABLE TRIGGER ALL;


--
-- TOC entry 4808 (class 0 OID 23961)
-- Dependencies: 344
-- Data for Name: claim_uses_attachment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4823 (class 0 OID 24070)
-- Dependencies: 359
-- Data for Name: form_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4838 (class 0 OID 24180)
-- Dependencies: 374
-- Data for Name: section_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4816 (class 0 OID 24025)
-- Dependencies: 352
-- Data for Name: field_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4809 (class 0 OID 23965)
-- Dependencies: 345
-- Data for Name: field_constraint; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4810 (class 0 OID 23975)
-- Dependencies: 346
-- Data for Name: field_constraint_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4811 (class 0 OID 23982)
-- Dependencies: 347
-- Data for Name: field_constraint_option; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4812 (class 0 OID 23993)
-- Dependencies: 348
-- Data for Name: field_constraint_option_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
--
-- TOC entry 4836 (class 0 OID 24162)
-- Dependencies: 372
-- Data for Name: section_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4834 (class 0 OID 24151)
-- Dependencies: 370
-- Data for Name: section_element_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4814 (class 0 OID 24007)
-- Dependencies: 350
-- Data for Name: field_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4815 (class 0 OID 24018)
-- Dependencies: 351
-- Data for Name: field_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4817 (class 0 OID 24036)
-- Dependencies: 353
-- Data for Name: field_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 356
-- Name: form_nr_seq; Type: SEQUENCE SET; Schema: opentenure; Owner: postgres
--

-- SELECT pg_catalog.setval('opentenure.form_nr_seq', 1, false);


--
-- TOC entry 4822 (class 0 OID 24066)
-- Dependencies: 358
-- Data for Name: form_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4824 (class 0 OID 24081)
-- Dependencies: 360
-- Data for Name: form_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4826 (class 0 OID 24100)
-- Dependencies: 362
-- Data for Name: party_for_claim_share; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--
ALTER TABLE opentenure.party_for_claim_share DISABLE TRIGGER ALL;

INSERT INTO opentenure.party_for_claim_share VALUES ('302381ca-5dec-4588-9b05-d8057d7be6e0', '98b15511-8c68-4bc5-b2f8-9a6130fa2b19', '0dd8566a-7343-4746-8b37-d8cbd4f72d0a', 1, 'i', 'test', '2019-10-04 21:05:02.243121');

ALTER TABLE opentenure.party_for_claim_share ENABLE TRIGGER ALL;

--
-- TOC entry 4827 (class 0 OID 24107)
-- Dependencies: 363
-- Data for Name: party_for_claim_share_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4832 (class 0 OID 24137)
-- Dependencies: 368
-- Data for Name: restriction; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4828 (class 0 OID 24111)
-- Dependencies: 364
-- Data for Name: party_for_restriction; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4829 (class 0 OID 24118)
-- Dependencies: 365
-- Data for Name: party_for_restriction_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4830 (class 0 OID 24122)
-- Dependencies: 366
-- Data for Name: party_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4833 (class 0 OID 24147)
-- Dependencies: 369
-- Data for Name: restriction_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4835 (class 0 OID 24158)
-- Dependencies: 371
-- Data for Name: section_element_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4837 (class 0 OID 24173)
-- Dependencies: 373
-- Data for Name: section_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 4839 (class 0 OID 24191)
-- Dependencies: 375
-- Data for Name: section_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



-- Completed on 2019-08-29 13:52:49 NZST

--
-- PostgreSQL database dump complete
--

