Feature: Cut-Stock
    As a customer
    I want to check number of product in stock.

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Gun" with price 700.00 and stock of 7 exists

Scenario: Customer buys one product.
    When I buy "Bread" with quantity 2
    Then in stock of "Bread" has 3 pieces left

Scenario: Customer buys multiple products.
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 5
    And I buy "Gun" with quantity 7
    Then in stock of "Bread" has 3 pieces left
    Then in stock of "Jam" has 5 pieces left
    Then in stock of "Gun" has 0 pieces left

# 6410451423 Siwakorn Pasawang