/**
*@author LNazarenko
* This class defines the fields and methods of the WorkPeriod
*/
public class WorkPeriod
{
  /** name of the WorkPeriod */
  private String vName;
  /** Id of the WorkPeriod */
  private String vId;
  /** startDate of the WorkPeriod */
  private Date vStartDate;
  /** endDate of the WorkPeriod */
  private Date vEndDate;
  /** Object of the Order's class */
  private Order vOrder;
  /** Object of the Rate's class */
  private Rate vRrate;
  
  /**
  * Constructor of the class WorkPeriod, it creates an instance of the WorkPeriod
  */
  public WorkPeriod(String vName,String vId, Date vStartDate,Date vEndDate, Order vOrder, Rate vRate)
  {
   this.vName       = vName;
   this.vId         = vId;
   this.vStartDate  = vStartDate;
   this.vEndDate    = vEndDate;
   this.vOrder      = vOrder;
   this.vRrate      = vRate;
  }
  
  /**
  * Method gets the WorkPeriod's name
  * @return name
  */
  public String getName()
  { 
    return this.vName; 
  }
  
  /**
  * Method sets the WorkPeriod's name
  */
  public void setName(String vName)
  {
    this.vName = vName;
  }
  
  /**
  * Method gets the WorkPeriod's Id
  * @return Id
  */
  public String getId()
  { 
    return this.vId; 
  }
  
  /**
  * Method sets the WorkPeriod's Id
  */
  public void setId(String vId)
  {
    this.vId = vId;
  }
   
  /**
  * Method gets the WorkPeriod's startDate
  * @return startDate
  */   
  public Date getStartDate()
  { 
    return this.vStartDate; 
  }
  
  /**
  * Method sets the WorkPeriod's startDate
  */
  public void setStartDate(Date vStartDate)
  {
    this.vStartDate = vStartDate;
  }
  
  /**
  * Method gets the WorkPeriod's endDate
  * @return endDate
  */
  public Date getEndDate()
  { 
    return this.vEndDate; 
  }
  
  /**
  * Method sets the WorkPeriod's endDate
  */
  public void setEndDate(Date vEndDate)
  {
   this.vEndDate = vEndDate;
  }
  
  /**
  * Method gets the WorkPeriod's variable 'order'
  * @return order
  */
  public Order getOrder()
  { 
    return this.vOrder; 
  }
  
  /**
  * Method sets the WorkPeriod's variable 'order'
  */
  public void setOrder(Order vOrder)
  {
   this.vOrder = vOrder;
  }
  
  /**
  * Method gets the WorkPeriod's variable 'rate'
  * @return rate
  */
  public Rate getRate()
  { 
    return this.vRrate; 
  }
  
  /**
  * Method sets the WorkPeriod's variable 'rate'
  */
  public void setRate(Rate vRate)
  {
   this.vRrate = vRate;
  }
}
