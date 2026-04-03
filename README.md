Online Store Management System (SQL)

-Project Overview
This project involves the design and implementation of a comprehensive relational database for an E-commerce platform. The system manages the entire workflow of an online store—from inventory and supplier management to customer orders, payment processing, and shipping logistics.

-Database Architecture
The project demonstrates a high level of data normalization and relational design, featuring 8 interconnected tables:

Customers: Management of user profiles and registration data.

Products & Categories: Hierarchical organization of inventory.

Suppliers: Tracking of product sources and contact information.

Orders & Order Details: Complex many-to-many relationship handling between orders and products.

Payments: Financial transaction logging with specific payment method constraints.

Shipping: Logistics and tracking integration.

-Technical Skills Demonstrated
Schema Design: Creating structured tables with appropriate data types (VARCHAR, INT, MONEY, DATETIME).

Data Integrity: Implementation of PRIMARY KEY, IDENTITY columns, and UNIQUE constraints.

Relational Logic: Use of FOREIGN KEY references to maintain referential integrity across the database.

Business Logic: Implementation of CHECK constraints (e.g., validating order statuses and payment methods).

Data Seeding: Populating the database with realistic sample data for testing and demonstration.

-Getting Started
To replicate the database environment:

Ensure you have SQL Server (SSMS) or a compatible SQL environment installed.

Run the script provided in.

The script will automatically create the Online Store database and populate all tables with initial data.

**Note on Data: 
The dataset used in this project is synthetic, designed to reflect real-world business logic and relational complexity. It was generated to test the database's integrity and query performance.
