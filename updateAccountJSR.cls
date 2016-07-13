public with sharing class updateAccountJSR
{
    @RemoteAction
    public static Account getAccountData(String accountId)
    {
        return [SELECT Id, Name
                        FROM Account
                        WHERE Id =: accountId][0];
    }
    
    @RemoteAction
    public static List<Account> getAccountListData()
    {
        return new List<Account>([SELECT Id, Name
                                 FROM Account]);
    }
    
}