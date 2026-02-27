-- 1. Visão Geral: Taxa de Churn da Empresa 
WITH Base_Status AS (
    SELECT 
        status_churn,
        COUNT(customer_id) AS total_clientes
    FROM 
        vw_churn_analytics
    GROUP BY 
        status_churn
)

SELECT 
    status_churn,
    total_clientes,
    ROUND((total_clientes * 100.0) / SUM(total_clientes) OVER (), 2) AS porcentagem_total
FROM 
    Base_Status
ORDER BY 
    total_clientes DESC;

-- 2. Análise de Churn por Tipo de Contrato
WITH Contagem_Base AS (
    SELECT 
        tipo_contrato,
        COUNT(customer_id) AS total_clientes,
        SUM(CASE WHEN status_churn = 'Cancelou' THEN 1 ELSE 0 END) AS cancelamentos
    FROM 
        vw_churn_analytics
    GROUP BY 
        tipo_contrato
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


-- 3. Análise de Churn por Tempo de Casa (Cohort/Tenure)
WITH Faixas_Tempo AS (
    SELECT 
        faixa_tempo_permanencia AS faixa_tempo,
        COUNT(customer_id) AS total_clientes,
        SUM(CASE WHEN status_churn = 'Cancelou' THEN 1 ELSE 0 END) AS cancelamentos
    FROM 
        vw_churn_analytics
    GROUP BY 
        faixa_tempo_permanencia
)

SELECT 
    faixa_tempo,
    total_clientes,
    cancelamentos,
    ROUND((cancelamentos * 100.0) / total_clientes, 2) AS taxa_churn_percentual
FROM 
    Faixas_Tempo
ORDER BY 
    faixa_tempo;


-- 4. Impacto Financeiro: Receita Mensal Perdida
SELECT 
    CASE 
        WHEN status_churn = 'Cancelou' THEN 'Receita Perdida (Churn)'
        ELSE 'Receita Retida (Ativos)'
    END AS status_financeiro,
    SUM(valor_mensal) AS valor_mensal_total,
    ROUND((SUM(valor_mensal) * 100.0) / SUM(SUM(valor_mensal)) OVER (), 2) AS porcentagem_receita
FROM 
    vw_churn_analytics
GROUP BY 
    status_churn
ORDER BY 
    valor_mensal_total DESC;


-- 5. O Impacto do Suporte Técnico na Retenção
WITH Base_Suporte AS (
    SELECT 
        suporte_tecnico,
        COUNT(customer_id) AS total_clientes,
        SUM(CASE WHEN status_churn = 'Cancelou' THEN 1 ELSE 0 END) AS cancelamentos
    FROM 
        vw_churn_analytics
    WHERE 
        suporte_tecnico != 'No internet service'
    GROUP BY 
        suporte_tecnico
)

SELECT 
    suporte_tecnico,
    total_clientes,
    cancelamentos,
    ROUND((cancelamentos * 100.0) / total_clientes, 2) AS taxa_churn_percentual
FROM 
    Base_Suporte
ORDER BY 
    taxa_churn_percentual DESC;