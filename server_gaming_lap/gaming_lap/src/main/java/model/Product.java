package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private String brand;
    private TypeProduct typeProduct;
    private String image;
    private String createTime;
    private String updateTime;

    public Product() {
    }

    public Product(int id, String productKey, String name, String description, double price, String brand, TypeProduct typeProduct, String image, String createTime, String updateTime) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.typeProduct = typeProduct;
        this.image = image;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Product(String productKey, String name, String description, double price, String brand, TypeProduct typeProduct, String image, String createTime, String updateTime) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.typeProduct = typeProduct;
        this.image = image;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Product(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public TypeProduct getTypeProduct() {
        return this.typeProduct;
    }

    public void setTypeProduct(TypeProduct typeProduct) {
        this.typeProduct = typeProduct;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
