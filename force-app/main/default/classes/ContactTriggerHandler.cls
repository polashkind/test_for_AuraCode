public with sharing class ContactTriggerHandler {
    public static void countContacts(List<Contact> newList, List<Contact> oldList) {
        
    Set<Id> accountIds = new Set<Id>();
    
    if(newList != null) {
        for (Contact c : newList) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }
    }

    if(oldList != null) {
        for (Contact c : oldList) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }
    }

    List<Account> accountToRollUp = new List<Account>();

    for (Account acc : [SELECT Id, Name, Contact_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accountIds]){
        Account accObj = new Account ();
        accObj.Id = acc.Id;
        accObj.Contact_Count__c = acc.Contacts.size();
        accountToRollUp.add(accObj);
    }

    update accountToRollUp;
    }
}