# 🍔 iFood Delivery Analytics

> Análise end-to-end do ecossistema de delivery brasileiro: clientes, restaurantes e comportamento de compra.

## 📌 Contexto de negócio

Plataformas de delivery enfrentam três desafios centrais:
- Como **aumentar a frequência de pedidos** por cliente?
- Quais clientes estão em risco de **churn** e merecem ação imediata?
- Como **priorizar restaurantes e regiões** com maior potencial de crescimento?

Este projeto simula o trabalho de um Data Analyst no time iFood Brain, respondendo essas perguntas com dados reais do e-commerce brasileiro (Olist).

---

## 🗂️ Estrutura do projeto
```
ifood-delivery-analytics/
│
├── data/
│   ├── raw/          # Dados originais (não versionados)
│   └── processed/    # Dados tratados
│
├── sql/              # Queries analíticas
├── notebooks/
│   ├── 01_eda_kpis.ipynb         # Análise exploratória e KPIs
│   ├── 02_cohort_retention.ipynb # Cohort e retenção de clientes
│   └── 03_rfm_churn.ipynb        # Segmentação RFM e modelo de churn
│
├── dashboard/        # Arquivo Power BI (.pbix)
├── reports/          # Relatório executivo em PDF
├── requirements.txt
└── README.md
```

---

## 🔍 Módulos de análise

### 1. EDA e KPIs de negócio
Métricas de pedidos, ticket médio, sazonalidade e performance por região.
→ `notebooks/01_eda_kpis.ipynb`

### 2. Análise de Cohort e Retenção
Curvas de retenção mensais, LTV estimado e identificação de pontos críticos de abandono.
→ `notebooks/02_cohort_retention.ipynb`

### 3. Segmentação RFM e Modelo de Churn
Segmentação de clientes por RFM com K-Means + modelo preditivo de churn com XGBoost.
→ `notebooks/03_rfm_churn.ipynb`

### 4. Dashboard Executivo
Visão consolidada de GMV, pedidos, retenção e alertas por segmento.
→ `dashboard/ifood_analytics.pbix`

---

## 🛠️ Tecnologias

![Python](https://img.shields.io/badge/Python-3.10+-blue)
![SQL](https://img.shields.io/badge/SQL-SQLite-lightgrey)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Scikit-learn](https://img.shields.io/badge/ML-Scikit--learn%20%7C%20XGBoost-orange)

---

## ▶️ Como executar
```bash
git clone https://github.com/vpereiranunes/ifood-delivery-analytics.git
cd ifood-delivery-analytics
python -m venv .venv && .venv\Scripts\activate
pip install -r requirements.txt
jupyter notebook
```

---

## 👤 Autor
**Vinícius Nunes** · [LinkedIn](https://www.linkedin.com/in/viniciusp-nunes) · [Kaggle](https://kaggle.com/viniciuspnunes)