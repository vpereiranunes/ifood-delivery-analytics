import os
import zipfile

# Baixa o dataset Olist direto pela API do Kaggle
os.system("kaggle datasets download -d olistbr/brazilian-ecommerce -p data/raw")

# Descompacta
with zipfile.ZipFile("data/raw/brazilian-ecommerce.zip", "r") as z:
    z.extractall("data/raw")

print("✅ Dados baixados e extraídos em data/raw/")