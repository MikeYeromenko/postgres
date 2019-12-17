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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    second_name character varying(20) NOT NULL,
    date_of_birth date,
    id_country integer,
    notes text
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_id_seq OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    title character varying(30)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    first_name character varying(20),
    second_name character varying(20),
    date_of_birth date,
    id_country integer,
    notes text
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: directors_usa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors_usa (
    first_name character varying(20),
    second_name character varying(20)
);


ALTER TABLE public.directors_usa OWNER TO postgres;

--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    id integer NOT NULL,
    title character varying(70) NOT NULL,
    box_office bigint,
    year_out integer
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films_actors (
    id_film integer NOT NULL,
    id_actor integer NOT NULL
);


ALTER TABLE public.films_actors OWNER TO postgres;

--
-- Name: films_directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films_directors (
    id_film integer NOT NULL,
    id_director integer NOT NULL
);


ALTER TABLE public.films_directors OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.films_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_id_seq OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: full_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.full_join (
    title character varying(70),
    actor text,
    director text
);


ALTER TABLE public.full_join OWNER TO postgres;

--
-- Name: inner_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inner_join (
    title character varying(70),
    actor text,
    director text
);


ALTER TABLE public.inner_join OWNER TO postgres;

--
-- Name: left_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.left_join (
    title character varying(70),
    actor text,
    dir_name text
);


ALTER TABLE public.left_join OWNER TO postgres;

--
-- Name: right_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.right_join (
    title character varying(70),
    actor text,
    director text
);


ALTER TABLE public.right_join OWNER TO postgres;

--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id, first_name, second_name, date_of_birth, id_country, notes) FROM stdin;
1	Robert John	Downey Jr.	1965-04-04	1	американский актёр, продюсер и музыкант. Лауреат премий «Золотой глобус» (2001, 2010), BAFTA (1993), «Премии Гильдии киноактёров США» (2001) и «Сатурн» (1994, 2009, 2014, 2019), номинант на премии «Оскар» (1993, 2009) и «Эмми» (2001).
2	Christofer Robert	Evans	1981-06-13	1	американский актёр. Мировую известность ему принесла роль Капитана Америки в кинематографической вселенной Marvel. Эванс также исполнил роль Человека-факела в фильме «Фантастическая четвёрка» (2005) и его сиквеле 2007 года.
3	Сэмюэл Генри Джей	Уортингтон	1976-08-02	2	австралийский актёр. Всемирную известность приобрёл благодаря главным ролям в фильмах «Аватар», «Битва Титанов» и его продолжения «Гнев титанов», «Терминатор: Да придёт спаситель», «Прошлой ночью в Нью-Йорке», «На грани» и «По соображениям совести».
4	Зои Ядира	Салдана-Перего	1978-06-19	1	американская актриса и танцовщица.
5	Леонардо Вильгельм	Ди Каприо	1974-11-11	1	америамериканский актёр и продюсер.Четыре раза был номинирован на премию «Оскар» за лучшую мужскую роль в фильмах «Авиатор» (2004), «Кровавый алмаз» (2006), «Волк с Уолл-стрит» (2013) и «Выживший» (2016), а также за лучшую мужскую роль второго плана в фильме «Что гложет Гилберта Грэйпа» (1994). Четыре раза был номинирован на премию BAFTA и одиннадцать раз на премию «Золотой глобус». В 2016 году стал обладателем премии «Оскар» в номинации «Лучшая мужская роль», а также награды за лучшую мужскую роль британской премии BAFTA за исполнение роли Хью Гласса в фильме «Выживший». Лауреат трёх премий «Золотой глобус» за лучшую мужскую роль в драме за роль Говарда Хьюза в фильме «Авиатор» (2004), обладатель премии в номинации «Лучшая мужская роль в комедии или мюзикле» за роль Джордана Белфорта в фильме «Волк с Уолл-стрит» (2013) и в номинации «Лучшая мужская роль в драме» за роль в фильме «Выживший» (2016). Номинант премий «Сатурн», Гильдии киноактёров США и «Спутник». Актёрскую карьеру начал в конце 1980-х годов. В 2000-х годах получил признание публики и критиков за работу в широком диапазоне киножанров.канский актёр и продюсер. Четыре раза был номинирован на премию «Оскар» за лучшую мужскую роль в фильмах «Авиатор» (2004), «Кровавый алмаз» (2006), «Волк с Уолл-стрит» (2013) и «Выживший» (2016), а также за лучшую мужскую роль второго плана в фильме «Что гложет Гилберта Грэйпа» (1994). Четыре раза был номинирован на премию BAFTA и одиннадцать раз на премию «Золотой глобус». В 2016 году стал обладателем премии «Оскар» в номинации «Лучшая мужская роль», а также награды за лучшую мужскую роль британской премии BAFTA за исполнение роли Хью Гласса в фильме «Выживший». Лауреат трёх премий «Золотой глобус» за лучшую мужскую роль в драме за роль Говарда Хьюза в фильме «Авиатор» (2004), обладатель премии в номинации «Лучшая мужская роль в комедии или мюзикле» за роль Джордана Белфорта в фильме «Волк с Уолл-стрит» (2013) и в номинации «Лучшая мужская роль в драме» за роль в фильме «Выживший» (2016). Номинант премий «Сатурн», Гильдии киноактёров США и «Спутник».Актёрскую карьеру начал в конце 1980-х годов. В 2000-х годах получил признание публики и критиков за работу в широком диапазоне киножанров. 
6	Кейт Элизабет	Уинслет	1975-10-05	3	Актёрскую карьеру Кейт Уинслет начала в 1991 году, дебютировав на британском телевидении. Дебютом в кино для Уинслет стала картина «Небесные создания» (1994), получившая признание кинокритиков[1]. Всемирная слава к ней пришла спустя всего несколько лет, после исполнения роли Розы Дьюитт Бьюкейтер в фильме-катастрофе «Титаник» (1997), за которую она получила свою вторую номинацию на премию «Оскар». В дальнейшем она была отмечена в таких фильмах, как «Перо маркиза де Сада» (2000), «Айрис» (2001), «Вечное сияние чистого разума» (2004), «Волшебная страна» (2004), «Как малые дети» (2006), «Чтец» (2008), «Дорога перемен» (2008) и «Стив Джобс» (2015), за которые была номинирована на различные кинонаграды. Лауреат премии «Грэмми» (2000) за «Лучший речевой альбом для детей». Также принимала участие в качестве вокалистки некоторых саундтреков для фильмов, а её сингл «What If» был хитом в ряде европейских стран. Обладательница многочисленных наград, в том числе премии «Оскар» (2009), лауреат трёх премий BAFTA (1996, 2009, 2016), четырёх премий «Золотой глобус» (2009 — дважды, 2012, 2016), премии «Эмми» (2011) и Почётной премии «Сезар» (2012). 17 марта 2014 года Кейт Уинслет была удостоена именной звезды на Голливудской «Аллее славы».
7	Джон	Бойега	1992-03-17	3	Наиболее известен по роли Финна в фильмах «Звёздные войны: Пробуждение силы» (2015) и «Звёздные войны: Последние джедаи» (2017), являющихся частью трилогии-сиквела саги «Звёздные войны». Также исполнял роль Джейка Пентекоста, главного героя фантастического фильма «Тихоокеанский рубеж 2» (2018).
8	Кристофер	Хемсворт	1983-08-11	2	австралийский актёр, номинант на премию BAFTA. Наиболее известен по роли Тора в кинематографической вселенной Marvel: «Тор», «Мстители», «Тор 2: Царство тьмы», «Мстители: Эра Альтрона», «Тор: Рагнарёк», «Мстители: Война бесконечности» и «Мстители: Финал», а также в фильмах «Гонка», «Хижина в лесу», «Ничего хорошего в отеле «Эль Рояль»», «В сердце моря» и «Люди в чёрном: Интернэшнл».
9	Кристофер Майкл	Прэтт	1979-06-21	1	американский актёр кино и телевидения. Известен главными ролями в фильмах «Стражи Галактики», «Мир юрского периода» и «Пассажиры». В 2014 году озвучил главную роль в анимационном фильме «Лего Фильм», за который был номинирован на премию Teen Choice Awards в категории «лучшее озвучивание персонажа»
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, title) FROM stdin;
2	Австралия
3	Великобритания
4	Канада
1	Соединенные штаты Америки
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, first_name, second_name, date_of_birth, id_country, notes) FROM stdin;
1	Энтони	Руссо	1970-02-03	1	американские режиссёры кино и телевидения. Братья снимают большинство своих работ в основном вместе, также иногда в качестве продюсеров, сценаристов, актёров и монтажёров. Они выиграли «Эмми» за свою работу над комедийным сериалом «Замедленное развитие»
2	Джозеф	Руссо	1971-07-08	1	американские режиссёры кино и телевидения. Братья снимают большинство своих работ в основном вместе, также иногда в качестве продюсеров, сценаристов, актёров и монтажёров. Они выиграли «Эмми» за свою работу над комедийным сериалом «Замедленное развитие».
3	Джеймс Френсис	Кэмерон	1954-08-16	4	канадский кинорежиссёр, сценарист, продюсер, монтажёр, океанограф. Один из самых успешных режиссёров в истории кино: восемь его самых популярных картин собрали в прокате более 5,5 млрд долларов. Снял два из самых кассовых художественных фильма в истории кинематографа: «Титаник» (1997), который получил 11 премий «Оскар» (в том числе лично Кэмерону — за лучший фильм, лучшие режиссуру и монтаж) и «Аватар», успех которого привёл к буму 3D-фильмов в начале 2010-х годов. Вместе с Гейл Энн Хёрд Кэмерон создал вселенную Терминатора и был режиссёром двух первых фильмов этой серии: «Терминатор» и «Терминатор 2: Судный день».
4	Джеффри Джейкоб	Абрамс	1966-06-27	1	американский кинорежиссёр, продюсер, сценарист, актёр и композитор. Наиболее известен по работе в жанрах экшена, драмы и научной фантастики. Абрамс выступал в качестве сценариста или продюсера таких фильмов, как «Что касается Генри» (1991), «Вечно молодой» (1992), «Армагеддон» (1998), «Монстро» (2008), «Звёздный путь» (2009), «Звёздные войны: Пробуждение силы» (2015) и предстоящего «Звёздные войны: Скайуокер. Восход» (2019).
5	Колин	Треворроу	1976-09-13	1	американский режиссёр, сценарист, продюсер и актёр. Наиболее известен как режиссёр, сценарист и продюсер таких фильмов как: «Мир юрского периода» и «Безопасность не гарантируется». В 2013 году номинировался на премию «Независимый дух» за лучший дебютный фильм.
\.


--
-- Data for Name: directors_usa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors_usa (first_name, second_name) FROM stdin;
ЭН	РУССО
ДЖ	РУССО
ДЖ	КЭМЕРОН
ДЖ	АБРАМС
КО	ТРЕВОРРОУ
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (id, title, box_office, year_out) FROM stdin;
1	Мстители: Финал	2797800564	2019
2	Аватар	2789968301	2009
3	Титаник	2187463944	1997
4	Звёздные войны: Пробуждение силы	2068223624	2015
5	Мстители: Война бесконечности	2048359754	2018
6	Мир юрского периода	1670400637	2015
7	Король Лев	1656405082	2019
8	Мстители	1518812988	2012
9	Форсаж 7	1515047671	2015
10	Мстители: Эра Альтрона	1402805868	2015
11	Чёрная Пантера	1346913161	2018
12	Гарри Поттер и Дары Смерти. Часть 2	1341932398	2011
13	Звёздные войны: Последние джедаи	1332539889	2017
14	Мир юрского периода 2	1308467944	2018
16	Красавица и чудовище	1263521126	2017
17	Суперсемейка 2	1242805359	2018
19	Железный человек 3	1214811252	2013
20	Миньоны	1159398397	2015
21	Первый мститель: Противостояние	1153296293	2016
22	Аквамен	1148161807	2018
23	Человек-паук: Вдали от дома	1131927996	2019
24	Капитан Марвел	1128274794	2019
25	Трансформеры 3: Тёмная сторона Луны	1123794079	2011
26	Властелин колец: Возвращение короля	1120424614	2003
27	007: Координаты «Скайфолл»	1108561013	2012
28	Трансформеры: Эпоха истребления	1104054072	2014
29	Тёмный рыцарь: Возрождение легенды	1081041287	2012
30	История игрушек 4	1073394593	2019
31	История игрушек: Большой побег	1066969703	2010
32	Пираты Карибского моря: Сундук мертвеца	1066179725	2006
33	Изгой-один. Звёздные войны: Истории	1056057273	2016
34	Джокер	1055973580	2019
35	Аладдин	1050693953	2019
36	Пираты Карибского моря: На странных берегах	1045713802	2011
37	Гадкий я 3	1034799409	2017
38	Парк юрского периода	1030314141	1993
39	В поисках Дори	1028570889	2016
40	Звёздные войны. Эпизод I: Скрытая угроза	1027082707	1999
41	Алиса в Стране чудес	1025467110	2010
42	Зверополис	1023784195	2016
43	Хоббит: Нежданное путешествие	1017003568	2012
44	Тёмный рыцарь	1004934033	2008
45	Гарри Поттер и философский камень	978087613	2001
46	Гадкий я 2	970766005	2013
47	Король Лев	968511805	1994
48	Книга джунглей	966550600	2016
49	Джуманджи: Зов джунглей	962102237	2017
50	Пираты Карибского моря: На краю света	960996492	2007
51	Гарри Поттер и Дары Смерти. Часть 1	960666490	2010
52	Хоббит: Пустошь Смауга	958366855	2013
53	Хоббит: Битва пяти воинств	956019788	2014
54	В поисках Немо	940343261	2003
55	Гарри Поттер и Орден Феникса	938580405	2007
56	Гарри Поттер и Принц-полукровка	934326396	2009
57	Холодное сердце 2	927920321	2019
58	Властелин колец: Две крепости	927600630	2002
59	Шрек 2	923075336	2004
60	Богемская рапсодия	903655259	2018
61	Гарри Поттер и Кубок огня	896346229	2005
62	Человек-паук 3: Враг в отражении	890871626	2007
63	Ледниковый период 3: Эра динозавров	886686817	2009
64	007: Спектр	880674609	2015
65	Человек-паук: Возвращение домой	880166924	2017
66	Гарри Поттер и Тайная комната	879465594	2002
67	Ледниковый период 4: Континентальный дрейф	877244782	2012
68	Тайная жизнь домашних животных	875457937	2016
69	Бэтмен против Супермена: На заре справедливости	873634919	2016
70	Властелин колец: Братство Кольца	872491916	2001
71	Война волков 2	870325439	2017
72	Голодные игры: И вспыхнет пламя	865011746	2013
73	Стражи Галактики. Часть 2	863756051	2017
74	Головоломка	857611174	2015
75	Веном	856085151	2018
76	Тор: Рагнарёк	853977126	2017
77	Звёздные войны. Эпизод III: Месть ситхов	850035635	2005
78	Трансформеры: Месть падших	836303693	2009
79	Начало	829895144	2010
80	Сумерки. Сага: Рассвет — Часть 2	829746820	2012
81	Человек-паук	825025036	2002
82	Чудо-женщина	821847012	2017
83	День независимости	817400891	1996
18	Форсаж 8	1238764765	2017
84	Фантастические твари и где они обитают	814037575	2016
85	Тайна Коко	807082196	2017
86	Шрек Третий	804438141	2007
87	Гарри Поттер и узник Азкабана	796093802	2004
88	Пираты Карибского моря: Мертвецы не рассказывают сказки	794861794	2017
89	Инопланетянин	792910554	1982
90	Миссия невыполнима: Последствия	791115104	2018
91	Форсаж 6	788679850	2013
92	2012	788550900	2009
93	Индиана Джонс и Королевство хрустального черепа	786636033	2008
94	Дэдпул 2	785046920	2018
95	Человек-паук 2	783766341	2004
96	Дэдпул	782612155	2016
97	Звёздные войны. Эпизод IV: Новая надежда	775512064	1977
98	Стражи Галактики	772776600	2014
99	Форсаж: Хоббс и Шоу	758910100	2019
100	Малефисента	758410378	2014
15	Холодное сердце	1290000000	2013
101	Тайное влечение	1000000	2013
\.


--
-- Data for Name: films_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films_actors (id_film, id_actor) FROM stdin;
1	1
1	2
2	3
2	4
3	5
3	6
4	7
5	1
5	8
5	2
6	9
\.


--
-- Data for Name: films_directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films_directors (id_film, id_director) FROM stdin;
1	1
1	2
2	3
3	3
4	4
5	1
5	2
6	5
\.


--
-- Data for Name: full_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.full_join (title, actor, director) FROM stdin;
Мстители: Финал	Christofer Robert Evans	Энтони Руссо
Мстители: Финал	Robert John Downey Jr.	Энтони Руссо
Мстители: Финал	Christofer Robert Evans	Джозеф Руссо
Мстители: Финал	Robert John Downey Jr.	Джозеф Руссо
Аватар	Зои Ядира Салдана-Перего	Джеймс Френсис Кэмерон
Аватар	Сэмюэл Генри Джей Уортингтон	Джеймс Френсис Кэмерон
Титаник	Кейт Элизабет Уинслет	Джеймс Френсис Кэмерон
Титаник	Леонардо Вильгельм Ди Каприо	Джеймс Френсис Кэмерон
Звёздные войны: Пробуждение силы	Джон Бойега	Джеффри Джейкоб Абрамс
Мстители: Война бесконечности	Christofer Robert Evans	Энтони Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Энтони Руссо
Мстители: Война бесконечности	Robert John Downey Jr.	Энтони Руссо
Мстители: Война бесконечности	Christofer Robert Evans	Джозеф Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Джозеф Руссо
Мстители: Война бесконечности	Robert John Downey Jr.	Джозеф Руссо
Мир юрского периода	Кристофер Майкл Прэтт	Колин Треворроу
Трансформеры 3: Тёмная сторона Луны	\N	\N
Властелин колец: Возвращение короля	\N	\N
Суперсемейка 2	\N	\N
Война волков 2	\N	\N
Король Лев	\N	\N
Холодное сердце	\N	\N
Звёздные войны. Эпизод III: Месть ситхов	\N	\N
Гарри Поттер и Принц-полукровка	\N	\N
Первый мститель: Противостояние	\N	\N
Человек-паук: Возвращение домой	\N	\N
Тайная жизнь домашних животных	\N	\N
Сумерки. Сага: Рассвет — Часть 2	\N	\N
Форсаж: Хоббс и Шоу	\N	\N
Дэдпул 2	\N	\N
Человек-паук 3: Враг в отражении	\N	\N
Фантастические твари и где они обитают	\N	\N
Головоломка	\N	\N
Алиса в Стране чудес	\N	\N
2012	\N	\N
Тёмный рыцарь	\N	\N
Веном	\N	\N
Миньоны	\N	\N
007: Координаты «Скайфолл»	\N	\N
Чёрная Пантера	\N	\N
Холодное сердце 2	\N	\N
История игрушек: Большой побег	\N	\N
Гарри Поттер и Дары Смерти. Часть 2	\N	\N
007: Спектр	\N	\N
День независимости	\N	\N
Гадкий я 3	\N	\N
Гарри Поттер и Орден Феникса	\N	\N
Парк юрского периода	\N	\N
Книга джунглей	\N	\N
Человек-паук 2	\N	\N
Ледниковый период 4: Континентальный дрейф	\N	\N
Человек-паук	\N	\N
Властелин колец: Две крепости	\N	\N
Джуманджи: Зов джунглей	\N	\N
Аквамен	\N	\N
Гарри Поттер и философский камень	\N	\N
Богемская рапсодия	\N	\N
Гарри Поттер и Кубок огня	\N	\N
Форсаж 7	\N	\N
Пираты Карибского моря: Мертвецы не рассказывают сказки	\N	\N
Тайное влечение	\N	\N
Чудо-женщина	\N	\N
Индиана Джонс и Королевство хрустального черепа	\N	\N
Изгой-один. Звёздные войны: Истории	\N	\N
Мстители: Эра Альтрона	\N	\N
Стражи Галактики	\N	\N
Хоббит: Пустошь Смауга	\N	\N
Тайна Коко	\N	\N
Пираты Карибского моря: Сундук мертвеца	\N	\N
Капитан Марвел	\N	\N
Мстители	\N	\N
Трансформеры: Эпоха истребления	\N	\N
История игрушек 4	\N	\N
Звёздные войны. Эпизод IV: Новая надежда	\N	\N
Тор: Рагнарёк	\N	\N
Начало	\N	\N
Тёмный рыцарь: Возрождение легенды	\N	\N
В поисках Немо	\N	\N
Пираты Карибского моря: На странных берегах	\N	\N
Хоббит: Битва пяти воинств	\N	\N
Человек-паук: Вдали от дома	\N	\N
Шрек Третий	\N	\N
Хоббит: Нежданное путешествие	\N	\N
Гарри Поттер и узник Азкабана	\N	\N
Аладдин	\N	\N
Ледниковый период 3: Эра динозавров	\N	\N
Король Лев	\N	\N
В поисках Дори	\N	\N
Гарри Поттер и Тайная комната	\N	\N
Инопланетянин	\N	\N
Джокер	\N	\N
Форсаж 8	\N	\N
Голодные игры: И вспыхнет пламя	\N	\N
Гадкий я 2	\N	\N
Стражи Галактики. Часть 2	\N	\N
Звёздные войны. Эпизод I: Скрытая угроза	\N	\N
Звёздные войны: Последние джедаи	\N	\N
Форсаж 6	\N	\N
Дэдпул	\N	\N
Железный человек 3	\N	\N
Трансформеры: Месть падших	\N	\N
Малефисента	\N	\N
Пираты Карибского моря: На краю света	\N	\N
Гарри Поттер и Дары Смерти. Часть 1	\N	\N
Бэтмен против Супермена: На заре справедливости	\N	\N
Зверополис	\N	\N
Миссия невыполнима: Последствия	\N	\N
Шрек 2	\N	\N
Красавица и чудовище	\N	\N
Властелин колец: Братство Кольца	\N	\N
Мир юрского периода 2	\N	\N
\.


--
-- Data for Name: inner_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inner_join (title, actor, director) FROM stdin;
Мстители: Финал	Robert John Downey Jr.	Джозеф Руссо
Мстители: Финал	Robert John Downey Jr.	Энтони Руссо
Мстители: Финал	Christofer Robert Evans	Джозеф Руссо
Мстители: Финал	Christofer Robert Evans	Энтони Руссо
Аватар	Сэмюэл Генри Джей Уортингтон	Джеймс Френсис Кэмерон
Аватар	Зои Ядира Салдана-Перего	Джеймс Френсис Кэмерон
Титаник	Леонардо Вильгельм Ди Каприо	Джеймс Френсис Кэмерон
Титаник	Кейт Элизабет Уинслет	Джеймс Френсис Кэмерон
Звёздные войны: Пробуждение силы	Джон Бойега	Джеффри Джейкоб Абрамс
Мстители: Война бесконечности	Robert John Downey Jr.	Джозеф Руссо
Мстители: Война бесконечности	Robert John Downey Jr.	Энтони Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Джозеф Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Энтони Руссо
Мстители: Война бесконечности	Christofer Robert Evans	Джозеф Руссо
Мстители: Война бесконечности	Christofer Robert Evans	Энтони Руссо
Мир юрского периода	Кристофер Майкл Прэтт	Колин Треворроу
\.


--
-- Data for Name: left_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.left_join (title, actor, dir_name) FROM stdin;
Мстители: Финал	Christofer Robert Evans - Соединенные штаты Америки	Энтони Руссо -  Соединенные штаты Америки
Мстители: Финал	Robert John Downey Jr. - Соединенные штаты Америки	Энтони Руссо -  Соединенные штаты Америки
Мстители: Финал	Christofer Robert Evans - Соединенные штаты Америки	Джозеф Руссо -  Соединенные штаты Америки
Мстители: Финал	Robert John Downey Jr. - Соединенные штаты Америки	Джозеф Руссо -  Соединенные штаты Америки
Аватар	Зои Ядира Салдана-Перего - Соединенные штаты Америки	Джеймс Френсис Кэмерон -  Канада
Аватар	Сэмюэл Генри Джей Уортингтон - Австралия	Джеймс Френсис Кэмерон -  Канада
Титаник	Кейт Элизабет Уинслет - Великобритания	Джеймс Френсис Кэмерон -  Канада
Титаник	Леонардо Вильгельм Ди Каприо - Соединенные штаты Америки	Джеймс Френсис Кэмерон -  Канада
Звёздные войны: Пробуждение силы	Джон Бойега - Великобритания	Джеффри Джейкоб Абрамс -  Соединенные штаты Америки
Мстители: Война бесконечности	Christofer Robert Evans - Соединенные штаты Америки	Энтони Руссо -  Соединенные штаты Америки
Мстители: Война бесконечности	Кристофер Хемсворт - Австралия	Энтони Руссо -  Соединенные штаты Америки
Мстители: Война бесконечности	Robert John Downey Jr. - Соединенные штаты Америки	Энтони Руссо -  Соединенные штаты Америки
Мстители: Война бесконечности	Christofer Robert Evans - Соединенные штаты Америки	Джозеф Руссо -  Соединенные штаты Америки
Мстители: Война бесконечности	Кристофер Хемсворт - Австралия	Джозеф Руссо -  Соединенные штаты Америки
Мстители: Война бесконечности	Robert John Downey Jr. - Соединенные штаты Америки	Джозеф Руссо -  Соединенные штаты Америки
Мир юрского периода	Кристофер Майкл Прэтт - Соединенные штаты Америки	Колин Треворроу -  Соединенные штаты Америки
Трансформеры 3: Тёмная сторона Луны	\N	\N
Властелин колец: Возвращение короля	\N	\N
Суперсемейка 2	\N	\N
Война волков 2	\N	\N
Король Лев	\N	\N
Холодное сердце	\N	\N
Звёздные войны. Эпизод III: Месть ситхов	\N	\N
Гарри Поттер и Принц-полукровка	\N	\N
Первый мститель: Противостояние	\N	\N
Человек-паук: Возвращение домой	\N	\N
Тайная жизнь домашних животных	\N	\N
Сумерки. Сага: Рассвет — Часть 2	\N	\N
Форсаж: Хоббс и Шоу	\N	\N
Дэдпул 2	\N	\N
Человек-паук 3: Враг в отражении	\N	\N
Фантастические твари и где они обитают	\N	\N
Головоломка	\N	\N
Алиса в Стране чудес	\N	\N
2012	\N	\N
Тёмный рыцарь	\N	\N
Веном	\N	\N
Миньоны	\N	\N
007: Координаты «Скайфолл»	\N	\N
Чёрная Пантера	\N	\N
Холодное сердце 2	\N	\N
История игрушек: Большой побег	\N	\N
Гарри Поттер и Дары Смерти. Часть 2	\N	\N
007: Спектр	\N	\N
День независимости	\N	\N
Гадкий я 3	\N	\N
Гарри Поттер и Орден Феникса	\N	\N
Парк юрского периода	\N	\N
Книга джунглей	\N	\N
Человек-паук 2	\N	\N
Ледниковый период 4: Континентальный дрейф	\N	\N
Человек-паук	\N	\N
Властелин колец: Две крепости	\N	\N
Джуманджи: Зов джунглей	\N	\N
Аквамен	\N	\N
Гарри Поттер и философский камень	\N	\N
Богемская рапсодия	\N	\N
Гарри Поттер и Кубок огня	\N	\N
Форсаж 7	\N	\N
Пираты Карибского моря: Мертвецы не рассказывают сказки	\N	\N
Тайное влечение	\N	\N
Чудо-женщина	\N	\N
Индиана Джонс и Королевство хрустального черепа	\N	\N
Изгой-один. Звёздные войны: Истории	\N	\N
Мстители: Эра Альтрона	\N	\N
Стражи Галактики	\N	\N
Хоббит: Пустошь Смауга	\N	\N
Тайна Коко	\N	\N
Пираты Карибского моря: Сундук мертвеца	\N	\N
Капитан Марвел	\N	\N
Мстители	\N	\N
Трансформеры: Эпоха истребления	\N	\N
История игрушек 4	\N	\N
Звёздные войны. Эпизод IV: Новая надежда	\N	\N
Тор: Рагнарёк	\N	\N
Начало	\N	\N
Тёмный рыцарь: Возрождение легенды	\N	\N
В поисках Немо	\N	\N
Пираты Карибского моря: На странных берегах	\N	\N
Хоббит: Битва пяти воинств	\N	\N
Человек-паук: Вдали от дома	\N	\N
Шрек Третий	\N	\N
Хоббит: Нежданное путешествие	\N	\N
Гарри Поттер и узник Азкабана	\N	\N
Аладдин	\N	\N
Ледниковый период 3: Эра динозавров	\N	\N
Король Лев	\N	\N
В поисках Дори	\N	\N
Гарри Поттер и Тайная комната	\N	\N
Инопланетянин	\N	\N
Джокер	\N	\N
Форсаж 8	\N	\N
Голодные игры: И вспыхнет пламя	\N	\N
Гадкий я 2	\N	\N
Стражи Галактики. Часть 2	\N	\N
Звёздные войны. Эпизод I: Скрытая угроза	\N	\N
Звёздные войны: Последние джедаи	\N	\N
Форсаж 6	\N	\N
Дэдпул	\N	\N
Железный человек 3	\N	\N
Трансформеры: Месть падших	\N	\N
Малефисента	\N	\N
Пираты Карибского моря: На краю света	\N	\N
Гарри Поттер и Дары Смерти. Часть 1	\N	\N
Бэтмен против Супермена: На заре справедливости	\N	\N
Зверополис	\N	\N
Миссия невыполнима: Последствия	\N	\N
Шрек 2	\N	\N
Красавица и чудовище	\N	\N
Властелин колец: Братство Кольца	\N	\N
Мир юрского периода 2	\N	\N
\.


--
-- Data for Name: right_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.right_join (title, actor, director) FROM stdin;
Мстители: Финал	Christofer Robert Evans	Энтони Руссо
Мстители: Финал	Robert John Downey Jr.	Энтони Руссо
Мстители: Финал	Christofer Robert Evans	Джозеф Руссо
Мстители: Финал	Robert John Downey Jr.	Джозеф Руссо
Аватар	Зои Ядира Салдана-Перего	Джеймс Френсис Кэмерон
Аватар	Сэмюэл Генри Джей Уортингтон	Джеймс Френсис Кэмерон
Титаник	Кейт Элизабет Уинслет	Джеймс Френсис Кэмерон
Титаник	Леонардо Вильгельм Ди Каприо	Джеймс Френсис Кэмерон
Звёздные войны: Пробуждение силы	Джон Бойега	Джеффри Джейкоб Абрамс
Мстители: Война бесконечности	Christofer Robert Evans	Энтони Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Энтони Руссо
Мстители: Война бесконечности	Robert John Downey Jr.	Энтони Руссо
Мстители: Война бесконечности	Christofer Robert Evans	Джозеф Руссо
Мстители: Война бесконечности	Кристофер Хемсворт	Джозеф Руссо
Мстители: Война бесконечности	Robert John Downey Jr.	Джозеф Руссо
Мир юрского периода	Кристофер Майкл Прэтт	Колин Треворроу
\.


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_seq', 9, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 3, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 5, true);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.films_id_seq', 1, true);


--
-- Name: actors actors_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_id_key UNIQUE (id);


--
-- Name: countries countries_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_id_key UNIQUE (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films_actors films_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_actors
    ADD CONSTRAINT films_actors_pkey PRIMARY KEY (id_film, id_actor);


--
-- Name: films_directors films_directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_directors
    ADD CONSTRAINT films_directors_pkey PRIMARY KEY (id_film, id_director);


--
-- Name: films films_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_id_key UNIQUE (id);


--
-- Name: directors directors_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.countries(id);


--
-- Name: films_actors films_actors_id_actors_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_actors
    ADD CONSTRAINT films_actors_id_actors_fkey FOREIGN KEY (id_actor) REFERENCES public.actors(id);


--
-- Name: films_actors films_actors_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_actors
    ADD CONSTRAINT films_actors_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.films(id);


--
-- Name: films_directors films_directors_id_director_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_directors
    ADD CONSTRAINT films_directors_id_director_fkey FOREIGN KEY (id_director) REFERENCES public.directors(id);


--
-- Name: films_directors films_directors_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_directors
    ADD CONSTRAINT films_directors_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.films(id);


--
-- PostgreSQL database dump complete
--

