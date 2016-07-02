/**
@author LNazarenko
* This trigger WonGamesUseBubble counts the rating of winners and writes a value of field Place_in_the_rating__c
*/

trigger WonGamesUseBubble on Unit__c (before update) {
     
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
            BubbleSort(allUnitsList);
            
            /** Sort of union the lists of changed and unchanged warriors by the number of wins */ 
           for (Integer i = 0; i < allUnitsList.size(); i++){
             allUnitsList[i].Place_in_the_rating__c = i;
             System.Debug(allUnitsList[i].Place_in_the_rating__c);
           }
           
           if (unitList<>null)
           {
             update unitList;
           }
         }  
       }  
    
       /** Method sorts winners */ 
       public static void BubbleSort(Unit__c[] inArray) {
       Boolean swapped = false;
       do {
        swapped = false;
        for (Integer i = 0; i < (inArray.size() - 1); i++)
        {
            if (inArray[i].WonGames__c > inArray[i + 1].WonGames__c)
            {
                swap(inArray, i, i+1);
                swapped = true;
            } 
        } 
        
       } while (swapped == true);
      } 
   
      /** Method changes the places of the winners */ 
      private void swap(Unit__c[] inArray, Integer idx, Integer jdx) {
         Unit__c tempStr;
         tempStr = inArray[idx];
         inArray[idx] = inArray[jdx];
         inArray[jdx] = tempStr;
      }
       
 }