package customer;

public class Customer {
    
    private String firstName, lastName, Company, Mobile, Email, addr;

    public Customer(String firstName, String lastName, String company, String mobile, String email, String addr) {
        this.firstName = firstName;
        this.lastName = lastName;
        Company = company;
        Mobile = mobile;
        Email = email;
        this.addr = addr;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String company) {
        Company = company;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
