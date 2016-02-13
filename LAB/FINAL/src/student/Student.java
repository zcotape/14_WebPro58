package student;

public class Student {

    private int year;
    private String student_id, first_name, last_name, password, email;

    private int faculty_id, branch_id, arch_id;
    private String faculty_name, branch_name, arch_name;

    public Student(String student_id, int year, String first_name, String last_name, String email) {
        this.student_id = student_id;
        this.year = year;
        this.last_name = last_name;
        this.first_name = first_name;
        this.email = email;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getFaculty_id() {
        return faculty_id;
    }

    public void setFaculty_id(int faculty_id) {
        this.faculty_id = faculty_id;
    }

    public int getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(int branch_id) {
        this.branch_id = branch_id;
    }

    public int getArch_id() {
        return arch_id;
    }

    public void setArch_id(int arch_id) {
        this.arch_id = arch_id;
    }

    public String getFaculty_name() {
        return faculty_name;
    }

    public void setFaculty_name(String faculty_name) {
        this.faculty_name = faculty_name;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public String getArch_name() {
        return arch_name;
    }

    public void setArch_name(String arch_name) {
        this.arch_name = arch_name;
    }
}
