/**
@author LNazarenko
This class tests the ReportClass
*/
@isTest(SeeAllData=false)

  private class TestReportClass {
   
    /** testCompanies checks company that returns after call */
    static testMethod void testGetAccounts() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.ClassListAccount;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       ReportClass controller = new ReportClass();
       /** Get companies with work periods and set */
       Test.startTest();
       List <ReportClass.Wrapper> cmp = controller.getAccounts();
       System.Debug(cmp);
       Test.stopTest();
       List <Account> companies = [select Id, Name from Account Order by Name ASC];   
       System.assertEquals(companies[0].Name, 'Cisco');
       System.assertEquals(cmp[1].checkbox, false);
     }
    
    /** testCompanies checks String result after select checkboxes and press button 'Process' */
    static testMethod void testProcessWrapps() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.ClassListAccount;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       ReportClass controller = new ReportClass();
       /** Get companies with work periods and set */
       Test.startTest();
       List <ReportClass.Wrapper> cmp = controller.getAccounts();
       cmp[0].checkbox = true;
       System.Debug(cmp);
       Test.stopTest();
       controller.processWrapps();
       List <String> compare = new List<String>{'Cisco'};
       Boolean result;
       System.Debug(controller.myResults);
       result = controller.myResults.containsAll(compare);
       System.assertEquals(result, true);
    }      
        
    /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() {
        Account company1   = new Account(Name='Microsoft');
        insert company1;
        Account company2   = new Account(Name='Cisco');
        insert company2;
      
    }
}
