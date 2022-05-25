public with sharing class OpportunityTriggerHandler {
    public static void countOpportunities(List<Opportunity> newList, List<Opportunity> oldList) {
        
    Set<Id> accountIds = new Set<Id>();
    
    if(newList != null) {
        for (Opportunity op : newList) {
            if (op.AccountId != null) {
                accountIds.add(op.AccountId);
            }
        }
    }

    if(oldList != null) {
        for (Opportunity op : oldList) {
            if (op.AccountId != null) {
                accountIds.add(op.AccountId);
            }
        }
    }

    List<Account> accountToRollUp = new List<Account>();

    for (Account acc : [SELECT Id, Name, Opportunity_Count__c, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN: accountIds]){
        Account accObj = new Account ();
        accObj.Id = acc.Id;
        accObj.Opportunity_Count__c = acc.Opportunities.size();
        accountToRollUp.add(accObj);
    }

    update accountToRollUp;        
    }
}