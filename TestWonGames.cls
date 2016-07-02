/**
@author LNazarenko
This class tests the trigger WonGames
*/

@isTest(SeeAllData=false)
private class TestWonGames {
     
    /** Test Start game with high advantages for warrior 1 */
    static testMethod void testPlaceInTheRating() {
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][0]; 
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][1]; 
       Unit__c warriorSmb = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][2];                       
       Test.startTest();
       /** Test Start game */
      
       warriorSmb.WonGames__c = 3;
       update warriorSmb;
       Test.stopTest();
       /** Verify that the success page displays */
       warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][0]; 
       warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][1]; 
       warriorSmb = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][2];    
   
       System.assertEquals(warriorSmb.Place_in_the_rating__c, 2);
   } 
   /** Test Start game tests of the behave */
    static testMethod void testSortWinners() {
       /** Use the PageReference Apex class to instantiate a page */
       PageReference pageRef = Page.GameObjPeople;
       Test.setCurrentPage(pageRef);
       /** Instantiate and construct the controller class. */  
       GameCallObjPeople controller = new GameCallObjPeople();
       Unit__c warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][0]; 
       Unit__c warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][1]; 
       Unit__c warriorSmb = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][2]; 
       controller.setWarrior1(warriorSmb);
       controller.setWarrior2(warriorOrc);                       
       Test.startTest();
       /** Test Start game */
      
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
       controller.ownStart();
      
       Test.stopTest();
       /** Verify that the success page displays */
       warriorHum = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][0]; 
       warriorOrc = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][1]; 
       warriorSmb = [select name,id,dmgMin__c,HP__c,dmgMax__c,isActive__c,
                             WonGames__c,Place_in_the_rating__c,WinRate__c from unit__c][2];    
   
       System.assertEquals(warriorSmb.Place_in_the_rating__c, 1);
        
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
       warriorHum.TypeAttack__c='Head';
       warriorHum.TypeBlock__c ='Head';
       warriorHum.WonGames__c = 1;
       warriorHum.Place_in_the_rating__c = 0;
       warriorHum.WinRate__c = 0;
       insert warriorHum;
       
       Unit__c warriorOrc = new Unit__c(Name='Brave blood',HP__c=10,dmgMin__c=19,dmgMax__c=30,
                                     isActive__c=false,TypeAttack__c='Сhest',TypeBlock__c='Сhest',
                             WonGames__c = 2,Place_in_the_rating__c=1,WinRate__c=0);
       insert warriorOrc;
       
       Unit__c warriorHumF        = new Unit__c();
       warriorHumF.Name           = 'Blood dog';
       warriorHumF.HP__c          = 10000;
       warriorHumF.dmgMin__c      = 1;
       warriorHumF.dmgMax__c      = 2;
       warriorHumF.isActive__c    = false;
       warriorHumF.WonGames__c = 0;
       warriorHumF.Place_in_the_rating__c = 0;
       warriorHumF.WinRate__c = 0;
       insert warriorHumF;
       
    }
 }
