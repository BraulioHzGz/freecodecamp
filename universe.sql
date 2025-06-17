--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: color; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.color (
    color_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.color OWNER TO freecodecamp;

--
-- Name: color_color_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.color_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.color_color_id_seq OWNER TO freecodecamp;

--
-- Name: color_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.color_color_id_seq OWNED BY public.color.color_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_year integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    distance_from_planet_in_km integer NOT NULL,
    planet_id integer NOT NULL,
    color_id integer NOT NULL
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
    name character varying(30),
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_alive boolean NOT NULL,
    day_duration_hours integer NOT NULL,
    star_id integer NOT NULL,
    color_id integer NOT NULL
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
    name character varying(30),
    star_type character varying(30) NOT NULL,
    temperature_in_celsius numeric(9,2) NOT NULL,
    galaxy_id integer NOT NULL,
    color_id integer NOT NULL
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
-- Name: color color_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.color ALTER COLUMN color_id SET DEFAULT nextval('public.color_color_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.color VALUES (1, 'E Azul', 'Extremadamente calientes y masivas. Jóvenes y de vida corta. Más de 24000 grados Celsius');
INSERT INTO public.color VALUES (2, 'E Blanco-Azulada', 'Muy calientes, emiten mucha luz ultravioleta. Entre 10000 y 23999 grados Celsius');
INSERT INTO public.color VALUES (3, 'E Blanca', 'Como Sirio. Alta temperatura, emiten luz intensa. Entre 7400 y 10000 grados Celsius');
INSERT INTO public.color VALUES (4, 'E Blanca-Amarilla', 'Calientes como un Sol. Entre 6000 y 7000 grados Celsius');
INSERT INTO public.color VALUES (5, 'E Amarilla', 'Temperatura intermedia como el Sol de nuestro sistema solar. Entre 5000 y 6000 grados Celsius');
INSERT INTO public.color VALUES (6, 'E Naranja', 'Más frías y longevas que el Sol. Entre 3500 y 5000 grados Celsius');
INSERT INTO public.color VALUES (7, 'E Roja', 'Enanas rojas. Muy frías, pequeñas y duraderas. Menos de 3500 grados Celsius');
INSERT INTO public.color VALUES (8, 'P Rojo-Anaranjado', 'Óxidos de hierro (óxido férrico); superficie rocosa oxidada.');
INSERT INTO public.color VALUES (9, 'P Azul', 'Metano en la atmósfera que absorbe rojo y refleja azul.');
INSERT INTO public.color VALUES (10, 'P Blanco', 'Densa capa de nubes de ácido sulfúrico; refleja mucha luz solar.');
INSERT INTO public.color VALUES (11, 'P Amarillo-Café', 'Composición de gases (amoníaco, hidrógeno, helio) y bandas de nubes.');
INSERT INTO public.color VALUES (12, 'P Gris-Negro', 'Superficie rocosa sin atmósfera significativa; refleja poco.');
INSERT INTO public.color VALUES (13, 'L Gris', 'Rocas basálticas; regiones de diferente albedo.');
INSERT INTO public.color VALUES (14, 'L Blanca', 'Hielo de agua en superficie.');
INSERT INTO public.color VALUES (15, 'L Amarilla-Roja', 'Azufre y actividad volcánica intensa.');
INSERT INTO public.color VALUES (16, 'L Azul', 'Hielo de nitrógeno y metano. Muy frío.');
INSERT INTO public.color VALUES (17, 'L Negra', 'Rocas oscuras, sin atmósfera ni erosión.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Espiral barrada', 13, false);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda (M31)', 'Espiral', 10, false);
INSERT INTO public.galaxy VALUES (3, 'Messier 87 (M87)', 'Elíptica gigante', 13, true);
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 'Irregular', 13, false);
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 'Espiral barrada', 12, false);
INSERT INTO public.galaxy VALUES (6, 'SDSG', 'Enana esferoidal', 13, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 3, 13);
INSERT INTO public.moon VALUES (2, 'Fobos', 9380, 4, 13);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 4, 13);
INSERT INTO public.moon VALUES (4, 'Ío', 421800, 5, 15);
INSERT INTO public.moon VALUES (5, 'Europa', 671100, 5, 14);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 1070400, 5, 13);
INSERT INTO public.moon VALUES (7, 'Calisto', 188300, 5, 13);
INSERT INTO public.moon VALUES (8, 'Metis', 128000, 5, 13);
INSERT INTO public.moon VALUES (9, 'Adrastea', 129000, 5, 13);
INSERT INTO public.moon VALUES (10, 'Amaltea', 181400, 5, 13);
INSERT INTO public.moon VALUES (11, 'Tethys', 377400, 6, 14);
INSERT INTO public.moon VALUES (12, 'Dione', 377400, 6, 13);
INSERT INTO public.moon VALUES (13, 'Rhea', 527040, 6, 13);
INSERT INTO public.moon VALUES (14, 'Titan', 1222000, 6, 15);
INSERT INTO public.moon VALUES (15, 'Encelado', 238020, 6, 14);
INSERT INTO public.moon VALUES (16, 'Mimas', 185520, 6, 13);
INSERT INTO public.moon VALUES (17, 'Hyperion', 1481000, 6, 13);
INSERT INTO public.moon VALUES (18, 'Miranda', 129780, 7, 13);
INSERT INTO public.moon VALUES (19, 'Ariel', 191240, 7, 13);
INSERT INTO public.moon VALUES (20, 'Umbriel', 265970, 7, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Interior', false, false, 1416, 13, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 'Interior', false, true, 5832, 13, 11);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Interior', true, true, 24, 13, 9);
INSERT INTO public.planet VALUES (4, 'Marte', 'Interior', false, false, 24, 13, 8);
INSERT INTO public.planet VALUES (5, 'Júpiter', 'Exterior', false, true, 10, 13, 11);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Exterior', false, true, 10, 13, 11);
INSERT INTO public.planet VALUES (7, 'Urano', 'Exterior', false, true, 17, 13, 10);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Exterior', false, true, 16, 13, 9);
INSERT INTO public.planet VALUES (9, 'Planeta A', 'Exterior', false, true, 59, 6, 10);
INSERT INTO public.planet VALUES (10, 'Planeta B', 'Interior', true, false, 15, 4, 10);
INSERT INTO public.planet VALUES (11, 'Planeta C', 'Exterior', true, true, 27, 2, 10);
INSERT INTO public.planet VALUES (12, 'Planeta D', 'Interior', false, false, 930, 9, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 'Supergigante roja', 3226.85, 1, 7);
INSERT INTO public.star VALUES (2, 'Sirius A', 'Estrella de secuencia A1V', 9626.85, 1, 3);
INSERT INTO public.star VALUES (3, 'J00443799+4129236', 'Supergigante azul', 23726.85, 2, 2);
INSERT INTO public.star VALUES (4, 'M31-V1', 'Variable cefeida', 5726.85, 2, 5);
INSERT INTO public.star VALUES (5, 'M87 Nova 2006-10a', 'Nova', 49726.85, 3, 1);
INSERT INTO public.star VALUES (6, 'M87 GC1', 'Gigante roja', 4226.85, 3, 7);
INSERT INTO public.star VALUES (7, 'R136a1', 'Estrella hipermasiva O3', 49726.85, 4, 1);
INSERT INTO public.star VALUES (8, 'HV 2257', 'Variable cefeida', 5226.85, 4, 5);
INSERT INTO public.star VALUES (9, 'SN 2004fg', 'Estrella masiva tipo II', 29726.85, 5, 1);
INSERT INTO public.star VALUES (10, 'Estrella joven', 'Secuencia principal masiva', 23726.85, 5, 2);
INSERT INTO public.star VALUES (11, 'Gigante roja #1', 'Gigante roja', 4226.85, 6, 7);
INSERT INTO public.star VALUES (12, 'RR Lyrae', 'Variable RR Lyrae', 6226.85, 6, 4);
INSERT INTO public.star VALUES (13, 'Sol', 'G', 5600.00, 1, 5);


--
-- Name: color_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.color_color_id_seq', 17, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: color color_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_name_key UNIQUE (name);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (color_id);


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
-- Name: moon moon_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

