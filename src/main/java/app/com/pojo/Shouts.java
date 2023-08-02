package app.com.pojo;

public class Shouts {
    private Integer shoutID;
    private Integer userID;
    private String username;
    private String text;

    public Shouts() {
        super();
    }

    public Shouts(Integer userID, String username, String text) {
        super();
        this.userID = userID;
        this.username = username;
        this.text = text;
    }

    public Shouts(Integer shoutID, Integer userID, String username, String text) {
        super();
        this.shoutID = shoutID;
        this.userID = userID;
        this.username = username;
        this.text = text;
    }

    public Integer getShoutID() {
        return shoutID;
    }

    public void setShoutID(Integer shoutID) {
        this.shoutID = shoutID;
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
