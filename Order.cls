public class Order
{
  private String name;
  private Company company;
  private String Id;
  
  public Order(String vName, Company vCompany, String vId)
  {
   name = vName;
   company = vCompany;
   Id = vId;
  }
  
  public String getName()
  { return name; }
  
  public void setName(String vName)
  {
   name = vName;
  }
  
  public Company getCompany()
  { return company; }
  
  public void setCompany(Company vCompany)
  {
   company = vCompany;
  }
  public String getId()
  { return Id; }
  
  public void setId(String vId)
  {
   Id = vId;
  }
  
}