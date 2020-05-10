@IsTest
public with sharing class MeetingLookupTriggerHandlerTest {
	@IsTest
	private static void shouldResolveLookup() {
		Account a = new Account(Name = 'TestAcct');
		insert new Meeting__c(Context_Id__c = a.Id);
	}
}
