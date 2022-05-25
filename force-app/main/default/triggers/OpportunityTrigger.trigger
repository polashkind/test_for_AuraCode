trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, after undelete) {

    if(trigger.isAfter) {
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete || trigger.isDelete) {
            OpportunityTriggerHandler.countOpportunities (trigger.New, trigger.Old);
        } 
    }

}