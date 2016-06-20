/**
*@author LNazarenko
* This class - custom Controller defines instances for output on the visual page
*/
public class SimpleControllerObj
{
   /** List of Objects of the Account's class */
   public List<Account> companies{get;set;}
   
   /** List of Objects of the Order's class */
   public List<Order__c> orders{get;set;}
   
   /** List of Objects of the Rate's class */
   public List<Rate__c> rates{get;set;}
   
   /** List of Objects of the WorkPeriod's class */
   public List<Work_Period__c> wps{get;set;}
  
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
     companies = [select Id, Name from Account limit 2];         
   }
 
   /**
   * Method creates Order's instances
   */
   public void createOrder()
   {
     orders = [select Id, Name from Order__c limit 2];     
   }
   
   /**
   * Method creates Rate's instances
   */
   public void createRate()
   {
     rates = [select Id, Name, Customer_Rate__c, Employer_Rate__c from Rate__c limit 2];        
   }
   
   /**
   * Method creates WorkPeriod's instances
   */
   public void createWP()
   {
     wps = [select Id, Name from Work_Period__c limit 2]; 
   }
}
