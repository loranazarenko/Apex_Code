/**
@author LNazarenko
This class tests the the controller GameCallObjPeople
*/

@isTest(SeeAllData=false)
private class TestGameCallObjPeople {
     
    /** Test Start game with high advantages for warrior 1 */
    static testMethod void testConGameCallWar1() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       GameCallObjPeople controller = new GameCallObjPeople();
       /** Get warriors and set */
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       Unit__c warriorOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       controller.setWarrior1(warriorHum);
       controller.setWarrior2(warriorOrc); 
       Test.startTest();
       /** Test Start game */
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       /** Verify that the success page displays */
       System.assertEquals(Winner, '');
   }   
   
   /** Test Start game with high advantages for warrior 2 */ 
   static testMethod void testConGameCallWar2() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
        Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[4]; 
       Unit__c warriorOrc  = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[5]; 
       controller.setWarrior1(warriorHum);
       controller.setWarrior2(warriorOrc); 
       Test.startTest();
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       System.assertEquals(Winner, '');
   }      
     /** Test edit page for warrior 1 */ 
     static testMethod void testConGameCallEditWar1() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       controller.setWarrior1(warriorHum);
       /** Test page Edit - get url and compare with the etalon */
       String nextPage = controller.ownEditWar1Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/EditPageWar1'+'?Id='+vid, nextPage);
    }  
    
    /** Test edit page for warrior 2 */ 
    static testMethod void testConGameCallEditWar2() {
       String vid = ApexPages.currentPage().getParameters().get('id'); 
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, isActive__c, 
                            TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       controller.setWarrior2(warriorOrc); 
       /** Test page Edit - get url and compare with the etalon */
       String nextPage = controller.ownEditWar2Page().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/EditPageWar2'+'?Id='+vid, nextPage);
    } 
    
    /** Testing the search through SOQL */ 
    static testMethod void testConGameCallSearchSOQL() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
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
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       controller.setWarrior1(warriorHum);
       string searchstring = 'Brave blood'; 
       controller.searchstring = searchstring; 
       controller.searchSOSL();
       Test.stopTest();
       System.assertEquals(controller.unitsSOSL[0].Name, 'Brave blood');
    }     
   
   /** Testing the search result */
   static testMethod void testConGameCallSearchSOSLSOQL() {
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1];       
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
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
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1];       
       Id [] fixedSearchResults= new Id[1]; 
       fixedSearchResults[0] = warriorHum.Id; 
       Test.setFixedSearchResults(fixedSearchResults); 
       Test.startTest();
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
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
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObjPeople controller = new GameCallObjPeople();
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
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Test.startTest();
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       Unit__c warriorOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       controller.setWarrior1(warriorHum); 
       controller.setWarrior2(warriorOrc); 
       Unit__c warUn = controller.getWarrior1(); 
       Unit__c warOr = controller.getWarrior2(); 
       controller.refreshFieldsHum();
       controller.refreshFieldsOrc();
       Test.stopTest();
       System.assertEquals(warUn.Name, controller.getWarrior1().Name);
       System.assertEquals(warOr.Name, controller.getWarrior2().Name);
    }  
     
     /** Testing of the methods refreshFields and refreshFields2 by selecting values in the picklist */
     static testMethod void testConLists() {
       String strFields1 = 'Brave blood';
       String strFields2 = 'Hard kick';
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       controller.selectedWarHum = strFields1; 
       controller.selectedWarOrc = strFields2;
       Test.startTest();
       controller.refreshFieldsHum();
       controller.refreshFieldsOrc();
       Test.stopTest();
       System.assertEquals(controller.getWarrior1().Name, 'Brave blood');
       System.assertEquals(controller.getWarrior2().Name, 'Hard kick');
    } 
    
    /** Testing of the cancel method on the edit and the save pages */
    static testMethod void testCancelPage() {
       PageReference pageRef = Page.CreateWarNew;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
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
       GameCallObjPeople controller = new GameCallObjPeople();
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
       GameCallObjPeople controller = new GameCallObjPeople();
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
       GameCallObjPeople controller = new GameCallObjPeople();
       String vid = ApexPages.currentPage().getParameters().get('id');
       String curPage = controller.ownSaveWarNewPage().getUrl();
       Test.stopTest();
       System.assertEquals('/apex/GameObj'+'?Id='+vid, curPage );
    } 
    
    /** Testing of warriors with HP == 0 */
    static testMethod void testDie() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorZeroHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                                isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[2]; 
       Unit__c warriorZeroOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                                isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[3]; 
       controller.setWarrior1(warriorZeroHum);
       controller.setWarrior2(warriorZeroOrc); 
       Test.startTest();
       controller.ownStart();
       Test.stopTest();
       System.assertEquals(warriorZeroHum.HP__c, 0);
       System.assertEquals(warriorZeroOrc.HP__c, 0);
    }
    
    /** Testing case when both warriors are null */
    static testMethod void testNull() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Test.startTest();
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       System.assertEquals(Winner, 'Fill, please, all fields.');
    }
    
    /** Testing of warrior with HP == 0 and other HP>0 and vice versa */
    static testMethod void testOneDie() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[6]; 
       Unit__c warriorOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       controller.setWarrior1(warriorHum);
       controller.setWarrior2(warriorOrc); 
       String strFields1 = 'Terrible';
       String strFields2 = 'Hard kick';
       controller.selectedWarHum = strFields1; 
       controller.selectedWarOrc = strFields2;
       Test.startTest();
       controller.firstKik = false;
       controller.ownStart();
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       System.assertEquals(Winner, 'Hard kick');
    }
    
    /** Testing of warrior with HP == 0 and other HP>0 and vice versa and with option block */
    static testMethod void testTwoDie() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       Unit__c warriorOrc = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                            isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[6]; 
       controller.setWarrior1(warriorHum);
       controller.setWarrior2(warriorOrc); 
       String strFields1 = 'Hard kick';
       String strFields2 = 'Terrible';
       controller.selectedWarHum = strFields1; 
       controller.selectedWarOrc = strFields2;
       Test.startTest();
       controller.firstKik = false;
       controller.ownStart();
       controller.ownStart();
       Test.stopTest();
       String Winner = controller.Winner;
       System.assertEquals(Winner, 'Hard kick');
    }
    
    /** Testing of option block */
    static testMethod void testOptionBlock() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       GameCallObjPeople controller = new GameCallObjPeople();
       Test.startTest();
       String option = controller.getOptionsBlock()[0].getValue();
       Test.stopTest();
       System.assertEquals(option, String.valueOf(1));
    }
    
     /** Testing of assignmentAttack  */
    static testMethod void testAssignmentAttack() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Unit__c warriorHum1 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       GameCallObjPeople controller = new GameCallObjPeople();
       controller.setWarrior1(warriorHum1);
       Test.startTest();
       controller.assignmentAttack();
       Test.stopTest();
       System.assertEquals(controller.atk, 1);
       Unit__c warriorHum2 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       controller.setWarrior1(warriorHum2); 
       controller.assignmentAttack();
       System.assertEquals(controller.atk, 2);
       Unit__c warriorHum3 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[2]; 
       controller.setWarrior1(warriorHum3); 
       controller.assignmentAttack();
       System.assertEquals(controller.atk, 3);
        Unit__c warriorHum4 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                              isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[3]; 
       controller.setWarrior1(warriorHum4); 
       controller.assignmentAttack();
       System.assertEquals(controller.atk, 4);
       
    }
    
    /** Testing of assignmentBlock  */
    static testMethod void testAssignmentBlock() {
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       Unit__c warriorHum1 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[0]; 
       GameCallObjPeople controller = new GameCallObjPeople();
       controller.setWarrior1(warriorHum1);
       Test.startTest();
       controller.assignmentBlock();
       Test.stopTest();
       System.assertEquals(controller.blk, 1);
       Unit__c warriorHum2 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[1]; 
       controller.setWarrior1(warriorHum2); 
       controller.assignmentBlock();
       System.assertEquals(controller.blk, 2);
       Unit__c warriorHum3 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c,
                             isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[2]; 
       controller.setWarrior1(warriorHum3); 
       controller.assignmentBlock();
       System.assertEquals(controller.blk, 3);
        Unit__c warriorHum4 = new List<Unit__c>([Select Name, Id, dmgMin__c, HP__c, dmgMax__c, 
                              isActive__c, TypeAttack__c, TypeBlock__c From Unit__c])[3]; 
       controller.setWarrior1(warriorHum4); 
       controller.assignmentBlock();
       System.assertEquals(controller.blk, 4);
    }
    
    /**  Test random value */
    @isTest static void TestRandType() 
    {
        Set<integer> someValues = new Set<integer>{1,2,3,4};
        List<integer> otherValues = new List<integer>();
        GameCallObjPeople gameOb = new GameCallObjPeople();             
        Test.startTest();
        for(integer i =0; i<1000;i++)
        {
           integer val = gameOb.randType();
           if(!someValues.contains(val))
           {
             otherValues.add(val);  
           }
        }
        Test.stopTest();
        System.assertEquals(otherValues.size(),0);
    } 
    
    /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() {
    
       Unit__c warriorHum  = new Unit__c();
       warriorHum.Name         = 'Hard kick';
       warriorHum.HP__c        = 10000;
       warriorHum.dmgMin__c    = 5;
       warriorHum.dmgMax__c    = 10;
       warriorHum.isActive__c  = true;
       warriorHum.TypeAttack__c= '1';
       warriorHum.TypeBlock__c = '1';
       insert warriorHum;
       
       Unit__c warriorOrc = new Unit__c();
       warriorOrc.Name         = 'Brave blood';
       warriorOrc.HP__c        = 10;
       warriorOrc.dmgMin__c    = 19;
       warriorOrc.dmgMax__c    = 30;
       warriorOrc.isActive__c  = false;
       warriorOrc.TypeAttack__c= '2';
       warriorOrc.TypeBlock__c = '2';
       insert warriorOrc;
       
       Unit__c warriorZeroHum = new Unit__c();
       warriorZeroHum.Name         = 'Null Hum';
       warriorZeroHum.HP__c        = 0;
       warriorZeroHum.dmgMin__c    = 1;
       warriorZeroHum.dmgMax__c    = 2;
       warriorZeroHum.isActive__c  = true;
       warriorZeroHum.TypeAttack__c= '3';
       warriorZeroHum.TypeBlock__c = '3';
       insert warriorZeroHum;
       
       Unit__c warriorZeroOrc = new Unit__c();
       warriorZeroOrc.Name        = 'Null Orc';
       warriorZeroOrc.HP__c       = 0;
       warriorZeroOrc.dmgMin__c   = 1;
       warriorZeroOrc.dmgMax__c   = 2;
       warriorZeroOrc.isActive__c = true;
       warriorZeroOrc.TypeAttack__c= '4';
       warriorZeroOrc.TypeBlock__c = '4';
       insert warriorZeroOrc;
       
       Unit__c warriorHumF        = new Unit__c();
       warriorHumF.Name           = 'Blood dog';
       warriorHumF.HP__c          = 10000;
       warriorHumF.dmgMin__c      = 1;
       warriorHumF.dmgMax__c      = 2;
       warriorHumF.isActive__c    = false;
       insert warriorHumF;
       
       Unit__c warriorOrcF = new Unit__c();
       warriorOrcF.Name           ='Horror of the night';
       warriorOrcF.HP__c          = 10;
       warriorOrcF.dmgMin__c      = 19;
       warriorOrcF.dmgMax__c      = 30;
       warriorOrcF.isActive__c    = true;
       insert warriorOrcF;
       
       Unit__c warriorOrcFMin = new Unit__c();
       warriorOrcFMin.Name        ='Terrible';
       warriorOrcFMin.HP__c       = 1;
       warriorOrcFMin.dmgMin__c   = 1;
       warriorOrcFMin.dmgMax__c   = 1;
       warriorOrcFMin.isActive__c = false;
       insert warriorOrcFMin;
    }
     
 }
