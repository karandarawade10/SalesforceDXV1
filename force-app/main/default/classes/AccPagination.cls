public with sharing class AccPagination {

    public AccPagination() {
      acc = [SELECT Name, AccountNumber FROM Account];
      
    }
     public List<Account> acc {get;set;}
     public List<Account> delAcc=new List<Account>();
     
    public PageReference deleteAccount(){
    delAcc=[select name,AccountNumber from Account where name='sForce'];
    delete delAcc;
    acc = [SELECT Name, AccountNumber FROM Account]; 
     return null;
    }
}