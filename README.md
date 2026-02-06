# Airbnb Pricing Analysis (SQL)

## Project Overview
This project looks at how Airbnb pricing affects demand and revenue.  
Many hosts keep prices low assuming it will increase bookings. I wanted to check whether higher prices actually reduce demand, and whether hosts might be underpricing their listings.

The analysis focuses on pricing patterns, demand behavior, and how results differ by room type, location, and season.

---

## Business Question
**Are Airbnb hosts underpricing their listings?**  
How does price impact demand, and where are the best pricing opportunities?

---

## Dataset
- NYC Airbnb Open Data (Kaggle)
- ~48,000 listings

Main columns used:
- `price`
- `room_type`
- `neighbourhood_group`
- `reviews_per_month`
- `last_review`

> Booking or occupancy data was not available.  
> Reviews per month is used as a proxy for demand.

---

## Tools Used
- SQL Server (CTEs, window functions, aggregations)
- MySQL (same logic, minor syntax differences)
- Basic data cleaning and validation

---

## Analysis Approach

### 1. Price vs Demand
Listings were grouped into 5 price buckets using `NTILE`.  
Average demand (reviews per month) was compared across price levels.

**Observation:**  
Demand decreases as price increases, but the drop is gradual, not sharp.

---

### 2. Revenue Perspective
To understand whether higher prices are worth it, I created a simple revenue proxy:

