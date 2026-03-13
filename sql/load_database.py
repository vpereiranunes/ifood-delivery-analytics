import pandas as pd
import sqlite3
import os

conn = sqlite3.connect("data/processed/olist.db")

arquivos = {
    "orders":       "olist_orders_dataset.csv",
    "order_items":  "olist_order_items_dataset.csv",
    "customers":    "olist_customers_dataset.csv",
    "products":     "olist_products_dataset.csv",
    "sellers":      "olist_sellers_dataset.csv",
    "reviews":      "olist_order_reviews_dataset.csv",
    "geolocation":  "olist_geolocation_dataset.csv",
    "category_translation": "product_category_name_translation.csv",
}

for tabela, arquivo in arquivos.items():
    caminho = f"data/raw/{arquivo}"
    if os.path.exists(caminho):
        df = pd.read_csv(caminho)
        df.to_sql(tabela, conn, if_exists="replace", index=False)
        print(f"✅ {tabela} carregada ({len(df):,} linhas)")
    else:
        print(f"⚠️  Arquivo não encontrado: {arquivo}")

conn.close()
print("\n✅ Banco de dados criado em data/processed/olist.db")