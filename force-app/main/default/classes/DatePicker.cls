public class DatePicker 
{
    public String datename {get;set;}
    public List<WrapperClass> wrapper{get;set;}
    
    public DatePicker(){
     system.debug('Input Date'+datename);
       wrapper=new List<WrapperClass>();
        List<Account> acc=new List<Account>([select id,name from Account limit 5]);
        system.debug('size --> '+acc.size());
       For(Account a:acc){
            wrapper.add(new WrapperClass(a));
        }
        
     }
    
     Public PageReference sendDate(){
         system.debug('Input Date'+datename);
        For(WrapperClass w:wrapper){
            system.debug('Account-->'+w.acc.name+' date-->'+w.dueDate);
        }
        system.debug('Input Date1'+datename);
         PageReference pageRef = new PageReference('https://ap7.salesforce.com/006');
         return pageRef;
    }
   
   
    
    public class WrapperClass{
        public Account acc{get;set;}
         public String dueDate{get;set;}
        
        public WrapperClass(Account acc1){
            acc=acc1;
            dueDate='00/00/0000';
        }
        
    }

}