package Member;

/**
 * Created by earthz on 2/5/16.
 */
public class Member {

    private int type;
    private String username;

    public Member(String username, int type) {
        this.username = username;
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
