@RestResource(urlMapping='/getAccountOnExternalIdtofetchList/*')
   global with sharing class getAccounttofetchList {
     @Httpget
       global static list<Account> fetchAccount(){
      list<account> accList=new list<account>();
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
      
      accList=[Select id , name from Account limit 10];
      
        return accList;
      }
       
    

   }