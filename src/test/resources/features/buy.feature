Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Gun" with price 700.00 and stock of 7 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00
    Then in stock of "Bread" has 3 pieces left

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Gun" with quantity 7
    Then total should be 5021.00
    Then in stock of "Bread" has 3 pieces left
    Then in stock of "Jam" has 9 pieces left
    Then in stock of "Gun" has 0 pieces left

Scenario Outline: But one product in table
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Then in stock of <product> has <stock-left> pieces left
    Examples:
        | product | quantity | total   | stock-left |
        | "Bread" |   1      | 20.50   | 4          |
        | "Jam"   |   2      | 160.00  | 8          |
        | "Gun"   |   7      | 4900.00 | 0          |

# Siwakorn Pasawang 6410451423