@isTest
public with sharing class OpportunityTriggerHandlerTest {
    
    @IsTest
    static void countOpportunitiesTest() {
    
        Account objAccount = new Account(Name = 'Test');
        insert objAccount;
        
        Account objAccount1 = new Account(Name = 'Test 1');
        insert objAccount1;
        
        Test.startTest();
        Opportunity objOpportunity = new Opportunity(Name = 'Test Opp 1', CloseDate = Date.newInstance(2032,11,20), StageName = 'Prospecting', AccountId = objAccount.Id);
        insert objOpportunity;
        
        Opportunity objOpportunity1 = new Opportunity(Name = 'Test Opp 2', CloseDate = Date.newInstance(2032,11,20), StageName = 'Prospecting', AccountId = objAccount.Id);
        insert objOpportunity1;
        
        System.assertEquals(2, [SELECT Opportunity_Count__c FROM Account WHERE Id =: objAccount.Id].Opportunity_Count__c );
        
        objOpportunity1.AccountId = objAccount1.Id;
        update objOpportunity1;
        
        System.assertEquals(1, [SELECT Opportunity_Count__c FROM Account WHERE Id =: objAccount1.Id].Opportunity_Count__c );
        
        delete objOpportunity1;
        
        System.assertEquals(0, [SELECT Opportunity_Count__c FROM Account WHERE Id =: objAccount1.Id].Opportunity_Count__c );
        Test.stopTest();    
    }   
}