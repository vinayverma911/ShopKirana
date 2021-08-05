package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "PreviousEmployment")
public class PreviousEmployment 
{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    int id;
    @Column(name="userId")
    int userId;
    @Column(name="nameoforganization")
    String nameOfOrganization;
    @Column(name="address")
    String address;
    @Column(name="dateOfJoining")
    String dateOfJoining;
    @Column(name="dateOfLeaving")
    String dateOfLeaving;
    @Column(name="designation")
    String designation;

    public PreviousEmployment(int id, String nameOfOrganization, String address, String doj, String dol, String designation) 
    {
        this.id=id;
        this.nameOfOrganization=nameOfOrganization;
        this.address=address;
        this.dateOfJoining=doj;
        this.dateOfLeaving=dol;
        this.designation=designation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNameOfOrganization() {
        return nameOfOrganization;
    }

    public void setNameOfOrganization(String nameOfOrganization) {
        this.nameOfOrganization = nameOfOrganization;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(String dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public String getDateOfLeaving() {
        return dateOfLeaving;
    }

    public void setDateOfLeaving(String dateOfLeaving) {
        this.dateOfLeaving = dateOfLeaving;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public PreviousEmployment() {
    }

    public PreviousEmployment(int id, int userId, String nameOfOrganization, String address, String dateOfJoining, String dateOfLeaving, String designation) {
        this.id = id;
        this.userId = userId;
        this.nameOfOrganization = nameOfOrganization;
        this.address = address;
        this.dateOfJoining = dateOfJoining;
        this.dateOfLeaving = dateOfLeaving;
        this.designation = designation;
    }

    @Override
    public String toString() {
        return "Previous_Employment{" + "id=" + id + ", userId=" + userId + ", nameOfOrganization=" + nameOfOrganization + ", address=" + address + ", dateOfJoining=" + dateOfJoining + ", dateOfLeaving=" + dateOfLeaving + ", designation=" + designation + '}';
    }
    
    
}
