SELECT
    CASE
        WHEN MONTH(last_review) IN (6,7,8,12) THEN 'Peak Season'
        WHEN MONTH(last_review) IN (4,5,9,10) THEN 'Shoulder Season'
        ELSE 'Low Season'
    END AS season,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(price * reviews_per_month), 2) AS est_revenue
FROM dbo.airbnb_nyc_clean
WHERE last_review IS NOT NULL
GROUP BY
    CASE
        WHEN MONTH(last_review) IN (6,7,8,12) THEN 'Peak Season'
        WHEN MONTH(last_review) IN (4,5,9,10) THEN 'Shoulder Season'
        ELSE 'Low Season'
    END
ORDER BY est_revenue DESC;
