@isTest
public with sharing class ContactTriggerHandlerTest {
    
    @IsTest
    static void countContactsTest() {
    
        Account objAccount = new Account(Name = 'Test');
        insert objAccount;
        
        Account objAccount1 = new Account(Name = 'Test 1');
        insert objAccount1;
        
        Test.startTest();
        Contact objContact = new Contact(LastName = 'Test Contact', AccountId = objAccount.Id);
        insert objContact;
        
        Contact objContact1 = new Contact(LastName = 'Test Contact 1', AccountId = objAccount.Id);
        insert objContact1;
        
        System.assertEquals(2, [SELECT Contact_Count__c FROM Account WHERE Id =: objAccount.Id].Contact_Count__c );
        
        objContact1.AccountId = objAccount1.Id;
        update objContact1;
        
        System.assertEquals(1, [SELECT Contact_Count__c FROM Account WHERE Id =: objAccount1.Id].Contact_Count__c );
        
        delete objContact1;
        
        System.assertEquals(0, [SELECT Contact_Count__c FROM Account WHERE Id =: objAccount1.Id].Contact_Count__c );
        Test.stopTest();    
    }   
}