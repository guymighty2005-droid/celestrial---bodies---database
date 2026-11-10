--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_types character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(8,2),
    is_spherical boolean DEFAULT false NOT NULL,
    description text
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    launch_year integer NOT NULL,
    agency character varying(60),
    is_crewed boolean DEFAULT false NOT NULL,
    description text
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    orbital_period_days numeric(8,3),
    is_spherical boolean DEFAULT true NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    orbital_distance_au numeric(8,4),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    has_known_planets boolean DEFAULT false NOT NULL,
    description text
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 13610, 0.00, false, 'Our home galaxy, containing the Sun and roughly 200 billion stars');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false, 'The nearest large galaxy, on a slow collision course with the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.73, false, 'Third largest member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, false, 'Satellite galaxy of the Milky Way visible from the southern hemisphere');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 13000, 23.00, false, 'Famous face-on spiral interacting with a smaller companion galaxy');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unbarred spiral', 13250, 29.30, false, 'Bright galaxy with a huge central bulge and a prominent dust lane');


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Mariner 10', 13, 1973, 'NASA', false, 'First spacecraft to visit Mercury and the first to use a gravity assist');
INSERT INTO public.mission VALUES (2, 'Magellan', 14, 1989, 'NASA', false, 'Mapped almost the entire surface of Venus with radar');
INSERT INTO public.mission VALUES (3, 'International Space Station', 15, 1998, 'NASA, Roscosmos, ESA, JAXA, CSA', true, 'Continuously crewed orbital laboratory');
INSERT INTO public.mission VALUES (4, 'Perseverance', 16, 2020, 'NASA', false, 'Rover searching for signs of ancient life on Mars');
INSERT INTO public.mission VALUES (5, 'Juno', 17, 2011, 'NASA', false, 'Orbiter studying Jupiters interior and magnetic field');
INSERT INTO public.mission VALUES (6, 'Cassini-Huygens', 18, 1997, 'NASA, ESA, ASI', false, 'Orbited Saturn for 13 years and landed a probe on Titan');
INSERT INTO public.mission VALUES (7, 'Voyager 2', 20, 1977, 'NASA', false, 'Only spacecraft to have flown past Neptune');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (45, 'Moon', 15, 3474, 27.322, true, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (46, 'Phobos', 16, 22, 0.319, false, 'Larger and closer moon of Mars, slowly spiralling inward');
INSERT INTO public.moon VALUES (47, 'Deimos', 16, 12, 1.263, false, 'Smaller, outer moon of Mars');
INSERT INTO public.moon VALUES (48, 'Io', 17, 3643, 1.769, true, 'The most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (49, 'Europa', 17, 3122, 3.551, true, 'Icy shell hiding a global subsurface ocean');
INSERT INTO public.moon VALUES (50, 'Ganymede', 17, 5268, 7.155, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (51, 'Callisto', 17, 4821, 16.689, true, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (52, 'Amalthea', 17, 167, 0.498, false, 'Small, reddish, irregular inner moon of Jupiter');
INSERT INTO public.moon VALUES (53, 'Titan', 18, 5150, 15.945, true, 'Has a thick atmosphere and lakes of liquid methane');
INSERT INTO public.moon VALUES (54, 'Enceladus', 18, 504, 1.370, true, 'Sprays water-ice geysers from its south pole');
INSERT INTO public.moon VALUES (55, 'Mimas', 18, 396, 0.942, true, 'Has a giant crater that resembles the Death Star');
INSERT INTO public.moon VALUES (56, 'Rhea', 18, 1527, 4.518, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (57, 'Iapetus', 18, 1469, 79.322, true, 'Two-toned moon with one dark and one bright hemisphere');
INSERT INTO public.moon VALUES (58, 'Dione', 18, 1123, 2.737, true, 'Icy moon with bright wispy cliffs');
INSERT INTO public.moon VALUES (59, 'Tethys', 18, 1062, 1.888, true, 'Almost pure water ice with a huge canyon system');
INSERT INTO public.moon VALUES (60, 'Titania', 19, 1578, 8.706, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (61, 'Oberon', 19, 1523, 13.463, true, 'Outermost large moon of Uranus');
INSERT INTO public.moon VALUES (62, 'Miranda', 19, 472, 1.413, true, 'Patchwork surface with towering cliffs');
INSERT INTO public.moon VALUES (63, 'Ariel', 19, 1158, 2.520, true, 'Brightest of the Uranian moons');
INSERT INTO public.moon VALUES (64, 'Umbriel', 19, 1169, 4.144, true, 'Dark, ancient and heavily cratered moon of Uranus');
INSERT INTO public.moon VALUES (65, 'Triton', 20, 2707, 5.877, true, 'Orbits Neptune backwards and has nitrogen geysers');
INSERT INTO public.moon VALUES (66, 'Proteus', 20, 420, 1.122, false, 'Second largest Neptunian moon, dark and irregular');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 7, 'Terrestrial', 4600, 0.3870, false, true, 'Smallest planet and closest to the Sun');
INSERT INTO public.planet VALUES (14, 'Venus', 7, 'Terrestrial', 4600, 0.7230, false, true, 'Hottest planet thanks to a runaway greenhouse effect');
INSERT INTO public.planet VALUES (15, 'Earth', 7, 'Terrestrial', 4540, 1.0000, true, true, 'The only world known to host life');
INSERT INTO public.planet VALUES (16, 'Mars', 7, 'Terrestrial', 4600, 1.5240, false, true, 'The red planet with the tallest volcano in the solar system');
INSERT INTO public.planet VALUES (17, 'Jupiter', 7, 'Gas giant', 4600, 5.2030, false, true, 'Largest planet, with a storm older than 300 years');
INSERT INTO public.planet VALUES (18, 'Saturn', 7, 'Gas giant', 4600, 9.5370, false, true, 'Famous for its wide system of icy rings');
INSERT INTO public.planet VALUES (19, 'Uranus', 7, 'Ice giant', 4600, 19.1900, false, true, 'Ice giant that rotates on its side');
INSERT INTO public.planet VALUES (20, 'Neptune', 7, 'Ice giant', 4600, 30.0700, false, true, 'Windy, deep-blue ice giant at the edge of the planetary system');
INSERT INTO public.planet VALUES (21, 'Proxima b', 8, 'Exoplanet (terrestrial)', 4850, 0.0485, false, true, 'Rocky planet in the habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1 d', 11, 'Exoplanet (terrestrial)', 7600, 0.0222, false, true, 'Inner world of the TRAPPIST-1 system');
INSERT INTO public.planet VALUES (23, 'TRAPPIST-1 e', 11, 'Exoplanet (terrestrial)', 7600, 0.0292, false, true, 'Considered one of the most Earth-like exoplanets found so far');
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1 f', 11, 'Exoplanet (terrestrial)', 7600, 0.0385, false, true, 'Cool, possibly water-rich world in the habitable zone');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 1, 'G-type main-sequence', 4600, 0.00, true, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 'Red dwarf', 4850, 4.24, true, 'The closest known star to the Sun');
INSERT INTO public.star VALUES (9, 'Sirius', 1, 'A-type main-sequence', 242, 8.60, false, 'The brightest star in the night sky');
INSERT INTO public.star VALUES (10, 'Betelgeuse', 1, 'Red supergiant', 10, 548.00, false, 'A massive star in Orion expected to explode as a supernova');
INSERT INTO public.star VALUES (11, 'TRAPPIST-1', 1, 'Ultra-cool red dwarf', 7600, 40.70, true, 'Small star hosting seven Earth-sized planets');
INSERT INTO public.star VALUES (12, 'R136a1', 4, 'Wolf-Rayet', 1, 163000.00, false, 'One of the most massive and luminous stars known, in the Large Magellanic Cloud');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 66, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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
-- Name: mission mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

