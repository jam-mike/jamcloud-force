public with sharing class CreateMeeting {

    public CreateMeeting(ApexPages.StandardController ctrl) {}
    public CreateMeeting(){}


    public String getCreateMeeting() {
        String endpoint = [SELECT DeveloperName,Endpoint FROM NamedCredential WHERE DeveloperName = 'JamCloud'][0].Endpoint;
        endpoint += endpointPath + String.valueOf(Math.random() * 100000).substringAfter('.');
        endpoint += '&sf=' + URL.getSalesforceBaseUrl().toExternalForm();
        return endpoint;
    }
    private static final String endpointPath = '/middleman?meetingID=';
}