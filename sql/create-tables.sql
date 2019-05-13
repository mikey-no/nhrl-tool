--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file (
    fileid bigint NOT NULL,
    sha1 character varying(40),
    md5 character varying(32),
    crc32 character varying(32),
    filename character varying(255),
    filesize bigint,
    productcode character varying(15),
    opsystemcode character varying(15),
    specialcode character varying(1)
);


ALTER TABLE public.file OWNER TO postgres;

--
-- Name: file_fileid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.file_fileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_fileid_seq OWNER TO postgres;

--
-- Name: file_fileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.file_fileid_seq OWNED BY public.file.fileid;


--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturer (
    manufacturerid bigint NOT NULL,
    mfgcode character varying(15),
    mfgname character varying(150)
);


ALTER TABLE public.manufacturer OWNER TO postgres;

--
-- Name: manufacturer_manufacturerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturer_manufacturerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturer_manufacturerid_seq OWNER TO postgres;

--
-- Name: manufacturer_manufacturerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturer_manufacturerid_seq OWNED BY public.manufacturer.manufacturerid;


--
-- Name: operatingsystem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operatingsystem (
    operatingsystemid bigint NOT NULL,
    opsystemcode character varying(15),
    opsystemname character varying(150),
    opsystemversion character varying(15),
    mfgcode character varying(15)
);


ALTER TABLE public.operatingsystem OWNER TO postgres;

--
-- Name: operatingsystem_operatingsystemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operatingsystem_operatingsystemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operatingsystem_operatingsystemid_seq OWNER TO postgres;

--
-- Name: operatingsystem_operatingsystemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operatingsystem_operatingsystemid_seq OWNED BY public.operatingsystem.operatingsystemid;


--
-- Name: productcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcode (
    productid bigint NOT NULL,
    productcode bigint,
    productname character varying(150),
    productversion character varying(15),
    opsystemcode character varying(15),
    mfgcode character varying(15),
    lang character varying(150),
    applicationtype character varying(50)
);


ALTER TABLE public.productcode OWNER TO postgres;

--
-- Name: productcode_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productcode_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productcode_productid_seq OWNER TO postgres;

--
-- Name: productcode_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productcode_productid_seq OWNED BY public.productcode.productid;


--
-- Name: rdsversion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rdsversion (
    rdsversionid bigint NOT NULL,
    sha1 character varying(40),
    rdsversion character varying(40)
);


ALTER TABLE public.rdsversion OWNER TO postgres;

--
-- Name: rdsversion_rdsversionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rdsversion_rdsversionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rdsversion_rdsversionid_seq OWNER TO postgres;

--
-- Name: rdsversion_rdsversionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rdsversion_rdsversionid_seq OWNED BY public.rdsversion.rdsversionid;


--
-- Name: file fileid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file ALTER COLUMN fileid SET DEFAULT nextval('public.file_fileid_seq'::regclass);


--
-- Name: manufacturer manufacturerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer ALTER COLUMN manufacturerid SET DEFAULT nextval('public.manufacturer_manufacturerid_seq'::regclass);


--
-- Name: operatingsystem operatingsystemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operatingsystem ALTER COLUMN operatingsystemid SET DEFAULT nextval('public.operatingsystem_operatingsystemid_seq'::regclass);


--
-- Name: productcode productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcode ALTER COLUMN productid SET DEFAULT nextval('public.productcode_productid_seq'::regclass);


--
-- Name: rdsversion rdsversionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rdsversion ALTER COLUMN rdsversionid SET DEFAULT nextval('public.rdsversion_rdsversionid_seq'::regclass);


--
-- Name: file file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_pkey PRIMARY KEY (fileid);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturerid);


--
-- Name: operatingsystem operatingsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operatingsystem
    ADD CONSTRAINT operatingsystem_pkey PRIMARY KEY (operatingsystemid);


--
-- Name: productcode productcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcode
    ADD CONSTRAINT productcode_pkey PRIMARY KEY (productid);


--
-- Name: rdsversion rdsversion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rdsversion
    ADD CONSTRAINT rdsversion_pkey PRIMARY KEY (rdsversionid);


--
-- Name: TABLE file; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.file TO rfilesig;


--
-- Name: TABLE manufacturer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.manufacturer TO rfilesig;


--
-- Name: TABLE operatingsystem; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.operatingsystem TO rfilesig;


--
-- Name: TABLE productcode; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.productcode TO rfilesig;


--
-- Name: TABLE rdsversion; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rdsversion TO rfilesig;


--
-- PostgreSQL database dump complete
--

