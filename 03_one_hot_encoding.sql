-- Netflix SQL Analysis: One-Hot Encoding for rating
SELECT rating, COUNT(*) AS content_count
FROM netflix_titles
GROUP BY rating ORDER BY content_count DESC;

SELECT
    show_id,
    title,
    rating,
    CASE WHEN rating = 'TV-MA' THEN 1 ELSE 0 END AS rating_TV_MA,
    CASE WHEN rating = 'TV-14' THEN 1 ELSE 0 END AS rating_TV_14,
    CASE WHEN rating = 'TV-PG' THEN 1 ELSE 0 END AS rating_TV_PG,
    CASE WHEN rating = 'TV-G' THEN 1 ELSE 0 END AS rating_TV_G,
    CASE WHEN rating = 'TV-Y' THEN 1 ELSE 0 END AS rating_TV_Y,
    CASE WHEN rating = 'TV-Y7' THEN 1 ELSE 0 END AS rating_TV_Y7,
    CASE WHEN rating = 'R' THEN 1 ELSE 0 END AS rating_R,
    CASE WHEN rating = 'PG-13' THEN 1 ELSE 0 END AS rating_PG_13,
    CASE WHEN rating = 'PG' THEN 1 ELSE 0 END AS rating_PG,
    CASE WHEN rating = 'G' THEN 1 ELSE 0 END AS rating_G,
    CASE WHEN rating = 'Unknown' THEN 1 ELSE 0 END AS rating_Unknown
FROM netflix_titles;
