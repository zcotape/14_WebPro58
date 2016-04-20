package model.personal;

/**
 * Created by earthz on 4/19/16.
 */
public class Teacher {

    private String teacher_id, th_prename, th_name, en_prename, en_name, mobile, email;
    private Integer status_id;

    public String getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(String teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTh_prename() {
        return th_prename;
    }

    public void setTh_prename(String th_prename) {
        this.th_prename = th_prename;
    }

    public String getTh_name() {
        return th_name;
    }

    public void setTh_name(String th_name) {
        this.th_name = th_name;
    }

    public String getEn_prename() {
        return en_prename;
    }

    public void setEn_prename(String en_prename) {
        this.en_prename = en_prename;
    }

    public String getEn_name() {
        return en_name;
    }

    public void setEn_name(String en_name) {
        this.en_name = en_name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getStatus_id() {
        return status_id;
    }

    public void setStatus_id(Integer status_id) {
        this.status_id = status_id;
    }
}
