public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Industry, Contact_Count__c, Opportunity_Count__c
            FROM Account];
    }
}