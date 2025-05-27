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

![dashboard](https://github.com/user-attachments/assets/2624a7cb-848f-4bf6-a07c-2a7063c3ca33)
