@isTest
private class AccountOpportunityController_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    Opportunity opportunity_Obj = new Opportunity(IsPrivate = false, Name = 'Name830', StageName = 'Prospecting', CloseDate = Date.today());
    Insert opportunity_Obj; 
    Account account_Obj = new Account(Name = 'Name290', Controlling_Checkbox__c = false, chk1__c = false, chk2__c = false);
    Insert account_Obj; 
    test.stopTest();
  }
 /* static testMethod void test_getOpps_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    List<Account> account_Obj  =  [SELECT Name,Controlling_Checkbox__c,chk1__c,chk2__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountOpportunityController obj01 = new AccountOpportunityController();
    obj01.opportunityList = new List<AccountOpportunityController.OpportunityResponse>();
    obj01.getOpps();
  }*/

  /*  static testMethod void test_getOpps_UseCase2(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    List<Account> account_Obj  =  [SELECT Name,Controlling_Checkbox__c,chk1__c,chk2__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountOpportunityController obj01 = new AccountOpportunityController();
    obj01.opportunityList = new List<AccountOpportunityController.OpportunityResponse>();
    account_Obj[0].Name='Name668';
    account_Obj[0].Controlling_Checkbox__c=false;
    account_Obj[0].chk1__c=false;
    account_Obj[0].chk2__c=false;
    Update account_Obj[0];
    opportunity_Obj[0].IsPrivate=false;
    opportunity_Obj[0].Name='Name319';
    opportunity_Obj[0].StageName='Prospecting';
   // opportunity_Obj[0].CloseDate = 2018-03-13;
    Update opportunity_Obj[0];
    obj01.getOpps();
  }*/
  static testMethod void test_insertOpportunityList_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    List<Account> account_Obj  =  [SELECT Name,Controlling_Checkbox__c,chk1__c,chk2__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountOpportunityController obj01 = new AccountOpportunityController();
    obj01.opportunityList = new List<AccountOpportunityController.OpportunityResponse>();
   // obj01.insertOpportunityList(new List<OpportunityResponse>());
  }
 /* static testMethod void test_insertOpportunityList_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    List<Account> account_Obj  =  [SELECT Name,Controlling_Checkbox__c,chk1__c,chk2__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountOpportunityController obj01 = new AccountOpportunityController();
    obj01.opportunityList = new List<AccountOpportunityController.OpportunityResponse>();
    AccountOpportunityController.OpportunityResponse obj41 = new AccountOpportunityController.OpportunityResponse();
    obj41.amount = new Long();
    obj41.description = 'test data';
    obj41.expectedrevenue = new Long();
    obj41.forecastcategoryname = 'test data';
    obj41.id = 10;
    obj41.leadsource = 'test data';
    obj41.name = 'test data';
    obj41.nextstep = 'test data';
    obj41.probabliity = 10;
    obj41.quote = 10;
    obj41.stagename = 'test data';
    obj41.type = 'test data';
    obj41.insertOpportunityList();
  } */
}