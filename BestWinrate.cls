/**
@author LNazarenko
This trigger BestWinrate writes a value of field WinRate depends from sum all fields WonGames 
*/
trigger BestWinrate on Unit__c (before update) {

         Map<Id, Unit__c> mapUnitUpdate = new Map<Id, Unit__c>();
         if (Trigger.isUpdate) {
         System.Debug('Its trigger');
         Integer sumUpdate = 0;
         for(Unit__c newWins : Trigger.new){
           System.Debug(newWins);
           System.Debug(Trigger.oldMap.get(newWins.Id).WonGames__c);
           sumUpdate = sumUpdate + (Integer)(Math.floor(newWins.WonGames__c));
           
            /** check for changes */
           if(newWins.WonGames__c!=Trigger.oldMap.get(newWins.Id).WonGames__c)
           {  
              mapUnitUpdate.put(newWins.Id,newWins);
           }
           System.Debug(mapUnitUpdate.values());
          }
         
          if(mapUnitUpdate.size()>0)
          { 
            List<Unit__c> newValuesWinners = new List<Unit__c>();
            newValuesWinners = new List<Unit__c>(mapUnitUpdate.values());
            List<Unit__c> unitList = [Select id,Name,WonGames__c,Place_in_the_rating__c,WinRate__c From Unit__c Where id NOT in : mapUnitUpdate .keySet()];
            List<Unit__c> allUnitsList = new List<Unit__c> ();
            allUnitsList.addAll(unitList);
            allUnitsList.addAll(newValuesWinners);
            
            SObject someSummWon;
            someSummWon = [SELECT SUM(WonGames__c)  sum From Unit__c WHERE WonGames__c != null and id NOT in : mapUnitUpdate .keySet()];
            /** sum of all wins */
            Integer sumIn =  (Integer)(Math.floor((Double)someSummWon.get('sum'))) + sumUpdate;
              
            System.Debug(sumIn);
            for(Unit__c itemUnit : allUnitsList)
            {
              /** the calculation of a percentage of the winnings */
              itemUnit.WinRate__c = (Integer)(Math.floor((itemUnit.WonGames__c*100)/sumIn));
            }
              
            if (unitList<>null)
            {
              update unitList;
            }
 
          }

      }
}