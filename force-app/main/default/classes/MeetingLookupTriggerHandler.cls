public without sharing class MeetingLookupTriggerHandler {

	public static void resolveLookup(List<SObject> objs) {
		List<Meeting__c> meetings = (List<Meeting__c>)objs;
		Map<SObjectType, SObjectField> refFields = getMeetingReferenceFields();	
		for (Meeting__c meeting : meetings) {
			if (meeting.Context_Id__c != null && meeting.Context_Id__c instanceof Id) {
				SObjectType sType = ((Id) meeting.Context_Id__c).getSObjectType();
				SObjectField field = refFields.get(sType);
				if (field != null) {
					meeting.put(field, meeting.Context_Id__c);
				}
			}
		}
	}

	private static Map<SObjectType, SObjectField> getMeetingReferenceFields() {
		Map<SObjectType, SObjectField> refFields = new Map<SObjectType, SObjectField>();
		for (SObjectField field : MEETING_FIELDS) {
			DescribeFieldResult dfr = field.getDescribe();
			if (dfr.getType() == Schema.DisplayType.REFERENCE && !dfr.getReferenceTo().isEmpty()) {
				refFields.put(dfr.getReferenceTo()[0], field);
			}
		}
		return refFields;

	}

	private static List<SObjectField> MEETING_FIELDS = 
		SObjectType.Meeting__c.fields.getMap().values();
}