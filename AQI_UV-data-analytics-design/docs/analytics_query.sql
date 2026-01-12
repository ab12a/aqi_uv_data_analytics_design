-- Average AQI per city per day
SELECT
    city,
    DATE(measurement_ts) AS day,
    AVG(aqi) AS avg_aqi
FROM environmental_readings
GROUP BY city, DATE(measurement_ts)
ORDER BY day DESC;

-- Highest pollution readings in the last 7 days
SELECT
    city,
    MAX(pm2_5) AS max_pm2_5
FROM environmental_readings
WHERE measurement_ts >= NOW() - INTERVAL '7 days'
GROUP BY city;

-- UV index trend for a specific location
SELECT
    measurement_ts,
    uv_index
FROM environmental_readings
WHERE latitude = :lat AND longitude = :lon
ORDER BY measurement_ts;
