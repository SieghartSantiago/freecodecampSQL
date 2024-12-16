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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter numeric(10,2) NOT NULL,
    distance_from_earth integer,
    is_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    distance_from_earth integer,
    galaxy_types character varying(30),
    age_in_millions_of_years numeric(7,2)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    description text NOT NULL,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years numeric(7,2)
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
    name character varying(30) NOT NULL,
    star_id integer,
    description text NOT NULL,
    has_life boolean,
    distance_from_earth integer,
    is_spherical boolean,
    planet_types character varying(30),
    age_in_millions_of_years numeric(7,2)
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(7,2)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the asteroid belt, considered a dwarf planet.', 940.00, 413000000, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the largest asteroids in the solar system, located in the asteroid belt.', 525.00, 340000000, false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 'A near-Earth asteroid that has the potential to impact Earth in the future.', 370.00, 39000000, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system; a barred spiral galaxy with billions of stars.', 0, 'Barred Spiral', 13600.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way and expected to merge with it in ~4.5 billion years.', 2500000, 'Spiral', 10000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy in the Local Group, known for its bright star-forming regions.', 3000000, 'Spiral', 10000.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 87 (M87)', 'A giant elliptical galaxy with a massive black hole at its center, located in the Virgo Cluster.', 53500000, 'Elliptical', 13700.00);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud (LMC)', 'A satellite galaxy of the Milky Way, known for the Tarantula Nebula, one of the most active star-forming regions.', 163000, 'Irregular', 13000.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A galaxy with a bright nucleus and a prominent dust lane, resembling a sombrero hat.', 31000000, 'Spiral/Elliptical', 13000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s only natural satellite, with a surface covered in craters and maria.', 384400, true, false, 4500.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'One of Mars'' moons, characterized by its irregular shape and rapid orbit around the planet.', 6000, true, false, 4500.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and more distant of Mars'' moons, with a low gravity and irregular shape.', 23460, true, false, 4500.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'One of Jupiter''s moons, known for its extreme volcanic activity and sulfuric surface.', 421800, true, false, 4500.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'A moon of Jupiter, with a surface of ice and the potential for a subsurface ocean.', 670900, true, false, 4500.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon of Jupiter, with a magnetic field and a mix of rock and ice.', 1070400, true, false, 4500.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'The second-largest moon of Jupiter, with a heavily cratered surface.', 1882700, true, false, 4500.00);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Saturn''s largest moon, known for its thick atmosphere and surface lakes of liquid methane.', 1221700, true, false, 4500.00);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'A moon of Saturn, with a heavily cratered icy surface.', 5270400, true, false, 4500.00);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'Saturn''s moon, known for its two-tone coloration and large equatorial ridge.', 3561300, true, false, 4500.00);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 'A moon of Saturn, famous for its icy geysers that suggest an underground ocean.', 2380200, true, false, 4500.00);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 'A moon of Saturn, known for the large crater named Herschel.', 1855200, true, false, 4500.00);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'A moon of Uranus, known for its extreme geological features and large canyons.', 1294000, true, false, 4500.00);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'A moon of Uranus, with a surface of icy canyons and ridges.', 1909000, true, false, 4500.00);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'A dark moon of Uranus, with a heavily cratered surface.', 2660000, true, false, 4500.00);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 'The largest moon of Uranus, with icy cliffs and ravines.', 4359100, true, false, 4500.00);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 'A large moon of Uranus, known for its heavily cratered surface and icy composition.', 5835000, true, false, 4500.00);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 'Neptune''s largest moon, which orbits the planet in the opposite direction to its rotation.', 3548000, true, false, 4500.00);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 'A small and irregularly shaped moon of Neptune, with a highly eccentric orbit.', 5513000, true, false, 4500.00);
INSERT INTO public.moon VALUES (22, 'Charon', 9, 'The largest moon of Pluto, with a surface marked by canyons and craters.', 19500, true, false, 4500.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The closest planet to the Sun, known for its extreme temperature variations.', false, 77, true, 'Terrestrial', 4500.00);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'The second planet from the Sun, often called Earth’s “sister planet” due to its similar size and composition.', false, 42, true, 'Terrestrial', 4600.00);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, the only known planet to support life, with abundant water and a breathable atmosphere.', true, 0, true, 'Terrestrial', 4500.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The fourth planet from the Sun, known for its red surface and potential for future colonization.', false, 225, true, 'Terrestrial', 4500.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 'The largest planet in the Solar System, a gas giant known for its Great Red Spot and many moons.', false, 778, true, 'Gas Giant', 4600.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 'The sixth planet from the Sun, famous for its stunning ring system.', false, 1430, true, 'Gas Giant', 4600.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'The seventh planet from the Sun, known for its blue-green color due to methane in the atmosphere.', false, 2870, true, 'Ice Giant', 4600.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 'The eighth planet from the Sun, known for its strong winds and blue appearance.', false, 4500, true, 'Ice Giant', 4600.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'A planet in the habitable zone of Proxima Centauri, potentially capable of supporting life.', true, 4200, true, 'Exoplanet', 4500.00);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 5, 'An exoplanet orbiting Alpha Centauri B, located in the habitable zone of its star.', true, 4200, true, 'Exoplanet', 4500.00);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 6, 'An exoplanet discovered by the Kepler Space Telescope, located in the habitable zone of its star.', true, 600, true, 'Exoplanet', 4500.00);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 6, 'An exoplanet located in the habitable zone of the red dwarf star Gliese 581, with the potential for life.', true, 200, true, 'Exoplanet', 4500.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'The brightest star in the night sky, located in the constellation Canis Major.', 8, 200.00);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 'The closest star system to the Solar System, part of the Alpha Centauri group.', 4260, 6000.00);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 'The closest star to the Sun, part of the Alpha Centauri system.', 4000, 4500.00);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 'A red supergiant star in the constellation Orion, one of the largest stars visible to the naked eye.', 643, 80000.00);
INSERT INTO public.star VALUES (5, 'Vega', 4, 'A bright star in the constellation Lyra, one of the most studied stars in astronomy.', 258, 4500.00);
INSERT INTO public.star VALUES (6, 'Canopus', 5, 'The second-brightest star in the sky, located in the constellation Carina.', 310, 10000.00);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

