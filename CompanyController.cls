/**
*@author LNazarenko
* This class - custom Controller defines instances for output on the visual page
*/
public with sharing class CompanyController
{
   /** Objects of the Company's class */
   public Company company1{get;set;}
   public Company company2{get;set;}
   
   /** Objects of the Order's class */
   public Order order1{get;set;}
   public Order order2{get;set;}
   
   /** Objects of the Rate's class */
   public Rate rate1{get;set;}
   public Rate rate2{get;set;}
   
   /** Objects of the WorkPeriod's class */
   public WorkPeriod wp1{get;set;}
   public WorkPeriod wp2{get;set;}
  
   /**
   * Constructor of the class SimpleController, it creates instances of all classes
   */
   public CompanyController()
   {
     createCompany();
     createOrder();
     createRate();
     createWP(); 
   }
  
   /**
   * Method creates Company's instances
   */
   public void createCompany()
   {
     company1 = new Company('Microsoft', '1');
     company2 = new Company('Cisco', '2');
   }
 
   /**
   * Method creates Order's instances
   */
   public void createOrder()
   {
     order1 = new Order('Order1', company1, '1');
     order2 = new Order('Order2', company2, '2');
   }
   
   /**
   * Method creates Rate's instances
   */
   public void createRate()
   {
     rate1 = new Rate('Winter', '1', 100, 200);
     rate2 = new Rate('Summer', '2', 200, 300);
   }
   
   /**
   * Method creates WorkPeriod's instances
   */
   public void createWP()
   {
     wp1 = new WorkPeriod('Winter','1', Date.today(), Date.today().addDays(10), order1, rate1);
     wp2 = new WorkPeriod('Summer','2', Date.today().addDays(100), Date.today().addDays(200), order2, rate2);
   }
}
