SELECT
    MONTH(last_review) AS review_month,
    DATENAME(MONTH, last_review) AS month_name,
    COUNT(*) AS total_reviews,
    ROUND(AVG(reviews_per_month), 2) AS avg_reviews_per_month
FROM dbo.airbnb_nyc_clean
WHERE last_review IS NOT NULL
GROUP BY MONTH(last_review), DATENAME(MONTH, last_review)
ORDER BY review_month;
