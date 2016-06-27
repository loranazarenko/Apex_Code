/**
@author LNazarenko
This class tests the the controller GameCallObj
*/

@isTest(SeeAllData=false)
private class TestGameCallObj {
     
    /** Test Start game with high advantages for warrior 1 */
    static testMethod void testConGameCallWar1() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       GameCallObj controller = new GameCallObj();
       /** Get warriors and set */
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][0]; 
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1]; 
       controller.setWarrior1(warriorHum);
       controller.setWarrior2(warriorOrc); 
       Test.startTest();
       /** Test Start game */
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       /** Verify that the success page displays */
       System.assertEquals(Winner, 'Hard kick');
   }   
   
   /** Test Start game with high advantages for warrior 2 */ 
   static testMethod void testConGameCallWar2() {
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][0]; 
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1]; 
       controller.setWarrior1(warriorOrc);
       controller.setWarrior2(warriorHum); 
       Test.startTest();
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       System.assertEquals(Winner, 'Hard kick');
   }      
     /** Test edit page for warrior 1 */ 
     static testMethod void testConGameCallEditWar1() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObj controller = new GameCallObj();
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][0]; 
       controller.setWarrior1(warriorHum);
       /** Test page Edit - get url and compare with the etalon */
       String nextPage = controller.ownEditWar1Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/EditPageWar1'+'?Id='+vid, nextPage);
    }  
    
    /** Test edit page for warrior 2 */ 
    static testMethod void testConGameCallEditWar2() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObj controller = new GameCallObj();
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1]; 
       controller.setWarrior2(warriorOrc); 
       /** Test page Edit - get url and compare with the etalon */
       String nextPage = controller.ownEditWar2Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/EditPageWar2'+'?Id='+vid, nextPage);
    } 
    
    /** Testing the search through SOQL */ 
    static testMethod void testConGameCallSearchSOQL() {
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][0]; 
       controller.setWarrior1(warriorHum);
       string searchstring = 'Hard kick'; 
       controller.searchstring = searchstring; 
       Test.startTest();
       controller.searchSOQL();
       Test.stopTest();
       System.assertEquals(controller.unitsSOQL[0].Name, 'Hard kick');
    }    
    
    /** Testing the search through SOSL */
    static testMethod void testConGameCallSearchSOSL() {
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1]; 
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       controller.setWarrior1(warriorHum);
       string searchstring = 'Brave blood'; 
       controller.searchstring = searchstring; 
       controller.searchSOSL();
       Test.stopTest();
       System.assertEquals(controller.unitsSOSL[0].Name, 'Brave blood');
    }     
   
   /** Testing the search result */
   static testMethod void testConGameCallSearchSOSLSOQL() {
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1];       
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       controller.setWarrior1(warriorHum);
       string searchstring = 'Brave blood'; 
       controller.searchstring = searchstring; 
       controller.search();
       Test.stopTest();
       System.assertEquals(controller.unitsSOQL[0].Name, 'Brave blood');
       System.assertEquals(controller.unitsSOSL[0].Name, 'Brave blood');
    }  
    
    /** Testing the clearing of the search result */
    static testMethod void testConGameCallClearSearchSOSLSOQL() {
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1];       
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       controller.setWarrior1(warriorHum);
       string searchstring = 'Brave blood'; 
       controller.searchstring = searchstring; 
       controller.search();
       controller.clear();
       Test.stopTest();
       System.assertEquals(controller.unitsSOQL.size(),0);
       System.assertEquals(controller.unitsSOSL.size(),0);
    } 
    
    /** Testing the creation of a new warrior */
    static testMethod void testConGameNewWar() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObj controller = new GameCallObj();
       String nextPage = controller.ownCreate().getUrl();
       Unit__c warriorHum = [select name,id from unit__c][0]; 
       controller.setWarriorNew(warriorHum);
       Test.stopTest();
       System.assertEquals(controller.getWarriorNew().Name, 'Hard kick');
       System.assertEquals('/apex/CreateWarNew'+'?Id='+vid, nextPage);
    }   
    
    /** Testing of the methods refreshFields and  refreshFields2 */
    static testMethod void testRefreshFieldsWarHum() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObj controller = new GameCallObj();
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][0]; 
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][1]; 
       controller.setWarrior1(warriorHum); 
       controller.setWarrior2(warriorOrc); 
       Unit__c warUn = controller.getWarrior1(); 
       Unit__c warOr = controller.getWarrior2(); 
       controller.refreshFields();
       controller.refreshFields2();
       Test.stopTest();
       System.assertEquals(warUn.Name, controller.getWarrior1().Name);
       System.assertEquals(warOr.Name, controller.getWarrior2().Name);
    }  
     
     /** Testing of the methods refreshFields and refreshFields2 by selecting values in the picklist */
     static testMethod void testConLists() {
       String strFields1 = 'Brave blood';
       String strFields2 = 'Hard kick';
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       controller.selectedWar1= strFields1; 
       controller.selectedWar2= strFields2;
       Test.startTest();
       controller.refreshFields();
       controller.refreshFields2();
       Test.stopTest();
       System.assertEquals(controller.getWarrior1().Name, 'Brave blood');
       System.assertEquals(controller.getWarrior2().Name, 'Hard kick');
    } 
    
    /** Testing of the cancel method on the edit and the save pages */
    static testMethod void testCancelPage() {
       PageReference pageRef = Page.CreateWarNew;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       String vid = ApexPages.currentPage().getParameters().get('id');
       Test.startTest();
       controller.ownCancel(); 
       String curPage = controller.ownCancel().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/GameObj'+'?Id='+vid, curPage );
    } 
    
    /** Testing of the save method on the edit pages */
    static testMethod void testSaveEditPageWar1() {
       PageReference pageRef = Page.EditPageWar1;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       String vid = ApexPages.currentPage().getParameters().get('id');
       Test.startTest();
       String curPage = controller.ownSaveWar1Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/GameObj'+'?Id='+vid, curPage );
    } 
    
    /** Testing of the save method on the edit pages */
    static testMethod void testSaveEditPageWar2() {
       Test.startTest();
       PageReference pageRef = Page.EditPageWar2;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       String vid = ApexPages.currentPage().getParameters().get('id');
       String curPage = controller.ownSaveWar2Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/GameObj'+'?Id='+vid, curPage );
    } 
    
    /** Testing of the save method on the save page */
    static testMethod void testSaveEditPageNew() {
       Test.startTest();
       PageReference pageRef = Page.CreateWarNew;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       String vid = ApexPages.currentPage().getParameters().get('id');
       String curPage = controller.ownSaveWarNewPage().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/GameObj'+'?Id='+vid, curPage );
    } 
    
    /** Testing of warriors with HP == 0 */
    static testMethod void testDie() {
       PageReference pageRef = Page.GameObj;
       Test.setCurrentPage(pageRef);
       GameCallObj controller = new GameCallObj();
       Unit__c warriorZeroHum = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][2]; 
       Unit__c warriorZeroOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c from unit__c][3]; 
       controller.setWarrior1(warriorZeroHum);
       controller.setWarrior2(warriorZeroOrc); 
       Test.startTest();
       controller.ownStart();
       Test.stopTest();
       System.assertEquals(warriorZeroHum.HP__c, 0);
       System.assertEquals(warriorZeroOrc.HP__c, 0);
    }
    
    /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() {
    
       Unit__c warriorHum  = new Unit__c();
       warriorHum.Name     ='Hard kick';
       warriorHum.HP__c    = 10000;
       warriorHum.dmgMin__c= 1;
       warriorHum.dmgMax__c= 2;
       insert warriorHum;
       
       Unit__c warriorOrc   = new Unit__c();
       warriorOrc.Name      = 'Brave blood';
       warriorOrc.HP__c     = 10;
       warriorOrc.dmgMin__c = 19;
       warriorOrc.dmgMax__c = 30;
       insert warriorOrc;
       
       Unit__c warriorZeroHum   = new Unit__c();
       warriorZeroHum.Name      = 'Null Hum';
       warriorZeroHum.HP__c     = 0;
       warriorZeroHum.dmgMin__c = 1;
       warriorZeroHum.dmgMax__c = 2;
       insert warriorZeroHum;
       
       Unit__c warriorZeroOrc   = new Unit__c();
       warriorZeroOrc.Name      = 'Null Orc';
       warriorZeroOrc.HP__c     = 0;
       warriorZeroOrc.dmgMin__c = 1;
       warriorZeroOrc.dmgMax__c = 2;
       insert warriorZeroOrc;
    }
     
 }