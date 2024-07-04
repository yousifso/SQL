# Calculating Churn SQL Project

## Project Overview
The Calculating Churn project aims to analyze customer retention and churn rates for a subscription-based service. This SQL script uses Common Table Expressions (CTEs) to systematically break down the process of aligning subscription data with predefined monthly intervals, identifying active and canceled subscriptions, and ultimately calculating churn rates.

## Structure of the Script
- **Monthly Intervals Definition**: Defines three months as the period for analysis.
- **Data Alignment**: Performs a cross join between the `subscriptions` table and the defined monthly intervals.
- **Status Identification**: Identifies whether each subscription is active or canceled within each monthly interval.
- **Status Aggregation**: Aggregates the data to count active and canceled subscriptions for each month.
- **Churn Rate Calculation**: Calculates the churn rate for each customer segment based on the aggregated data.

## How to Use
1. **Prepare Your Database**: Ensure your database contains a `subscriptions` table with columns for `subscription_start`, `subscription_end`, and `segment`.
2. **Run the Script**: Execute the SQL script in a PostgreSQL database or another RDBMS that supports CTEs and window functions.
3. **Analyze the Output**: Review the output churn rates to understand customer retention trends and make informed business decisions.

## Features
- Uses SQL window functions and CTEs for clarity and efficiency in processing.
- Calculates churn rates, a crucial metric for any subscription-based business model.
- Adaptable to different time frames or customer segments with minimal modifications.

## Requirements
- RDBMS like PostgreSQL, MySQL 8+, or Microsoft SQL Server.
- Initial data setup in the `subscriptions` table.

## License
This project is released under the MIT License. Feel free to adapt it to fit your needs.

## Contact
For support or contributions, please contact [yousif_hse@yahoo.com].

Thank you for using or contributing to the Calculating Churn project!

