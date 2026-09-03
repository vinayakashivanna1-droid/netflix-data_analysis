-- Netflix SQL Analysis: Basic EDA
SELECT title, COUNT(*) AS title_count
FROM netflix_titles GROUP BY title ORDER BY title_count DESC;

SELECT type, COUNT(*) AS content_count
FROM netflix_titles GROUP BY type ORDER BY content_count DESC;

SELECT director, COUNT(*) AS title_count
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director ORDER BY title_count DESC;

SELECT country, COUNT(*) AS title_count
FROM netflix_titles GROUP BY country ORDER BY title_count DESC;

SELECT listed_in, COUNT(*) AS content_count
FROM netflix_titles GROUP BY listed_in ORDER BY content_count DESC;

SELECT release_year, COUNT(*) AS content_count
FROM netflix_titles GROUP BY release_year ORDER BY release_year DESC;

SELECT rating, COUNT(*) AS content_count
FROM netflix_titles GROUP BY rating ORDER BY content_count DESC;

SELECT country, COUNT(director) AS director_count
FROM netflix_titles GROUP BY country ORDER BY director_count DESC;
