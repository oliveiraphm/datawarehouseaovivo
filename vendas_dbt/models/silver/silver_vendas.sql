{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(data) AS data,
        valor, 
        quantidade, 
        produto
    FROM 
        {{ ref('bronze_vendas') }}
    WHERE 
        valor > 1000
        AND valor < 6000
        AND data <= CURRENT_DATE
)

SELECT * FROM cleaned_data