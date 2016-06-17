/**
*@author LNazarenko
* This class - custom Controller defines instances for output on the visual page
*/
public class SimpleControllerObj
{
   /** Objects of the Account's class */
   public Account company1{get;set;}
   public Account company2{get;set;}
   
   /** Objects of the Order's class */
   public Order__c order1{get;set;}
   public Order__c order2{get;set;}
   
   /** Objects of the Rate's class */
   public Rate__c rate1{get;set;}
   public Rate__c rate2{get;set;}
   
   /** Objects of the WorkPeriod's class */
   public Work_Period__c wp1{get;set;}
   public Work_Period__c wp2{get;set;}
  
   /**
   * Constructor of the class SimpleController, it creates instances of all classes
   */
   public SimpleControllerObj()
   {
     createCompany();
     createOrder();
     createRate();
     createWP(); 
   }
  
   /**
   * Method creates Account's instances
   */
   
   public void createCompany()
   {
     company1 = [select Id, Name from Account][0];    
     company2 = [select Id, Name from Account][1];     
   }
 
   /**
   * Method creates Order's instances
   */
   public void createOrder()
   {
     order1 = [select Id, Name from Order__c][0];     
     order2 = [select Id, Name from Order__c][1];  
   }
   
   /**
   * Method creates Rate's instances
   */
   public void createRate()
   {
     rate1 = [select Id, Name from Rate__c][0];        
     rate2 = [select Id, Name from Rate__c][0];   
   }
   
   /**
   * Method creates WorkPeriod's instances
   */
   public void createWP()
   {
     wp1 = [select Id, Name from Work_Period__c ][0]; 
     wp2 = [select Id, Name from Work_Period__c ][0]; 
   }
}