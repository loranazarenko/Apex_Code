/**
@author LNazarenko
This class tests the Unit class
*/

@isTest(SeeAllData=false)

private class TestUnit {
  
     /**  Test win warrior 2 */
    @isTest static void TestUnitWar1() 
    {
        Unit unitOne = new Unit('Test Unit1',200,20,50);
        Unit unitTwo = new Unit();
        unitTwo.setName('Test Unit2');
        unitTwo.setHP(100000);
        unitTwo.setDmgMin(1);
        unitTwo.setDmgMax(3);
        Game gameS = new Game();  
        Test.startTest();
        gameS.Fight(unitOne,unitTwo);
        Test.stopTest();
        System.assertEquals(unitOne.getHP(),0);
    }    

    /**  Test win warrior 1 */
    @isTest static void TestUnitWar2() 
    {
        Unit unitOne = new Unit();
        Unit unitTwo = new Unit('Test Unit2',200,20,50);
        unitOne.setName('Test Unit1');
        unitOne.setHP(100000);
        unitOne.setDmgMin(1);
        unitOne.setDmgMax(3);
        Game gameS = new Game();  
        Test.startTest();
        gameS.Fight(unitOne,unitTwo);
        Test.stopTest();
        System.assertEquals(unitTwo.getHP(),0);
    }    


}