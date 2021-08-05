package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FamilyPerson")
public class FamilyPerson 
{
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    int id;
    @Column(name = "userId")
    String email;
    @Column(name="FamilyPersonName")            
    String FamilyPersonName;
    @Column(name = "FamilyPersonAddress")
    String FamilyPersonAddress;
    @Column(name="Relation")
    String Relation;
    @Column(name = "FamilyPersonDateOfBirth")
    String FamilyPersonDateOfBirth;

    public FamilyPerson() {
    }

    public FamilyPerson(int id, String FamilyPersonName, String FamilyPersonAddress, String Relation, String FamilyPersonDateOfBirth) {
        this.id = id;
        this.FamilyPersonName = FamilyPersonName;
        this.FamilyPersonAddress = FamilyPersonAddress;
        this.Relation = Relation;
        this.FamilyPersonDateOfBirth = FamilyPersonDateOfBirth;
    }

    public FamilyPerson(String FamilyPersonName, String FamilyPersonAddress, String Relation, String FamilyPersonDateOfBirth) {
        this.FamilyPersonName = FamilyPersonName;
        this.FamilyPersonAddress = FamilyPersonAddress;
        this.Relation = Relation;
        this.FamilyPersonDateOfBirth = FamilyPersonDateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFamilyPersonName() {
        return FamilyPersonName;
    }

    public void setFamilyPersonName(String FamilyPersonName) {
        this.FamilyPersonName = FamilyPersonName;
    }

    public String getFamilyPersonAddress() {
        return FamilyPersonAddress;
    }

    public void setFamilyPersonAddress(String FamilyPersonAddress) {
        this.FamilyPersonAddress = FamilyPersonAddress;
    }

    public String getRelation() {
        return Relation;
    }

    public void setRelation(String Relation) {
        this.Relation = Relation;
    }

    public String getFamilyPersonDateOfBirth() {
        return FamilyPersonDateOfBirth;
    }

    public void setFamilyPersonDateOfBirth(String FamilyPersonDateOfBirth) {
        this.FamilyPersonDateOfBirth = FamilyPersonDateOfBirth;
    }

    @Override
    public String toString() {
        return "FamilyPerson{" + "id=" + id + ", FamilyPersonName=" + FamilyPersonName + ", FamilyPersonAddress=" + FamilyPersonAddress + ", Relation=" + Relation + ", FamilyPersonDateOfBirth=" + FamilyPersonDateOfBirth + '}';
    }
    
}
