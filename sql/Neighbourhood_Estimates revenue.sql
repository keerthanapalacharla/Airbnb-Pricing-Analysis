SELECT
    neighbourhood_group,
    ROUND(AVG(price * reviews_per_month), 2) AS est_revenue,
    COUNT(*) AS listings
FROM dbo.airbnb_nyc_clean
WHERE reviews_per_month IS NOT NULL
GROUP BY neighbourhood_group
ORDER BY est_revenue DESC;
