package app.com.pojo;

public class Users {
    private Integer userID;
    private String username;
    private String password;

    public Users() {
        super();
    }

    public Users(String username, String password) {
        super();
        this.username = username;
        this.password = password;
    }

    public Users(Integer userID, String username, String password) {
        super();
        this.userID = userID;
        this.username = username;
        this.password = password;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
