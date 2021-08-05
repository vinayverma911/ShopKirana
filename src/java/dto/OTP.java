package dto;

import java.util.Random;

public class OTP 
{
    public static String getOtp()
    {
        String otp="";
        int number;
        String n[]=new String[10];
        for(int i=0;i<5;i++)
        {
            number=new Random().nextInt(10);
            otp=otp+number;
        }
        return otp;
    }
}
