package dao;

import dto.Employee;
import dto.PreviousEmployment;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class PreviousEmployementDao 
{
    public boolean save(PreviousEmployment em) 
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
    public List<PreviousEmployment> getPreviousEmployment(int id)
    {
        List<PreviousEmployment>  ped=new ArrayList<>();
        Configuration cfg=new Configuration();
        cfg.configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session ses=sf.openSession();
        try
        {
                String hql="from PreviousEmployment where userId="+id;
                Query query = ses.createQuery(hql);
                ped = query.list();
                ses.close();sf.close();
        }
        catch(Exception ex)
        {
            ses.close();sf.close();
        }
        return ped;
    }
}
