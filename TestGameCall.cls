/**
@author LNazarenko
This class tests the the controller GameCall
*/

@isTest(SeeAllData=false)

private class TestGameCall {
       /**  Test win warrior 1  */
       static testMethod void testConGameCallWar1() {
       PageReference pageRef   = Page.Game;
       Test.setCurrentPage(pageRef);
       GameCall controller     = new GameCall();
       controller              = new GameCall(); 
       controller.inputName1   = 'Brave blood';
       controller.inputHP1     = 10000;
       controller.inputDmgMin1 = 1;
       controller.inputDmgMax1 = 3;
     
       controller.inputName2   = 'Hard kick';
       controller.inputHP2     = 100;
       controller.inputDmgMin2 = 30;
       controller.inputDmgMax2 = 70;
       Test.startTest();
       controller.ownSave();
       Test.stopTest();
       String Winner           = controller.Winner;
       /** Verify */
       System.assertEquals(Winner, 'Brave blood');
   }   
   
   /**  Test win warrior 2  */ 
   static testMethod void testConGameCallWar2() {
       PageReference pageRef = Page.Game;
       Test.setCurrentPage(pageRef);
       GameCall controller     = new GameCall();
       controller              = new GameCall(); 
       controller.inputName1   = 'Brave blood';
       controller.inputHP1     = 100;
       controller.inputDmgMin1 = 19;
       controller.inputDmgMax1 = 30;
       controller.inputName2   = 'Hard kick';
       controller.inputHP2     = 100000;
       controller.inputDmgMin2 = 1;
       controller.inputDmgMax2 = 2;
       Test.startTest();
       controller.ownSave();
       Test.stopTest();
       String Winner           = controller.Winner;
       /** Verify */
       System.assertEquals(Winner, 'Hard kick');
   }      
   
   /**  Test empty fields  */ 
   static testMethod void testConGameCallFail() {
       PageReference pageRef = Page.Game;
       Test.setCurrentPage(pageRef);
       GameCall controller = new GameCall();
       controller.ownSave();
       String Winner = controller.Winner;
        /** Verify */
       System.assertEquals(Winner, 'Input please all fields');
    }      
 }
