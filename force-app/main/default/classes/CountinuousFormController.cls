public class CountinuousFormController {

    public String name1{get;set;}
    public String name2{get;set;}
    public boolean next1{get;set;}
    Public String newValue{get;set;}
    
    public CountinuousFormController(){
        newValue='';
        next1=false;
    }
    
    public PageReference Next(){
        newValue=name1;
        next1=true;
        PageReference p=new PageReference('/apex/countinueForm1');
        p.setRedirect(true);
        return p;
    }
    
}