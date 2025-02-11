SELECT DISTINCT p.name AS app_name,
	a.rating AS apple_rating,
	p.rating AS google_rating,
	a.review_count::NUMERIC AS apple_review_count,
	ROUND((a.rating + p.rating) /2,2) AS avg_rating,
	a.content_rating AS apple_content_rating,
	p.content_rating AS google_content_rating, p.genres AS google_genre,
	a.primary_genre AS apple_genre
FROM app_store_apps AS a
	INNER JOIN play_store_apps AS p USING (name)
WHERE a.rating >= 4.5
	AND p.rating >= 4.5
	AND a.price = 0.00 AND p.price = '0'
	AND p.name ILIKE 'Domino%'
	OR p.name ILIKE 'Geometry Dash Lite'
	OR p.name ILIKE 'Doordash%'
	OR p.name ILIKE 'Cooking%'
ORDER BY apple_rating DESC, google_rating DESC, apple_review_count DESC

My answer for --3c