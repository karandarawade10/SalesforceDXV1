public class LightiningApexController {

    @AuraEnabled
    Public static List<Contact> getContacts(List<ID> accountIDs){
        List<contact> contactList=[select id,Name,FirstName,LastName,AccountID,Phone,Email from Contact where accountID in:accountIDs];
        return contactList;
    }
    
    @AuraEnabled
    Public static void saveContacts(List<Contact> contactList){
        try{
             update contactList;
        }catch(Exception e){
            
        }
        
    }
    
     @AuraEnabled
    Public static void deleteContacts(List<Id> deleteContactIds){
      system.debug('IDS to delete'+deleteContactIds);
      List<Contact> contactToDelete=[select id from Contact where id in:deleteContactIds];
        try{
            delete contactToDelete;
        }
        catch(Exception e){
            
        }
        
    }
    
    @AuraEnabled
    Public static void createContactRecord(Contact contactObject){
       
        insert contactObject;
        
    }

}