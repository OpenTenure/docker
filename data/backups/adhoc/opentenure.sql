--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-10-08 16:53:52 NZDT

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
-- TOC entry 5546 (class 0 OID 24970)
-- Dependencies: 339
-- Data for Name: administrative_boundary_status; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.administrative_boundary_status VALUES ('approved', 'Approved', 'c', 'Approved');
INSERT INTO opentenure.administrative_boundary_status VALUES ('pending', 'Pending', 'c', 'Pending');


--
-- TOC entry 5547 (class 0 OID 24977)
-- Dependencies: 340
-- Data for Name: administrative_boundary_type; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.administrative_boundary_type VALUES ('district', 'District', 'c', 1, 'District');
INSERT INTO opentenure.administrative_boundary_type VALUES ('village', 'Village::::::::::::::::::::::::::::::::::::', 'c', 2, 'Village::::::::::::::::::::::::::::::::::::');


--
-- TOC entry 5544 (class 0 OID 24950)
-- Dependencies: 337
-- Data for Name: administrative_boundary; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.administrative_boundary VALUES ('4ded5ee8-9ac1-474e-9128-2a7e39219aa7', 'test area', 'district', NULL, NULL, '010300000001000000050000001CF373A488506540E9153E3528EE46C058F3735AF05065402462D43F26EE46C0CDF27360EA506540B0BCF8EA21EF46C03EF3733C875065404B91393015EF46C01CF373A488506540E9153E3528EE46C0', 'approved', 'cb60417c-3a36-487c-8c13-9c513de31fe4', 3, 'u', 'test', '2019-10-04 09:18:15.835847', 'test');


--
-- TOC entry 5545 (class 0 OID 24963)
-- Dependencies: 338
-- Data for Name: administrative_boundary_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.administrative_boundary_historic VALUES ('4ded5ee8-9ac1-474e-9128-2a7e39219aa7', 'test area', 'district', NULL, NULL, '010300000001000000050000002AF373A488506540E7153E3528EE46C065F3735AF05065402162D43F26EE46C0D5F27360EA506540B6BCF8EA21EF46C040F3733C875065404F91393015EF46C02AF373A488506540E7153E3528EE46C0', 'pending', 'cb60417c-3a36-487c-8c13-9c513de31fe4', 1, 'i', 'test', '2019-10-04 09:17:25.738649', '2019-10-04 09:17:59.595307', 'test');
INSERT INTO opentenure.administrative_boundary_historic VALUES ('4ded5ee8-9ac1-474e-9128-2a7e39219aa7', 'test area', 'district', NULL, NULL, '010300000001000000050000001CF373A488506540EB153E3528EE46C059F3735AF05065402362D43F26EE46C0CDF27360EA506540B0BCF8EA21EF46C03EF3733C875065404B91393015EF46C01CF373A488506540EB153E3528EE46C0', 'pending', 'cb60417c-3a36-487c-8c13-9c513de31fe4', 2, 'u', 'test', '2019-10-04 09:17:59.595307', '2019-10-04 09:18:15.835847', 'test');


--
-- TOC entry 5548 (class 0 OID 24985)
-- Dependencies: 341
-- Data for Name: attachment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5549 (class 0 OID 24996)
-- Dependencies: 342
-- Data for Name: attachment_chunk; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5550 (class 0 OID 25004)
-- Dependencies: 343
-- Data for Name: attachment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5560 (class 0 OID 25084)
-- Dependencies: 353
-- Data for Name: claim_status; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.claim_status VALUES ('withdrawn', 'Withdrawn::::::::سحبت::::Renoncé::::Retirado::::I tërhequr::::Retirado::::ដកចេញ::::撤回::::ရုပ်သိမ်းခြင်း', 'c', 'Status for withdrawn claims::::::::حالة الادعاءات التي تم سحبها::::Statut pour les déclarations renoncées::::Estado de alegaciones retiradas::::Statusi për pretendimet e tërhequra::::Estado dos requerimentos retirados::::ស្ថានភាពសម្រាប់ការចកចេញនៃបណ្តឹងទាមទា::::撤回请求状态::::ရုပ်သိမ်းထားခြင်း အခြေအနေရှိသည့် အဆိုပြုမှုများ');
INSERT INTO opentenure.claim_status VALUES ('rejected', 'Rejected::::::::رفضت::::Rejetée::::Rechazado::::I refuzuar::::Excluido::::បានច្រានចោល::::被拒绝::::ပယ်ချခြင်း', 'c', 'Status for rejected claims::::::::حالة الادعاءات المرفوضة::::Statut pour les déclarations rejetées::::Estatus de las peticiones rechazadas::::Statusi për pretendimet e refuzuara::::Estado dos requerimentos excluidos::::ស្ថានភាពសម្រាប់ការច្រានចោលបណ្តឹងទាមទា::::拒绝请求状态::::ပယ်ချထားသော အခြေအနေရှိသည့် အဆိုပြုမှုများ');
INSERT INTO opentenure.claim_status VALUES ('created', 'Created::::::::أنشئت::::Créée::::Creado::::I krijuar::::Criado::::បានបង្កើតហើយ::::已创建::::စတင်ပြုလုပ်ခြင်း', 'i', 'Statut pour les déclarations créées::::::::حالة الادعاءات التي تم انشاؤها::::::::Estado de las declaraciones creadas::::Statusi për pretendimet e krijuara::::Estado dos requerimentos criados::::Statut pour les déclarations créées::::Statut pour les déclarations créées::::စတင်ပြုလုပ်သည့် အခြေအနေရှိ အဆိုပြုမှုများ');
INSERT INTO opentenure.claim_status VALUES ('moderated', 'Moderated::::::::عدلت::::Modéré::::Moderado::::I moderuar::::Moderado::::មធ្យម::::已调整::::ညှိနှိုင်းပြင်ဆင်ထားခြင်း', 'i', 'Statut pour les déclarations modérées::::::::حالة الأدعاءات التي تم تعديلها::::::::Estado de las declaraciones moderadas::::Statusi për pretendimet e moderuara::::Estado dos requerimentos moderados::::Statut pour les déclarations modérées::::Statut pour les déclarations modérées::::ညှိနှိုင်းပြင်ဆင်သော အခြေအနေရှိသည့် အဆိုပြုမှုများ');
INSERT INTO opentenure.claim_status VALUES ('reviewed', 'Reviewed::::::::روجعت::::Revue::::Revisado::::I rishikuar::::Revisado::::បានត្រួតពិនិត្យឡើងវិញ::::已审查::::ပြန်လည်သုံးသပ်ခြင်း', 'c', 'Status for reviewed claims::::::::حالة الادعاءات التي تم مراجعتها::::Statut pour les déclarations revues::::Estatus de reclamaciones revisadas::::Statusi për pretendimet e rishikuara::::Estado dos requerimentos revisados::::ស្ថានភាពសម្រាប់ការត្រួតពិនិត្យឡើងវិញនៃបណ្តឹងទាមទា::::复查请求状态::::အဆိုပြုမှုကို ပြန်လည်သုံးသပ်ခြင်း အဆင့်');
INSERT INTO opentenure.claim_status VALUES ('unmoderated', 'Un-moderated::::::::لم تعدل::::Non modéré::::No moderado::::I pa moderuar::::Não moderado::::មិនទំហំមធ្យម::::未调整::::ညှိနှိုင်းပြင်ဆင်မှု မလုပ်ရသေးခြင်း', 'i', 'Statut pour les déclarations non modérées::::::::حالة الأدعاءات التي لم يتم تعديلها::::::::Estado de las declaraciones no moderados::::Statusi për pretendimet e pa moderuara::::Estado dos requerimentos não moderados::::Statut pour les déclarations non modérées::::Statut pour les déclarations non modérées::::ညှိနှိုင်းပြင်ဆင်မှု မလုပ်ရသေးသည့် အဆိုပြုမှုများ');
INSERT INTO opentenure.claim_status VALUES ('issued', 'Issued', 'c', 'Final status for the claim, indicating it is issued to the owner');
INSERT INTO opentenure.claim_status VALUES ('historic', 'Historic', 'c', 'Historic status, indicating that parcel was split or merged.');


--
-- TOC entry 5579 (class 0 OID 25225)
-- Dependencies: 372
-- Data for Name: party; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.party VALUES ('475051ff-dc2c-4cca-bc04-dfb5ae79635a', 'University of Otago Hockey Club', NULL, NULL, NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'test', '5a36689c-1959-4493-a20b-dd39dfc69052', 1, 'i', 'test', '2019-10-04 21:05:02.243121', false);
INSERT INTO opentenure.party VALUES ('302381ca-5dec-4588-9b05-d8057d7be6e0', 'University of Otago Hockey Club', NULL, NULL, NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'test', 'fefea10c-e14b-418a-9b16-64d06edd2e05', 1, 'i', 'test', '2019-10-04 21:05:02.243121', false);


--
-- TOC entry 5585 (class 0 OID 25267)
-- Dependencies: 378
-- Data for Name: rejection_reason; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.rejection_reason VALUES ('inconclusiveEvidence', 'Documentary evidence provided is insufficient to substantiate the claim to the tenure rights::::::::::::::::::::::::::::::::::::မြေယာရပိုင်ခွင့် အဆိုပြုမှုကို အခိုင်အမာ အထောက်အပံ့ ပေးနိုင်သော စာရွက်စာတမ်း အထောက်အထား အလုံအလောက် မပြနိုင်ခြင်း', 'c', 'Inconclusive evidence::::::::::::::::::::::::::::::::::::မပြည့်စုံသော သက်သေအထောက်အထားများ');
INSERT INTO opentenure.rejection_reason VALUES ('others', 'Other reasons::::::::::::::::::::::::::::::::::::အခြား အကြောင်းပြချက်များ', 'c', 'Other reasons::::::::::::::::::::::::::::::::::::အခြား အကြောင်းပြချက်များ');
INSERT INTO opentenure.rejection_reason VALUES ('validityOfEvidence', 'There are significant doubts concerning the validity of the documentary evidence provided in support of the claim to tenure rights::::::::::::::::::::::::::::::::::::မြေယာအဆိုပြုမှုကို အထောက်အပံ့ပြုသော အထောက်အထားများ၏ ခိုင်မာမှုနှင့် စပ်လျဉ်း၍ သံသယဖြစ်ဖွယ် အချက်များ အများအပြား ပါဝင်နေသည်။', 'c', 'Invalid evidence::::::::::::::::::::::::::::::::::::ခိုင်လုံမှုမရှိသော သက်သေအထောက်အထား ');
INSERT INTO opentenure.rejection_reason VALUES ('alternativeProcess', 'An alternative process must be completed before the claim to these tenure rights can be considered::::::::::::::::::::::::::::::::::::လုပ်ပိုင်ခွင့် အခွင့်အရေးများ အဆိုပြုမှု အပေါ် မစဉ်းစားခင် သမားရိုးကျ မဟုတ်သော ဖြစ်စဉ်တစ်ခု ရှိခဲ့သလား', 'c', 'Alternative process::::::::::::::::::::::::::::::::::::သမားရိုးကျ မဟုတ်သော ဖြစ်စဉ်များ ');
INSERT INTO opentenure.rejection_reason VALUES ('boundaryUnclear', 'The definition of the boundaries (of the claimed tenure rights) is missing from the claim, unclear, incorrectly defined or subject to an unresolved boundary dispute::::::::::::::::::::::::::::::::::::မြေအဆိုပြုမှုတွင် (မြေယာပိုင်ဆိုင်ခွင့် အရ) နယ်နမိတ် သတ်မှတ်သည့် အချက်အလက်များ မပြည့်စုံခြင်း၊ မှန်ကန်ရှင်းလင်းမှု မရှိခြင်း၊ ဖြေရှင်းရ ခက်သော နယ်နမိတ် အငြင်းပွားမှုမျိုး ရှိနေခြင်း။', 'c', 'Boundary unclear::::::::::::::::::::::::::::::::::::နယ်နမိတ် မရှင်းလင်းခြင်း');
INSERT INTO opentenure.rejection_reason VALUES ('missingEvidence', 'Documentary evidence in support of the claimed tenure rights is missing::::::::::::::::::::::::::::::::::::မြေယာရပိုင်ခွင့် အဆိုပြုမှုကို အထောက်အပံ့ ပေးနိုင်သော စာရွက်စာတမ်း အထောက်အထားများ မပြည့်စုံခြင်း', 'c', 'Missing evidence::::::::::::::::::::::::::::::::::::သက်သေအထောက်အထား မပြည့်စုံခြင်း');


--
-- TOC entry 5594 (class 0 OID 25335)
-- Dependencies: 387
-- Data for Name: termination_reason; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5551 (class 0 OID 25011)
-- Dependencies: 344
-- Data for Name: claim; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.claim VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'moderated', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 6, 'u', 'test', '2019-10-07 22:39:38.62623', 'occupation', '1900-01-01', 'commercial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33000, NULL, '2019-10-07 22:31:25.042', NULL, NULL, NULL, NULL);


--
-- TOC entry 5552 (class 0 OID 25025)
-- Dependencies: 345
-- Data for Name: claim_comment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5553 (class 0 OID 25036)
-- Dependencies: 346
-- Data for Name: claim_comment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5554 (class 0 OID 25043)
-- Dependencies: 347
-- Data for Name: claim_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.claim_historic VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', NULL, NULL, NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'created', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 1, 'i', 'test', '2019-10-04 21:05:02.243121', '2019-10-04 21:05:12.279263', 'occupation', NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'commercial', NULL, 33000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO opentenure.claim_historic VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'unmoderated', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 2, 'u', 'test', '2019-10-04 21:05:12.279263', '2019-10-04 21:11:57.044154', 'occupation', NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'commercial', NULL, 33000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO opentenure.claim_historic VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'moderated', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 3, 'u', 'test', '2019-10-04 21:11:57.044154', '2019-10-04 21:12:30.329584', 'occupation', NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'commercial', NULL, 33000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO opentenure.claim_historic VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'moderated', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 4, 'u', 'test', '2019-10-04 21:12:30.329584', '2019-10-07 22:31:24.994303', 'occupation', NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'commercial', NULL, 33000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO opentenure.claim_historic VALUES ('4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', 'sola-cs-docker-v191019100003', '2019-10-04 21:05:12.373', '2019-11-03 21:05:12.376', NULL, 'University hockey fields', NULL, '475051ff-dc2c-4cca-bc04-dfb5ae79635a', '0103000000010000000500000002F253A5A750654004C5B5EFBCEE46C018F3D39EB550654061D5FE5BCCEE46C019F21318B1506540CE837892EBEE46C021F3D329A35065409D2695E7DBEE46C002F253A5A750654004C5B5EFBCEE46C0', NULL, 'issued', 'test', 'f303b535-8acf-415f-9255-f55201006c8a', 5, 'u', 'test', '2019-10-07 22:31:24.994303', '2019-10-07 22:39:38.62623', 'occupation', NULL, '1900-01-01', NULL, NULL, NULL, NULL, NULL, 'commercial', NULL, 33000, NULL, '2019-10-07 22:31:25.042', NULL, NULL, NULL, NULL);


--
-- TOC entry 5555 (class 0 OID 25050)
-- Dependencies: 348
-- Data for Name: claim_location; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5556 (class 0 OID 25062)
-- Dependencies: 349
-- Data for Name: claim_location_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5558 (class 0 OID 25071)
-- Dependencies: 351
-- Data for Name: claim_share; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.claim_share VALUES ('98b15511-8c68-4bc5-b2f8-9a6130fa2b19', '4fd0ee9f-1d38-4bc9-be27-44aeaf59454d', NULL, NULL, '59148fe7-4c9a-469f-9105-7c01f1aece50', 1, 'i', 'test', '2019-10-04 21:05:02.243121', 100, 'a', NULL, NULL);


--
-- TOC entry 5559 (class 0 OID 25079)
-- Dependencies: 352
-- Data for Name: claim_share_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5561 (class 0 OID 25091)
-- Dependencies: 354
-- Data for Name: claim_uses_attachment; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5562 (class 0 OID 25098)
-- Dependencies: 355
-- Data for Name: claim_uses_attachment_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5567 (class 0 OID 25137)
-- Dependencies: 360
-- Data for Name: field_constraint_type; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.field_constraint_type VALUES ('OPTION', 'OPTION::::::::خيار::::OPTION::::OPCION::::OPTION::::OPÇÃO::::ជម្រើស::::选择::::OPTION', 'c', 'OPTION::::::::خيار::::::::OPCION::::Mundësi::::OPÇÃO::::ជម្រើស​::::选择::::OPTION');
INSERT INTO opentenure.field_constraint_type VALUES ('DATETIME', 'DATETIME::::::::تاريخ_وقت::::DATE ET HEURE::::FECHAHORA::::DATAORA::::DATA E HORA::::ពេលវេលាការបរិច្ឆេទ::::日期与时间::::DATETIME', 'c', 'DATE ET HEURE::::::::التاريخ والوقت::::::::FECHAHORA::::DATA dhe ORA::::DATA E HORA::::ពេលវេលាការបរិច្ឆេទ::::日期与时间::::DATE ET HEURE');
INSERT INTO opentenure.field_constraint_type VALUES ('INTEGER', 'INTEGER::::::::رقم_صحيح::::ENTIER::::ENTERO::::INTEGER::::INTEIRO::::លេខគត::::整数::::INTEGER', 'c', 'ENTIER::::::::رقم صحيح::::::::ENTERO::::Numër i plotë::::INTEIRO::::ទាំងស្រុង::::全部::::ENTIER');
INSERT INTO opentenure.field_constraint_type VALUES ('NOT_NULL', 'NOT_NULL::::::::غير_فارغ::::NON NUL::::NO NULO::::NOT_NULL::::NÃO_NULO::::NOT_NULL::::不能为空::::NOT_NULL', 'c', 'NON NUL::::::::حقل غير فارغ::::::::NO NULO::::Jo bosh::::NÃO NULO::::NON NUL::::非空::::NON NUL');
INSERT INTO opentenure.field_constraint_type VALUES ('INTEGER_RANGE', 'INTEGER_RANGE::::::::مدى_الرقم_الصحيح::::PLAGE ENTIER::::RANGO ENTERO::::INTEGER_RANGE::::ALCANCE_INTEIRO::::លេខគត_រាយពី::::整数 区间::::INTEGER_RANGE', 'c', 'PLAGE ENTIER::::::::مدى الرقم الصحيح::::::::RANGO ENTERO::::Varg i plotë::::ALCANCE INTEIRO::::តំបន់ទាំងមូល::::谱斑块::::PLAGE ENTIER');
INSERT INTO opentenure.field_constraint_type VALUES ('DOUBLE_RANGE', 'DOUBLE_RANGE::::::::مدى_العدد_العشري::::PLAGE DOUBLE::::DOBLE RANGO::::DOUBLE_RANGE::::ALCANCE_DUPLO::::ទ្វេរដង_រាយពី::::双_量程::::DOUBLE_RANGE', 'c', 'PLAGE DOUBLE::::::::مدى العدد العشري::::::::DOBLE RANGO::::Varg i dyfishtë::::ALCANCE DUPLO::::ទ្វេរដងទេ្វរដង::::双谱斑::::PLAGE DOUBLE');
INSERT INTO opentenure.field_constraint_type VALUES ('REGEXP', 'REGEXP::::::::تعبير_مركب::::REGEXP::::REGEXP::::REGEXP::::REGEXP::::REGEXP::::正则表达式::::REGEXP', 'c', 'REGEXP::::::::تعبير مركب::::::::REGEXP::::REGEXP::::REGEXP::::REGEXP::::正则表达式::::REGEXP');
INSERT INTO opentenure.field_constraint_type VALUES ('LENGTH', 'LENGTH::::::::طول::::LONGUEUR::::LONGITUD::::LENGTH::::COMPRIMENTO::::រយះពេល::::长度::::LENGTH', 'c', 'LONGUEUR::::::::طول الحقل::::::::LONGITUD::::Gjatësi::::COMPRIMENTO::::LONGUEUR::::乏味的部分::::LONGUEUR');


--
-- TOC entry 5572 (class 0 OID 25180)
-- Dependencies: 365
-- Data for Name: field_type; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.field_type VALUES ('BOOL', 'BOOL::::::::منطقي::::BOOL::::BOOL::::BOOL::::BOOL::::BOOL::::布尔数据类型::::BOOL', 'c', 'BOOL::::::::منطقي::::::::BOOL::::True/False::::BOOL::::BOOL::::布尔数据类型::::BOOL');
INSERT INTO opentenure.field_type VALUES ('TEXT', 'TEXT::::::::نص::::TEXTE::::TEXTO::::TEXT::::TEXTO::::អត្ដបទ::::文本::::TEXT', 'c', 'TEXTE::::::::نص::::::::TEXTO::::Tekst::::TEXTO::::អត្ដបទ::::文件::::TEXTE');
INSERT INTO opentenure.field_type VALUES ('INTEGER', 'INTEGER::::::::رقم صحيح::::ENTIER::::ENTERO::::INTEGER::::INTEIRO::::លេខគត::::整数::::INTEGER', 'c', 'ENTIER::::::::رقم صحيح::::::::ENTERO::::Numër i plotë::::INTEIRO::::ទាំងមូល::::全部::::ENTIER');
INSERT INTO opentenure.field_type VALUES ('DECIMAL', 'DECIMAL::::::::رقم عشري::::DECIMAL::::DECIMAL::::DECIMAL::::DECIMAL::::លេខទសភាគ::::十进位制::::DECIMAL', 'c', 'DECIMAL::::::::رقم عشري::::::::DECIMAL::::Numër dhjetor::::DECIMAL::::លេខទសភាគ::::十进位制::::DECIMAL');
INSERT INTO opentenure.field_type VALUES ('DATE', 'DATE::::::::التاريخ::::DATE::::FECHA::::DATE::::DATA::::កាលបរិច្ឆេទ::::日期::::DATE', 'c', 'DATE::::::::التاريخ::::::::FECHA::::DATA::::DATA::::កាលបរិច្ឆេទ::::日期::::DATE');


--
-- TOC entry 5577 (class 0 OID 25207)
-- Dependencies: 370
-- Data for Name: form_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5592 (class 0 OID 25317)
-- Dependencies: 385
-- Data for Name: section_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5570 (class 0 OID 25162)
-- Dependencies: 363
-- Data for Name: field_template; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5563 (class 0 OID 25102)
-- Dependencies: 356
-- Data for Name: field_constraint; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5564 (class 0 OID 25112)
-- Dependencies: 357
-- Data for Name: field_constraint_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5565 (class 0 OID 25119)
-- Dependencies: 358
-- Data for Name: field_constraint_option; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5566 (class 0 OID 25130)
-- Dependencies: 359
-- Data for Name: field_constraint_option_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5573 (class 0 OID 25187)
-- Dependencies: 366
-- Data for Name: field_value_type; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.field_value_type VALUES ('TEXT', 'TEXT::::::::نص::::TEXTE::::TEXTO::::TEXT::::TEXTO::::អត្ដបទ::::文本::::TEXT', 'c', 'TEXTE::::::::نص::::::::TEXTO::::Tekst::::TEXTO::::អត្ដបទ::::文件::::TEXTE');
INSERT INTO opentenure.field_value_type VALUES ('NUMBER', 'NUMBER::::::::عدد::::NUMERO::::NUMERO::::NUMBER::::NÚMERO::::លេខ::::数字::::NUMBER', 'c', 'NUMERO::::::::عدد::::::::NUMERO::::Numër::::NÚMERO::::លេខ::::头号::::NUMERO');
INSERT INTO opentenure.field_value_type VALUES ('BOOL', 'BOOL::::::::منطقي::::BOOL::::BOOL::::BOOL::::BOOL::::BOOL::::布尔数据类型::::BOOL', 'c', 'BOOL::::::::منطقي::::::::BOOL::::True/False::::BOOL::::BOOL::::布尔数据类型::::BOOL');


--
-- TOC entry 5575 (class 0 OID 25196)
-- Dependencies: 368
-- Data for Name: form_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5590 (class 0 OID 25299)
-- Dependencies: 383
-- Data for Name: section_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5588 (class 0 OID 25288)
-- Dependencies: 381
-- Data for Name: section_element_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5568 (class 0 OID 25144)
-- Dependencies: 361
-- Data for Name: field_payload; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5569 (class 0 OID 25155)
-- Dependencies: 362
-- Data for Name: field_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5571 (class 0 OID 25173)
-- Dependencies: 364
-- Data for Name: field_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5576 (class 0 OID 25203)
-- Dependencies: 369
-- Data for Name: form_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5578 (class 0 OID 25218)
-- Dependencies: 371
-- Data for Name: form_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5580 (class 0 OID 25237)
-- Dependencies: 373
-- Data for Name: party_for_claim_share; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

INSERT INTO opentenure.party_for_claim_share VALUES ('302381ca-5dec-4588-9b05-d8057d7be6e0', '98b15511-8c68-4bc5-b2f8-9a6130fa2b19', '0dd8566a-7343-4746-8b37-d8cbd4f72d0a', 1, 'i', 'test', '2019-10-04 21:05:02.243121');


--
-- TOC entry 5581 (class 0 OID 25244)
-- Dependencies: 374
-- Data for Name: party_for_claim_share_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5586 (class 0 OID 25274)
-- Dependencies: 379
-- Data for Name: restriction; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5582 (class 0 OID 25248)
-- Dependencies: 375
-- Data for Name: party_for_restriction; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5583 (class 0 OID 25255)
-- Dependencies: 376
-- Data for Name: party_for_restriction_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5584 (class 0 OID 25259)
-- Dependencies: 377
-- Data for Name: party_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5587 (class 0 OID 25284)
-- Dependencies: 380
-- Data for Name: restriction_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5589 (class 0 OID 25295)
-- Dependencies: 382
-- Data for Name: section_element_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5591 (class 0 OID 25310)
-- Dependencies: 384
-- Data for Name: section_payload_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5593 (class 0 OID 25328)
-- Dependencies: 386
-- Data for Name: section_template_historic; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--



--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 350
-- Name: claim_nr_seq; Type: SEQUENCE SET; Schema: opentenure; Owner: postgres
--

SELECT pg_catalog.setval('opentenure.claim_nr_seq', 3, true);


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 367
-- Name: form_nr_seq; Type: SEQUENCE SET; Schema: opentenure; Owner: postgres
--

SELECT pg_catalog.setval('opentenure.form_nr_seq', 1, false);


-- Completed on 2019-10-08 16:53:53 NZDT

--
-- PostgreSQL database dump complete
--

