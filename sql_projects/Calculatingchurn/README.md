# Subscription Churn Insights

## Project Overview
The Subscription Churn Insights project is designed to provide deep analysis into customer retention and churn rates within subscription-based services. Utilizing Common Table Expressions (CTEs) and SQL window functions, this script meticulously aligns subscription data with predefined monthly intervals, identifies the status of each subscription, and computes churn rates effectively.

## Structure of the Script
- **Monthly Intervals Definition**: Sets up three specific months for detailed churn analysis.
- **Data Alignment**: Executes a cross join between the `subscriptions` table and the defined monthly periods to synchronize data for analysis.
- **Status Identification**: Evaluates each subscription to determine if it is active or canceled during each interval.
- **Status Aggregation**: Aggregates subscription statuses to tally active and canceled counts per month.
- **Churn Rate Calculation**: Derives churn rates for each customer segment, providing critical metrics for business analysis.

## How to Use
1. **Prepare Your Database**: Ensure your database includes a `subscriptions` table with necessary columns such as `subscription_start`, `subscription_end`, and `segment`.
2. **Run the Script**: Deploy the SQL script in a database system like PostgreSQL or any other RDBMS that supports advanced SQL functionalities.
3. **Analyze the Output**: Examine the churn rates to gain insights into customer retention trends and to formulate strategies for business improvement.

## Features
- Leverages advanced SQL techniques such as CTEs and window functions for clear and efficient data processing.
- Provides crucial metrics on churn rates, essential for understanding customer retention in subscription models.
- Flexible enough to adapt to various time frames or customer segments with minimal adjustments.

## Requirements
- A relational database management system (RDBMS) such as PostgreSQL, MySQL 8+, or Microsoft SQL Server.
- Proper initial data setup within the `subscriptions` table.

## License
This project is open-sourced under the MIT License, allowing modifications to suit different business needs.

## Contact
For assistance or contributions, reach out via [yousif_hse@yahoo.com].

Thank you for exploring or contributing to the Subscription Churn Insights project!
