public class relatedContacts {

    Public List<Contact> conList{get;set;}
    public relatedContacts(ApexPages.StandardController controller)
    {
       conList=new List<Contact>();
       Account account=(Account)controller.getrecord();
      conList = [select id,FirstName,LastName from Contact where accountId =:account.id];                       
    }
}