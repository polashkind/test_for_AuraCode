trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    
    if(trigger.isAfter) {
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete || trigger.isDelete) {
            ContactTriggerHandler.countContacts (trigger.New, trigger.Old);
        } 
    }
}