/**
*@author LNazarenko
* This class defines the fields and methods of the Rate
*/
public class Rate
{
    /** name of the Rate */
    private String vName;
    /** Id of the Rate */
    private String vId;
    /** revenues from customer */
    private integer vRevenue;
    /** profit margin */
    private  integer vMargin;
 
    /**
    * Constructor of the class Rate, it creates an instance of the Rate
    */
    public Rate(String vName,String vId, integer vRevenue, integer vMargin)
    {
      this.vName    = vName;
      this.vId      = vId;
      this.vRevenue = vRevenue;
      this.vMargin  = vMargin;
    }
    
    /**
    * Method gets the Rate's name
    * @return name
    */
    public String getName()
    { 
      return this.vName; 
    }
  
    /**
    * Method sets the Rate's name
    */
    public void setName(String vName)
    {
      this.vName = vName;
    }
    
    /**
    * Method gets the Rate's Id
    * @return Id
    */
    public String getId()
    { 
      return this.vId; 
    }
     
    /**
    * Method sets the Rate's Id
    */
    public void setId(String vId)
    {
      this.vId = vId;
    }
    
    /**
    * Method gets the Rate's revenue
    * @return Id
    */
    public integer getRevenue()
    { 
      return this.vRevenue;
    }
    
    /**
    * Method sets the Rate's revenue
    */
    public void setRevenue(integer vRevenue)
    {
      this.vRevenue = vRevenue;
    }
    
    /**
    * Method gets the Rate's revenue
    * @return Id
    */
    public integer getMargin()
    { 
      return this.vMargin; 
    }
     
    /**
    * Method sets the Rate's margin
    */
    public void setMargin(integer vMargin)
    {
      this.vMargin = vMargin;
    }
}