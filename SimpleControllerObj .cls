**
*@author LNazarenko
* This class - custom Controller defines instances for output on the visual page
*/
public with sharing class SimpleControllerObj
{
   /** List of Objects of the Account's class */
   public List<Account> companies{get;set;}
   
   /** List of Objects of the Order's class */
   public List<Order__c> orders{get;set;}
 
   /** List of Objects of the WorkPeriod's class */
   public List<Work_Period__c> wps{get;set;}
  
   /**
   * Constructor of the class SimpleController, it creates instances of all classes
   */
   public SimpleControllerObj()
   {
     getCompany();
     getOrder();
     getWP(); 
   }
  
   /**
   * Method creates Account's instances
   */
   
   public List<Account> getCompany()
   {
     companies = [select Id, Name from Account];   
     System.Debug(companies);
     return companies;     
   }
 
   /**
   * Method creates Order's instances
   */
   public List<Order__c> getOrder()
   {
     orders = [select Id, Name,Account__r.Id from Order__c where Account__r.Id IN:companies];  
     System.Debug(orders); 
     return orders;      
   }
 
   /**
   * Method creates WorkPeriod's instances
   */
   public List<Work_Period__c> getWP()
   {
     wps = [select Id, Name, Order__r.Id,Order__r.Account__r.Name, Rate__r.Id, Rate__r.Customer_Rate__c, Rate__r.Employer_Rate__c from Work_Period__c where Order__r.Id IN:orders]; 
     System.Debug(wps);
     return wps;
   }
}
