/**
@author LNazarenko
This class tests the Game class
*/
@isTest(SeeAllData=false)

  private class TestGame {
      /**  Test win warrior 2 */
    @isTest static void TestGameFightWar1() 
    {
        Unit__c unitOne = new Unit__c(Name='Test Unit1',HP__c=100,dmgMin__c=20,dmgMax__c=50);
        insert unitOne;
        Unit__c unitTwo = new Unit__c(Name='Test Unit2',HP__c=100000,dmgMin__c=1,dmgMax__c=3);
        insert unitTwo;
        GameObj gameOb = new GameObj();             
        Test.startTest();
        gameOb.Fight(unitOne,unitTwo);
        Test.stopTest();
        System.assertEquals(unitOne.HP__c,0);
    }    

    /**  Test win warrior 1 */
    @isTest static void TestGameFightWar2() 
    {
        Unit__c unitOne = new Unit__c(Name='Test Unit1',HP__c=100000,dmgMin__c=2,dmgMax__c=3);
        insert unitOne;
        Unit__c unitTwo = new Unit__c(Name='Test Unit2',HP__c=100,dmgMin__c=20,dmgMax__c=50);
        insert unitTwo;
        GameObj gameOb = new GameObj();             
        Test.startTest();
        gameOb.Fight(unitOne,unitTwo);
        Test.stopTest();
        System.assertEquals(unitTwo.HP__c,0);
    }   

}