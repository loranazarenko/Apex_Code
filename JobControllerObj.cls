/**
*@author LNazarenko
* This class - custom Controller defines instances for output on the visual page
*/
public with sharing class JobControllerObj
{
  
   /** List of Objects of the WorkPeriod's class */
   public List<Work_Period__c> wps{get;set;}
   
   /** List of Objects of the Account's class */
   public List<Account> companies{get;set;}
  
   /**
   * Constructor of the class SimpleController, it creates instances of all classes
   */
   public JobControllerObj()
   {
     getWP();
     getCompany();
   }
     
   /**
   * Method creates WorkPeriod's instances
   */
   public List<Work_Period__c> getWP()
   {
     wps = List<Work_Period__c>([Select Id, Name, Order__r.Id, Order__r.Account__r.Name, 
           Rate__r.Id, Rate__r.Customer_Rate__c, Rate__r.Employer_Rate__c 
           From Work_Period__c Order by Name ASC]); 
     System.Debug(wps);
     return wps;
   }
   
   /**
   * Method creates Account's instances
   */
    public List<Account> getCompany()
   {
       companies = new List<Account>();
       for (Work_Period__c period: wps)
       {
          System.Debug(period);
          companies.add(period.Order__r.Account__r);
       }

       return companies;     
   }
}
