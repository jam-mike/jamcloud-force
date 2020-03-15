@RestResource(urlMapping='/meeting/log')
global with sharing class TestRest {

    @HttpPost
    global static void doPost(String name) {
        Account account = new Account();
        account.Name = name;
        insert account;
    }
}