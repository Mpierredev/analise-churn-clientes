# 📊 Análise de Churn de Clientes (Telecom)

**Status do Projeto:** 🟡 Em Desenvolvimento (Fase de Dados concluída; Fase de Visualização pendente)

## 🎯 O Problema de Negócio
O *Churn* (taxa de cancelamento) é uma das métricas mais críticas para empresas de serviços por assinatura. Este projeto tem como objetivo analisar uma base de dados de uma empresa de Telecomunicações para identificar quem são os clientes que estão cancelando seus serviços e por que isso está acontecendo. 

A solução envolve a construção de um pipeline de dados de ponta a ponta: extração, limpeza, armazenamento em banco de dados relacional e análise exploratória.

## 🛠️ Arquitetura e Tecnologias
- **Linguagem:** Python
- **Banco de Dados:** PostgreSQL
- **Gerenciador de BD:** DBeaver
- **Controle de Versão:** Git e GitHub
- **Visualização (Roadmap):** Tableau

## 📂 Estrutura do Projeto
```text
analise-churn-clientes/
├── data/
│   ├── raw/                 # Dados originais (imutáveis)
│   └── processed/           # Dados limpos e prontos para uso (opcional)
├── notebooks/
│   └── analise_churn.ipynb  # Pipeline ETL (Extração, Transformação e Carga)
├── sql/
│   ├── 01_create_tables.sql       # DDL para criação do schema e tabelas
│   └── 02_analise_exploratoria.sql # Queries de negócio (CTEs e Window Functions)
├── .env.example             # Template seguro de variáveis de ambiente
├── .gitignore               # Arquivos ignorados pelo Git
└── README.md                # Documentação do projeto