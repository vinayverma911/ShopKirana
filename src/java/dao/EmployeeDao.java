package dao;

import dto.Employee;
import dto.FamilyPerson;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class EmployeeDao 
{
    public boolean saveEmpployee(Employee em)
    {   
        try
        {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
            ses.save(em);
            ses.beginTransaction().commit();
            ses.close();
            sf.close();
            return true;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            return false;
        }
    }

    public boolean checkOtp(String email, int otp) 
    {
        try
        {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
            String hql = "from Employee where email='"+email+"' and otp="+otp;                               
            Query query = ses.createQuery(hql);
            List<Employee> results = query.list();
            for(Employee e:results)
            {
                
                if(otp==e.getOtp())
                {
                    e.setIsVerify(1);
                    ses.update(e);
                    ses.beginTransaction().commit();
                    ses.close();
                    sf.close();                            
                    return true;
                }
                else
                {
                    System.out.println("OTP not Verified");
                    return false;
                }
            }
            ses.close();
                    sf.close();                            
            
        }
        catch(Exception ex)
        {                           
            System.out.println("Exception : "+ex.getMessage());
            return false;
        }
        System.out.println("LAST RETURN");
        return false;
    }
    
    public boolean isUserVerified(String email) 
    {
        try
        {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
            String hql="from Employee where email='"+email+"'";
            Query query = ses.createQuery(hql);
            List<Employee> results = query.list();
            for(Employee e:results)
            {
                if(e.getIsVerify()==1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
        catch(Exception ex)
        {
            System.out.println("Exception  : "+ex);
            return false;
        }
    }

    public Employee getEmployee(String email) 
    {
        try
        {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
            String hql="from Employee where email='"+email+"'";
            Query query = ses.createQuery(hql);
            List<Employee> results = query.list();
            for(Employee e:results)
            {
                ses.beginTransaction().commit();
                ses.close();
                sf.close();
                return e;
            }
            ses.beginTransaction().commit();
                ses.close();
                sf.close();
        }
        catch(Exception ex)
        {
            return null;
        }
        return null;
    }

    public boolean saveUserDetails_1(String email, String dob, String contact, int blood, int gender, int marital, String dom) 
    {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
        try
        {
            String hql="from Employee where email='"+email+"'";
            Query query = ses.createQuery(hql);
            List<Employee> results = query.list();
            for(Employee e:results)
            {
                e.setDateOfBirth(dob);
                e.setContactNumber(contact);
                e.setBloodGroup(blood);
                e.setGender(gender);
                e.setMeritalStatus(marital);
                e.setDateOfMarriage(dom);
                ses.update(e);
                ses.beginTransaction().commit();
                ses.close();
                sf.close();
                return true;
            }
        }
        catch(Exception ex)
        {
                ses.beginTransaction().commit();
                ses.close();
                sf.close(); 
            return false;
        }
          ses.beginTransaction().commit();
                ses.close();
                sf.close();
        return false;
    }

    public boolean saveUserDetails_2(String email, int department, String designation, String block, String area, String state, String pin, String permanentAddress,String currentAddress,String DateOfJoining) 
    {
            Configuration cfg=new Configuration();
            cfg.configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session ses=sf.openSession();
            try
            {
                String hql="from Employee where email='"+email+"'";
                Query query = ses.createQuery(hql);
                List<Employee> results = query.list();
                for(Employee e:results)
                {
                    e.setDepartment(department);
                    e.setDesignation(designation);
                    e.setBlock(block);
                    e.setArea(area);
                    e.setState(state);
                    e.setPinCode(pin);
                    e.setPermanentAddress(permanentAddress);
                    e.setCurrentAddress(currentAddress);
                    e.setDateOfJoining(DateOfJoining);
                    ses.update(e);
                    ses.beginTransaction().commit();
                    ses.close();
                    sf.close();
                }                
                return true;
            }
            catch(Exception ex)
            {
                ses.beginTransaction().commit();
                ses.close();
                sf.close();
                return false;
            }
    }

    public boolean saveFamilyDetails(String email, String name, String address, String relation, String dob) 
    {
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        FamilyPerson fp=new FamilyPerson();
        try
        {
            fp.setEmail(email);
            fp.setFamilyPersonAddress(address);
            fp.setFamilyPersonName(name);
            fp.setRelation(relation);
            fp.setFamilyPersonDateOfBirth(dob);
            System.out.println("----------------->Family Member at saveFamilyDetails..._____-->"+fp.toString());
            ses.save(fp);
            ses.beginTransaction().commit();
            System.out.println("---------------------->User Saved");
            return true;    
        }
        catch(Exception ex)
        {
            System.out.println("Exception at saveFamilyDetails();");
            ses.beginTransaction().commit();
            ses.close();
            sf.close();
            return false;
        }
    }

    public boolean updateUser(Employee em) 
    {
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
            ses.update(em);
            ses.beginTransaction().commit();
            ses.close();
            sf.close();
            System.out.println("Before returning true");
            return true;
        }
        catch(Exception ex)
        {
             ses.close();
             sf.close();
             System.out.println("Before returning true");
             return false;
        }
    }

    public boolean isUserIdExist(String userid) 
    {
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
                String hql="from Employee where userId='"+userid+"'";
                Query query = ses.createQuery(hql);
                List<Employee> results = query.list();
                for(Employee e:results)
                {
                        return true;               
                }
            return false;
        }
        catch(Exception ex)
        {
            ses.beginTransaction().commit();
            ses.close();
            sf.close();
            return false;
        }
    }
    public int getNumberOfEmployee()
    {
        Integer i=0;
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
                String hql="from Employee where isVerify=1";
                Query query = ses.createQuery(hql);
                List<Employee> results = query.list();
                for(Employee e:results)
                {
                    i=i+1;
                }
                ses.close();sf.close();
                return i;
        }
        catch(Exception ex)
        {
                ses.close();sf.close();
                i=-99;
        }
        return i;
    }
    public List<Employee> getEmployeeListByDepartment(int department)
    {
        List<Employee> el=new ArrayList<>();
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        System.out.println("Department At EmployeeDaooooo--------------------->"+department);
        try
        {
                String hql="from Employee where department="+department;
                Query query = ses.createQuery(hql);
                List<Employee> results = query.list();
                for(Employee e:results)
                {
                    el.add(e);
                    System.out.println("Emplyee in Before Imidiatly Getting : "+e.toString());
                }
        }
        catch(Exception ex)
        {
            ses.close();sf.close();
            System.out.println("Exception at getEmployeeListByDepartment()  : "+ex);
        }
        ses.close();sf.close();
        System.out.println("From list in Dao before Returning : "+el.size());
        System.out.println("From list in Dao before Returning : "+el.get(0).toString());
        return el;
    }
    public Employee getEmployeeByUserCode(String code) 
    {
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
            String hql="from Employee where userId='"+code+"' and isVerify=1";
            Query query = ses.createQuery(hql);
            List<Employee> results = query.list();
            for(Employee e:results)
            {
                ses.beginTransaction().commit();
                ses.close();
                sf.close();
                return e;
            }
            ses.beginTransaction().commit();
                ses.close();
                sf.close();
        }
        catch(Exception ex)
        {
            ses.beginTransaction().commit();
                ses.close();
                sf.close();
            return null;
               
        }
        ses.beginTransaction().commit();
                ses.close();
                sf.close();
        return null;
    }
}