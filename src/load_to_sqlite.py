import pandas as pd
import sqlite3
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]
DATA_PROCESSED = BASE / "data" / "processed"
DB_PATH = BASE / "data" / "ecommerce.db"

def main():
    conn = sqlite3.connect(DB_PATH)

    orders = pd.read_csv(DATA_PROCESSED / "orders_clean.csv", parse_dates=["order_date", "ship_date"])
    customers = pd.read_csv(DATA_PROCESSED / "customers_clean.csv")
    products = pd.read_csv(DATA_PROCESSED / "products_clean.csv")

    orders.to_sql("orders", conn, if_exists="replace", index=False)
    customers.to_sql("customers", conn, if_exists="replace", index=False)
    products.to_sql("products", conn, if_exists="replace", index=False)

    conn.close()
    print(f"Loaded tables into {DB_PATH}")

if __name__ == "__main__":
    main()
