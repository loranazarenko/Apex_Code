/**
@author LNazarenko
* This batch unitHPBatch adds 5 warriors 10 points to life
*/

global class unitHPBatch implements Database.Batchable<sObject>{
      global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([Select id,name,HP__c from Unit__c limit 5]);
   }
   
   global void execute(Database.BatchableContext BC, List<sObject> scope){
       List<Unit__c> updateUnitList = new List<Unit__c>();
       for(Unit__c item:(List<Unit__c>)scope)
       {
         item.HP__c = item.HP__c + 10;    
         item.Stamina__c = true; 
         updateUnitList.add(item);  
       }
       system.debug(updateUnitList);
       update updateUnitList;
    }

   global void finish(Database.BatchableContext BC){
   }
}
