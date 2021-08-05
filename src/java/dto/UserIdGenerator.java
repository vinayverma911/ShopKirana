package dto;

import dao.EmployeeDao;
import java.util.Random;

public class UserIdGenerator
{
    public boolean res=true;
    public String GenerateUserId()
    {
        String userid="SK";
        while(res)
        {
            int number;
            String n[]=new String[10];
            for(int i=0;i<8;i++)
            {   
                number=new Random().nextInt(10);
                userid=userid+number;
            }
            EmployeeDao ed=new EmployeeDao();
            res=ed.isUserIdExist(userid);
        }
        return userid;
    }
}

