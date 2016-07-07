/**
@author LNazarenko
This class tests the CompanyController
*/

@isTest(SeeAllData=false)

  private class TestCompanyController {
   
    /** testCompanies checks company, order, rate and workperiod that return after call */
    static testMethod void testCreateCompany() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.JobPage;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       CompanyController controller = new CompanyController();
       /** Get companies with work periods and set */
       Test.startTest();
       controller.createCompany();
       controller.createOrder();
       controller.createRate();
       controller.createWP();
       Test.stopTest();
       System.assertEquals(controller.company1.getName(), 'Microsoft');
       System.assertEquals(controller.order2.getName(), 'Order2');
       System.assertEquals(controller.rate1.getName(), 'Winter');
       System.assertEquals(controller.wp2.getName(), 'Summer');
     }
    
      /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() 
    {
      Company company1 = new Company('Microsoft', '1');
      Company company2 = new Company('Cisco', '2');
      Order order1     = new Order('Order1', company1, '1');
      Order order2     = new Order('Order2', company2, '2');
      Rate rate1       = new Rate('Winter', '1', 100, 200);
      Rate rate2       = new Rate('Summer', '2', 200, 300);
      WorkPeriod wp1   = new WorkPeriod('Winter','1', Date.today(), Date.today().addDays(10), order1, rate1);
      WorkPeriod wp2   = new WorkPeriod('Summer','2', Date.today().addDays(100), Date.today().addDays(200), order2, rate2);
    }
}