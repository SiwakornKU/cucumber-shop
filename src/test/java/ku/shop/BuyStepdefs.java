package ku.shop;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BuyStepdefs {

    private ProductCatalog catalog;
    private Order order;

    @Given("the store is ready to service customers")
    public void the_store_is_ready_to_service_customers() {
        catalog = new ProductCatalog();
        order = new Order();
    }

    @Given("a product {string} with price {float} and stock of {int} exists")
    public void a_product_exists(String name, double price, int stock) {
        catalog.addProduct(name, price, stock);
    }

    @When("I buy {string} with quantity {int}")
    public void i_buy_with_quantity(String name, int quantity) {
        Product prod = catalog.getProduct(name);
        order.addItem(prod, quantity);
    }

    @Then("total should be {float}")
    public void total_should_be(double total) {
        assertEquals(total, order.getTotal());
    }

//    @When("I paid for {int} pieces of {string}")
//    public void i_have_paid_for(String name, int quantity){
//        catalog.getProduct(name).cutStock(quantity);
//    }

    @Then("in stock of {string} has {int} pieces left")
    public void in_stock_of_has_pieces_left(String name, int quantity){
        assertEquals(quantity, catalog.getProduct(name).getStock());
    }
}
// 6410451423 Siwakorn Pasawang