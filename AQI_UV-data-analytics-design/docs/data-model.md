# Data Model Design

This document describes the proposed relational data model for storing environmental monitoring data such as AQI and UV index values.

## Core Table: environmental_readings

| Column Name     | Type        | Description |
|-----------------|-------------|-------------|
| id              | BIGSERIAL   | Primary key |
| latitude        | FLOAT       | Geographic latitude |
| longitude       | FLOAT       | Geographic longitude |
| city            | VARCHAR     | Optional city name |
| measurement_ts  | TIMESTAMP   | Time of measurement (UTC) |
| aqi             | SMALLINT    | Air Quality Index (1–5) |
| pm2_5           | FLOAT       | PM2.5 concentration |
| pm10            | FLOAT       | PM10 concentration |
| no2             | FLOAT       | NO₂ concentration |
| uv_index        | FLOAT       | UV index value |
| source          | VARCHAR     | Data source identifier |

## Indexing Strategy

- Composite index on (latitude, longitude, measurement_ts)
- Index on measurement_ts for time-range queries

## Design Considerations

- Time-series optimized queries
- Support for historical aggregation
- Separation between ingestion and analytics layers
