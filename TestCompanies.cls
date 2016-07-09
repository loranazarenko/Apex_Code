/**
@author LNazarenko
This class tests the Companies
*/
@isTest(SeeAllData=false)

  private class TestCompanies {
   
    /** testCompanies checks company that returns after call */
    static testMethod void testCompanies() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.JobPageTab;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       JobControllerObj controller = new JobControllerObj();
       /** Get companies with work periods and set */
       Test.startTest();
       List <Account> cmp = controller.getCompany();
       System.Debug(cmp);
       Test.stopTest();
       List <Account> companies = List<Account>([select Id, Name from Account Order by Name ASC]);   
       System.assertEquals(companies[0].Name, 'Cisco');
    }   
    
    /** testCompanies checks Work Periods that return after call */
    static testMethod void testWorkPeriods() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.JobPageTab;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       JobControllerObj controller = new JobControllerObj();
       /** Get companies with work periods and set */
       Test.startTest();
       controller.getWP();
       Test.stopTest();
       List <Account> companies = List<Account>([select Id, Name from Account Order by Name ASC]);   
       List <Work_Period__c> wps = List<Work_Period__c>([Select Id, Name, Order__r.Id, Order__r.Account__r.Name, 
                                   Rate__r.Id, Rate__r.Customer_Rate__c, Rate__r.Employer_Rate__c 
                                   From Work_Period__c Where Order__r.Account__r.Id IN : companies Order by Name ASC]);  
       System.assertEquals(wps[0].Name, 'Period Summer');
     } 
    
    /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() {
        Account company1   = new Account(Name='Microsoft');
        insert company1;
        Account company2   = new Account(Name='Cisco');
        insert company2;
        Order__c order1    = new Order__c(Name='Order1', Account__c=company1.Id);
        insert order1;
        Order__c order2    = new Order__c(Name='Order2', Account__c=company2.Id);
        insert order2;
        Rate__c rate1      = new Rate__c(Name='Winter', Customer_Rate__c=100,Employer_Rate__c=200);
        insert rate1;
        Rate__c rate2      = new Rate__c(Name='Summer', Customer_Rate__c=200,Employer_Rate__c=300);
        insert rate2;
        Work_Period__c wp1 = new Work_Period__c(Name='Period Winter', Start_date__c=Date.today(), End_Date__c=Date.today().addDays(10), Order__c=order1.Id, Rate__c=rate1.Id);
        insert wp1;
        Work_Period__c wp2 = new Work_Period__c(Name='Period Summer', Start_date__c=Date.today().addDays(100), End_Date__c=Date.today().addDays(200), Order__c=order2.Id, Rate__c=rate2.Id);
        insert wp2;
    }
}
