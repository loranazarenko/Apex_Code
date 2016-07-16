/**
*@author LNazarenko
* This class - custom Controller gets account for output on the visual page with @RemoteAction
*/

public with sharing class updateAccountJSR
{
    @RemoteAction
    public static Account getAccountData(String accountId)
    {
        return [SELECT Id, Name
                        FROM Account
                        WHERE Id =: accountId][0];
    }
}
