@isTest
private class updateAccountContactTest
{
    @TestSetup
    static void createContact()
    {
        Account insertAccount   = new Account();
        insertAccount.Name      = 'UnitTestAcc';
        insert insertAccount;
        
        Account insertAccountNoCont   = new Account();
        insertAccountNoCont.Name      = 'UnitTestAccNoCont';
        insert insertAccountNoCont;
    
        Contact insertContact   = new Contact();
        insertContact.LastName  = 'UnitTest';
        insertContact.AccountId = insertAccount.Id;
        insert insertContact;
    }
    
    @isTest
    static void openPageWithNoContact()
    {
        PageReference pageRef = Page.updateAccountContactPage;
        Account newAccount    = [SELECT Id, Name FROM Account Where Name=: 'UnitTestAccNoCont'];
        
        pageRef.getParameters().put('Id',newAccount.Id);
        Test.setCurrentPage(pageRef);
        
        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();
        
        System.debug(ApexPages.getMessages());
        System.assertEquals(TRUE, ApexPages.getMessages().get(0).getDetail().contains('There is no Contact with AccountId: '), 'Apex Message was not added.');
        System.assertEquals(NULL, controller.updateContactRecord, 'Contact Record should be NULL');
    }

    @isTest
    static void openPageWithNoId()
    {
        PageReference pageRef = Page.updateAccountContactPage;
        Test.setCurrentPage(pageRef);

        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();

        System.assertEquals(TRUE, ApexPages.getMessages().get(0).getDetail().contains('Contact Id was not given.'), 'Apex Message was not added.');
        System.assertEquals(NULL, controller.updateContactRecord, 'Contact Record should be NULL');
    }

    @isTest
    static void openPageWithWrongId()
    {
        String badId = '123i321';
        PageReference pageRef = Page.updateAccountContactPage;
        pageRef.getParameters().put('Id',badId);
        Test.setCurrentPage(pageRef);

        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();

        System.assertEquals(TRUE, ApexPages.getMessages().get(0).getDetail().contains('There is no Contact with AccountId: '+badId), 'Apex Message was not added.');
        System.assertEquals(NULL, controller.updateContactRecord, 'Contact Record should be NULL');
    }

    @isTest
    static void openPageWithEmptyId()
    {
        PageReference pageRef = Page.updateAccountContactPage;
        pageRef.getParameters().put('Id','');
        Test.setCurrentPage(pageRef);

        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();

        System.assertEquals(TRUE, ApexPages.getMessages().get(0).getDetail().contains('Contact Id was not given.'), 'Apex Message was not added.');
        System.assertEquals(NULL, controller.updateContactRecord, 'Contact Record should be NULL');
    }

    @isTest
    static void openPageWithNullId()
    {
        PageReference pageRef = Page.updateAccountContactPage;
        pageRef.getParameters().put('Id',NULL);
        Test.setCurrentPage(pageRef);

        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();

        System.assertEquals(TRUE, ApexPages.getMessages().get(0).getDetail().contains('Contact Id was not given.'), 'Apex Message was not added.');
        System.assertEquals(NULL, controller.updateContactRecord, 'Contact Record should be NULL');
    }

    @isTest
    static void openPageWithId()
    {
        PageReference pageRef = Page.updateAccountContactPage;
        Account newAccount = [SELECT Id, Name FROM Account][0];
        Contact newContact = [SELECT Id, FirstName, LastName, Phone
                             FROM Contact
                             WHERE AccountId =: newAccount.Id];
        pageRef.getParameters().put('Id', newAccount.Id);
        Test.setCurrentPage(pageRef);

        Test.startTest();
        updateAccountContact controller = new updateAccountContact();
        Test.stopTest();

        System.assertEquals(newContact.Id, controller.updateContactRecord.Id, 'Contact Id does not match.');
        System.assertEquals(newContact.FirstName, controller.updateContactRecord.FirstName, 'Contact FirstName does not match.');
        System.assertEquals(newContact.LastName, controller.updateContactRecord.LastName, 'Contact LastName does not match.');
        System.assertEquals(newContact.Phone, controller.updateContactRecord.Phone, 'Contact Phone does not match.');
        System.assertEquals(ApexPages.getMessages().size(), 0, 'Apex Message should not be added.');
    }
}