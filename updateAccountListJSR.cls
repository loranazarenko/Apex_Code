/**
*@author LNazarenko
* This class - custom Controller gets accounts for output on the visual page with @RemoteAction
*/

public with sharing class updateAccountListJSR
{    
    @RemoteAction
    public static List<Account> getAccountListData()
    {
        return new List<Account>([SELECT Id, Name
                                 FROM Account]);
    }
    
}