-- Netflix SQL Analysis: Intermediate EDA
SELECT country, COUNT(title) AS title_count
FROM netflix_titles
GROUP BY country ORDER BY title_count DESC;

SELECT rating, type, COUNT(*) AS content_count
FROM netflix_titles
GROUP BY rating, type
ORDER BY rating, content_count DESC;

SELECT director, COUNT(*) AS title_count
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
HAVING COUNT(*) > 2
ORDER BY title_count DESC;

SELECT listed_in, type, COUNT(*) AS content_count
FROM netflix_titles
GROUP BY listed_in, type
ORDER BY content_count DESC;

SELECT country, type, COUNT(*) AS content_count
FROM netflix_titles
GROUP BY country, type
ORDER BY country, content_count DESC;
