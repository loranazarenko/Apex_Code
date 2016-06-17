/**
*@author LNazarenko
* This class defines the fields and methods of the Rate
*/
public class Rate
{
    /** name of the Rate */
    private String name;
	/** Id of the Rate */
    private String Id;
	/** revenues from customer */
    private integer revenue;
	/** profit margin */
    private  integer margin;
 
    /**
    * Constructor of the class Rate, it creates an instance of the Rate
    */
    public Rate(String vName,String vId, integer vRevenue, integer vMargin)
    {
      name    = vName;
      Id      = vId;
      revenue = vRevenue;
      margin  = vMargin;
    }
    
	/**
    * Method gets the Rate's name
    * @return name
    */
    public String getName()
    { 
	  return name; 
	}
  
    /**
    * Method sets the Rate's name
    */
    public void setName(String vName)
    {
      name = vName;
    }
	
	/**
    * Method gets the Rate's Id
    * @return Id
    */
    public String getId()
    { 
	  return Id; 
	}
     
	/**
    * Method sets the Rate's Id
    */
    public void setId(String vId)
    {
      Id = vId;
    }
    
	/**
    * Method gets the Rate's revenue
    * @return Id
    */
    public integer getRevenue()
    { 
	  return revenue;
    }
    
	/**
    * Method sets the Rate's revenue
    */
    public void setRevenue(integer vRevenue)
    {
      revenue = vRevenue;
    }
    
	/**
    * Method gets the Rate's revenue
    * @return Id
    */
    public integer getMargin()
    { 
	  return margin; 
	}
     
	/**
    * Method sets the Rate's margin
    */
    public void setMargin(integer vMargin)
    {
      margin = vMargin;
    }
}