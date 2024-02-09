--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (234, 84, 849);
INSERT INTO public.games VALUES (235, 84, 957);
INSERT INTO public.games VALUES (236, 85, 602);
INSERT INTO public.games VALUES (237, 85, 2);
INSERT INTO public.games VALUES (238, 84, 593);
INSERT INTO public.games VALUES (239, 84, 5);
INSERT INTO public.games VALUES (240, 84, 142);
INSERT INTO public.games VALUES (241, 86, 203);
INSERT INTO public.games VALUES (242, 86, 188);
INSERT INTO public.games VALUES (243, 87, 627);
INSERT INTO public.games VALUES (244, 87, 765);
INSERT INTO public.games VALUES (245, 86, 17);
INSERT INTO public.games VALUES (246, 86, 205);
INSERT INTO public.games VALUES (247, 86, 980);
INSERT INTO public.games VALUES (248, 88, 544);
INSERT INTO public.games VALUES (249, 88, 326);
INSERT INTO public.games VALUES (250, 89, 9);
INSERT INTO public.games VALUES (251, 89, 962);
INSERT INTO public.games VALUES (252, 88, 166);
INSERT INTO public.games VALUES (253, 88, 103);
INSERT INTO public.games VALUES (254, 88, 723);
INSERT INTO public.games VALUES (255, 90, 354);
INSERT INTO public.games VALUES (256, 90, 726);
INSERT INTO public.games VALUES (257, 91, 131);
INSERT INTO public.games VALUES (258, 91, 220);
INSERT INTO public.games VALUES (259, 90, 875);
INSERT INTO public.games VALUES (260, 90, 352);
INSERT INTO public.games VALUES (261, 90, 172);
INSERT INTO public.games VALUES (262, 92, 391);
INSERT INTO public.games VALUES (263, 92, 268);
INSERT INTO public.games VALUES (264, 93, 147);
INSERT INTO public.games VALUES (265, 93, 948);
INSERT INTO public.games VALUES (266, 92, 137);
INSERT INTO public.games VALUES (267, 92, 229);
INSERT INTO public.games VALUES (268, 92, 621);
INSERT INTO public.games VALUES (269, 94, 960);
INSERT INTO public.games VALUES (270, 94, 386);
INSERT INTO public.games VALUES (271, 95, 127);
INSERT INTO public.games VALUES (272, 95, 840);
INSERT INTO public.games VALUES (273, 94, 952);
INSERT INTO public.games VALUES (274, 94, 866);
INSERT INTO public.games VALUES (275, 94, 808);
INSERT INTO public.games VALUES (220, 80, 496);
INSERT INTO public.games VALUES (221, 80, 510);
INSERT INTO public.games VALUES (222, 81, 716);
INSERT INTO public.games VALUES (223, 81, 251);
INSERT INTO public.games VALUES (224, 80, 839);
INSERT INTO public.games VALUES (225, 80, 799);
INSERT INTO public.games VALUES (226, 80, 146);
INSERT INTO public.games VALUES (227, 82, 105);
INSERT INTO public.games VALUES (228, 82, 52);
INSERT INTO public.games VALUES (229, 83, 418);
INSERT INTO public.games VALUES (230, 83, 370);
INSERT INTO public.games VALUES (231, 82, 556);
INSERT INTO public.games VALUES (232, 82, 810);
INSERT INTO public.games VALUES (233, 82, 254);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1707510873301', 80);
INSERT INTO public.users VALUES ('user_1707510873300', 81);
INSERT INTO public.users VALUES ('user_1707510878784', 82);
INSERT INTO public.users VALUES ('user_1707510878783', 83);
INSERT INTO public.users VALUES ('user_1707510908952', 84);
INSERT INTO public.users VALUES ('user_1707510908951', 85);
INSERT INTO public.users VALUES ('user_1707510919567', 86);
INSERT INTO public.users VALUES ('user_1707510919566', 87);
INSERT INTO public.users VALUES ('user_1707510992503', 88);
INSERT INTO public.users VALUES ('user_1707510992502', 89);
INSERT INTO public.users VALUES ('user_1707511004285', 90);
INSERT INTO public.users VALUES ('user_1707511004284', 91);
INSERT INTO public.users VALUES ('user_1707511022113', 92);
INSERT INTO public.users VALUES ('user_1707511022112', 93);
INSERT INTO public.users VALUES ('user_1707511068892', 94);
INSERT INTO public.users VALUES ('user_1707511068891', 95);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 275, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 95, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

