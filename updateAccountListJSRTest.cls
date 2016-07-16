/**
*@author LNazarenko
* This class tests controler updateAccountJSR
*/

@isTest
public class updateAccountListJSRTest 
{
    static testMethod void testUpdateAccountListJSR()
    {
        Account wrongAccount = new Account();
        
        Account newAccount   = new Account();
        newAccount.Name      = 'Test trade firm';
        insert newAccount;
    
        /** Test case for empty id */
        Test.startTest();
        wrongAccount         = updateAccountJSR.getAccountData(newAccount.ID);
        Test.stopTest();
        
        System.assertEquals(wrongAccount.ID, newAccount.ID, 'Error: Account ID does not exist.');
     }
}
