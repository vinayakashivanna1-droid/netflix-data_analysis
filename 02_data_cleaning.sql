-- Netflix SQL Analysis: Data Cleaning
SELECT COUNT(*) AS total_records FROM netflix_titles;

SELECT show_id, COUNT(*) AS duplicate_count
FROM netflix_titles GROUP BY show_id HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS duplicate_count
FROM netflix_titles GROUP BY title HAVING COUNT(*) > 1;

SELECT title, release_year, type, COUNT(*) AS duplicate_count
FROM netflix_titles
GROUP BY title, release_year, type
HAVING COUNT(*) > 1;

SELECT
    SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS missing_title,
    SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS missing_director,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
    SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS missing_description
FROM netflix_titles;

SELECT * FROM netflix_titles WHERE TRIM(title) = '';

UPDATE netflix_titles SET title = TRIM(title);
UPDATE netflix_titles SET country = TRIM(country);
UPDATE netflix_titles SET director = TRIM(director);
UPDATE netflix_titles SET rating = TRIM(rating);
UPDATE netflix_titles SET type = TRIM(type);

UPDATE netflix_titles SET type = 'Movie' WHERE LOWER(type) = 'movie';
UPDATE netflix_titles SET type = 'TV Show' WHERE LOWER(type) = 'tv show';

SELECT DISTINCT type FROM netflix_titles;

SELECT * FROM netflix_titles
WHERE type NOT IN ('Movie', 'TV Show');

SELECT DISTINCT rating FROM netflix_titles ORDER BY rating;

UPDATE netflix_titles SET rating = 'Unknown' WHERE rating IS NULL;
UPDATE netflix_titles SET director = 'Unknown' WHERE director IS NULL;

SELECT * FROM netflix_titles
WHERE release_year < 1900 OR release_year > YEAR(CURDATE());

SELECT * FROM netflix_titles
WHERE (type = 'Movie' AND duration LIKE '%Season%')
   OR (type = 'TV Show' AND duration LIKE '%min%');
