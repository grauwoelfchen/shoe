--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = true;


CREATE TABLE collection (
    odba_id integer NOT NULL,
    key text NOT NULL,
    value text
);


ALTER TABLE public.collection OWNER TO shoe;

--
-- Name: object; Type: TABLE; Schema: public; Owner: shoe; Tablespace: 
--

CREATE TABLE object (
    odba_id integer NOT NULL,
    content text,
    name text,
    prefetchable boolean,
    extent text
);


ALTER TABLE public.object OWNER TO shoe;

--
-- Name: object_connection; Type: TABLE; Schema: public; Owner: shoe; Tablespace: 
--

CREATE TABLE object_connection (
    origin_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE public.object_connection OWNER TO shoe;


--
-- Name: collection_pkey; Type: CONSTRAINT; Schema: public; Owner: shoe; Tablespace: 
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (odba_id, key);


--
-- Name: object_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: shoe; Tablespace: 
--

ALTER TABLE ONLY object_connection
    ADD CONSTRAINT object_connection_pkey PRIMARY KEY (origin_id, target_id);


--
-- Name: object_name_key; Type: CONSTRAINT; Schema: public; Owner: shoe; Tablespace: 
--

ALTER TABLE ONLY object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object_pkey; Type: CONSTRAINT; Schema: public; Owner: shoe; Tablespace: 
--

ALTER TABLE ONLY object
    ADD CONSTRAINT object_pkey PRIMARY KEY (odba_id);

