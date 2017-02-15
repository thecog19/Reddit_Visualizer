--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: christiancarey1
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-02-15 16:31:07.243495	2017-02-15 16:31:07.243495
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: christiancarey1
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: christiancarey1
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: christiancarey1
--

COPY schema_migrations (version) FROM stdin;
20170210151310
20170210163350
20170214161615
\.


--
-- Data for Name: subreddit_connections; Type: TABLE DATA; Schema: public; Owner: christiancarey1
--

COPY subreddit_connections (id, subreddit_from_id, subreddit_to_id, connection_weight, created_at, updated_at) FROM stdin;
1	1	24	21	2017-02-15 16:31:48.032372	2017-02-15 16:31:48.032372
2	1	101	22	2017-02-15 16:31:48.04201	2017-02-15 16:31:48.04201
3	1	81	24	2017-02-15 16:31:48.051261	2017-02-15 16:31:48.051261
4	1	102	78	2017-02-15 16:31:48.060436	2017-02-15 16:31:48.060436
5	2	34	21	2017-02-15 16:32:20.053169	2017-02-15 16:32:20.053169
6	2	103	36	2017-02-15 16:32:20.074913	2017-02-15 16:32:20.074913
7	2	29	43	2017-02-15 16:32:20.091724	2017-02-15 16:32:20.091724
8	2	104	50	2017-02-15 16:32:20.111442	2017-02-15 16:32:20.111442
9	3	6	15	2017-02-15 16:32:52.251443	2017-02-15 16:32:52.251443
10	3	105	24	2017-02-15 16:32:52.261326	2017-02-15 16:32:52.261326
11	3	106	31	2017-02-15 16:32:52.273525	2017-02-15 16:32:52.273525
12	3	15	32	2017-02-15 16:32:52.28815	2017-02-15 16:32:52.28815
13	4	13	20	2017-02-15 16:33:22.272774	2017-02-15 16:33:22.272774
14	4	107	22	2017-02-15 16:33:22.282512	2017-02-15 16:33:22.282512
15	4	108	24	2017-02-15 16:33:22.293061	2017-02-15 16:33:22.293061
16	4	5	28	2017-02-15 16:33:22.30271	2017-02-15 16:33:22.30271
17	5	7	31	2017-02-15 16:33:49.205559	2017-02-15 16:33:49.205559
18	5	1	38	2017-02-15 16:33:49.216195	2017-02-15 16:33:49.216195
19	5	109	53	2017-02-15 16:33:49.234532	2017-02-15 16:33:49.234532
20	5	3	82	2017-02-15 16:33:49.252178	2017-02-15 16:33:49.252178
21	6	8	32	2017-02-15 16:34:17.318635	2017-02-15 16:34:17.318635
22	6	110	34	2017-02-15 16:34:17.328604	2017-02-15 16:34:17.328604
23	6	87	57	2017-02-15 16:34:17.337142	2017-02-15 16:34:17.337142
24	7	111	31	2017-02-15 16:34:52.240105	2017-02-15 16:34:52.240105
25	7	112	34	2017-02-15 16:34:52.251677	2017-02-15 16:34:52.251677
26	7	113	40	2017-02-15 16:34:52.267674	2017-02-15 16:34:52.267674
27	7	114	53	2017-02-15 16:34:52.282869	2017-02-15 16:34:52.282869
28	8	115	60	2017-02-15 16:35:24.985559	2017-02-15 16:35:24.985559
29	8	104	65	2017-02-15 16:35:24.995767	2017-02-15 16:35:24.995767
30	8	5	66	2017-02-15 16:35:25.005301	2017-02-15 16:35:25.005301
31	8	1	97	2017-02-15 16:35:25.014712	2017-02-15 16:35:25.014712
32	8	3	111	2017-02-15 16:35:25.024081	2017-02-15 16:35:25.024081
33	9	55	22	2017-02-15 16:35:54.041223	2017-02-15 16:35:54.041223
34	9	116	25	2017-02-15 16:35:54.051896	2017-02-15 16:35:54.051896
35	9	89	55	2017-02-15 16:35:54.063032	2017-02-15 16:35:54.063032
36	9	98	86	2017-02-15 16:35:54.082041	2017-02-15 16:35:54.082041
37	10	17	14	2017-02-15 16:36:21.445651	2017-02-15 16:36:21.445651
38	10	4	24	2017-02-15 16:36:21.455108	2017-02-15 16:36:21.455108
39	10	117	27	2017-02-15 16:36:21.465303	2017-02-15 16:36:21.465303
40	10	118	43	2017-02-15 16:36:21.474415	2017-02-15 16:36:21.474415
41	11	5	25	2017-02-15 16:36:48.40777	2017-02-15 16:36:48.40777
42	11	119	28	2017-02-15 16:36:48.416694	2017-02-15 16:36:48.416694
43	11	120	43	2017-02-15 16:36:48.427127	2017-02-15 16:36:48.427127
44	11	1	56	2017-02-15 16:36:48.4401	2017-02-15 16:36:48.4401
45	12	121	36	2017-02-15 16:37:18.806055	2017-02-15 16:37:18.806055
46	12	1	45	2017-02-15 16:37:18.817908	2017-02-15 16:37:18.817908
47	12	55	48	2017-02-15 16:37:18.826615	2017-02-15 16:37:18.826615
48	12	122	88	2017-02-15 16:37:18.841476	2017-02-15 16:37:18.841476
49	13	1	37	2017-02-15 16:37:50.574036	2017-02-15 16:37:50.574036
50	13	123	42	2017-02-15 16:37:50.586875	2017-02-15 16:37:50.586875
51	13	43	66	2017-02-15 16:37:50.605968	2017-02-15 16:37:50.605968
52	14	124	21	2017-02-15 16:38:22.763566	2017-02-15 16:38:22.763566
53	14	125	23	2017-02-15 16:38:22.772032	2017-02-15 16:38:22.772032
54	14	126	41	2017-02-15 16:38:22.781213	2017-02-15 16:38:22.781213
55	14	127	48	2017-02-15 16:38:22.789683	2017-02-15 16:38:22.789683
56	15	1	38	2017-02-15 16:38:54.28372	2017-02-15 16:38:54.28372
57	15	128	59	2017-02-15 16:38:54.294931	2017-02-15 16:38:54.294931
58	15	129	63	2017-02-15 16:38:54.314726	2017-02-15 16:38:54.314726
59	15	91	64	2017-02-15 16:38:54.325285	2017-02-15 16:38:54.325285
60	16	32	28	2017-02-15 16:39:24.008191	2017-02-15 16:39:24.008191
61	16	23	37	2017-02-15 16:39:24.018462	2017-02-15 16:39:24.018462
62	16	4	59	2017-02-15 16:39:24.031458	2017-02-15 16:39:24.031458
63	16	130	87	2017-02-15 16:39:24.040381	2017-02-15 16:39:24.040381
64	17	67	29	2017-02-15 16:39:53.396522	2017-02-15 16:39:53.396522
65	17	131	30	2017-02-15 16:39:53.405334	2017-02-15 16:39:53.405334
66	17	132	30	2017-02-15 16:39:53.420941	2017-02-15 16:39:53.420941
67	17	22	71	2017-02-15 16:39:53.434584	2017-02-15 16:39:53.434584
68	18	1	27	2017-02-15 16:40:22.041202	2017-02-15 16:40:22.041202
69	18	81	32	2017-02-15 16:40:22.052822	2017-02-15 16:40:22.052822
70	18	133	53	2017-02-15 16:40:22.064255	2017-02-15 16:40:22.064255
71	18	12	54	2017-02-15 16:40:22.079871	2017-02-15 16:40:22.079871
72	19	47	26	2017-02-15 16:40:49.586245	2017-02-15 16:40:49.586245
73	19	134	35	2017-02-15 16:40:49.601076	2017-02-15 16:40:49.601076
74	19	24	44	2017-02-15 16:40:49.616546	2017-02-15 16:40:49.616546
75	19	1	65	2017-02-15 16:40:49.630824	2017-02-15 16:40:49.630824
76	20	135	33	2017-02-15 16:41:22.142071	2017-02-15 16:41:22.142071
77	20	136	34	2017-02-15 16:41:22.153338	2017-02-15 16:41:22.153338
78	20	21	35	2017-02-15 16:41:22.167587	2017-02-15 16:41:22.167587
79	20	1	71	2017-02-15 16:41:22.183296	2017-02-15 16:41:22.183296
80	21	137	23	2017-02-15 16:41:52.994084	2017-02-15 16:41:52.994084
81	21	1	34	2017-02-15 16:41:53.004479	2017-02-15 16:41:53.004479
82	21	138	38	2017-02-15 16:41:53.014866	2017-02-15 16:41:53.014866
83	21	33	38	2017-02-15 16:41:53.027737	2017-02-15 16:41:53.027737
84	22	61	36	2017-02-15 16:42:23.293977	2017-02-15 16:42:23.293977
85	22	53	44	2017-02-15 16:42:23.304758	2017-02-15 16:42:23.304758
86	22	2	48	2017-02-15 16:42:23.320478	2017-02-15 16:42:23.320478
87	22	139	61	2017-02-15 16:42:23.330415	2017-02-15 16:42:23.330415
88	23	4	34	2017-02-15 16:42:59.264702	2017-02-15 16:42:59.264702
89	23	140	35	2017-02-15 16:42:59.273562	2017-02-15 16:42:59.273562
90	23	1	38	2017-02-15 16:42:59.282989	2017-02-15 16:42:59.282989
91	23	141	60	2017-02-15 16:42:59.300726	2017-02-15 16:42:59.300726
92	24	113	39	2017-02-15 16:43:28.640095	2017-02-15 16:43:28.640095
93	24	87	42	2017-02-15 16:43:28.651199	2017-02-15 16:43:28.651199
94	24	114	53	2017-02-15 16:43:28.664081	2017-02-15 16:43:28.664081
95	24	12	113	2017-02-15 16:43:28.682481	2017-02-15 16:43:28.682481
96	25	142	10	2017-02-15 16:43:55.003493	2017-02-15 16:43:55.003493
97	25	47	10	2017-02-15 16:43:55.01349	2017-02-15 16:43:55.01349
98	25	143	26	2017-02-15 16:43:55.023912	2017-02-15 16:43:55.023912
99	25	1	82	2017-02-15 16:43:55.033685	2017-02-15 16:43:55.033685
100	26	43	37	2017-02-15 16:44:25.062005	2017-02-15 16:44:25.062005
101	26	144	38	2017-02-15 16:44:25.090163	2017-02-15 16:44:25.090163
102	26	145	52	2017-02-15 16:44:25.120807	2017-02-15 16:44:25.120807
103	26	146	54	2017-02-15 16:44:25.194116	2017-02-15 16:44:25.194116
104	27	24	36	2017-02-15 16:44:55.597255	2017-02-15 16:44:55.597255
105	27	147	53	2017-02-15 16:44:55.606861	2017-02-15 16:44:55.606861
106	27	1	68	2017-02-15 16:44:55.619063	2017-02-15 16:44:55.619063
107	27	10	75	2017-02-15 16:44:55.631472	2017-02-15 16:44:55.631472
108	28	10	26	2017-02-15 16:45:20.71984	2017-02-15 16:45:20.71984
109	28	148	26	2017-02-15 16:45:20.73348	2017-02-15 16:45:20.73348
110	28	149	99	2017-02-15 16:45:20.744175	2017-02-15 16:45:20.744175
111	28	1	106	2017-02-15 16:45:20.756222	2017-02-15 16:45:20.756222
112	29	150	28	2017-02-15 16:45:53.038553	2017-02-15 16:45:53.038553
113	29	13	31	2017-02-15 16:45:53.057053	2017-02-15 16:45:53.057053
114	29	151	37	2017-02-15 16:45:53.07073	2017-02-15 16:45:53.07073
115	30	152	33	2017-02-15 16:46:25.28385	2017-02-15 16:46:25.28385
116	30	153	63	2017-02-15 16:46:25.298225	2017-02-15 16:46:25.298225
117	30	18	74	2017-02-15 16:46:25.30874	2017-02-15 16:46:25.30874
118	30	1	183	2017-02-15 16:46:25.318804	2017-02-15 16:46:25.318804
119	31	154	25	2017-02-15 16:46:54.073782	2017-02-15 16:46:54.073782
120	31	24	34	2017-02-15 16:46:54.088982	2017-02-15 16:46:54.088982
121	31	17	49	2017-02-15 16:46:54.100632	2017-02-15 16:46:54.100632
122	31	4	72	2017-02-15 16:46:54.11014	2017-02-15 16:46:54.11014
123	32	155	20	2017-02-15 16:47:26.177222	2017-02-15 16:47:26.177222
124	32	1	21	2017-02-15 16:47:26.187174	2017-02-15 16:47:26.187174
125	32	156	28	2017-02-15 16:47:26.197188	2017-02-15 16:47:26.197188
126	32	157	47	2017-02-15 16:47:26.207022	2017-02-15 16:47:26.207022
127	33	48	23	2017-02-15 16:47:55.012178	2017-02-15 16:47:55.012178
128	33	1	26	2017-02-15 16:47:55.029097	2017-02-15 16:47:55.029097
129	33	158	92	2017-02-15 16:47:55.045232	2017-02-15 16:47:55.045232
130	34	1	27	2017-02-15 16:48:25.374888	2017-02-15 16:48:25.374888
131	34	159	31	2017-02-15 16:48:25.384838	2017-02-15 16:48:25.384838
132	34	160	32	2017-02-15 16:48:25.398752	2017-02-15 16:48:25.398752
133	34	161	52	2017-02-15 16:48:25.412483	2017-02-15 16:48:25.412483
134	35	162	27	2017-02-15 16:48:57.935894	2017-02-15 16:48:57.935894
135	35	163	33	2017-02-15 16:48:57.952359	2017-02-15 16:48:57.952359
136	35	164	54	2017-02-15 16:48:57.965949	2017-02-15 16:48:57.965949
137	35	3	109	2017-02-15 16:48:57.975801	2017-02-15 16:48:57.975801
138	36	95	42	2017-02-15 16:49:29.620153	2017-02-15 16:49:29.620153
139	36	1	46	2017-02-15 16:49:29.629566	2017-02-15 16:49:29.629566
140	36	165	46	2017-02-15 16:49:29.647938	2017-02-15 16:49:29.647938
141	36	166	99	2017-02-15 16:49:29.660025	2017-02-15 16:49:29.660025
142	37	4	27	2017-02-15 16:50:01.6565	2017-02-15 16:50:01.6565
143	37	167	40	2017-02-15 16:50:01.669879	2017-02-15 16:50:01.669879
144	37	168	68	2017-02-15 16:50:01.679268	2017-02-15 16:50:01.679268
145	37	1	176	2017-02-15 16:50:01.68918	2017-02-15 16:50:01.68918
146	38	1	22	2017-02-15 16:50:33.351694	2017-02-15 16:50:33.351694
147	38	169	40	2017-02-15 16:50:33.360864	2017-02-15 16:50:33.360864
148	38	170	60	2017-02-15 16:50:33.374808	2017-02-15 16:50:33.374808
149	38	3	250	2017-02-15 16:50:33.391578	2017-02-15 16:50:33.391578
150	39	171	38	2017-02-15 16:51:03.715683	2017-02-15 16:51:03.715683
151	39	172	40	2017-02-15 16:51:03.725531	2017-02-15 16:51:03.725531
152	39	35	46	2017-02-15 16:51:03.73575	2017-02-15 16:51:03.73575
153	39	3	101	2017-02-15 16:51:03.746936	2017-02-15 16:51:03.746936
154	40	173	19	2017-02-15 16:51:34.557474	2017-02-15 16:51:34.557474
155	40	1	23	2017-02-15 16:51:34.567829	2017-02-15 16:51:34.567829
156	40	174	30	2017-02-15 16:51:34.580747	2017-02-15 16:51:34.580747
157	40	175	33	2017-02-15 16:51:34.592985	2017-02-15 16:51:34.592985
158	41	46	29	2017-02-15 16:52:04.642844	2017-02-15 16:52:04.642844
159	41	11	40	2017-02-15 16:52:04.657614	2017-02-15 16:52:04.657614
160	41	176	47	2017-02-15 16:52:04.66764	2017-02-15 16:52:04.66764
161	41	14	89	2017-02-15 16:52:04.676803	2017-02-15 16:52:04.676803
162	41	1	157	2017-02-15 16:52:04.68992	2017-02-15 16:52:04.68992
163	42	177	44	2017-02-15 16:52:31.321848	2017-02-15 16:52:31.321848
164	42	3	58	2017-02-15 16:52:31.331908	2017-02-15 16:52:31.331908
165	42	71	86	2017-02-15 16:52:31.348061	2017-02-15 16:52:31.348061
166	42	178	99	2017-02-15 16:52:31.363065	2017-02-15 16:52:31.363065
167	43	179	16	2017-02-15 16:53:01.907076	2017-02-15 16:53:01.907076
168	43	18	18	2017-02-15 16:53:01.917166	2017-02-15 16:53:01.917166
169	43	180	18	2017-02-15 16:53:01.929884	2017-02-15 16:53:01.929884
170	43	181	20	2017-02-15 16:53:01.940908	2017-02-15 16:53:01.940908
171	44	182	31	2017-02-15 16:53:37.178451	2017-02-15 16:53:37.178451
172	44	7	38	2017-02-15 16:53:37.191023	2017-02-15 16:53:37.191023
173	44	47	55	2017-02-15 16:53:37.201824	2017-02-15 16:53:37.201824
174	44	1	131	2017-02-15 16:53:37.21341	2017-02-15 16:53:37.21341
175	45	13	41	2017-02-15 16:54:06.765834	2017-02-15 16:54:06.765834
176	45	47	55	2017-02-15 16:54:06.77499	2017-02-15 16:54:06.77499
177	45	3	63	2017-02-15 16:54:06.787413	2017-02-15 16:54:06.787413
178	45	84	70	2017-02-15 16:54:06.798055	2017-02-15 16:54:06.798055
179	46	183	52	2017-02-15 16:54:39.211956	2017-02-15 16:54:39.211956
180	46	54	58	2017-02-15 16:54:39.224592	2017-02-15 16:54:39.224592
181	46	184	78	2017-02-15 16:54:39.237454	2017-02-15 16:54:39.237454
182	46	185	78	2017-02-15 16:54:39.251595	2017-02-15 16:54:39.251595
183	47	186	33	2017-02-15 16:55:10.082991	2017-02-15 16:55:10.082991
184	47	3	39	2017-02-15 16:55:10.092206	2017-02-15 16:55:10.092206
185	47	1	44	2017-02-15 16:55:10.102662	2017-02-15 16:55:10.102662
186	47	34	61	2017-02-15 16:55:10.112579	2017-02-15 16:55:10.112579
187	48	1	28	2017-02-15 16:55:39.007273	2017-02-15 16:55:39.007273
188	48	187	38	2017-02-15 16:55:39.020015	2017-02-15 16:55:39.020015
189	48	16	41	2017-02-15 16:55:39.027924	2017-02-15 16:55:39.027924
190	49	188	59	2017-02-15 16:56:10.184347	2017-02-15 16:56:10.184347
191	49	189	60	2017-02-15 16:56:10.196224	2017-02-15 16:56:10.196224
192	49	11	61	2017-02-15 16:56:10.213066	2017-02-15 16:56:10.213066
193	49	1	75	2017-02-15 16:56:10.22712	2017-02-15 16:56:10.22712
194	50	190	22	2017-02-15 16:56:46.555976	2017-02-15 16:56:46.555976
195	50	191	24	2017-02-15 16:56:46.564755	2017-02-15 16:56:46.564755
196	50	192	42	2017-02-15 16:56:46.577348	2017-02-15 16:56:46.577348
197	50	193	58	2017-02-15 16:56:46.586513	2017-02-15 16:56:46.586513
198	51	10	30	2017-02-15 16:57:16.280163	2017-02-15 16:57:16.280163
199	51	194	32	2017-02-15 16:57:16.302749	2017-02-15 16:57:16.302749
200	51	195	34	2017-02-15 16:57:16.312525	2017-02-15 16:57:16.312525
201	51	4	37	2017-02-15 16:57:16.32351	2017-02-15 16:57:16.32351
202	51	1	45	2017-02-15 16:57:16.332377	2017-02-15 16:57:16.332377
203	52	196	38	2017-02-15 16:57:49.39851	2017-02-15 16:57:49.39851
204	52	1	52	2017-02-15 16:57:49.408809	2017-02-15 16:57:49.408809
205	52	71	64	2017-02-15 16:57:49.425127	2017-02-15 16:57:49.425127
206	52	35	89	2017-02-15 16:57:49.439187	2017-02-15 16:57:49.439187
207	53	197	14	2017-02-15 16:58:19.144951	2017-02-15 16:58:19.144951
208	53	198	15	2017-02-15 16:58:19.156072	2017-02-15 16:58:19.156072
209	53	199	16	2017-02-15 16:58:19.170095	2017-02-15 16:58:19.170095
210	53	200	33	2017-02-15 16:58:19.181133	2017-02-15 16:58:19.181133
211	54	21	27	2017-02-15 16:58:50.766493	2017-02-15 16:58:50.766493
212	54	201	30	2017-02-15 16:58:50.77864	2017-02-15 16:58:50.77864
213	54	202	39	2017-02-15 16:58:50.790938	2017-02-15 16:58:50.790938
214	54	203	40	2017-02-15 16:58:50.800944	2017-02-15 16:58:50.800944
215	55	89	36	2017-02-15 16:59:23.488513	2017-02-15 16:59:23.488513
216	55	204	79	2017-02-15 16:59:23.499467	2017-02-15 16:59:23.499467
217	55	205	80	2017-02-15 16:59:23.511997	2017-02-15 16:59:23.511997
218	55	3	91	2017-02-15 16:59:23.52472	2017-02-15 16:59:23.52472
219	56	5	30	2017-02-15 16:59:52.650972	2017-02-15 16:59:52.650972
220	56	4	31	2017-02-15 16:59:52.667936	2017-02-15 16:59:52.667936
221	56	206	43	2017-02-15 16:59:52.680506	2017-02-15 16:59:52.680506
222	56	1	60	2017-02-15 16:59:52.690108	2017-02-15 16:59:52.690108
223	57	29	31	2017-02-15 17:00:20.221527	2017-02-15 17:00:20.221527
224	57	1	35	2017-02-15 17:00:20.232168	2017-02-15 17:00:20.232168
225	57	40	61	2017-02-15 17:00:20.249601	2017-02-15 17:00:20.249601
226	57	207	62	2017-02-15 17:00:20.26296	2017-02-15 17:00:20.26296
227	58	208	25	2017-02-15 17:00:53.905832	2017-02-15 17:00:53.905832
228	58	1	28	2017-02-15 17:00:53.921619	2017-02-15 17:00:53.921619
229	58	209	45	2017-02-15 17:00:53.936519	2017-02-15 17:00:53.936519
230	58	210	58	2017-02-15 17:00:53.951468	2017-02-15 17:00:53.951468
231	59	1	15	2017-02-15 17:01:21.583392	2017-02-15 17:01:21.583392
232	59	211	31	2017-02-15 17:01:21.59238	2017-02-15 17:01:21.59238
233	59	15	32	2017-02-15 17:01:21.602603	2017-02-15 17:01:21.602603
234	59	3	161	2017-02-15 17:01:21.612983	2017-02-15 17:01:21.612983
235	60	1	32	2017-02-15 17:01:52.585023	2017-02-15 17:01:52.585023
236	60	212	35	2017-02-15 17:01:52.595731	2017-02-15 17:01:52.595731
237	60	72	49	2017-02-15 17:01:52.605735	2017-02-15 17:01:52.605735
238	60	12	72	2017-02-15 17:01:52.615703	2017-02-15 17:01:52.615703
239	60	7	83	2017-02-15 17:01:52.625882	2017-02-15 17:01:52.625882
240	61	213	37	2017-02-15 17:02:21.874383	2017-02-15 17:02:21.874383
241	61	95	44	2017-02-15 17:02:21.88751	2017-02-15 17:02:21.88751
242	61	214	47	2017-02-15 17:02:21.89831	2017-02-15 17:02:21.89831
243	61	1	82	2017-02-15 17:02:21.911418	2017-02-15 17:02:21.911418
244	62	1	18	2017-02-15 17:02:51.676235	2017-02-15 17:02:51.676235
245	62	200	30	2017-02-15 17:02:51.687893	2017-02-15 17:02:51.687893
246	62	215	37	2017-02-15 17:02:51.701953	2017-02-15 17:02:51.701953
247	62	54	52	2017-02-15 17:02:51.71109	2017-02-15 17:02:51.71109
248	63	11	28	2017-02-15 17:03:22.059674	2017-02-15 17:03:22.059674
249	63	50	42	2017-02-15 17:03:22.074778	2017-02-15 17:03:22.074778
250	63	216	49	2017-02-15 17:03:22.085488	2017-02-15 17:03:22.085488
251	63	24	70	2017-02-15 17:03:22.097881	2017-02-15 17:03:22.097881
252	63	27	96	2017-02-15 17:03:22.109628	2017-02-15 17:03:22.109628
253	64	1	39	2017-02-15 17:03:54.209466	2017-02-15 17:03:54.209466
254	64	3	57	2017-02-15 17:03:54.219704	2017-02-15 17:03:54.219704
255	64	217	58	2017-02-15 17:03:54.23539	2017-02-15 17:03:54.23539
256	64	118	82	2017-02-15 17:03:54.24503	2017-02-15 17:03:54.24503
257	65	218	14	2017-02-15 17:04:23.046324	2017-02-15 17:04:23.046324
258	65	1	32	2017-02-15 17:04:23.063466	2017-02-15 17:04:23.063466
259	65	21	49	2017-02-15 17:04:23.074897	2017-02-15 17:04:23.074897
260	65	219	57	2017-02-15 17:04:23.090037	2017-02-15 17:04:23.090037
261	66	95	33	2017-02-15 17:04:53.829976	2017-02-15 17:04:53.829976
262	66	3	51	2017-02-15 17:04:53.844242	2017-02-15 17:04:53.844242
263	66	7	82	2017-02-15 17:04:53.853638	2017-02-15 17:04:53.853638
264	66	1	110	2017-02-15 17:04:53.867469	2017-02-15 17:04:53.867469
265	67	220	22	2017-02-15 17:05:24.979072	2017-02-15 17:05:24.979072
266	67	221	27	2017-02-15 17:05:24.990291	2017-02-15 17:05:24.990291
267	67	87	28	2017-02-15 17:05:24.99926	2017-02-15 17:05:24.99926
268	67	1	33	2017-02-15 17:05:25.011861	2017-02-15 17:05:25.011861
\.


--
-- Name: subreddit_connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: christiancarey1
--

SELECT pg_catalog.setval('subreddit_connections_id_seq', 268, true);


--
-- Data for Name: subreddits; Type: TABLE DATA; Schema: public; Owner: christiancarey1
--

COPY subreddits (id, subscriber_count, url, name, description, created_at, updated_at) FROM stdin;
1	15734803	/r/AskReddit/	AskReddit	/r/AskReddit is the place to ask and answer thought-provoking questions.	2017-02-15 16:31:19.183738	2017-02-15 16:31:19.183738
2	366444	/r/The_Donald/	The_Donald	/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n	2017-02-15 16:31:19.195419	2017-02-15 16:31:19.195419
3	3299843	/r/politics/	politics	/r/Politics is for news and discussion about U.S. politics.	2017-02-15 16:31:19.202279	2017-02-15 16:31:19.202279
4	15347330	/r/pics/	pics	A place to share photographs and pictures.	2017-02-15 16:31:19.210925	2017-02-15 16:31:19.210925
5	15576241	/r/funny/	funny	Welcome to r/Funny: reddit's largest humour depository	2017-02-15 16:31:19.21887	2017-02-15 16:31:19.21887
6	15379520	/r/worldnews/	worldnews	A place for major news from around the world, excluding US-internal news.\n	2017-02-15 16:31:19.227629	2017-02-15 16:31:19.227629
7	523717	/r/nba/	nba	All things NBA basketball.	2017-02-15 16:31:19.234474	2017-02-15 16:31:19.234474
8	12848460	/r/news/	news	/r/news is: real news articles, primarily but not exclusively, news relating to the United States. /r/news isn't: editorials, commercials, political minutiae, shouting, justin bieber updates, kitty pictures. For a subreddit for all news-related content (editorials, satire, etc.) visit /r/inthenews.	2017-02-15 16:31:19.24345	2017-02-15 16:31:19.24345
9	15567203	/r/todayilearned/	todayilearned	You learn something new every day; what did you learn today?\nSubmit interesting and specific facts about something that you just found out here.	2017-02-15 16:31:19.249613	2017-02-15 16:31:19.249613
10	12797658	/r/gifs/	gifs	Funny, animated gifs - your favorite computer file type!\n\nOfficially pronounced with a hard "J"	2017-02-15 16:31:19.25823	2017-02-15 16:31:19.25823
11	14692868	/r/gaming/	gaming	A subreddit for (almost) anything related to games - video games, board games, card games, etc. (but not sports).	2017-02-15 16:31:19.264554	2017-02-15 16:31:19.264554
12	573547	/r/soccer/	soccer	The football subreddit.\n\nNews, results and discussion about the beautiful game.	2017-02-15 16:31:19.271545	2017-02-15 16:31:19.271545
13	14659157	/r/videos/	videos	A great place for video content of all kinds. 	2017-02-15 16:31:19.27896	2017-02-15 16:31:19.27896
14	772990	/r/Overwatch/	Overwatch	Subreddit for all things Overwatch™, the team-based shooter from Blizzard Entertainment.	2017-02-15 16:31:19.285473	2017-02-15 16:31:19.285473
15	14368116	/r/movies/	movies	News &amp; Discussion about Major Motion Pictures	2017-02-15 16:31:19.294679	2017-02-15 16:31:19.294679
16	10891362	/r/mildlyinteresting/	mildlyinteresting	Aww, cripes. I didn't know I'd have to write a description. How many words is that so far, like a hundred? Soooo, yeah. Mildly interesting stuff. Stuff that interests you. Mildly. It's in the name, ffs.	2017-02-15 16:31:19.302051	2017-02-15 16:31:19.302051
17	13778069	/r/aww/	aww	###Things that make you go AWW! Like puppies, bunnies, babies, and so on...\n\n###A place for really cute pictures and videos!	2017-02-15 16:31:19.312502	2017-02-15 16:31:19.312502
18	182729	/r/SquaredCircle/	SquaredCircle		2017-02-15 16:31:19.319602	2017-02-15 16:31:19.319602
19	13949071	/r/Music/	Music	The musical community of reddit	2017-02-15 16:31:19.331478	2017-02-15 16:31:19.331478
20	849979	/r/BlackPeopleTwitter/	BlackPeopleTwitter	Screenshots of black people being hilarious on social media	2017-02-15 16:31:19.341884	2017-02-15 16:31:19.341884
21	954574	/r/leagueoflegends/	leagueoflegends	Subreddit for content and discussion about League of Legends, a game created by Riot Games.	2017-02-15 16:31:19.349879	2017-02-15 16:31:19.349879
22	211465	/r/dankmemes/	dankmemes	The best place to find the dankest memes anywhere on the internet.	2017-02-15 16:31:19.358164	2017-02-15 16:31:19.358164
23	4735687	/r/WTF/	WTF	Things that make you say "What the F*ck".\n\n	2017-02-15 16:31:19.366116	2017-02-15 16:31:19.366116
24	576293	/r/nfl/	nfl	NFL: National Football League News &amp; Discussion\nhttps://www.reddit.com/r/nfl/comments/\n	2017-02-15 16:31:19.373959	2017-02-15 16:31:19.373959
25	606626	/r/relationships/	relationships	/r/Relationships is a community built around the goal of providing a platform for interpersonal relationship advice between redditors. We seek posts from users who have specific and personal relationship quandaries that other redditors can help them try to solve.	2017-02-15 16:31:19.382339	2017-02-15 16:31:19.382339
26	54964	/r/forhonor/	forhonor	The home for For Honor on reddit!\n\nComing to PC, Xbox One, and PlayStation 4 on February 14, 2017.	2017-02-15 16:31:19.388363	2017-02-15 16:31:19.388363
27	507712	/r/me_irl/	me_irl	selfies of the soul	2017-02-15 16:31:19.396706	2017-02-15 16:31:19.396706
28	10780687	/r/Showerthoughts/	Showerthoughts	A subReddit to share anything that goes on in your head whilst in the shower. 	2017-02-15 16:31:19.402786	2017-02-15 16:31:19.402786
29	430540	/r/conspiracy/	conspiracy	**The conspiracy subreddit is a thinking ground. Above all else, we respect everyone's opinions and ALL religious beliefs and creeds. We hope to challenge issues which have captured the public’s imagination, from JFK to 9/11. This is a forum for free thinking, not hate speech. Respect other views and opinions, and keep an open mind.**\n\n**Our intentions are aimed towards a fairer, more transparent world and a better future for everyone.**	2017-02-15 16:31:19.410047	2017-02-15 16:31:19.410047
30	10527508	/r/Jokes/	Jokes	The funniest sub on reddit. Hundreds of jokes posted each day, and some of them aren't even reposts! FarCraft	2017-02-15 16:31:19.415896	2017-02-15 16:31:19.415896
31	4149198	/r/AdviceAnimals/	AdviceAnimals	Reddit's Gold Mine	2017-02-15 16:31:19.422366	2017-02-15 16:31:19.422366
32	101413	/r/NintendoSwitch/	NintendoSwitch	/r/NintendoSwitch is the central hub for all News, Updates, Information, Rumors, Speculation, and Topics relating to Nintendo's upcoming game system -- the Nintendo Switch!	2017-02-15 16:31:19.431029	2017-02-15 16:31:19.431029
33	419376	/r/hearthstone/	hearthstone	For fans of Blizzard Entertainment's digital card game, Hearthstone: Heroes of Warcraft.	2017-02-15 16:31:19.43883	2017-02-15 16:31:19.43883
34	467534	/r/GlobalOffensive/	GlobalOffensive	/r/GlobalOffensive is a home for the Counter-Strike: Global Offensive community and a hub for the discussion and sharing of content relevant to CS:GO. \n\nCounter-Strike: Global Offensive is a game created by Valve Corporation and released on August 21st, 2012 as a successor to previous games in the series dating back to 1999. The latest installment to the Counter-Strike franchise maintains a healthy, ever-intensifying competitive scene alongside an ever-growing casual playerbase.	2017-02-15 16:31:19.447393	2017-02-15 16:31:19.447393
35	315398	/r/hockey/	hockey	hockey: the best game on earth	2017-02-15 16:31:19.455031	2017-02-15 16:31:19.455031
36	10384625	/r/nottheonion/	nottheonion	Real news stories that SOUND like they're [Onion](http://theonion.com) articles, but aren't.	2017-02-15 16:31:19.46591	2017-02-15 16:31:19.46591
37	388685	/r/wholesomememes/	wholesomememes	Welcome to the wholesome side of the internet! This community is for those searching for a way to capture virtue on the internet.  	2017-02-15 16:31:19.473028	2017-02-15 16:31:19.473028
38	75032	/r/EnoughTrumpSpam/	EnoughTrumpSpam	Because the amount of Trump spam is too damn high!	2017-02-15 16:31:19.484138	2017-02-15 16:31:19.484138
39	244858	/r/canada/	canada	Canada - the country, people, culture, and yeah, the hockey, snow and all things Canadian. \n\nWe decided on this description politely. \n	2017-02-15 16:31:19.495195	2017-02-15 16:31:19.495195
40	765909	/r/pcmasterrace/	pcmasterrace	Welcome to the official subreddit of the PC Master Race. In this subreddit, we celebrate and promote the ultimate gaming and working platform. Ascend to a level that respects your eyes, your wallet, your mind, and your heart. Ascend to... the PC Master Race.	2017-02-15 16:31:19.502048	2017-02-15 16:31:19.502048
41	11242394	/r/LifeProTips/	LifeProTips	Tips that improve your life in one way or another.	2017-02-15 16:31:19.513624	2017-02-15 16:31:19.513624
42	5168801	/r/technology/	technology	For all things technology.	2017-02-15 16:31:19.52107	2017-02-15 16:31:19.52107
43	247843	/r/MMA/	MMA	A subreddit for all things Mixed Martial Arts, all other combat sports welcome	2017-02-15 16:31:19.538178	2017-02-15 16:31:19.538178
44	311871	/r/thewalkingdead/	thewalkingdead	Subreddit for all things The Walking Dead. 	2017-02-15 16:31:19.550033	2017-02-15 16:31:19.550033
45	11587067	/r/television/	television	A general-topic television subreddit for discussion, reviews, and top level news sources. We do not accept disposable content like images, memes, blogspam, or lists. We keep a directory of series-specific subreddits that have much less stingy rules in our sidebar.	2017-02-15 16:31:19.594382	2017-02-15 16:31:19.594382
46	778084	/r/Games/	Games	The goal of /r/Games is to provide a place for informative and interesting gaming content and discussions.\n\nSubmissions should be for the purpose of informing or initiating a discussion, not just with the goal of entertaining viewers. Memes, comics, funny screenshots, arts-and-crafts, etc. will be removed.	2017-02-15 16:31:19.6008	2017-02-15 16:31:19.6008
47	477897	/r/hiphopheads/	hiphopheads	Everything hiphop! The latest mixtapes, videos, news, and anything else hip hop related from your favorite artists.	2017-02-15 16:31:19.608814	2017-02-15 16:31:19.608814
48	379266	/r/wow/	wow	World of Warcraft on Reddit! 	2017-02-15 16:31:19.618732	2017-02-15 16:31:19.618732
49	61471	/r/PrequelMemes/	PrequelMemes	From my point of view, the original trilogy is evil.\n\n\nPrequel memes are memes from the Star Wars prequels.\n\n\n\n	2017-02-15 16:31:19.627385	2017-02-15 16:31:19.627385
50	463281	/r/anime/	anime	Reddit's premier anime community\n	2017-02-15 16:31:19.634073	2017-02-15 16:31:19.634073
51	907323	/r/interestingasfuck/	interestingasfuck	For almost anything you find interesting.	2017-02-15 16:31:19.644544	2017-02-15 16:31:19.644544
52	10759709	/r/space/	space	/r/space is dedicated to the insightful and thoughtful discussion of outer space.	2017-02-15 16:31:19.65268	2017-02-15 16:31:19.65268
53	108589	/r/Rainbow6/	Rainbow6	Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.	2017-02-15 16:31:19.661048	2017-02-15 16:31:19.661048
54	325092	/r/DotA2/	DotA2		2017-02-15 16:31:19.667901	2017-02-15 16:31:19.667901
55	1248382	/r/europe/	europe	Europe: 50 (+6) countries, 230 languages, 743M people… 1 subreddit.	2017-02-15 16:31:19.677911	2017-02-15 16:31:19.677911
56	919771	/r/trees/	trees	The go-to subreddit for anything and everything marijuana. From MMJ to munchies, from nugs to news, and everything between! The casual cannabis community.	2017-02-15 16:31:19.683949	2017-02-15 16:31:19.683949
57	10114508	/r/OldSchoolCool/	OldSchoolCool	/r/OldSchoolCool\n\n**History's cool kids, looking fantastic!**\n\nA pictorial and video celebration of history's coolest kids, everything from beatniks to bikers, mods to rude boys, hippies to ravers. And everything in between. \n\nIf you've found a photo, or a photo essay, of people from the past looking fantastic, here's the place to share it.  	2017-02-15 16:31:19.691815	2017-02-15 16:31:19.691815
58	112692	/r/starterpacks/	starterpacks	The worlds biggest starterpack resource.	2017-02-15 16:31:19.699168	2017-02-15 16:31:19.699168
59	15401881	/r/science/	science	The Science subreddit is a place to share new findings. Read about the latest advances in astronomy, biology, medicine, physics and the social sciences. Find and submit the best writeup on the web about a discovery, and make sure it cites its sources.	2017-02-15 16:31:19.7063	2017-02-15 16:31:19.7063
60	10574013	/r/sports/	sports	The central hub for all things sports on reddit.	2017-02-15 16:31:19.716208	2017-02-15 16:31:19.716208
61	174709	/r/CringeAnarchy/	CringeAnarchy	A place to submit all cringe material freely.	2017-02-15 16:31:19.722273	2017-02-15 16:31:19.722273
62	85428	/r/pathofexile/	pathofexile	A subreddit dedicated to the indie game Path of Exile made by Grinding Gear Games.	2017-02-15 16:31:19.73696	2017-02-15 16:31:19.73696
63	320804	/r/youtubehaiku/	youtubehaiku	Youtube Haiku: Any almost poetic video under 14 seconds. Don't ask me why 14 seconds; it's just a number I have learned from experience.  Videos can still be poetic after 15 or longer, but no longer than 30 seconds. 	2017-02-15 16:31:19.748334	2017-02-15 16:31:19.748334
64	254058	/r/SubredditDrama/	SubredditDrama	The place where people can come and talk about internet fights and other dramatic happenings from other subreddits.	2017-02-15 16:31:19.754472	2017-02-15 16:31:19.754472
65	61734	/r/rupaulsdragrace/	rupaulsdragrace	Do you have what it takes to make it to the top? Only those with Charisma, Uniqueness, Nerve and Talent will make it to the top! Start your engines...and may the best **woman** *win*! Dedicated to everyone's favorite drag queen tv show.	2017-02-15 16:31:19.76582	2017-02-15 16:31:19.76582
66	483081	/r/facepalm/	facepalm	A subreddit for you to share the stupidity of people online and IRL. Post screenshots from forums, social media sites, or just real life.\n\n***PLEASE*** read all of the sidebar before posting, thanks!	2017-02-15 16:31:19.773505	2017-02-15 16:31:19.773505
67	344050	/r/TumblrInAction/	TumblrInAction	A true force for good!	2017-02-15 16:31:19.78152	2017-02-15 16:31:19.78152
68	772532	/r/4chan/	4chan	We hope our little gig made you vote to Make America Great Again out of spite. \n\nThank you voters, and let's continue to MAGA!\n\n(We will reopen in a few hours)	2017-02-15 16:31:19.789073	2017-02-15 16:31:19.789073
69	10369500	/r/photoshopbattles/	photoshopbattles	Photoshop contests on reddit. A place to battle using image manipulation software, play photoshop tennis, create new images from old photos, or even win reddit gold.	2017-02-15 16:31:19.797056	2017-02-15 16:31:19.797056
70	102924	/r/2007scape/	2007scape	The community for Old School RuneScape discussion on reddit. Join us for game discussions, weekly events and skilling competitions!\n\nOSRS is the official legacy version of RS, the largest free-to-play MMORPG.	2017-02-15 16:31:19.802786	2017-02-15 16:31:19.802786
71	10342114	/r/Futurology/	Futurology	Welcome to r/Futurology, a subreddit devoted to the field of Future(s) Studies and speculation about the development of humanity, technology, and civilization.\n	2017-02-15 16:31:19.80981	2017-02-15 16:31:19.80981
72	115941	/r/CollegeBasketball/	CollegeBasketball	A subreddit for college basketball news and discussion.	2017-02-15 16:31:19.816518	2017-02-15 16:31:19.816518
73	10315139	/r/personalfinance/	personalfinance	Learn about personal finance: getting out debt, budgeting, saving, investing, and managing your wealth. Please join our community focused on financial education and helping each other!	2017-02-15 16:31:19.822548	2017-02-15 16:31:19.822548
74	10398996	/r/food/	food	Cooking, restaurants, recipes, food network, foodies, talk about it here!	2017-02-15 16:31:19.831976	2017-02-15 16:31:19.831976
75	10226970	/r/UpliftingNews/	UpliftingNews	A place to read and share positive and uplifting, feel good news stories.	2017-02-15 16:31:19.838999	2017-02-15 16:31:19.838999
76	124993	/r/PoliticalDiscussion/	PoliticalDiscussion	Discussion about politics. Talk amongst yourselves.  Politely and informatively.	2017-02-15 16:31:19.846798	2017-02-15 16:31:19.846798
77	21397	/r/AskOuija/	AskOuija	AskReddit, Ouija-style.	2017-02-15 16:31:19.852991	2017-02-15 16:31:19.852991
78	9519817	/r/TwoXChromosomes/	TwoXChromosomes	Welcome to TwoXChromosomes, a subreddit for both serious and silly content, and intended for women's perspectives.  \n\nWe are a welcoming subreddit and support the rights of all genders.\n\nPosts are moderated for respect, equanimity, grace, and relevance. \n	2017-02-15 16:31:19.86104	2017-02-15 16:31:19.86104
129	80983	/r/indieheads	indieheads	\N	2017-02-15 16:38:54.267227	2017-02-15 16:38:54.267227
79	305743	/r/Tinder/	Tinder	A community for discussing the online dating app Tinder. Sharing conversations, reviewing profiles and more.	2017-02-15 16:31:19.867872	2017-02-15 16:31:19.867872
80	12647300	/r/explainlikeimfive/	explainlikeimfive	**Explain Like I'm Five is the best forum and archive on the internet for layman-friendly explanations.**\n\n&amp;nbsp;\n\nDon't Panic!	2017-02-15 16:31:19.874616	2017-02-15 16:31:19.874616
81	303411	/r/DestinyTheGame/	DestinyTheGame	Welcome! This sub is for discussing Bungie's newest game, Destiny, a "shared world" action FPS. \n\nPlease read the sidebar rules, and search for your question before posting.	2017-02-15 16:31:19.88162	2017-02-15 16:31:19.88162
82	279319	/r/trashy/	trashy	Trashy stories, trashy glamour, all things fake, plastic, and downright trashy, low-class, no-class, white trash, bimbos, and damn proud.	2017-02-15 16:31:19.887765	2017-02-15 16:31:19.887765
83	373593	/r/baseball/	baseball	The subreddit for the bat-and-ball sport played between two teams of nine players. America's Pastime.\n\n[MLB Team Subreddits](/r/baseball/wiki/teams)\n\n[Other related subreddits](/r/baseball/wiki/subreddits)	2017-02-15 16:31:19.896207	2017-02-15 16:31:19.896207
84	151823	/r/unitedkingdom/	unitedkingdom	For the United Kingdom of Great Britain (England, Scotland, Wales) and Northern Ireland; News, Politics, Economics, Society, Business, Culture and anything else UK related.	2017-02-15 16:31:19.902761	2017-02-15 16:31:19.902761
85	291748	/r/iamverysmart/	iamverysmart	...because thesaurus abuse makes you sound very smart.	2017-02-15 16:31:19.911912	2017-02-15 16:31:19.911912
86	15198487	/r/IAmA/	IAmA		2017-02-15 16:31:19.918744	2017-02-15 16:31:19.918744
87	238755	/r/CFB/	CFB	A forum for all things college football. Primarily focused on NCAA football, discussion is welcome on any collegiate league, teams, and players.	2017-02-15 16:31:19.925931	2017-02-15 16:31:19.925931
88	209699	/r/TrollXChromosomes/	TrollXChromosomes	### A subreddit for rage comics and other memes with a girly slant. 	2017-02-15 16:31:19.93538	2017-02-15 16:31:19.93538
89	51515	/r/de/	de	Das Sammelbecken für alle Deutschsprachler, hauptsächlich auf Deutsch, manchmal auch auf Englisch.	2017-02-15 16:31:19.942657	2017-02-15 16:31:19.942657
90	732501	/r/Android/	Android	Android news, reviews, tips, and discussions about rooting, tutorials, and apps. Generic discussion about phones/tablets is allowed, but technical-support and carrier-related issues should be asked in their respective subreddits!	2017-02-15 16:31:19.949083	2017-02-15 16:31:19.949083
91	564201	/r/StarWars/	StarWars	A long time ago, in a sub reddit far, far, away.... There was an epic battle between good and evil.\n\nThe Jedi fight for justice and peace and the Sith for power and chaos.\n\nWhich side will you take?\n\nCome join us if you love all things Star Wars. Either be the old trilogy, the new prequels, the\ncartoons, toys, cosplay, etc etc. We welcome all fans of the series. \n	2017-02-15 16:31:19.956064	2017-02-15 16:31:19.956064
92	38278	/r/FireEmblemHeroes/	FireEmblemHeroes	A subreddit dedicated to *Fire Emblem Heroes*, Nintendo's 3rd mobile title released on February 2nd, 2017. The game is available worldwide on [iOS](https://itunes.apple.com/us/app/fire-emblem-heroes/id1181774280?mt=8) and [Android](https://play.google.com/store/apps/details?id=com.nintendo.zaba).	2017-02-15 16:31:19.96676	2017-02-15 16:31:19.96676
93	10715	/r/thebachelor/	thebachelor	A subreddit to discuss the ABC show The Bachelor and Bachelor Franchise shows.	2017-02-15 16:31:19.972614	2017-02-15 16:31:19.972614
94	158222	/r/HumansBeingBros/	HumansBeingBros	A place for sharing videos, gifs, and images of humans being bros.	2017-02-15 16:31:19.981315	2017-02-15 16:31:19.981315
95	10548252	/r/tifu/	tifu	WELCOME TO /r/TIFU! \n\nToday I Fucked Up is a community for the dumbass in all of us. We all have those moments where we do something ridiculously stupid. Let us make each other feel better about ourselves. Come and check it out!\n\nWhy you should join us: It's funny, interesting, cringe-worthy, laugh-causing, smile-inducing, feel-good, ridiculous, humor, humorous, humerus, stupid, cool, awesome, but mostly because it's the best community on reddit.	2017-02-15 16:31:19.98823	2017-02-15 16:31:19.98823
96	10277803	/r/GetMotivated/	GetMotivated	Welcome to /r/GetMotivated! We’re glad you made it. This is the subreddit that will help you finally get up and do what you *know* you need to do. It’s the subreddit to give and receive motivation through pictures, videos, text, music, AMA’s, personal stories, and anything and everything that you find particularly motivating and/or inspiring.\n\nSo browse around, ask questions, give advice, form/join a support group. But don’t spend too much time here; you’ve got *better* things to do.	2017-02-15 16:31:19.995797	2017-02-15 16:31:19.995797
97	183401	/r/legaladvice/	legaladvice	A place to ask simple legal questions, and to have legal concepts explained.  	2017-02-15 16:31:20.002698	2017-02-15 16:31:20.002698
98	70425	/r/ukpolitics/	ukpolitics	Political articles and debate concerning the United Kingdom.	2017-02-15 16:31:20.012063	2017-02-15 16:31:20.012063
99	76507	/r/KotakuInAction/	KotakuInAction	Kotaku In Action is the main hub for GamerGate discussion on Reddit. It's the place to discuss issues in gaming, ethics, and journalism, as well as the censorship within them.	2017-02-15 16:31:20.018477	2017-02-15 16:31:20.018477
100	402431	/r/skyrim/	skyrim		2017-02-15 16:31:20.02625	2017-02-15 16:31:20.02625
101	927	/r/yakuzagames	yakuzagames	\N	2017-02-15 16:31:47.031357	2017-02-15 16:31:47.031357
102	1009665	/r/gonewild	gonewild	\N	2017-02-15 16:31:47.993663	2017-02-15 16:31:47.993663
103	13639	/r/AskThe_Donald	AskThe_Donald	\N	2017-02-15 16:32:19.11028	2017-02-15 16:32:19.11028
104	158045	/r/jailbreak	jailbreak	\N	2017-02-15 16:32:20.022833	2017-02-15 16:32:20.022833
105	2675	/r/NeverTrump	NeverTrump	\N	2017-02-15 16:32:51.210533	2017-02-15 16:32:51.210533
106	341262	/r/photography	photography	\N	2017-02-15 16:32:52.233485	2017-02-15 16:32:52.233485
107	4292	/r/tdi	tdi	\N	2017-02-15 16:33:21.438894	2017-02-15 16:33:21.438894
108	141094	/r/modnews	modnews	\N	2017-02-15 16:33:22.258882	2017-02-15 16:33:22.258882
109	103926	/r/evilbuildings	evilbuildings	\N	2017-02-15 16:33:49.181665	2017-02-15 16:33:49.181665
110	46806	/r/crochet	crochet	\N	2017-02-15 16:34:17.293758	2017-02-15 16:34:17.293758
111	16766	/r/clevelandcavs	clevelandcavs	\N	2017-02-15 16:34:49.527949	2017-02-15 16:34:49.527949
112	5782	/r/DetroitPistons	DetroitPistons	\N	2017-02-15 16:34:50.347933	2017-02-15 16:34:50.347933
113	3396	/r/denvernuggets	denvernuggets	\N	2017-02-15 16:34:51.25057	2017-02-15 16:34:51.25057
114	20895	/r/DenverBroncos	DenverBroncos	\N	2017-02-15 16:34:52.228104	2017-02-15 16:34:52.228104
115	125294	/r/france	france	\N	2017-02-15 16:35:24.965237	2017-02-15 16:35:24.965237
116	103037	/r/uncensorednews	uncensorednews	\N	2017-02-15 16:35:54.01581	2017-02-15 16:35:54.01581
117	97352	/r/rarepuppers	rarepuppers	\N	2017-02-15 16:36:20.587449	2017-02-15 16:36:20.587449
118	97810	/r/Philippines	Philippines	\N	2017-02-15 16:36:21.432973	2017-02-15 16:36:21.432973
119	130654	/r/Sneakers	Sneakers	\N	2017-02-15 16:36:47.459031	2017-02-15 16:36:47.459031
120	51707	/r/terriblefacebookmemes	terriblefacebookmemes	\N	2017-02-15 16:36:48.39285	2017-02-15 16:36:48.39285
121	3316	/r/LigaMX	LigaMX	\N	2017-02-15 16:37:17.541787	2017-02-15 16:37:17.541787
122	57165	/r/reddevils	reddevils	\N	2017-02-15 16:37:18.790751	2017-02-15 16:37:18.790751
123	55424	/r/Fireteams	Fireteams	\N	2017-02-15 16:37:50.552936	2017-02-15 16:37:50.552936
124	90027	/r/Twitch	Twitch	\N	2017-02-15 16:38:20.04789	2017-02-15 16:38:20.04789
125	4348	/r/VACsucks	VACsucks	\N	2017-02-15 16:38:20.911238	2017-02-15 16:38:20.911238
126	456372	/r/Minecraft	Minecraft	\N	2017-02-15 16:38:21.811371	2017-02-15 16:38:21.811371
127	163454	/r/tf2	tf2	\N	2017-02-15 16:38:22.750662	2017-02-15 16:38:22.750662
128	50726	/r/skiing	skiing	\N	2017-02-15 16:38:53.324603	2017-02-15 16:38:53.324603
130	2591	/r/CFBOffTopic	CFBOffTopic	\N	2017-02-15 16:39:23.995836	2017-02-15 16:39:23.995836
131	53793	/r/Patriots	Patriots	\N	2017-02-15 16:39:52.609057	2017-02-15 16:39:52.609057
132	6922	/r/Dreadlocks	Dreadlocks	\N	2017-02-15 16:39:53.381482	2017-02-15 16:39:53.381482
133	81306	/r/FinalFantasy	FinalFantasy	\N	2017-02-15 16:40:22.023807	2017-02-15 16:40:22.023807
134	9432	/r/rush	rush	\N	2017-02-15 16:40:49.548215	2017-02-15 16:40:49.548215
135	62705	/r/youtube	youtube	\N	2017-02-15 16:41:21.070687	2017-02-15 16:41:21.070687
136	34439	/r/weightlifting	weightlifting	\N	2017-02-15 16:41:22.122267	2017-02-15 16:41:22.122267
137	166	/r/vandiril	vandiril	\N	2017-02-15 16:41:52.100462	2017-02-15 16:41:52.100462
138	27292	/r/Monstercat	Monstercat	\N	2017-02-15 16:41:52.979032	2017-02-15 16:41:52.979032
139	19415	/r/brisbane	brisbane	\N	2017-02-15 16:42:23.276076	2017-02-15 16:42:23.276076
140	52408	/r/ForeverAlone	ForeverAlone	\N	2017-02-15 16:42:58.437036	2017-02-15 16:42:58.437036
141	82844	/r/mexico	mexico	\N	2017-02-15 16:42:59.256025	2017-02-15 16:42:59.256025
142	36729	/r/makinghiphop	makinghiphop	\N	2017-02-15 16:43:54.005858	2017-02-15 16:43:54.005858
143	78764	/r/languagelearning	languagelearning	\N	2017-02-15 16:43:54.984421	2017-02-15 16:43:54.984421
144	217492	/r/fo4	fo4	\N	2017-02-15 16:44:23.293314	2017-02-15 16:44:23.293314
145	1526	/r/fodust	fodust	\N	2017-02-15 16:44:24.167108	2017-02-15 16:44:24.167108
146	216608	/r/smashbros	smashbros	\N	2017-02-15 16:44:25.039869	2017-02-15 16:44:25.039869
147	3377	/r/TheDickShow	TheDickShow	\N	2017-02-15 16:44:55.578364	2017-02-15 16:44:55.578364
148	194368	/r/trippinthroughtime	trippinthroughtime	\N	2017-02-15 16:45:19.785357	2017-02-15 16:45:19.785357
149	35636	/r/Standup	Standup	\N	2017-02-15 16:45:20.699803	2017-02-15 16:45:20.699803
150	192728	/r/gardening	gardening	\N	2017-02-15 16:45:52.070943	2017-02-15 16:45:52.070943
151	158519	/r/PublicFreakout	PublicFreakout	\N	2017-02-15 16:45:53.026434	2017-02-15 16:45:53.026434
152	50724	/r/vancouver	vancouver	\N	2017-02-15 16:46:24.180349	2017-02-15 16:46:24.180349
153	827012	/r/gameofthrones	gameofthrones	\N	2017-02-15 16:46:25.266003	2017-02-15 16:46:25.266003
154	18	/r/PowerDeleteSuite	PowerDeleteSuite	\N	2017-02-15 16:46:54.043206	2017-02-15 16:46:54.043206
155	14686	/r/NintendoNX	NintendoNX	\N	2017-02-15 16:47:24.031556	2017-02-15 16:47:24.031556
156	131387	/r/raisedbynarcissists	raisedbynarcissists	\N	2017-02-15 16:47:25.21561	2017-02-15 16:47:25.21561
157	630910	/r/pokemon	pokemon	\N	2017-02-15 16:47:26.153936	2017-02-15 16:47:26.153936
158	5379	/r/EternalCardGame	EternalCardGame	\N	2017-02-15 16:47:54.995584	2017-02-15 16:47:54.995584
159	464304	/r/buildapc	buildapc	\N	2017-02-15 16:48:23.699947	2017-02-15 16:48:23.699947
160	2825	/r/HardwareSwapUK	HardwareSwapUK	\N	2017-02-15 16:48:24.517697	2017-02-15 16:48:24.517697
161	22044	/r/randomactsofcsgo	randomactsofcsgo	\N	2017-02-15 16:48:25.360301	2017-02-15 16:48:25.360301
162	21675	/r/leafs	leafs	\N	2017-02-15 16:48:56.033204	2017-02-15 16:48:56.033204
163	2604	/r/canes	canes	\N	2017-02-15 16:48:57.047508	2017-02-15 16:48:57.047508
164	124067	/r/teenagers	teenagers	\N	2017-02-15 16:48:57.910466	2017-02-15 16:48:57.910466
165	39787	/r/Cricket	Cricket	\N	2017-02-15 16:49:28.493184	2017-02-15 16:49:28.493184
166	2408	/r/IndiaSpeaks	IndiaSpeaks	\N	2017-02-15 16:49:29.610733	2017-02-15 16:49:29.610733
167	9963517	/r/Art	Art	\N	2017-02-15 16:50:00.823905	2017-02-15 16:50:00.823905
168	4670	/r/KidCudi	KidCudi	\N	2017-02-15 16:50:01.639904	2017-02-15 16:50:01.639904
169	289272	/r/Drugs	Drugs	\N	2017-02-15 16:50:32.315428	2017-02-15 16:50:32.315428
170	5219	/r/lawschooladmissions	lawschooladmissions	\N	2017-02-15 16:50:33.332258	2017-02-15 16:50:33.332258
171	32164	/r/CanadaPolitics	CanadaPolitics	\N	2017-02-15 16:51:02.774346	2017-02-15 16:51:02.774346
172	11757843	/r/books	books	\N	2017-02-15 16:51:03.698889	2017-02-15 16:51:03.698889
173	9528	/r/acne	acne	\N	2017-02-15 16:51:32.598283	2017-02-15 16:51:32.598283
174	13117	/r/unturned	unturned	\N	2017-02-15 16:51:33.59996	2017-02-15 16:51:33.59996
175	47735	/r/hardwareswap	hardwareswap	\N	2017-02-15 16:51:34.543744	2017-02-15 16:51:34.543744
176	2599	/r/postmates	postmates	\N	2017-02-15 16:52:04.623198	2017-02-15 16:52:04.623198
177	15213	/r/AyyMD	AyyMD	\N	2017-02-15 16:52:30.465714	2017-02-15 16:52:30.465714
178	326139	/r/geek	geek	\N	2017-02-15 16:52:31.308005	2017-02-15 16:52:31.308005
179	40229	/r/philadelphia	philadelphia	\N	2017-02-15 16:53:00.135014	2017-02-15 16:53:00.135014
180	30857	/r/resumes	resumes	\N	2017-02-15 16:53:01.035098	2017-02-15 16:53:01.035098
181	35998	/r/donaldglover	donaldglover	\N	2017-02-15 16:53:01.891266	2017-02-15 16:53:01.891266
182	88793	/r/LSD	LSD	\N	2017-02-15 16:53:37.156545	2017-02-15 16:53:37.156545
183	240	/r/IMDbFilmGeneral	IMDbFilmGeneral	\N	2017-02-15 16:54:37.49051	2017-02-15 16:54:37.49051
184	637320	/r/malefashionadvice	malefashionadvice	\N	2017-02-15 16:54:38.314846	2017-02-15 16:54:38.314846
185	87601	/r/EliteDangerous	EliteDangerous	\N	2017-02-15 16:54:39.195717	2017-02-15 16:54:39.195717
186	60173	/r/blackops3	blackops3	\N	2017-02-15 16:55:10.051794	2017-02-15 16:55:10.051794
187	29124	/r/WildStar	WildStar	\N	2017-02-15 16:55:38.984513	2017-02-15 16:55:38.984513
188	226	/r/roleplayponies	roleplayponies	\N	2017-02-15 16:56:09.307879	2017-02-15 16:56:09.307879
189	60511	/r/StarWarsBattlefront	StarWarsBattlefront	\N	2017-02-15 16:56:10.162563	2017-02-15 16:56:10.162563
190	8274	/r/Nisekoi	Nisekoi	\N	2017-02-15 16:56:41.65038	2017-02-15 16:56:41.65038
191	8703	/r/kancolle	kancolle	\N	2017-02-15 16:56:42.530494	2017-02-15 16:56:42.530494
192	88880	/r/ClashOfClans	ClashOfClans	\N	2017-02-15 16:56:45.653939	2017-02-15 16:56:45.653939
193	105425	/r/Buddhism	Buddhism	\N	2017-02-15 16:56:46.543328	2017-02-15 16:56:46.543328
194	218532	/r/TheSilphRoad	TheSilphRoad	\N	2017-02-15 16:57:15.332376	2017-02-15 16:57:15.332376
195	53980	/r/pokemontrades	pokemontrades	\N	2017-02-15 16:57:16.261987	2017-02-15 16:57:16.261987
196	35397	/r/Metalcore	Metalcore	\N	2017-02-15 16:57:49.377383	2017-02-15 16:57:49.377383
197	15283	/r/RainbowSixSiege	RainbowSixSiege	\N	2017-02-15 16:58:16.457677	2017-02-15 16:58:16.457677
198	23590	/r/CHIBears	CHIBears	\N	2017-02-15 16:58:17.299368	2017-02-15 16:58:17.299368
199	387396	/r/Steam	Steam	\N	2017-02-15 16:58:18.309835	2017-02-15 16:58:18.309835
200	168479	/r/battlefield_one	battlefield_one	\N	2017-02-15 16:58:19.113314	2017-02-15 16:58:19.113314
201	20520	/r/rct	rct	\N	2017-02-15 16:58:49.047605	2017-02-15 16:58:49.047605
202	14450	/r/Dodgers	Dodgers	\N	2017-02-15 16:58:49.862151	2017-02-15 16:58:49.862151
203	20000	/r/TrueDoTA2	TrueDoTA2	\N	2017-02-15 16:58:50.752267	2017-02-15 16:58:50.752267
204	17553	/r/portugal	portugal	\N	2017-02-15 16:59:22.477061	2017-02-15 16:59:22.477061
205	49803	/r/Romania	Romania	\N	2017-02-15 16:59:23.446301	2017-02-15 16:59:23.446301
206	65652	/r/microgrowery	microgrowery	\N	2017-02-15 16:59:52.622431	2017-02-15 16:59:52.622431
207	3191	/r/AssCredit	AssCredit	\N	2017-02-15 17:00:20.210922	2017-02-15 17:00:20.210922
208	27365	/r/NASCAR	NASCAR	\N	2017-02-15 17:00:51.982396	2017-02-15 17:00:51.982396
209	139537	/r/heroesofthestorm	heroesofthestorm	\N	2017-02-15 17:00:53.003573	2017-02-15 17:00:53.003573
210	10843	/r/moviescirclejerk	moviescirclejerk	\N	2017-02-15 17:00:53.890033	2017-02-15 17:00:53.890033
211	367688	/r/TrueReddit	TrueReddit	\N	2017-02-15 17:01:21.554776	2017-02-15 17:01:21.554776
212	32970	/r/RocketLeagueExchange	RocketLeagueExchange	\N	2017-02-15 17:01:52.56715	2017-02-15 17:01:52.56715
213	6648	/r/Albuquerque	Albuquerque	\N	2017-02-15 17:02:20.991601	2017-02-15 17:02:20.991601
214	5400	/r/APStudents	APStudents	\N	2017-02-15 17:02:21.858464	2017-02-15 17:02:21.858464
215	105248	/r/friendsafari	friendsafari	\N	2017-02-15 17:02:51.659013	2017-02-15 17:02:51.659013
216	183009	/r/magicTCG	magicTCG	\N	2017-02-15 17:03:22.034268	2017-02-15 17:03:22.034268
217	29904	/r/Drama	Drama	\N	2017-02-15 17:03:54.19052	2017-02-15 17:03:54.19052
218	132088	/r/lgbt	lgbt	\N	2017-02-15 17:04:22.067214	2017-02-15 17:04:22.067214
219	2520	/r/RPDRDRAMA	RPDRDRAMA	\N	2017-02-15 17:04:23.006423	2017-02-15 17:04:23.006423
220	93550	/r/cscareerquestions	cscareerquestions	\N	2017-02-15 17:05:24.076621	2017-02-15 17:05:24.076621
221	138628	/r/darksouls3	darksouls3	\N	2017-02-15 17:05:24.959748	2017-02-15 17:05:24.959748
\.


--
-- Name: subreddits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: christiancarey1
--

SELECT pg_catalog.setval('subreddits_id_seq', 221, true);


--
-- PostgreSQL database dump complete
--

