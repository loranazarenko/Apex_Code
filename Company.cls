/**
*@author LNazarenko
* This class defines the fields and methods of the Company
*/
public class Company
{
  /** name of the Company */
  private String name;
  /** Id of the Company */
  private String Id;
  
  /**
  * Constructor of the class Company, it creates an instance of the Company
  */
  public Company(String vName, String vId)
  {
   name = vName;
   Id   = vId;
  }
  
  /**
  * Method gets the Company's name
  * @return name
  */
  public String getName()
  { 
    return name; 
  }
  
  /**
  * Method sets the Company's name
  */
  public void setName(String vName)
  {
   name = vName;
  }
  
  /**
  * Method gets the Company's Id
  * @return Id
  */
  public String getId()
  { 
    return Id; 
  }
  
  /**
  * Method sets the Company's Id
  */
  public void setId(String vId)
  {
   Id = vId;
  }
}