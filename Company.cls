/**
*@author LNazarenko
* This class defines the fields and methods of the Company
*/
public class Company
{
  /** name of the Company */
  private String vName;
  /** Id of the Company */
  private String vId;
  
  /**
  * Constructor of the class Company, it creates an instance of the Company
  */
  public Company(String vName, String vId)
  {
   this.vName = vName;
   this.vId   = vId;
  }
  
  /**
  * Method gets the Company's name
  * @return name
  */
  public String getName()
  { 
    return vName; 
  }
  
  /**
  * Method sets the Company's name
  */
  public void setName(String vName)
  {
   this.vName = vName;
  }
  
  /**
  * Method gets the Company's Id
  * @return Id
  */
  public String getId()
  { 
    return this.vId; 
  }
  
  /**
  * Method sets the Company's Id
  */
  public void setId(String vId)
  {
   this.vId = vId;
  }
}
