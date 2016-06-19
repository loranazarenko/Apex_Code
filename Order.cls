/**
*@author LNazarenko
* This class defines the fields and methods of the Order
*/
public class Order
{
  /** name of the Order */
  private String vName;
  /** Id of the Order */
  private String vId;
  /** Object of the Company's class */
  private Company vCompany;
  
  /**
  * Constructor of the class Order, it creates an instance of the Order
  */
  public Order(String vName, Company vCompany, String vId)
  {
   this.vName    = vName;
   this.vId      = vId;
   this.vCompany = vCompany;
  }
  
  /**
  * Method gets the Order's name
  * @return name
  */
  public String getName()
  { 
   return vName; 
  }
  
  /**
  * Method sets the Order's name
  */
  public void setName(String vName)
  {
   this.vName = vName;
  }
  
  /**
  * Method gets the Order's Id
  * @return Id
  */
  public String getId()
  { 
   return this.vId; 
  }
  
  /**
  * Method sets the Order's Id
  */
  public void setId(String vId)
  {
   this.vId = vId;
  }
  
  /**
  * Method gets the Order's variable 'company'
  * @return company
  */
  public Company getCompany()
  { 
   return this.vCompany; 
  }
  
  /**
  * Method sets the Order's variable 'company'
  */
  public void setCompany(Company vCompany)
  {
   this.vCompany = vCompany;
  }
}
