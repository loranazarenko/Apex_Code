public class SimpleController
{
 public Company company1{get;set;}
 public Company company2{get;set;}
 public Order order1{get;set;}
 public Order order2{get;set;}
 public Rate rate1{get;set;}
 public Rate rate2{get;set;}
 
 public String vName1{get;set;}
 public String vId1{get;set;}
 public integer vRevenew1{get;set;}
 public integer vMarge1{get;set;}
 public String vName2{get;set;}
 public String vId2{get;set;}
 public integer vRevenew2{get;set;}
 public integer vMarge2{get;set;}
 
 public Date startDate1{get;set;}
 public Date endDate1{get;set;}
 public Date startDate2{get;set;}
 public Date endDate2{get;set;}
 public WorkPeriod wp1{get;set;}
 public WorkPeriod wp2{get;set;}
 
 public SimpleController()
 {
 createCompany();
 createOrder();
 createRate();
 createWP(); 
 }
 
 
 public void createCompany()
 {
  company1 = new Company('Microsoft', '1');
  company2 = new Company('Cisco', '2');
 }
 
 public void createOrder()
 {
  order1 = new Order('Order1',company1, '1');
  order2 = new Order('Order2',company2, '2');
 }
 
 public void createRate()
 {
  rate1 = new Rate('Winter','1', 100,200);
  rate2 = new Rate('Summer','2', 200,300);
 }
  
 public void createWP()
 {
  wp1 = new WorkPeriod('Winter','1', Date.today(),Date.today().addDays(10), order1,rate1);
  wp2 = new WorkPeriod('Summer','2',Date.today().addDays(100),Date.today().addDays(200), order2,rate2);
 }

}