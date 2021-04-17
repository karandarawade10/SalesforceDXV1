public class NewAndExistingController {
public Account account { get; private set; }
public NewAndExistingController() {
Id id = ApexPages.currentPage().getParameters().get('id');
account = (id == null) ? new Account() :
[SELECT Name, Phone, Industry,ownerID,SLAExpirationDate__c FROM Account WHERE Id = :id];
}
public PageReference save() {
try {
update(account);
sendMail();
return null;
} catch(System.DMLException e) {
ApexPages.addMessages(e);
return null;
}
// After successful Save, navigate to the default view page
//PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
//return (redirectSuccess);
}

 public void sendMail(){
  List<String> add=new List<String>{'karandarawade10@gmail.com'};
  Messaging.SingleEmailMessage em=new Messaging.SingleEmailMessage();
  
  em.setSubject('Test');
  em.setPlainTextBody('Email Plain Text Body');
  em.setToAddresses(add);
  
  Messaging.SendEmailResult[] er=Messaging.sendEmail(new Messaging.SingleEmailMessage[] {em});
  
 }
}