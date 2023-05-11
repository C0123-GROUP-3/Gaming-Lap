package model;

public class Account {
    private String user;
    private String pass;
    private  int id;
    private int roleId;
    private  Role role1;

    public Account(String user, String pass, int roleId) {
        this.user = user;
        this.pass = pass;
        this.roleId = roleId;
    }

    public Account(String user) {
        this.user = user;
    }

    public Account(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Account(String user, String pass, Role role1) {
        this.user = user;
        this.pass = pass;
        this.role1 = role1;
    }

    public Account(int id, String user, String pass) {
        this.user = user;
        this.pass = pass;
        this.id = id;
    }

    public Account(int id, String user, String pass, Role role1) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.role1 = role1;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Role getRole() {
        return role1;
    }

    public void setRole(Role role1) {
        this.role1 = role1;
    }

    public Account() {
    }


    public Role getRole1() {
        return role1;
    }

    public void setRole1(Role role1) {
        this.role1 = role1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
