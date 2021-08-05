package dao;

import dto.FamilyPerson;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class RelativesDao 
{
    List<FamilyPerson> fp=new ArrayList<>();
    public List<FamilyPerson> getRelatives(String email)
    {
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
                String hql="from FamilyPerson where email='"+email+"'";
                System.out.println("Before Query");
                Query query = ses.createQuery(hql);
                System.out.println("After Query");
                fp = query.list();
                ses.close();
                sf.close();
        }
        catch(Exception ex)
        {
            System.out.println("Exception at RelativesDao : "+ex.getMessage());
            ses.close();
            sf.close();
        }
        return fp;
    }
}
