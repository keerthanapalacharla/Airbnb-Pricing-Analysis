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
    ROUND(AVG(price * reviews_per_month), 2) AS est_revenue,
    COUNT(*) AS listings
FROM price_bucketed
GROUP BY price_bucket
ORDER BY price_bucket;
