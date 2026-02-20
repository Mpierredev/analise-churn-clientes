-- ========================================================================
-- Projeto: Análise de Churn de Clientes
-- Arquivo: 01_create_tables.sql
-- Objetivo: Criação da estrutura inicial (DDL) na base churn_clients
-- ========================================================================

DROP TABLE IF EXISTS raw_customers CASCADE;

CREATE TABLE raw_customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    senior_citizen INTEGER,
    partner VARCHAR(5),
    dependents VARCHAR(5),
    tenure INTEGER,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(50),
    internet_service VARCHAR(50),
    online_security VARCHAR(50),
    online_backup VARCHAR(50),
    device_protection VARCHAR(50),
    tech_support VARCHAR(50),
    streaming_tv VARCHAR(50),
    streaming_movies VARCHAR(50),
    contract VARCHAR(50),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),
    monthly_charges NUMERIC(10,2),
    total_charges NUMERIC(10,2),
    churn VARCHAR(5)
);