public class Company
{
  private String name;
  private String Id;
  
  public Company(String vName, String vId)
  {
   name = vName;
   Id   = vId;
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
}