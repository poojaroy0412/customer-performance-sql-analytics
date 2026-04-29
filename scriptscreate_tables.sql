-- 1. Create the Product Dimension Table
CREATE TABLE dim_products (
    product_key  INT PRIMARY KEY,
    product_name VARCHAR(255),
    category     VARCHAR(100),
    cost         DECIMAL(10, 2)
);

-- 2. Create the Customer Dimension Table
CREATE TABLE dim_customers (
    customer_key    INT PRIMARY KEY,
    customer_number VARCHAR(50),
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    birthdate       DATE
);

-- 3. Create the Sales Fact Table
CREATE TABLE fact_sales (
    order_number   VARCHAR(50),
    product_key    INT,
    customer_key   INT,
    order_date     DATE,
    sales_amount   DECIMAL(10, 2),
    quantity       INT,
    price          DECIMAL(10, 2),
    -- Setup relationships
    FOREIGN KEY (product_key) REFERENCES dim_products(product_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customers(customer_key)
);