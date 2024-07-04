# Subscription Analysis Project

## Project Overview
This SQL project examines subscription data to calculate churn rates for different customer segments over specified periods.

## Files
- `subscription_analysis.sql`: Contains SQL queries for calculating active and canceled subscriptions, and deriving churn rates.

## Queries
1. **Monthly Definitions**: Defines monthly periods for analysis.
2. **Data Alignment**: Aligns subscriptions with months using a cross join.
3. **Subscription Status**: Categorizes subscriptions as active or canceled within each month.
4. **Status Aggregation**: Aggregates statuses to compute total active and canceled subscriptions.
5. **Churn Rate Calculation**: Calculates churn rates for segments within each defined period.

## Usage
These queries are best run on database systems that support window functions, such as PostgreSQL or SQL Server.
