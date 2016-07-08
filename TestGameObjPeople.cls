/**
@author LNazarenko
This class tests the the controller GameCallObjPeople
*/

@isTest(SeeAllData=false)

private class TestGameObjPeople {
    
    /**  Test win warrior One */
    @isTest static void TestGameFightWar1() 
    { 
        Unit__c warriorHum = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][0]; 
        Unit__c warriorOrc = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][1]; 
        GameObjPeople gameOb = new GameObjPeople();             
        Test.startTest();
        gameOb.StageFightHuman(warriorHum, warriorOrc);
        Test.stopTest();
        System.assertEquals(warriorHum.HP__c,0);
    }    

    /**  Test win warrior Two */
    @isTest static void TestGameFightWar2() 
    {
        Unit__c warriorHum = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][0]; 
        Unit__c warriorOrc = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][1]; 
        GameObjPeople gameOb = new GameObjPeople();             
        Test.startTest();
        gameOb.StageFightHuman(warriorOrc, warriorHum);
        Test.stopTest();
        System.assertEquals(warriorHum.HP__c,0);
    }   
    
    /**  Test win warrior One */
    @isTest static void TestGameFightWarOr1() 
    {
        Unit__c warriorHum = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][0]; 
        Unit__c warriorOrc = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][1]; 
        GameObjPeople gameOb = new GameObjPeople();             
        Test.startTest();
        gameOb.StageFightOrc(warriorHum, warriorOrc);
        Test.stopTest();
        System.assertEquals(warriorHum.HP__c,0);
    }   
  
    /**  Test win warrior Two */
    @isTest static void TestGameFightWarOr2() 
    {
        Unit__c warriorHum = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][0]; 
        Unit__c warriorOrc = [Select Name, Id, dmgMin__c, HP__c, dmgMax__c From Unit__c][1];
        GameObjPeople gameOb = new GameObjPeople();             
        Test.startTest();
        gameOb.StageFightOrc(warriorOrc, warriorHum);
        Test.stopTest();
        System.assertEquals(warriorHum.HP__c,0);
    } 
    
    /** Data for tests */
    @testSetup
    static void allTheDataForThisTestClass() 
    {
        Unit__c unitOne = new Unit__c(Name='Test Unit1', HP__c=0, dmgMin__c=20, dmgMax__c=50);
        insert unitOne;
        Unit__c unitTwo = new Unit__c(Name='Test Unit2', HP__c=100000, dmgMin__c=1, dmgMax__c=3);
        insert unitTwo;
    }

}
