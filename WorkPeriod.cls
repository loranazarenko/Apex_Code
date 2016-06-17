/**
*@author LNazarenko
* This class defines the fields and methods of the WorkPeriod
*/
public class WorkPeriod
{
  /** name of the WorkPeriod */
  private String name;
  /** Id of the WorkPeriod */
  private String Id;
  /** startDate of the WorkPeriod */
  private Date startDate;
  /** endDate of the WorkPeriod */
  private Date endDate;
  /** Object of the Order's class */
  private Order order;
  /** Object of the Rate's class */
  private Rate rate;
  
  /**
  * Constructor of the class WorkPeriod, it creates an instance of the WorkPeriod
  */
  public WorkPeriod(String vName,String vId, Date vStartDate,Date vEndDate, Order vOrder, Rate vRate)
  {
   name = vName;
   Id = vId;
   startDate = vStartDate;
   endDate = vEndDate;
   order = vOrder;
   rate = vRate;
  }
  
  /**
  * Method gets the WorkPeriod's name
  * @return name
  */
  public String getName()
  { 
    return name; 
  }
  
  /**
  * Method sets the WorkPeriod's name
  */
  public void setName(String vName)
  {
    name = vName;
  }
  
  /**
  * Method gets the WorkPeriod's Id
  * @return Id
  */
  public String getId()
  { 
    return Id; 
  }
  
  /**
  * Method sets the WorkPeriod's Id
  */
  public void setId(String vId)
  {
    Id = vId;
  }
   
  /**
  * Method gets the WorkPeriod's startDate
  * @return startDate
  */   
  public Date getStartDate()
  { 
    return startDate; 
  }
  
  /**
  * Method sets the WorkPeriod's startDate
  */
  public void setStartDate(Date vStartDate)
  {
    startDate = vStartDate;
  }
  
  /**
  * Method gets the WorkPeriod's endDate
  * @return endDate
  */
  public Date getEndDate()
  { 
    return endDate; 
  }
  
  /**
  * Method sets the WorkPeriod's endDate
  */
  public void setEndDate(Date vEndDate)
  {
   endDate = vEndDate;
  }
  
  /**
  * Method gets the WorkPeriod's variable 'order'
  * @return order
  */
  public Order getOrder()
  { 
    return order; 
  }
  
  /**
  * Method sets the WorkPeriod's variable 'order'
  */
  public void setOrder(Order vOrder)
  {
   order = vOrder;
  }
  
  /**
  * Method gets the WorkPeriod's variable 'rate'
  * @return rate
  */
  public Rate getRate()
  { 
    return rate; 
  }
  
  /**
  * Method sets the WorkPeriod's variable 'rate'
  */
  public void setRate(Rate vRate)
  {
   rate = vRate;
  }
}