-- checking DB seed data against online source data
-- make sure authors match with paper titles

USE keep_up_seeds; 

SELECT SUBSTRING(title,1, 32) AS 'Title', journal_id AS 'journal',  GROUP_CONCAT(last_name) AS 'Author(s)'
FROM papers
INNER JOIN paper_authors
    ON papers.id = paper_authors.paper_id
INNER JOIN authors
    ON paper_authors.author_id = authors.id
GROUP BY papers.id;