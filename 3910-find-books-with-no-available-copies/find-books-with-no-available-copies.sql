# Write your MySQL query statement below
SELECT L.book_id, L.title, L.author, L.genre, L.publication_year, COUNT(B.record_id) AS current_borrowers
FROM library_books L
JOIN borrowing_records B
ON L.book_id = B.book_id
WHERE B.return_date IS NULL
GROUP BY L.book_id, L.title, L.author, L.genre, L.publication_year, L.total_copies
HAVING COUNT(B.record_id) = L.total_copies
ORDER BY current_borrowers DESC, L.title ASC;
