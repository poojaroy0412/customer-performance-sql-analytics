
# Customer Performance & Segmentation Analytics

## 📌 Project Overview
This project involves building a data warehouse layer in MySQL to transform raw sales and customer data into actionable business intelligence. The final output is a comprehensive **Customer Reporting View** that enables the marketing team to target users based on behavior and demographics.

## 📂 Repository Structure
- `scriptscreate_tables.sql`: DDL scripts for Fact and Dimension tables.
- `data_loading_scripts.sql`: ETL scripts to import raw CSV data.
- `report_customers_view.sql`: The main transformation logic and View creation.

## 🧠 Business Logic: Customer Segmentation
I implemented a logic-based segmentation model to categorize the customer base:

- **👑 VIP:** Loyal customers (12+ months history) with high spending (>$5,000).
- **👤 Regular:** Established customers (12+ months history) with standard spending.
- **🌱 New:** Customers with less than 12 months of transaction history.

## 🛠️ Technical Skills Demonstrated
- **Joins & Aggregations:** Connecting Fact and Dimension tables for holistic views.
- **Window Functions:** Calculating running totals and performance metrics.
- **Date Engineering:** Using `TIMESTAMPDIFF` and `DATE_FORMAT` for lifecycle analysis.
- **Data Binning:** Creating age groups and cost ranges using `CASE` statements.

## 🚀 How to Replicate
1. Execute `scriptscreate_tables.sql` to set up the schema.
2. Update the file paths in `data_loading_scripts.sql` and run it to populate the data.
3. Run `report_customers_view.sql` to generate the analytics layer.
