# KiosWarga - Micro-Retail & POS Database Schema (MySQL)

KiosWarga is a production-ready, highly-customizable MySQL database template tailored for small business retail management, Point of Sales (POS) software, or academic projects. It incorporates automated stock deduction, a customer loyalty system, and analytical views for business tracking.

## Features
- **Relational Tables:** Well-defined tables including `suppliers`, `categories`, `products`, `members`, and `transactions`.
- **Automated Inventory Tracking:** Equipped with an `AFTER INSERT` trigger (`after_sale_insert`) that instantly decrements warehouse stock levels (`stok_gudang`) upon every completed transaction.
- **Member Loyalty Feature:** Built-in membership support tracking customer profiles and shopping points (`poin_belanja`).
- **Financial Analytics View:** Includes a pre-compiled database view (`v_laporan_profit`) that calculates gross revenue, total capital costs, and net profit dynamically.

## Getting Started
1. Open your database tool (e.g., phpMyAdmin, MySQL Workbench, DBeaver).
2. Create your database schema:
   ```sql
   CREATE DATABASE db_kioswarga;
   USE db_kioswarga;
