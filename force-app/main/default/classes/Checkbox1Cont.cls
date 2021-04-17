public with sharing class Checkbox1Cont {

 Public List<wrapAll> wrapList=new List<wrapAll>();
 Public List<Account> selectedAccount=new List<Account>();
 Public Integer no=0;
 
public List<wrapAll> getAccount(){
  for(Account a : [select Id, Name, AccountNumber, Phone from Account ]){
     wrapList.add(new wrapAll(a,no+1));
     no++;
     }
  return wrapList;
} 

Public pagereference getSelectedRecord(){
 selectedAccount.clear();
 for(wrapAll wa:wrapList){
   if(wa.check == true){ 
     selectedAccount.add(wa.acc);    
   }
   
 }
return null;
}

Public List<Account> getfinalResult(){
  
  if(selectedAccount.size() > 0)
   return selectedAccount;
   else
   return null;
  
}


Public class wrapAll{
 Public Account acc{get;set;}
 Public Boolean check{get;set;}
 Public Integer srNo{get;set;}
 
 Public wrapAll(Account a1,Integer SN){
     acc=a1;
     check=false;
     srNo=SN;
 }

}


}