/**
@author LNazarenko
* This trigger WonGamesMethodCompare counts the rating of winners and writes a value of field Place_in_the_rating__c
*/

trigger WonGamesMethodCompare on Unit__c (before update) {
     
         Map<Id, Unit__c> mapUnitUpdate = new Map<Id, Unit__c>();
         if (Trigger.isUpdate) {
         System.Debug('Its trigger');
         for(Unit__c newWins : Trigger.new){
           System.Debug(newWins);
           System.Debug(Trigger.oldMap.get(newWins.Id).WonGames__c);
            /** check for changes */
           if(newWins.WonGames__c!=Trigger.oldMap.get(newWins.Id).WonGames__c)
           {  
              mapUnitUpdate.put(newWins.Id,newWins);
           }
           System.Debug(mapUnitUpdate.values());
          }
         
          if(mapUnitUpdate.size()>0)
          { 
            List<Unit__c> unitList = [Select id,Name,WonGames__c,Place_in_the_rating__c From Unit__c Where id NOT in : mapUnitUpdate.keySet()];
            List<Unit__c> allUnitsList = new List<Unit__c> ();
            allUnitsList.addAll(unitList);
            allUnitsList.addAll(mapUnitUpdate.values());
     
            // Creating a list of child objects
            List<UnitWrapper> listWrapUnit = new List<UnitWrapper>();

            for(Unit__c war : allUnitsList)
            {
              UnitWrapper wrWar = new UnitWrapper(war);
              listWrapUnit.add(wrWar);
            }

            /**  And finally sorting a list of sObjects.
            * At this point the comparable interface will sort our list. */
            listWrapUnit.sort();
            
            /** Sort of union the lists of changed and unchanged warriors by the number of wins */ 
           for (Integer i = 0; i < listWrapUnit.size(); i++){
             listWrapUnit[i].warrior.Place_in_the_rating__c = i;
             System.Debug(listWrapUnit[i].warrior.Place_in_the_rating__c);
           }
           
           if (unitList<>null)
           {
             update unitList;
           }
        }  
    }  
 
 }