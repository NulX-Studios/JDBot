--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg20.04+1)

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
-- Name: config_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.config_type AS ENUM (
    'guild',
    'dm'
);


--
-- Name: etype_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.etype_enum AS ENUM (
    'user',
    'channel',
    'guild'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: afk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.afk (
    user_id bigint,
    added_time timestamp with time zone,
    text text
);


--
-- Name: blacklisted_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blacklisted_users (
    user_id bigint,
    reason text
);


--
-- Name: economy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.economy (
    user_id bigint NOT NULL,
    bank bigint DEFAULT 0,
    wallet bigint DEFAULT 100
);


--
-- Name: global_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.global_link (
    guild_id bigint NOT NULL,
    channel_id bigint,
    webhook_url text
);


--
-- Name: imoog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.imoog (
    identifier text,
    media bytea,
    mime text
);


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    job_name text,
    amount_paid bigint
);


--
-- Name: my_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.my_images (
    name text NOT NULL,
    image bytea,
    mime text
);


--
-- Name: prefixes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prefixes (
    is_dm integer,
    id bigint,
    prefix text
);


--
-- Name: random_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.random_history (
    response text
);


--
-- Name: rtfm_dictionary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rtfm_dictionary (
    name text,
    link text
);


--
-- Name: subreddits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subreddits (
    name text
);


--
-- Name: sus_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sus_users (
    user_id bigint,
    reason text
);


--
-- Name: testers_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.testers_list (
    user_id bigint
);


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    author_id bigint,
    remote_id bigint,
    end_timestamp bigint
);


--
-- Name: todo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.todo (
    user_id bigint NOT NULL,
    added_time timestamp with time zone NOT NULL,
    text text NOT NULL,
    jump_url text NOT NULL
);


--
-- Name: economy economy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.economy
    ADD CONSTRAINT economy_pkey PRIMARY KEY (user_id);


--
-- Name: global_link global_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.global_link
    ADD CONSTRAINT global_link_pkey PRIMARY KEY (guild_id);


--
-- Name: my_images my_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.my_images
    ADD CONSTRAINT my_images_pkey PRIMARY KEY (name);


--
-- Name: todo todo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (user_id, text);


--
-- PostgreSQL database dump complete
--
