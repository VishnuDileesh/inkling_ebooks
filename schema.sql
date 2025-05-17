--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.5 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: books_author; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_author (
    id integer NOT NULL,
    birth_year smallint,
    death_year smallint,
    name character varying(128) NOT NULL
);


ALTER TABLE public.books_author OWNER TO inkling_db_owner;

--
-- Name: books_author_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_author_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_author_id_seq OWNED BY public.books_author.id;


--
-- Name: books_book; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_book (
    id integer NOT NULL,
    download_count integer,
    gutenberg_id integer NOT NULL,
    media_type character varying(16) NOT NULL,
    title character varying(1024),
    CONSTRAINT books_book_download_count_check CHECK ((download_count >= 0)),
    CONSTRAINT books_book_gutenberg_id_check CHECK ((gutenberg_id >= 0))
);


ALTER TABLE public.books_book OWNER TO inkling_db_owner;

--
-- Name: books_book_authors; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_book_authors (
    id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.books_book_authors OWNER TO inkling_db_owner;

--
-- Name: books_book_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_book_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_authors_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_book_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_book_authors_id_seq OWNED BY public.books_book_authors.id;


--
-- Name: books_book_bookshelves; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_book_bookshelves (
    id integer NOT NULL,
    book_id integer NOT NULL,
    bookshelf_id integer NOT NULL
);


ALTER TABLE public.books_book_bookshelves OWNER TO inkling_db_owner;

--
-- Name: books_book_bookshelves_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_book_bookshelves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_bookshelves_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_book_bookshelves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_book_bookshelves_id_seq OWNED BY public.books_book_bookshelves.id;


--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books_book.id;


--
-- Name: books_book_languages; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_book_languages (
    id integer NOT NULL,
    book_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.books_book_languages OWNER TO inkling_db_owner;

--
-- Name: books_book_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_book_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_languages_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_book_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_book_languages_id_seq OWNED BY public.books_book_languages.id;


--
-- Name: books_book_subjects; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_book_subjects (
    id integer NOT NULL,
    book_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.books_book_subjects OWNER TO inkling_db_owner;

--
-- Name: books_book_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_book_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_subjects_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_book_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_book_subjects_id_seq OWNED BY public.books_book_subjects.id;


--
-- Name: books_bookshelf; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_bookshelf (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.books_bookshelf OWNER TO inkling_db_owner;

--
-- Name: books_bookshelf_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_bookshelf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_bookshelf_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_bookshelf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_bookshelf_id_seq OWNED BY public.books_bookshelf.id;


--
-- Name: books_format; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_format (
    id integer NOT NULL,
    mime_type character varying(32) NOT NULL,
    url character varying(256) NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.books_format OWNER TO inkling_db_owner;

--
-- Name: books_format_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_format_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_format_id_seq OWNED BY public.books_format.id;


--
-- Name: books_language; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_language (
    id integer NOT NULL,
    code character varying(4) NOT NULL
);


ALTER TABLE public.books_language OWNER TO inkling_db_owner;

--
-- Name: books_language_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_language_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_language_id_seq OWNED BY public.books_language.id;


--
-- Name: books_subject; Type: TABLE; Schema: public; Owner: inkling_db_owner
--

CREATE TABLE public.books_subject (
    id integer NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.books_subject OWNER TO inkling_db_owner;

--
-- Name: books_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: inkling_db_owner
--

CREATE SEQUENCE public.books_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_subject_id_seq OWNER TO inkling_db_owner;

--
-- Name: books_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inkling_db_owner
--

ALTER SEQUENCE public.books_subject_id_seq OWNED BY public.books_subject.id;


--
-- Name: books_author id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_author ALTER COLUMN id SET DEFAULT nextval('public.books_author_id_seq'::regclass);


--
-- Name: books_book id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book ALTER COLUMN id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- Name: books_book_authors id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_authors ALTER COLUMN id SET DEFAULT nextval('public.books_book_authors_id_seq'::regclass);


--
-- Name: books_book_bookshelves id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_bookshelves ALTER COLUMN id SET DEFAULT nextval('public.books_book_bookshelves_id_seq'::regclass);


--
-- Name: books_book_languages id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_languages ALTER COLUMN id SET DEFAULT nextval('public.books_book_languages_id_seq'::regclass);


--
-- Name: books_book_subjects id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_subjects ALTER COLUMN id SET DEFAULT nextval('public.books_book_subjects_id_seq'::regclass);


--
-- Name: books_bookshelf id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_bookshelf ALTER COLUMN id SET DEFAULT nextval('public.books_bookshelf_id_seq'::regclass);


--
-- Name: books_format id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_format ALTER COLUMN id SET DEFAULT nextval('public.books_format_id_seq'::regclass);


--
-- Name: books_language id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_language ALTER COLUMN id SET DEFAULT nextval('public.books_language_id_seq'::regclass);


--
-- Name: books_subject id; Type: DEFAULT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_subject ALTER COLUMN id SET DEFAULT nextval('public.books_subject_id_seq'::regclass);


--
-- Name: books_author books_author_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_author
    ADD CONSTRAINT books_author_pkey PRIMARY KEY (id);


--
-- Name: books_book_authors books_book_authors_book_id_8714badb_uniq; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_authors
    ADD CONSTRAINT books_book_authors_book_id_8714badb_uniq UNIQUE (book_id, author_id);


--
-- Name: books_book_authors books_book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_authors
    ADD CONSTRAINT books_book_authors_pkey PRIMARY KEY (id);


--
-- Name: books_book_bookshelves books_book_bookshelves_book_id_6016a70a_uniq; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_bookshelves
    ADD CONSTRAINT books_book_bookshelves_book_id_6016a70a_uniq UNIQUE (book_id, bookshelf_id);


--
-- Name: books_book_bookshelves books_book_bookshelves_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_bookshelves
    ADD CONSTRAINT books_book_bookshelves_pkey PRIMARY KEY (id);


--
-- Name: books_book books_book_gutenberg_id_key; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_gutenberg_id_key UNIQUE (gutenberg_id);


--
-- Name: books_book_languages books_book_languages_book_id_554fdccb_uniq; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_languages
    ADD CONSTRAINT books_book_languages_book_id_554fdccb_uniq UNIQUE (book_id, language_id);


--
-- Name: books_book_languages books_book_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_languages
    ADD CONSTRAINT books_book_languages_pkey PRIMARY KEY (id);


--
-- Name: books_book books_book_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_pkey PRIMARY KEY (id);


--
-- Name: books_book_subjects books_book_subjects_book_id_74dcf64a_uniq; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_subjects
    ADD CONSTRAINT books_book_subjects_book_id_74dcf64a_uniq UNIQUE (book_id, subject_id);


--
-- Name: books_book_subjects books_book_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_subjects
    ADD CONSTRAINT books_book_subjects_pkey PRIMARY KEY (id);


--
-- Name: books_bookshelf books_bookshelf_name_key; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_bookshelf
    ADD CONSTRAINT books_bookshelf_name_key UNIQUE (name);


--
-- Name: books_bookshelf books_bookshelf_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_bookshelf
    ADD CONSTRAINT books_bookshelf_pkey PRIMARY KEY (id);


--
-- Name: books_format books_format_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_format
    ADD CONSTRAINT books_format_pkey PRIMARY KEY (id);


--
-- Name: books_language books_language_code_key; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_language
    ADD CONSTRAINT books_language_code_key UNIQUE (code);


--
-- Name: books_language books_language_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_language
    ADD CONSTRAINT books_language_pkey PRIMARY KEY (id);


--
-- Name: books_subject books_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_subject
    ADD CONSTRAINT books_subject_pkey PRIMARY KEY (id);


--
-- Name: books_book_authors_0a4572cc; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_authors_0a4572cc ON public.books_book_authors USING btree (book_id);


--
-- Name: books_book_authors_4f331e2f; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_authors_4f331e2f ON public.books_book_authors USING btree (author_id);


--
-- Name: books_book_bookshelves_0a4572cc; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_bookshelves_0a4572cc ON public.books_book_bookshelves USING btree (book_id);


--
-- Name: books_book_bookshelves_40928700; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_bookshelves_40928700 ON public.books_book_bookshelves USING btree (bookshelf_id);


--
-- Name: books_book_languages_0a4572cc; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_languages_0a4572cc ON public.books_book_languages USING btree (book_id);


--
-- Name: books_book_languages_468679bd; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_languages_468679bd ON public.books_book_languages USING btree (language_id);


--
-- Name: books_book_subjects_0a4572cc; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_subjects_0a4572cc ON public.books_book_subjects USING btree (book_id);


--
-- Name: books_book_subjects_ffaba1d1; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_book_subjects_ffaba1d1 ON public.books_book_subjects USING btree (subject_id);


--
-- Name: books_bookshelf_name_2642cad6_like; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_bookshelf_name_2642cad6_like ON public.books_bookshelf USING btree (name varchar_pattern_ops);


--
-- Name: books_format_0a4572cc; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_format_0a4572cc ON public.books_format USING btree (book_id);


--
-- Name: books_language_code_217c406c_like; Type: INDEX; Schema: public; Owner: inkling_db_owner
--

CREATE INDEX books_language_code_217c406c_like ON public.books_language USING btree (code varchar_pattern_ops);


--
-- Name: books_book_authors books_book_authors_author_id_984f1ab8_fk_books_author_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_authors
    ADD CONSTRAINT books_book_authors_author_id_984f1ab8_fk_books_author_id FOREIGN KEY (author_id) REFERENCES public.books_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_authors books_book_authors_book_id_ed3433e7_fk_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_authors
    ADD CONSTRAINT books_book_authors_book_id_ed3433e7_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_bookshelves books_book_bookshel_bookshelf_id_80cc77c5_fk_books_bookshelf_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_bookshelves
    ADD CONSTRAINT books_book_bookshel_bookshelf_id_80cc77c5_fk_books_bookshelf_id FOREIGN KEY (bookshelf_id) REFERENCES public.books_bookshelf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_bookshelves books_book_bookshelves_book_id_f820ff72_fk_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_bookshelves
    ADD CONSTRAINT books_book_bookshelves_book_id_f820ff72_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_languages books_book_languages_book_id_e833b1f4_fk_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_languages
    ADD CONSTRAINT books_book_languages_book_id_e833b1f4_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_languages books_book_languages_language_id_e9f60572_fk_books_language_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_languages
    ADD CONSTRAINT books_book_languages_language_id_e9f60572_fk_books_language_id FOREIGN KEY (language_id) REFERENCES public.books_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_subjects books_book_subjects_book_id_a578cff2_fk_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_subjects
    ADD CONSTRAINT books_book_subjects_book_id_a578cff2_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book_subjects books_book_subjects_subject_id_7445958f_fk_books_subject_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_book_subjects
    ADD CONSTRAINT books_book_subjects_subject_id_7445958f_fk_books_subject_id FOREIGN KEY (subject_id) REFERENCES public.books_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_format books_format_book_id_b948fa34_fk_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: inkling_db_owner
--

ALTER TABLE ONLY public.books_format
    ADD CONSTRAINT books_format_book_id_b948fa34_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

