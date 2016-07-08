/**
@author LNazarenko
* This test class ScheduledUnitHPBatch check to start batch
*/

    @isTest(SeeAllData=false)
    private class TestScheduledUnitHPBatch {
     /** Test execute Schedule */
      static testMethod void testCallSchedule() 
      {
        Test.startTest();
        ScheduledUnitHPBatch newShed = new ScheduledUnitHPBatch();
        String timeGo = '59 59 23 09 * ?';
        String cronIDBatch = System.schedule('Increase life', timeGo, newShed);
        
        Test.stopTest();
        CronTrigger ctBatch = [SELECT Id, TimesTriggered, NextFireTime
                         FROM CronTrigger WHERE Id = :cronIDBatch];
                   
        System.assertEquals(0, ctBatch.TimesTriggered);
        System.assertEquals('2016-07-09 23:59:59', String.valueOf(ctBatch.NextFireTime)); 
      } 
}