/**
*@author LNazarenko
* This class tests controler updateAccountJSR
*/

@isTest
public class updateAccountListJSRTest 
{
    static testMethod void testNormalId()
    {
        Account newAccount   = new Account();
        newAccount.Name      = 'Test trade firm';
        insert newAccount;
        
        /** Test case for right id */
        Test.startTest();
        newAccount           = updateAccountJSR.getAccountData(newAccount.ID);
        Test.stopTest();
        Account testAccount  = [SELECT Id, Name
                        FROM Account
                        WHERE Name =: 'Test trade firm'];
        System.assertEquals(testAccount.ID, newAccount.ID, 'Congratulation!');
     }
}
