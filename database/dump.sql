--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.storages DROP CONSTRAINT storages_fk1;
ALTER TABLE ONLY public.storages DROP CONSTRAINT storages_fk0;
ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_fk1;
ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_fk0;
ALTER TABLE ONLY public.users DROP CONSTRAINT "users_userName_key";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
ALTER TABLE ONLY public.storages DROP CONSTRAINT storages_pk;
ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pk;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pk;
ALTER TABLE public.users ALTER COLUMN "userId" DROP DEFAULT;
ALTER TABLE public.storages ALTER COLUMN "storageId" DROP DEFAULT;
ALTER TABLE public.messages ALTER COLUMN "messageId" DROP DEFAULT;
ALTER TABLE public.addresses ALTER COLUMN "addressId" DROP DEFAULT;
DROP SEQUENCE public."users_userId_seq";
DROP TABLE public.users;
DROP SEQUENCE public."storages_storageId_seq";
DROP TABLE public.storages;
DROP SEQUENCE public."messages_messageId_seq";
DROP TABLE public.messages;
DROP SEQUENCE public."addresses_addressId_seq";
DROP TABLE public.addresses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    "addressId" integer NOT NULL,
    street1 text NOT NULL,
    street2 text,
    city text NOT NULL,
    state text NOT NULL,
    zip integer NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL
);


--
-- Name: addresses_addressId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."addresses_addressId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_addressId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."addresses_addressId_seq" OWNED BY public.addresses."addressId";


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    "messageId" integer NOT NULL,
    "fromId" integer NOT NULL,
    "toId" integer NOT NULL,
    message text NOT NULL,
    "messagedAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: messages_messageId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."messages_messageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_messageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."messages_messageId_seq" OWNED BY public.messages."messageId";


--
-- Name: storages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.storages (
    "storageId" integer NOT NULL,
    width integer NOT NULL,
    depth integer NOT NULL,
    height integer NOT NULL,
    "storagePicturePath" text NOT NULL,
    "pricePerDay" integer NOT NULL,
    "maxValue" integer NOT NULL,
    title text NOT NULL,
    "longDescription" text NOT NULL,
    "addressId" integer NOT NULL,
    "hostId" integer NOT NULL,
    "isAvailable" boolean DEFAULT true NOT NULL
);


--
-- Name: storages_storageId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."storages_storageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: storages_storageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."storages_storageId_seq" OWNED BY public.storages."storageId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    "userName" text NOT NULL,
    password text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    email text NOT NULL,
    "aboutMe" text NOT NULL,
    "profilePicturePath" text NOT NULL
);


--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: addresses addressId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN "addressId" SET DEFAULT nextval('public."addresses_addressId_seq"'::regclass);


--
-- Name: messages messageId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN "messageId" SET DEFAULT nextval('public."messages_messageId_seq"'::regclass);


--
-- Name: storages storageId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages ALTER COLUMN "storageId" SET DEFAULT nextval('public."storages_storageId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.addresses ("addressId", street1, street2, city, state, zip, longitude, latitude) FROM stdin;
1	2424 Mapleton Ave	\N	Boulder	CO	80304	-105.264590999999996	40.0239449999999977
2	2324 19th St	\N	Boulder	CO	80304	-105.271807999999993	40.0234909999999999
3	141 Pineview	\N	Irvine	CA	92620	-117.757458999999997	33.7162089999999992
4	14252 Culver Dr	#A-632	Irvine	CA	92604	-117.784261999999998	33.7072640000000021
5	2244 Bob Moses Ave	null	Carpinteria	CA	92244	-119.520120000000006	34.4020620000000008
6	13444 Henry Moses Ave	null	Carpinteria	CA	92244	-119.525936999999999	34.3936399999999978
7	13444 Henry Moses Ave	null	Carpinteria	CA	92244	-119.501232000000002	34.3859429999999975
8	13444 Henry Moses Ave	null	Carpinteria	CA	92244	-119.485247999999999	34.3850649999999973
10	1319 N Lincoln Ave	\N	Fullerton	CA	92831	-117.911054800000002	33.8839418000000023
11	936 Paloma Pl.	\N	Fullerton	CA	92835	-117.939957300000003	33.8985632999999993
13	20 Lake Road	\N	Irvine	CA	92604	-117.802688700000004	33.6760366000000033
14	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
15	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
16	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
17	936 Paloma Pl.	\N	Fullerton	CA	92835	-117.939957300000003	33.8985632999999993
18	9205 Irvine Center Drive	\N	Irvine	CA	92618	-117.735023699999999	33.6349955000000023
9	apples and oranges and avocados ave	\N	Irvine	CA	98763	-117.792620999999997	33.6824590000000015
12	2555 Main Street	\N	Irvine	CA	92614	-117.802610999999999	33.6764110000000016
19	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
20	9000 irvine Center drive	\N	Irvine	CA	12345	-117.740589	33.6368865999999969
21	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
22	9200 Irvine Center Drive	\N	Irvine	CA	92618	-117.740498500000001	33.6348674999999986
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages ("messageId", "fromId", "toId", message, "messagedAt") FROM stdin;
1	1	2	Como se llama?	2020-01-22 22:45:31.059072
2	2	1	Me llamo Pedro :)	2020-01-22 22:45:31.059072
3	1	2	Callate Pedro!	2020-01-22 22:45:31.059072
8	3	1	I like your storio!	2020-01-22 22:45:31.059072
9	3	2	Hi, I'd like to check out your storio	2020-01-22 22:45:31.059072
10	4	3	Excuse me, I need more space for my toys	2020-01-22 22:45:31.059072
11	1	2	hey dog, this is a test again!	2020-01-22 22:45:31.059072
12	1	2	hey dog, this is a test yet again!	2020-01-27 12:06:07.296427
13	1	3	hey dog, this is a test yet again!	2020-01-27 12:06:33.208087
14	1	2	checking time!	2020-01-27 12:45:37.369767
16	2	1	Hello me	2020-01-28 23:06:54.900214
17	2	1	I like cheese	2020-01-30 00:25:45.910338
18	2	3	Which one are you interested in?	2020-01-30 00:27:01.905048
19	5	3	can I store my stolen cars in your storio?	2020-01-30 20:44:27.759441
20	2	5	oifailejdila	2020-01-28 11:34:07.504723
21	2	5	edadeaf	2020-01-28 11:34:41.265091
22	2	5	test~	2020-01-28 11:47:10.948031
23	2	2	adeadae	2020-01-28 12:01:14.978998
24	5	2	hey~	2020-01-30 01:50:50.587877
25	4	5	wassa	2020-01-30 12:42:27.618103
26	1	2	decadcaece	2020-01-30 15:16:29.575521
27	6	5	hey.... that's my place	2020-01-30 15:25:29.455101
28	6	1	shut up and take my money!	2020-01-30 16:22:43.968074
29	5	6	not any more~	2020-01-31 10:55:16.041667
30	1	6	Hi why so rude?	2020-01-31 11:12:34.429398
31	6	1	sorry	2020-01-31 11:19:12.299663
32	1	6	you better be!	2020-01-31 11:19:37.133146
33	1	6	so anyway, still interested?	2020-01-31 16:36:51.697708
34	6	1	sure	2020-01-31 16:38:17.274258
\.


--
-- Data for Name: storages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.storages ("storageId", width, depth, height, "storagePicturePath", "pricePerDay", "maxValue", title, "longDescription", "addressId", "hostId", "isAvailable") FROM stdin;
3	4	6	8	/images/storages/car-garage.jpg	300	1000000	Clean Car Garage Lodge near Downtown	Car garage longDescription Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur luctus justo est, quis posuere lorem ultricies vitae. Sed ut turpis posuere, laoreet diam id, lacinia nisl. Curabitur nec est a metus blandit lobortis.	1	1	t
4	4	6	7	/images/storages/closet.jpg	200	1000000	Clean Car Garage Lodge near Downtown	Car garage longDescription Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur luctus justo est, quis posuere lorem ultricies vitae. Sed ut turpis posuere, laoreet diam id, lacinia nisl. Curabitur nec est a metus blandit lobortis.	2	2	t
12	24	36	24	/images/storages/closet.jpg	25	5500	My storage space is bigger than yours	This storage is really big closet that can fit an entire thing!	4	3	t
11	10	13	2	/images/storages/bob-the-builder.jpg	4	100000	Great storage unit downtown Aspen	longDescription here	3	2	t
13	12	24	12	/images/storages/place.jpg	10	500	Additional space behind garage	Smells great!	2	2	t
18	60	60	12	/images/storages/pee-wees-playhouse-1580417496850.jpg	1000	1	Totally rad storage space	This listing is lit!	12	5	t
15	2	3	1	/images/storages/small-niche-1580375527100.jpeg	124123	12341	Test title	Solid!	10	2	t
16	2	1	3	/images/storages/storage-0001-1580404899047.jpg	1	10	Test title	some space	11	1	t
17	2	3	1	/images/storages/message-icon-1580416391003.png	1	10	Peter's storage	Message!	12	5	t
14	2	3	1	/images/storages/fruits.jpg	3	100000	Fruits are good!	fruity place	9	2	t
19	2	3	1	/images/storages/test-niche-1580433939117.jpg	32	32	plze~	why....	14	6	t
20	3	1	2	/images/storages/user-icon-1580435345921.png	11	11	test2	dec	15	6	t
21	5	1	3	/images/storages/map-icon-1580436024926.png	11	12	WOOOOOOW	hi~\nthis is the place	16	4	t
22	2	1	3	/images/storages/user-icon-1580438438964.png	1	1	Dog house!	test	17	4	t
23	2	1	3	/images/storages/test-niche-1580439140432.jpg	1	100	Dog house!	Oink! Oink!	18	4	t
24	2	2	2	/images/storages/my storage-1580498431618.jpg	100	1200	testaliejdlicfnasdinflihsaj	my place	19	6	t
25	2	2	2	/images/storages/the avatar-1580515601847.jpg	200	4400	asdf	erewadsfaewv	20	5	t
26	1	1	1	/images/storages/my storage-1580517593794.jpg	1	1200	I would like to get some money!	This is my storage	21	6	t
27	3	7	3	/images/storages/Image from iOS-1582067467285.jpg	1200	100000	Test title	Cool place!	22	4	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users ("userId", "userName", password, "firstName", "lastName", email, "aboutMe", "profilePicturePath") FROM stdin;
1	psmith	abbie123	Patrick	Smith	psmith@gmail.com	This is the about me section for Patrick Smith. Patrick Smith has a dog named Abbie and lives in Boulder, CO. He is 29 years olf	/images/users/patrick-smith.jpg
2	bwilson	gaucho123	Brian	Wilson	bwilson@gmail.com	This is the about me section for Brian Wilson. Brian has a dog named Gaucho and lives in Boulder, CO. He is 34 years olf	/images/users/brian-wilson.jpg
3	wardOfCode	beepbeep	Chris	Ward	cjrs@gam.com	sup dudes	/images/users/chris.jpg
5	anaBanana	pass123	Anastasia	Canlas	ana@acanlas.dev	I like the tin man	/images/users/weirdouserpic.jpg
6	peterpan	icanfly	Peter	Han	peterpan@dream.land	I believe in fairy!!!	/images/users/peter-pan.jpg
4	kimchTheMinch	chris	Kimchee	Ward	cjrs2@gam.com	I have to many toys	/images/users/kimch.jpg
\.


--
-- Name: addresses_addressId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."addresses_addressId_seq"', 22, true);


--
-- Name: messages_messageId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."messages_messageId_seq"', 34, true);


--
-- Name: storages_storageId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."storages_storageId_seq"', 27, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."users_userId_seq"', 6, true);


--
-- Name: addresses addresses_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pk PRIMARY KEY ("addressId");


--
-- Name: messages messages_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pk PRIMARY KEY ("messageId");


--
-- Name: storages storages_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_pk PRIMARY KEY ("storageId");


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY ("userId");


--
-- Name: users users_userName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_userName_key" UNIQUE ("userName");


--
-- Name: messages messages_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_fk0 FOREIGN KEY ("fromId") REFERENCES public.users("userId");


--
-- Name: messages messages_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_fk1 FOREIGN KEY ("toId") REFERENCES public.users("userId");


--
-- Name: storages storages_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_fk0 FOREIGN KEY ("addressId") REFERENCES public.addresses("addressId");


--
-- Name: storages storages_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_fk1 FOREIGN KEY ("hostId") REFERENCES public.users("userId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

