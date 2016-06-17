public class Rate
{
    private String name;
    private String Id;
    private integer revenew;
    private  integer marge;
 
    public Rate(String vName,String vId, integer vRevenew, integer vMarge)
    {
     name = vName;
     Id = vId;
     revenew = vRevenew;
     marge = vMarge;
    }
    
    public String getName()
    { return name; }
  
    public void setName(String vName)
    {
     name = vName;
    }
    public String getId()
    { return Id; }
  
    public void setId(String vId)
    {
     Id = vId;
    }
    
    public integer getRevenew()
    { return revenew; }
  
    public void setRevenew(integer vRevenew)
    {
     revenew= vRevenew;
    }
    
    public integer getMarge()
    { return marge; }
  
    public void setMarge(integer vMarge)
    {
     marge= vMarge;
    }
    
 
}