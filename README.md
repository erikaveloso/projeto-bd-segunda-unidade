# 📚 Banco de Dados - Biblioteca

Este projeto define a estrutura de um banco de dados para uma biblioteca, incluindo tabelas, chaves primárias/estrangeiras e dados fictícios para simulação de operações.

---

## 📘 Tabelas

```sql
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(150),
    id_autor INT,
    id_categoria INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_usuario INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE itens_emprestimo (
    id_emprestimo INT,
    id_livro INT,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimos(id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
```

---

## 📋 Dados Fictícios

### Inserção de Usuários

```sql
INSERT INTO usuarios VALUES
(1, 'Alice', 'alice@email.com', 'Feminino'),
(2, 'Carol', 'carol@email.com', 'Feminino'),
(3, 'Clara', 'clara@email.com', 'Feminino'),
(4, 'Erika', 'erika@email.com', 'Feminino'),
(5, 'Luiz', 'luiz@email.com', 'Masculino'),
(6, 'Felipe', 'felipe@email.com', 'Masculino'),
(7, 'Gabriela', 'gabriela@email.com', 'Feminino'),
(8, 'Henrique', 'henrique@email.com', 'Masculino'),
(9, 'Isadora', 'isadora@email.com', 'Feminino'),
(10, 'João', 'joao@email.com', 'Masculino'),
(11, 'Fernanda', 'fernanda@email.com', 'Feminino'),
(12, 'Gabriela', 'gabriela@email.com', 'Feminino'),
(13, 'Helena', 'helena@email.com', 'Feminino'),
(14, 'Igor', 'igor@email.com', 'Masculino'),
(15, 'Juliana', 'juliana@email.com', 'Feminino'),
(16, 'Lucas', 'lucas@email.com', 'Masculino'),
(17, 'Mariana', 'mariana@email.com', 'Feminino'),
(18, 'Nicolas', 'nicolas@email.com', 'Masculino'),
(19, 'Olívia', 'olivia@email.com', 'Feminino'),
(20, 'Pedro', 'pedro@email.com', 'Masculino'),
(21, 'Rafael', 'rafael@email.com', 'Masculino'),
(22, 'Sofia', 'sofia@email.com', 'Feminino'),
(23, 'Thiago', 'thiago@email.com', 'Masculino'),
(24, 'Valentina', 'valentina@email.com', 'Feminino'),
(25, 'Wesley', 'wesley@email.com', 'Masculino'),
(26, 'Xênia', 'xenia@email.com', 'Feminino'),
(27, 'Yuri', 'yuri@email.com', 'Masculino'),
(28, 'Zara', 'zara@email.com', 'Feminino'),
(29, 'André', 'andre@email.com', 'Masculino'),
(30, 'Beatriz', 'beatriz@email.com', 'Feminino');
```

### Remoção de Usuário

```sql
DELETE FROM usuarios
WHERE email = 'joana@email.com';
```

### Inserção de Autores

```sql
INSERT INTO autores VALUES
(1, 'Machado de Assis'),
(2, 'Clarice Lispector'),
(3, 'George Orwell'),
(4, 'J.K. Rowling'),
(5, 'J.R.R. Tolkien'),
(6, 'Gabriel García Márquez'),
(7, 'Franz Kafka'),
(8, 'Jane Austen'),
(9, 'Stephen King'),
(10, 'Agatha Christie'),
(11, 'H.P. Lovecraft'),
(12, 'Virginia Woolf'),
(13, 'Leo Tolstoy'),
(14, 'Mary Shelley'),
(15, 'Edgar Allan Poe');
```

### Inserção de Categorias

```sql
INSERT INTO categorias VALUES
(1, 'Romance'),
(2, 'Ficção Científica'),
(3, 'Fantasia'),
(4, 'Drama'),
(5, 'Clássico'),
(6, 'Suspense'),
(7, 'Mistério'),
(8, 'Biografia'),
(9, 'Aventura'),
(10, 'Psicológico');
```

### Inserção de Livros

```sql
INSERT INTO livros VALUES
(1, 'Dom Casmurro', 1, 1),
(2, 'A Hora da Estrela', 2, 4),
(3, '1984', 3, 2),
(4, 'Harry Potter e a Pedra Filosofal', 4, 3),
(5, 'O Senhor dos Anéis', 5, 3),
(6, 'Memórias Póstumas de Brás Cubas', 1, 5),
(7, 'O Hobbit', 5, 3),
(8, 'Revolução dos Bichos', 3, 2),
(9, 'Perto do Coração Selvagem', 2, 1),
(10, 'Quincas Borba', 1, 5),
(11, 'Cem Anos de Solidão', 6, 1),
(12, 'A Metamorfose', 7, 10),
(13, 'Orgulho e Preconceito', 8, 1),
(14, 'O Iluminado', 9, 6),
(15, 'Assassinato no Expresso Oriente', 10, 7),
(16, 'Harry Potter e a Câmara Secreta', 4, 3),
(17, 'Harry Potter e o Prisioneiro de Azkaban', 4, 3),
(18, 'Harry Potter e o Cálice de Fogo', 4, 3),
(19, 'Harry Potter e a Ordem da Fênix', 4, 3),
(20, 'Harry Potter e o Enigma do Príncipe', 4, 3),
(21, 'Harry Potter e as Relíquias da Morte', 4, 3),
(22, 'Ensaio sobre a Cegueira', 2, 4),
(23, 'O Alienista', 1, 5),
(24, 'O Silmarillion', 5, 3),
(25, 'A Sociedade do Anel', 5, 3),
(26, 'O Chamado de Cthulhu', 11, 6),
(27, 'Mrs Dalloway', 12, 4),
(28, 'Guerra e Paz', 13, 5),
(29, 'Frankenstein', 14, 2),
(30, 'O Corvo', 15, 6),
(31, 'As Ondas', 12, 4),
(32, 'Anna Kariênina', 13, 1),
(33, 'Histórias Extraordinárias', 15, 7),
(34, 'A Última Esperança da Terra', 14, 2),
(35, 'A Sombra Sobre Innsmouth', 11, 6);
```


## Views Adicionais

```sql
CREATE VIEW vw_livros_por_categoria AS
SELECT
    c.nome AS categoria,
    COUNT(l.id_livro) AS total_livros
FROM livros l
JOIN categorias c ON l.id_categoria = c.id_categoria
GROUP BY c.nome;
```

```sql
CREATE VIEW vw_livros_mais_emprestados AS
SELECT
    l.titulo,
    COUNT(ie.id_livro) AS total_emprestimos
FROM itens_emprestimo ie
JOIN livros l ON ie.id_livro = l.id_livro
GROUP BY l.titulo
ORDER BY total_emprestimos DESC;
```

---

### 📊 Dashboardo criado no PowerBi

<div align="center">

![](/dashboard.png)

</div>

