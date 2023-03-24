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
-- Name: galactic_shape; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galactic_shape (
    galactic_shape_id integer NOT NULL,
    name character varying(100) NOT NULL,
    shape_class character varying(3) NOT NULL
);


ALTER TABLE public.galactic_shape OWNER TO freecodecamp;

--
-- Name: galactic_shape_galactic_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galactic_shape_galactic_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galactic_shape_galactic_shape_id_seq OWNER TO freecodecamp;

--
-- Name: galactic_shape_galactic_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galactic_shape_galactic_shape_id_seq OWNED BY public.galactic_shape.galactic_shape_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    constellation character varying(40),
    origin_of_name text,
    million_light_years_from_earth integer,
    galaxy_id integer NOT NULL,
    galactic_shape_id integer
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
    name character varying(40),
    diameter_km integer,
    mass_10e21kg double precision,
    gravity_mps2 numeric(5,3),
    planet_id integer NOT NULL,
    is_spherical boolean
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
    name character varying(40) NOT NULL,
    mass_10e24kg numeric(10,3),
    diameter_in_km integer,
    gravity_in_m_per_s_squared real,
    length_of_day_in_hours numeric(6,1),
    has_life boolean,
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
    name character varying(40) NOT NULL,
    solar_radius double precision,
    solar_luminosity double precision,
    galaxy_id integer
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
-- Name: galactic_shape galactic_shape_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_shape ALTER COLUMN galactic_shape_id SET DEFAULT nextval('public.galactic_shape_galactic_shape_id_seq'::regclass);


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
-- Data for Name: galactic_shape; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galactic_shape VALUES (1, 'Barred spiral', 'B');
INSERT INTO public.galactic_shape VALUES (2, 'Rotational symmetry without pronounced spiral or elliptical structure', 'D');
INSERT INTO public.galactic_shape VALUES (3, 'Elliptical', 'E');
INSERT INTO public.galactic_shape VALUES (4, 'Elliptical with dust absorption', 'Ep');
INSERT INTO public.galactic_shape VALUES (5, 'Irregular', 'I');
INSERT INTO public.galactic_shape VALUES (8, 'Spiral', 'S');
INSERT INTO public.galactic_shape VALUES (6, 'Low surface brightness', 'L');
INSERT INTO public.galactic_shape VALUES (7, 'Small bright nucleus', 'N');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'Andromeda', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 3, 1, 1);
INSERT INTO public.galaxy VALUES ('Backward Galaxy', 'Centaurus', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 200, 3, 8);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 'Corvus', 'Appearance is similar to an insect''s antennae.', 65, 2, 1);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'Coma Berenices', 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', 17, 4, 8);
INSERT INTO public.galaxy VALUES ('Bode''s Galaxy', 'Ursa Major', 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 12, 5, 8);
INSERT INTO public.galaxy VALUES ('Milkey Way', 'Sagitarius', 'The appearance from Earth of the galaxy - a band of light.', NULL, 6, 1);
INSERT INTO public.galaxy VALUES ('IC 10', 'Cassiopeia', NULL, 3, 7, 5);
INSERT INTO public.galaxy VALUES ('Little Sombrero Galaxy', 'Pegasus', 'Named after its similarity to the Sombrero Galaxy.', 40, 8, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Deimos', 12, 1.5e-06, 0.003, 4, false);
INSERT INTO public.moon VALUES (1, 'Moon', 3469, 73, 1.625, 3, true);
INSERT INTO public.moon VALUES (2, 'Ganymede', 5268, 148, 1.428, 5, true);
INSERT INTO public.moon VALUES (3, 'Callisto', 4821, 108, 1.236, 5, true);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 89, 1.797, 5, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 48, 1.316, 5, true);
INSERT INTO public.moon VALUES (8, 'Triton', 2707, 21, 0.782, 8, true);
INSERT INTO public.moon VALUES (9, 'Titan', 5149, 135, 1.354, 6, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 1528, 2.3, 0.260, 6, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 1471, 1.8, 0.223, 6, true);
INSERT INTO public.moon VALUES (12, 'Dione', 1123, 1.1, 0.232, 6, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 1066, 0.62, 0.145, 6, true);
INSERT INTO public.moon VALUES (14, 'Enceladus', 504, 0.11, 0.113, 6, true);
INSERT INTO public.moon VALUES (15, 'Mimas', 396, 0.038, 0.064, 6, true);
INSERT INTO public.moon VALUES (16, 'Titania', 1578, 3.4, 0.378, 7, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 1523, 3.1, 0.347, 7, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 472, 0.066, 0.079, 7, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1169, 1.3, 0.234, 7, true);
INSERT INTO public.moon VALUES (20, 'Ariel', 1158, 1.3, 0.269, 7, true);
INSERT INTO public.moon VALUES (6, 'Phobos', 23, 1.1e-05, 0.006, 4, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 5.970, 12756, 9.8, 24.0, true, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 0.330, 4879, 3.7, 4222.6, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.870, 12104, 8.9, 2802.0, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.642, 6792, 3.7, 24.7, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898.000, 142984, 23.1, 9.9, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568.000, 120536, 9, 10.7, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 86.800, 51118, 8.7, 17.2, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 102.000, 49528, 11, 16.1, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.013, 2376, 0.7, 153.3, false, 1);
INSERT INTO public.planet VALUES (12, 'Osaris (HD 209458 b)', 1348.000, 386057, 9.4, NULL, false, 6);
INSERT INTO public.planet VALUES (10, 'HD 219134 b', 0.000, 40870, 18.1, NULL, false, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 6.390, NULL, 10.1, NULL, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 6);
INSERT INTO public.star VALUES (2, 'R Andromedae', 476, 6300, 1);
INSERT INTO public.star VALUES (3, 'HD 219134', 0.778, 0.2646, 7);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.1542, 5e-05, 3);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 0.392, 0.0055, 5);
INSERT INTO public.star VALUES (6, 'HD 209458', 1.203, 1.77, 8);


--
-- Name: galactic_shape_galactic_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galactic_shape_galactic_shape_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galactic_shape galactic_shape_galactic_shape_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_shape
    ADD CONSTRAINT galactic_shape_galactic_shape_id_key UNIQUE (galactic_shape_id);


--
-- Name: galactic_shape galactic_shape_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_shape
    ADD CONSTRAINT galactic_shape_name_key UNIQUE (name);


--
-- Name: galactic_shape galactic_shape_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_shape
    ADD CONSTRAINT galactic_shape_pkey PRIMARY KEY (galactic_shape_id);


--
-- Name: galactic_shape galactic_shape_shape_class_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_shape
    ADD CONSTRAINT galactic_shape_shape_class_key UNIQUE (shape_class);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_galactic_shape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galactic_shape_id_fkey FOREIGN KEY (galactic_shape_id) REFERENCES public.galactic_shape(galactic_shape_id);


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

