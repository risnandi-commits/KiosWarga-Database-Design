<img width="2464" height="2374" alt="ERD_KiosWarga_db" src="https://github.com/user-attachments/assets/c640139e-0af0-4952-96d7-ba263cd3ae0e" />
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

## Entity-Relationship Diagram (ERD)

![KiosWarga ERD](ERD_KiosWarga_db.jpg)

### Database Schema Overview

This database is designed to optimize small-scale retail (UMKM) operations by integrating inventory tracking with a loyalty program.

| Entity | Primary Key | Foreign Key | Description |
| :--- | :--- | :--- | :--- |
| **Suppliers** | `supplier_id` | None | Manages vendor information. |
| **Categories** | `category_id` | None | Organizes products into categories. |
| **Products** | `product_id` | `category_id`, `supplier_id` | Core inventory and pricing details. |
| **Members** | `member_id` | None | Tracks customer loyalty and points. |
| **Transactions** | `transaction_id` | `product_id`, `member_id` | Records sales, discounts, and timestamps. |

### Key Features
* 📦 **Inventory Automation**: Automatically updates stock levels using database triggers.
* 💳 **Loyalty Integration**: Supports member-based transactions with discount calculations.
* 📊 **Profit Analytics**: Built-in views to monitor sales performance and net profit.
