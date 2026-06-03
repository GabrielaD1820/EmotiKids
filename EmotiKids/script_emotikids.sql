--
-- PostgreSQL database dump
--

\restrict z8KLGUIOaSvGcuhk9lfFi2Dk0TKD9r9aiuYdOAHb1ldMa3Rl2rSYuiiwiye8uvg

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

-- Started on 2026-06-03 07:39:39

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16465)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    id integer NOT NULL,
    usuario_id integer,
    accion character varying(200),
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16464)
-- Name: bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bitacora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bitacora_id_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 217
-- Name: bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_id_seq OWNED BY public.bitacora.id;


--
-- TOC entry 216 (class 1259 OID 16455)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100),
    correo character varying(100),
    clave character varying(100),
    rol character varying(20),
    estado boolean DEFAULT true
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16454)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4695 (class 2604 OID 16468)
-- Name: bitacora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN id SET DEFAULT nextval('public.bitacora_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 16458)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4850 (class 0 OID 16465)
-- Dependencies: 218
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (id, usuario_id, accion, fecha) FROM stdin;
1	3	Inicio de sesion	2026-06-01 00:42:22.77348
2	1	Inicio de sesion	2026-06-01 00:48:02.60501
3	1	Inicio de sesion	2026-06-01 01:08:03.621509
4	1	Inicio de sesion	2026-06-01 01:23:22.985137
5	1	Inicio de sesion	2026-06-01 01:23:44.636898
6	2	Inicio de sesion	2026-06-01 01:47:17.451224
7	2	Visito Alegria	2026-06-01 01:47:20.532793
8	2	Inicio de sesion	2026-06-01 02:41:59.450253
9	2	Visito Tristeza	2026-06-01 02:42:01.768919
10	2	Visito Enojo	2026-06-01 02:42:06.377443
11	2	Visito Miedo	2026-06-01 02:42:09.881858
12	2	Visito Miedo	2026-06-01 02:42:14.57114
13	1	Inicio de sesion	2026-06-01 04:44:08.403505
14	2	Inicio de sesion	2026-06-01 04:45:23.315395
15	2	Visito Alegria	2026-06-01 04:45:31.50875
16	2	Visito Tristeza	2026-06-01 04:45:42.004175
17	1	Inicio de sesion	2026-06-01 10:21:39.088432
18	2	Inicio de sesion	2026-06-01 11:22:51.324036
19	2	Visito Alegria	2026-06-01 11:33:28.92872
20	2	Visito Tristeza	2026-06-01 11:33:40.453822
21	1	Inicio de sesion	2026-06-01 12:03:55.863466
22	1	Inicio de sesion	2026-06-01 12:05:04.501805
23	2	Inicio de sesion	2026-06-01 18:08:33.19477
24	1	Inicio de sesion	2026-06-01 21:09:16.844537
25	1	Visito Alegria	2026-06-01 21:09:32.526781
26	1	Visito Alegria	2026-06-01 21:12:39.275415
27	3	Inicio de sesion	2026-06-01 21:12:56.616684
28	3	Visito Alegria	2026-06-01 21:13:10.849611
29	3	Inicio de sesion	2026-06-01 23:38:10.087426
30	1	Inicio de sesion	2026-06-01 23:54:10.773041
31	1	Inicio de sesion	2026-06-01 23:54:50.024844
32	3	Inicio de sesion	2026-06-01 23:55:05.242538
33	1	Inicio de sesion	2026-06-02 08:55:10.668508
34	1	Inicio de sesion	2026-06-02 10:26:23.973199
35	2	Inicio de sesion	2026-06-02 10:27:01.111932
36	1	Inicio de sesion	2026-06-02 10:28:03.987122
37	3	Inicio de sesion	2026-06-02 10:31:50.980241
38	1	Inicio de sesion	2026-06-02 10:32:17.662586
39	1	Inicio de sesion	2026-06-02 11:14:37.175036
40	3	Inicio de sesion	2026-06-02 11:48:56.603676
41	3	Ingresó a Actividades	2026-06-02 11:48:59.358836
42	3	Ingresó al Rompecabezas de Alegría	2026-06-02 11:49:02.042131
43	3	Ingresó a Actividades	2026-06-02 11:49:13.149285
44	1	Inicio de sesion	2026-06-02 11:49:39.105422
45	2	Inicio de sesion	2026-06-02 12:21:05.019177
46	2	Visito Alegria	2026-06-02 12:21:12.346835
47	1	Inicio de sesion	2026-06-02 20:09:08.176654
48	2	Inicio de sesion	2026-06-02 20:11:58.46672
49	2	Ingresó a Actividades	2026-06-02 20:12:01.137629
50	2	Ingresó al Memorama de Emociones	2026-06-02 20:12:03.30221
51	2	Ingresó a Actividades	2026-06-02 20:12:26.897741
52	1	Inicio de sesion	2026-06-02 20:12:41.488683
56	1	Inicio de sesion	2026-06-02 22:42:50.859096
57	1	Inicio de sesion	2026-06-02 22:47:41.433734
58	1	Ingresó a Actividades	2026-06-02 22:47:46.008884
59	1	Ingresó al Rompecabezas de Alegría	2026-06-02 22:47:50.256942
60	1	Ingresó al Rompecabezas de Alegría	2026-06-02 22:48:11.655265
61	1	Ingresó a Actividades	2026-06-02 22:48:21.297457
62	1	Ingresó a Relacionar Emociones	2026-06-02 22:48:26.993181
63	1	Ingresó a Actividades	2026-06-02 22:48:46.31271
64	1	Ingresó al Memorama de Emociones	2026-06-02 22:48:49.782357
65	1	Ingresó a Actividades	2026-06-02 22:49:12.806345
66	1	Ingresó al Quiz de Alegría	2026-06-02 22:50:32.337137
67	1	Inicio de sesion	2026-06-02 23:03:15.818798
68	1	Visitó Enojo	2026-06-02 23:03:51.009465
69	1	Ingresó a Actividades	2026-06-02 23:03:58.422151
70	1	Ingresó al Rompecabezas	2026-06-02 23:04:02.631737
71	1	Ingresó a Actividades	2026-06-02 23:04:26.918964
72	1	Ingresó al Memorama	2026-06-02 23:04:31.761305
73	1	Ingresó a Actividades	2026-06-02 23:04:55.706246
74	1	Inicio de sesion	2026-06-02 23:24:42.260832
75	3	Inicio de sesion	2026-06-02 23:25:07.598197
76	1	Visitó Alegría	2026-06-02 23:34:41.711532
77	3	Ingresó a Actividades	2026-06-02 23:39:44.789557
78	3	Ingresó a Actividades	2026-06-02 23:47:46.378574
79	1	Inicio de sesion	2026-06-02 23:48:10.283742
80	1	Inicio de sesion	2026-06-02 23:56:39.149251
81	1	Visitó Alegría	2026-06-02 23:56:41.864789
82	1	Visitó Alegría	2026-06-02 23:57:24.882088
83	1	Visitó Alegría	2026-06-03 00:01:06.284072
84	3	Inicio de sesion	2026-06-03 00:01:40.080848
85	3	Visitó Alegría	2026-06-03 00:01:45.520773
86	1	Visitó Alegría	2026-06-03 00:02:46.964685
87	1	Visitó Alegría	2026-06-03 00:02:52.902743
88	1	Ingresó a Actividades	2026-06-03 00:05:05.285856
89	3	Ingresó a Actividades	2026-06-03 00:05:29.374726
90	3	Ingresó a Actividades	2026-06-03 00:06:00.907984
91	1	Inicio de sesion	2026-06-03 00:07:03.889334
92	1	Ingresó a Actividades	2026-06-03 00:20:56.329557
93	1	Visitó Alegría	2026-06-03 00:21:13.800368
94	1	Inicio de sesion	2026-06-03 00:21:54.01564
95	2	Inicio de sesion	2026-06-03 00:22:29.266867
96	2	Visitó Alegría	2026-06-03 00:24:17.221334
97	2	Visitó Alegría	2026-06-03 00:31:14.72508
98	2	Visitó Alegría	2026-06-03 00:33:42.223722
99	2	Visitó Alegría	2026-06-03 00:42:11.761133
100	2	Visitó Alegría	2026-06-03 00:42:54.391959
101	2	Visitó Enojo	2026-06-03 00:49:22.377235
102	2	Ingresó a Actividades	2026-06-03 00:50:58.176135
103	2	Ingresó a Actividades	2026-06-03 01:03:48.086842
104	2	Visitó Tristeza	2026-06-03 01:07:14.654524
105	2	Visitó Miedo	2026-06-03 01:09:06.053228
106	2	Inicio de sesion	2026-06-03 01:19:56.122138
107	2	Visitó Miedo	2026-06-03 01:20:11.889763
108	2	Visitó Alegría	2026-06-03 01:21:16.63607
109	2	Visitó Alegría	2026-06-03 01:23:07.37194
110	2	Visitó Alegría	2026-06-03 01:24:54.647152
111	2	Visitó Alegría	2026-06-03 01:31:25.364012
112	2	Inicio de sesion	2026-06-03 01:43:47.240586
113	2	Visitó Alegría	2026-06-03 01:43:51.653844
114	2	Visitó Alegría	2026-06-03 01:45:17.869131
115	2	Ingresó a Actividades	2026-06-03 01:45:28.951735
116	2	Visitó Enojo	2026-06-03 01:46:10.14858
117	2	Visitó Alegría	2026-06-03 01:46:19.853578
118	2	Visitó Tristeza	2026-06-03 01:46:54.438138
119	2	Visitó Miedo	2026-06-03 01:47:20.0479
120	2	Visitó Alegría	2026-06-03 01:52:03.774161
121	2	Visitó Tristeza	2026-06-03 01:53:57.901522
122	2	Ingresó a Actividades	2026-06-03 01:54:03.269421
123	2	Ingresó a Actividades	2026-06-03 01:54:29.480054
124	2	Ingresó a Actividades	2026-06-03 01:55:49.534416
125	2	Visitó Alegría	2026-06-03 01:55:51.69492
126	2	Ingresó a Actividades	2026-06-03 01:56:07.800162
127	2	Ingresó al Quiz de Tristeza	2026-06-03 01:56:10.758528
128	2	Ingresó a Actividades	2026-06-03 01:56:19.395561
129	2	Ingresó al Quiz de Enojo	2026-06-03 01:56:20.697869
130	2	Ingresó a Actividades	2026-06-03 01:56:32.234442
131	2	Ingresó al Quiz de Miedo	2026-06-03 01:56:35.074541
132	2	Ingresó a Actividades	2026-06-03 01:56:42.709951
133	2	Ingresó al Memorama	2026-06-03 01:56:45.975817
134	2	Ingresó a Actividades	2026-06-03 01:56:49.483396
135	2	Ingresó a Relacionar Emociones	2026-06-03 01:56:52.003423
136	2	Ingresó a Actividades	2026-06-03 01:57:12.061184
137	2	Ingresó al Rompecabezas	2026-06-03 01:57:15.953735
138	2	Visitó Alegría	2026-06-03 01:57:37.372799
139	2	Ingresó a Actividades	2026-06-03 01:58:56.881779
140	2	Ingresó al Quiz de Enojo	2026-06-03 01:58:58.302582
141	2	Ingresó a Actividades	2026-06-03 01:59:05.385197
142	2	Ingresó al Quiz de Tristeza	2026-06-03 01:59:06.285224
143	2	Ingresó a Actividades	2026-06-03 02:01:07.788378
144	2	Ingresó al Quiz de Miedo	2026-06-03 02:01:12.63686
145	2	Ingresó a Actividades	2026-06-03 02:01:14.631459
146	2	Ingresó al Memorama	2026-06-03 02:01:17.912142
147	2	Ingresó a Actividades	2026-06-03 02:01:22.189684
148	2	Ingresó a Relacionar Emociones	2026-06-03 02:01:25.288758
149	2	Ingresó a Actividades	2026-06-03 02:02:25.584067
150	2	Ingresó al Rompecabezas	2026-06-03 02:02:30.20026
151	1	Inicio de sesion	2026-06-03 02:06:22.041125
152	2	Ingresó a Actividades	2026-06-03 02:14:53.81674
153	2	Inicio de sesion	2026-06-03 03:08:02.419153
154	2	Visitó Alegría	2026-06-03 03:08:55.679352
155	2	Ingresó a Actividades	2026-06-03 03:09:56.832172
156	2	Ingresó a Actividades	2026-06-03 03:10:22.970714
157	2	Ingresó a Actividades	2026-06-03 03:11:21.773976
158	2	Ingresó al Quiz de Enojo	2026-06-03 03:11:25.211014
159	2	Ingresó a Actividades	2026-06-03 03:11:58.25666
160	2	Ingresó a Relacionar Emociones	2026-06-03 03:12:02.65015
161	2	Ingresó a Actividades	2026-06-03 03:12:47.972907
162	2	Ingresó a Actividades	2026-06-03 03:12:54.797529
163	2	Ingresó al Rompecabezas	2026-06-03 03:12:58.171163
164	1	Inicio de sesion	2026-06-03 03:15:05.000081
165	1	Ingresó a Actividades	2026-06-03 03:15:23.774331
166	1	Ingresó al Rompecabezas	2026-06-03 03:15:26.765557
167	1	Ingresó a Actividades	2026-06-03 03:16:38.287252
168	2	Ingresó a Actividades	2026-06-03 03:22:48.85375
169	2	Ingresó a Actividades	2026-06-03 03:23:45.723851
170	2	Visitó Alegría	2026-06-03 03:23:49.512113
171	2	Ingresó a Actividades	2026-06-03 03:33:33.161563
172	2	Ingresó a Actividades	2026-06-03 03:39:47.766142
173	2	Ingresó a Actividades	2026-06-03 03:40:54.651543
174	2	Inicio de sesion	2026-06-03 06:04:43.972311
\.


--
-- TOC entry 4848 (class 0 OID 16455)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, correo, clave, rol, estado) FROM stdin;
1	Administrador	admin@gmail.com	admin123	ADMIN	t
2	Gabriela	gabriela@gmail.com	12345678	ESTUDIANTE	t
3	Ana	ana@gmail.com	12345678	ESTUDIANTE	t
\.


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 217
-- Name: bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_id_seq', 174, true);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- TOC entry 4702 (class 2606 OID 16471)
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16463)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4700 (class 2606 OID 16461)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 16472)
-- Name: bitacora bitacora_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


-- Completed on 2026-06-03 07:39:39

--
-- PostgreSQL database dump complete
--

\unrestrict z8KLGUIOaSvGcuhk9lfFi2Dk0TKD9r9aiuYdOAHb1ldMa3Rl2rSYuiiwiye8uvg

