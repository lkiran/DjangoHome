--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Debian 16.8-1.pgdg120+1)

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
-- Name: app_category; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_category (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL
);


ALTER TABLE public.app_category OWNER TO admin;

--
-- Name: app_condition; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_condition (
    "Id" character varying(22) NOT NULL,
    "Operator" integer NOT NULL,
    "Value" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL,
    "Property_id" character varying(22) NOT NULL
);


ALTER TABLE public.app_condition OWNER TO admin;

--
-- Name: app_condition_AndConditions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_condition_AndConditions" (
    id integer NOT NULL,
    from_condition_id character varying(22) NOT NULL,
    to_condition_id character varying(22) NOT NULL
);


ALTER TABLE public."app_condition_AndConditions" OWNER TO admin;

--
-- Name: app_condition_AndConditions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_condition_AndConditions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_condition_AndConditions_id_seq" OWNER TO admin;

--
-- Name: app_condition_AndConditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_condition_AndConditions_id_seq" OWNED BY public."app_condition_AndConditions".id;


--
-- Name: app_control; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_control (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(60) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL
);


ALTER TABLE public.app_control OWNER TO admin;

--
-- Name: app_control_Conditions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_control_Conditions" (
    id integer NOT NULL,
    control_id character varying(22) NOT NULL,
    condition_id character varying(22) NOT NULL
);


ALTER TABLE public."app_control_Conditions" OWNER TO admin;

--
-- Name: app_control_Conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_control_Conditions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_control_Conditions_id_seq" OWNER TO admin;

--
-- Name: app_control_Conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_control_Conditions_id_seq" OWNED BY public."app_control_Conditions".id;


--
-- Name: app_control_Tasks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_control_Tasks" (
    id integer NOT NULL,
    control_id character varying(22) NOT NULL,
    task_id character varying(22) NOT NULL
);


ALTER TABLE public."app_control_Tasks" OWNER TO admin;

--
-- Name: app_control_Tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_control_Tasks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_control_Tasks_id_seq" OWNER TO admin;

--
-- Name: app_control_Tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_control_Tasks_id_seq" OWNED BY public."app_control_Tasks".id;


--
-- Name: app_device; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_device (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CallClass" character varying(50) NOT NULL,
    "Parameters" text NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL
);


ALTER TABLE public.app_device OWNER TO admin;

--
-- Name: app_device_Functions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_device_Functions" (
    id integer NOT NULL,
    device_id character varying(22) NOT NULL,
    function_id character varying(22) NOT NULL
);


ALTER TABLE public."app_device_Functions" OWNER TO admin;

--
-- Name: app_device_Functions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_device_Functions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_device_Functions_id_seq" OWNER TO admin;

--
-- Name: app_device_Functions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_device_Functions_id_seq" OWNED BY public."app_device_Functions".id;


--
-- Name: app_function; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_function (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL
);


ALTER TABLE public.app_function OWNER TO admin;

--
-- Name: app_function_Properties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_function_Properties" (
    id integer NOT NULL,
    function_id character varying(22) NOT NULL,
    property_id character varying(22) NOT NULL
);


ALTER TABLE public."app_function_Properties" OWNER TO admin;

--
-- Name: app_function_Properties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_function_Properties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_function_Properties_id_seq" OWNER TO admin;

--
-- Name: app_function_Properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_function_Properties_id_seq" OWNED BY public."app_function_Properties".id;


--
-- Name: app_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_group (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL,
    "ParentGroup_id" character varying(22)
);


ALTER TABLE public.app_group OWNER TO admin;

--
-- Name: app_group_Properties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."app_group_Properties" (
    id integer NOT NULL,
    group_id character varying(22) NOT NULL,
    property_id character varying(22) NOT NULL
);


ALTER TABLE public."app_group_Properties" OWNER TO admin;

--
-- Name: app_group_Properties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."app_group_Properties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."app_group_Properties_id_seq" OWNER TO admin;

--
-- Name: app_group_Properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."app_group_Properties_id_seq" OWNED BY public."app_group_Properties".id;


--
-- Name: app_groupdevice; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_groupdevice (
    device_ptr_id character varying(22) NOT NULL,
    "Group_id" character varying(22) NOT NULL
);


ALTER TABLE public.app_groupdevice OWNER TO admin;

--
-- Name: app_interface; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_interface (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL,
    "Editor_id" character varying(22),
    "Monitor_id" character varying(22)
);


ALTER TABLE public.app_interface OWNER TO admin;

--
-- Name: app_prefab; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_prefab (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Template" text NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL
);


ALTER TABLE public.app_prefab OWNER TO admin;

--
-- Name: app_property; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_property (
    "Id" character varying(22) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "CallFunction" character varying(50) NOT NULL,
    "Parameters" text NOT NULL,
    "Value" character varying(50) NOT NULL,
    "Type" integer NOT NULL,
    "Class" integer NOT NULL,
    "Comparable" boolean NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL,
    "Category_id" character varying(22)
);


ALTER TABLE public.app_property OWNER TO admin;

--
-- Name: app_propertyinfo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_propertyinfo (
    property_ptr_id character varying(22) NOT NULL
);


ALTER TABLE public.app_propertyinfo OWNER TO admin;

--
-- Name: app_task; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_task (
    "Id" character varying(22) NOT NULL,
    "Value" character varying(50) NOT NULL,
    "CreatedOn" timestamp with time zone NOT NULL,
    "ModifiedOn" timestamp with time zone NOT NULL,
    "Property_id" character varying(22) NOT NULL
);


ALTER TABLE public.app_task OWNER TO admin;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: app_condition_AndConditions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_condition_AndConditions" ALTER COLUMN id SET DEFAULT nextval('public."app_condition_AndConditions_id_seq"'::regclass);


--
-- Name: app_control_Conditions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Conditions" ALTER COLUMN id SET DEFAULT nextval('public."app_control_Conditions_id_seq"'::regclass);


--
-- Name: app_control_Tasks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Tasks" ALTER COLUMN id SET DEFAULT nextval('public."app_control_Tasks_id_seq"'::regclass);


--
-- Name: app_device_Functions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_device_Functions" ALTER COLUMN id SET DEFAULT nextval('public."app_device_Functions_id_seq"'::regclass);


--
-- Name: app_function_Properties id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_function_Properties" ALTER COLUMN id SET DEFAULT nextval('public."app_function_Properties_id_seq"'::regclass);


--
-- Name: app_group_Properties id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_group_Properties" ALTER COLUMN id SET DEFAULT nextval('public."app_group_Properties_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_category; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_category ("Id", "Name", "CreatedOn", "ModifiedOn") FROM stdin;
\.


--
-- Data for Name: app_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_condition ("Id", "Operator", "Value", "CreatedOn", "ModifiedOn", "Property_id") FROM stdin;
3LYfnhdjYeTrNWRVMUzbeF	0	clicked	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	VSHF6rC9fuWapi3uEh7fr6
9VtYp2LmQa4WzXc8BnHrKu	0	long-pressed	2026-02-08 08:11:16+00	2026-02-08 08:11:16+00	5Ng5gqheWeRt28PuppEPix
FMfGZwBRmUFL8gG6BAzTUS	0	clicked	2025-05-04 09:30:44+00	2025-05-04 09:30:44+00	Xcgsq4QdRBjLDk4T59tLpW
KTzSG9zoTqF3kMpxZEqSmq	0	0	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00	2tAzCuvkyciSdWrWvAwtkH
LZShv3rBb9q3LyBMiEF9Cw	0	1	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	LiN5mQSQsS85EfepeSKVGR
Mn8XK7mZn7LuLjX9WjpJPn	0	0	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	LiN5mQSQsS85EfepeSKVGR
QJq9R2NVhxNMS3T7XqCFnH	0	1	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	aezyMfcEcQvXAJTPXYWdA7
QezkGXCRZnDqtFsF9wNhbm	0	0	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	Tmqxn4nGoszNrkomdT2c4P
YTvUqqbbAwugpuKa7Ny3QA	0	1	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00	2tAzCuvkyciSdWrWvAwtkH
aa0a0FAaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	QZa7w62e4gMPVYE2mX5ov6
aa0a6FAaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	ZGeN7vyupBfJiEtsYqTmY7
aa0a6FNaHlRaA2TYCNraa0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	2CVgMmoJV622LUYKcNRH7U
aa0a6FNaHlRaA2TYCNrqa0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	WFMsQsj9hpPxNpGLh4FsAW
aa0f6FAaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	P63uRSY9K9jp8DqQfHPqtX
aa0f6FNaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	CC3vB4N4NHp46aPc9MYy8o
aa0f6aNaHtRaA2TYCAraa0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	QZa7w62e4gMPVYE2mX5ov6
aa0f6aNaHtRaA2TYCNraa0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	ZGeN7vyupBfJiEtsYqTmY7
aa0f6aNaHtRaA2TYCNrqa0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	P63uRSY9K9jp8DqQfHPqtX
aa0f6aNaHtRaA2TYCNrqz0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	CC3vB4N4NHp46aPc9MYy8o
ae0f6FNaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	UHi3qgecJ4StH956Bxrp2B
ae0f6aNaHtRaA2TYCNrqz0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	UHi3qgecJ4StH956Bxrp2B
bb1b7GObIlSaB3TYDNrbb1	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	fBfAcHubWAEaMBM7DVUJTF
bb1g7bObJtSaB3TYDBrbb0	0	0	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	7CtNcKkc9C6fv7EehCXEjN
bb1g7bObJtSaB3TYDBrbb2	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	a4FwyGD7Ybd9GyGTbBucLN
cc1c1HAcItSaC3TYCNrcc0	0	1	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	7CtNcKkc9C6fv7EehCXEjN
cc1c1HAcItSaC3TYCNrcc3	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	a4FwyGD7Ybd9GyGTbBucLN
dYo6AKH6c9UjwMP7kbcwaz	0	clicked	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	n4MKBGvk8khHLTRJU3BrpG
dd1d7DObIlSaD3TYDNrdd1	0	clicked	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	oTYrAoR9vMEBGV3o9B9Nph
gg1g7GObJtSaG3TYDGgg1	0	clicked	2024-09-07 08:46:50+00	2024-09-07 08:46:50+00	JXhUaLwF8vzvcgL3Lzf3os
ha0a6FNaHlRaA2TYCNrqa0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	keNkjYNaTmy3VMZfHUyYiK
ha0a6FNaHlRaA2TYCNrqz0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	aoeKQgrj6HqpeddwHyxrf2
ha0f6FNaHlRaA2TYCNrqz0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	PgUmw3i2jGQhUDdsxFEmBc
he0f6FNaHlRaA2TYCNrqz0	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	38iT3w9R3HUuZbNrveSi2a
he0f6FNaHtRaA2TYCNraz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	H5584ySuh5FJWDJy3CEzs5
he0f6FNaHtRaA2TYCNrqz0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	HEjEoSPAKFJXwFABhXoKyt
he0f6FNaHtRaA2TYCNrqz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	HEjEoSPAKFJXwFABhXoKyt
he0f6aNaHtRaA2TYCNrqz0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	H5584ySuh5FJWDJy3CEzs5
heff0FNWHtRaA2TYCNrqz0	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	DpSZEnnX24M5qR3W8Prbuw
heff0FNWHtRaA2TYCNrqz1	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	DpSZEnnX24M5qR3W8Prbuw
heff6FNWHtRaA2TYCNrqza	0	clicked	2021-09-12 13:45:25.626+00	2021-09-12 13:45:25.627+00	ZUHmH4eiDM9YgtDYDPGdmy
heff6FNWHtRaA2TYCNrqzb	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	UvE4xmwkvPSXKtcbaJKT24
heff6FNWHtRaA2TYCNrqzc	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	h6FQb7ac64cntaJRdZEMK2
heff6FNWHtRaA2TYCNrqzd	0	clicked	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	9sTmrxTrCZ8QWf3rBA9uds
heff6FNaHtRaA2TYCNrqz0	0	0	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Ta3ytZqYHu5BoWW5gQVwd9
heff6FNaHtRaA2TYCNrqz1	0	1	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Ta3ytZqYHu5BoWW5gQVwd9
hh1h7HObJtSaH3TYDHhh1	0	0	2024-09-07 08:46:52+00	2024-09-07 08:46:52+00	52nodgPLPHSifHL7QNdRYt
ii1i1IAcItSaI3TYCIrii3	0	1	2024-09-07 08:47:03+00	2024-09-07 08:47:03+00	52nodgPLPHSifHL7QNdRYt
jj1j7JObJtSaJ3TYDJjj1	0	clicked	2024-09-07 09:07:30+00	2024-09-07 09:07:30+00	RrfGZkqcchg2Scwu5LWtQ9
kk1k7KObJtSaK3TYDKkk1	0	0	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00	BppB6XmUPJ6CMBGad3ttYX
ll1l1LAcItSaL3TYCLlll3	0	1	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00	BppB6XmUPJ6CMBGad3ttYX
ma1m7MObJtSaM3TYDMmm1	0	clicked	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	BJeDYYcwrxRBVbwHWeXVMA
mm1m7MObJtSaM3TYDMmm1	0	clicked	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	SFDA9PzwCr573uAcALwkLd
nn1n7NObJtSaN3TYDNan1	0	0	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	coXyp55DDgCkCy4pRujQue
nn1n7NObJtSaN3TYDNnn1	0	0	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	DbwYyXZT9xHrfp4z7sSAeP
nzzVmnvFoRrxCbZkG9QeVq	0	1	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	Tmqxn4nGoszNrkomdT2c4P
o1J3k4T8L5h6R7n9S8g2X4	0	0	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00	g23KTR5F7hWBHqWdhCffMd
oo1o1OAcItSaO3TYCOoo3	0	1	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	DbwYyXZT9xHrfp4z7sSAeP
oo1o1OAcItSaO3TYCOooo3	0	1	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	coXyp55DDgCkCy4pRujQue
pa1p7PObJtSaP3TYDPpp1	0	clicked	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	UASmoGkG6hq3k37CKHPYYo
pp1p7PObJtSaP3TYDPpp1	0	clicked	2024-09-07 09:20:21+00	2024-09-07 09:20:21+00	SfVskPGvAfAGYEZBd5GnNB
qa1q7QObJtSaQ3TYDQqq1	0	0	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	KVu64mETAgFgRFXX8wAgjd
qkmnmRjLZSez8A6MvQNS57	0	0	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	aezyMfcEcQvXAJTPXYWdA7
qq1q7QObJtSaQ3TYDQqq1	0	0	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00	S72MUtgs52R3DHbK8shaEf
r5K7h8L9J4t2A7n1B6v3Y5	0	clicked	2024-10-28 16:17:03+00	2024-10-28 16:17:03+00	5Ng5gqheWeRt28PuppEPix
ra1r1RObItSaR3TYCRrr3	0	1	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	KVu64mETAgFgRFXX8wAgjd
rr1r1RAcItSaR3TYCRrr3	0	1	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00	S72MUtgs52R3DHbK8shaEf
ss1s7SObJtSaS3TYDSss1	0	clicked	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	dy6bF33wHNH4G2rVtWwPG4
tt1t7TObJtSaT3TYDTtt1	0	0	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	Kg6tQbV68EtsPRRfJ9sTUj
uu1u1UAcItSaU3TYCUuu3	0	1	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	Kg6tQbV68EtsPRRfJ9sTUj
x6W4h9N1L2g3Y5j8D6p7R8	0	1	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00	g23KTR5F7hWBHqWdhCffMd
zP7mbo3u7KZayRMLdteqYc	0	clicked	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	h6GAhvYmhVhNK2k6MAhrBH
\.


--
-- Data for Name: app_condition_AndConditions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_condition_AndConditions" (id, from_condition_id, to_condition_id) FROM stdin;
\.


--
-- Data for Name: app_control; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_control ("Id", "Name", "CreatedOn", "ModifiedOn") FROM stdin;
2MfsUmmWvB6kTN7TEiJ2q6	WC Havuz kapalıysa butonu yeşil yap	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00
3cYc2mXKQd7VnHf9PqLrTs	Bottom right button toggles Aspiratör	2026-02-08 08:11:16+00	2026-02-08 08:11:16+00
8QLLAbXqJSeANjqEF5cP3C	Sol alt buton basıldığında Duş Havuz toggle et	2025-05-04 09:30:44+00	2025-05-04 09:30:44+00
D5HpNQRddBArYrFtZbaRva	Duş Havuz açıkken butonu sarı yap	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00
JSnZ7ApCvjMFf8XvdrYRAc	WC Spotları kapalıysa butonu yeşil yap	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00
Rcyztwnr4ro4EcBhbcRXYa	Sağ alt buton basıldığında WC Havuz toggle et	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00
ThAMZCrDTLvvBeYa7zNSck	Duş Havuz kapalıysa butonu yeşil yap	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00
XJ43UwMzzVPAvYULrbwt3K	WC Havuz açıksa butonu sarı yap	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00
a0AAAaaxNFQXaFy4zabTA0	Orta oda spot kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
a0AVAaaxNFQXaFy4zabTA0	Orta oda havuz kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
a0CVAaaxNFQXaFy4zabTA0	Koridor apliği kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
b1BBBbbyOFQXaFy4zabTB0	Orta Oda Sol Aplik kapatıldığında butonu yeşil yap	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00
b1BBBbbyOFQXaFy4zabTB1	Orta oda sol aplik kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
e2I9k8T3Y7m6B5h2R8j1D0	Balkon açıldığında butonu sarı yap	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00
exqncBgMCErP9JYzZcV8AL	Duş Spotu kapalıysa Sol Üst butonu yeşil yap	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00
h0AAAaAxNFQXaFy4zabAA0	Sol üst basıldığında orta oda spot toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0AAAaExNFQXaFy4zabAA0	Sağ üst basıldığında orta oda havuz toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0AAAaExNFQXaFy4zabTA0	Sağ alt basıldığında koridor apliği toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0AALaExNFQXaFy4zabTA0	Sol alt basıldığında koridor havuzu toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0AVLaExNFQXaFy4zabTA0	Sağ üst basıldığında koridor spotu toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVAaaxNFQXaFy4zabTA0	Koridor havuzu kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVAaaxNFQXaFy4zabTF0	Koridor spotu kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVLaExNFQXaFy4zabTA0	Sol üst basıldığında tuvaleti toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVLaExNFQXaFy4zabTF0	Sağ oda havuz kapandığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVLaExNFQXaFy4zabTF1	Sağ oda havuz açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0CVLaaxNFQXaFy4zabTF0	Tuvalet kapatıldığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aALaExNAQXaFy4zaaAA1	Orta oda spot açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aVLaExNAQXaFy4zaaAA1	Orta oda havuz açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aVLaExNAQXaFy4zabAA1	Koridor apliği açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aVLaExNFQXaFy4zabAA1	Koridor havuzu açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aVLaExNFQXaFy4zabTA1	Koridor spotu açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h0aVLaExNFQXaFy4zabTF1	Tuvalet açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h1BBBbBxOFQXaFy4zabBB1	Sol alt basıldığında orta oda sol aplik toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
h1DDDdDxOFQXaFy4zabDD1	Sağ alt buton basıldığında Orta Oda Sol Aplik toggle et	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00
h1GGGgGxOFQXaFy4zabGG1	Sol üst buton basıldığında Mutfak Spotlarını toggle et	2024-09-07 08:46:50+00	2024-09-07 08:46:50+00
h1HHHhHxOFQXaFy4zabHH1	Mutfak Spotları kapatıldığında butonu yeşil yap	2024-09-07 08:46:52+00	2024-09-07 08:46:52+00
h1IIIiIxOFQXaFy4zabII1	Mutfak Spotları açıldığında butonu sarı yap	2024-09-07 08:46:54+00	2024-09-07 08:46:54+00
h1JJJjJxOFQXaFy4zabJJ1	Sağ üst buton basıldığında Mutfak Havuzunu toggle et	2024-09-07 09:07:30+00	2024-09-07 09:07:30+00
h1KKKkKxOFQXaFy4zabKK1	Mutfak Havuzu kapatıldığında butonu yeşil yap	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00
h1LLLkKxOFQXaFy4zabLL1	Mutfak Havuzu açıldığında butonu sarı yap	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00
h1MMMmMxOFQXaFy4zabMM1	Sol alt buton basıldığında Sarkıtları toggle et	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00
h1MMMmxOFQXaFy4zabMM1	Sağ üst buton basıldığında Sol Oda Havuz toggle et	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00
h1NNNnNxOFQXaFy4zabNN1	Sarkıtları kapatıldığında butonu yeşil yap	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00
h1NNNnxOFQXaFy4zabNN1	Sol Oda Havuz kapatıldığında butonu yeşil yap	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00
h1OOOnxOFQXaFy4zabOO1	Sol Oda Havuz açıldığında butonu sarı yap	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00
h1OOOqOxOFQXaFy4zabOO1	Sarkıtları açıldığında butonu sarı yap	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00
h1PPPlPxOFQXaFy4zabPP1	Sağ alt buton basıldığında Balkonu toggle et	2024-09-07 09:20:21+00	2024-09-07 09:20:21+00
h1PPPpxOFQXaFy4zabPP1	Sol alt buton basıldığında Sol Oda Aplik toggle et	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00
h1QQQqQxOFQXaFy4zabQQ1	Balkon kapatıldığında butonu yeşil yap	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00
h1QQQqxOFQXaFy4zabQQ1	Sol Oda Aplik kapatıldığında butonu yeşil yap	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00
h1RRRrRxOFQXaFy4zabRR1	Balkon açıldığında butonu sarı yap	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00
h1RRRrxOFQXaFy4zabRR1	Sol Oda Aplik açıldığında butonu sarı yap	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00
h1SSSxOFQXaFy4zabSS1	Sol üst buton basıldığında Sol Oda Köşeler toggle et	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00
h1TTTxOFQXaFy4zabTT1	Sol Oda Köşeler kapatıldığında butonu yeşil yap	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00
h1UUUxOFQXaFy4zabUU1	Sol Oda Köşeler açıldığında butonu sarı yap	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00
h1cCLcCxOFQXaFy4zabCC0	Orta Oda Sol Aplik açıldığında butonu sarı yap	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00
h1cCLcCxOFQXaFy4zabCC1	Orta oda sol aplik açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXWFx4zzbTF3	Sağ üst basıldığında sağ oda apliği toggle et	2022-03-05 14:16:50.398+00	2022-03-05 14:16:50.398+00
hhCVLaExNFQXWFx4zzbTF4	Sol üst basıldığında sağ oda köşeleri toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXWFy4zabTF0	Sağ oda spot açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXWFy4zabTF1	Sağ oda spot kapandığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXWFy4zabTF3	Sol alt basıldığında sağ oda havuz toggle et	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXaFy4zabTF0	Sağ oda aplik kapandığında butonu yeşil yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
hhCVLaExNFQXaFy4zabTF1	Sağ oda aplik açıldığında butonu sarı yap	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00
q1f6P6E7e9c4g2J8V4i1Q8	Sağ alt buton basıldığında Balkon toggle et	2024-10-28 16:17:03+00	2024-10-28 16:17:03+00
t7ZcuNvLhAWH5RAftNcT5E	Sağ üst buton basıldığında WC Spotları toggle et	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00
u7H9j3N2Y8b7V4h1R2i0Q9	Balkon kapatıldığında butonu yeşil yap	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00
vm7ccYghVuw6p5kHRReoqk	WC Spotları açıksa butonu sarı yap	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00
xA8bYZTcfBskwF3Re4HLDu	Duş Spotu açıkken Sol Üst butonu sarı yap	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00
zGmP1oE8rHdSLXAjBqVfKj	Sol üst buton basıldığında Duş Spotu toggle et	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00
\.


--
-- Data for Name: app_control_Conditions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_control_Conditions" (id, control_id, condition_id) FROM stdin;
67	2MfsUmmWvB6kTN7TEiJ2q6	qkmnmRjLZSez8A6MvQNS57
68	3cYc2mXKQd7VnHf9PqLrTs	9VtYp2LmQa4WzXc8BnHrKu
69	8QLLAbXqJSeANjqEF5cP3C	FMfGZwBRmUFL8gG6BAzTUS
70	D5HpNQRddBArYrFtZbaRva	YTvUqqbbAwugpuKa7Ny3QA
71	JSnZ7ApCvjMFf8XvdrYRAc	QezkGXCRZnDqtFsF9wNhbm
72	Rcyztwnr4ro4EcBhbcRXYa	zP7mbo3u7KZayRMLdteqYc
73	ThAMZCrDTLvvBeYa7zNSck	KTzSG9zoTqF3kMpxZEqSmq
74	XJ43UwMzzVPAvYULrbwt3K	QJq9R2NVhxNMS3T7XqCFnH
75	a0AAAaaxNFQXaFy4zabTA0	aa0f6aNaHtRaA2TYCAraa0
76	a0AVAaaxNFQXaFy4zabTA0	aa0f6aNaHtRaA2TYCNraa0
77	a0CVAaaxNFQXaFy4zabTA0	aa0f6aNaHtRaA2TYCNrqa0
78	b1BBBbbyOFQXaFy4zabTB0	bb1g7bObJtSaB3TYDBrbb0
79	b1BBBbbyOFQXaFy4zabTB1	bb1g7bObJtSaB3TYDBrbb2
80	e2I9k8T3Y7m6B5h2R8j1D0	x6W4h9N1L2g3Y5j8D6p7R8
81	exqncBgMCErP9JYzZcV8AL	Mn8XK7mZn7LuLjX9WjpJPn
82	h0AAAaAxNFQXaFy4zabAA0	aa0a6FNaHlRaA2TYCNraa0
83	h0AAAaExNFQXaFy4zabAA0	aa0a6FNaHlRaA2TYCNrqa0
84	h0AAAaExNFQXaFy4zabTA0	ha0a6FNaHlRaA2TYCNrqa0
85	h0AALaExNFQXaFy4zabTA0	ha0a6FNaHlRaA2TYCNrqz0
86	h0AVLaExNFQXaFy4zabTA0	ha0f6FNaHlRaA2TYCNrqz0
87	h0CVAaaxNFQXaFy4zabTA0	aa0f6aNaHtRaA2TYCNrqz0
88	h0CVAaaxNFQXaFy4zabTF0	ae0f6aNaHtRaA2TYCNrqz0
89	h0CVLaExNFQXaFy4zabTA0	he0f6FNaHlRaA2TYCNrqz0
90	h0CVLaExNFQXaFy4zabTF0	he0f6FNaHtRaA2TYCNrqz0
91	h0CVLaExNFQXaFy4zabTF1	he0f6FNaHtRaA2TYCNrqz1
92	h0CVLaaxNFQXaFy4zabTF0	he0f6aNaHtRaA2TYCNrqz0
93	h0aALaExNAQXaFy4zaaAA1	aa0a0FAaHtRaA2TYCNraz1
94	h0aVLaExNAQXaFy4zaaAA1	aa0a6FAaHtRaA2TYCNraz1
95	h0aVLaExNAQXaFy4zabAA1	aa0f6FAaHtRaA2TYCNraz1
96	h0aVLaExNFQXaFy4zabAA1	aa0f6FNaHtRaA2TYCNraz1
97	h0aVLaExNFQXaFy4zabTA1	ae0f6FNaHtRaA2TYCNraz1
98	h0aVLaExNFQXaFy4zabTF1	he0f6FNaHtRaA2TYCNraz1
99	h1BBBbBxOFQXaFy4zabBB1	bb1b7GObIlSaB3TYDNrbb1
100	h1DDDdDxOFQXaFy4zabDD1	dd1d7DObIlSaD3TYDNrdd1
101	h1GGGgGxOFQXaFy4zabGG1	gg1g7GObJtSaG3TYDGgg1
102	h1HHHhHxOFQXaFy4zabHH1	hh1h7HObJtSaH3TYDHhh1
103	h1IIIiIxOFQXaFy4zabII1	ii1i1IAcItSaI3TYCIrii3
104	h1JJJjJxOFQXaFy4zabJJ1	jj1j7JObJtSaJ3TYDJjj1
105	h1KKKkKxOFQXaFy4zabKK1	kk1k7KObJtSaK3TYDKkk1
106	h1LLLkKxOFQXaFy4zabLL1	ll1l1LAcItSaL3TYCLlll3
107	h1MMMmMxOFQXaFy4zabMM1	mm1m7MObJtSaM3TYDMmm1
108	h1MMMmxOFQXaFy4zabMM1	ma1m7MObJtSaM3TYDMmm1
109	h1NNNnNxOFQXaFy4zabNN1	nn1n7NObJtSaN3TYDNnn1
110	h1NNNnxOFQXaFy4zabNN1	nn1n7NObJtSaN3TYDNan1
111	h1OOOnxOFQXaFy4zabOO1	oo1o1OAcItSaO3TYCOooo3
112	h1OOOqOxOFQXaFy4zabOO1	oo1o1OAcItSaO3TYCOoo3
113	h1PPPlPxOFQXaFy4zabPP1	pp1p7PObJtSaP3TYDPpp1
114	h1PPPpxOFQXaFy4zabPP1	pa1p7PObJtSaP3TYDPpp1
115	h1QQQqQxOFQXaFy4zabQQ1	qq1q7QObJtSaQ3TYDQqq1
116	h1QQQqxOFQXaFy4zabQQ1	qa1q7QObJtSaQ3TYDQqq1
117	h1RRRrRxOFQXaFy4zabRR1	rr1r1RAcItSaR3TYCRrr3
118	h1RRRrxOFQXaFy4zabRR1	ra1r1RObItSaR3TYCRrr3
119	h1SSSxOFQXaFy4zabSS1	ss1s7SObJtSaS3TYDSss1
120	h1TTTxOFQXaFy4zabTT1	tt1t7TObJtSaT3TYDTtt1
121	h1UUUxOFQXaFy4zabUU1	uu1u1UAcItSaU3TYCUuu3
122	h1cCLcCxOFQXaFy4zabCC0	cc1c1HAcItSaC3TYCNrcc0
123	h1cCLcCxOFQXaFy4zabCC1	cc1c1HAcItSaC3TYCNrcc3
124	hhCVLaExNFQXWFx4zzbTF3	heff6FNWHtRaA2TYCNrqza
125	hhCVLaExNFQXWFx4zzbTF4	heff6FNWHtRaA2TYCNrqzb
126	hhCVLaExNFQXWFy4zabTF0	heff0FNWHtRaA2TYCNrqz0
127	hhCVLaExNFQXWFy4zabTF1	heff0FNWHtRaA2TYCNrqz1
128	hhCVLaExNFQXWFy4zabTF3	heff6FNWHtRaA2TYCNrqzd
129	hhCVLaExNFQXaFy4zabTF0	heff6FNaHtRaA2TYCNrqz0
130	hhCVLaExNFQXaFy4zabTF1	heff6FNaHtRaA2TYCNrqz1
131	q1f6P6E7e9c4g2J8V4i1Q8	r5K7h8L9J4t2A7n1B6v3Y5
132	t7ZcuNvLhAWH5RAftNcT5E	dYo6AKH6c9UjwMP7kbcwaz
133	u7H9j3N2Y8b7V4h1R2i0Q9	o1J3k4T8L5h6R7n9S8g2X4
134	vm7ccYghVuw6p5kHRReoqk	nzzVmnvFoRrxCbZkG9QeVq
135	xA8bYZTcfBskwF3Re4HLDu	LZShv3rBb9q3LyBMiEF9Cw
136	zGmP1oE8rHdSLXAjBqVfKj	3LYfnhdjYeTrNWRVMUzbeF
\.


--
-- Data for Name: app_control_Tasks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_control_Tasks" (id, control_id, task_id) FROM stdin;
67	2MfsUmmWvB6kTN7TEiJ2q6	hdoDZz9hWcN8gHCXqUdbTt
68	3cYc2mXKQd7VnHf9PqLrTs	kR5pLm2Qa8WsXn4VbTyHuJ
69	8QLLAbXqJSeANjqEF5cP3C	ZTJHoBYuPdTnHFY5GckAgM
70	D5HpNQRddBArYrFtZbaRva	SYU8pKKGXGoAEcVqzH8CnJ
71	JSnZ7ApCvjMFf8XvdrYRAc	tPKDnUkCyPpkoXZVXhvDfh
72	Rcyztwnr4ro4EcBhbcRXYa	uQKtbFGWWwLpVKkqCHoSC7
73	ThAMZCrDTLvvBeYa7zNSck	bqXGgrDrDJXAVzpF8JDxKP
74	XJ43UwMzzVPAvYULrbwt3K	nDDKnNk4kqgUuhqqUZGSrP
75	a0AAAaaxNFQXaFy4zabTA0	1aAaaE80KdkgAvwd7aA0vG
76	a0AVAaaxNFQXaFy4zabTA0	1aAaaE80KdkgAvwd7aT0vG
77	a0CVAaaxNFQXaFy4zabTA0	1vAaaE80KdkgAvwd7aT0vG
78	b1BBBbbyOFQXaFy4zabTB0	2bBbbF92KfhgBwxe8bV2wA
79	b1BBBbbyOFQXaFy4zabTB1	2bBbbF92KfhgBwxe8bV2wC
80	e2I9k8T3Y7m6B5h2R8j1D0	y4H8j7K6N1t3D2p4L9i0X5
81	exqncBgMCErP9JYzZcV8AL	4KkhctWkWcQLkNB4rLFnxF
82	h0AAAaAxNFQXaFy4zabAA0	1aAatE80LdkgAvwd7aT1vA
83	h0AAAaExNFQXaFy4zabAA0	1aAatE80LdkgAvwd7aT2vA
84	h0AAAaExNFQXaFy4zabTA0	1aAmtE80LdkgAvwd7aT2vA
85	h0AALaExNFQXaFy4zabTA0	1aAmtE80LdkgAvwd7aT2vG
86	h0AVLaExNFQXaFy4zabTA0	1vAmtE80LdkgAvwd7aT2vG
87	h0CVAaaxNFQXaFy4zabTA0	1vAaaE80KdkgAvwd7aT2vG
88	h0CVAaaxNFQXaFy4zabTF0	1vAatE80KdkgAvwd7aT2vG
89	h0CVLaExNFQXaFy4zabTA0	1vWmtE80LdkgAvwd7aT2vG
90	h0CVLaExNFQXaFy4zabTF0	1vWmtE80KdkgAvwd7aT2vG
91	h0CVLaExNFQXaFy4zabTF1	1vWmtE80KdkgAvwd7aT2vY
92	h0CVLaaxNFQXaFy4zabTF0	1vWatE80KdkgAvwd7aT2vG
93	h0aALaExNAQXaFy4zaaAA1	1aAaaE80KdkgAvwd7aT0vA
94	h0aVLaExNAQXaFy4zaaAA1	1aAaaE80KdkgAvwd7aT2vA
95	h0aVLaExNAQXaFy4zabAA1	1aAatE80KdkgAvwd7aT2vA
96	h0aVLaExNFQXaFy4zabAA1	1aAatE80KdkgAvwd7aT2vY
97	h0aVLaExNFQXaFy4zabTA1	1aWatE80KdkgAvwd7aT2vY
98	h0aVLaExNFQXaFy4zabTF1	1vWatE80KdkgAvwd7aT2vY
99	h1BBBbBxOFQXaFy4zabBB1	2bBbtF91MehgBwxe8bU2wB
100	h1DDDdDxOFQXaFy4zabDD1	2dDdtF91MehgDwxe8dU2wB
101	h1GGGgGxOFQXaFy4zabGG1	2gGgtF92KfhgGwxe8gV2wC
102	h1HHHhHxOFQXaFy4zabHH1	3hHhbF92KfhgHwxe8hV2wC
103	h1IIIiIxOFQXaFy4zabII1	3iIibF93LeigIwxe9iX3xC
104	h1JJJjJxOFQXaFy4zabJJ1	2jJjtF92KfhgJwxe8jV2wC
105	h1KKKkKxOFQXaFy4zabKK1	3kKkbF92KfhgKwxe8kV2wC
106	h1LLLkKxOFQXaFy4zabLL1	3lLlbF93LeigLwxe9lX3xC
107	h1MMMmMxOFQXaFy4zabMM1	2mMmtF92KfhgMwxe8mV2wC
108	h1MMMmxOFQXaFy4zabMM1	2mMmtF92KfhgMwxe8mV2aC
109	h1NNNnNxOFQXaFy4zabNN1	3nNnbF92KfhgNxwe8nV2wC
110	h1NNNnxOFQXaFy4zabNN1	3nNnbF92KfhgNwxe8nV2wC
111	h1OOOnxOFQXaFy4zabOO1	3oOobF93LeigOwxe9oX3aC
112	h1OOOqOxOFQXaFy4zabOO1	3oOobF93LeigOwxe9oX3xC
113	h1PPPlPxOFQXaFy4zabPP1	2pPptF92KfhgPwxe8pV2wC
114	h1PPPpxOFQXaFy4zabPP1	2pPptF92KfhgPwxe8pV2aC
115	h1QQQqQxOFQXaFy4zabQQ1	3qQqbF92KfhgQwxe8qV2wC
116	h1QQQqxOFQXaFy4zabQQ1	3qQqbF92KfhgQwxe8qV2aC
117	h1RRRrRxOFQXaFy4zabRR1	3rRrbF93LeigRwxe9rX3xC
118	h1RRRrxOFQXaFy4zabRR1	3rRrbF93LeigRwxe9rX3aC
119	h1SSSxOFQXaFy4zabSS1	2sSstF92KfhgSwxe8sV2wC
120	h1TTTxOFQXaFy4zabTT1	3tTtbF92KfhgTwxe8tV2wC
121	h1UUUxOFQXaFy4zabUU1	3uUubF93LeigUwxe9uX3xC
122	h1cCLcCxOFQXaFy4zabCC0	3cCcD93LeigBxwe9cX3aC
123	h1cCLcCxOFQXaFy4zabCC1	3cCcD93LeigBxwe9cX3xC
124	hhCVLaExNFQXWFx4zzbTF3	9vWmtE8HKdkgFvwd7aT2vY
125	hhCVLaExNFQXWFx4zzbTF4	9vWmtE8HKdkgFvwd7aT2vZ
126	hhCVLaExNFQXWFy4zabTF0	9vWmtE8HKdkgAvwd7aT2vX
127	hhCVLaExNFQXWFy4zabTF1	9vWmtE8HKdkgAvwd7aT2vY
128	hhCVLaExNFQXWFy4zabTF3	9vWmtE8HKdkgFvwd7aT2vX
129	hhCVLaExNFQXaFy4zabTF0	1vWmtE8HKdkgAvwd7aT2vG
130	hhCVLaExNFQXaFy4zabTF1	1vWmtE8HKdkgAvwd7aT2vY
131	q1f6P6E7e9c4g2J8V4i1Q8	t6W8r2D4V9m5F6q3J8s7Z1
132	t7ZcuNvLhAWH5RAftNcT5E	Ez3WbnrW9EDLpyN7kPq79r
133	u7H9j3N2Y8b7V4h1R2i0Q9	m9T3n2Q1J7p4S6k8H5g7Z2
134	vm7ccYghVuw6p5kHRReoqk	AjN6azGcSAV7Z5XJGZ6uEp
135	xA8bYZTcfBskwF3Re4HLDu	GpENZAfV4MQdAG9nvEoCBT
136	zGmP1oE8rHdSLXAjBqVfKj	7UupMcbfVKXuAeRhMdeZT6
\.


--
-- Data for Name: app_device; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_device ("Id", "Name", "CallClass", "Parameters", "CreatedOn", "ModifiedOn") FROM stdin;
4gGwrbuqfE6AdXc7CiCnD2	Sol Oda Role Modülü	MqttIOExtender	{"address": 32, "macAddress": "7C:9E:BD:61:7B:D0", "serverIp": "rabbitmq"}	2024-01-28 12:59:45.615+00	2024-01-28 13:02:06.34+00
6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar	Wallswitch	{"macAddress": "7C:9E:BD:61:2A:6C", "serverIp": "rabbitmq"}	2021-09-11 12:44:13.421+00	2024-06-09 11:32:12.917+00
CkjVUHSKyEYURLRLeaTNLt	Sağ Oda Role Modülü	MqttIOExtender	{"address": 36, "macAddress": "7C:9E:BD:62:5F:74", "serverIp": "rabbitmq"}	2022-01-29 14:25:30.496+00	2022-10-29 12:25:21.463+00
JRw4Qi2s9uxXxyufn64Pyt	Mutfak Role Modülü	MqttIOExtender	{"address": 32, "macAddress": "7C:9E:BD:61:8E:E4", "serverIp": "rabbitmq"}	2024-03-09 17:24:03.689+00	2024-05-26 10:23:16.587+00
JZfTDwhLETUm2FFGog8vXM	WC Anahtar	Wallswitch	{"macAddress": "24:6F:28:AA:30:70", "serverIp": "rabbitmq"}	2025-05-03 12:58:20.295+00	2025-05-03 12:59:13.814+00
MD2XgcDBtaUNPkonsbvMAm	Sol Oda Anahtar	Wallswitch	{"macAddress": "24:6F:28:AA:C5:50", "serverIp": "rabbitmq"}	2024-09-07 17:31:42.789+00	2025-05-03 10:59:37.429+00
SuTzfUbudm2F5eoVLTXjeC	Koridor Anahtar	Wallswitch	{"macAddress": "24:6F:28:AB:2D:C0", "serverIp": "rabbitmq"}	2024-06-09 11:32:23.682+00	2024-06-09 11:33:30.978+00
aYJbeTesvLmmYGK58LqwVB	Mutfak Anahtar	Wallswitch	{"macAddress": "24:6F:28:AA:24:F8", "serverIp": "rabbitmq"}	2024-09-07 08:01:42.578+00	2024-09-07 08:03:05.41+00
hxwiQ3jqsh2vro4LWfcEKt	Sağ Oda Role Modülü 2	MqttIOExtender	{"address": 32, "macAddress": "7C:9E:BD:62:5F:74", "serverIp": "rabbitmq"}	2022-10-29 12:22:20.031+00	2022-10-29 12:25:06.099+00
kvKoYzhhXdBqwXjn9exYpZ	Banyo Role Modülü	MqttIOExtender	{"address": 36, "macAddress": "24:6F:28:AB:25:8C", "serverIp": "rabbitmq"}	2023-04-21 11:38:04.715+00	2023-04-21 12:28:07.853+00
nvP7bj8JXNruauRk3fgGV7	Orta Anahtar	Wallswitch	{"macAddress": "94:B9:7E:E5:A4:94", "serverIp": "rabbitmq"}	2024-06-22 09:53:06.894+00	2024-06-22 09:53:41.565+00
\.


--
-- Data for Name: app_device_Functions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_device_Functions" (id, device_id, function_id) FROM stdin;
211	4gGwrbuqfE6AdXc7CiCnD2	3DzqNp3eFPXoapqga5PZ3X
212	4gGwrbuqfE6AdXc7CiCnD2	BaHmcirSeGfTfH2SpUQwHa
213	4gGwrbuqfE6AdXc7CiCnD2	fLxVat4MRmo4hQgtxjrMnn
214	4gGwrbuqfE6AdXc7CiCnD2	VxdVdvdSY5KeW2KYCJCuG4
215	4gGwrbuqfE6AdXc7CiCnD2	hyvRVfECNJ6sBsiXLzW9Ry
216	4gGwrbuqfE6AdXc7CiCnD2	jh7Jpn5TJVwfzm2ghLyfbB
217	4gGwrbuqfE6AdXc7CiCnD2	Jcfok6uVHGUWDVLdJrL6Py
218	4gGwrbuqfE6AdXc7CiCnD2	QMrR9V2WLkeKuYFWEygeiG
219	6cbocJr7iouWjU4Azd5BHC	2QZZu94xjfdFgray9AXD2g
220	6cbocJr7iouWjU4Azd5BHC	fXg6aAqPP7ARTfGoTMScBq
221	6cbocJr7iouWjU4Azd5BHC	SkwoWsZesuSTtLv9MeoafA
222	6cbocJr7iouWjU4Azd5BHC	6Fjc5Rnh7s96pJC3xtKm9T
223	6cbocJr7iouWjU4Azd5BHC	6cbocJr7iouWjU4Azd5BHC
224	CkjVUHSKyEYURLRLeaTNLt	eMwaymiwRf9jfdwANQw7Fa
225	CkjVUHSKyEYURLRLeaTNLt	fmasiRp4RtyUJnjJwmLtVm
226	CkjVUHSKyEYURLRLeaTNLt	96ADvNyK3N5iscyB9kE6n3
227	CkjVUHSKyEYURLRLeaTNLt	P6VibzQnTgJakkyUXxmA6B
228	CkjVUHSKyEYURLRLeaTNLt	cLehXLjF6c5nBk5NcTfKp2
229	CkjVUHSKyEYURLRLeaTNLt	hcsdM4kdKsp734xJiWPgaj
230	CkjVUHSKyEYURLRLeaTNLt	UGarAHicdeXxGPSsVHzXSB
231	CkjVUHSKyEYURLRLeaTNLt	NbcexxzsjoSTDZH5ujHqHi
232	JRw4Qi2s9uxXxyufn64Pyt	4AvggwBj3UgG6HDHjAzHea
233	JRw4Qi2s9uxXxyufn64Pyt	iBTVPBdyUzze2y2HA4EBD2
234	JRw4Qi2s9uxXxyufn64Pyt	diQrNYEPEkAwrQVCqGGHsy
235	JRw4Qi2s9uxXxyufn64Pyt	F9raEnr6y9MKEzthLUByg7
236	JRw4Qi2s9uxXxyufn64Pyt	nnEtTgu5KZNuH9oWcPutwx
237	JRw4Qi2s9uxXxyufn64Pyt	5fdCfQzFYs6VHdjyii7K7Q
238	JRw4Qi2s9uxXxyufn64Pyt	7e6MXZLZkj432GXxyuW7zs
239	JRw4Qi2s9uxXxyufn64Pyt	LJRtiXGL2ts6cch39enCqK
240	JZfTDwhLETUm2FFGog8vXM	MvxsmnzaoxAigaeXsYnXyq
241	JZfTDwhLETUm2FFGog8vXM	Fdgsc2JciExfFT3xhtAKAS
242	JZfTDwhLETUm2FFGog8vXM	NvTMHwifoWuAK2g2oJV9Js
243	JZfTDwhLETUm2FFGog8vXM	KkyUy4mFmDW3E8jXRQ4w9k
244	JZfTDwhLETUm2FFGog8vXM	5uraqHEvZQkDXAtABgyZgV
245	MD2XgcDBtaUNPkonsbvMAm	MD2XgcDBtaUNPkonsbvMAm
246	MD2XgcDBtaUNPkonsbvMAm	XBbCz7era7Qxn23NKeqyrc
247	MD2XgcDBtaUNPkonsbvMAm	TipArFDsJtEv7ggYsrKP2b
248	MD2XgcDBtaUNPkonsbvMAm	ZozuCBD4dHugMof9ZjZ8EN
249	MD2XgcDBtaUNPkonsbvMAm	gcGWrB7WsbQrNnRotCxt7e
250	SuTzfUbudm2F5eoVLTXjeC	SuTzfUbudm2F5eoVLTXjeC
251	SuTzfUbudm2F5eoVLTXjeC	Y8oHuoTsCrYkWQvu97kG4Q
252	SuTzfUbudm2F5eoVLTXjeC	BD6nUt6hTUkibjfRGtjW5V
253	SuTzfUbudm2F5eoVLTXjeC	8s7e8yt3kZvNjDRFCuNpLr
254	SuTzfUbudm2F5eoVLTXjeC	YQFhWvb8sz6HzGTPqoBhXq
255	aYJbeTesvLmmYGK58LqwVB	GXFbYx2GhDLufgegTkiNP4
256	aYJbeTesvLmmYGK58LqwVB	RDA7N6HT9FugeimPG7ekPe
257	aYJbeTesvLmmYGK58LqwVB	aYJbeTesvLmmYGK58LqwVB
258	aYJbeTesvLmmYGK58LqwVB	VSKL9fVNAnbzfYUJ36BpEb
259	aYJbeTesvLmmYGK58LqwVB	W4YHYdM5KgqFjWLw4LBZbY
260	hxwiQ3jqsh2vro4LWfcEKt	5DzaUGb4Ew3HCpBjydWohd
261	hxwiQ3jqsh2vro4LWfcEKt	cW2nNNni4m6A8YSDUo8YDZ
262	hxwiQ3jqsh2vro4LWfcEKt	HEkRTqB55ZGWCGfWL4ce3s
263	hxwiQ3jqsh2vro4LWfcEKt	fezbefJx9eMztCZcLMQZd5
264	hxwiQ3jqsh2vro4LWfcEKt	6wj7HvGD7kxCunpXwxVpkA
265	hxwiQ3jqsh2vro4LWfcEKt	CsBaf6aFn43mnXW77j443H
266	hxwiQ3jqsh2vro4LWfcEKt	im227swf2fhq9dtdbbf7x7
267	hxwiQ3jqsh2vro4LWfcEKt	UckoTUrzSe4abixVxRPHtV
268	kvKoYzhhXdBqwXjn9exYpZ	F7WWFnYyHX7kapUyT9AyHi
269	kvKoYzhhXdBqwXjn9exYpZ	bYRkfWLzakFR7AYWMjXHTz
270	kvKoYzhhXdBqwXjn9exYpZ	4VDS458diBtjJPNYjgo9HK
271	kvKoYzhhXdBqwXjn9exYpZ	ShAvBhTbqEdngqkvdpX6LW
272	kvKoYzhhXdBqwXjn9exYpZ	6WuSnMNvVrhbK7Z9npLirD
273	kvKoYzhhXdBqwXjn9exYpZ	2bi8ekiMtJUBEtdXhpa2X4
274	kvKoYzhhXdBqwXjn9exYpZ	aR7vELeUuAAwawWjkH3zbw
275	kvKoYzhhXdBqwXjn9exYpZ	eo6jrZDCJa6MVtit4PMn4X
276	nvP7bj8JXNruauRk3fgGV7	9MBG7u5arjXsZVzJzMTpWj
277	nvP7bj8JXNruauRk3fgGV7	h4btktvGqKbWWspfDdBLWM
278	nvP7bj8JXNruauRk3fgGV7	RqyvEDHwVs6AmTq6fd2csN
279	nvP7bj8JXNruauRk3fgGV7	bYGtWrwsJt9fkNH38pAF3E
280	nvP7bj8JXNruauRk3fgGV7	nvP7bj8JXNruauRk3fgGV7
\.


--
-- Data for Name: app_function; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_function ("Id", "Name", "CreatedOn", "ModifiedOn") FROM stdin;
2QZZu94xjfdFgray9AXD2g	Sol Üst Anahtar	2021-09-11 12:44:13.442+00	2021-09-11 12:44:13.442+00
2bi8ekiMtJUBEtdXhpa2X4	Duş Spotu	2023-04-21 11:38:07.112+00	2023-04-21 11:38:07.112+00
3DzqNp3eFPXoapqga5PZ3X	Sol Oda Aplik	2024-01-28 13:00:00.749+00	2024-01-28 13:00:00.749+00
3r73TyyWFhVA77s2z5jwEk	Role 4	2019-10-29 11:25:34.068+00	2019-10-29 11:25:34.068+00
4AvggwBj3UgG6HDHjAzHea	Sarkıtlar	2024-03-09 17:24:03.784+00	2024-03-09 17:24:03.784+00
4VDS458diBtjJPNYjgo9HK	Duş Havuz	2023-04-21 11:38:09.334+00	2023-04-21 12:29:41.02+00
4yH3STA9jF9AnGN79GdPK5	Role 5	2019-10-29 11:25:34.972+00	2019-10-29 11:25:34.972+00
5DzaUGb4Ew3HCpBjydWohd	Koridor Havuz	2022-10-29 12:22:20.096+00	2022-10-29 12:22:20.096+00
5fdCfQzFYs6VHdjyii7K7Q	Aspiratör	2024-03-09 17:24:06.023+00	2024-03-09 17:24:06.023+00
5uraqHEvZQkDXAtABgyZgV	Sağ Üst Anahtar 	2025-05-03 12:58:20.399+00	2025-05-03 12:58:20.399+00
5whtxb2XV4EbKZJwdCDHtA	Role 3	2020-03-01 13:00:46.766+00	2020-03-01 13:00:46.766+00
6Fjc5Rnh7s96pJC3xtKm9T	Sağ Üst Anahtar	2021-09-11 12:44:13.506+00	2021-09-11 12:44:13.506+00
6WuSnMNvVrhbK7Z9npLirD	Klozet Spot	2023-04-21 11:38:13.323+00	2023-04-21 11:38:13.323+00
6cbocJr7iouWjU4Azd5BHC	Termometre	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00
6wj7HvGD7kxCunpXwxVpkA	Role 7	2022-10-29 12:22:20.161+00	2022-10-29 12:22:20.161+00
7e6MXZLZkj432GXxyuW7zs	Mutfak Spot	2024-03-09 17:24:04.982+00	2024-03-09 17:24:04.982+00
7wAxPJAidwKnfBFFqn9VYJ	Role 6	2020-03-01 12:23:05.263+00	2020-03-01 12:23:05.263+00
8LxtK5Deujr6a5TLctodQr	Role 2	2024-03-09 09:18:19.353+00	2024-03-09 09:18:19.353+00
8pPeZ7UV4UN24JsDjyFwNb	Role 4	2020-03-01 12:22:37.833+00	2020-03-01 12:22:37.833+00
8s7e8yt3kZvNjDRFCuNpLr	Sol Alt Anahtar	2024-06-09 11:32:23.776+00	2024-06-09 11:32:23.776+00
96ADvNyK3N5iscyB9kE6n3	Orta Oda Sağ Aplik	2022-01-29 14:25:30.64+00	2022-01-29 14:25:30.64+00
9MBG7u5arjXsZVzJzMTpWj	Sağ Alt Anahtar 	2024-06-22 09:53:07.042+00	2024-06-22 09:53:07.042+00
9U44xuSyjRjPK43dAmQw3b	Role 6	2020-03-01 13:01:28.694+00	2020-03-01 13:01:28.694+00
BD6nUt6hTUkibjfRGtjW5V	Sol Üst Anahtar	2024-06-09 11:32:23.693+00	2024-06-09 11:32:23.693+00
BaHmcirSeGfTfH2SpUQwHa	Sol Oda Kenarlar	2024-01-28 12:59:50.229+00	2024-01-28 12:59:50.229+00
CsBaf6aFn43mnXW77j443H	Orta Oda Köşeler	2022-10-29 12:22:20.034+00	2022-10-29 12:22:20.034+00
DFh7jWaXofhGpYrysqVkQu	Role 3	2024-03-09 09:18:20.442+00	2024-03-09 09:18:20.442+00
EbF8WnALHpQGcQugF62ii9	Role 5	2024-03-09 09:18:23.266+00	2024-03-09 09:18:23.266+00
F4gr6FhmCGGx3xw8CyM4K3	Role 7	2020-03-01 12:23:19.202+00	2020-03-01 12:23:19.202+00
F7WWFnYyHX7kapUyT9AyHi	WC Spotları	2023-04-21 11:38:04.826+00	2023-04-21 11:38:04.826+00
F9raEnr6y9MKEzthLUByg7	Role 7	2024-03-09 17:24:11.742+00	2024-03-09 17:24:11.742+00
FTz6TcfoAKbYnDEs4b6gfY	Role 3	2020-03-01 16:25:22.072+00	2020-03-01 16:25:22.072+00
Fdgsc2JciExfFT3xhtAKAS	Sol Alt Anahtar 	2025-05-03 12:58:20.445+00	2025-05-03 12:58:20.445+00
GDkXshc6rN2pNSwVY9wofS	Role 6	2020-03-01 16:25:42.612+00	2020-03-01 16:25:42.612+00
GMQtgXWn2n7hiWpv52Xujh	Role 6	2019-10-29 11:25:35.886+00	2019-10-29 11:25:35.886+00
GXFbYx2GhDLufgegTkiNP4	Sağ Alt Anahtar 	2024-09-07 08:01:42.708+00	2024-09-07 08:01:42.708+00
GhoyWwMokSmF23KTJPGMNm	Role 2	2020-03-01 12:22:03.358+00	2020-03-01 12:22:03.358+00
GrbW8aXy7zUjXSLNdTGtsZ	Role 2	2020-03-01 13:00:27.927+00	2020-03-01 13:00:27.927+00
HEkRTqB55ZGWCGfWL4ce3s	Orta Oda Havuz	2022-10-29 12:22:20.071+00	2022-10-29 12:22:20.071+00
Jcfok6uVHGUWDVLdJrL6Py	Orta Oda Sol Aplik	2024-01-28 12:59:57.826+00	2024-01-28 12:59:57.826+00
KkyUy4mFmDW3E8jXRQ4w9k	Sağ Alt Anahtar 	2025-05-03 12:58:20.49+00	2025-05-03 12:58:20.49+00
LHAziu2nW8rsMKoQt8aKfh	Role 5	2020-03-01 16:25:39.599+00	2020-03-01 16:25:39.599+00
LJRtiXGL2ts6cch39enCqK	Role 6	2024-03-09 17:24:10.06+00	2024-03-09 17:24:10.061+00
MD2XgcDBtaUNPkonsbvMAm	Termometre	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00
MvxsmnzaoxAigaeXsYnXyq	Termometre	2025-05-03 12:58:20.535+00	2025-05-03 12:58:20.535+00
NWi7mrpKMY32rHeMaMYqN6	Role 7	2020-03-01 13:01:44.933+00	2020-03-01 13:01:44.933+00
NbcexxzsjoSTDZH5ujHqHi	Koridor Kenarlar	2022-01-29 14:25:31.253+00	2022-01-29 14:25:31.253+00
NvTMHwifoWuAK2g2oJV9Js	Sol Üst Anahtar 	2025-05-03 12:58:20.307+00	2025-05-03 12:58:20.307+00
P6VibzQnTgJakkyUXxmA6B	Koridor Aplik	2022-01-29 14:25:31.005+00	2022-01-29 14:25:31.005+00
QMrR9V2WLkeKuYFWEygeiG	Sol Oda Havuz	2024-01-28 12:59:55.641+00	2024-01-28 12:59:55.641+00
RDA7N6HT9FugeimPG7ekPe	Sağ Üst Anahtar 	2024-09-07 08:01:42.635+00	2024-09-07 08:01:42.635+00
RqyvEDHwVs6AmTq6fd2csN	Sol Üst Anahtar 	2024-06-22 09:53:06.904+00	2024-06-22 09:53:06.904+00
ShAvBhTbqEdngqkvdpX6LW	Role 7	2023-04-21 11:38:12.031+00	2023-04-21 11:38:12.031+00
SkwoWsZesuSTtLv9MeoafA	Sol Alt Anahtar	2021-09-11 12:44:13.567+00	2021-09-11 12:44:13.567+00
SuTzfUbudm2F5eoVLTXjeC	Termometre	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00
T6up72TRk678qKXJz2WvJ4	Role 2	2019-10-29 11:25:31.768+00	2019-10-29 11:25:31.768+00
TipArFDsJtEv7ggYsrKP2b	Sağ Üst Anahtar 	2024-09-07 17:31:42.853+00	2024-09-07 17:31:42.853+00
TxTpapmGjbekKR5vwADhkC	Role 8	2020-03-01 16:25:53.983+00	2020-03-01 16:25:53.983+00
UGarAHicdeXxGPSsVHzXSB	Sağ Oda Spot	2022-01-29 14:25:30.515+00	2022-01-29 14:25:30.515+00
UckoTUrzSe4abixVxRPHtV	Role 6	2022-10-29 12:22:20.148+00	2022-10-29 12:22:20.148+00
UuHgNnQFcuUoqE2SrGfNpL	Role 7	2020-03-01 16:25:51.376+00	2020-03-01 16:25:51.377+00
VSKL9fVNAnbzfYUJ36BpEb	Sol Üst Anahtar 	2024-09-07 08:01:42.589+00	2024-09-07 08:01:42.589+00
VZ5fFaAKgUUJm25d3s5Hrj	Role 3	2020-03-01 12:22:18.97+00	2020-03-01 12:22:18.97+00
VxdVdvdSY5KeW2KYCJCuG4	Role 2	2024-01-28 12:59:47.201+00	2024-01-28 12:59:47.201+00
W4YHYdM5KgqFjWLw4LBZbY	Sol Alt Anahtar 	2024-09-07 08:01:42.671+00	2024-09-07 08:01:42.671+00
XBbCz7era7Qxn23NKeqyrc	Sağ Alt Anahtar 	2024-09-07 17:31:42.955+00	2024-09-07 17:31:42.955+00
XVuufWqzeNHXRTzcy46xV7	Role 1	2020-03-01 12:21:52.883+00	2020-03-01 12:21:52.883+00
Y8oHuoTsCrYkWQvu97kG4Q	Sağ Alt Anahtar	2024-06-09 11:32:23.823+00	2024-06-09 11:32:23.823+00
YFNp7UrLmdMWvnNygfBmsT	Role 4	2024-03-09 09:18:21.809+00	2024-03-09 09:18:21.809+00
YQFhWvb8sz6HzGTPqoBhXq	Sağ Üst Anahtar	2024-06-09 11:32:23.735+00	2024-06-09 11:32:23.735+00
YXZrLNriYJ4y22P5J9rUv8	Role 7	2019-10-29 11:25:36.772+00	2019-10-29 11:25:36.772+00
ZozuCBD4dHugMof9ZjZ8EN	Sol Alt Anahtar 	2024-09-07 17:31:42.905+00	2024-09-07 17:31:42.905+00
aR7vELeUuAAwawWjkH3zbw	WC Havuz	2023-04-21 11:38:08.343+00	2023-04-21 11:38:08.343+00
aYJbeTesvLmmYGK58LqwVB	Termometre	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00
bYGtWrwsJt9fkNH38pAF3E	Sol Alt Anahtar 	2024-06-22 09:53:06.992+00	2024-06-22 09:53:06.992+00
bYRkfWLzakFR7AYWMjXHTz	Role 2	2023-04-21 11:38:05.904+00	2023-04-21 11:38:05.904+00
cLehXLjF6c5nBk5NcTfKp2	Sağ Oda Aplik	2022-01-29 14:25:30.763+00	2022-01-29 14:25:30.763+00
cW2nNNni4m6A8YSDUo8YDZ	Role 8	2022-10-29 12:22:20.176+00	2022-10-29 12:22:20.176+00
diQrNYEPEkAwrQVCqGGHsy	Role 5	2024-03-09 17:24:08.92+00	2024-03-09 17:24:08.92+00
eMwaymiwRf9jfdwANQw7Fa	Role 4	2022-01-29 14:25:30.886+00	2022-01-29 14:25:30.886+00
efEdTW6xhF8irdWJqRiSUE	Role 6	2024-03-09 09:18:24.265+00	2024-03-09 09:18:24.265+00
eo6jrZDCJa6MVtit4PMn4X	Balkon	2023-04-21 11:38:10.465+00	2023-04-21 11:38:10.465+00
fLxVat4MRmo4hQgtxjrMnn	Mutfak Havuz	2024-01-28 12:59:52.953+00	2024-01-28 12:59:52.953+00
fWCwgfxNk8gWzkpiWeXAzB	Role 8	2020-03-01 12:23:34.995+00	2020-03-01 12:23:34.995+00
fXg6aAqPP7ARTfGoTMScBq	Sağ Alt Anahtar	2021-09-11 12:44:13.627+00	2021-09-11 12:44:13.627+00
fezbefJx9eMztCZcLMQZd5	Role 5	2022-10-29 12:22:20.134+00	2022-10-29 12:22:20.134+00
fmasiRp4RtyUJnjJwmLtVm	Koridor Uçlar	2022-01-29 14:25:31.133+00	2022-01-29 14:25:31.133+00
gcGWrB7WsbQrNnRotCxt7e	Sol Üst Anahtar 	2024-09-07 17:31:42.798+00	2024-09-07 17:31:42.798+00
h4btktvGqKbWWspfDdBLWM	Sağ Üst Anahtar 	2024-06-22 09:53:06.951+00	2024-06-22 09:53:06.952+00
hcsdM4kdKsp734xJiWPgaj	Orta Oda Kenarlar	2022-01-29 14:25:31.371+00	2022-01-29 14:25:31.371+00
hyvRVfECNJ6sBsiXLzW9Ry	Sol Oda Köşeler	2024-01-28 12:59:48.393+00	2024-01-28 12:59:48.393+00
iBTVPBdyUzze2y2HA4EBD2	Role 8	2024-03-09 17:24:12.99+00	2024-03-09 17:24:12.99+00
ibpCSifxfGFGKiqdnQJQsf	Role 5	2020-03-01 13:01:21.444+00	2020-03-01 13:01:21.444+00
im227swf2fhq9dtdbbf7x7	Sağ Oda Havuz	2022-10-29 12:22:20.116+00	2022-10-29 12:22:20.116+00
jacMMNHA7sPzoC7bJZBmbS	Role 8	2024-03-09 09:18:26.52+00	2024-03-09 09:18:26.52+00
jh7Jpn5TJVwfzm2ghLyfbB	Role 1	2024-01-28 12:59:45.785+00	2024-01-28 12:59:45.785+00
khAac3NzjtFrGXSDk4faRu	Role 7	2024-03-09 09:18:25.512+00	2024-03-09 09:18:25.512+00
m5tWsnXxGfKYSLutQDGNvL	Role 3	2019-10-29 11:25:32.661+00	2019-10-29 11:25:32.661+00
mWPHYKAX9zS5J3cToDACD5	Role 2	2020-03-01 16:25:17.469+00	2020-03-01 16:25:17.469+00
n96uRgTF3MZQWRR5sAgHoy	Role 1	2024-03-09 09:18:18.4+00	2024-03-09 09:18:18.4+00
nnEtTgu5KZNuH9oWcPutwx	Mutfak Tezgah	2024-03-09 17:24:07.679+00	2024-03-09 17:24:07.679+00
nvP7bj8JXNruauRk3fgGV7	Termometre	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00
ny5Xf9UEZhh4qKnk9tTEwL	Role 1	2020-03-01 16:25:13.421+00	2020-03-01 16:25:13.421+00
p2jFaoAZmoDtnSGfLfMBS4	Role 4	2020-03-01 13:01:04.567+00	2020-03-01 13:01:04.567+00
srHmwMqUPVmV3BNtJ3bwJW	Role 4	2020-03-01 16:25:31.76+00	2020-03-01 16:25:31.76+00
t9KqCXv74XyvaoAo6JMb28	Role 1	2020-03-01 13:00:16.221+00	2020-03-01 13:00:16.221+00
vPD3tEmCDDDsosfhxfebqH	Role 8	2020-03-01 13:01:55.381+00	2020-03-01 13:01:55.381+00
wjszETrADEPBh5fWqC5dD9	Role 8	2019-10-29 11:25:40.507+00	2019-10-29 11:25:40.508+00
xXRN2qG2BRqLSTLL6YFpp2	Role 5	2020-03-01 12:22:48.949+00	2020-03-01 12:22:48.949+00
y6PVinb9a7xv8jr58Zy5b3	Role 1	2019-10-29 11:25:28.615+00	2019-10-29 11:25:28.615+00
\.


--
-- Data for Name: app_function_Properties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_function_Properties" (id, function_id, property_id) FROM stdin;
1123	2QZZu94xjfdFgray9AXD2g	UvE4xmwkvPSXKtcbaJKT24
1124	2QZZu94xjfdFgray9AXD2g	DbjZwZB2afmvXZryYbAc6f
1125	2bi8ekiMtJUBEtdXhpa2X4	gDRLJ6BKU8riqdbAPCAdbi
1126	2bi8ekiMtJUBEtdXhpa2X4	8oCxHsJKVdRrLLXYUneatG
1127	2bi8ekiMtJUBEtdXhpa2X4	LRnWZvwc7EhTdqQ5ybdEJC
1128	2bi8ekiMtJUBEtdXhpa2X4	LiN5mQSQsS85EfepeSKVGR
1129	3DzqNp3eFPXoapqga5PZ3X	KVu64mETAgFgRFXX8wAgjd
1130	3DzqNp3eFPXoapqga5PZ3X	CvRct2M83k8sX9uFoPsYjM
1131	3DzqNp3eFPXoapqga5PZ3X	aBdiMi8F8fcgfqCXCpK3Fy
1132	3DzqNp3eFPXoapqga5PZ3X	cyQ9LdusdZDY7jAC5wp2ki
1133	3r73TyyWFhVA77s2z5jwEk	JGSFESpP5AmeRYLrgwANyi
1134	3r73TyyWFhVA77s2z5jwEk	2jbnknpcavGDKmnWjHXQbn
1135	3r73TyyWFhVA77s2z5jwEk	pNjoRhuHWZa7W3KTB8Liwh
1136	3r73TyyWFhVA77s2z5jwEk	75JuHjjVULpJ6j8q3FG3aN
1137	4AvggwBj3UgG6HDHjAzHea	DbwYyXZT9xHrfp4z7sSAeP
1138	4AvggwBj3UgG6HDHjAzHea	F76voSsqoX9wWiJijopH6g
1139	4AvggwBj3UgG6HDHjAzHea	2Uu45zbqa4YTTqJpsfeJwq
1140	4AvggwBj3UgG6HDHjAzHea	GGrzLN8usQJ8LeGz7zDucz
1141	4VDS458diBtjJPNYjgo9HK	jU7fCMrexhhRStGdnuhtcN
1142	4VDS458diBtjJPNYjgo9HK	TmnCKLwrsxvSAXiL5DuWjm
1143	4VDS458diBtjJPNYjgo9HK	2tAzCuvkyciSdWrWvAwtkH
1144	4VDS458diBtjJPNYjgo9HK	KbeVAF7RmJSfqBAeRN66tR
1145	4yH3STA9jF9AnGN79GdPK5	hQgxeUG2SiRBm6rcnX5XXJ
1146	4yH3STA9jF9AnGN79GdPK5	zUVTWSBorzfowRmSetqR3W
1147	4yH3STA9jF9AnGN79GdPK5	Cq6iSAQzuQ5ph3A7JRKYcJ
1148	4yH3STA9jF9AnGN79GdPK5	2sFZ82rvA3WLymgtEsj66M
1149	5DzaUGb4Ew3HCpBjydWohd	CC3vB4N4NHp46aPc9MYy8o
1150	5DzaUGb4Ew3HCpBjydWohd	R78r5nsUDmNYn3f7qNCTXS
1151	5DzaUGb4Ew3HCpBjydWohd	FmZgQyPVpudBA2vBZLHZE2
1152	5DzaUGb4Ew3HCpBjydWohd	fzdvC79J6SgvgGkMwMMgif
1153	5fdCfQzFYs6VHdjyii7K7Q	QogfFao5mE5mNAgu2bKk2o
1154	5fdCfQzFYs6VHdjyii7K7Q	dEcQMGhLQWzSkbMLUb6DCa
1155	5fdCfQzFYs6VHdjyii7K7Q	9DYyGvEhdbTJYZZSKvPfo6
1156	5fdCfQzFYs6VHdjyii7K7Q	cXpR4tYqpvRqKwVCc2eya5
1157	5uraqHEvZQkDXAtABgyZgV	RKZxMMp6o9LT9WY46TyFbK
1158	5uraqHEvZQkDXAtABgyZgV	n4MKBGvk8khHLTRJU3BrpG
1159	5whtxb2XV4EbKZJwdCDHtA	qsydbS5rEtfpjDXikinodN
1160	5whtxb2XV4EbKZJwdCDHtA	B8yrDxpQ5gmiVeVCGvvEa6
1161	5whtxb2XV4EbKZJwdCDHtA	LzEby7h2FpSCmrpQLDc7NS
1162	5whtxb2XV4EbKZJwdCDHtA	DQSmQ4tsknB6rwQ2W9aLjZ
1163	6Fjc5Rnh7s96pJC3xtKm9T	ZUHmH4eiDM9YgtDYDPGdmy
1164	6Fjc5Rnh7s96pJC3xtKm9T	EJmzsYNwdbHf2hpZtcJq9z
1165	6WuSnMNvVrhbK7Z9npLirD	QTGVXtB4HD5MX3Y7kJXk5V
1166	6WuSnMNvVrhbK7Z9npLirD	JZfWAk3kRGHYgF8wpC2n3U
1167	6WuSnMNvVrhbK7Z9npLirD	o2yo77z3LXtzYgZ5uM7vNM
1168	6WuSnMNvVrhbK7Z9npLirD	H5584ySuh5FJWDJy3CEzs5
1169	6cbocJr7iouWjU4Azd5BHC	60bocJr7iouWjU4Azd5BHC
1170	6wj7HvGD7kxCunpXwxVpkA	CT7o4ts6utbQhmLDUnGCp4
1171	6wj7HvGD7kxCunpXwxVpkA	LV7Lfx64mm5mBJPVnR8tPL
1172	6wj7HvGD7kxCunpXwxVpkA	4kiJs8ug4PyCzeSgrxXRb5
1173	6wj7HvGD7kxCunpXwxVpkA	444mAasxzeSJorj45vrvi9
1174	7e6MXZLZkj432GXxyuW7zs	52nodgPLPHSifHL7QNdRYt
1175	7e6MXZLZkj432GXxyuW7zs	PdWGrXzBZHBLehTLF5HP5G
1176	7e6MXZLZkj432GXxyuW7zs	EyPwxhMTsFLUEmugNaFuZ3
1177	7e6MXZLZkj432GXxyuW7zs	7NgbFe2TygwKRYKBgHCvvY
1178	7wAxPJAidwKnfBFFqn9VYJ	EdYcAAyLfWdBtz9t8MU9fg
1179	7wAxPJAidwKnfBFFqn9VYJ	w2Kuu4uUDDEotbA3wcsi2M
1180	7wAxPJAidwKnfBFFqn9VYJ	FGaWpSWBQHBAf72Wtvb3WK
1181	7wAxPJAidwKnfBFFqn9VYJ	5y97N58p5iXLm3NZy73pJK
1182	8LxtK5Deujr6a5TLctodQr	YAzYws2ZrLAen8kKehkA2f
1183	8LxtK5Deujr6a5TLctodQr	KnhSvcaUbrHBYwusT9JLbA
1184	8LxtK5Deujr6a5TLctodQr	jpjc5fQxFAzUwUETrL7S8s
1185	8LxtK5Deujr6a5TLctodQr	naYN4XV5f57wKQEATokoAd
1186	8pPeZ7UV4UN24JsDjyFwNb	5hA2CXMDENAKeX7EKZy3kY
1187	8pPeZ7UV4UN24JsDjyFwNb	tcHgWgmu84xTUvVYTa8VnV
1188	8pPeZ7UV4UN24JsDjyFwNb	daTGTz8guoDhAHV24oReBX
1189	8pPeZ7UV4UN24JsDjyFwNb	VhpChmQytH3taer3mMrmHK
1190	8s7e8yt3kZvNjDRFCuNpLr	aoeKQgrj6HqpeddwHyxrf2
1191	8s7e8yt3kZvNjDRFCuNpLr	Pj6QQSQTaeJoMdFyKHgkbe
1192	96ADvNyK3N5iscyB9kE6n3	e4828jpp2WxEJion7VFzen
1193	96ADvNyK3N5iscyB9kE6n3	hrJ5yba6Dqq5odyHUo4H2B
1194	96ADvNyK3N5iscyB9kE6n3	Mu32D4DnSaeaKUktePqp77
1195	96ADvNyK3N5iscyB9kE6n3	a4FwyGD7Ybd9GyGTbBucLN
1196	9MBG7u5arjXsZVzJzMTpWj	oTYrAoR9vMEBGV3o9B9Nph
1197	9MBG7u5arjXsZVzJzMTpWj	QH9MauWDhx4YChu8m8qDNC
1198	9U44xuSyjRjPK43dAmQw3b	wACM4uTZUdgQ4wmzGp8fYP
1199	9U44xuSyjRjPK43dAmQw3b	f4tUGGbv2LEmxXsdkTRmz7
1200	9U44xuSyjRjPK43dAmQw3b	GUAVQqPWY7YtKeMLvSoQq2
1201	9U44xuSyjRjPK43dAmQw3b	Sv3NZCu3gtDhEdZHn9YkCD
1202	BD6nUt6hTUkibjfRGtjW5V	CJnRPy22kigToquEoMuF3a
1203	BD6nUt6hTUkibjfRGtjW5V	38iT3w9R3HUuZbNrveSi2a
1204	BaHmcirSeGfTfH2SpUQwHa	2bHNCivTD6cSDznixS2r8g
1205	BaHmcirSeGfTfH2SpUQwHa	6LAXbrqGmpGwTwXwFD8hvm
1206	BaHmcirSeGfTfH2SpUQwHa	iSKtEqGTrEftco47PiLBkN
1207	BaHmcirSeGfTfH2SpUQwHa	HNGBqxVqjgnegRQG2SDWXq
1208	CsBaf6aFn43mnXW77j443H	4SrdimfGxSA9qVVAMmfwbx
1209	CsBaf6aFn43mnXW77j443H	QZa7w62e4gMPVYE2mX5ov6
1210	CsBaf6aFn43mnXW77j443H	RpHfgfSScuXiS4Bg5qsMhG
1211	CsBaf6aFn43mnXW77j443H	6yEGFDXjBXnXxEQTfUpP3T
1212	DFh7jWaXofhGpYrysqVkQu	c5fJnKwkkAhDD6xVq7BHeG
1213	DFh7jWaXofhGpYrysqVkQu	nco4nDvm7PRZPL7eLLwYdZ
1214	DFh7jWaXofhGpYrysqVkQu	2pfLayDaeoDGdueDE5gykC
1215	DFh7jWaXofhGpYrysqVkQu	dTyqNAJhzrDvDC4XzX3ZPG
1216	EbF8WnALHpQGcQugF62ii9	oEF9fygfYviobjhpfYsHSC
1217	EbF8WnALHpQGcQugF62ii9	PcBBgq6wSbjbqvFa5U3LMY
1218	EbF8WnALHpQGcQugF62ii9	TB8YTDz558wyzmVFhH2sBH
1219	EbF8WnALHpQGcQugF62ii9	Mu3LYmkfYb68R8GLS3buWN
1220	F4gr6FhmCGGx3xw8CyM4K3	cpFQNYycvY5qX7xLksCtTF
1221	F4gr6FhmCGGx3xw8CyM4K3	cvVYt3kCvCFSJ2opGnJFGn
1222	F4gr6FhmCGGx3xw8CyM4K3	PPxCZFZWFkjiXqdp8co5gd
1223	F4gr6FhmCGGx3xw8CyM4K3	h5vbWssNZSynKhEFxPCqQF
1224	F7WWFnYyHX7kapUyT9AyHi	fw64zZGZ5cPiZi9f4SX5i9
1225	F7WWFnYyHX7kapUyT9AyHi	EJYNJvPcmNYJ8jZMFAztkB
1226	F7WWFnYyHX7kapUyT9AyHi	UAAXkgzZW4PnTH6uv8R7Pm
1227	F7WWFnYyHX7kapUyT9AyHi	Tmqxn4nGoszNrkomdT2c4P
1228	F9raEnr6y9MKEzthLUByg7	a6MZ38CzZBwQuUMZWfYfKn
1229	F9raEnr6y9MKEzthLUByg7	ZiYUw8L9evTcM8ET7nZoe9
1230	F9raEnr6y9MKEzthLUByg7	i7gWNa8W5Y4QXJX7C32MbS
1231	F9raEnr6y9MKEzthLUByg7	BYWtcuRy6tmhBWWYL7CVnG
1232	FTz6TcfoAKbYnDEs4b6gfY	KXKJc5gVmNiZ4CPqvqguNo
1233	FTz6TcfoAKbYnDEs4b6gfY	beRVoeQQihmPT3QnE3DANG
1234	FTz6TcfoAKbYnDEs4b6gfY	2gtVnbivyE8Eazmqqheq85
1235	FTz6TcfoAKbYnDEs4b6gfY	P8EfC6Tz8mJFu4ZCVH4jWQ
1236	Fdgsc2JciExfFT3xhtAKAS	apYi5PpWHFjRxEKskjVE4e
1237	Fdgsc2JciExfFT3xhtAKAS	Xcgsq4QdRBjLDk4T59tLpW
1238	GDkXshc6rN2pNSwVY9wofS	bkrt8PANj5RinaPb3CkdYY
1239	GDkXshc6rN2pNSwVY9wofS	WKH74UhLYa3kQv899vRN4a
1240	GDkXshc6rN2pNSwVY9wofS	Sd4XdeTD34KQtSYoJTp2rL
1241	GDkXshc6rN2pNSwVY9wofS	GizNuhkAEeBpN7wpeMpSxk
1242	GMQtgXWn2n7hiWpv52Xujh	XpNGAJuFMCzoBmxksQHMRi
1243	GMQtgXWn2n7hiWpv52Xujh	e9XWTmf35BBzzULW7ZSXcd
1244	GMQtgXWn2n7hiWpv52Xujh	FsPYeKcJ4wiKpsWRzsmhKh
1245	GMQtgXWn2n7hiWpv52Xujh	S82XKuZUA5KEY9pusU58rL
1246	GXFbYx2GhDLufgegTkiNP4	LudPrrTfi8HyvaNYxKXrAK
1247	GXFbYx2GhDLufgegTkiNP4	5Ng5gqheWeRt28PuppEPix
1248	GhoyWwMokSmF23KTJPGMNm	KhH7JRisVCuBbmd99U2HKj
1249	GhoyWwMokSmF23KTJPGMNm	7T85pqLDFCjxYhuVeEgjGc
1250	GhoyWwMokSmF23KTJPGMNm	GWcvH5jz96c7zRVQezWYqY
1251	GhoyWwMokSmF23KTJPGMNm	8maCfVkz5j5uh2SRj9z8iY
1252	GrbW8aXy7zUjXSLNdTGtsZ	fkif9uL5ycztaoYR4t7nm2
1253	GrbW8aXy7zUjXSLNdTGtsZ	4pffdGHmKMr55NiWQ6bfxm
1254	GrbW8aXy7zUjXSLNdTGtsZ	E4VNLRpAPGdgWJervUmKL4
1255	GrbW8aXy7zUjXSLNdTGtsZ	jPXYrVUvBiQqxDheZJXg28
1256	HEkRTqB55ZGWCGfWL4ce3s	ZGeN7vyupBfJiEtsYqTmY7
1257	HEkRTqB55ZGWCGfWL4ce3s	T3rfuU5SJdKQw5EipDsKgd
1258	HEkRTqB55ZGWCGfWL4ce3s	E8DYfeEf75EiHfPBS6dhXo
1259	HEkRTqB55ZGWCGfWL4ce3s	LXVVVN9CwPmpeCBMkv44sL
1260	Jcfok6uVHGUWDVLdJrL6Py	7CtNcKkc9C6fv7EehCXEjN
1261	Jcfok6uVHGUWDVLdJrL6Py	AacajdY7ecPFSRWxtzXPhV
1262	Jcfok6uVHGUWDVLdJrL6Py	DrovcRG5GzBwXTawHJfhzT
1263	Jcfok6uVHGUWDVLdJrL6Py	PVRpQnv4UezHiEaw8GwEXS
1264	KkyUy4mFmDW3E8jXRQ4w9k	fDfTePRM5DrKZ9NmcUucAs
1265	KkyUy4mFmDW3E8jXRQ4w9k	h6GAhvYmhVhNK2k6MAhrBH
1266	LHAziu2nW8rsMKoQt8aKfh	Snpt2bfJYtKityqAZ34jbN
1267	LHAziu2nW8rsMKoQt8aKfh	pQWAPE3M5g3JTsyHa9LueD
1268	LHAziu2nW8rsMKoQt8aKfh	WHVLNLWAytjLxFht7k9aU8
1269	LHAziu2nW8rsMKoQt8aKfh	9jjwuSrKzby9BJNHcAdgEf
1270	LJRtiXGL2ts6cch39enCqK	cjBEXbJnhJeBiWBBeZCxPB
1271	LJRtiXGL2ts6cch39enCqK	gqnrhzd8t5tyZvzvYg8i7Y
1272	LJRtiXGL2ts6cch39enCqK	XsJmBW84P7GyF8r6KHJXr2
1273	LJRtiXGL2ts6cch39enCqK	o6vkYvnghSEXzDwnhJHZqC
1274	MD2XgcDBtaUNPkonsbvMAm	M02XgcDBtaUNPkonsbvMAm
1275	MvxsmnzaoxAigaeXsYnXyq	EYLiHZhbp8RbqKpPo7yU8z
1276	NWi7mrpKMY32rHeMaMYqN6	XD8tJ57Dk8fs33vHNrPAKT
1277	NWi7mrpKMY32rHeMaMYqN6	xHzmHEVBeYNNsNHAC2oUxT
1278	NWi7mrpKMY32rHeMaMYqN6	G4PqhGMnjp2TNcmhbapvHc
1279	NWi7mrpKMY32rHeMaMYqN6	GmDSDnSyoHHwxiwRx8d5ZE
1280	NbcexxzsjoSTDZH5ujHqHi	Ecz99FmNBkCyFpvuzYNvKx
1281	NbcexxzsjoSTDZH5ujHqHi	28ZWJvcSik2H3BXnvy6zPM
1282	NbcexxzsjoSTDZH5ujHqHi	BzmQ7tzSHqjKc7xKW8htVA
1283	NbcexxzsjoSTDZH5ujHqHi	ZtQQf6PybfkxjJzKaNRgLb
1284	NvTMHwifoWuAK2g2oJV9Js	dkXVoEEK7qtTrTTJdRC3uT
1285	NvTMHwifoWuAK2g2oJV9Js	VSHF6rC9fuWapi3uEh7fr6
1286	P6VibzQnTgJakkyUXxmA6B	cTUzBXbnCkvbtmuWyXXpky
1287	P6VibzQnTgJakkyUXxmA6B	P63uRSY9K9jp8DqQfHPqtX
1288	P6VibzQnTgJakkyUXxmA6B	LQqCCDRifoFBRvLbL3mYhZ
1289	P6VibzQnTgJakkyUXxmA6B	gPhjr8mnmq6f6sJvGFEvgq
1290	QMrR9V2WLkeKuYFWEygeiG	CBctmAykmQxLgW4diFXvgX
1291	QMrR9V2WLkeKuYFWEygeiG	oNZuhck6tf4VpqqN7RFuGC
1292	QMrR9V2WLkeKuYFWEygeiG	coXyp55DDgCkCy4pRujQue
1293	QMrR9V2WLkeKuYFWEygeiG	nkAnq5uqHsH7pfg8vopnwN
1294	RDA7N6HT9FugeimPG7ekPe	RrfGZkqcchg2Scwu5LWtQ9
1295	RDA7N6HT9FugeimPG7ekPe	cBfJMbvhxUPCjeSRDJRghk
1296	RqyvEDHwVs6AmTq6fd2csN	2CVgMmoJV622LUYKcNRH7U
1297	RqyvEDHwVs6AmTq6fd2csN	J5oTk63FYWDrBu7GztChUB
1298	ShAvBhTbqEdngqkvdpX6LW	U8dCUW8URRBUErX56KqETp
1299	ShAvBhTbqEdngqkvdpX6LW	iyufV63owia5DQhpmJms5A
1300	ShAvBhTbqEdngqkvdpX6LW	6TZyNMoFaghTt8VHYQZXGF
1301	ShAvBhTbqEdngqkvdpX6LW	AMQRDgPBo2kH7TuWcq4BMw
1302	SkwoWsZesuSTtLv9MeoafA	9sTmrxTrCZ8QWf3rBA9uds
1303	SkwoWsZesuSTtLv9MeoafA	byGkZUJUqHJ6snnCGmgjw6
1304	SuTzfUbudm2F5eoVLTXjeC	S0TzfUbudm2F5eoVLTXjeC
1305	T6up72TRk678qKXJz2WvJ4	GySTekJMn2cXHAhBC9WTbV
1306	T6up72TRk678qKXJz2WvJ4	GHPADMwN3NH2mFb3ss3E8B
1307	T6up72TRk678qKXJz2WvJ4	iA28kzMayckN6b9xAmpevj
1308	T6up72TRk678qKXJz2WvJ4	BmCLKH2N7Av3riFo77wgFH
1309	TipArFDsJtEv7ggYsrKP2b	BJeDYYcwrxRBVbwHWeXVMA
1310	TipArFDsJtEv7ggYsrKP2b	6C8gZsTgvvvBg64ZF2VhCP
1311	TxTpapmGjbekKR5vwADhkC	kC3o5YLDeADcDgW6musFA7
1312	TxTpapmGjbekKR5vwADhkC	Q7G3PNreAUYvnB87vHGXL5
1313	TxTpapmGjbekKR5vwADhkC	uhSwa5jkEdWLRk9ye9EEGB
1314	TxTpapmGjbekKR5vwADhkC	qruTeckNYMVDCjREDhzph5
1315	UGarAHicdeXxGPSsVHzXSB	8CEiTUZR4VMpNNdHSX5JhA
1316	UGarAHicdeXxGPSsVHzXSB	FMzkBVSYuzXT2qqYkM6QdV
1317	UGarAHicdeXxGPSsVHzXSB	C5PF8FKbLd3HzPShfyRjNJ
1318	UGarAHicdeXxGPSsVHzXSB	DpSZEnnX24M5qR3W8Prbuw
1319	UckoTUrzSe4abixVxRPHtV	cswG7RYo3GDwefDTMZG7xu
1320	UckoTUrzSe4abixVxRPHtV	NF8FwhKcF8mtqoaQBYSDca
1321	UckoTUrzSe4abixVxRPHtV	8CL58tVULwtqfnxhPyPCYX
1322	UckoTUrzSe4abixVxRPHtV	SkdijQhd4Jy8r7fT7RxPvT
1323	UuHgNnQFcuUoqE2SrGfNpL	oUBUEtZBQgWms9EsY9c99H
1324	UuHgNnQFcuUoqE2SrGfNpL	TGpzdTeiXUeZbTYs4dDEvh
1325	UuHgNnQFcuUoqE2SrGfNpL	Tjj6dj9AdkRdreRkhqH82i
1326	UuHgNnQFcuUoqE2SrGfNpL	nDuRVK4giNMuRXm7AuvxvN
1327	VSKL9fVNAnbzfYUJ36BpEb	FDF4MaE3U94J33YgLYWnLi
1328	VSKL9fVNAnbzfYUJ36BpEb	JXhUaLwF8vzvcgL3Lzf3os
1329	VZ5fFaAKgUUJm25d3s5Hrj	VtRdXuhSMGcfPwpMKkJMN9
1330	VZ5fFaAKgUUJm25d3s5Hrj	qjBa5uTWYRWTFj222nkgqJ
1331	VZ5fFaAKgUUJm25d3s5Hrj	o4DBYcmzZRvDFKK9fkH7Xc
1332	VZ5fFaAKgUUJm25d3s5Hrj	NqzNDTsP3w2MftXhY44aRE
1333	VxdVdvdSY5KeW2KYCJCuG4	JSqvg4dzJ62XTJ7TnGUW9d
1334	VxdVdvdSY5KeW2KYCJCuG4	6bEwycEHsYCNNWpJcpRoGf
1335	VxdVdvdSY5KeW2KYCJCuG4	ZtguMnd7cLfu8aBv2mb4JN
1336	VxdVdvdSY5KeW2KYCJCuG4	VPZLM9VyaqWmD6MJvjn9LZ
1337	W4YHYdM5KgqFjWLw4LBZbY	S6jceGTKauLLCvxJppJzrc
1338	W4YHYdM5KgqFjWLw4LBZbY	SFDA9PzwCr573uAcALwkLd
1339	XBbCz7era7Qxn23NKeqyrc	NhYBWGJwhbyxo8g2REq86L
1340	XBbCz7era7Qxn23NKeqyrc	SfVskPGvAfAGYEZBd5GnNB
1341	XVuufWqzeNHXRTzcy46xV7	UUFauEEoSadt3dGLG3AXog
1342	XVuufWqzeNHXRTzcy46xV7	YSR47xJsZsYUT9zFhkgtwR
1343	XVuufWqzeNHXRTzcy46xV7	uCKAWsTZ8BZWxTbKUiwkZ9
1344	XVuufWqzeNHXRTzcy46xV7	VWhLJLYuXNMxHfM9W2i2w2
1345	Y8oHuoTsCrYkWQvu97kG4Q	keNkjYNaTmy3VMZfHUyYiK
1346	Y8oHuoTsCrYkWQvu97kG4Q	Eos3ebFixNEXCF26hRRozm
1347	YFNp7UrLmdMWvnNygfBmsT	A86WAmqSFApBkQ68bKQp7o
1348	YFNp7UrLmdMWvnNygfBmsT	Zauy5YfBW9WxTnoC9LDkjT
1349	YFNp7UrLmdMWvnNygfBmsT	7BzA7ZSKPp6q8WTXCzC5xg
1350	YFNp7UrLmdMWvnNygfBmsT	BT27DgMLsBrCrNHtUGsmoQ
1351	YQFhWvb8sz6HzGTPqoBhXq	EUhBBX6gPuSRAfoHQJFxW9
1352	YQFhWvb8sz6HzGTPqoBhXq	PgUmw3i2jGQhUDdsxFEmBc
1353	YXZrLNriYJ4y22P5J9rUv8	xbpMQNLcs4Cbf4rc6ddzsK
1354	YXZrLNriYJ4y22P5J9rUv8	Ymh4SV53AFMwxsmgvx3DbL
1355	YXZrLNriYJ4y22P5J9rUv8	GTHKUtBTxDJFuSzzKSV3aS
1356	YXZrLNriYJ4y22P5J9rUv8	Pp8Z2xrwaZXuHoUAMTHgs2
1357	ZozuCBD4dHugMof9ZjZ8EN	iVWHyKBUPhQkmrTqmQLUi6
1358	ZozuCBD4dHugMof9ZjZ8EN	UASmoGkG6hq3k37CKHPYYo
1359	aR7vELeUuAAwawWjkH3zbw	aBRk5ppcYvxk4pTtAxzhw9
1360	aR7vELeUuAAwawWjkH3zbw	dsDJT5R8GoDCVo3yTJjpJe
1361	aR7vELeUuAAwawWjkH3zbw	aezyMfcEcQvXAJTPXYWdA7
1362	aR7vELeUuAAwawWjkH3zbw	HVQU5HqUhuxTHV3b5399VM
1363	aYJbeTesvLmmYGK58LqwVB	a0JbeTesvLmmYGK58LqwVB
1364	bYGtWrwsJt9fkNH38pAF3E	fBfAcHubWAEaMBM7DVUJTF
1365	bYGtWrwsJt9fkNH38pAF3E	8anATegeFUTPcdyKcZrrSP
1366	bYRkfWLzakFR7AYWMjXHTz	FccwF9tLvNkg6n2Bqomrpc
1367	bYRkfWLzakFR7AYWMjXHTz	ZF6kCUtXmD88gDCN5CmnjC
1368	bYRkfWLzakFR7AYWMjXHTz	XPtNNJHJCucKRDGfiA3UXw
1369	bYRkfWLzakFR7AYWMjXHTz	FRd9dLj4wLLQv65EKV9RZC
1370	cLehXLjF6c5nBk5NcTfKp2	Bg5eVbqRzA6TDYVaM99ces
1371	cLehXLjF6c5nBk5NcTfKp2	AMHgbFxaQ89HoPGFK9bHi4
1372	cLehXLjF6c5nBk5NcTfKp2	Ta3ytZqYHu5BoWW5gQVwd9
1373	cLehXLjF6c5nBk5NcTfKp2	EexADLnUQMWTuz7z3XHLEu
1374	cW2nNNni4m6A8YSDUo8YDZ	LK9aY2hvvcmrUPRbS5HxU9
1375	cW2nNNni4m6A8YSDUo8YDZ	3YkQCH3CZ7pupEmebVvpKN
1376	cW2nNNni4m6A8YSDUo8YDZ	mgsnmkBzYekjc29VBPMYFo
1377	cW2nNNni4m6A8YSDUo8YDZ	avkWnfP45rokoVvXhRRFgR
1378	diQrNYEPEkAwrQVCqGGHsy	5zFcxeXnHnn9goaFzn5ddy
1379	diQrNYEPEkAwrQVCqGGHsy	StvKvGmY4wNdVJsKV2aJfQ
1380	diQrNYEPEkAwrQVCqGGHsy	D6ptRkfYjb8KFiAHbipMhH
1381	diQrNYEPEkAwrQVCqGGHsy	oWNBLR3HVCmui7kkZKpux4
1382	eMwaymiwRf9jfdwANQw7Fa	npWJcCyYShdRAanUvhDX9q
1383	eMwaymiwRf9jfdwANQw7Fa	RFnLeMeEaMRx6BKz3S22p5
1384	eMwaymiwRf9jfdwANQw7Fa	nvdFob2Tp9i96WEoMBa4SM
1385	eMwaymiwRf9jfdwANQw7Fa	a3vxYBw7ZoyNoeemniBPuJ
1386	efEdTW6xhF8irdWJqRiSUE	JWMzoioqmv9bKmwphSvMDh
1387	efEdTW6xhF8irdWJqRiSUE	N3sy9LDVLVdTirGtHyGP9A
1388	efEdTW6xhF8irdWJqRiSUE	k5kYpSSamaAqZuWKJndeK4
1389	efEdTW6xhF8irdWJqRiSUE	8fffjiSjyrL9PhwfzsxRgW
1390	eo6jrZDCJa6MVtit4PMn4X	5Z4zbA55pkVFdRQsftLYEz
1391	eo6jrZDCJa6MVtit4PMn4X	S72MUtgs52R3DHbK8shaEf
1392	eo6jrZDCJa6MVtit4PMn4X	Zsy5iG2pU2dNBmQTMeRRVK
1393	eo6jrZDCJa6MVtit4PMn4X	jVd2zQbeJHnfsjDaKBDChy
1394	fLxVat4MRmo4hQgtxjrMnn	BppB6XmUPJ6CMBGad3ttYX
1395	fLxVat4MRmo4hQgtxjrMnn	BQz6ESsxqYWZc2yu66ar6k
1396	fLxVat4MRmo4hQgtxjrMnn	Qo2u3ADMPH8erSKBGAN64r
1397	fLxVat4MRmo4hQgtxjrMnn	LBRTvff5qP8HKUNZTxQ2Pc
1398	fWCwgfxNk8gWzkpiWeXAzB	48BmEUByDW3hJrt27FnWLE
1399	fWCwgfxNk8gWzkpiWeXAzB	pwx9LweuB6jrqTKf3225nn
1400	fWCwgfxNk8gWzkpiWeXAzB	FDcVH45SQiepFLWc2DxABh
1401	fWCwgfxNk8gWzkpiWeXAzB	hRYXTxMBwYdUdd9Y2xueLB
1402	fXg6aAqPP7ARTfGoTMScBq	hiaedHiA8fgRwRqrQJ823v
1403	fXg6aAqPP7ARTfGoTMScBq	h6FQb7ac64cntaJRdZEMK2
1404	fezbefJx9eMztCZcLMQZd5	M6ixPu787bgZ5qQpeUs7x4
1405	fezbefJx9eMztCZcLMQZd5	gKSKBBcGdFKduAiiFi8sHB
1406	fezbefJx9eMztCZcLMQZd5	Y3z3ZwfYQbwS5XVhNbHsfj
1407	fezbefJx9eMztCZcLMQZd5	iKvbJSG5rD6bDLRXFchvad
1408	fmasiRp4RtyUJnjJwmLtVm	6pj8zRn3WnYyTFrkXXHC9h
1409	fmasiRp4RtyUJnjJwmLtVm	9KRQ6uVubQ4mkEEg24c9GN
1410	fmasiRp4RtyUJnjJwmLtVm	ZEUjFHJYLX9zCdNSwQU6gd
1411	fmasiRp4RtyUJnjJwmLtVm	UHi3qgecJ4StH956Bxrp2B
1412	gcGWrB7WsbQrNnRotCxt7e	dy6bF33wHNH4G2rVtWwPG4
1413	gcGWrB7WsbQrNnRotCxt7e	dXGBk3NG5PNFH2s4SScdDB
1414	h4btktvGqKbWWspfDdBLWM	WFMsQsj9hpPxNpGLh4FsAW
1415	h4btktvGqKbWWspfDdBLWM	ceTNKRUNpMPgE3FrNmzpQm
1416	hcsdM4kdKsp734xJiWPgaj	KBcAmf9xhzc3cJiRX7MnkW
1417	hcsdM4kdKsp734xJiWPgaj	VVSk7W4jXryhVMbLjYr7dZ
1418	hcsdM4kdKsp734xJiWPgaj	TkTzkNHmxoLqyF8jmqL9iZ
1419	hcsdM4kdKsp734xJiWPgaj	CjakRHXXEzYhd8cU3Ghvm6
1420	hyvRVfECNJ6sBsiXLzW9Ry	fJEUxRYDnx9bu4cqnveFym
1421	hyvRVfECNJ6sBsiXLzW9Ry	Wduj7NUt9SSaJPnUvW4Ujj
1422	hyvRVfECNJ6sBsiXLzW9Ry	QKPPtJ52yQfHtVxrJCBgTG
1423	hyvRVfECNJ6sBsiXLzW9Ry	Kg6tQbV68EtsPRRfJ9sTUj
1424	iBTVPBdyUzze2y2HA4EBD2	CmC7FnF9sDhw6aZN5JQsvN
1425	iBTVPBdyUzze2y2HA4EBD2	k77dzZgdJEBGrkUtBGK2kU
1426	iBTVPBdyUzze2y2HA4EBD2	nFHCz4r7jBsyG6JVQv7ySh
1427	iBTVPBdyUzze2y2HA4EBD2	dtbiK8FrE8ZaKdKqBxUzAh
1428	ibpCSifxfGFGKiqdnQJQsf	KMFfQDchmLDK5ms5Ahw3iD
1429	ibpCSifxfGFGKiqdnQJQsf	K84HQtn3SGcptEYxyv9DQa
1430	ibpCSifxfGFGKiqdnQJQsf	vCo9dgSjsQRNC2XRZcRM6C
1431	ibpCSifxfGFGKiqdnQJQsf	iTv9DKcVybvMhPkYSLou8X
1432	im227swf2fhq9dtdbbf7x7	29sGFeMJ9BLp4hkgJm9LtN
1433	im227swf2fhq9dtdbbf7x7	3ER5CtZW9hyuxhdAV44G3o
1434	im227swf2fhq9dtdbbf7x7	HEjEoSPAKFJXwFABhXoKyt
1435	im227swf2fhq9dtdbbf7x7	CpVoKSVkLDu46rjB5VJpff
1436	jacMMNHA7sPzoC7bJZBmbS	VweZiQkpaVPTrphyTFQjLv
1437	jacMMNHA7sPzoC7bJZBmbS	3nWjMVucFR5ahdNLxjTEv9
1438	jacMMNHA7sPzoC7bJZBmbS	FFRtSEayfHZTQTyMiR5GPe
1439	jacMMNHA7sPzoC7bJZBmbS	CaCdB9eBWAECJJtDCR5vEf
1440	jh7Jpn5TJVwfzm2ghLyfbB	QtKH3DqKaD3uJZSk5LJcVz
1441	jh7Jpn5TJVwfzm2ghLyfbB	R5dPBrLWhh64BuNDhVHTsa
1442	jh7Jpn5TJVwfzm2ghLyfbB	ZzoL8uzUMthSpsA4wXZ93z
1443	jh7Jpn5TJVwfzm2ghLyfbB	2x6nk8Mr5kxYWKaWvX9rhj
1444	khAac3NzjtFrGXSDk4faRu	L2Ks9nB5dgkgxoAop6D6aw
1445	khAac3NzjtFrGXSDk4faRu	V9WYBufRe2td4jB3vormXA
1446	khAac3NzjtFrGXSDk4faRu	hoMVRUHW6vg3cPUWqs4pLq
1447	khAac3NzjtFrGXSDk4faRu	Q7fbuecJcPGfA8XeJ5Gijm
1448	m5tWsnXxGfKYSLutQDGNvL	uo2DeW7R2eUbWzy6LDUJWE
1449	m5tWsnXxGfKYSLutQDGNvL	vk5QYW3nodfw5jAqrNuBfm
1450	m5tWsnXxGfKYSLutQDGNvL	RaTTj4WLsXXuWC7jtySsfe
1451	m5tWsnXxGfKYSLutQDGNvL	z68rS72cofrEGUJ6PX65wS
1452	mWPHYKAX9zS5J3cToDACD5	vKudCTJTxRoDs6Bh4bgtzU
1453	mWPHYKAX9zS5J3cToDACD5	mX3SVrUzwEe3j4uUdB4VBZ
1454	mWPHYKAX9zS5J3cToDACD5	NGX5kdqvAALi2dw5PJ2jG2
1455	mWPHYKAX9zS5J3cToDACD5	MokPcUSRyUgPefmNBsjPNG
1456	n96uRgTF3MZQWRR5sAgHoy	dKD8xkHJ7nWkL4Zsqku9CF
1457	n96uRgTF3MZQWRR5sAgHoy	3CAEkcyVaNBXaEegzrp9Ys
1458	n96uRgTF3MZQWRR5sAgHoy	LUhLVM5uJjCSLRqqnR3sZi
1459	n96uRgTF3MZQWRR5sAgHoy	VbDY9stgF3GXcmQxnZEH8U
1460	nnEtTgu5KZNuH9oWcPutwx	PS8Hm4nDi9xiidzf2w4Y2b
1461	nnEtTgu5KZNuH9oWcPutwx	L8RckrLxroL5JjW8obhoX2
1462	nnEtTgu5KZNuH9oWcPutwx	kR2RXzaDsrEH3aRtonEgkM
1463	nnEtTgu5KZNuH9oWcPutwx	g23KTR5F7hWBHqWdhCffMd
1464	nvP7bj8JXNruauRk3fgGV7	n0P7bj8JXNruauRk3fgGV7
1465	ny5Xf9UEZhh4qKnk9tTEwL	WmPebwkGjYRLtrFjQsVXqT
1466	ny5Xf9UEZhh4qKnk9tTEwL	zqhAUKwScuMqBYAvZeayoB
1467	ny5Xf9UEZhh4qKnk9tTEwL	obCHLbYkmcKp9yXX6CPky8
1468	ny5Xf9UEZhh4qKnk9tTEwL	Hzc2GSRXTzQSw3ao6Btv9K
1469	p2jFaoAZmoDtnSGfLfMBS4	rUMTvcrBCixyfUqBKVUVAQ
1470	p2jFaoAZmoDtnSGfLfMBS4	zgx8VUvZaTsEBMkDP3EHRT
1471	p2jFaoAZmoDtnSGfLfMBS4	w7Ja9hPSM3Ry6SNX4G322o
1472	p2jFaoAZmoDtnSGfLfMBS4	ozmacxERzrPceN8iHyJYHk
1473	srHmwMqUPVmV3BNtJ3bwJW	DBxMvhHYrthP4C3iRHWLrU
1474	srHmwMqUPVmV3BNtJ3bwJW	j9kjVLhybWpUX97iCqcQXG
1475	srHmwMqUPVmV3BNtJ3bwJW	thVWe7Q3YfCvktdeTw7eEn
1476	srHmwMqUPVmV3BNtJ3bwJW	7WEixTRSA7i7rsCHoWTEP7
1477	t9KqCXv74XyvaoAo6JMb28	Q6CPMm3YvqVEqBfY35zLB4
1478	t9KqCXv74XyvaoAo6JMb28	jmxWXcPvvbHmNkQvD5uBmG
1479	t9KqCXv74XyvaoAo6JMb28	EegTgWesYXokaEemaNo6BA
1480	t9KqCXv74XyvaoAo6JMb28	DREXNkG8Dt2wEJ7wvgJWcG
1481	vPD3tEmCDDDsosfhxfebqH	ZjKPV6cXrFQRR3LgXKZhxM
1482	vPD3tEmCDDDsosfhxfebqH	Tjr8SwUWAGcFeuNip8ZNzV
1483	vPD3tEmCDDDsosfhxfebqH	LY2zosBqvRPFxwHewfq6VL
1484	vPD3tEmCDDDsosfhxfebqH	scCUvaE4nBubGoVM66H8QW
1485	wjszETrADEPBh5fWqC5dD9	HbxRFaWHbbf67eBwqErWGK
1486	wjszETrADEPBh5fWqC5dD9	H3yCozys9Hnr9eLCP7bRcE
1487	wjszETrADEPBh5fWqC5dD9	qJGMuFcD2W2daJCRyJTfb5
1488	wjszETrADEPBh5fWqC5dD9	6izaB3VdP2B953KWvUnwXE
1489	xXRN2qG2BRqLSTLL6YFpp2	Hyg66YYzN6USKjag9czmrj
1490	xXRN2qG2BRqLSTLL6YFpp2	GiPNvrzd9de8YCnSYzGk42
1491	xXRN2qG2BRqLSTLL6YFpp2	mWwHVdtw8sYcJf6RmSQGqY
1492	xXRN2qG2BRqLSTLL6YFpp2	xTqF3cfczimmWr9Ux57aWN
1493	y6PVinb9a7xv8jr58Zy5b3	dznNvNiMdqj3BrBFKg2APP
1494	y6PVinb9a7xv8jr58Zy5b3	4RttLVNVhEFaxBWw9KyzLd
1495	y6PVinb9a7xv8jr58Zy5b3	WPiQpxmezTFZTzCu6tTh6Z
1496	y6PVinb9a7xv8jr58Zy5b3	sn6ntYRuDnxmk4SAquJqU7
\.


--
-- Data for Name: app_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_group ("Id", "Name", "CreatedOn", "ModifiedOn", "ParentGroup_id") FROM stdin;
\.


--
-- Data for Name: app_group_Properties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."app_group_Properties" (id, group_id, property_id) FROM stdin;
\.


--
-- Data for Name: app_groupdevice; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_groupdevice (device_ptr_id, "Group_id") FROM stdin;
\.


--
-- Data for Name: app_interface; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_interface ("Id", "Name", "CreatedOn", "ModifiedOn", "Editor_id", "Monitor_id") FROM stdin;
2hspkWkWazNnNkFrykHiCF	Orta Oda Sağ Aplik	2022-10-30 15:41:13.321+00	2022-10-30 15:41:13.321+00	e4828jpp2WxEJion7VFzen	a4FwyGD7Ybd9GyGTbBucLN
BYWtcuRy6tmhAWWYL7CVn0	Balkon	2024-04-08 20:00:00+00	2024-04-08 20:00:00+00	Zsy5iG2pU2dNBmQTMeRRVK	S72MUtgs52R3DHbK8shaEf
BYWtcuRy6tmhBWWYL7CVn0	Sarkıtlar	2024-03-09 20:00:00+00	2024-03-09 20:00:00+00	GGrzLN8usQJ8LeGz7zDucz	DbwYyXZT9xHrfp4z7sSAeP
BYWtcuRy6tmhBWWYL7CVn1	Mutfak Spotlar	2024-03-09 20:00:00+00	2024-03-09 20:00:00+00	PdWGrXzBZHBLehTLF5HP5G	52nodgPLPHSifHL7QNdRYt
BYWtcuRy6tmhBWWYL7CVn2	Aspiratör	2024-03-09 20:00:00+00	2024-03-09 20:00:00+00	QogfFao5mE5mNAgu2bKk2o	9DYyGvEhdbTJYZZSKvPfo6
BYWtcuRy6tmhBWWYL7CVn3	Mutfak Tezgah	2024-03-09 20:00:00+00	2024-03-09 20:00:00+00	L8RckrLxroL5JjW8obhoX2	g23KTR5F7hWBHqWdhCffMd
BYWtcuRy6tmhBWWYa7CVn1	Kombi	2024-04-08 20:00:00+00	2024-04-08 20:00:00+00	iyufV63owia5DQhpmJms5A	6TZyNMoFaghTt8VHYQZXGF
E6yLX3S6voHCH8JPftZsgY	Sağ Oda Aplik	2022-10-30 15:28:44.986+00	2022-10-30 15:28:44.986+00	AMHgbFxaQ89HoPGFK9bHi4	Ta3ytZqYHu5BoWW5gQVwd9
HdhTTLc6Dmj67gFv8H5CWi	Orta Oda Kenarlar	2022-10-30 15:36:47.489+00	2022-10-30 15:36:47.49+00	KBcAmf9xhzc3cJiRX7MnkW	VVSk7W4jXryhVMbLjYr7dZ
Kg6tQbV68EtsPRRfJ9sTU2	Sol Oda Köşeler	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	Wduj7NUt9SSaJPnUvW4Ujj	Kg6tQbV68EtsPRRfJ9sTUj
Kg6tQbV68EtsPRRfJ9sTU3	Sol Oda Kenarlar	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	HNGBqxVqjgnegRQG2SDWXq	2bHNCivTD6cSDznixS2r8g
Kg6tQbV68EtsPRRfJ9sTU4	Mutfak Havuz	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	Qo2u3ADMPH8erSKBGAN64r	BppB6XmUPJ6CMBGad3ttYX
Kg6tQbV68EtsPRRfJ9sTU5	Sol Oda Havuz	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	CBctmAykmQxLgW4diFXvgX	coXyp55DDgCkCy4pRujQue
Kg6tQbV68EtsPRRfJ9sTU6	Orta Oda Sol Aplik	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	DrovcRG5GzBwXTawHJfhzT	7CtNcKkc9C6fv7EehCXEjN
Kg6tQbV68EtsPRRfJ9sTU7	Sol Oda Aplik	2024-03-09 12:00:00+00	2024-03-09 12:00:00+00	cyQ9LdusdZDY7jAC5wp2ki	KVu64mETAgFgRFXX8wAgjd
Lb5PwvBs9ZyS4yFCSMrZWb	Sağ Oda Havuz	2022-10-30 15:31:18.171+00	2022-10-30 15:31:18.171+00	CpVoKSVkLDu46rjB5VJpff	HEjEoSPAKFJXwFABhXoKyt
PfeFZK9izwJcYbqke7wEjk	Orta Oda Köşeler	2022-10-30 15:54:14.951+00	2022-10-30 15:54:14.951+00	RpHfgfSScuXiS4Bg5qsMhG	QZa7w62e4gMPVYE2mX5ov6
Q8X9G3MB8ctgWCjFMcazMa	WC Spotları	2023-04-21 12:03:48+00	2023-04-21 12:03:48+00	UAAXkgzZW4PnTH6uv8R7Pm	Tmqxn4nGoszNrkomdT2c4P
Q8X9G3MB8ctgWCjFMcazMc	Duş Spotu	2023-04-21 12:03:48+00	2023-04-21 12:03:48+00	8oCxHsJKVdRrLLXYUneatG	LiN5mQSQsS85EfepeSKVGR
Q8X9G3MB8ctgWCjFMcazMd	WC Havuz	2023-04-21 12:03:48+00	2023-04-21 12:03:48+00	aBRk5ppcYvxk4pTtAxzhw9	aezyMfcEcQvXAJTPXYWdA7
Q8X9G3MB8ctgWCjFMcazMe	Duş Havuz	2023-04-21 12:03:48+00	2023-04-21 12:29:29.894+00	TmnCKLwrsxvSAXiL5DuWjm	2tAzCuvkyciSdWrWvAwtkH
Q8X9G3MB8ctgWCjFMcazMh	Anahtar Sağ Alt	2022-10-30 15:55:26.561+00	2022-10-30 15:55:26.561+00	hiaedHiA8fgRwRqrQJ823v	hiaedHiA8fgRwRqrQJ823v
Q8X9G3MB8ctgWCjFMcazhh	Klozet Spot	2023-04-21 12:03:48+00	2023-04-21 12:03:48+00	o2yo77z3LXtzYgZ5uM7vNM	H5584ySuh5FJWDJy3CEzs5
XK8TBSn9bD2hdCWbVa5V5u	Koridor Kenarlar	2022-10-30 15:37:50.352+00	2022-10-30 15:37:50.352+00	28ZWJvcSik2H3BXnvy6zPM	BzmQ7tzSHqjKc7xKW8htVA
YXjeTG6PfPREHJBehGZYhX	Koridor Uçlar	2022-10-30 15:39:36.126+00	2022-10-30 15:39:36.126+00	6pj8zRn3WnYyTFrkXXHC9h	UHi3qgecJ4StH956Bxrp2B
bTP3uEPA3iZsbz4dgkXr28	Koridor Havuz	2022-10-30 15:43:30.172+00	2022-10-30 15:43:30.172+00	R78r5nsUDmNYn3f7qNCTXS	CC3vB4N4NHp46aPc9MYy8o
bYgAJfFUei6FfkDxcsVC8Y	Orta Oda Havuz	2022-10-30 15:50:54.023+00	2022-10-30 15:50:54.023+00	LXVVVN9CwPmpeCBMkv44sL	ZGeN7vyupBfJiEtsYqTmY7
e6mAVkJuGzRJdq6kmidoYi	Koridor Aplik	2022-10-30 15:40:06.011+00	2022-10-30 15:40:06.011+00	LQqCCDRifoFBRvLbL3mYhZ	P63uRSY9K9jp8DqQfHPqtX
eaGvEJoVwT4u2HZtDf4gbz	Sağ Oda Spot	2022-10-30 15:30:00.338+00	2022-10-30 15:30:00.338+00	C5PF8FKbLd3HzPShfyRjNJ	DpSZEnnX24M5qR3W8Prbuw
\.


--
-- Data for Name: app_prefab; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_prefab ("Id", "Name", "Template", "CreatedOn", "ModifiedOn") FROM stdin;
LhkshJXoLRuPp7rgrnSLQX	Wallswitch	{"Name": "Anahtar Grubu", "CallClass": "Wallswitch", "Parameters": {"macAddress": "", "serverIp": "rabbitmq"}, "Functions": [{"Name": "Sol \\u00dcst Anahtar ", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"id": "top-left"}, "Value": "", "CallFunction": "status", "Type": 4, "Class": 2}, {"Comparable": false, "Name": "Renk", "Parameters": {"id": "top-left"}, "Value": "rgba(0,0,0,1)", "CallFunction": "lightColor", "Type": 3, "Class": 4}]}, {"Name": "Sa\\u011f \\u00dcst Anahtar ", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"id": "top-right"}, "Value": "", "CallFunction": "status", "Type": 4, "Class": 2}, {"Comparable": false, "Name": "Renk", "Parameters": {"id": "top-right"}, "Value": "rgba(0,0,0,1)", "CallFunction": "lightColor", "Type": 3, "Class": 4}]}, {"Name": "Sol Alt Anahtar ", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"id": "bottom-left"}, "Value": "", "CallFunction": "status", "Type": 4, "Class": 2}, {"Comparable": false, "Name": "Renk", "Parameters": {"id": "bottom-left"}, "Value": "rgba(0,0,0,1)", "CallFunction": "lightColor", "Type": 3, "Class": 4}]}, {"Name": "Sa\\u011f Alt Anahtar ", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"id": "bottom-right"}, "Value": "", "CallFunction": "status", "Type": 4, "Class": 2}, {"Comparable": false, "Name": "Renk", "Parameters": {"id": "bottom-right"}, "Value": "rgba(0,0,0,1)", "CallFunction": "lightColor", "Type": 3, "Class": 4}]}, {"Name": "Termometre", "Properties": [{"Comparable": true, "Name": "\\u00b0C", "Parameters": {"id": "temperature"}, "Value": "0", "CallFunction": "celcius", "Type": 1, "Class": 1}]}]}	2018-09-15 12:17:56.539+00	2024-06-09 11:32:17.701+00
PqUaBLEy9yq68WCKWGyEbj	IO Extender	{"CallClass": "IOExtender", "Functions": [{"Name": "Role 1", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 0}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 2", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 1}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 3", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 2}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 4", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 3}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 5", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 4}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 6", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 5}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 7", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 6}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 8", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 7}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}], "Name": "Role Mod\\u00fcl\\u00fc", "Parameters": {"Address": 32}}	2018-08-09 23:15:44.765+00	2019-10-29 13:47:57.559+00
Sxh9B4fTuLZBXGioUWScnB	MQTT IO Extender	{"Name": "Mqtt Role Mod\\u00fcl\\u00fc", "CallClass": "IOExtender", "Parameters": {"address": 32, "macAddress": "7C:9E:BD:61:7B:D0", "serverIp": "rabbitmq"}, "Functions": [{"Name": "Role 1", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 0}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 0}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 2", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 1}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 1}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 3", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 2}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 2}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 4", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 3}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 3}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 5", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 4}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 4}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 6", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 5}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 5}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 7", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 6}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 6}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}, {"Name": "Role 8", "Properties": [{"Comparable": false, "Name": "Durum", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "State", "Type": 3, "Class": 3}, {"Comparable": true, "Name": "A\\u00e7\\u0131k S\\u00fcre", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "UpTime", "Type": 1, "Class": 1}, {"Comparable": true, "Name": "Kapal\\u0131 S\\u00fcre", "Parameters": {"Pin": 7}, "Value": "0", "CallFunction": "DownTime", "Type": 1, "Class": 1}, {"Comparable": false, "Name": "Tersine \\u00c7evir", "Parameters": {"Pin": 7}, "Value": "", "CallFunction": "Toggle", "Type": 2, "Class": 8}]}]}	2022-01-29 14:19:31.753+00	2024-03-09 17:25:14.173+00
riq6GFZLpFEzBTbmwqgBWF	Wallwasher	{"CallClass": "Wallwasher", "Functions": [{"Name": "Renk Ge\\u00e7i\\u015fi", "Properties": [{"Comparable": false, "Name": "Renk", "Parameters": {}, "Value": "rgba(0,0,0,0)", "CallFunction": "Color", "Type": 3, "Class": 4}, {"Comparable": false, "Name": "S\\u00fcre", "Parameters": {}, "Value": "0", "CallFunction": "TransitionTime", "Type": 3, "Class": 1}]}], "Name": "Wallwasher", "Parameters": {"Address ": null}}	2018-08-09 23:15:44.765+00	2018-08-09 23:15:56.105+00
\.


--
-- Data for Name: app_property; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_property ("Id", "Name", "CallFunction", "Parameters", "Value", "Type", "Class", "Comparable", "CreatedOn", "ModifiedOn", "Category_id") FROM stdin;
28ZWJvcSik2H3BXnvy6zPM	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2022-01-29 14:25:31.337+00	2022-01-29 14:25:31.337+00	\N
29sGFeMJ9BLp4hkgJm9LtN	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2022-10-29 12:22:20.124+00	2022-10-29 12:22:20.124+00	\N
2CVgMmoJV622LUYKcNRH7U	Durum	status	{"id": "top-left"}	clicked	4	2	f	2024-06-22 09:53:06.911+00	2024-06-22 09:53:06.911+00	\N
2Uu45zbqa4YTTqJpsfeJwq	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2024-03-09 17:24:04.108+00	2024-03-09 17:24:04.108+00	\N
2bHNCivTD6cSDznixS2r8g	Durum	State	{"Pin": 3}	false	3	3	f	2024-01-28 12:59:50.46+00	2024-01-28 12:59:50.46+00	\N
2gtVnbivyE8Eazmqqheq85	Durum	State	{"Pin": 2}	true	3	3	f	2020-03-01 16:25:22.141+00	2020-04-10 16:50:19.015+00	\N
2jbnknpcavGDKmnWjHXQbn	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2019-10-29 11:25:34.339+00	2019-10-29 11:25:34.339+00	\N
2pfLayDaeoDGdueDE5gykC	Durum	State	{"Pin": 2}	0	3	3	f	2024-03-09 09:18:20.551+00	2024-03-09 09:18:20.551+00	\N
2sFZ82rvA3WLymgtEsj66M	Durum	State	{"Pin": 4}	0	3	3	f	2019-10-29 11:25:35.061+00	2019-10-29 11:25:35.061+00	\N
2tAzCuvkyciSdWrWvAwtkH	Durum	State	{"Pin": 4}	false	3	3	f	2023-04-21 11:38:09.45+00	2023-04-21 11:38:09.45+00	\N
2x6nk8Mr5kxYWKaWvX9rhj	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2024-01-28 12:59:46.578+00	2024-01-28 12:59:46.578+00	\N
38iT3w9R3HUuZbNrveSi2a	Durum	status	{"id": "top-left"}	clicked	4	2	f	2024-06-09 11:32:23.701+00	2024-06-09 11:32:23.701+00	\N
3CAEkcyVaNBXaEegzrp9Ys	Tersine Çevir	Toggle	{"Pin": 0}		2	8	f	2024-03-09 09:18:19.079+00	2024-03-09 09:18:19.079+00	\N
3ER5CtZW9hyuxhdAV44G3o	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2022-10-29 12:22:20.121+00	2022-10-29 12:22:20.122+00	\N
3YkQCH3CZ7pupEmebVvpKN	Durum	State	{"Pin": 7}	0	3	3	f	2022-10-29 12:22:20.178+00	2022-10-29 12:22:20.178+00	\N
3nWjMVucFR5ahdNLxjTEv9	Tersine Çevir	Toggle	{"Pin": 7}		2	8	f	2024-03-09 09:18:27.236+00	2024-03-09 09:18:27.236+00	\N
444mAasxzeSJorj45vrvi9	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2022-10-29 12:22:20.172+00	2022-10-29 12:22:20.172+00	\N
48BmEUByDW3hJrt27FnWLE	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2020-03-01 12:23:39.355+00	2020-03-01 12:23:39.355+00	\N
4RttLVNVhEFaxBWw9KyzLd	Durum	State	{"Pin": 0}	false	3	3	f	2019-10-29 11:25:28.706+00	2020-03-01 15:35:32.159+00	\N
4SrdimfGxSA9qVVAMmfwbx	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2022-10-29 12:22:20.053+00	2022-10-29 12:22:20.053+00	\N
4kiJs8ug4PyCzeSgrxXRb5	Durum	State	{"Pin": 6}	0	3	3	f	2022-10-29 12:22:20.164+00	2022-10-29 12:22:20.164+00	\N
4pffdGHmKMr55NiWQ6bfxm	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2020-03-01 13:00:37.219+00	2020-03-01 13:00:37.22+00	\N
52nodgPLPHSifHL7QNdRYt	Durum	State	{"Pin": 1}	false	3	3	f	2024-03-09 17:24:05.075+00	2024-03-09 17:24:05.075+00	\N
5Ng5gqheWeRt28PuppEPix	Durum	status	{"id": "bottom-right"}	long-pressed	4	2	f	2024-09-07 08:01:42.715+00	2024-09-07 08:01:42.715+00	\N
5Z4zbA55pkVFdRQsftLYEz	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2023-04-21 11:38:11.182+00	2023-04-21 11:38:11.182+00	\N
5hA2CXMDENAKeX7EKZy3kY	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2020-03-01 12:22:43.417+00	2020-03-01 12:22:43.417+00	\N
5y97N58p5iXLm3NZy73pJK	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2020-03-01 12:23:10.829+00	2020-03-01 12:23:10.829+00	\N
5zFcxeXnHnn9goaFzn5ddy	Durum	State	{"Pin": 4}	true	3	3	f	2024-03-09 17:24:09.028+00	2024-03-09 17:24:09.028+00	\N
60bocJr7iouWjU4Azd5BHC	°C	celcius	{"id": "temperature"}	21.562500	1	1	t	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00	\N
6C8gZsTgvvvBg64ZF2VhCP	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 17:31:42.884+00	2024-09-07 17:31:42.884+00	\N
6LAXbrqGmpGwTwXwFD8hvm	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2024-01-28 12:59:51.722+00	2024-01-28 12:59:51.722+00	\N
6TZyNMoFaghTt8VHYQZXGF	Durum	State	{"Pin": 6}	false	3	3	f	2023-04-21 11:38:12.182+00	2023-04-21 11:38:12.182+00	\N
6bEwycEHsYCNNWpJcpRoGf	Tersine Çevir	Toggle	{"Pin": 1}		2	8	f	2024-01-28 12:59:48.033+00	2024-01-28 12:59:48.034+00	\N
6izaB3VdP2B953KWvUnwXE	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2019-10-29 11:25:44.167+00	2019-10-29 11:25:44.167+00	\N
6pj8zRn3WnYyTFrkXXHC9h	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2022-01-29 14:25:31.217+00	2022-01-29 14:25:31.217+00	\N
6yEGFDXjBXnXxEQTfUpP3T	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2022-10-29 12:22:20.058+00	2022-10-29 12:22:20.058+00	\N
75JuHjjVULpJ6j8q3FG3aN	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2019-10-29 11:25:34.676+00	2019-10-29 11:25:34.676+00	\N
7BzA7ZSKPp6q8WTXCzC5xg	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2024-03-09 09:18:22.458+00	2024-03-09 09:18:22.458+00	\N
7CtNcKkc9C6fv7EehCXEjN	Durum	State	{"Pin": 6}	false	3	3	f	2024-01-28 12:59:57.999+00	2024-01-28 12:59:57.999+00	\N
7NgbFe2TygwKRYKBgHCvvY	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2024-03-09 17:24:05.273+00	2024-03-09 17:24:05.273+00	\N
7T85pqLDFCjxYhuVeEgjGc	Durum	State	{"Pin": 1}	false	3	3	f	2020-03-01 12:22:03.43+00	2020-04-06 21:34:35.397+00	\N
7WEixTRSA7i7rsCHoWTEP7	Durum	State	{"Pin": 3}	true	3	3	f	2020-03-01 16:25:33.137+00	2020-04-10 16:50:11.265+00	\N
8CEiTUZR4VMpNNdHSX5JhA	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2022-01-29 14:25:30.578+00	2022-01-29 14:25:30.578+00	\N
8CL58tVULwtqfnxhPyPCYX	Durum	State	{"Pin": 5}	0	3	3	f	2022-10-29 12:22:20.149+00	2022-10-29 12:22:20.149+00	\N
8anATegeFUTPcdyKcZrrSP	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2024-06-22 09:53:07.019+00	2024-06-22 09:53:07.019+00	\N
8fffjiSjyrL9PhwfzsxRgW	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2024-03-09 09:18:24.623+00	2024-03-09 09:18:24.623+00	\N
8maCfVkz5j5uh2SRj9z8iY	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2020-03-01 12:22:14.82+00	2020-03-01 12:22:14.82+00	\N
8oCxHsJKVdRrLLXYUneatG	Tersine Çevir	Toggle	{"Pin": 2}		2	8	f	2023-04-21 11:38:07.785+00	2023-04-21 11:38:07.785+00	\N
9DYyGvEhdbTJYZZSKvPfo6	Durum	State	{"Pin": 2}	false	3	3	f	2024-03-09 17:24:06.123+00	2024-03-09 17:24:06.123+00	\N
9KRQ6uVubQ4mkEEg24c9GN	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2022-01-29 14:25:31.169+00	2022-01-29 14:25:31.169+00	\N
9jjwuSrKzby9BJNHcAdgEf	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2020-03-01 16:25:40.495+00	2020-03-01 16:25:40.495+00	\N
9sTmrxTrCZ8QWf3rBA9uds	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2021-09-11 12:44:13.577+00	2022-03-05 14:18:01.96+00	\N
A86WAmqSFApBkQ68bKQp7o	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2024-03-09 09:18:22.201+00	2024-03-09 09:18:22.201+00	\N
AMHgbFxaQ89HoPGFK9bHi4	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2022-01-29 14:25:30.85+00	2022-01-29 14:25:30.85+00	\N
AMQRDgPBo2kH7TuWcq4BMw	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2023-04-21 11:38:12.704+00	2023-04-21 11:38:12.704+00	\N
AacajdY7ecPFSRWxtzXPhV	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2024-01-28 12:59:58.346+00	2024-01-28 12:59:58.346+00	\N
B8yrDxpQ5gmiVeVCGvvEa6	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2020-03-01 13:00:50.881+00	2020-03-01 13:00:50.881+00	\N
BJeDYYcwrxRBVbwHWeXVMA	Durum	status	{"id": "top-right"}	clicked	4	2	f	2024-09-07 17:31:42.864+00	2024-09-07 17:31:42.864+00	\N
BQz6ESsxqYWZc2yu66ar6k	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2024-01-28 12:59:54.077+00	2024-01-28 12:59:54.077+00	\N
BT27DgMLsBrCrNHtUGsmoQ	Tersine Çevir	Toggle	{"Pin": 3}		2	8	f	2024-03-09 09:18:22.732+00	2024-03-09 09:18:22.732+00	\N
BYWtcuRy6tmhBWWYL7CVnG	Durum	State	{"Pin": 6}	0	3	3	f	2024-03-09 17:24:11.894+00	2024-03-09 17:24:11.894+00	\N
Bg5eVbqRzA6TDYVaM99ces	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2022-01-29 14:25:30.799+00	2022-01-29 14:25:30.799+00	\N
BmCLKH2N7Av3riFo77wgFH	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2019-10-29 11:25:32.231+00	2019-10-29 11:25:32.231+00	\N
BppB6XmUPJ6CMBGad3ttYX	Durum	State	{"Pin": 4}	false	3	3	f	2024-01-28 12:59:53.141+00	2024-01-28 12:59:53.141+00	\N
BzmQ7tzSHqjKc7xKW8htVA	Durum	State	{"Pin": 6}	false	3	3	f	2022-01-29 14:25:31.265+00	2022-01-29 14:25:31.265+00	\N
C5PF8FKbLd3HzPShfyRjNJ	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2022-01-29 14:25:30.603+00	2022-01-29 14:25:30.603+00	\N
CBctmAykmQxLgW4diFXvgX	Tersine Çevir	Toggle	{"Pin": 5}		2	8	f	2024-01-28 12:59:57.181+00	2024-01-28 12:59:57.181+00	\N
CC3vB4N4NHp46aPc9MYy8o	Durum	State	{"Pin": 2}	false	3	3	f	2022-10-29 12:22:20.098+00	2022-10-29 12:22:20.098+00	\N
CJnRPy22kigToquEoMuF3a	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2024-06-09 11:32:23.716+00	2024-06-09 11:32:23.716+00	\N
CT7o4ts6utbQhmLDUnGCp4	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2022-10-29 12:22:20.169+00	2022-10-29 12:22:20.169+00	\N
CaCdB9eBWAECJJtDCR5vEf	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2024-03-09 09:18:27.036+00	2024-03-09 09:18:27.036+00	\N
CjakRHXXEzYhd8cU3Ghvm6	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2022-01-29 14:25:31.43+00	2022-01-29 14:25:31.43+00	\N
CmC7FnF9sDhw6aZN5JQsvN	Durum	State	{"Pin": 7}	false	3	3	f	2024-03-09 17:24:13.108+00	2024-03-09 17:24:13.108+00	\N
CpVoKSVkLDu46rjB5VJpff	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2022-10-29 12:22:20.127+00	2022-10-29 12:22:20.127+00	\N
Cq6iSAQzuQ5ph3A7JRKYcJ	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2019-10-29 11:25:35.605+00	2019-10-29 11:25:35.605+00	\N
CvRct2M83k8sX9uFoPsYjM	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2024-01-28 13:00:01.519+00	2024-01-28 13:00:01.519+00	\N
D6ptRkfYjb8KFiAHbipMhH	Tersine Çevir	Toggle	{"Pin": 4}		2	8	f	2024-03-09 17:24:09.701+00	2024-03-09 17:24:09.702+00	\N
DBxMvhHYrthP4C3iRHWLrU	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2020-03-01 16:25:38.432+00	2020-03-01 16:25:38.432+00	\N
DQSmQ4tsknB6rwQ2W9aLjZ	Durum	State	{"Pin": 2}	0	3	3	f	2020-03-01 13:00:48.09+00	2020-03-01 13:00:48.09+00	\N
DREXNkG8Dt2wEJ7wvgJWcG	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2020-03-01 13:00:23.653+00	2020-03-01 13:00:23.653+00	\N
DbjZwZB2afmvXZryYbAc6f	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2021-09-11 12:44:13.475+00	2022-03-05 14:18:02.002+00	\N
DbwYyXZT9xHrfp4z7sSAeP	Durum	State	{"Pin": 0}	false	3	3	f	2024-03-09 17:24:03.884+00	2024-03-09 17:24:03.884+00	\N
DpSZEnnX24M5qR3W8Prbuw	Durum	State	{"Pin": 0}	false	3	3	f	2022-01-29 14:25:30.527+00	2022-03-05 14:16:57.179+00	\N
DrovcRG5GzBwXTawHJfhzT	Tersine Çevir	Toggle	{"Pin": 6}		2	8	f	2024-01-28 12:59:59.507+00	2024-01-28 12:59:59.507+00	\N
E4VNLRpAPGdgWJervUmKL4	Durum	State	{"Pin": 1}	0	3	3	f	2020-03-01 13:00:33.899+00	2020-03-01 13:00:33.9+00	\N
E8DYfeEf75EiHfPBS6dhXo	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2022-10-29 12:22:20.079+00	2022-10-29 12:22:20.079+00	\N
EJYNJvPcmNYJ8jZMFAztkB	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2023-04-21 11:38:05.139+00	2023-04-21 11:38:05.139+00	\N
EJmzsYNwdbHf2hpZtcJq9z	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2021-09-11 12:44:13.537+00	2021-09-11 12:44:13.537+00	\N
EUhBBX6gPuSRAfoHQJFxW9	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2024-06-09 11:32:23.757+00	2024-06-09 11:32:23.757+00	\N
EYLiHZhbp8RbqKpPo7yU8z	°C	celcius	{"id": "temperature"}	21.937500	1	1	t	2025-05-03 12:58:20.541+00	2025-05-03 12:58:20.541+00	\N
Ecz99FmNBkCyFpvuzYNvKx	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2022-01-29 14:25:31.312+00	2022-01-29 14:25:31.312+00	\N
EdYcAAyLfWdBtz9t8MU9fg	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2020-03-01 12:23:08.115+00	2020-03-01 12:23:08.115+00	\N
EegTgWesYXokaEemaNo6BA	Durum	State	{"Pin": 0}	true	3	3	f	2020-03-01 13:00:16.315+00	2020-03-01 16:12:46.171+00	\N
EexADLnUQMWTuz7z3XHLEu	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2022-01-29 14:25:30.825+00	2022-01-29 14:25:30.825+00	\N
Eos3ebFixNEXCF26hRRozm	Renk	lightColor	{"id": "bottom-right"}	rgba(0,10,0,1.0)	3	4	f	2024-06-09 11:32:23.854+00	2024-06-09 11:32:23.854+00	\N
EyPwxhMTsFLUEmugNaFuZ3	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2024-03-09 17:24:05.473+00	2024-03-09 17:24:05.473+00	\N
F76voSsqoX9wWiJijopH6g	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2024-03-09 17:24:04.32+00	2024-03-09 17:24:04.32+00	\N
FDF4MaE3U94J33YgLYWnLi	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 08:01:42.615+00	2024-09-07 08:01:42.615+00	\N
FDcVH45SQiepFLWc2DxABh	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2020-03-01 12:23:37.87+00	2020-03-01 12:23:37.87+00	\N
FFRtSEayfHZTQTyMiR5GPe	Durum	State	{"Pin": 7}	0	3	3	f	2024-03-09 09:18:26.634+00	2024-03-09 09:18:26.634+00	\N
FGaWpSWBQHBAf72Wtvb3WK	Durum	State	{"Pin": 5}	0	3	3	f	2020-03-01 12:23:06.66+00	2020-03-01 12:23:06.66+00	\N
FMzkBVSYuzXT2qqYkM6QdV	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2022-01-29 14:25:30.553+00	2022-01-29 14:25:30.553+00	\N
FRd9dLj4wLLQv65EKV9RZC	Tersine Çevir	Toggle	{"Pin": 1}		2	8	f	2023-04-21 11:38:06.753+00	2023-04-21 11:38:06.753+00	\N
FccwF9tLvNkg6n2Bqomrpc	Durum	State	{"Pin": 1}	0	3	3	f	2023-04-21 11:38:06.011+00	2023-04-21 11:38:06.011+00	\N
FmZgQyPVpudBA2vBZLHZE2	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2022-10-29 12:22:20.108+00	2022-10-29 12:22:20.108+00	\N
FsPYeKcJ4wiKpsWRzsmhKh	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2019-10-29 11:25:36.335+00	2019-10-29 11:25:36.335+00	\N
G4PqhGMnjp2TNcmhbapvHc	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2020-03-01 13:01:53.001+00	2020-03-01 13:01:53.001+00	\N
GGrzLN8usQJ8LeGz7zDucz	Tersine Çevir	Toggle	{"Pin": 0}		2	8	f	2024-03-09 17:24:04.641+00	2024-03-09 17:24:04.641+00	\N
GHPADMwN3NH2mFb3ss3E8B	Durum	State	{"Pin": 1}	false	3	3	f	2019-10-29 11:25:31.87+00	2020-03-01 12:35:10.686+00	\N
GTHKUtBTxDJFuSzzKSV3aS	Durum	State	{"Pin": 6}	0	3	3	f	2019-10-29 11:25:36.874+00	2019-10-29 11:25:36.874+00	\N
GUAVQqPWY7YtKeMLvSoQq2	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2020-03-01 13:01:32.173+00	2020-03-01 13:01:32.173+00	\N
GWcvH5jz96c7zRVQezWYqY	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2020-03-01 12:22:09.221+00	2020-03-01 12:22:09.221+00	\N
GiPNvrzd9de8YCnSYzGk42	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2020-03-01 12:22:55.649+00	2020-03-01 12:22:55.649+00	\N
GizNuhkAEeBpN7wpeMpSxk	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2020-03-01 16:25:47.573+00	2020-03-01 16:25:47.573+00	\N
GmDSDnSyoHHwxiwRx8d5ZE	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2020-03-01 13:01:53.667+00	2020-03-01 13:01:53.667+00	\N
GySTekJMn2cXHAhBC9WTbV	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2019-10-29 11:25:32.064+00	2019-10-29 11:25:32.064+00	\N
H3yCozys9Hnr9eLCP7bRcE	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2019-10-29 11:25:42.664+00	2019-10-29 11:25:42.664+00	\N
H5584ySuh5FJWDJy3CEzs5	Durum	State	{"Pin": 7}	false	3	3	f	2023-04-21 11:38:13.436+00	2023-04-21 11:38:13.436+00	\N
HEjEoSPAKFJXwFABhXoKyt	Durum	State	{"Pin": 3}	false	3	3	f	2022-10-29 12:22:20.118+00	2022-10-29 12:22:20.118+00	\N
HNGBqxVqjgnegRQG2SDWXq	Tersine Çevir	Toggle	{"Pin": 3}		2	8	f	2024-01-28 12:59:52.24+00	2024-01-28 12:59:52.24+00	\N
HVQU5HqUhuxTHV3b5399VM	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2023-04-21 11:38:08.625+00	2023-04-21 11:38:08.625+00	\N
HbxRFaWHbbf67eBwqErWGK	Durum	State	{"Pin": 7}	0	3	3	f	2019-10-29 11:25:41.165+00	2019-10-29 11:25:41.165+00	\N
Hyg66YYzN6USKjag9czmrj	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2020-03-01 12:23:01.136+00	2020-03-01 12:23:01.136+00	\N
Hzc2GSRXTzQSw3ao6Btv9K	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2020-03-01 16:25:15.627+00	2020-03-01 16:25:15.627+00	\N
J5oTk63FYWDrBu7GztChUB	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2024-06-22 09:53:06.926+00	2024-06-22 09:53:06.926+00	\N
JGSFESpP5AmeRYLrgwANyi	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2019-10-29 11:25:34.508+00	2019-10-29 11:25:34.508+00	\N
JSqvg4dzJ62XTJ7TnGUW9d	Durum	State	{"Pin": 1}	0	3	3	f	2024-01-28 12:59:47.309+00	2024-01-28 12:59:47.309+00	\N
JWMzoioqmv9bKmwphSvMDh	Tersine Çevir	Toggle	{"Pin": 5}		2	8	f	2024-03-09 09:18:25.197+00	2024-03-09 09:18:25.197+00	\N
JXhUaLwF8vzvcgL3Lzf3os	Durum	status	{"id": "top-left"}	clicked	4	2	f	2024-09-07 08:01:42.599+00	2024-09-07 08:01:42.599+00	\N
JZfWAk3kRGHYgF8wpC2n3U	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2023-04-21 11:38:13.879+00	2023-04-21 11:38:13.879+00	\N
K84HQtn3SGcptEYxyv9DQa	Durum	State	{"Pin": 4}	0	3	3	f	2020-03-01 13:01:21.969+00	2020-03-01 13:01:21.969+00	\N
KBcAmf9xhzc3cJiRX7MnkW	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2022-01-29 14:25:31.454+00	2022-01-29 14:25:31.454+00	\N
KMFfQDchmLDK5ms5Ahw3iD	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2020-03-01 13:01:25.859+00	2020-03-01 13:01:25.859+00	\N
KVu64mETAgFgRFXX8wAgjd	Durum	State	{"Pin": 7}	false	3	3	f	2024-01-28 13:00:01.013+00	2024-01-28 13:00:01.013+00	\N
KXKJc5gVmNiZ4CPqvqguNo	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2020-03-01 16:25:26.734+00	2020-03-01 16:25:26.734+00	\N
KbeVAF7RmJSfqBAeRN66tR	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2023-04-21 11:38:09.882+00	2023-04-21 11:38:09.883+00	\N
Kg6tQbV68EtsPRRfJ9sTUj	Durum	State	{"Pin": 2}	false	3	3	f	2024-01-28 12:59:48.755+00	2024-01-28 12:59:48.755+00	\N
KhH7JRisVCuBbmd99U2HKj	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2020-03-01 12:22:12.031+00	2020-03-01 12:22:12.031+00	\N
KnhSvcaUbrHBYwusT9JLbA	Durum	State	{"Pin": 1}	0	3	3	f	2024-03-09 09:18:19.445+00	2024-03-09 09:18:19.445+00	\N
L2Ks9nB5dgkgxoAop6D6aw	Durum	State	{"Pin": 6}	0	3	3	f	2024-03-09 09:18:25.613+00	2024-03-09 09:18:25.613+00	\N
L8RckrLxroL5JjW8obhoX2	Tersine Çevir	Toggle	{"Pin": 3}		2	8	f	2024-03-09 17:24:08.562+00	2024-03-09 17:24:08.562+00	\N
LBRTvff5qP8HKUNZTxQ2Pc	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2024-01-28 12:59:53.564+00	2024-01-28 12:59:53.564+00	\N
LK9aY2hvvcmrUPRbS5HxU9	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2022-10-29 12:22:20.18+00	2022-10-29 12:22:20.18+00	\N
LQqCCDRifoFBRvLbL3mYhZ	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2022-01-29 14:25:31.09+00	2022-01-29 14:25:31.09+00	\N
LRnWZvwc7EhTdqQ5ybdEJC	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2023-04-21 11:38:07.609+00	2023-04-21 11:38:07.609+00	\N
LUhLVM5uJjCSLRqqnR3sZi	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2024-03-09 09:18:18.895+00	2024-03-09 09:18:18.895+00	\N
LV7Lfx64mm5mBJPVnR8tPL	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2022-10-29 12:22:20.167+00	2022-10-29 12:22:20.167+00	\N
LXVVVN9CwPmpeCBMkv44sL	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2022-10-29 12:22:20.089+00	2022-10-29 12:22:20.089+00	\N
LY2zosBqvRPFxwHewfq6VL	Durum	State	{"Pin": 7}	true	3	3	f	2020-03-01 13:01:55.496+00	2020-04-10 16:50:07.913+00	\N
LiN5mQSQsS85EfepeSKVGR	Durum	State	{"Pin": 2}	false	3	3	f	2023-04-21 11:38:07.202+00	2023-04-21 11:38:07.203+00	\N
LudPrrTfi8HyvaNYxKXrAK	Renk	lightColor	{"id": "bottom-right"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 08:01:42.728+00	2024-09-07 08:01:42.728+00	\N
LzEby7h2FpSCmrpQLDc7NS	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2020-03-01 13:00:55.007+00	2020-03-01 13:00:55.007+00	\N
M02XgcDBtaUNPkonsbvMAm	°C	celcius	{"id": "temperature"}	22.312500	1	1	t	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00	\N
M6ixPu787bgZ5qQpeUs7x4	Durum	State	{"Pin": 4}	0	3	3	f	2022-10-29 12:22:20.136+00	2022-10-29 12:22:20.136+00	\N
MokPcUSRyUgPefmNBsjPNG	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2020-03-01 16:25:20.35+00	2020-03-01 16:25:20.35+00	\N
Mu32D4DnSaeaKUktePqp77	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2022-01-29 14:25:30.676+00	2022-01-29 14:25:30.677+00	\N
Mu3LYmkfYb68R8GLS3buWN	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2024-03-09 09:18:23.798+00	2024-03-09 09:18:23.798+00	\N
N3sy9LDVLVdTirGtHyGP9A	Durum	State	{"Pin": 5}	0	3	3	f	2024-03-09 09:18:24.356+00	2024-03-09 09:18:24.356+00	\N
NF8FwhKcF8mtqoaQBYSDca	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2022-10-29 12:22:20.157+00	2022-10-29 12:22:20.157+00	\N
NGX5kdqvAALi2dw5PJ2jG2	Durum	State	{"Pin": 1}	true	3	3	f	2020-03-01 16:25:17.539+00	2020-04-10 16:50:20.348+00	\N
NhYBWGJwhbyxo8g2REq86L	Renk	lightColor	{"id": "bottom-right"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 17:31:42.977+00	2024-09-07 17:31:42.977+00	\N
NqzNDTsP3w2MftXhY44aRE	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2020-03-01 12:22:21.773+00	2020-03-01 12:22:21.773+00	\N
P63uRSY9K9jp8DqQfHPqtX	Durum	State	{"Pin": 4}	false	3	3	f	2022-01-29 14:25:31.018+00	2022-01-29 14:25:31.018+00	\N
P8EfC6Tz8mJFu4ZCVH4jWQ	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2020-03-01 16:25:24.298+00	2020-03-01 16:25:24.298+00	\N
PPxCZFZWFkjiXqdp8co5gd	Durum	State	{"Pin": 6}	0	3	3	f	2020-03-01 12:23:20.548+00	2020-03-01 12:23:20.548+00	\N
PS8Hm4nDi9xiidzf2w4Y2b	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2024-03-09 17:24:08.321+00	2024-03-09 17:24:08.322+00	\N
PVRpQnv4UezHiEaw8GwEXS	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2024-01-28 12:59:58.631+00	2024-01-28 12:59:58.631+00	\N
PcBBgq6wSbjbqvFa5U3LMY	Durum	State	{"Pin": 4}	0	3	3	f	2024-03-09 09:18:23.388+00	2024-03-09 09:18:23.388+00	\N
PdWGrXzBZHBLehTLF5HP5G	Tersine Çevir	Toggle	{"Pin": 1}		2	8	f	2024-03-09 17:24:05.706+00	2024-03-09 17:24:05.706+00	\N
PgUmw3i2jGQhUDdsxFEmBc	Durum	status	{"id": "top-right"}	clicked	4	2	f	2024-06-09 11:32:23.742+00	2024-06-09 11:32:23.742+00	\N
Pj6QQSQTaeJoMdFyKHgkbe	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2024-06-09 11:32:23.796+00	2024-06-09 11:32:23.796+00	\N
Pp8Z2xrwaZXuHoUAMTHgs2	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2019-10-29 11:25:37.597+00	2019-10-29 11:25:37.597+00	\N
Q6CPMm3YvqVEqBfY35zLB4	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2020-03-01 13:00:16.813+00	2020-03-01 13:00:16.813+00	\N
Q7G3PNreAUYvnB87vHGXL5	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2020-03-01 16:25:54.682+00	2020-03-01 16:25:54.682+00	\N
Q7fbuecJcPGfA8XeJ5Gijm	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2024-03-09 09:18:25.813+00	2024-03-09 09:18:25.813+00	\N
QH9MauWDhx4YChu8m8qDNC	Renk	lightColor	{"id": "bottom-right"}	rgba(0,10,0,1.0)	3	4	f	2024-06-22 09:53:07.064+00	2024-06-22 09:53:07.064+00	\N
QKPPtJ52yQfHtVxrJCBgTG	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2024-01-28 12:59:49.367+00	2024-01-28 12:59:49.367+00	\N
QTGVXtB4HD5MX3Y7kJXk5V	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2023-04-21 11:38:14.062+00	2023-04-21 11:38:14.062+00	\N
QZa7w62e4gMPVYE2mX5ov6	Durum	State	{"Pin": 0}	false	3	3	f	2022-10-29 12:22:20.04+00	2022-10-29 12:22:20.04+00	\N
Qo2u3ADMPH8erSKBGAN64r	Tersine Çevir	Toggle	{"Pin": 4}		2	8	f	2024-01-28 12:59:54.937+00	2024-01-28 12:59:54.937+00	\N
QogfFao5mE5mNAgu2bKk2o	Tersine Çevir	Toggle	{"Pin": 2}		2	8	f	2024-03-09 17:24:07.109+00	2024-03-09 17:24:07.11+00	\N
QtKH3DqKaD3uJZSk5LJcVz	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2024-01-28 12:59:46.22+00	2024-01-28 12:59:46.22+00	\N
R5dPBrLWhh64BuNDhVHTsa	Durum	State	{"Pin": 0}	0	3	3	f	2024-01-28 12:59:45.97+00	2024-01-28 12:59:45.97+00	\N
R78r5nsUDmNYn3f7qNCTXS	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2022-10-29 12:22:20.111+00	2022-10-29 12:22:20.111+00	\N
RFnLeMeEaMRx6BKz3S22p5	Durum	State	{"Pin": 3}	0	3	3	f	2022-01-29 14:25:30.898+00	2022-01-29 14:25:30.898+00	\N
RKZxMMp6o9LT9WY46TyFbK	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2025-05-03 12:58:20.425+00	2025-05-03 12:58:20.425+00	\N
RaTTj4WLsXXuWC7jtySsfe	Durum	State	{"Pin": 2}	false	3	3	f	2019-10-29 11:25:32.752+00	2019-10-29 15:13:43.969+00	\N
RpHfgfSScuXiS4Bg5qsMhG	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2022-10-29 12:22:20.064+00	2022-10-29 12:22:20.064+00	\N
RrfGZkqcchg2Scwu5LWtQ9	Durum	status	{"id": "top-right"}	clicked	4	2	f	2024-09-07 08:01:42.641+00	2024-09-07 08:01:42.641+00	\N
S0TzfUbudm2F5eoVLTXjeC	°C	celcius	{"id": "temperature"}	22.875000	1	1	t	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00	\N
S6jceGTKauLLCvxJppJzrc	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 08:01:42.689+00	2024-09-07 08:01:42.689+00	\N
S72MUtgs52R3DHbK8shaEf	Durum	State	{"Pin": 5}	false	3	3	f	2023-04-21 11:38:10.588+00	2023-04-21 11:38:10.589+00	\N
S82XKuZUA5KEY9pusU58rL	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2019-10-29 11:25:36.148+00	2019-10-29 11:25:36.148+00	\N
SFDA9PzwCr573uAcALwkLd	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2024-09-07 08:01:42.677+00	2024-09-07 08:01:42.677+00	\N
Sd4XdeTD34KQtSYoJTp2rL	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2020-03-01 16:25:44.371+00	2020-03-01 16:25:44.371+00	\N
SfVskPGvAfAGYEZBd5GnNB	Durum	status	{"id": "bottom-right"}	clicked	4	2	f	2024-09-07 17:31:42.962+00	2024-09-07 17:31:42.962+00	\N
SkdijQhd4Jy8r7fT7RxPvT	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2022-10-29 12:22:20.154+00	2022-10-29 12:22:20.155+00	\N
Snpt2bfJYtKityqAZ34jbN	Durum	State	{"Pin": 4}	false	3	3	f	2020-03-01 16:25:39.669+00	2020-04-06 22:24:08.944+00	\N
StvKvGmY4wNdVJsKV2aJfQ	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2024-03-09 17:24:09.472+00	2024-03-09 17:24:09.473+00	\N
Sv3NZCu3gtDhEdZHn9YkCD	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2020-03-01 13:01:30.248+00	2020-03-01 13:01:30.248+00	\N
T3rfuU5SJdKQw5EipDsKgd	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2022-10-29 12:22:20.085+00	2022-10-29 12:22:20.085+00	\N
TB8YTDz558wyzmVFhH2sBH	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2024-03-09 09:18:23.598+00	2024-03-09 09:18:23.598+00	\N
TGpzdTeiXUeZbTYs4dDEvh	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2020-03-01 16:25:51.658+00	2020-03-01 16:25:51.658+00	\N
Ta3ytZqYHu5BoWW5gQVwd9	Durum	State	{"Pin": 2}	false	3	3	f	2022-01-29 14:25:30.774+00	2022-03-05 14:16:53.594+00	\N
Tjj6dj9AdkRdreRkhqH82i	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2020-03-01 16:25:52.849+00	2020-03-01 16:25:52.849+00	\N
Tjr8SwUWAGcFeuNip8ZNzV	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2020-03-01 13:01:57.687+00	2020-03-01 13:01:57.687+00	\N
TkTzkNHmxoLqyF8jmqL9iZ	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2022-01-29 14:25:31.407+00	2022-01-29 14:25:31.407+00	\N
TmnCKLwrsxvSAXiL5DuWjm	Tersine Çevir	Toggle	{"Pin": 4}		2	8	f	2023-04-21 11:38:10.149+00	2023-04-21 11:38:10.149+00	\N
Tmqxn4nGoszNrkomdT2c4P	Durum	State	{"Pin": 0}	false	3	3	f	2023-04-21 11:38:04.936+00	2023-04-21 11:38:04.937+00	\N
U8dCUW8URRBUErX56KqETp	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2023-04-21 11:38:12.471+00	2023-04-21 11:38:12.471+00	\N
UAAXkgzZW4PnTH6uv8R7Pm	Tersine Çevir	Toggle	{"Pin": 0}		2	8	f	2023-04-21 11:38:05.611+00	2023-04-21 11:38:05.611+00	\N
UASmoGkG6hq3k37CKHPYYo	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2024-09-07 17:31:42.914+00	2024-09-07 17:31:42.914+00	\N
UHi3qgecJ4StH956Bxrp2B	Durum	State	{"Pin": 5}	false	3	3	f	2022-01-29 14:25:31.147+00	2022-01-29 14:25:31.147+00	\N
UUFauEEoSadt3dGLG3AXog	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2020-03-01 12:21:57.873+00	2020-03-01 12:21:57.873+00	\N
UvE4xmwkvPSXKtcbaJKT24	Durum	status	{"id": "top-left"}	clicked	4	2	f	2021-09-11 12:44:13.454+00	2022-01-30 19:13:58.065+00	\N
V9WYBufRe2td4jB3vormXA	Tersine Çevir	Toggle	{"Pin": 6}		2	8	f	2024-03-09 09:18:26.221+00	2024-03-09 09:18:26.221+00	\N
VPZLM9VyaqWmD6MJvjn9LZ	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2024-01-28 12:59:47.809+00	2024-01-28 12:59:47.809+00	\N
VSHF6rC9fuWapi3uEh7fr6	Durum	status	{"id": "top-left"}	clicked	4	2	f	2025-05-03 12:58:20.315+00	2025-05-03 12:58:20.315+00	\N
VVSk7W4jXryhVMbLjYr7dZ	Durum	State	{"Pin": 7}	false	3	3	f	2022-01-29 14:25:31.383+00	2022-01-29 14:25:31.383+00	\N
VWhLJLYuXNMxHfM9W2i2w2	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2020-03-01 12:21:56.445+00	2020-03-01 12:21:56.446+00	\N
VbDY9stgF3GXcmQxnZEH8U	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2024-03-09 09:18:18.704+00	2024-03-09 09:18:18.704+00	\N
VhpChmQytH3taer3mMrmHK	Durum	State	{"Pin": 3}	false	3	3	f	2020-03-01 12:22:39.28+00	2020-04-09 17:27:52.118+00	\N
VtRdXuhSMGcfPwpMKkJMN9	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2020-03-01 12:22:27.107+00	2020-03-01 12:22:27.107+00	\N
VweZiQkpaVPTrphyTFQjLv	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2024-03-09 09:18:26.836+00	2024-03-09 09:18:26.836+00	\N
WFMsQsj9hpPxNpGLh4FsAW	Durum	status	{"id": "top-right"}	clicked	4	2	f	2024-06-22 09:53:06.959+00	2024-06-22 09:53:06.959+00	\N
WHVLNLWAytjLxFht7k9aU8	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2020-03-01 16:25:39.851+00	2020-03-01 16:25:39.851+00	\N
WKH74UhLYa3kQv899vRN4a	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2020-03-01 16:25:42.863+00	2020-03-01 16:25:42.863+00	\N
WPiQpxmezTFZTzCu6tTh6Z	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2019-10-29 11:25:29.763+00	2019-10-29 11:25:29.763+00	\N
Wduj7NUt9SSaJPnUvW4Ujj	Tersine Çevir	Toggle	{"Pin": 2}		2	8	f	2024-01-28 12:59:49.695+00	2024-01-28 12:59:49.695+00	\N
WmPebwkGjYRLtrFjQsVXqT	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2020-03-01 16:25:14.992+00	2020-03-01 16:25:14.992+00	\N
XD8tJ57Dk8fs33vHNrPAKT	Durum	State	{"Pin": 6}	0	3	3	f	2020-03-01 13:01:45.03+00	2020-03-01 13:01:45.03+00	\N
XPtNNJHJCucKRDGfiA3UXw	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2023-04-21 11:38:06.511+00	2023-04-21 11:38:06.511+00	\N
Xcgsq4QdRBjLDk4T59tLpW	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2025-05-03 12:58:20.452+00	2025-05-03 12:58:20.452+00	\N
XpNGAJuFMCzoBmxksQHMRi	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2019-10-29 11:25:36.506+00	2019-10-29 11:25:36.506+00	\N
XsJmBW84P7GyF8r6KHJXr2	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2024-03-09 17:24:11.226+00	2024-03-09 17:24:11.226+00	\N
Y3z3ZwfYQbwS5XVhNbHsfj	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2022-10-29 12:22:20.144+00	2022-10-29 12:22:20.144+00	\N
YAzYws2ZrLAen8kKehkA2f	Tersine Çevir	Toggle	{"Pin": 1}		2	8	f	2024-03-09 09:18:20.14+00	2024-03-09 09:18:20.14+00	\N
YSR47xJsZsYUT9zFhkgtwR	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2020-03-01 12:21:54.46+00	2020-03-01 12:21:54.46+00	\N
Ymh4SV53AFMwxsmgvx3DbL	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2019-10-29 11:25:38.799+00	2019-10-29 11:25:38.799+00	\N
ZEUjFHJYLX9zCdNSwQU6gd	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2022-01-29 14:25:31.192+00	2022-01-29 14:25:31.192+00	\N
ZF6kCUtXmD88gDCN5CmnjC	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2023-04-21 11:38:06.219+00	2023-04-21 11:38:06.219+00	\N
ZGeN7vyupBfJiEtsYqTmY7	Durum	State	{"Pin": 1}	false	3	3	f	2022-10-29 12:22:20.074+00	2022-10-29 12:22:20.074+00	\N
ZUHmH4eiDM9YgtDYDPGdmy	Durum	status	{"id": "top-right"}	clicked	4	2	f	2021-09-11 12:44:13.516+00	2022-03-05 14:18:03.211+00	\N
Zauy5YfBW9WxTnoC9LDkjT	Durum	State	{"Pin": 3}	0	3	3	f	2024-03-09 09:18:21.966+00	2024-03-09 09:18:21.966+00	\N
ZiYUw8L9evTcM8ET7nZoe9	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2024-03-09 17:24:12.382+00	2024-03-09 17:24:12.382+00	\N
ZjKPV6cXrFQRR3LgXKZhxM	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2020-03-01 13:01:57.029+00	2020-03-01 13:01:57.029+00	\N
Zsy5iG2pU2dNBmQTMeRRVK	Tersine Çevir	Toggle	{"Pin": 5}		2	8	f	2023-04-21 11:38:11.414+00	2023-04-21 11:38:11.414+00	\N
ZtQQf6PybfkxjJzKaNRgLb	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2022-01-29 14:25:31.289+00	2022-01-29 14:25:31.289+00	\N
ZtguMnd7cLfu8aBv2mb4JN	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2024-01-28 12:59:47.527+00	2024-01-28 12:59:47.527+00	\N
ZzoL8uzUMthSpsA4wXZ93z	Tersine Çevir	Toggle	{"Pin": 0}		2	8	f	2024-01-28 12:59:46.843+00	2024-01-28 12:59:46.843+00	\N
a0JbeTesvLmmYGK58LqwVB	°C	celcius	{"id": "temperature"}	24.250000	1	1	t	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00	\N
a3vxYBw7ZoyNoeemniBPuJ	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2022-01-29 14:25:30.92+00	2022-01-29 14:25:30.92+00	\N
a4FwyGD7Ybd9GyGTbBucLN	Durum	State	{"Pin": 1}	false	3	3	f	2022-01-29 14:25:30.653+00	2022-01-29 14:25:30.653+00	\N
a6MZ38CzZBwQuUMZWfYfKn	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2024-03-09 17:24:12.15+00	2024-03-09 17:24:12.15+00	\N
aBRk5ppcYvxk4pTtAxzhw9	Tersine Çevir	Toggle	{"Pin": 3}		2	8	f	2023-04-21 11:38:09.033+00	2023-04-21 11:38:09.034+00	\N
aBdiMi8F8fcgfqCXCpK3Fy	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2024-01-28 13:00:01.904+00	2024-01-28 13:00:01.904+00	\N
aezyMfcEcQvXAJTPXYWdA7	Durum	State	{"Pin": 3}	false	3	3	f	2023-04-21 11:38:08.434+00	2023-04-21 11:38:08.434+00	\N
aoeKQgrj6HqpeddwHyxrf2	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2024-06-09 11:32:23.783+00	2024-06-09 11:32:23.783+00	\N
apYi5PpWHFjRxEKskjVE4e	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2025-05-03 12:58:20.465+00	2025-05-03 12:58:20.465+00	\N
avkWnfP45rokoVvXhRRFgR	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2022-10-29 12:22:20.185+00	2022-10-29 12:22:20.185+00	\N
beRVoeQQihmPT3QnE3DANG	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2020-03-01 16:25:23.654+00	2020-03-01 16:25:23.654+00	\N
bkrt8PANj5RinaPb3CkdYY	Durum	State	{"Pin": 5}	false	3	3	f	2020-03-01 16:25:42.717+00	2020-04-06 22:24:24.018+00	\N
byGkZUJUqHJ6snnCGmgjw6	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2021-09-11 12:44:13.597+00	2021-09-11 12:44:13.597+00	\N
c5fJnKwkkAhDD6xVq7BHeG	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2024-03-09 09:18:21.076+00	2024-03-09 09:18:21.076+00	\N
cBfJMbvhxUPCjeSRDJRghk	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 08:01:42.653+00	2024-09-07 08:01:42.653+00	\N
cTUzBXbnCkvbtmuWyXXpky	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2022-01-29 14:25:31.065+00	2022-01-29 14:25:31.065+00	\N
cXpR4tYqpvRqKwVCc2eya5	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2024-03-09 17:24:06.597+00	2024-03-09 17:24:06.597+00	\N
ceTNKRUNpMPgE3FrNmzpQm	Renk	lightColor	{"id": "top-right"}	rgba(0,10,0,1.0)	3	4	f	2024-06-22 09:53:06.971+00	2024-06-22 09:53:06.971+00	\N
cjBEXbJnhJeBiWBBeZCxPB	Tersine Çevir	Toggle	{"Pin": 5}		2	8	f	2024-03-09 17:24:11.442+00	2024-03-09 17:24:11.442+00	\N
coXyp55DDgCkCy4pRujQue	Durum	State	{"Pin": 5}	false	3	3	f	2024-01-28 12:59:55.835+00	2024-01-28 12:59:55.835+00	\N
cpFQNYycvY5qX7xLksCtTF	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2020-03-01 12:23:26.17+00	2020-03-01 12:23:26.17+00	\N
cswG7RYo3GDwefDTMZG7xu	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2022-10-29 12:22:20.152+00	2022-10-29 12:22:20.152+00	\N
cvVYt3kCvCFSJ2opGnJFGn	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2020-03-01 12:23:21.18+00	2020-03-01 12:23:21.181+00	\N
cyQ9LdusdZDY7jAC5wp2ki	Tersine Çevir	Toggle	{"Pin": 7}		2	8	f	2024-01-28 13:00:02.233+00	2024-01-28 13:00:02.233+00	\N
dEcQMGhLQWzSkbMLUb6DCa	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2024-03-09 17:24:06.364+00	2024-03-09 17:24:06.364+00	\N
dKD8xkHJ7nWkL4Zsqku9CF	Durum	State	{"Pin": 0}	0	3	3	f	2024-03-09 09:18:18.503+00	2024-03-09 09:18:18.503+00	\N
dTyqNAJhzrDvDC4XzX3ZPG	Tersine Çevir	Toggle	{"Pin": 2}		2	8	f	2024-03-09 09:18:21.459+00	2024-03-09 09:18:21.459+00	\N
dXGBk3NG5PNFH2s4SScdDB	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 17:31:42.824+00	2024-09-07 17:31:42.824+00	\N
daTGTz8guoDhAHV24oReBX	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2020-03-01 12:22:40.678+00	2020-03-01 12:22:40.678+00	\N
dkXVoEEK7qtTrTTJdRC3uT	Renk	lightColor	{"id": "top-left"}	rgba(0,10,0,1.0)	3	4	f	2025-05-03 12:58:20.345+00	2025-05-03 12:58:20.345+00	\N
dsDJT5R8GoDCVo3yTJjpJe	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2023-04-21 11:38:08.834+00	2023-04-21 11:38:08.834+00	\N
dtbiK8FrE8ZaKdKqBxUzAh	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2024-03-09 17:24:13.565+00	2024-03-09 17:24:13.565+00	\N
dy6bF33wHNH4G2rVtWwPG4	Durum	status	{"id": "top-left"}	clicked	4	2	f	2024-09-07 17:31:42.806+00	2024-09-07 17:31:42.806+00	\N
dznNvNiMdqj3BrBFKg2APP	Açık Süre	UpTime	{"Pin": 0}	0	1	1	t	2019-10-29 11:25:29.391+00	2019-10-29 11:25:29.391+00	\N
e4828jpp2WxEJion7VFzen	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2022-01-29 14:25:30.725+00	2022-01-29 14:25:30.725+00	\N
e9XWTmf35BBzzULW7ZSXcd	Durum	State	{"Pin": 5}	0	3	3	f	2019-10-29 11:25:35.976+00	2019-10-29 11:25:35.976+00	\N
f4tUGGbv2LEmxXsdkTRmz7	Durum	State	{"Pin": 5}	0	3	3	f	2020-03-01 13:01:28.782+00	2020-03-01 13:01:28.782+00	\N
fBfAcHubWAEaMBM7DVUJTF	Durum	status	{"id": "bottom-left"}	clicked	4	2	f	2024-06-22 09:53:07.001+00	2024-06-22 09:53:07.001+00	\N
fDfTePRM5DrKZ9NmcUucAs	Renk	lightColor	{"id": "bottom-right"}	rgba(0,10,0,1.0)	3	4	f	2025-05-03 12:58:20.511+00	2025-05-03 12:58:20.511+00	\N
fJEUxRYDnx9bu4cqnveFym	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2024-01-28 12:59:49.025+00	2024-01-28 12:59:49.025+00	\N
fkif9uL5ycztaoYR4t7nm2	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2020-03-01 13:00:42.585+00	2020-03-01 13:00:42.585+00	\N
fw64zZGZ5cPiZi9f4SX5i9	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2023-04-21 11:38:05.412+00	2023-04-21 11:38:05.412+00	\N
fzdvC79J6SgvgGkMwMMgif	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2022-10-29 12:22:20.104+00	2022-10-29 12:22:20.104+00	\N
g23KTR5F7hWBHqWdhCffMd	Durum	State	{"Pin": 3}	false	3	3	f	2024-03-09 17:24:07.78+00	2024-03-09 17:24:07.78+00	\N
gDRLJ6BKU8riqdbAPCAdbi	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2023-04-21 11:38:07.418+00	2023-04-21 11:38:07.418+00	\N
gKSKBBcGdFKduAiiFi8sHB	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2022-10-29 12:22:20.139+00	2022-10-29 12:22:20.139+00	\N
gPhjr8mnmq6f6sJvGFEvgq	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2022-01-29 14:25:31.041+00	2022-01-29 14:25:31.041+00	\N
gqnrhzd8t5tyZvzvYg8i7Y	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2024-03-09 17:24:10.993+00	2024-03-09 17:24:10.993+00	\N
h5vbWssNZSynKhEFxPCqQF	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2020-03-01 12:23:28.587+00	2020-03-01 12:23:28.587+00	\N
h6FQb7ac64cntaJRdZEMK2	Durum	status	{"id": "bottom-right"}	clicked	4	2	f	2021-09-11 12:44:13.637+00	2022-03-05 13:59:31.787+00	\N
h6GAhvYmhVhNK2k6MAhrBH	Durum	status	{"id": "bottom-right"}	clicked	4	2	f	2025-05-03 12:58:20.498+00	2025-05-03 12:58:20.498+00	\N
hQgxeUG2SiRBm6rcnX5XXJ	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2019-10-29 11:25:35.224+00	2019-10-29 11:25:35.224+00	\N
hRYXTxMBwYdUdd9Y2xueLB	Durum	State	{"Pin": 7}	0	3	3	f	2020-03-01 12:23:35.5+00	2020-03-01 12:23:35.5+00	\N
hiaedHiA8fgRwRqrQJ823v	Renk	lightColor	{"id": "bottom-right"}	rgba(0,0,0,0)	3	4	f	2021-09-11 12:44:13.657+00	2021-09-11 12:44:13.657+00	\N
hoMVRUHW6vg3cPUWqs4pLq	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2024-03-09 09:18:26.013+00	2024-03-09 09:18:26.013+00	\N
hrJ5yba6Dqq5odyHUo4H2B	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2022-01-29 14:25:30.701+00	2022-01-29 14:25:30.701+00	\N
i7gWNa8W5Y4QXJX7C32MbS	Tersine Çevir	Toggle	{"Pin": 6}		2	8	f	2024-03-09 17:24:12.666+00	2024-03-09 17:24:12.666+00	\N
iA28kzMayckN6b9xAmpevj	Tersine Çevir	Toggle	{"Pin": 1}	0	2	8	f	2019-10-29 11:25:32.397+00	2019-10-29 11:25:32.397+00	\N
iKvbJSG5rD6bDLRXFchvad	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2022-10-29 12:22:20.141+00	2022-10-29 12:22:20.141+00	\N
iSKtEqGTrEftco47PiLBkN	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2024-01-28 12:59:51.214+00	2024-01-28 12:59:51.215+00	\N
iTv9DKcVybvMhPkYSLou8X	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2020-03-01 13:01:23.591+00	2020-03-01 13:01:23.591+00	\N
iVWHyKBUPhQkmrTqmQLUi6	Renk	lightColor	{"id": "bottom-left"}	rgba(0,10,0,1.0)	3	4	f	2024-09-07 17:31:42.934+00	2024-09-07 17:31:42.934+00	\N
iyufV63owia5DQhpmJms5A	Tersine Çevir	Toggle	{"Pin": 6}		2	8	f	2023-04-21 11:38:12.929+00	2023-04-21 11:38:12.929+00	\N
j9kjVLhybWpUX97iCqcQXG	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2020-03-01 16:25:35.886+00	2020-03-01 16:25:35.887+00	\N
jPXYrVUvBiQqxDheZJXg28	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2020-03-01 13:00:38.647+00	2020-03-01 13:00:38.647+00	\N
jU7fCMrexhhRStGdnuhtcN	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2023-04-21 11:38:09.663+00	2023-04-21 11:38:09.664+00	\N
jVd2zQbeJHnfsjDaKBDChy	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2023-04-21 11:38:10.884+00	2023-04-21 11:38:10.884+00	\N
jmxWXcPvvbHmNkQvD5uBmG	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2020-03-01 13:00:19.594+00	2020-03-01 13:00:19.594+00	\N
jpjc5fQxFAzUwUETrL7S8s	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2024-03-09 09:18:19.911+00	2024-03-09 09:18:19.911+00	\N
k5kYpSSamaAqZuWKJndeK4	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2024-03-09 09:18:24.993+00	2024-03-09 09:18:24.993+00	\N
k77dzZgdJEBGrkUtBGK2kU	Açık Süre	UpTime	{"Pin": 7}	0	1	1	t	2024-03-09 17:24:13.349+00	2024-03-09 17:24:13.349+00	\N
kC3o5YLDeADcDgW6musFA7	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2020-03-01 16:25:56.381+00	2020-03-01 16:25:56.382+00	\N
kR2RXzaDsrEH3aRtonEgkM	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2024-03-09 17:24:08.096+00	2024-03-09 17:24:08.096+00	\N
keNkjYNaTmy3VMZfHUyYiK	Durum	status	{"id": "bottom-right"}	clicked	4	2	f	2024-06-09 11:32:23.83+00	2024-06-09 11:32:23.83+00	\N
mWwHVdtw8sYcJf6RmSQGqY	Durum	State	{"Pin": 4}	0	3	3	f	2020-03-01 12:22:50.278+00	2020-03-01 12:22:50.278+00	\N
mX3SVrUzwEe3j4uUdB4VBZ	Kapalı Süre	DownTime	{"Pin": 1}	0	1	1	t	2020-03-01 16:25:18.376+00	2020-03-01 16:25:18.376+00	\N
mgsnmkBzYekjc29VBPMYFo	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2022-10-29 12:22:20.183+00	2022-10-29 12:22:20.183+00	\N
n0P7bj8JXNruauRk3fgGV7	°C	celcius	{"id": "temperature"}	22.562500	1	1	t	2024-10-28 14:25:02+00	2024-10-28 14:25:02+00	\N
n4MKBGvk8khHLTRJU3BrpG	Durum	status	{"id": "top-right"}	clicked	4	2	f	2025-05-03 12:58:20.411+00	2025-05-03 12:58:20.411+00	\N
nDuRVK4giNMuRXm7AuvxvN	Kapalı Süre	DownTime	{"Pin": 6}	0	1	1	t	2020-03-01 16:25:52.257+00	2020-03-01 16:25:52.257+00	\N
nFHCz4r7jBsyG6JVQv7ySh	Tersine Çevir	Toggle	{"Pin": 7}		2	8	f	2024-03-09 17:24:13.79+00	2024-03-09 17:24:13.79+00	\N
naYN4XV5f57wKQEATokoAd	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2024-03-09 09:18:19.703+00	2024-03-09 09:18:19.703+00	\N
nco4nDvm7PRZPL7eLLwYdZ	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2024-03-09 09:18:20.751+00	2024-03-09 09:18:20.751+00	\N
nkAnq5uqHsH7pfg8vopnwN	Kapalı Süre	DownTime	{"Pin": 5}	0	1	1	t	2024-01-28 12:59:56.784+00	2024-01-28 12:59:56.784+00	\N
npWJcCyYShdRAanUvhDX9q	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2022-01-29 14:25:30.945+00	2022-01-29 14:25:30.945+00	\N
nvdFob2Tp9i96WEoMBa4SM	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2022-01-29 14:25:30.969+00	2022-01-29 14:25:30.969+00	\N
o2yo77z3LXtzYgZ5uM7vNM	Tersine Çevir	Toggle	{"Pin": 7}		2	8	f	2023-04-21 11:38:14.262+00	2023-04-21 11:38:14.262+00	\N
o4DBYcmzZRvDFKK9fkH7Xc	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2020-03-01 12:22:32.407+00	2020-03-01 12:22:32.407+00	\N
o6vkYvnghSEXzDwnhJHZqC	Durum	State	{"Pin": 5}	0	3	3	f	2024-03-09 17:24:10.162+00	2024-03-09 17:24:10.162+00	\N
oEF9fygfYviobjhpfYsHSC	Tersine Çevir	Toggle	{"Pin": 4}		2	8	f	2024-03-09 09:18:23.981+00	2024-03-09 09:18:23.981+00	\N
oNZuhck6tf4VpqqN7RFuGC	Açık Süre	UpTime	{"Pin": 5}	0	1	1	t	2024-01-28 12:59:56.236+00	2024-01-28 12:59:56.236+00	\N
oTYrAoR9vMEBGV3o9B9Nph	Durum	status	{"id": "bottom-right"}	clicked	4	2	f	2024-06-22 09:53:07.048+00	2024-06-22 09:53:07.049+00	\N
oUBUEtZBQgWms9EsY9c99H	Durum	State	{"Pin": 6}	false	3	3	f	2020-03-01 16:25:51.447+00	2020-04-06 22:24:19.14+00	\N
oWNBLR3HVCmui7kkZKpux4	Açık Süre	UpTime	{"Pin": 4}	0	1	1	t	2024-03-09 17:24:09.261+00	2024-03-09 17:24:09.261+00	\N
obCHLbYkmcKp9yXX6CPky8	Durum	State	{"Pin": 0}	true	3	3	f	2020-03-01 16:25:13.526+00	2020-04-10 16:50:01.206+00	\N
ozmacxERzrPceN8iHyJYHk	Durum	State	{"Pin": 3}	0	3	3	f	2020-03-01 13:01:13.783+00	2020-03-01 13:01:13.783+00	\N
pNjoRhuHWZa7W3KTB8Liwh	Durum	State	{"Pin": 3}	false	3	3	f	2019-10-29 11:25:34.156+00	2020-03-01 12:36:11.51+00	\N
pQWAPE3M5g3JTsyHa9LueD	Tersine Çevir	Toggle	{"Pin": 4}	0	2	8	f	2020-03-01 16:25:41.173+00	2020-03-01 16:25:41.173+00	\N
pwx9LweuB6jrqTKf3225nn	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2020-03-01 12:23:40.822+00	2020-03-01 12:23:40.822+00	\N
qJGMuFcD2W2daJCRyJTfb5	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2019-10-29 11:25:45.699+00	2019-10-29 11:25:45.699+00	\N
qjBa5uTWYRWTFj222nkgqJ	Durum	State	{"Pin": 2}	false	3	3	f	2020-03-01 12:22:19.05+00	2020-04-10 17:02:05.473+00	\N
qruTeckNYMVDCjREDhzph5	Kapalı Süre	DownTime	{"Pin": 7}	0	1	1	t	2020-03-01 16:25:55.791+00	2020-03-01 16:25:55.791+00	\N
qsydbS5rEtfpjDXikinodN	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2020-03-01 13:01:00.386+00	2020-03-01 13:01:00.386+00	\N
rUMTvcrBCixyfUqBKVUVAQ	Açık Süre	UpTime	{"Pin": 3}	0	1	1	t	2020-03-01 13:01:15.247+00	2020-03-01 13:01:15.247+00	\N
scCUvaE4nBubGoVM66H8QW	Tersine Çevir	Toggle	{"Pin": 7}	0	2	8	f	2020-03-01 13:02:00.116+00	2020-03-01 13:02:00.116+00	\N
sn6ntYRuDnxmk4SAquJqU7	Kapalı Süre	DownTime	{"Pin": 0}	0	1	1	t	2019-10-29 11:25:29.588+00	2019-10-29 11:25:29.588+00	\N
tcHgWgmu84xTUvVYTa8VnV	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2020-03-01 12:22:46.134+00	2020-03-01 12:22:46.134+00	\N
thVWe7Q3YfCvktdeTw7eEn	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2020-03-01 16:25:37.817+00	2020-03-01 16:25:37.817+00	\N
uCKAWsTZ8BZWxTbKUiwkZ9	Durum	State	{"Pin": 0}	false	3	3	f	2020-03-01 12:21:52.955+00	2020-04-06 21:34:25.126+00	\N
uhSwa5jkEdWLRk9ye9EEGB	Durum	State	{"Pin": 7}	false	3	3	f	2020-03-01 16:25:54.053+00	2020-04-06 22:24:20.944+00	\N
uo2DeW7R2eUbWzy6LDUJWE	Açık Süre	UpTime	{"Pin": 2}	0	1	1	t	2019-10-29 11:25:33.384+00	2019-10-29 11:25:33.384+00	\N
vCo9dgSjsQRNC2XRZcRM6C	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2020-03-01 13:01:25.209+00	2020-03-01 13:01:25.21+00	\N
vKudCTJTxRoDs6Bh4bgtzU	Açık Süre	UpTime	{"Pin": 1}	0	1	1	t	2020-03-01 16:25:17.717+00	2020-03-01 16:25:17.718+00	\N
vk5QYW3nodfw5jAqrNuBfm	Tersine Çevir	Toggle	{"Pin": 2}	0	2	8	f	2019-10-29 11:25:33.804+00	2019-10-29 11:25:33.804+00	\N
w2Kuu4uUDDEotbA3wcsi2M	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2020-03-01 12:23:12.793+00	2020-03-01 12:23:12.794+00	\N
w7Ja9hPSM3Ry6SNX4G322o	Kapalı Süre	DownTime	{"Pin": 3}	0	1	1	t	2020-03-01 13:01:16.685+00	2020-03-01 13:01:16.685+00	\N
wACM4uTZUdgQ4wmzGp8fYP	Tersine Çevir	Toggle	{"Pin": 5}	0	2	8	f	2020-03-01 13:01:36.399+00	2020-03-01 13:01:36.399+00	\N
xHzmHEVBeYNNsNHAC2oUxT	Açık Süre	UpTime	{"Pin": 6}	0	1	1	t	2020-03-01 13:01:49.657+00	2020-03-01 13:01:49.657+00	\N
xTqF3cfczimmWr9Ux57aWN	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2020-03-01 12:22:57.096+00	2020-03-01 12:22:57.096+00	\N
xbpMQNLcs4Cbf4rc6ddzsK	Tersine Çevir	Toggle	{"Pin": 6}	0	2	8	f	2019-10-29 11:25:39.004+00	2019-10-29 11:25:39.004+00	\N
z68rS72cofrEGUJ6PX65wS	Kapalı Süre	DownTime	{"Pin": 2}	0	1	1	t	2019-10-29 11:25:33.634+00	2019-10-29 11:25:33.634+00	\N
zUVTWSBorzfowRmSetqR3W	Kapalı Süre	DownTime	{"Pin": 4}	0	1	1	t	2019-10-29 11:25:35.394+00	2019-10-29 11:25:35.394+00	\N
zgx8VUvZaTsEBMkDP3EHRT	Tersine Çevir	Toggle	{"Pin": 3}	0	2	8	f	2020-03-01 13:01:18.154+00	2020-03-01 13:01:18.154+00	\N
zqhAUKwScuMqBYAvZeayoB	Tersine Çevir	Toggle	{"Pin": 0}	0	2	8	f	2020-03-01 16:25:16.317+00	2020-03-01 16:25:16.317+00	\N
\.


--
-- Data for Name: app_propertyinfo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_propertyinfo (property_ptr_id) FROM stdin;
\.


--
-- Data for Name: app_task; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_task ("Id", "Value", "CreatedOn", "ModifiedOn", "Property_id") FROM stdin;
1aAaaE80KdkgAvwd7aA0vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	J5oTk63FYWDrBu7GztChUB
1aAaaE80KdkgAvwd7aT0vA	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	J5oTk63FYWDrBu7GztChUB
1aAaaE80KdkgAvwd7aT0vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	ceTNKRUNpMPgE3FrNmzpQm
1aAaaE80KdkgAvwd7aT2vA	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	ceTNKRUNpMPgE3FrNmzpQm
1aAatE80KdkgAvwd7aT2vA	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Eos3ebFixNEXCF26hRRozm
1aAatE80KdkgAvwd7aT2vY	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Pj6QQSQTaeJoMdFyKHgkbe
1aAatE80LdkgAvwd7aT1vA	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	RpHfgfSScuXiS4Bg5qsMhG
1aAatE80LdkgAvwd7aT2vA	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	LXVVVN9CwPmpeCBMkv44sL
1aAmtE80LdkgAvwd7aT2vA	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	LQqCCDRifoFBRvLbL3mYhZ
1aAmtE80LdkgAvwd7aT2vG	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	R78r5nsUDmNYn3f7qNCTXS
1aWatE80KdkgAvwd7aT2vY	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	EUhBBX6gPuSRAfoHQJFxW9
1vAaaE80KdkgAvwd7aT0vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Eos3ebFixNEXCF26hRRozm
1vAaaE80KdkgAvwd7aT2vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	Pj6QQSQTaeJoMdFyKHgkbe
1vAatE80KdkgAvwd7aT2vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	EUhBBX6gPuSRAfoHQJFxW9
1vAmtE80LdkgAvwd7aT2vG	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	6pj8zRn3WnYyTFrkXXHC9h
1vWatE80KdkgAvwd7aT2vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	CJnRPy22kigToquEoMuF3a
1vWatE80KdkgAvwd7aT2vY	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	CJnRPy22kigToquEoMuF3a
1vWmtE80KdkgAvwd7aT2vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	byGkZUJUqHJ6snnCGmgjw6
1vWmtE80KdkgAvwd7aT2vY	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	byGkZUJUqHJ6snnCGmgjw6
1vWmtE80LdkgAvwd7aT2vG	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	o2yo77z3LXtzYgZ5uM7vNM
1vWmtE8HKdkgAvwd7aT2vG	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	EJmzsYNwdbHf2hpZtcJq9z
1vWmtE8HKdkgAvwd7aT2vY	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	EJmzsYNwdbHf2hpZtcJq9z
2bBbbF92KfhgBwxe8bV2wA	rgba(0,10,0,1.0)	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	QH9MauWDhx4YChu8m8qDNC
2bBbbF92KfhgBwxe8bV2wC	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	8anATegeFUTPcdyKcZrrSP
2bBbtF91MehgBwxe8bU2wB	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	e4828jpp2WxEJion7VFzen
2dDdtF91MehgDwxe8dU2wB	None	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	DrovcRG5GzBwXTawHJfhzT
2gGgtF92KfhgGwxe8gV2wC	None	2024-09-07 08:46:51+00	2024-09-07 08:46:51+00	PdWGrXzBZHBLehTLF5HP5G
2jJjtF92KfhgJwxe8jV2wC	None	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00	Qo2u3ADMPH8erSKBGAN64r
2mMmtF92KfhgMwxe8mV2aC	None	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	CBctmAykmQxLgW4diFXvgX
2mMmtF92KfhgMwxe8mV2wC	None	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	GGrzLN8usQJ8LeGz7zDucz
2pPptF92KfhgPwxe8pV2aC	None	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	cyQ9LdusdZDY7jAC5wp2ki
2pPptF92KfhgPwxe8pV2wC	None	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00	Zsy5iG2pU2dNBmQTMeRRVK
2sSstF92KfhgSwxe8sV2wC	None	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	Wduj7NUt9SSaJPnUvW4Ujj
3cCcD93LeigBxwe9cX3aC	rgba(10,10,0,1.0)	2024-06-22 11:34:32+00	2024-06-22 11:34:32+00	QH9MauWDhx4YChu8m8qDNC
3cCcD93LeigBxwe9cX3xC	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	8anATegeFUTPcdyKcZrrSP
3hHhbF92KfhgHwxe8hV2wC	rgba(0,10,0,1.0)	2024-09-07 08:46:53+00	2024-09-07 08:46:53+00	FDF4MaE3U94J33YgLYWnLi
3iIibF93LeigIwxe9iX3xC	rgba(10,10,0,1.0)	2024-09-07 08:47:03+00	2024-09-07 08:47:03+00	FDF4MaE3U94J33YgLYWnLi
3kKkbF92KfhgKwxe8kV2wC	rgba(0,10,0,1.0)	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00	cBfJMbvhxUPCjeSRDJRghk
3lLlbF93LeigLwxe9lX3xC	rgba(10,10,0,1.0)	2024-09-07 09:07:31+00	2024-09-07 09:07:31+00	cBfJMbvhxUPCjeSRDJRghk
3nNnbF92KfhgNwxe8nV2wC	rgba(0,10,0,1.0)	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	6C8gZsTgvvvBg64ZF2VhCP
3nNnbF92KfhgNxwe8nV2wC	rgba(0,10,0,1.0)	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	S6jceGTKauLLCvxJppJzrc
3oOobF93LeigOwxe9oX3aC	rgba(10,10,0,1.0)	2024-09-16 11:12:27+00	2024-09-16 11:12:27+00	6C8gZsTgvvvBg64ZF2VhCP
3oOobF93LeigOwxe9oX3xC	rgba(10,10,0,1.0)	2024-09-07 09:16:01+00	2024-09-07 09:16:01+00	S6jceGTKauLLCvxJppJzrc
3qQqbF92KfhgQwxe8qV2aC	rgba(0,10,0,1.0)	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	iVWHyKBUPhQkmrTqmQLUi6
3qQqbF92KfhgQwxe8qV2wC	rgba(0,10,0,1.0)	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00	NhYBWGJwhbyxo8g2REq86L
3rRrbF93LeigRwxe9rX3aC	rgba(10,10,0,1.0)	2024-09-16 11:19:14+00	2024-09-16 11:19:14+00	iVWHyKBUPhQkmrTqmQLUi6
3rRrbF93LeigRwxe9rX3xC	rgba(10,10,0,1.0)	2024-09-07 09:20:22+00	2024-09-07 09:20:22+00	NhYBWGJwhbyxo8g2REq86L
3tTtbF92KfhgTwxe8tV2wC	rgba(0,10,0,1.0)	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	dXGBk3NG5PNFH2s4SScdDB
3uUubF93LeigUwxe9uX3xC	rgba(10,10,0,1.0)	2024-09-16 11:03:30+00	2024-09-16 11:03:30+00	dXGBk3NG5PNFH2s4SScdDB
4KkhctWkWcQLkNB4rLFnxF	rgba(0,10,0,1.0)	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	dkXVoEEK7qtTrTTJdRC3uT
7UupMcbfVKXuAeRhMdeZT6	None	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	8oCxHsJKVdRrLLXYUneatG
9vWmtE8HKdkgAvwd7aT2vX	rgba(10,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	DbjZwZB2afmvXZryYbAc6f
9vWmtE8HKdkgAvwd7aT2vY	rgba(0,10,0,1.0)	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	DbjZwZB2afmvXZryYbAc6f
9vWmtE8HKdkgFvwd7aT2vX	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	CpVoKSVkLDu46rjB5VJpff
9vWmtE8HKdkgFvwd7aT2vY	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	AMHgbFxaQ89HoPGFK9bHi4
9vWmtE8HKdkgFvwd7aT2vZ	None	2026-02-21 22:00:00+00	2026-02-21 22:00:00+00	C5PF8FKbLd3HzPShfyRjNJ
AjN6azGcSAV7Z5XJGZ6uEp	rgba(10,10,0,1.0)	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	RKZxMMp6o9LT9WY46TyFbK
Ez3WbnrW9EDLpyN7kPq79r	None	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	UAAXkgzZW4PnTH6uv8R7Pm
GpENZAfV4MQdAG9nvEoCBT	rgba(10,10,0,1.0)	2025-05-04 09:32:01+00	2025-05-04 09:32:01+00	dkXVoEEK7qtTrTTJdRC3uT
SYU8pKKGXGoAEcVqzH8CnJ	rgba(10,10,0,1.0)	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00	apYi5PpWHFjRxEKskjVE4e
ZTJHoBYuPdTnHFY5GckAgM	None	2025-05-04 09:30:44+00	2025-05-04 09:30:44+00	TmnCKLwrsxvSAXiL5DuWjm
bqXGgrDrDJXAVzpF8JDxKP	rgba(0,10,0,1.0)	2025-05-04 09:30:45+00	2025-05-04 09:30:45+00	apYi5PpWHFjRxEKskjVE4e
hdoDZz9hWcN8gHCXqUdbTt	rgba(0,10,0,1.0)	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	fDfTePRM5DrKZ9NmcUucAs
kR5pLm2Qa8WsXn4VbTyHuJ	None	2026-02-08 08:11:16+00	2026-02-08 08:11:16+00	QogfFao5mE5mNAgu2bKk2o
m9T3n2Q1J7p4S6k8H5g7Z2	rgba(0,10,0,1.0)	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00	LudPrrTfi8HyvaNYxKXrAK
nDDKnNk4kqgUuhqqUZGSrP	rgba(10,10,0,1.0)	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	fDfTePRM5DrKZ9NmcUucAs
t6W8r2D4V9m5F6q3J8s7Z1	None	2024-10-28 16:17:03+00	2024-10-28 16:17:03+00	L8RckrLxroL5JjW8obhoX2
tPKDnUkCyPpkoXZVXhvDfh	rgba(0,10,0,1.0)	2025-05-04 09:36:09+00	2025-05-04 09:36:09+00	RKZxMMp6o9LT9WY46TyFbK
uQKtbFGWWwLpVKkqCHoSC7	None	2025-05-04 09:38:15+00	2025-05-04 09:38:15+00	aBRk5ppcYvxk4pTtAxzhw9
y4H8j7K6N1t3D2p4L9i0X5	rgba(10,10,0,1.0)	2024-10-28 16:17:04+00	2024-10-28 16:17:04+00	LudPrrTfi8HyvaNYxKXrAK
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add category	1	add_category
2	Can change category	1	change_category
3	Can delete category	1	delete_category
4	Can view category	1	view_category
5	Can add condition	2	add_condition
6	Can change condition	2	change_condition
7	Can delete condition	2	delete_condition
8	Can view condition	2	view_condition
9	Can add prefab	3	add_prefab
10	Can change prefab	3	change_prefab
11	Can delete prefab	3	delete_prefab
12	Can view prefab	3	view_prefab
13	Can add property	4	add_property
14	Can change property	4	change_property
15	Can delete property	4	delete_property
16	Can view property	4	view_property
17	Can add property info	5	add_propertyinfo
18	Can change property info	5	change_propertyinfo
19	Can delete property info	5	delete_propertyinfo
20	Can view property info	5	view_propertyinfo
21	Can add task	6	add_task
22	Can change task	6	change_task
23	Can delete task	6	delete_task
24	Can view task	6	view_task
25	Can add interface	7	add_interface
26	Can change interface	7	change_interface
27	Can delete interface	7	delete_interface
28	Can view interface	7	view_interface
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add function	9	add_function
34	Can change function	9	change_function
35	Can delete function	9	delete_function
36	Can view function	9	view_function
37	Can add device	10	add_device
38	Can change device	10	change_device
39	Can delete device	10	delete_device
40	Can view device	10	view_device
41	Can add control	11	add_control
42	Can change control	11	change_control
43	Can delete control	11	delete_control
44	Can view control	11	view_control
45	Can add group device	12	add_groupdevice
46	Can change group device	12	change_groupdevice
47	Can delete group device	12	delete_groupdevice
48	Can view group device	12	view_groupdevice
49	Can add log entry	13	add_logentry
50	Can change log entry	13	change_logentry
51	Can delete log entry	13	delete_logentry
52	Can view log entry	13	view_logentry
53	Can add permission	14	add_permission
54	Can change permission	14	change_permission
55	Can delete permission	14	delete_permission
56	Can view permission	14	view_permission
57	Can add group	15	add_group
58	Can change group	15	change_group
59	Can delete group	15	delete_group
60	Can view group	15	view_group
61	Can add user	16	add_user
62	Can change user	16	change_user
63	Can delete user	16	delete_user
64	Can view user	16	view_user
65	Can add content type	17	add_contenttype
66	Can change content type	17	change_contenttype
67	Can delete content type	17	delete_contenttype
68	Can view content type	17	view_contenttype
69	Can add session	18	add_session
70	Can change session	18	change_session
71	Can delete session	18	delete_session
72	Can view session	18	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$NhzDJvb37n5drxBIgE6tQD$leMtj7Bz5wH6SC7QSiw2L1wQ8h5D8lJBDiOx8yU48Rs=	2026-02-21 19:20:06.050537+00	t	admin			leventkiran@hotmail.com.tr	t	t	2021-09-11 12:38:55.608+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-11 12:43:30.095+00	LhkshJXoLRuPp7rgrnSLQX	Wallswitch	2	[{"changed": {"fields": ["Template"]}}]	3	1
2	2021-09-12 13:45:25.631+00	heff6FNWHtRaA2TYCNrqvv	When Durum (9sTmrxTrCZ8QWf3rBA9uds) is Equal to long-pressed	1	[{"added": {}}]	2	1
3	2021-09-12 13:46:25.925+00	DLxEPadWn6ApJkBnc9R2mQ	Set Renk (DbjZwZB2afmvXZryYbAc6f) to rgba(10,10,10,1)	1	[{"added": {}}]	6	1
4	2021-09-12 13:46:55.268+00	HWPSWbhrbT83WzfvuktnMw	Task button long press color change	1	[{"added": {}}]	11	1
5	2022-01-29 14:19:31.754+00	Sxh9B4fTuLZBXGioUWScnB	MQTT IO Extender	1	[{"added": {}}]	3	1
6	2022-01-29 15:57:28.673+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["CallClass", "Parameters"]}}]	10	1
7	2022-01-30 09:59:56.499+00	9vWmtE8HKdkgFvwd7aT2vX	Set Tersine Çevir (C5PF8FKbLd3HzPShfyRjNJ) to None	1	[{"added": {}}]	6	1
8	2022-01-30 10:02:18.42+00	JLtFJVdARjPcHyyyTnb8kf	Task bottom-left toggles relay1	1	[{"added": {}}]	11	1
9	2022-03-05 13:53:50.843+00	6cbocJr7iouWjU4Azd5BHC	Anahtar Grubu (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
10	2022-03-05 13:54:21.472+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
11	2022-03-05 14:05:48.187+00	9vWmtE8HKdkgFvwd7aT2vX	Set Tersine Çevir (C5PF8FKbLd3HzPShfyRjNJ) to None	2	[]	6	1
12	2022-03-05 14:16:50.403+00	hhCVLaExNFQXWFx4zzbTF3	Task Sağ üst basıldığında sağ oda apliği toggle et	1	[{"added": {}}]	11	1
13	2022-09-01 21:29:54.304+00	6cbocJr7iouWjU4Azd5BHC	Anahtar Grubu (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
14	2022-09-01 21:30:13.113+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
15	2022-09-01 21:53:13.388+00	6cbocJr7iouWjU4Azd5BHC	Anahtar Grubu (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
16	2022-09-01 21:54:58.045+00	6cbocJr7iouWjU4Azd5BHC	Anahtar Grubu (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
17	2022-09-01 21:55:34.38+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
18	2022-09-01 21:59:20.01+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
19	2022-09-01 21:59:47.494+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
20	2022-09-01 22:02:24.176+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
21	2022-09-01 22:03:21.084+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
22	2022-09-01 22:03:58.665+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
23	2022-09-01 22:08:03.805+00	CkjVUHSKyEYURLRLeaTNLt	Mqtt Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
24	2022-09-01 22:09:07.74+00	6cbocJr7iouWjU4Azd5BHC	Anahtar Grubu (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
25	2022-10-29 12:25:06.103+00	hxwiQ3jqsh2vro4LWfcEKt	Sağ Oda Role Modülü 2 (hxwiQ3jqsh2vro4LWfcEKt)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
26	2022-10-29 12:25:21.466+00	CkjVUHSKyEYURLRLeaTNLt	Sağ Oda Role Modülü (CkjVUHSKyEYURLRLeaTNLt)	2	[{"changed": {"fields": ["Name"]}}]	10	1
27	2023-04-21 11:42:11.736+00	kvKoYzhhXdBqwXjn9exYpZ	Banyo Role Modülü (kvKoYzhhXdBqwXjn9exYpZ)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
28	2023-04-21 11:43:52.362+00	kvKoYzhhXdBqwXjn9exYpZ	Banyo Role Modülü (kvKoYzhhXdBqwXjn9exYpZ)	2	[{"changed": {"fields": ["CallClass"]}}]	10	1
29	2023-04-21 12:28:07.859+00	kvKoYzhhXdBqwXjn9exYpZ	Banyo Role Modülü (kvKoYzhhXdBqwXjn9exYpZ)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
30	2023-04-21 12:29:29.898+00	Q8X9G3MB8ctgWCjFMcazMe	Interface Duş Havuz	2	[{"changed": {"fields": ["Name"]}}]	7	1
31	2023-04-21 12:29:41.026+00	4VDS458diBtjJPNYjgo9HK	Duş Havuz (4VDS458diBtjJPNYjgo9HK)	2	[{"changed": {"fields": ["Name"]}}]	9	1
32	2024-01-28 13:02:06.343+00	4gGwrbuqfE6AdXc7CiCnD2	Sol Oda Role Modülü (4gGwrbuqfE6AdXc7CiCnD2)	2	[{"changed": {"fields": ["Name", "CallClass", "Parameters"]}}]	10	1
33	2024-03-09 09:19:42.598+00	AsxMBCsRqNNX2FoRmYPHde	Mqtt Role Modülü (AsxMBCsRqNNX2FoRmYPHde)	3		10	1
34	2024-03-09 17:25:14.176+00	Sxh9B4fTuLZBXGioUWScnB	MQTT IO Extender	2	[{"changed": {"fields": ["Template"]}}]	3	1
35	2024-03-09 17:25:36.338+00	JRw4Qi2s9uxXxyufn64Pyt	Mutfak Role Modülü (JRw4Qi2s9uxXxyufn64Pyt)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
36	2024-03-09 17:41:48.712+00	JRw4Qi2s9uxXxyufn64Pyt	Mutfak Role Modülü (JRw4Qi2s9uxXxyufn64Pyt)	2	[{"changed": {"fields": ["CallClass"]}}]	10	1
37	2024-03-09 17:45:04.373+00	BYWtcuRy6tmhBWWYL7CVn7	Interface Role 8	3		7	1
38	2024-03-09 17:45:04.49+00	BYWtcuRy6tmhBWWYL7CVn6	Interface Role 7	3		7	1
39	2024-03-09 17:45:04.589+00	BYWtcuRy6tmhBWWYL7CVn5	Interface Role 6	3		7	1
40	2024-03-09 17:45:04.689+00	BYWtcuRy6tmhBWWYL7CVn4	Interface Role 5	3		7	1
41	2024-05-26 09:45:21.52+00	6cbocJr7iouWjU4Azd5BHC	Sağ Odası Anahtarı (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
42	2024-05-26 09:52:14.657+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
43	2024-05-26 09:54:37.522+00	7JyxTFvtKjnJwLQkYTLNnj	Sağ Oda IO2 (7JyxTFvtKjnJwLQkYTLNnj)	3		10	1
44	2024-05-26 09:54:42.755+00	vqARbSWYgfyvT4f2WbyoL5	Sağ Oda IO1 (vqARbSWYgfyvT4f2WbyoL5)	3		10	1
45	2024-05-26 09:54:47.185+00	g9gjA7RoE5q8QvcgRCrp5V	Sol Oda IO (g9gjA7RoE5q8QvcgRCrp5V)	3		10	1
46	2024-05-26 09:54:52.366+00	KepZuj3xk9osDi8ALAavy3	Tezgah IO (KepZuj3xk9osDi8ALAavy3)	3		10	1
47	2024-05-26 09:59:54.142+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
48	2024-05-26 10:14:00.199+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
49	2024-05-26 10:18:46.049+00	JRw4Qi2s9uxXxyufn64Pyt	Mutfak Role Modülü (JRw4Qi2s9uxXxyufn64Pyt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
50	2024-05-26 10:23:16.59+00	JRw4Qi2s9uxXxyufn64Pyt	Mutfak Role Modülü (JRw4Qi2s9uxXxyufn64Pyt)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
51	2024-05-26 10:24:15.943+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[]	10	1
52	2024-06-09 10:27:56.097+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
53	2024-06-09 11:32:12.919+00	6cbocJr7iouWjU4Azd5BHC	Sağ Oda Anahtar (6cbocJr7iouWjU4Azd5BHC)	2	[]	10	1
54	2024-06-09 11:32:17.702+00	LhkshJXoLRuPp7rgrnSLQX	Wallswitch	2	[{"changed": {"fields": ["Template"]}}]	3	1
55	2024-06-09 11:33:30.98+00	SuTzfUbudm2F5eoVLTXjeC	Koridor Anahtar (SuTzfUbudm2F5eoVLTXjeC)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
56	2024-06-22 09:53:41.568+00	nvP7bj8JXNruauRk3fgGV7	Orta Anahtar (nvP7bj8JXNruauRk3fgGV7)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
57	2024-09-07 08:03:05.416+00	aYJbeTesvLmmYGK58LqwVB	Mutfak Anahtar (aYJbeTesvLmmYGK58LqwVB)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
58	2024-09-07 17:32:08.253+00	MD2XgcDBtaUNPkonsbvMAm	Sol Oda Anahtar (MD2XgcDBtaUNPkonsbvMAm)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
59	2024-12-28 21:37:42.738+00	MD2XgcDBtaUNPkonsbvMAm	Sol Oda Anahtar (MD2XgcDBtaUNPkonsbvMAm)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
60	2025-05-03 10:59:37.431+00	MD2XgcDBtaUNPkonsbvMAm	Sol Oda Anahtar (MD2XgcDBtaUNPkonsbvMAm)	2	[{"changed": {"fields": ["Parameters"]}}]	10	1
61	2025-05-03 12:59:13.817+00	JZfTDwhLETUm2FFGog8vXM	WC Anahtar (JZfTDwhLETUm2FFGog8vXM)	2	[{"changed": {"fields": ["Name", "Parameters"]}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	app	category
2	app	condition
3	app	prefab
4	app	property
5	app	propertyinfo
6	app	task
7	app	interface
8	app	group
9	app	function
10	app	device
11	app	control
12	app	groupdevice
13	admin	logentry
14	auth	permission
15	auth	group
16	auth	user
17	contenttypes	contenttype
18	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-02-21 18:49:28.347742+00
2	auth	0001_initial	2026-02-21 18:49:28.377613+00
3	admin	0001_initial	2026-02-21 18:49:28.38684+00
4	admin	0002_logentry_remove_auto_add	2026-02-21 18:49:28.390321+00
5	admin	0003_logentry_add_action_flag_choices	2026-02-21 18:49:28.393817+00
6	app	0001_initial	2026-02-21 18:49:28.493934+00
7	app	0002_alter_condition_createdon	2026-02-21 18:49:28.499591+00
8	contenttypes	0002_remove_content_type_name	2026-02-21 18:49:28.510635+00
9	auth	0002_alter_permission_name_max_length	2026-02-21 18:49:28.514434+00
10	auth	0003_alter_user_email_max_length	2026-02-21 18:49:28.518753+00
11	auth	0004_alter_user_username_opts	2026-02-21 18:49:28.535856+00
12	auth	0005_alter_user_last_login_null	2026-02-21 18:49:28.539594+00
13	auth	0006_require_contenttypes_0002	2026-02-21 18:49:28.54044+00
14	auth	0007_alter_validators_add_error_messages	2026-02-21 18:49:28.543725+00
15	auth	0008_alter_user_username_max_length	2026-02-21 18:49:28.549335+00
16	auth	0009_alter_user_last_name_max_length	2026-02-21 18:49:28.553901+00
17	auth	0010_alter_group_name_max_length	2026-02-21 18:49:28.559144+00
18	auth	0011_update_proxy_permissions	2026-02-21 18:49:28.568641+00
19	auth	0012_alter_user_first_name_max_length	2026-02-21 18:49:28.573585+00
20	sessions	0001_initial	2026-02-21 18:49:28.580725+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2tfredt6hfqt9v061222v8j1w6lzicxy	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1sQPLI:UCAuPwChZv7GoP9YHujbU-Vm4B8NsN16ZMuP7qQhJGE	2024-07-21 10:42:04.657+00
djoql6y8t491j9v27ix6132q98102am2	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1sKxQ7:Sm8Drhus4VGP0EC06e9aQX3kwzDHO2UT57HS5-H8D-E	2024-07-06 09:52:31.525+00
hsks9j88vfptg6g8vrhr8jzh51uyz08j	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1smzHX:wX9HEAj-DTZc6R5m2FR92hmu9s2xcIPOQiIo1v1AlWw	2024-09-21 17:31:31.416+00
m3g6g1bytot4a5ikww96p66ieccayl8b	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1uBAa1:URRqXke6f0vZtia2dQGEfsRPgDYttxk2XlQ6SGhWKfU	2025-05-17 10:58:49.673+00
mrglxa29cwetrbv3fr4e32zkfr0emq5x	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1ryDBf:Y6cx4-c3ww5fqdeTDN-FpiK6v3mttWSdqj1LG6KIXao	2024-05-04 16:03:35.052+00
tnm7fboavpl114fr5cqltwfzu3qpei7j	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1skIRR:5FxSb-7w0qcUUZGP-Sc63L6i60pAcXzbDZgEO5zkub8	2024-09-14 07:22:37.267+00
tztympdezw3rgogpiyyjpmeb5l00q0hs	.eJxVjDsOwjAQBe_iGlnx36GkzxmstXeNA8iW4qRC3J1ESgHtzLz3ZgG2tYSt0xJmZFcm2OWXRUhPqofAB9R746nVdZkjPxJ-2s6nhvS6ne3fQYFe9rXV0Y_SQHZSGOHBp2SU134HwoxWkJZIZAizdTA4BUoPSlqbjSaBCdjnC8kYN3o:1vtsWM:zZpdC-YmqrJr7kZIS-gW5k8-GVKekwVIoPIklcCfmxY	2026-03-07 19:20:06.052565+00
\.


--
-- Name: app_condition_AndConditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_condition_AndConditions_id_seq"', 1, false);


--
-- Name: app_control_Conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_control_Conditions_id_seq"', 136, true);


--
-- Name: app_control_Tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_control_Tasks_id_seq"', 136, true);


--
-- Name: app_device_Functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_device_Functions_id_seq"', 280, true);


--
-- Name: app_function_Properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_function_Properties_id_seq"', 1496, true);


--
-- Name: app_group_Properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."app_group_Properties_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 61, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: app_category app_category_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_pkey PRIMARY KEY ("Id");


--
-- Name: app_condition_AndConditions app_condition_AndConditi_from_condition_id_to_con_40792412_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_condition_AndConditions"
    ADD CONSTRAINT "app_condition_AndConditi_from_condition_id_to_con_40792412_uniq" UNIQUE (from_condition_id, to_condition_id);


--
-- Name: app_condition_AndConditions app_condition_AndConditions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_condition_AndConditions"
    ADD CONSTRAINT "app_condition_AndConditions_pkey" PRIMARY KEY (id);


--
-- Name: app_condition app_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_condition
    ADD CONSTRAINT app_condition_pkey PRIMARY KEY ("Id");


--
-- Name: app_control_Conditions app_control_Conditions_control_id_condition_id_2f74f824_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Conditions"
    ADD CONSTRAINT "app_control_Conditions_control_id_condition_id_2f74f824_uniq" UNIQUE (control_id, condition_id);


--
-- Name: app_control_Conditions app_control_Conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Conditions"
    ADD CONSTRAINT "app_control_Conditions_pkey" PRIMARY KEY (id);


--
-- Name: app_control_Tasks app_control_Tasks_control_id_task_id_9fef8219_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Tasks"
    ADD CONSTRAINT "app_control_Tasks_control_id_task_id_9fef8219_uniq" UNIQUE (control_id, task_id);


--
-- Name: app_control_Tasks app_control_Tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Tasks"
    ADD CONSTRAINT "app_control_Tasks_pkey" PRIMARY KEY (id);


--
-- Name: app_control app_control_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_control
    ADD CONSTRAINT app_control_pkey PRIMARY KEY ("Id");


--
-- Name: app_device_Functions app_device_Functions_device_id_function_id_10ddb17d_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_device_Functions"
    ADD CONSTRAINT "app_device_Functions_device_id_function_id_10ddb17d_uniq" UNIQUE (device_id, function_id);


--
-- Name: app_device_Functions app_device_Functions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_device_Functions"
    ADD CONSTRAINT "app_device_Functions_pkey" PRIMARY KEY (id);


--
-- Name: app_device app_device_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_device
    ADD CONSTRAINT app_device_pkey PRIMARY KEY ("Id");


--
-- Name: app_function_Properties app_function_Properties_function_id_property_id_597f0b72_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_function_Properties"
    ADD CONSTRAINT "app_function_Properties_function_id_property_id_597f0b72_uniq" UNIQUE (function_id, property_id);


--
-- Name: app_function_Properties app_function_Properties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_function_Properties"
    ADD CONSTRAINT "app_function_Properties_pkey" PRIMARY KEY (id);


--
-- Name: app_function app_function_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT app_function_pkey PRIMARY KEY ("Id");


--
-- Name: app_group_Properties app_group_Properties_group_id_property_id_75acd036_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_group_Properties"
    ADD CONSTRAINT "app_group_Properties_group_id_property_id_75acd036_uniq" UNIQUE (group_id, property_id);


--
-- Name: app_group_Properties app_group_Properties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_group_Properties"
    ADD CONSTRAINT "app_group_Properties_pkey" PRIMARY KEY (id);


--
-- Name: app_group app_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_group
    ADD CONSTRAINT app_group_pkey PRIMARY KEY ("Id");


--
-- Name: app_groupdevice app_groupdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_groupdevice
    ADD CONSTRAINT app_groupdevice_pkey PRIMARY KEY (device_ptr_id);


--
-- Name: app_interface app_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_interface
    ADD CONSTRAINT app_interface_pkey PRIMARY KEY ("Id");


--
-- Name: app_prefab app_prefab_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_prefab
    ADD CONSTRAINT app_prefab_pkey PRIMARY KEY ("Id");


--
-- Name: app_property app_property_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_property
    ADD CONSTRAINT app_property_pkey PRIMARY KEY ("Id");


--
-- Name: app_propertyinfo app_propertyinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_propertyinfo
    ADD CONSTRAINT app_propertyinfo_pkey PRIMARY KEY (property_ptr_id);


--
-- Name: app_task app_task_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_task
    ADD CONSTRAINT app_task_pkey PRIMARY KEY ("Id");


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_category_Id_6bc72b25_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_category_Id_6bc72b25_like" ON public.app_category USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_condition_AndConditions_from_condition_id_a4d0167b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_AndConditions_from_condition_id_a4d0167b" ON public."app_condition_AndConditions" USING btree (from_condition_id);


--
-- Name: app_condition_AndConditions_from_condition_id_a4d0167b_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_AndConditions_from_condition_id_a4d0167b_like" ON public."app_condition_AndConditions" USING btree (from_condition_id varchar_pattern_ops);


--
-- Name: app_condition_AndConditions_to_condition_id_15823c92; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_AndConditions_to_condition_id_15823c92" ON public."app_condition_AndConditions" USING btree (to_condition_id);


--
-- Name: app_condition_AndConditions_to_condition_id_15823c92_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_AndConditions_to_condition_id_15823c92_like" ON public."app_condition_AndConditions" USING btree (to_condition_id varchar_pattern_ops);


--
-- Name: app_condition_Id_f0a678ae_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_Id_f0a678ae_like" ON public.app_condition USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_condition_Property_id_a8db29d1; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_Property_id_a8db29d1" ON public.app_condition USING btree ("Property_id");


--
-- Name: app_condition_Property_id_a8db29d1_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_condition_Property_id_a8db29d1_like" ON public.app_condition USING btree ("Property_id" varchar_pattern_ops);


--
-- Name: app_control_Conditions_condition_id_63e9c280; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Conditions_condition_id_63e9c280" ON public."app_control_Conditions" USING btree (condition_id);


--
-- Name: app_control_Conditions_condition_id_63e9c280_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Conditions_condition_id_63e9c280_like" ON public."app_control_Conditions" USING btree (condition_id varchar_pattern_ops);


--
-- Name: app_control_Conditions_control_id_a3922bcd; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Conditions_control_id_a3922bcd" ON public."app_control_Conditions" USING btree (control_id);


--
-- Name: app_control_Conditions_control_id_a3922bcd_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Conditions_control_id_a3922bcd_like" ON public."app_control_Conditions" USING btree (control_id varchar_pattern_ops);


--
-- Name: app_control_Id_5e7043bb_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Id_5e7043bb_like" ON public.app_control USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_control_Tasks_control_id_0872ab0e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Tasks_control_id_0872ab0e" ON public."app_control_Tasks" USING btree (control_id);


--
-- Name: app_control_Tasks_control_id_0872ab0e_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Tasks_control_id_0872ab0e_like" ON public."app_control_Tasks" USING btree (control_id varchar_pattern_ops);


--
-- Name: app_control_Tasks_task_id_af410f2e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Tasks_task_id_af410f2e" ON public."app_control_Tasks" USING btree (task_id);


--
-- Name: app_control_Tasks_task_id_af410f2e_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_control_Tasks_task_id_af410f2e_like" ON public."app_control_Tasks" USING btree (task_id varchar_pattern_ops);


--
-- Name: app_device_Functions_device_id_1f434b7f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_device_Functions_device_id_1f434b7f" ON public."app_device_Functions" USING btree (device_id);


--
-- Name: app_device_Functions_device_id_1f434b7f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_device_Functions_device_id_1f434b7f_like" ON public."app_device_Functions" USING btree (device_id varchar_pattern_ops);


--
-- Name: app_device_Functions_function_id_add6cc67; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_device_Functions_function_id_add6cc67" ON public."app_device_Functions" USING btree (function_id);


--
-- Name: app_device_Functions_function_id_add6cc67_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_device_Functions_function_id_add6cc67_like" ON public."app_device_Functions" USING btree (function_id varchar_pattern_ops);


--
-- Name: app_device_Id_1bba23b1_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_device_Id_1bba23b1_like" ON public.app_device USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_function_Id_2c99037d_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_function_Id_2c99037d_like" ON public.app_function USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_function_Properties_function_id_123dca35; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_function_Properties_function_id_123dca35" ON public."app_function_Properties" USING btree (function_id);


--
-- Name: app_function_Properties_function_id_123dca35_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_function_Properties_function_id_123dca35_like" ON public."app_function_Properties" USING btree (function_id varchar_pattern_ops);


--
-- Name: app_function_Properties_property_id_90abed23; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_function_Properties_property_id_90abed23" ON public."app_function_Properties" USING btree (property_id);


--
-- Name: app_function_Properties_property_id_90abed23_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_function_Properties_property_id_90abed23_like" ON public."app_function_Properties" USING btree (property_id varchar_pattern_ops);


--
-- Name: app_group_Id_a7dcaeaf_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_Id_a7dcaeaf_like" ON public.app_group USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_group_ParentGroup_id_5c726ce7; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_ParentGroup_id_5c726ce7" ON public.app_group USING btree ("ParentGroup_id");


--
-- Name: app_group_ParentGroup_id_5c726ce7_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_ParentGroup_id_5c726ce7_like" ON public.app_group USING btree ("ParentGroup_id" varchar_pattern_ops);


--
-- Name: app_group_Properties_group_id_82e41101; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_Properties_group_id_82e41101" ON public."app_group_Properties" USING btree (group_id);


--
-- Name: app_group_Properties_group_id_82e41101_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_Properties_group_id_82e41101_like" ON public."app_group_Properties" USING btree (group_id varchar_pattern_ops);


--
-- Name: app_group_Properties_property_id_af273b92; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_Properties_property_id_af273b92" ON public."app_group_Properties" USING btree (property_id);


--
-- Name: app_group_Properties_property_id_af273b92_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_group_Properties_property_id_af273b92_like" ON public."app_group_Properties" USING btree (property_id varchar_pattern_ops);


--
-- Name: app_groupdevice_Group_id_d2040573; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_groupdevice_Group_id_d2040573" ON public.app_groupdevice USING btree ("Group_id");


--
-- Name: app_groupdevice_Group_id_d2040573_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_groupdevice_Group_id_d2040573_like" ON public.app_groupdevice USING btree ("Group_id" varchar_pattern_ops);


--
-- Name: app_groupdevice_device_ptr_id_d45b3e56_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_groupdevice_device_ptr_id_d45b3e56_like ON public.app_groupdevice USING btree (device_ptr_id varchar_pattern_ops);


--
-- Name: app_interface_Editor_id_cee4bc5a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_interface_Editor_id_cee4bc5a" ON public.app_interface USING btree ("Editor_id");


--
-- Name: app_interface_Editor_id_cee4bc5a_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_interface_Editor_id_cee4bc5a_like" ON public.app_interface USING btree ("Editor_id" varchar_pattern_ops);


--
-- Name: app_interface_Id_f3bde939_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_interface_Id_f3bde939_like" ON public.app_interface USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_interface_Monitor_id_e4183e42; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_interface_Monitor_id_e4183e42" ON public.app_interface USING btree ("Monitor_id");


--
-- Name: app_interface_Monitor_id_e4183e42_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_interface_Monitor_id_e4183e42_like" ON public.app_interface USING btree ("Monitor_id" varchar_pattern_ops);


--
-- Name: app_prefab_Id_b0e1426f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_prefab_Id_b0e1426f_like" ON public.app_prefab USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_property_Category_id_a951f457; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_property_Category_id_a951f457" ON public.app_property USING btree ("Category_id");


--
-- Name: app_property_Category_id_a951f457_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_property_Category_id_a951f457_like" ON public.app_property USING btree ("Category_id" varchar_pattern_ops);


--
-- Name: app_property_Id_a3ef4aec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_property_Id_a3ef4aec_like" ON public.app_property USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_propertyinfo_property_ptr_id_68d459d0_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_propertyinfo_property_ptr_id_68d459d0_like ON public.app_propertyinfo USING btree (property_ptr_id varchar_pattern_ops);


--
-- Name: app_task_Id_94d49042_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_task_Id_94d49042_like" ON public.app_task USING btree ("Id" varchar_pattern_ops);


--
-- Name: app_task_Property_id_97cb339d; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_task_Property_id_97cb339d" ON public.app_task USING btree ("Property_id");


--
-- Name: app_task_Property_id_97cb339d_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "app_task_Property_id_97cb339d_like" ON public.app_task USING btree ("Property_id" varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_condition_AndConditions app_condition_AndCon_from_condition_id_a4d0167b_fk_app_condi; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_condition_AndConditions"
    ADD CONSTRAINT "app_condition_AndCon_from_condition_id_a4d0167b_fk_app_condi" FOREIGN KEY (from_condition_id) REFERENCES public.app_condition("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_condition_AndConditions app_condition_AndCon_to_condition_id_15823c92_fk_app_condi; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_condition_AndConditions"
    ADD CONSTRAINT "app_condition_AndCon_to_condition_id_15823c92_fk_app_condi" FOREIGN KEY (to_condition_id) REFERENCES public.app_condition("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_condition app_condition_Property_id_a8db29d1_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_condition
    ADD CONSTRAINT "app_condition_Property_id_a8db29d1_fk_app_property_Id" FOREIGN KEY ("Property_id") REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_control_Conditions app_control_Conditio_condition_id_63e9c280_fk_app_condi; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Conditions"
    ADD CONSTRAINT "app_control_Conditio_condition_id_63e9c280_fk_app_condi" FOREIGN KEY (condition_id) REFERENCES public.app_condition("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_control_Conditions app_control_Conditions_control_id_a3922bcd_fk_app_control_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Conditions"
    ADD CONSTRAINT "app_control_Conditions_control_id_a3922bcd_fk_app_control_Id" FOREIGN KEY (control_id) REFERENCES public.app_control("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_control_Tasks app_control_Tasks_control_id_0872ab0e_fk_app_control_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Tasks"
    ADD CONSTRAINT "app_control_Tasks_control_id_0872ab0e_fk_app_control_Id" FOREIGN KEY (control_id) REFERENCES public.app_control("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_control_Tasks app_control_Tasks_task_id_af410f2e_fk_app_task_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_control_Tasks"
    ADD CONSTRAINT "app_control_Tasks_task_id_af410f2e_fk_app_task_Id" FOREIGN KEY (task_id) REFERENCES public.app_task("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_device_Functions app_device_Functions_device_id_1f434b7f_fk_app_device_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_device_Functions"
    ADD CONSTRAINT "app_device_Functions_device_id_1f434b7f_fk_app_device_Id" FOREIGN KEY (device_id) REFERENCES public.app_device("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_device_Functions app_device_Functions_function_id_add6cc67_fk_app_function_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_device_Functions"
    ADD CONSTRAINT "app_device_Functions_function_id_add6cc67_fk_app_function_Id" FOREIGN KEY (function_id) REFERENCES public.app_function("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_function_Properties app_function_Properties_function_id_123dca35_fk_app_function_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_function_Properties"
    ADD CONSTRAINT "app_function_Properties_function_id_123dca35_fk_app_function_Id" FOREIGN KEY (function_id) REFERENCES public.app_function("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_function_Properties app_function_Properties_property_id_90abed23_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_function_Properties"
    ADD CONSTRAINT "app_function_Properties_property_id_90abed23_fk_app_property_Id" FOREIGN KEY (property_id) REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_group app_group_ParentGroup_id_5c726ce7_fk_app_group_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_group
    ADD CONSTRAINT "app_group_ParentGroup_id_5c726ce7_fk_app_group_Id" FOREIGN KEY ("ParentGroup_id") REFERENCES public.app_group("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_group_Properties app_group_Properties_group_id_82e41101_fk_app_group_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_group_Properties"
    ADD CONSTRAINT "app_group_Properties_group_id_82e41101_fk_app_group_Id" FOREIGN KEY (group_id) REFERENCES public.app_group("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_group_Properties app_group_Properties_property_id_af273b92_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."app_group_Properties"
    ADD CONSTRAINT "app_group_Properties_property_id_af273b92_fk_app_property_Id" FOREIGN KEY (property_id) REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_groupdevice app_groupdevice_Group_id_d2040573_fk_app_group_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_groupdevice
    ADD CONSTRAINT "app_groupdevice_Group_id_d2040573_fk_app_group_Id" FOREIGN KEY ("Group_id") REFERENCES public.app_group("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_groupdevice app_groupdevice_device_ptr_id_d45b3e56_fk_app_device_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_groupdevice
    ADD CONSTRAINT "app_groupdevice_device_ptr_id_d45b3e56_fk_app_device_Id" FOREIGN KEY (device_ptr_id) REFERENCES public.app_device("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_interface app_interface_Editor_id_cee4bc5a_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_interface
    ADD CONSTRAINT "app_interface_Editor_id_cee4bc5a_fk_app_property_Id" FOREIGN KEY ("Editor_id") REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_interface app_interface_Monitor_id_e4183e42_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_interface
    ADD CONSTRAINT "app_interface_Monitor_id_e4183e42_fk_app_property_Id" FOREIGN KEY ("Monitor_id") REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_property app_property_Category_id_a951f457_fk_app_category_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_property
    ADD CONSTRAINT "app_property_Category_id_a951f457_fk_app_category_Id" FOREIGN KEY ("Category_id") REFERENCES public.app_category("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_propertyinfo app_propertyinfo_property_ptr_id_68d459d0_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_propertyinfo
    ADD CONSTRAINT "app_propertyinfo_property_ptr_id_68d459d0_fk_app_property_Id" FOREIGN KEY (property_ptr_id) REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_task app_task_Property_id_97cb339d_fk_app_property_Id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_task
    ADD CONSTRAINT "app_task_Property_id_97cb339d_fk_app_property_Id" FOREIGN KEY ("Property_id") REFERENCES public.app_property("Id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

