
BEGIN;


CREATE TABLE IF NOT EXISTS public.author_tbl
(
    age integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid NOT NULL,
    created_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    updated_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT author_tbl_pkey PRIMARY KEY (id),
    CONSTRAINT author_tbl_email_key UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS public.authors_courses
(
    author_id uuid NOT NULL,
    course_id uuid NOT NULL
);

CREATE TABLE IF NOT EXISTS public.course_tbl
(
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid NOT NULL,
    created_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    updated_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT course_tbl_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.lecture_tbl
(
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid NOT NULL,
    resource_id uuid,
    section_id uuid,
    created_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    updated_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT lecture_tbl_pkey PRIMARY KEY (id),
    CONSTRAINT lecture_tbl_resource_id_key UNIQUE (resource_id)
);

CREATE TABLE IF NOT EXISTS public.resource_tbl
(
    size integer NOT NULL,
    url integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid NOT NULL,
    lecture_id uuid,
    created_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    updated_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT resource_tbl_pkey PRIMARY KEY (id),
    CONSTRAINT resource_tbl_lecture_id_key UNIQUE (lecture_id)
);

CREATE TABLE IF NOT EXISTS public.section_tbl
(
    orders integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    course_id uuid,
    id uuid NOT NULL,
    created_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    updated_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT section_tbl_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.authors_courses
    ADD CONSTRAINT fk18x5tfp70n54kkc34wobxmlfy FOREIGN KEY (author_id)
    REFERENCES public.author_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.authors_courses
    ADD CONSTRAINT fkip6yl5x0so9xi0kfr8m41s5ny FOREIGN KEY (course_id)
    REFERENCES public.course_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.lecture_tbl
    ADD CONSTRAINT fk2tj6jtiq0v5f5fsxsuv8y7ekx FOREIGN KEY (section_id)
    REFERENCES public.section_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.lecture_tbl
    ADD CONSTRAINT fkbn6hxnojy3ju1ygbi2kkrhco1 FOREIGN KEY (resource_id)
    REFERENCES public.resource_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS lecture_tbl_resource_id_key
    ON public.lecture_tbl(resource_id);


ALTER TABLE IF EXISTS public.resource_tbl
    ADD CONSTRAINT fkh53qal2m76xwtajpvnl3drapm FOREIGN KEY (lecture_id)
    REFERENCES public.lecture_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS resource_tbl_lecture_id_key
    ON public.resource_tbl(lecture_id);


ALTER TABLE IF EXISTS public.section_tbl
    ADD CONSTRAINT fk69n339slrf3afq23jjfcranyq FOREIGN KEY (course_id)
    REFERENCES public.course_tbl (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;