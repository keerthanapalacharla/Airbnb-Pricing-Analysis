SELECT
    neighbourhood_group,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(reviews_per_month), 2) AS avg_reviews_per_month,
    COUNT(*) AS listings
FROM dbo.airbnb_nyc_clean
WHERE reviews_per_month IS NOT NULL
GROUP BY neighbourhood_group
ORDER BY avg_price DESC;
