-- 1. Visão Geral: Taxa de Churn da Empresa 
WITH Base_Status AS (
    SELECT 
        CASE 
            WHEN churn = 'Yes' THEN 'Cancelou o Serviço (Churn)'
            WHEN churn = 'No' THEN 'Cliente Ativo (Retido)'
            ELSE 'Não Informado'
        END AS status_cliente,
        
        COUNT(customer_id) AS total_clientes
    FROM 
        raw_customers
    GROUP BY 
        churn
)

SELECT 
    status_cliente,
    total_clientes,
    ROUND((total_clientes * 100.0) / SUM(total_clientes) OVER (), 2) AS porcentagem_total
FROM 
    Base_Status
ORDER BY 
    total_clientes DESC;

-- 2. Análise de Churn por Tipo de Contrato (Versão Limpa com CTE)
WITH Contagem_Base AS (
    SELECT 
        contract AS tipo_contrato,
        COUNT(customer_id) AS total_clientes,
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS cancelamentos
    FROM 
        raw_customers
    GROUP BY 
        contract
)

SELECT 
    tipo_contrato,
    total_clientes,
    cancelamentos,
    ROUND((cancelamentos * 100.0) / total_clientes, 2) AS taxa_churn_percentual
FROM 
    Contagem_Base
ORDER BY 
    taxa_churn_percentual DESC;