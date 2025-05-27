--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2025-05-27 11:18:45

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
-- TOC entry 7 (class 2615 OID 16555)
-- Name: biblioteca; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA biblioteca;


ALTER SCHEMA biblioteca OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16573)
-- Name: autores; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.autores (
    id_autor integer NOT NULL,
    nome character varying(100)
);


ALTER TABLE biblioteca.autores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16578)
-- Name: categorias; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.categorias (
    id_categoria integer NOT NULL,
    nome character varying(100)
);


ALTER TABLE biblioteca.categorias OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16598)
-- Name: emprestimos; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.emprestimos (
    id_emprestimo integer NOT NULL,
    id_usuario integer,
    data_emprestimo date,
    data_devolucao date
);


ALTER TABLE biblioteca.emprestimos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16608)
-- Name: itens_emprestimo; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.itens_emprestimo (
    id_emprestimo integer NOT NULL,
    id_livro integer NOT NULL
);


ALTER TABLE biblioteca.itens_emprestimo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16583)
-- Name: livros; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.livros (
    id_livro integer NOT NULL,
    titulo character varying(150),
    id_autor integer,
    id_categoria integer
);


ALTER TABLE biblioteca.livros OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16568)
-- Name: usuarios; Type: TABLE; Schema: biblioteca; Owner: postgres
--

CREATE TABLE biblioteca.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(100),
    email character varying(100),
    sexo character varying(10)
);


ALTER TABLE biblioteca.usuarios OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16628)
-- Name: vw_emprestimos_por_categoria; Type: VIEW; Schema: biblioteca; Owner: postgres
--

CREATE VIEW biblioteca.vw_emprestimos_por_categoria AS
 SELECT c.nome AS categoria,
    count(*) AS total_emprestimos
   FROM ((biblioteca.itens_emprestimo ie
     JOIN biblioteca.livros l ON ((ie.id_livro = l.id_livro)))
     JOIN biblioteca.categorias c ON ((l.id_categoria = c.id_categoria)))
  GROUP BY c.nome;


ALTER TABLE biblioteca.vw_emprestimos_por_categoria OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16659)
-- Name: vw_livros_mais_emprestados; Type: VIEW; Schema: biblioteca; Owner: postgres
--

CREATE VIEW biblioteca.vw_livros_mais_emprestados AS
 SELECT l.titulo,
    count(ie.id_livro) AS total_emprestimos
   FROM (biblioteca.itens_emprestimo ie
     JOIN biblioteca.livros l ON ((ie.id_livro = l.id_livro)))
  GROUP BY l.titulo
  ORDER BY (count(ie.id_livro)) DESC;


ALTER TABLE biblioteca.vw_livros_mais_emprestados OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16624)
-- Name: vw_livros_por_categoria; Type: VIEW; Schema: biblioteca; Owner: postgres
--

CREATE VIEW biblioteca.vw_livros_por_categoria AS
 SELECT c.nome AS categoria,
    count(l.id_livro) AS total_livros
   FROM (biblioteca.livros l
     JOIN biblioteca.categorias c ON ((l.id_categoria = c.id_categoria)))
  GROUP BY c.nome;


ALTER TABLE biblioteca.vw_livros_por_categoria OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 16573)
-- Dependencies: 224
-- Data for Name: autores; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.autores VALUES (1, 'Machado de Assis');
INSERT INTO biblioteca.autores VALUES (2, 'Clarice Lispector');
INSERT INTO biblioteca.autores VALUES (3, 'George Orwell');
INSERT INTO biblioteca.autores VALUES (4, 'J.K. Rowling');
INSERT INTO biblioteca.autores VALUES (5, 'J.R.R. Tolkien');
INSERT INTO biblioteca.autores VALUES (6, 'Gabriel García Márquez');
INSERT INTO biblioteca.autores VALUES (7, 'Franz Kafka');
INSERT INTO biblioteca.autores VALUES (8, 'Jane Austen');
INSERT INTO biblioteca.autores VALUES (9, 'Stephen King');
INSERT INTO biblioteca.autores VALUES (10, 'Agatha Christie');
INSERT INTO biblioteca.autores VALUES (11, 'H.P. Lovecraft');
INSERT INTO biblioteca.autores VALUES (12, 'Virginia Woolf');
INSERT INTO biblioteca.autores VALUES (13, 'Leo Tolstoy');
INSERT INTO biblioteca.autores VALUES (14, 'Mary Shelley');
INSERT INTO biblioteca.autores VALUES (15, 'Edgar Allan Poe');


--
-- TOC entry 3392 (class 0 OID 16578)
-- Dependencies: 225
-- Data for Name: categorias; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.categorias VALUES (1, 'Romance');
INSERT INTO biblioteca.categorias VALUES (2, 'Ficção Científica');
INSERT INTO biblioteca.categorias VALUES (3, 'Fantasia');
INSERT INTO biblioteca.categorias VALUES (4, 'Drama');
INSERT INTO biblioteca.categorias VALUES (5, 'Clássico');
INSERT INTO biblioteca.categorias VALUES (6, 'Suspense');
INSERT INTO biblioteca.categorias VALUES (7, 'Mistério');
INSERT INTO biblioteca.categorias VALUES (8, 'Biografia');
INSERT INTO biblioteca.categorias VALUES (9, 'Aventura');
INSERT INTO biblioteca.categorias VALUES (10, 'Psicológico');


--
-- TOC entry 3394 (class 0 OID 16598)
-- Dependencies: 227
-- Data for Name: emprestimos; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.emprestimos VALUES (1, 1, '2024-01-10', '2024-01-20');
INSERT INTO biblioteca.emprestimos VALUES (2, 2, '2024-01-15', '2024-01-25');
INSERT INTO biblioteca.emprestimos VALUES (3, 3, '2024-01-20', '2024-01-30');
INSERT INTO biblioteca.emprestimos VALUES (4, 4, '2024-02-01', '2024-02-10');
INSERT INTO biblioteca.emprestimos VALUES (5, 5, '2024-02-05', '2024-02-15');
INSERT INTO biblioteca.emprestimos VALUES (6, 1, '2024-02-20', '2024-03-01');
INSERT INTO biblioteca.emprestimos VALUES (7, 2, '2024-03-01', '2024-03-10');
INSERT INTO biblioteca.emprestimos VALUES (8, 3, '2024-03-05', '2024-03-15');
INSERT INTO biblioteca.emprestimos VALUES (9, 4, '2024-03-10', '2024-03-20');
INSERT INTO biblioteca.emprestimos VALUES (10, 5, '2024-03-15', '2024-03-25');
INSERT INTO biblioteca.emprestimos VALUES (11, 6, '2024-04-01', '2024-04-10');
INSERT INTO biblioteca.emprestimos VALUES (12, 7, '2024-04-05', '2024-04-15');
INSERT INTO biblioteca.emprestimos VALUES (13, 8, '2024-04-10', '2024-04-20');
INSERT INTO biblioteca.emprestimos VALUES (14, 9, '2024-04-12', '2024-04-22');
INSERT INTO biblioteca.emprestimos VALUES (15, 10, '2024-04-15', '2024-04-25');


--
-- TOC entry 3395 (class 0 OID 16608)
-- Dependencies: 228
-- Data for Name: itens_emprestimo; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.itens_emprestimo VALUES (1, 1);
INSERT INTO biblioteca.itens_emprestimo VALUES (1, 2);
INSERT INTO biblioteca.itens_emprestimo VALUES (2, 3);
INSERT INTO biblioteca.itens_emprestimo VALUES (3, 4);
INSERT INTO biblioteca.itens_emprestimo VALUES (3, 5);
INSERT INTO biblioteca.itens_emprestimo VALUES (4, 6);
INSERT INTO biblioteca.itens_emprestimo VALUES (5, 7);
INSERT INTO biblioteca.itens_emprestimo VALUES (5, 8);
INSERT INTO biblioteca.itens_emprestimo VALUES (6, 9);
INSERT INTO biblioteca.itens_emprestimo VALUES (7, 10);
INSERT INTO biblioteca.itens_emprestimo VALUES (8, 1);
INSERT INTO biblioteca.itens_emprestimo VALUES (9, 2);
INSERT INTO biblioteca.itens_emprestimo VALUES (9, 3);
INSERT INTO biblioteca.itens_emprestimo VALUES (10, 4);
INSERT INTO biblioteca.itens_emprestimo VALUES (10, 5);
INSERT INTO biblioteca.itens_emprestimo VALUES (11, 11);
INSERT INTO biblioteca.itens_emprestimo VALUES (12, 12);
INSERT INTO biblioteca.itens_emprestimo VALUES (12, 13);
INSERT INTO biblioteca.itens_emprestimo VALUES (13, 14);
INSERT INTO biblioteca.itens_emprestimo VALUES (14, 15);
INSERT INTO biblioteca.itens_emprestimo VALUES (14, 1);
INSERT INTO biblioteca.itens_emprestimo VALUES (15, 2);
INSERT INTO biblioteca.itens_emprestimo VALUES (15, 6);


--
-- TOC entry 3393 (class 0 OID 16583)
-- Dependencies: 226
-- Data for Name: livros; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.livros VALUES (1, 'Dom Casmurro', 1, 1);
INSERT INTO biblioteca.livros VALUES (2, 'A Hora da Estrela', 2, 4);
INSERT INTO biblioteca.livros VALUES (3, '1984', 3, 2);
INSERT INTO biblioteca.livros VALUES (4, 'Harry Potter e a Pedra Filosofal', 4, 3);
INSERT INTO biblioteca.livros VALUES (5, 'O Senhor dos Anéis', 5, 3);
INSERT INTO biblioteca.livros VALUES (6, 'Memórias Póstumas de Brás Cubas', 1, 5);
INSERT INTO biblioteca.livros VALUES (7, 'O Hobbit', 5, 3);
INSERT INTO biblioteca.livros VALUES (8, 'Revolução dos Bichos', 3, 2);
INSERT INTO biblioteca.livros VALUES (9, 'Perto do Coração Selvagem', 2, 1);
INSERT INTO biblioteca.livros VALUES (10, 'Quincas Borba', 1, 5);
INSERT INTO biblioteca.livros VALUES (11, 'Cem Anos de Solidão', 6, 1);
INSERT INTO biblioteca.livros VALUES (12, 'A Metamorfose', 7, 10);
INSERT INTO biblioteca.livros VALUES (13, 'Orgulho e Preconceito', 8, 1);
INSERT INTO biblioteca.livros VALUES (14, 'O Iluminado', 9, 6);
INSERT INTO biblioteca.livros VALUES (15, 'Assassinato no Expresso Oriente', 10, 7);
INSERT INTO biblioteca.livros VALUES (16, 'Harry Potter e a Câmara Secreta', 4, 3);
INSERT INTO biblioteca.livros VALUES (17, 'Harry Potter e o Prisioneiro de Azkaban', 4, 3);
INSERT INTO biblioteca.livros VALUES (18, 'Harry Potter e o Cálice de Fogo', 4, 3);
INSERT INTO biblioteca.livros VALUES (19, 'Harry Potter e a Ordem da Fênix', 4, 3);
INSERT INTO biblioteca.livros VALUES (20, 'Harry Potter e o Enigma do Príncipe', 4, 3);
INSERT INTO biblioteca.livros VALUES (21, 'Harry Potter e as Relíquias da Morte', 4, 3);
INSERT INTO biblioteca.livros VALUES (22, 'Ensaio sobre a Cegueira', 2, 4);
INSERT INTO biblioteca.livros VALUES (23, 'O Alienista', 1, 5);
INSERT INTO biblioteca.livros VALUES (24, 'O Silmarillion', 5, 3);
INSERT INTO biblioteca.livros VALUES (25, 'A Sociedade do Anel', 5, 3);
INSERT INTO biblioteca.livros VALUES (26, 'O Chamado de Cthulhu', 11, 6);
INSERT INTO biblioteca.livros VALUES (27, 'Mrs Dalloway', 12, 4);
INSERT INTO biblioteca.livros VALUES (28, 'Guerra e Paz', 13, 5);
INSERT INTO biblioteca.livros VALUES (29, 'Frankenstein', 14, 2);
INSERT INTO biblioteca.livros VALUES (30, 'O Corvo', 15, 6);
INSERT INTO biblioteca.livros VALUES (31, 'As Ondas', 12, 4);
INSERT INTO biblioteca.livros VALUES (32, 'Anna Kariênina', 13, 1);
INSERT INTO biblioteca.livros VALUES (33, 'Histórias Extraordinárias', 15, 7);
INSERT INTO biblioteca.livros VALUES (34, 'A Última Esperança da Terra', 14, 2);
INSERT INTO biblioteca.livros VALUES (35, 'A Sombra Sobre Innsmouth', 11, 6);


--
-- TOC entry 3390 (class 0 OID 16568)
-- Dependencies: 223
-- Data for Name: usuarios; Type: TABLE DATA; Schema: biblioteca; Owner: postgres
--

INSERT INTO biblioteca.usuarios VALUES (1, 'Alice', 'alice@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (2, 'Carol', 'carol@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (3, 'Clara', 'clara@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (4, 'Erika', 'erika@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (5, 'Luiz', 'luiz@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (6, 'Felipe', 'felipe@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (7, 'Gabriela', 'gabriela@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (8, 'Henrique', 'henrique@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (9, 'Isadora', 'isadora@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (10, 'João', 'joao@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (11, 'Fernanda', 'fernanda@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (12, 'Gabriela', 'gabriela@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (13, 'Helena', 'helena@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (14, 'Igor', 'igor@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (15, 'Juliana', 'juliana@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (16, 'Lucas', 'lucas@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (17, 'Mariana', 'mariana@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (18, 'Nicolas', 'nicolas@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (19, 'Olívia', 'olivia@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (20, 'Pedro', 'pedro@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (21, 'Rafael', 'rafael@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (22, 'Sofia', 'sofia@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (23, 'Thiago', 'thiago@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (24, 'Valentina', 'valentina@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (25, 'Wesley', 'wesley@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (26, 'Xênia', 'xenia@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (27, 'Yuri', 'yuri@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (28, 'Zara', 'zara@email.com', 'Feminino');
INSERT INTO biblioteca.usuarios VALUES (29, 'André', 'andre@email.com', 'Masculino');
INSERT INTO biblioteca.usuarios VALUES (30, 'Beatriz', 'beatriz@email.com', 'Feminino');


--
-- TOC entry 3228 (class 2606 OID 16577)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id_autor);


--
-- TOC entry 3230 (class 2606 OID 16582)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3234 (class 2606 OID 16602)
-- Name: emprestimos emprestimos_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.emprestimos
    ADD CONSTRAINT emprestimos_pkey PRIMARY KEY (id_emprestimo);


--
-- TOC entry 3236 (class 2606 OID 16612)
-- Name: itens_emprestimo itens_emprestimo_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.itens_emprestimo
    ADD CONSTRAINT itens_emprestimo_pkey PRIMARY KEY (id_emprestimo, id_livro);


--
-- TOC entry 3232 (class 2606 OID 16587)
-- Name: livros livros_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.livros
    ADD CONSTRAINT livros_pkey PRIMARY KEY (id_livro);


--
-- TOC entry 3226 (class 2606 OID 16572)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3239 (class 2606 OID 16603)
-- Name: emprestimos emprestimos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.emprestimos
    ADD CONSTRAINT emprestimos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES biblioteca.usuarios(id_usuario);


--
-- TOC entry 3240 (class 2606 OID 16613)
-- Name: itens_emprestimo itens_emprestimo_id_emprestimo_fkey; Type: FK CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.itens_emprestimo
    ADD CONSTRAINT itens_emprestimo_id_emprestimo_fkey FOREIGN KEY (id_emprestimo) REFERENCES biblioteca.emprestimos(id_emprestimo);


--
-- TOC entry 3241 (class 2606 OID 16618)
-- Name: itens_emprestimo itens_emprestimo_id_livro_fkey; Type: FK CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.itens_emprestimo
    ADD CONSTRAINT itens_emprestimo_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES biblioteca.livros(id_livro);


--
-- TOC entry 3237 (class 2606 OID 16588)
-- Name: livros livros_id_autor_fkey; Type: FK CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.livros
    ADD CONSTRAINT livros_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES biblioteca.autores(id_autor);


--
-- TOC entry 3238 (class 2606 OID 16593)
-- Name: livros livros_id_categoria_fkey; Type: FK CONSTRAINT; Schema: biblioteca; Owner: postgres
--

ALTER TABLE ONLY biblioteca.livros
    ADD CONSTRAINT livros_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES biblioteca.categorias(id_categoria);


-- Completed on 2025-05-27 11:18:46

--
-- PostgreSQL database dump complete
--

