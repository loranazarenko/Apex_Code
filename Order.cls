/**
*@author LNazarenko
* This class defines the fields and methods of the Order
*/
public class Order
{
  /** name of the Order */
  private String name;
  /** Id of the Order */
  private String Id;
  /** Object of the Company's class */
  private Company company;
  
  /**
  * Constructor of the class Order, it creates an instance of the Order
  */
  public Order(String vName, Company vCompany, String vId)
  {
   name = vName;
   company = vCompany;
   Id = vId;
  }
  
  /**
  * Method gets the Order's name
  * @return name
  */
  public String getName()
  { 
   return name; 
  }
  
  /**
  * Method sets the Order's name
  */
  public void setName(String vName)
  {
   name = vName;
  }
  
  /**
  * Method gets the Order's Id
  * @return Id
  */
  public String getId()
  { 
   return Id; 
  }
  
  /**
  * Method sets the Order's Id
  */
  public void setId(String vId)
  {
   Id = vId;
  }
  
  /**
  * Method gets the Order's variable 'company'
  * @return company
  */
  public Company getCompany()
  { 
   return company; 
  }
  
  /**
  * Method sets the Order's variable 'company'
  */
  public void setCompany(Company vCompany)
  {
   company = vCompany;
  }
}