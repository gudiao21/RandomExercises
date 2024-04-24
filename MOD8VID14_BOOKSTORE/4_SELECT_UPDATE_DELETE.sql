SELECT * FROM authors a;
SELECT * FROM books b;
SELECT * FROM author_books ab;
SELECT * FROM clients c;
SELECT * FROM salers s;
SELECT * FROM orders o;
SELECT * FROM book_orders bo;
SELECT *FROM publishing_houses ph;
SELECT * FROM book_publishing_houses bph;

SELECT * FROM authors WHERE id = 2;

SELECT id, client_id, saler_id FROM orders;

--Esta consulta retorna o 'name' e 'birthdate' da tabela 'authors' e o 'title', 'genre', 'language_from' e 'price'
--da tabela 'books' para cada 'autor' que está associado a um 'livro' na tabela 'author_books'. Isto porque as
--tabelas estão associadas por 'author_books'
SELECT a.name, a.birthdate, b.title, b.language_from, b.price
FROM authors a
JOIN author_books ab ON a.id = ab.author_id
JOIN books b ON ab.book_id = b.id;

--Consulta para somar todos os 'totais' de vendas para cada 'cliente', gerando assim um grande 'sub_total',
--podendo ser usado em qualquer parte do programa:
SELECT SUM(total) AS sub_total FROM orders;

SELECT
    b.title AS book_title,
    a.name AS author_name,
    o.id AS order_id,
    s.name AS saler_name,
    ph.name AS publishing_house_name,
    c.name AS client_name
FROM
    books b
JOIN
    authors a ON b.id = a.id
JOIN
    author_books ab ON a.id = ab.author_id AND b.id = ab.book_id
JOIN
    orders o ON b.id = o.id
JOIN
    salers s ON o.id = s.id
JOIN
    book_publishing_houses bph ON b.id = bph.book_id
JOIN
    publishing_houses ph ON bph.publishing_house_id = ph.id
JOIN
    clients c ON o.client_id = c.id;


UPDATE clients
SET name = 'Luciano Dantas'
WHERE id = 1;
---------------------------------------------------------------------
INSERT INTO authors (name, birthdate)
VALUES
('Autor 31', '1965-01-01');

DELETE FROM clients WHERE id = 31;
---------------------------------------------------------------------