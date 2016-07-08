/**
@author LNazarenko
* This test checks class UnitHPBatch  to add warriors 10 points to life and to set Stamina = true
*/

@isTest(SeeAllData=false)
private class TestUnitHPBatch {
     
    /** Test execute batch */
    static testMethod void testCallBatch() 
    {
       Test.startTest();
       UnitHPBatch batch = new UnitHPBatch();
       Database.executebatch(batch);
       Test.stopTest();
       
       /** Verify  */
       List <Unit__c> warriors = [select Name, Id, dmgMin__c, HP__c, dmgMax__c, Stamina__c from Unit__c]; 
       System.assertEquals(warriors[2].HP__c, 10010);
       System.assertEquals(warriors[2].Stamina__c, true);
    }


    @testSetup
    static void allTheDataForThisTestClass() 
    {
        for(Integer i = 0; i<5; i++)
        {
           Unit__c warriorHum  = new Unit__c();
           warriorHum.Name     ='Hard kick';
           warriorHum.HP__c    = 10000;
           warriorHum.dmgMin__c= 1;
           warriorHum.dmgMax__c= 2;
           insert warriorHum;
       }
    }
 }
