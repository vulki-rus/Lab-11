-- Проверка, что все таблицы пустые
SELECT 'dim_client' AS table_name, COUNT(*) AS row_count FROM dw.dim_client
UNION ALL
SELECT 'dim_car', COUNT(*) FROM dw.dim_car
UNION ALL
SELECT 'dim_employee', COUNT(*) FROM dw.dim_employee
UNION ALL
SELECT 'dim_location', COUNT(*) FROM dw.dim_location
UNION ALL
SELECT 'dim_client_demography', COUNT(*) FROM dw.dim_client_demography
UNION ALL
SELECT 'dim_date', COUNT(*) FROM dw.dim_date
UNION ALL
SELECT 'fact_sales', COUNT(*) FROM dw.fact_sales
ORDER BY table_name;

-- Заполнение таблица дат
INSERT INTO dw.dim_date (full_date, year, month, month_name, day, day_of_week, day_name)
SELECT 
    datum,
    EXTRACT(YEAR FROM datum)::INTEGER,
    EXTRACT(MONTH FROM datum)::INTEGER,
    TO_CHAR(datum, 'Month'),
    EXTRACT(DAY FROM datum)::INTEGER,
    EXTRACT(DOW FROM datum)::INTEGER,
    TO_CHAR(datum, 'Day')
FROM generate_series('2022-01-01'::DATE, '2026-12-31'::DATE, '1 day'::INTERVAL) AS datum;