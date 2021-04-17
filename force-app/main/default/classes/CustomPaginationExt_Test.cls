@isTest
private class CustomPaginationExt_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    tgen.TestData.selectededFields.put('Account',new Set<string>{'Id','Name','Industry','Controlling_Checkbox__c'});
    List<Account> account_Obj = (List<Account>)tgen.TestData.CreateDataList('Account', false, 03);
    Insert account_Obj;
    tgen.TestData.createdObjMap.put('Account',account_Obj[0].id);
    test.stopTest();
  }
   static testMethod void test_next_UseCase1(){
    List<Account> account_Obj  =  [SELECT Id,Name,Industry,Controlling_Checkbox__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    CustomPaginationExt obj01 = new CustomPaginationExt();
    obj01.accounts = account_Obj;
    obj01.accounts1 = new List<Account>();
    obj01.next();
  }
   static testMethod void test_previous_UseCase1(){
    List<Account> account_Obj  =  [SELECT Id,Name,Industry,Controlling_Checkbox__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    CustomPaginationExt obj01 = new CustomPaginationExt();
    obj01.accounts = account_Obj;
    obj01.accounts1 = new List<Account>();
    obj01.previous();
  }
   static testMethod void test_Last_UseCase1(){
    List<Account> account_Obj  =  [SELECT Id,Name,Industry,Controlling_Checkbox__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    CustomPaginationExt obj01 = new CustomPaginationExt();
    obj01.accounts = account_Obj;
    obj01.accounts1 = new List<Account>();
    obj01.Last();
  }
   static testMethod void test_First_UseCase1(){
    List<Account> account_Obj  =  [SELECT Id,Name,Industry,Controlling_Checkbox__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    CustomPaginationExt obj01 = new CustomPaginationExt();
    obj01.accounts = account_Obj;
    obj01.accounts1 = new List<Account>();
    obj01.First();
  }
}