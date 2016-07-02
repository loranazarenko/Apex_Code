/**
@author LNazarenko
* This wrapper class helps compare objects of Unit's class
*/

global class UnitWrapper implements Comparable {

    public Unit__c warrior;
    
    /** Constructor  */
    public UnitWrapper(Unit__c warr) 
    {
      warrior = warr;
    }
    
    /**  Compare warriors based on the number of wins. */
    global Integer compareTo(Object compareTo) {
        /** Cast argument to UnitWrapper */
        UnitWrapper compareToWarr = (UnitWrapper)compareTo;
        
        /** The return value of 0 indicates that both elements are equal. */
        Integer returnValue = 0;
        if (warrior.WonGames__c > compareToWarr.warrior.WonGames__c) 
        {
            /** Set return value to a positive value.  */
            returnValue = 1;
        } 
        else if (warrior.WonGames__c < compareToWarr.warrior.WonGames__c) 
        {
            /** Set return value to a negative value.  */
            returnValue = -1;
        }
        
        return returnValue;       
    }
}