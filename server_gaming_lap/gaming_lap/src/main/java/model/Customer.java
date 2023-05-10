package model;

public class Customer {
    private int id;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String create_time;
    private String update_time;
    private Login login;

    public Customer(int id, String name, String phone, String address, String email, String create_time, String update_time) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public Customer(int id, String name, String phone, String address, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public Customer(String name, String phone, String address, String email) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public Customer(int id, String name, String phone) {
        this.id = id;
        this.name = name;
        this.phone = phone;
    }

    public String getCreate_time() {
        return this.create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return this.update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
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

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
