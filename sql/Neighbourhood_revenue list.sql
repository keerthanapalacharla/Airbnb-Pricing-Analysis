WITH price_bucketed AS (
    SELECT
        neighbourhood_group,
        price,
        reviews_per_month,
        NTILE(5) OVER (ORDER BY price) AS price_bucket
    FROM dbo.airbnb_nyc_clean
    WHERE reviews_per_month IS NOT NULL
)
SELECT
    neighbourhood_group,
    price_bucket,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(reviews_per_month), 2) AS avg_reviews_per_month,
    ROUND(AVG(price * reviews_per_month), 2) AS est_revenue,
    COUNT(*) AS listings
FROM price_bucketed
GROUP BY neighbourhood_group, price_bucket
ORDER BY neighbourhood_group, price_bucket;
