--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2017-02-15 21:52:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 219 (class 1259 OID 21882)
-- Name: android; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE android (
    id bigint NOT NULL,
    lat character varying(250),
    lon character varying(250)
);


ALTER TABLE android OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21880)
-- Name: android_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE android_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE android_id_seq OWNER TO postgres;

--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 218
-- Name: android_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE android_id_seq OWNED BY android.id;


--
-- TOC entry 186 (class 1259 OID 19570)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    id_cliente bigint NOT NULL,
    persona_id bigint NOT NULL,
    area character varying(150) NOT NULL,
    puesto character varying(150) NOT NULL,
    nombre_empresa character varying(150) NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19665)
-- Name: cliente_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente_empleado (
    id_cliente_empleado bigint NOT NULL,
    cliente_id bigint NOT NULL,
    empleado_id bigint NOT NULL
);


ALTER TABLE cliente_empleado OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19661)
-- Name: cliente_empleado_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_empleado_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_empleado_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 215
-- Name: cliente_empleado_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_empleado_cliente_id_seq OWNED BY cliente_empleado.cliente_id;


--
-- TOC entry 216 (class 1259 OID 19663)
-- Name: cliente_empleado_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_empleado_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_empleado_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 216
-- Name: cliente_empleado_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_empleado_empleado_id_seq OWNED BY cliente_empleado.empleado_id;


--
-- TOC entry 185 (class 1259 OID 19568)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 185
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_cliente_seq OWNED BY cliente.id_cliente;


--
-- TOC entry 182 (class 1259 OID 19555)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    comentario character varying(255) NOT NULL
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 19553)
-- Name: comentario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comentario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comentario_id_seq OWNER TO postgres;

--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 181
-- Name: comentario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comentario_id_seq OWNED BY comentario.id;


--
-- TOC entry 188 (class 1259 OID 19576)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empleado (
    id_empleado bigint NOT NULL,
    persona_id bigint NOT NULL,
    direccion character varying(150) NOT NULL,
    horas_x_semana integer NOT NULL,
    carrera character varying(150) NOT NULL,
    estado_civil character varying(25) NOT NULL,
    numero_hijos integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    antiguedad character varying(100) NOT NULL,
    sueldo_mensual character varying(50),
    sexo character varying(1) NOT NULL,
    candidato character varying(1) NOT NULL,
    area character varying(150) NOT NULL,
    puesto character varying(150) NOT NULL,
    nombre_empresa character varying(150) NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE empleado OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 19574)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleado_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 187
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleado_id_empleado_seq OWNED BY empleado.id_empleado;


--
-- TOC entry 190 (class 1259 OID 19585)
-- Name: empleado_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empleado_proyecto (
    id bigint NOT NULL,
    empleado_id bigint NOT NULL,
    proyecto_id bigint NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE empleado_proyecto OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 19583)
-- Name: empleado_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleado_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empleado_proyecto_id_seq OWNER TO postgres;

--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 189
-- Name: empleado_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleado_proyecto_id_seq OWNED BY empleado_proyecto.id;


--
-- TOC entry 192 (class 1259 OID 19591)
-- Name: password_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE password_token (
    id_password_token bigint NOT NULL,
    usuario_password_token bigint NOT NULL,
    token_password_token character varying(100),
    date_password_token timestamp without time zone NOT NULL
);


ALTER TABLE password_token OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 19589)
-- Name: password_token_id_password_token_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE password_token_id_password_token_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE password_token_id_password_token_seq OWNER TO postgres;

--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 191
-- Name: password_token_id_password_token_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE password_token_id_password_token_seq OWNED BY password_token.id_password_token;


--
-- TOC entry 184 (class 1259 OID 19564)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persona (
    id_persona bigint NOT NULL,
    correo character varying(150) NOT NULL,
    nombre character varying(155) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50),
    telefono_local character varying(25) NOT NULL,
    telefono_movil character varying(25),
    usuario_id bigint NOT NULL
);


ALTER TABLE persona OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 19562)
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_id_persona_seq OWNER TO postgres;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 183
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_id_persona_seq OWNED BY persona.id_persona;


--
-- TOC entry 194 (class 1259 OID 19597)
-- Name: pregunta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pregunta (
    id_pregunta bigint NOT NULL,
    nombre_pregunta character varying(255) NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE pregunta OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 19595)
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_id_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_id_pregunta_seq OWNER TO postgres;

--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 193
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_id_pregunta_seq OWNED BY pregunta.id_pregunta;


--
-- TOC entry 196 (class 1259 OID 19603)
-- Name: pregunta_prueba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pregunta_prueba (
    id bigint NOT NULL,
    pregunta_id bigint NOT NULL,
    prueba_id bigint NOT NULL,
    numero_pregunta integer NOT NULL
);


ALTER TABLE pregunta_prueba OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 19601)
-- Name: pregunta_prueba_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_prueba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_prueba_id_seq OWNER TO postgres;

--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 195
-- Name: pregunta_prueba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_prueba_id_seq OWNED BY pregunta_prueba.id;


--
-- TOC entry 198 (class 1259 OID 19609)
-- Name: pregunta_respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pregunta_respuesta (
    id_pregunta_respuesta bigint NOT NULL,
    pregunta_id bigint NOT NULL,
    respuesta_id bigint NOT NULL,
    puntaje_respuesta integer NOT NULL
);


ALTER TABLE pregunta_respuesta OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 19607)
-- Name: pregunta_respuesta_id_pregunta_respuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_respuesta_id_pregunta_respuesta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_respuesta_id_pregunta_respuesta_seq OWNER TO postgres;

--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 197
-- Name: pregunta_respuesta_id_pregunta_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_respuesta_id_pregunta_respuesta_seq OWNED BY pregunta_respuesta.id_pregunta_respuesta;


--
-- TOC entry 200 (class 1259 OID 19615)
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proyecto (
    id_proyecto bigint NOT NULL,
    cliente_id bigint NOT NULL,
    nombre_proyecto character varying(150) NOT NULL,
    descripcion character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    habilitado integer NOT NULL
);


ALTER TABLE proyecto OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 19613)
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_id_proyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proyecto_id_proyecto_seq OWNER TO postgres;

--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 199
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyecto_id_proyecto_seq OWNED BY proyecto.id_proyecto;


--
-- TOC entry 202 (class 1259 OID 19621)
-- Name: prueba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prueba (
    id_prueba bigint NOT NULL,
    nombre_prueba character varying(100) NOT NULL,
    descripcion_prueba character varying(255) NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE prueba OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 19627)
-- Name: prueba_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prueba_cliente (
    id bigint NOT NULL,
    prueba_id bigint NOT NULL,
    cliente_id bigint NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE prueba_cliente OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19625)
-- Name: prueba_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prueba_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prueba_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 203
-- Name: prueba_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prueba_cliente_id_seq OWNED BY prueba_cliente.id;


--
-- TOC entry 208 (class 1259 OID 19639)
-- Name: prueba_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prueba_empleado (
    id bigint NOT NULL,
    empleado_id bigint NOT NULL,
    prueba_id bigint NOT NULL,
    puntaje_prueba double precision NOT NULL,
    fecha_prueba date NOT NULL
);


ALTER TABLE prueba_empleado OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 19637)
-- Name: prueba_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prueba_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prueba_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 207
-- Name: prueba_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prueba_empleado_id_seq OWNED BY prueba_empleado.id;


--
-- TOC entry 201 (class 1259 OID 19619)
-- Name: prueba_id_prueba_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prueba_id_prueba_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prueba_id_prueba_seq OWNER TO postgres;

--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 201
-- Name: prueba_id_prueba_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prueba_id_prueba_seq OWNED BY prueba.id_prueba;


--
-- TOC entry 206 (class 1259 OID 19633)
-- Name: prueba_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prueba_proyecto (
    id_prueba_proyecto bigint NOT NULL,
    prueba_id bigint NOT NULL,
    proyecto_id bigint NOT NULL,
    puntaje_prueba integer,
    fecha_creacion date,
    habilitado integer NOT NULL
);


ALTER TABLE prueba_proyecto OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19631)
-- Name: prueba_proyecto_id_prueba_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prueba_proyecto_id_prueba_proyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prueba_proyecto_id_prueba_proyecto_seq OWNER TO postgres;

--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 205
-- Name: prueba_proyecto_id_prueba_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prueba_proyecto_id_prueba_proyecto_seq OWNED BY prueba_proyecto.id_prueba_proyecto;


--
-- TOC entry 210 (class 1259 OID 19645)
-- Name: respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE respuesta (
    id_respuesta bigint NOT NULL,
    nombre_respuesta character varying(150) NOT NULL,
    habilitado integer NOT NULL
);


ALTER TABLE respuesta OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 19651)
-- Name: respuesta_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE respuesta_empleado (
    id bigint NOT NULL,
    pregunta_respuesta_id bigint NOT NULL,
    empleado_id bigint NOT NULL
);


ALTER TABLE respuesta_empleado OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 19649)
-- Name: respuesta_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE respuesta_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE respuesta_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 211
-- Name: respuesta_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE respuesta_empleado_id_seq OWNED BY respuesta_empleado.id;


--
-- TOC entry 209 (class 1259 OID 19643)
-- Name: respuesta_id_respuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE respuesta_id_respuesta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE respuesta_id_respuesta_seq OWNER TO postgres;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 209
-- Name: respuesta_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE respuesta_id_respuesta_seq OWNED BY respuesta.id_respuesta;


--
-- TOC entry 214 (class 1259 OID 19657)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id_usuario bigint NOT NULL,
    login_usuario character varying(50) NOT NULL,
    password_usuario character varying(100) NOT NULL,
    rol_usuario character varying(20) NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19655)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 2113 (class 2604 OID 21885)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY android ALTER COLUMN id SET DEFAULT nextval('android_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 19573)
-- Name: id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id_cliente SET DEFAULT nextval('cliente_id_cliente_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 19668)
-- Name: cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente_empleado ALTER COLUMN cliente_id SET DEFAULT nextval('cliente_empleado_cliente_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 19669)
-- Name: empleado_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente_empleado ALTER COLUMN empleado_id SET DEFAULT nextval('cliente_empleado_empleado_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 19558)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario ALTER COLUMN id SET DEFAULT nextval('comentario_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 19579)
-- Name: id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado ALTER COLUMN id_empleado SET DEFAULT nextval('empleado_id_empleado_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 19588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado_proyecto ALTER COLUMN id SET DEFAULT nextval('empleado_proyecto_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 19594)
-- Name: id_password_token; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY password_token ALTER COLUMN id_password_token SET DEFAULT nextval('password_token_id_password_token_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 19567)
-- Name: id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN id_persona SET DEFAULT nextval('persona_id_persona_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 19600)
-- Name: id_pregunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta ALTER COLUMN id_pregunta SET DEFAULT nextval('pregunta_id_pregunta_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 19606)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_prueba ALTER COLUMN id SET DEFAULT nextval('pregunta_prueba_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 19612)
-- Name: id_pregunta_respuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_respuesta ALTER COLUMN id_pregunta_respuesta SET DEFAULT nextval('pregunta_respuesta_id_pregunta_respuesta_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 19618)
-- Name: id_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto ALTER COLUMN id_proyecto SET DEFAULT nextval('proyecto_id_proyecto_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 19624)
-- Name: id_prueba; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba ALTER COLUMN id_prueba SET DEFAULT nextval('prueba_id_prueba_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 19630)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_cliente ALTER COLUMN id SET DEFAULT nextval('prueba_cliente_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 19642)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_empleado ALTER COLUMN id SET DEFAULT nextval('prueba_empleado_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 19636)
-- Name: id_prueba_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_proyecto ALTER COLUMN id_prueba_proyecto SET DEFAULT nextval('prueba_proyecto_id_prueba_proyecto_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 19648)
-- Name: id_respuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta ALTER COLUMN id_respuesta SET DEFAULT nextval('respuesta_id_respuesta_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 19654)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta_empleado ALTER COLUMN id SET DEFAULT nextval('respuesta_empleado_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 19660)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2325 (class 0 OID 21882)
-- Dependencies: 219
-- Data for Name: android; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY android (id, lat, lon) FROM stdin;
\.


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 218
-- Name: android_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('android_id_seq', 20, true);


--
-- TOC entry 2292 (class 0 OID 19570)
-- Dependencies: 186
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (id_cliente, persona_id, area, puesto, nombre_empresa, habilitado) FROM stdin;
1	1	Directivos	Director General	Consultoria Human Quality Research	1
2	2	Directivos	Director General	Consultoria Human Quality Research	1
3	3	55	ggg	ggg	1
\.


--
-- TOC entry 2323 (class 0 OID 19665)
-- Dependencies: 217
-- Data for Name: cliente_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente_empleado (id_cliente_empleado, cliente_id, empleado_id) FROM stdin;
\.


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 215
-- Name: cliente_empleado_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_empleado_cliente_id_seq', 1, false);


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 216
-- Name: cliente_empleado_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_empleado_empleado_id_seq', 1, false);


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 185
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_cliente_seq', 3, true);


--
-- TOC entry 2288 (class 0 OID 19555)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (id, nombre, correo, comentario) FROM stdin;
\.


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 181
-- Name: comentario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comentario_id_seq', 1, false);


--
-- TOC entry 2294 (class 0 OID 19576)
-- Dependencies: 188
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleado (id_empleado, persona_id, direccion, horas_x_semana, carrera, estado_civil, numero_hijos, fecha_nacimiento, antiguedad, sueldo_mensual, sexo, candidato, area, puesto, nombre_empresa, habilitado) FROM stdin;
\.


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 187
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleado_id_empleado_seq', 1, false);


--
-- TOC entry 2296 (class 0 OID 19585)
-- Dependencies: 190
-- Data for Name: empleado_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleado_proyecto (id, empleado_id, proyecto_id, habilitado) FROM stdin;
\.


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 189
-- Name: empleado_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleado_proyecto_id_seq', 1, false);


--
-- TOC entry 2298 (class 0 OID 19591)
-- Dependencies: 192
-- Data for Name: password_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY password_token (id_password_token, usuario_password_token, token_password_token, date_password_token) FROM stdin;
\.


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 191
-- Name: password_token_id_password_token_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('password_token_id_password_token_seq', 1, false);


--
-- TOC entry 2290 (class 0 OID 19564)
-- Dependencies: 184
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona (id_persona, correo, nombre, apellido_paterno, apellido_materno, telefono_local, telefono_movil, usuario_id) FROM stdin;
1	juanmanuel_s_n@hotmail.com	Marco	Estrada	Robles	57627914	5568709342	1
2	celara91@gmail.com	Marco	Estrada	Robles	57627914	5568709342	2
3	gg@gg.com	ggg	gg		55	55	3
\.


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 183
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_id_persona_seq', 3, true);


--
-- TOC entry 2300 (class 0 OID 19597)
-- Dependencies: 194
-- Data for Name: pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta (id_pregunta, nombre_pregunta, habilitado) FROM stdin;
1	No pierdo la concentración cuando se presentan eventos inesperados en mi trabajo.	1
2	Aunque las situaciones no sean estables, soy totalmente competente.	1
3	Es difícil para mí encarar eventos inesperados.	1
4	Me cuesta trabajo ser una persona madura.	1
5	Mi desempeño es igual de bueno en diferentes entornos.	1
6	Tengo agilidad mental.	1
7	Soy una persona madura que sabe cómo actuar en eventos impredecibles.	1
8	Me considero hábil para resolver eventos inesperados.	1
9	Aunque las situaciones en mi trabajo sean inciertas, soy capaz de encararlas.	1
10	Aunque no conozca a fondo la situación en la que me encuentre salgo adelante.	1
11	Me siento entusiasmado cuando me enfrento a un reto difícil de resolver.	1
12	Resuelvo los conflictos de forma eficaz.	1
13	No soy innovador.	1
14	Muchos me consideran una persona cuadrada.	1
15	Soy astuto para salir de los apuros.	1
16	¿Cuál es la respuesta correcta de la siguiente operación 38+21-66?	1
17	Soluciono conflictos hábilmente.	1
18	Me causa desconfianza escuchar a personas que no siguen los pasos específicos necesarios para alcanzar una meta.	1
19	Soy creativo, a menudo se me ocurren diferentes formas de hacer las cosas.	1
20	Encuentro rápidamente respuestas a los problemas.	1
21	Se me dificulta establecer nuevas relaciones personales en la empresa.	1
22	No soy comunicativo.	1
23	Algunas personas dicen que soy irritante.	1
24	La relación con mis compañeros de trabajo es limitada.	1
25	Prefiero estar solo que mal acompañado.	1
26	A veces soy inmaduro en mi trabajo.	1
27	Me enojo muy rápido si alguien me contradice.	1
28	Soy agresivo con aquellos que me provocan.	1
29	Soy tímido, me cuesta trabajo hablar con desconocidos.	1
30	Puedo ser irrespetuoso.	1
31	La iluminación es muy buena	1
32	Esta empresa sería una de las primeras en ensayar nuevas ideas	1
33	La variedad no es especialmente importante aqui	1
34	La gente expresa con franqueza lo que piensa	1
35	Aquí es importante realizar mucho trabajo	1
36	El personal se siente libre para solicitar un aumento de sueldo	1
37	Se toman enserio las frases el trabajo antes que el juego	1
38	Los jefes están siempre controlando al personal	1
39	Aqui los colores y la decoración hacen agradable el lugar de trabajo	1
40	Se espera que los empleados cumplan muy estrictamente las reglas y costumbres	1
41	Normalmente el trabajo es muy interesante	1
42	El ambiente está siempre bien ventilado	1
43	El mobiliario esta bien acomodado	1
44	Los jefes son accesibles	1
45	El cambio no importa mucho aqui	1
46	Los jefes supervisan muy estrechamente al personal	1
47	Las condiciones de pago no son claras	1
48	Siempre se exige cumplir con las metas	1
49	El amiente me gusta	1
50	Aqui se trbaja intensamente	1
\.


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 193
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_id_pregunta_seq', 50, true);


--
-- TOC entry 2302 (class 0 OID 19603)
-- Dependencies: 196
-- Data for Name: pregunta_prueba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta_prueba (id, pregunta_id, prueba_id, numero_pregunta) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
4	4	1	4
5	5	1	5
6	6	1	6
7	7	1	7
8	8	1	8
9	9	1	9
10	10	1	10
11	11	1	11
12	12	1	12
13	13	1	13
14	14	1	14
15	15	1	15
16	16	1	16
17	17	1	17
18	18	1	18
19	19	1	19
20	20	1	20
21	21	1	21
22	22	1	22
23	23	1	23
24	24	1	24
25	25	1	25
26	26	1	26
27	27	1	27
28	28	1	28
29	29	1	29
30	30	1	30
31	31	2	1
32	32	2	2
33	33	2	3
34	34	2	4
35	35	2	5
36	36	2	6
37	37	2	7
38	38	2	8
39	39	2	9
40	40	2	10
41	41	2	11
42	42	2	12
43	43	2	13
44	44	2	14
45	45	2	15
46	46	2	16
47	47	2	17
48	48	2	18
49	49	2	19
50	50	2	20
\.


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 195
-- Name: pregunta_prueba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_prueba_id_seq', 50, true);


--
-- TOC entry 2304 (class 0 OID 19609)
-- Dependencies: 198
-- Data for Name: pregunta_respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta_respuesta (id_pregunta_respuesta, pregunta_id, respuesta_id, puntaje_respuesta) FROM stdin;
1	31	1	1
2	31	2	2
3	31	11	3
4	31	3	4
5	31	4	5
6	31	5	6
7	32	1	1
8	32	2	2
9	32	11	3
10	32	3	4
11	32	4	5
12	32	5	6
13	33	1	1
14	33	2	2
15	33	11	3
16	33	3	4
17	33	4	5
18	33	5	6
19	34	1	1
20	34	2	2
21	34	11	3
22	34	3	4
23	34	4	5
24	34	5	6
25	35	1	1
26	35	2	2
27	35	11	3
28	35	3	4
29	35	4	5
30	35	5	6
31	36	1	1
32	36	2	2
33	36	11	3
34	36	3	4
35	36	4	5
36	36	5	6
37	37	1	1
38	37	2	2
39	37	11	3
40	37	3	4
41	37	4	5
42	37	5	6
43	38	1	1
44	38	2	2
45	38	11	3
46	38	3	4
47	38	4	5
48	38	5	6
49	39	1	1
50	39	2	2
51	39	11	3
52	39	3	4
53	39	4	5
54	39	5	6
55	40	1	1
56	40	2	2
57	40	11	3
58	40	3	4
59	40	4	5
60	40	5	6
61	41	1	1
62	41	2	2
63	41	11	3
64	41	3	4
65	41	4	5
66	41	5	6
67	42	1	1
68	42	2	2
69	42	11	3
70	42	3	4
71	42	4	5
72	42	5	6
73	43	1	1
74	43	2	2
75	43	11	3
76	43	3	4
77	43	4	5
78	43	5	6
79	44	1	1
80	44	2	2
81	44	11	3
82	44	3	4
83	44	4	5
84	44	5	6
85	45	1	1
86	45	2	2
87	45	11	3
88	45	3	4
89	45	4	5
90	45	5	6
91	46	1	1
92	46	2	2
93	46	11	3
94	46	3	4
95	46	4	5
96	46	5	6
97	47	1	1
98	47	2	2
99	47	11	3
100	47	3	4
101	47	4	5
102	47	5	6
103	48	1	1
104	48	2	2
105	48	11	3
106	48	3	4
107	48	4	5
108	48	5	6
109	49	1	1
110	49	2	2
111	49	11	3
112	49	3	4
113	49	4	5
114	49	5	6
115	50	1	1
116	50	2	2
117	50	11	3
118	50	3	4
119	50	4	5
120	50	5	6
121	1	1	1
122	1	2	2
123	1	3	3
124	1	4	4
125	1	5	5
126	2	1	1
127	2	2	2
128	2	3	3
129	2	4	4
130	2	5	5
131	3	1	5
132	3	2	4
133	3	3	3
134	3	4	2
135	3	5	1
136	4	1	5
137	4	2	4
138	4	3	3
139	4	4	2
140	4	5	1
141	5	1	1
142	5	2	2
143	5	3	3
144	5	4	4
145	5	5	5
146	6	1	1
147	6	2	2
148	6	3	3
149	6	4	4
150	6	5	5
151	7	1	1
152	7	2	2
153	7	3	3
154	7	4	4
155	7	5	5
156	8	1	1
157	8	2	2
158	8	3	3
159	8	4	4
160	8	5	5
161	9	1	1
162	9	2	2
163	9	3	3
164	9	4	4
165	9	5	5
166	10	1	1
167	10	2	2
168	10	3	3
169	10	4	4
170	10	5	5
171	11	1	1
172	11	2	2
173	11	3	3
174	11	4	4
175	11	5	5
176	12	1	1
177	12	2	2
178	12	3	3
179	12	4	4
180	12	5	5
181	13	1	5
182	13	2	4
183	13	3	3
184	13	4	2
185	13	5	1
186	14	1	5
187	14	2	4
188	14	3	3
189	14	4	2
190	14	5	1
191	15	1	1
192	15	2	2
193	15	3	3
194	15	4	4
195	15	5	5
196	16	6	1
197	16	7	2
198	16	8	3
199	16	9	4
200	16	10	5
201	17	1	1
202	17	2	2
203	17	3	3
204	17	4	4
205	17	5	5
206	18	1	5
207	18	2	4
208	18	3	3
209	18	4	2
210	18	5	1
211	19	1	1
212	19	2	2
213	19	3	3
214	19	4	4
215	19	5	5
216	20	1	1
217	20	2	2
218	20	3	3
219	20	4	4
220	20	5	5
221	21	1	5
222	21	2	4
223	21	3	3
224	21	4	2
225	21	5	1
226	22	1	5
227	22	2	4
228	22	3	3
229	22	4	2
230	22	5	1
231	23	1	5
232	23	2	4
233	23	3	3
234	23	4	2
235	23	5	1
236	24	1	5
237	24	2	4
238	24	3	3
239	24	4	2
240	24	5	1
241	25	1	5
242	25	2	4
243	25	3	3
244	25	4	2
245	25	5	1
246	26	1	5
247	26	2	4
248	26	3	3
249	26	4	2
250	26	5	1
251	27	1	5
252	27	2	4
253	27	3	3
254	27	4	2
255	27	5	1
256	28	1	5
257	28	2	4
258	28	3	3
259	28	4	2
260	28	5	1
261	29	1	5
262	29	2	4
263	29	3	3
264	29	4	2
265	29	5	1
266	30	1	5
267	30	2	4
268	30	3	3
269	30	4	2
270	30	5	1
\.


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 197
-- Name: pregunta_respuesta_id_pregunta_respuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_respuesta_id_pregunta_respuesta_seq', 270, true);


--
-- TOC entry 2306 (class 0 OID 19615)
-- Dependencies: 200
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto (id_proyecto, cliente_id, nombre_proyecto, descripcion, fecha_inicio, fecha_fin, habilitado) FROM stdin;
\.


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 199
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_proyecto_seq', 1, false);


--
-- TOC entry 2308 (class 0 OID 19621)
-- Dependencies: 202
-- Data for Name: prueba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prueba (id_prueba, nombre_prueba, descripcion_prueba, habilitado) FROM stdin;
1	Adaptabilidad laboral	Esta prueba es para la posibilidad de adaptarse a un nuevo entorno de trabajo	1
2	Clima laboral	A continuación, encontrará unas frases relacionadas con el trabajo. Están pensadas para distintos ambientes laborales, pero puede que no se ajusten del todo al lugar donde trabaja. Trate de acomodarlas a su propio caso.	1
\.


--
-- TOC entry 2310 (class 0 OID 19627)
-- Dependencies: 204
-- Data for Name: prueba_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prueba_cliente (id, prueba_id, cliente_id, habilitado) FROM stdin;
\.


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 203
-- Name: prueba_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prueba_cliente_id_seq', 1, false);


--
-- TOC entry 2314 (class 0 OID 19639)
-- Dependencies: 208
-- Data for Name: prueba_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prueba_empleado (id, empleado_id, prueba_id, puntaje_prueba, fecha_prueba) FROM stdin;
\.


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 207
-- Name: prueba_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prueba_empleado_id_seq', 1, false);


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 201
-- Name: prueba_id_prueba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prueba_id_prueba_seq', 2, true);


--
-- TOC entry 2312 (class 0 OID 19633)
-- Dependencies: 206
-- Data for Name: prueba_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prueba_proyecto (id_prueba_proyecto, prueba_id, proyecto_id, puntaje_prueba, fecha_creacion, habilitado) FROM stdin;
\.


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 205
-- Name: prueba_proyecto_id_prueba_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prueba_proyecto_id_prueba_proyecto_seq', 1, false);


--
-- TOC entry 2316 (class 0 OID 19645)
-- Dependencies: 210
-- Data for Name: respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY respuesta (id_respuesta, nombre_respuesta, habilitado) FROM stdin;
1	Totalmente de acuerdo	1
2	De acuerdo	1
3	Ni de acuerdo ni en desacuerdo	1
4	En desacuerdo	1
5	Totalmente en desacuerdo	1
6	-5	1
7	-6	1
8	7	1
9	6	1
10	-7	1
11	Sí	1
12	No	1
\.


--
-- TOC entry 2318 (class 0 OID 19651)
-- Dependencies: 212
-- Data for Name: respuesta_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY respuesta_empleado (id, pregunta_respuesta_id, empleado_id) FROM stdin;
\.


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 211
-- Name: respuesta_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('respuesta_empleado_id_seq', 1, false);


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 209
-- Name: respuesta_id_respuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('respuesta_id_respuesta_seq', 12, true);


--
-- TOC entry 2320 (class 0 OID 19657)
-- Dependencies: 214
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id_usuario, login_usuario, password_usuario, rol_usuario) FROM stdin;
1	admin	4c2af4fe40426094a2ec8c6584999a00	ROLE_ADMIN
2	admin	4c2af4fe40426094a2ec8c6584999a00	ROLE_ADMIN
3	Nombre_Usuario	a98f6f64e6cdfac22ab2ffd15a7241e3	ROLE_CLIENTE
\.


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 3, true);


--
-- TOC entry 2153 (class 2606 OID 21890)
-- Name: android_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY android
    ADD CONSTRAINT android_pkey PRIMARY KEY (id);


--
-- TOC entry 2151 (class 2606 OID 19695)
-- Name: cliente_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente_empleado
    ADD CONSTRAINT cliente_empleado_pkey PRIMARY KEY (id_cliente_empleado);


--
-- TOC entry 2121 (class 2606 OID 19675)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 2115 (class 2606 OID 19671)
-- Name: comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 19677)
-- Name: empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 2125 (class 2606 OID 19701)
-- Name: empleado_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado_proyecto
    ADD CONSTRAINT empleado_proyecto_pkey PRIMARY KEY (id);


--
-- TOC entry 2127 (class 2606 OID 19679)
-- Name: password_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY password_token
    ADD CONSTRAINT password_token_pkey PRIMARY KEY (id_password_token);


--
-- TOC entry 2117 (class 2606 OID 19707)
-- Name: persona_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_correo_key UNIQUE (correo);


--
-- TOC entry 2119 (class 2606 OID 19673)
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 2129 (class 2606 OID 19681)
-- Name: pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT pregunta_pkey PRIMARY KEY (id_pregunta);


--
-- TOC entry 2131 (class 2606 OID 19699)
-- Name: pregunta_prueba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_prueba
    ADD CONSTRAINT pregunta_prueba_pkey PRIMARY KEY (id);


--
-- TOC entry 2133 (class 2606 OID 19683)
-- Name: pregunta_respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_respuesta
    ADD CONSTRAINT pregunta_respuesta_pkey PRIMARY KEY (id_pregunta_respuesta);


--
-- TOC entry 2135 (class 2606 OID 19685)
-- Name: proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id_proyecto);


--
-- TOC entry 2139 (class 2606 OID 19705)
-- Name: prueba_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_cliente
    ADD CONSTRAINT prueba_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 19703)
-- Name: prueba_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_empleado
    ADD CONSTRAINT prueba_empleado_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 19687)
-- Name: prueba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba
    ADD CONSTRAINT prueba_pkey PRIMARY KEY (id_prueba);


--
-- TOC entry 2141 (class 2606 OID 19689)
-- Name: prueba_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_proyecto
    ADD CONSTRAINT prueba_proyecto_pkey PRIMARY KEY (id_prueba_proyecto);


--
-- TOC entry 2147 (class 2606 OID 19697)
-- Name: respuesta_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta_empleado
    ADD CONSTRAINT respuesta_empleado_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 19691)
-- Name: respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta
    ADD CONSTRAINT respuesta_pkey PRIMARY KEY (id_respuesta);


--
-- TOC entry 2149 (class 2606 OID 19693)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2155 (class 2606 OID 19713)
-- Name: cliente_persona_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES persona(id_persona) MATCH FULL;


--
-- TOC entry 2156 (class 2606 OID 19718)
-- Name: empleado_persona_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES persona(id_persona) MATCH FULL;


--
-- TOC entry 2157 (class 2606 OID 19723)
-- Name: empleado_proyecto_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado_proyecto
    ADD CONSTRAINT empleado_proyecto_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado) MATCH FULL;


--
-- TOC entry 2158 (class 2606 OID 19728)
-- Name: empleado_proyecto_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado_proyecto
    ADD CONSTRAINT empleado_proyecto_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES proyecto(id_proyecto) MATCH FULL;


--
-- TOC entry 2159 (class 2606 OID 19798)
-- Name: password_token_usuario_password_token_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY password_token
    ADD CONSTRAINT password_token_usuario_password_token_fkey FOREIGN KEY (usuario_password_token) REFERENCES usuario(id_usuario) MATCH FULL;


--
-- TOC entry 2154 (class 2606 OID 19708)
-- Name: persona_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario) MATCH FULL;


--
-- TOC entry 2160 (class 2606 OID 19743)
-- Name: pregunta_prueba_pregunta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_prueba
    ADD CONSTRAINT pregunta_prueba_pregunta_id_fkey FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta) MATCH FULL;


--
-- TOC entry 2161 (class 2606 OID 19748)
-- Name: pregunta_prueba_prueba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_prueba
    ADD CONSTRAINT pregunta_prueba_prueba_id_fkey FOREIGN KEY (prueba_id) REFERENCES prueba(id_prueba) MATCH FULL;


--
-- TOC entry 2162 (class 2606 OID 19733)
-- Name: pregunta_respuesta_pregunta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_respuesta
    ADD CONSTRAINT pregunta_respuesta_pregunta_id_fkey FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta) MATCH FULL;


--
-- TOC entry 2163 (class 2606 OID 19738)
-- Name: pregunta_respuesta_respuesta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_respuesta
    ADD CONSTRAINT pregunta_respuesta_respuesta_id_fkey FOREIGN KEY (respuesta_id) REFERENCES respuesta(id_respuesta) MATCH FULL;


--
-- TOC entry 2164 (class 2606 OID 19753)
-- Name: proyecto_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT proyecto_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente) MATCH FULL;


--
-- TOC entry 2165 (class 2606 OID 19758)
-- Name: prueba_cliente_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_cliente
    ADD CONSTRAINT prueba_cliente_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente) MATCH FULL;


--
-- TOC entry 2166 (class 2606 OID 19763)
-- Name: prueba_cliente_prueba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_cliente
    ADD CONSTRAINT prueba_cliente_prueba_id_fkey FOREIGN KEY (prueba_id) REFERENCES prueba(id_prueba) MATCH FULL;


--
-- TOC entry 2169 (class 2606 OID 19778)
-- Name: prueba_empleado_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_empleado
    ADD CONSTRAINT prueba_empleado_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado) MATCH FULL;


--
-- TOC entry 2170 (class 2606 OID 19783)
-- Name: prueba_empleado_prueba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_empleado
    ADD CONSTRAINT prueba_empleado_prueba_id_fkey FOREIGN KEY (prueba_id) REFERENCES prueba(id_prueba) MATCH FULL;


--
-- TOC entry 2168 (class 2606 OID 19773)
-- Name: prueba_proyecto_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_proyecto
    ADD CONSTRAINT prueba_proyecto_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES proyecto(id_proyecto) MATCH FULL;


--
-- TOC entry 2167 (class 2606 OID 19768)
-- Name: prueba_proyecto_prueba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prueba_proyecto
    ADD CONSTRAINT prueba_proyecto_prueba_id_fkey FOREIGN KEY (prueba_id) REFERENCES prueba(id_prueba) MATCH FULL;


--
-- TOC entry 2172 (class 2606 OID 19793)
-- Name: respuesta_empleado_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta_empleado
    ADD CONSTRAINT respuesta_empleado_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado) MATCH FULL;


--
-- TOC entry 2171 (class 2606 OID 19788)
-- Name: respuesta_empleado_pregunta_respuesta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta_empleado
    ADD CONSTRAINT respuesta_empleado_pregunta_respuesta_id_fkey FOREIGN KEY (pregunta_respuesta_id) REFERENCES pregunta_respuesta(id_pregunta_respuesta) MATCH FULL;


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-02-15 21:53:02

--
-- PostgreSQL database dump complete
--

