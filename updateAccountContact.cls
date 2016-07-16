/**
*@author LNazarenko
* This class provides first contact related input Account
*/

public with sharing class updateAccountContact
{
    /** Constructor */
    public Contact updateContactRecord{get;set;}

    public updateAccountContact()
    {
        /** Page from some account */
        String objectId = ApexPages.currentPage().getParameters().get('Id');
        if(!String.isBlank(objectId))
        {
            List <Contact> allContacts = [SELECT Id, FirstName, LastName, Phone
                                                                          FROM Contact
                                                                          WHERE AccountId =: objectId];
            if(!allContacts.isEmpty())
            {
                updateContactRecord = allContacts[0];
            }
            else
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,'There is no Contact with AccountId: '+objectId));
            }
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,'Contact Id was not given.'));
        }
    }
    
    public pageReference saveRecord()
    {
            update updateContactRecord;
            return ApexPages.currentPage();
    }

    public pageReference revertChanges()
    {
            PageReference pageURL = ApexPages.currentPage();
            pageURL.setRedirect(TRUE);
            return pageURL;
    }

}
