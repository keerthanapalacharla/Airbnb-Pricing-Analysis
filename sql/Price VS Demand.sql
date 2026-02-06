-- Do higher prices reduce demand?

WITH price_bucketed AS (
    SELECT
        price,
        reviews_per_month,
        NTILE(5) OVER (ORDER BY price) AS price_bucket
    FROM dbo.airbnb_nyc_clean
    WHERE reviews_per_month IS NOT NULL
)
SELECT
    price_bucket,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(reviews_per_month), 2) AS avg_reviews_per_month,
    COUNT(*) AS listings
FROM price_bucketed
GROUP BY price_bucket
ORDER BY price_bucket;

