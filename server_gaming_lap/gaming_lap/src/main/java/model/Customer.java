package model;

public class Customer {
    private int id;
    private String name;
    private String phone;
    private String address;
    private String email;
    private  String user;
    private String pass;

    public Customer(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Customer(int id, String name, String phone, String address, String email, String user, String pass) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.user = user;
        this.pass = pass;
    }

    public Customer(int id, String name, String phone, String address, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public Customer(String name, String phone, String address, String email, String user, String pass) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.user = user;
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
