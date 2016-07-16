/**
/**
*@author LNazarenko
* This class tests controler updateAccountJSR
*/

@isTest
public class updateAccountListJSRTest 
{
    static testMethod void testNormalId()
    {  
        for(integer i = 0; i<100; i++)
        {
          Account newAccount   = new Account();
          newAccount.Name      = 'New firm ' + i;
          insert newAccount;
        }
        
        /** Test case for right id */
        Test.startTest();
        List <Account> newAccounts  = updateAccountListJSR.getAccountListData();
        Test.stopTest();
        Account testAccount  = [SELECT Id, Name
                        FROM Account
                        WHERE Name =: 'New firm 0'];
        System.assertEquals(testAccount.ID, newAccounts[0].ID, 'Congratulation!');
     }
}