/**
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
   * Method creates Account's instances
   */
   public List<Account> getCompany()
   {
     companies = [select Id, Name from Account];   
     System.Debug(companies);
     return companies;     
   }
 
   /**
   * Method creates WorkPeriod's instances
   */
   public List<Work_Period__c> getWP()
   {
     wps = [Select Id, Name, Order__r.Id, Order__r.Account__r.Name, 
           Rate__r.Id, Rate__r.Customer_Rate__c, Rate__r.Employer_Rate__c 
           From Work_Period__c Where Order__r.Account__r.Id IN : companies Order by Name ASC]; 
     System.Debug(wps);
     return wps;
   }
