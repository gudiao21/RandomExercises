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
    clients c ON o.client_id = c.id
WHERE
    --WILDCARD 'LIKE'
    b.title LIKE '%Journey into%';
-------------------------------------------------------------------------

SELECT * FROM books b;
SELECT * FROM authors a WHERE "name" LIKE '%or 1';
SELECT * FROM books b WHERE "title" LIKE '%Art of%';
SELECT * FROM books b WHERE "title" LIKE '%ing';
SELECT * FROM books b WHERE "title" NOT LIKE '%of%';
SELECT * FROM books b WHERE "title" ilike '%science%';