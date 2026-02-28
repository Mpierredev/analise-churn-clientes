# 📊 Análise de Churn de Clientes (Telecom)

**Status do Projeto:** 🟡 Em Desenvolvimento

## 🎯 O Problema de Negócio
O *Churn* (taxa de cancelamento) é uma das métricas mais críticas para empresas de serviços por assinatura. Este projeto tem como objetivo analisar uma base de dados de uma empresa de Telecomunicações para identificar quem são os clientes que estão cancelando seus serviços e por que isso está acontecendo. 

A solução construída é um Pipeline de Dados completo: extração, tratamento padronizado, modelagem relacional, criação de camada semântica e análise exploratória estruturada.

## 🛠️ Arquitetura e Tecnologias
- **Linguagem:** Python 3 (Pandas, SQLAlchemy, python-dotenv)
- **Banco de Dados:** PostgreSQL
- **Gerenciador de BD:** DBeaver
- **Arquitetura de Dados:** ETL, Single Source of Truth (Views), Semantic Layer
- **Controle de Versão:** Git e GitHub
- **Visualização (Roadmap):** Tableau

## 📂 Estrutura do Projeto
```text
analise-churn-clientes/
├── data/
│   ├── processed/                   # Checkpoint físico dos dados limpos (CSV)
│   │   └── cleaned_telco_churn.csv
│   └── raw/                         # Dados originais brutos (imutáveis)
│       └── WA_Fn-UseC_-Telco-Customer-Churn.csv
├── notebooks/
│   └── analise_churn.ipynb          # Pipeline ETL em Python (Extract, Transform, Load)
├── sql/
│   ├── 01_create_tables.sql         # DDL para criação do schema e tabela bruta
│   ├── 02_vw_churn_analytics.sql    # Camada Semântica (View com traduções e regras de negócio)
│   └── 03_analise_exploratoria.sql  # Queries de negócio (CTEs e Window Functions consumindo a View)
├── .env.example                     # Template seguro de variáveis de ambiente
├── .gitignore                       # Arquivos ignorados pelo Git
└── README.md                        # Documentação do projeto
```
## 🚀 Como Reproduzir este Projeto

Para garantir a máxima reprodutibilidade, este projeto resolve caminhos de arquivos dinamicamente e oferece duas formas de execução: o fluxo completo (com Banco de Dados) ou o fluxo simplificado (via arquivo flat).

### Pré-requisitos Gerais
- Python 3.8+ instalado.
- Bibliotecas: `pip install pandas sqlalchemy psycopg2-binary python-dotenv notebook`

### Opção A: Fluxo Completo (PostgreSQL + Camada Semântica)
1. **Configuração de Ambiente:** Faça uma cópia do arquivo `.env.example`, renomeie para `.env` e preencha com as credenciais do seu PostgreSQL local.
2. **Modelagem Física:** Abra o DBeaver, crie um banco chamado `churn_clients` e execute o script `sql/01_create_tables.sql` para criar a estrutura DDL com tipagem forte.
3. **Pipeline ETL:** Execute todas as células do `notebooks/analise_churn.ipynb`. O script fará a limpeza, salvará um checkpoint na pasta `processed` e injetará os dados no banco de forma segura.
4. **Camada Semântica:** No DBeaver, execute o script `sql/02_vw_churn_analytics.sql` para gerar a View oficial do projeto (traduzida e categorizada).
5. **Análise Exploratória:** Execute o script `sql/03_analise_exploratoria.sql` para acessar os insights de negócio, como a taxa de churn por tipo de contrato e o impacto financeiro.

### Opção B: Fluxo Simplificado (Apenas CSV Limpo)
Se você não deseja configurar um banco de dados local, pode acessar diretamente os dados processados:

1. Abra o arquivo `notebooks/analise_churn.ipynb` e execute as células sequencialmente até o **Passo 3 (Checkpoint Físico)**.
2. O script gerará automaticamente o arquivo `cleaned_telco_churn.csv` na pasta `data/processed/` sem tentar conectar ao banco de dados.
3. Você pode importar este arquivo em qualquer ferramenta (Excel, Power BI, Tableau) para consumo imediato.

## 🗺️ Roadmap e Evolução do Projeto
- [x] Construção do Pipeline ETL modularizado em Python.
- [x] Modelagem Física e Carga Segura no PostgreSQL.
- [x] Implementação de Camada Semântica (View) para padronização de regras de negócio.
- [x] Análise Exploratória (EDA) com SQL Avançado.
- [ ] Conexão da View consolidada no Tableau.
- [ ] Criação do Dashboard interativo de Churn e Perfil de Cliente.