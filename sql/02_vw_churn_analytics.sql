-- Criação da Camada Semântica (View) para BI
-- Objetivo: Fornecer dados limpos, traduzidos e categorizados para o Tableau

DROP VIEW IF EXISTS vw_churn_analytics;

CREATE OR REPLACE VIEW vw_churn_analytics AS
SELECT 
    customer_id,
    CASE WHEN gender = 'Male' THEN 'Masculino' ELSE 'Feminino' END AS genero,
    CASE WHEN senior_citizen = 1 THEN 'Sim' ELSE 'Não' END AS idoso,
    CASE WHEN partner = 'Yes' THEN 'Sim' ELSE 'Não' END AS possui_parceiro,
    CASE WHEN dependents = 'Yes' THEN 'Sim' ELSE 'Não' END AS possui_dependentes,
    
    tenure AS meses_permanencia,
    CASE 
        WHEN tenure <= 12 THEN '1. Até 1 ano'
        WHEN tenure <= 24 THEN '2. 1 a 2 anos'
        WHEN tenure <= 48 THEN '3. 2 a 4 anos'
        ELSE '4. Mais de 4 anos'
    END AS faixa_tempo_permanencia,
    
    CASE 
        WHEN contract = 'Month-to-month' THEN 'Mensal'
        WHEN contract = 'One year' THEN 'Anual (1 Ano)'
        WHEN contract = 'Two year' THEN 'Bienal (2 Anos)'
        ELSE contract 
    END AS tipo_contrato,
    
    CASE 
        WHEN payment_method = 'Electronic check' THEN 'Cheque Eletrônico'
        WHEN payment_method = 'Mailed check' THEN 'Cheque Físico'
        WHEN payment_method = 'Bank transfer (automatic)' THEN 'Transferência Bancária'
        WHEN payment_method = 'Credit card (automatic)' THEN 'Cartão de Crédito'
        ELSE payment_method 
    END AS metodo_pagamento,
    
    CASE WHEN tech_support = 'Yes' THEN 'Sim' WHEN tech_support = 'No' THEN 'Não' ELSE 'Sem Internet' END AS suporte_tecnico,
    CASE WHEN online_security = 'Yes' THEN 'Sim' WHEN online_security = 'No' THEN 'Não' ELSE 'Sem Internet' END AS seguranca_online,
    
    monthly_charges AS valor_mensal,
    total_charges AS valor_total,
    CASE WHEN churn = 'Yes' THEN 'Cancelou' ELSE 'Ativo' END AS status_churn

FROM 
    raw_customers;