package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class Employee 
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int id;
    @Column(name = "userId",unique = true)
    String userId;
    @Column(name = "name")
    String name;
    @Column(name = "dateofbirth")
    String dateOfBirth;
    @Column(name = "gender")
    int gender;//i-male,2-female,3-other
    @Column(name = "contactnumber")
    String contactNumber;
    @Column(name = "email",unique = true)
    String email;
    @Column(name = "bloodgroup")
    int bloodGroup;//(1:A+),(-1:A-),(2:B+),(-2:B-),(3:O),(-3:-O),(4,AB+),(-4,AB-)
    @Column(name = "meritalstatus")
    int meritalStatus;//(1:married),(2:Widowed),(3:Divoreced)
    @Column(name = "dateofmarriage")
    String dateOfMarriage;
    @Column(name = "dateofjoining")
    String dateOfJoining;
    @Column(name = "department")
    int department;//not defined
    @Column(name = "designation")
    String designation;//not Defined
    @Column(name = "currentaddress")
    String currentAddress;
    @Column(name = "permanent_address")
    String permanentAddress;
    @Column(name = "pancard")
    String panCard;
    @Column(name = "aadharcard")
    String aadharCard;
    @Column(name = "drivinglicence")
    String drivingLicence;
    @Column(name = "voterid")
    String voterId;
    @Column(name = "passport")
    String passport;
    /*@Column(name = "familyperson_name")
    String familyPersonName;*/
   /* @Column(name = "relation")
    String relation;*/
   /* @Column(name = "address")
    String address;*/
   /* @Column(name = "relative_date_of_birth")
    String relativesDateOfBirth;*/
    @Column(name = "tenth_marks")
    String tenthMarks;
    @Column(name = "twelfth_marks")
    String twelfthMarks;
    @Column(name = "graduation_marks")
    String graduationMarks;
    @Column(name = "post_graduation_marks")
    String postGraduationMarks;
    @Column(name = "diploma_marks")
    String diplomaMarks;
    /*@Column(name = "previous_organization_name")
    String previousOrganizationName;
    @Column(name = "previous_organization_address")
    String previousOrganizationAddress;
    @Column(name = "previous_organization_date_Joining")
    String previousOrganizationDateOfJoining;
    @Column(name = "previous_organization_date_Leaving")
    String previousOrganizationDateOfLeaving;
    @Column(name = "previous_organization_designation")
    String previousOrganizationDesignation;*/
    @Column(name = "otp")
    int otp;
    @Column(name = "is_verify")
    int isVerify=0;
    @Column(name = "type")
    int type;//0:user,1:hr,2:admin
    @Column(name = "password")
    String password;
    @Column(name = "areapin")
    String pinCode;
    @Column(name = "addressBlock")
    String block;
    @Column(name = "addressArea")
    String area;
   /* @Column(name = "addressStreet")
    String street;*/
    @Column(name = "state")
    String state;
   /* @Column(name = "familyPersonAdddress")
    String familyPersonAdddress;*/
    /*@Column(name = "familyPersonDateOfBirth")
    String familyPersonDateOfBirth;*/

    /*public String getFamilyPersonDateOfBirth() {
        return familyPersonDateOfBirth;
    }

    public void setFamilyPersonDateOfBirth(String familyPersonDateOfBirth) {
        this.familyPersonDateOfBirth = familyPersonDateOfBirth;
    }*/

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    
    
    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

   /* public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    */

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }

    public int getIsVerify() {
        return isVerify;
    }

    public void setIsVerify(int isVerify) {
        this.isVerify = isVerify;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Employee() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(int bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public int getMeritalStatus() {
        return meritalStatus;
    }

    public void setMeritalStatus(int meritalStatus) {
        this.meritalStatus = meritalStatus;
    }

    public String getDateOfMarriage() {
        return dateOfMarriage;
    }

    public void setDateOfMarriage(String dateOfMarriage) {
        this.dateOfMarriage = dateOfMarriage;
    }

    public String getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(String dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getCurrentAddress() {
        return currentAddress;
    }

    public void setCurrentAddress(String currentAddress) {
        this.currentAddress = currentAddress;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getPanCard() {
        return panCard;
    }

    public void setPanCard(String panCard) {
        this.panCard = panCard;
    }

    public String getAadharCard() {
        return aadharCard;
    }

    public void setAadharCard(String aadharCard) {
        this.aadharCard = aadharCard;
    }

    public String getDrivingLicence() {
        return drivingLicence;
    }

    public void setDrivingLicence(String drivingLicence) {
        this.drivingLicence = drivingLicence;
    }

    public String getVoterId() {
        return voterId;
    }

    public void setVoterId(String voterId) {
        this.voterId = voterId;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

   /* public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }*/
    
    public String getTenthMarks() {
        return tenthMarks;
    }

    public void setTenthMarks(String tenthMarks) {
        this.tenthMarks = tenthMarks;
    }

    public String getTwelfthMarks() {
        return twelfthMarks;
    }

    public void setTwelfthMarks(String twelfthMarks) {
        this.twelfthMarks = twelfthMarks;
    }

    public String getGraduationMarks() {
        return graduationMarks;
    }

    public void setGraduationMarks(String graduationMarks) {
        this.graduationMarks = graduationMarks;
    }

    public String getPostGraduationMarks() {
        return postGraduationMarks;
    }

    public void setPostGraduationMarks(String postGraduationMarks) {
        this.postGraduationMarks = postGraduationMarks;
    }

    public String getDiplomaMarks() {
        return diplomaMarks;
    }

    public void setDiplomaMarks(String diplomaMarks) {
        this.diplomaMarks = diplomaMarks;
    }

   /* public String getPreviousOrganizationName() {
        return previousOrganizationName;
    }

    public void setPreviousOrganizationName(String previousOrganizationName) {
        this.previousOrganizationName = previousOrganizationName;
    }

    public String getPreviousOrganizationAddress() {
        return previousOrganizationAddress;
    }

    public void setPreviousOrganizationAddress(String previousOrganizationAddress) {
        this.previousOrganizationAddress = previousOrganizationAddress;
    }

    public String getPreviousOrganizationDateOfJoining() {
        return previousOrganizationDateOfJoining;
    }

    public void setPreviousOrganizationDateOfJoining(String previousOrganizationDateOfJoining) {
        this.previousOrganizationDateOfJoining = previousOrganizationDateOfJoining;
    }

    public String getPreviousOrganizationDateOfLeaving() {
        return previousOrganizationDateOfLeaving;
    }

    public void setPreviousOrganizationDateOfLeaving(String previousOrganizationDateOfLeaving) {
        this.previousOrganizationDateOfLeaving = previousOrganizationDateOfLeaving;
    }

    public String getPreviousOrganizationDesignation() {
        return previousOrganizationDesignation;
    }

    public void setPreviousOrganizationDesignation(String previousOrganizationDesignation) {
        this.previousOrganizationDesignation = previousOrganizationDesignation;
    }*/

    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", userId=" + userId + ", name=" + name + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender + ", contactNumber=" + contactNumber + ", email=" + email + ", bloodGroup=" + bloodGroup + ", meritalStatus=" + meritalStatus + ", dateOfMarriage=" + dateOfMarriage + ", dateOfJoining=" + dateOfJoining + ", department=" + department + ", designation=" + designation + ", currentAddress=" + currentAddress + ", permanentAddress=" + permanentAddress + ", panCard=" + panCard + ", aadharCard=" + aadharCard + ", drivingLicence=" + drivingLicence + ", voterId=" + voterId + ", passport=" + passport + ", tenthMarks=" + tenthMarks + ", twelfthMarks=" + twelfthMarks + ", graduationMarks=" + graduationMarks + ", postGraduationMarks=" + postGraduationMarks + ", diplomaMarks=" + diplomaMarks + ", otp=" + otp + ", isVerify=" + isVerify + ", type=" + type + ", password=" + password + ", pinCode=" + pinCode + ", block=" + block + ", area=" + area + ", state=" + state + '}';
    }   
    
}
