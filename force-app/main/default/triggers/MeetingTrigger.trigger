trigger MeetingTrigger on Meeting__c (before insert, before update) {
    MeetingLookupTriggerHandler.resolveLookup(Trigger.new);
}