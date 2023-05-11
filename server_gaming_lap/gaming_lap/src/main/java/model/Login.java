package model;

public class Login {
    private String user;
    private String pass;
    private int id;

    public Login(String user) {
        this.user = user;
    }

    public Login(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Login(int id, String user, String pass) {
        this.id = id;
        this.user = user;
        this.pass = pass;
    }

    public Login() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return this.user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return this.pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
