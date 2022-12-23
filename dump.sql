--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.users.id;


--
-- Name: urls_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq1 OWNED BY public.urls.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq1'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '7618f613-a1b8-4c60-86a1-84f922552891', '2022-12-21 04:02:20.082063');
INSERT INTO public.sessions VALUES (2, 3, '27e072fc-a661-420c-89e4-dfc76245a9a2', '2022-12-22 14:39:52.890664');
INSERT INTO public.sessions VALUES (3, 4, 'a7f398e0-d803-4f1c-aac9-73ac1b7db009', '2022-12-23 08:54:19.528031');
INSERT INTO public.sessions VALUES (4, 5, '7d5bb887-4405-493b-9615-7f579aea6d31', '2022-12-23 08:55:20.557311');
INSERT INTO public.sessions VALUES (5, 6, '52aa02d9-bbab-4ec5-abf2-f6173de89dd2', '2022-12-23 08:55:23.606794');
INSERT INTO public.sessions VALUES (6, 7, 'bb0279d9-ce2d-4318-90ac-52f6f8c3497c', '2022-12-23 08:55:25.797046');
INSERT INTO public.sessions VALUES (7, 8, '3d616467-51ce-43e3-89b5-e5124a3f8ba0', '2022-12-23 08:55:28.633226');
INSERT INTO public.sessions VALUES (8, 9, 'c105e545-9134-49ec-b523-bf87fd8b974f', '2022-12-23 08:55:30.909652');
INSERT INTO public.sessions VALUES (9, 12, '27c463a8-0d43-4960-a601-8824aeb1f234', '2022-12-23 09:06:27.788504');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (9, 5, 'https://www.facebook.com/campaign/landing.php?&campaign_id=1661784632&extra_1=s%7Cc%7C320269324047%7Ce%7Cfacebook%7C&placement=&creative=320269324047&keyword=facebook&partner_id=googlesem&extra_2=campaignid%3D1661784632%26adgroupid%3D63686352403%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-541132862%26loc_physical_ms%3D9102312%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=Cj0KCQiAwJWdBhCYARIsAJc4idAfkn7o-tK_DihrUfgP6Lk6oL5ViHUHRL9YlUToNgfGnajXgULF0v0aAtwtEALw_wcB', 'KtVIDS', 15, '2022-12-23 09:02:23.463416');
INSERT INTO public.urls VALUES (11, 6, 'https://www.pgadmin.org/development/', 'nfiAjX', 9, '2022-12-23 09:08:13.566662');
INSERT INTO public.urls VALUES (5, 4, 'https://www.google.com/search?q=imagens&hl=pt-BR&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjbmdzL14_8AhUqr5UCHXLgD3sQ_AUoAXoECAEQAw&biw=1651&bih=533&dpr=1#imgrc=YZxSE3QW-Me-XM', 'rBFHwX', 24, '2022-12-23 08:56:33.501906');
INSERT INTO public.urls VALUES (4, 3, 'https://stackoverflow.com/questions/4075287/node-express-eaddrinuse-address-already-in-use-kill-server', 'pQIhsN', 6, '2022-12-22 22:50:03.998226');
INSERT INTO public.urls VALUES (6, 4, 'https://ge.globo.com/futebol/copa-do-mundo/noticia/2022/12/23/federacao-francesa-reclama-de-excessos-de-jogadores-da-argentina-na-comemoracao-do-titulo.ghtml', '6sRHnj', 17, '2022-12-23 08:56:55.680224');
INSERT INTO public.urls VALUES (8, 5, 'https://www.google.com/webhp?hl=pt-BR&ictx=2&sa=X&ved=0ahUKEwiYjYnr2I_8AhWajJUCHSs4BkIQPQgI', 'vWuPEP', 8, '2022-12-23 09:02:06.379199');
INSERT INTO public.urls VALUES (2, 3, 'https://www.notion.so/Projeto-Shortly-API-888b41732e644058807109002d2d2897', '9ZzRCL', 10, '2022-12-22 14:41:15.601834');
INSERT INTO public.urls VALUES (1, 1, 'https://calendar.google.com/calendar/u/0/r?cid=Y19ybjg5bGFvZjBzNjRnOTlsam8wdDV2N2wyOEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&pli=1', '5HVQSV', 6, '2022-12-21 04:22:03.143842');
INSERT INTO public.urls VALUES (7, 9, 'https://pantheon.ufrj.br/bitstream/11422/2879/4/EPLoureiro.pdf', '3Uuu9H', 10, '2022-12-23 08:57:27.121194');
INSERT INTO public.urls VALUES (12, 5, 'https://www.pgadmin.org/docs/pgadmin4/6.18/release_notes_6_18.html', '6aJ0-z', 16, '2022-12-23 09:09:10.887904');
INSERT INTO public.urls VALUES (13, 8, 'https://github.com/pgadmin-org/pgadmin4/issues/5453', 'FhoE9-', 21, '2022-12-23 09:11:27.355709');
INSERT INTO public.urls VALUES (10, 12, 'https://www.pgadmin.org/download/pgadmin-4-apt/', 'Yd9vvm', 8, '2022-12-23 09:07:11.770877');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'vit', 'teste@teste.com', '$2b$10$bC8rAqUaSIGpZsWnkutEGO8OBPWg0jgWqWkAB/x/N0qN9Vp0AFVGG', '2022-12-21 03:41:33.690999');
INSERT INTO public.users VALUES (2, 'vit', 'teste@teste.com', '$2b$10$UOYzRj7e0aPOVlUKYoMpXOLFrmv4B8CJ1d8Kc26y7/yKSk1zZzAZu', '2022-12-21 03:41:54.050816');
INSERT INTO public.users VALUES (3, 'teste', 'vitor@teste.com', '$2b$10$dCOFs.F/hxqWjJZfmcTPceaejdcDiTUI5WjTa9yQfEWICoCLret8K', '2022-12-22 14:39:39.701657');
INSERT INTO public.users VALUES (4, 'teste1', 'teste@teste3.com', '$2b$10$.My6konMgg7x9cfjMbgBEei8GQOch5OdPGErdgTC82.4R9ZN9lyvC', '2022-12-23 08:52:13.603328');
INSERT INTO public.users VALUES (5, 'teste1', 'teste@teste4.com', '$2b$10$IVtO0uV/FMjVksknedruK.N85BxySmwM00kyOyoAxTAIitcqWALva', '2022-12-23 08:52:20.012872');
INSERT INTO public.users VALUES (6, 'teste2', 'teste@teste5.com', '$2b$10$jPyrnS2Kl1DC6a5wH09tvu.yvaRkZ4FFq.AVu93IoHbZnqGKeMxL2', '2022-12-23 08:52:24.050084');
INSERT INTO public.users VALUES (7, 'teste2', 'teste@teste6.com', '$2b$10$ohL4vVjYDBFgypj.u1z7lOj03PjXt7CpY70jwKZAANqiQPnpTneAe', '2022-12-23 08:52:27.225833');
INSERT INTO public.users VALUES (8, 'teste2', 'teste@teste7.com', '$2b$10$7I7AuC/m2EhXs3Ub2W1BkeLJ7ZjxIzyc8N6/YYnvmfy49/IhTOLzm', '2022-12-23 08:52:30.725812');
INSERT INTO public.users VALUES (9, 'teste2', 'teste@teste8.com', '$2b$10$ovWYGwSw4WBeZm7h.KUESOZGL56zWwCLEKZykoFpkgAOxyATMHMYC', '2022-12-23 08:52:34.114145');
INSERT INTO public.users VALUES (10, 'teste2', 'teste@teste9.com', '$2b$10$a73qAKBnAHF7GD8Rkjbihu5OGP7smFkHlbGQtdvx4jUBl.9juvfVe', '2022-12-23 08:53:39.550495');
INSERT INTO public.users VALUES (11, 'teste2', 'teste@teste10.com', '$2b$10$P/h7ARudDn8o7xne1sLtn.9Ro6LHJSgWLocO1Tetq8NxpHDbdIL6y', '2022-12-23 08:53:54.371838');
INSERT INTO public.users VALUES (12, 'teste3', 'teste@teste12.com', '$2b$10$9KGuQIHT9AP9fF392O3XneX4CCREELyN.39wX6A5VSXqf1Q4ijnKy', '2022-12-23 09:05:51.335148');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 9, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: urls_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq1', 13, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey1 PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

