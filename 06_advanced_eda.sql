-- Netflix SQL Analysis: Advanced EDA
SELECT
    type,
    COUNT(*) AS content_count,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM netflix_titles), 2) AS percentage
FROM netflix_titles
GROUP BY type;

SELECT
    release_year,
    COUNT(*) AS content_count,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM netflix_titles), 2) AS percentage
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;

SELECT rating, type, COUNT(*) AS content_count
FROM netflix_titles
GROUP BY rating, type
ORDER BY content_count DESC;

SELECT country, COUNT(*) AS title_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank
FROM netflix_titles
GROUP BY country;

SELECT director, COUNT(*) AS title_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS director_rank
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director;

SELECT country, COUNT(*) AS title_count
FROM netflix_titles
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY title_count DESC;
