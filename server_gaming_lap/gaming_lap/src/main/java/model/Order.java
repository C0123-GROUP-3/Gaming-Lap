package model;

public class Order {
    private String id;
    private Customer customer;
    private String createAt;
    private String updateAt;
    private String totalPrice;

    public Order() {
    }

    public Order(String id, Customer customer, String createAt, String updateAt, String totalPrice) {
        this.id = id;
        this.customer = customer;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.totalPrice = totalPrice;
    }

    public Order(String orderDate, Customer customer, Product product, String totalPrice) {
        this.customer = customer;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return this.customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getTotalPrice() {
        return this.totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCreateAt() {
        return this.createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return this.updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }
}
