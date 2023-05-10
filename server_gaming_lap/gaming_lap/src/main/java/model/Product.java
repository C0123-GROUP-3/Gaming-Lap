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

    public Product(int id, String name, String description, double price, String brand, TypeProduct typeProduct, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.typeProduct = typeProduct;
        this.image = image;
    }

    public Product(int id, String name, String description, double price, String brand, TypeProduct typeProduct, String image, String createTime, String updateTime) {
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

    public Product(String name, String description, double price, String brand, TypeProduct typeProduct, String image, String createTime, String updateTime) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.typeProduct = typeProduct;
        this.image = image;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Product(String name, String description, double price, String brand, TypeProduct typeProduct, String image) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.typeProduct = typeProduct;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }




    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public TypeProduct getTypeProduct() {
        return typeProduct;
    }

    public void setTypeProduct(TypeProduct typeProduct) {
        this.typeProduct = typeProduct;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}