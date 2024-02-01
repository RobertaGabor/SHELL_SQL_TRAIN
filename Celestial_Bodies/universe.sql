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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_years integer,
    planets_number_in_billions integer,
    stars_number_in_million integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: habitant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitant (
    habitant_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer NOT NULL,
    dni numeric(8,0),
    planet_id integer
);


ALTER TABLE public.habitant OWNER TO freecodecamp;

--
-- Name: habitant_habitant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitant_habitant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitant_habitant_id_seq OWNER TO freecodecamp;

--
-- Name: habitant_habitant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitant_habitant_id_seq OWNED BY public.habitant.habitant_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_id integer,
    was_visited_by_humans boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    distance_from_earth_in_million_miles integer,
    size numeric(3,2),
    has_life boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    is_alive boolean NOT NULL,
    galaxy_id integer,
    visible_from_earth boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: habitant habitant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitant ALTER COLUMN habitant_id SET DEFAULT nextval('public.habitant_habitant_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (154, 'Nombre Galaxia 1', 72, 51, 19);
INSERT INTO public.galaxy VALUES (155, 'Nombre Galaxia 2', 36, 85, 64);
INSERT INTO public.galaxy VALUES (156, 'Nombre Galaxia 3', 93, 42, 10);
INSERT INTO public.galaxy VALUES (157, 'Nombre Galaxia 4', 17, 76, 28);
INSERT INTO public.galaxy VALUES (158, 'Nombre Galaxia 5', 61, 29, 94);
INSERT INTO public.galaxy VALUES (159, 'Nombre Galaxia 6', 8, 97, 52);
INSERT INTO public.galaxy VALUES (160, 'Nombre Galaxia 7', 45, 13, 87);
INSERT INTO public.galaxy VALUES (161, 'Nombre Galaxia 8', 79, 63, 31);
INSERT INTO public.galaxy VALUES (162, 'Nombre Galaxia 9', 24, 71, 6);
INSERT INTO public.galaxy VALUES (163, 'Nombre Galaxia 10', 57, 4, 78);
INSERT INTO public.galaxy VALUES (164, 'Nombre Galaxia 11', 12, 83, 39);
INSERT INTO public.galaxy VALUES (165, 'Nombre Galaxia 12', 68, 25, 59);
INSERT INTO public.galaxy VALUES (166, 'Nombre Galaxia 13', 32, 91, 16);
INSERT INTO public.galaxy VALUES (167, 'Nombre Galaxia 14', 85, 38, 82);
INSERT INTO public.galaxy VALUES (168, 'Nombre Galaxia 15', 3, 69, 48);
INSERT INTO public.galaxy VALUES (169, 'Nombre Galaxia 16', 96, 17, 72);
INSERT INTO public.galaxy VALUES (170, 'Nombre Galaxia 17', 53, 54, 26);
INSERT INTO public.galaxy VALUES (171, 'Nombre Galaxia 18', 18, 8, 97);
INSERT INTO public.galaxy VALUES (172, 'Nombre Galaxia 19', 74, 96, 14);
INSERT INTO public.galaxy VALUES (173, 'Nombre Galaxia 20', 40, 30, 66);


--
-- Data for Name: habitant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitant VALUES (39, 'Nombre Habitant 1', 32, 12345678, 45);
INSERT INTO public.habitant VALUES (40, 'Nombre Habitant 2', 25, 87654321, 40);
INSERT INTO public.habitant VALUES (41, 'Nombre Habitant 3', 41, 13579246, 41);
INSERT INTO public.habitant VALUES (42, 'Nombre Habitant 4', 19, 24681357, 47);
INSERT INTO public.habitant VALUES (43, 'Nombre Habitant 5', 37, 98765432, 53);
INSERT INTO public.habitant VALUES (44, 'Nombre Habitant 6', 28, 31415926, 50);
INSERT INTO public.habitant VALUES (45, 'Nombre Habitant 7', 45, 27182818, 48);
INSERT INTO public.habitant VALUES (46, 'Nombre Habitant 8', 22, 59265359, 39);
INSERT INTO public.habitant VALUES (47, 'Nombre Habitant 9', 36, 36925814, 42);
INSERT INTO public.habitant VALUES (48, 'Nombre Habitant 10', 29, 16180339, 54);
INSERT INTO public.habitant VALUES (49, 'Nombre Habitant 11', 33, 32384626, 52);
INSERT INTO public.habitant VALUES (52, 'Nombre Habitant 14', 26, 16265359, 39);
INSERT INTO public.habitant VALUES (53, 'Nombre Habitant 15', 42, 98182828, 51);
INSERT INTO public.habitant VALUES (54, 'Nombre Habitant 16', 30, 35925814, 50);
INSERT INTO public.habitant VALUES (55, 'Nombre Habitant 17', 23, 18033989, 54);
INSERT INTO public.habitant VALUES (56, 'Nombre Habitant 18', 35, 26433832, 40);
INSERT INTO public.habitant VALUES (57, 'Nombre Habitant 19', 31, 18309807, 39);
INSERT INTO public.habitant VALUES (58, 'Nombre Habitant 20', 27, 18182845, 50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (40, 'Nombre Luna 1', 'Descripción Luna 1', 49, true);
INSERT INTO public.moon VALUES (41, 'Nombre Luna 2', 'Descripción Luna 2', 42, false);
INSERT INTO public.moon VALUES (42, 'Nombre Luna 3', 'Descripción Luna 3', 43, true);
INSERT INTO public.moon VALUES (43, 'Nombre Luna 4', 'Descripción Luna 4', 50, false);
INSERT INTO public.moon VALUES (44, 'Nombre Luna 5', 'Descripción Luna 5', 54, true);
INSERT INTO public.moon VALUES (45, 'Nombre Luna 6', 'Descripción Luna 6', 47, false);
INSERT INTO public.moon VALUES (46, 'Nombre Luna 7', 'Descripción Luna 7', 55, true);
INSERT INTO public.moon VALUES (47, 'Nombre Luna 8', 'Descripción Luna 8', 39, false);
INSERT INTO public.moon VALUES (48, 'Nombre Luna 9', 'Descripción Luna 9', 47, true);
INSERT INTO public.moon VALUES (49, 'Nombre Luna 10', 'Descripción Luna 10', 47, false);
INSERT INTO public.moon VALUES (50, 'Nombre Luna 11', 'Descripción Luna 11', 53, true);
INSERT INTO public.moon VALUES (51, 'Nombre Luna 12', 'Descripción Luna 12', 45, false);
INSERT INTO public.moon VALUES (52, 'Nombre Luna 13', 'Descripción Luna 13', 54, true);
INSERT INTO public.moon VALUES (53, 'Nombre Luna 14', 'Descripción Luna 14', 45, false);
INSERT INTO public.moon VALUES (54, 'Nombre Luna 15', 'Descripción Luna 15', 49, true);
INSERT INTO public.moon VALUES (55, 'Nombre Luna 16', 'Descripción Luna 16', 44, false);
INSERT INTO public.moon VALUES (56, 'Nombre Luna 17', 'Descripción Luna 17', 44, true);
INSERT INTO public.moon VALUES (57, 'Nombre Luna 18', 'Descripción Luna 18', 46, false);
INSERT INTO public.moon VALUES (58, 'Nombre Luna 19', 'Descripción Luna 19', 40, true);
INSERT INTO public.moon VALUES (59, 'Nombre Luna 20', 'Descripción Luna 20', 38, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (38, 'Planet 1', 84, 8.00, true, 76);
INSERT INTO public.planet VALUES (39, 'Planet 2', 12, 1.00, false, 66);
INSERT INTO public.planet VALUES (40, 'Planet 3', 37, 2.00, true, 69);
INSERT INTO public.planet VALUES (41, 'Planet 4', 91, 7.00, true, 71);
INSERT INTO public.planet VALUES (42, 'Planet 5', 68, 6.00, false, 76);
INSERT INTO public.planet VALUES (43, 'Planet 6', 55, 3.00, false, 63);
INSERT INTO public.planet VALUES (44, 'Planet 7', 29, 5.00, true, 72);
INSERT INTO public.planet VALUES (45, 'Planet 8', 42, 4.00, false, 64);
INSERT INTO public.planet VALUES (46, 'Planet 10', 63, 9.00, false, 63);
INSERT INTO public.planet VALUES (47, 'Planet 11', 23, 2.00, true, 77);
INSERT INTO public.planet VALUES (48, 'Planet 12', 88, 3.00, false, 64);
INSERT INTO public.planet VALUES (49, 'Planet 13', 49, 1.00, true, 75);
INSERT INTO public.planet VALUES (50, 'Planet 14', 16, 8.00, false, 62);
INSERT INTO public.planet VALUES (51, 'Planet 15', 73, 7.00, true, 78);
INSERT INTO public.planet VALUES (52, 'Planet 16', 35, 4.00, false, 75);
INSERT INTO public.planet VALUES (53, 'Planet 17', 97, 6.00, true, 78);
INSERT INTO public.planet VALUES (54, 'Planet 18', 58, 5.00, false, 64);
INSERT INTO public.planet VALUES (55, 'Planet 19', 41, 9.00, true, 66);
INSERT INTO public.planet VALUES (56, 'Planet 21', 25, 1.00, false, 61);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (60, 'Nombre Estrella 1', true, 165, true);
INSERT INTO public.star VALUES (61, 'Nombre Estrella 2', false, 157, false);
INSERT INTO public.star VALUES (62, 'Nombre Estrella 3', true, 162, true);
INSERT INTO public.star VALUES (63, 'Nombre Estrella 4', true, 157, false);
INSERT INTO public.star VALUES (64, 'Nombre Estrella 5', false, 162, true);
INSERT INTO public.star VALUES (65, 'Nombre Estrella 6', true, 167, false);
INSERT INTO public.star VALUES (66, 'Nombre Estrella 7', false, 160, true);
INSERT INTO public.star VALUES (67, 'Nombre Estrella 8', true, 168, true);
INSERT INTO public.star VALUES (68, 'Nombre Estrella 9', true, 158, false);
INSERT INTO public.star VALUES (69, 'Nombre Estrella 10', false, 157, true);
INSERT INTO public.star VALUES (70, 'Nombre Estrella 11', true, 166, false);
INSERT INTO public.star VALUES (71, 'Nombre Estrella 12', true, 168, true);
INSERT INTO public.star VALUES (72, 'Nombre Estrella 13', false, 165, false);
INSERT INTO public.star VALUES (73, 'Nombre Estrella 14', true, 170, true);
INSERT INTO public.star VALUES (74, 'Nombre Estrella 15', false, 162, false);
INSERT INTO public.star VALUES (75, 'Nombre Estrella 16', true, 156, true);
INSERT INTO public.star VALUES (76, 'Nombre Estrella 17', true, 163, true);
INSERT INTO public.star VALUES (77, 'Nombre Estrella 18', false, 166, false);
INSERT INTO public.star VALUES (78, 'Nombre Estrella 19', true, 158, true);
INSERT INTO public.star VALUES (79, 'Nombre Estrella 20', false, 158, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 173, true);


--
-- Name: habitant_habitant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitant_habitant_id_seq', 58, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 59, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 56, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 79, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: habitant habitant_dni_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitant
    ADD CONSTRAINT habitant_dni_key UNIQUE (dni);


--
-- Name: habitant habitant_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitant
    ADD CONSTRAINT habitant_pkey PRIMARY KEY (habitant_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: habitant habitant_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitant
    ADD CONSTRAINT habitant_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

