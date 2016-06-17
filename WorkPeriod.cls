public class WorkPeriod
{
  private String name;
  private String Id;
  private Date startDate;
  private Date endDate;
  private Order order;
  private Rate rate;
  
  public WorkPeriod(String vName,String vId, Date vStartDate,Date vEndDate, Order vOrder, Rate vRate)
  {
   name = vName;
   Id = vId;
   startDate = vStartDate;
   endDate = vEndDate;
   order = vOrder;
   rate = vRate;
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
    
  public Date getStartDate()
  { return startDate; }
  
  public void setStartDate(Date vStartDate)
  {
   startDate= vStartDate;
  }
  
  public Date getEndDate()
  { return endDate; }
  
  public void setEndDate(Date vEndDate)
  {
   endDate= vEndDate;
  }
  
  public Order getOrder()
  { return order; }
  
  public void setOrder(Order vOrder)
  {
   order = vOrder;
  }
  public Rate getRate()
  { return rate; }
  
  public void setRate(Rate vRate)
  {
   rate= vRate;
  }
   
}