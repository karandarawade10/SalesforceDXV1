global class TestBatch implements Database.Batchable<sObject>{
 global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     for(sobject s : scope){
     s.put(Field,Value); 
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   }

}