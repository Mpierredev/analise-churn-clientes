# 📖 Dicionário de Dados: Telco Customer Churn

Este documento descreve as colunas presentes no dataset original e mapeadas na tabela estruturada `raw_customers` do banco de dados.

| Coluna | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| **customer_id** | `VARCHAR` | ID alfanumérico único de identificação do cliente. |
| **gender** | `VARCHAR` | Gênero do cliente (Male/Female). |
| **senior_citizen** | `INTEGER` | Indica se o cliente é idoso (1 = Sim, 0 = Não). |
| **partner** | `VARCHAR` | Indica se o cliente tem um parceiro/cônjuge (Yes/No). |
| **dependents** | `VARCHAR` | Indica se o cliente possui dependentes (Yes/No). |
| **tenure** | `INTEGER` | Número de **meses** que o cliente permaneceu na empresa. |
| **phone_service** | `VARCHAR` | Indica se o cliente possui serviço de telefone fixo (Yes/No). |
| **multiple_lines** | `VARCHAR` | Indica se o cliente possui múltiplas linhas telefônicas (Yes/No/No phone service). |
| **internet_service** | `VARCHAR` | Provedor de serviço de internet do cliente (DSL/Fiber optic/No). |
| **online_security** | `VARCHAR` | Indica se o cliente tem o serviço extra de segurança online (Yes/No/No internet service). |
| **online_backup** | `VARCHAR` | Indica se o cliente tem o serviço extra de backup em nuvem (Yes/No/No internet service). |
| **device_protection**| `VARCHAR` | Indica se o cliente possui plano de proteção para equipamentos (Yes/No/No internet service). |
| **tech_support** | `VARCHAR` | Indica se o cliente possui plano de suporte técnico prioritário (Yes/No/No internet service). |
| **streaming_tv** | `VARCHAR` | Indica se o cliente consome TV a cabo via internet da empresa (Yes/No/No internet service). |
| **streaming_movies** | `VARCHAR` | Indica se o cliente consome pacote de filmes da empresa (Yes/No/No internet service). |
| **contract** | `VARCHAR` | O tipo de fidelidade do contrato do cliente (Month-to-month/One year/Two year). |
| **paperless_billing**| `VARCHAR` | Indica se o cliente optou por receber faturas apenas digitais (Yes/No). |
| **payment_method** | `VARCHAR` | O método de pagamento escolhido pelo cliente (ex: Electronic check, Credit card). |
| **monthly_charges** | `NUMERIC` | O valor financeiro cobrado do cliente mensalmente. |
| **total_charges** | `NUMERIC` | O valor financeiro total cumulativo cobrado do cliente até o momento. |
| **churn** | `VARCHAR` | Variável Alvo (Target): Indica se o cliente cancelou o serviço no último mês (Yes = Cancelou, No = Permaneceu). |