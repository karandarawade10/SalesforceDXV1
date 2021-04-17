public class ObjectInfoController {

     Public Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
     Public List<String> allObj {get;set;}
     Public Set<string> allobjset=new set<String>();
     public String selectedObjValue{get;set;}
     List<SelectOption> myStud{get;set;}
     public String selectedObjValuedis{get;set;}
     public List<String> objlabel{get;set;}
     public List<String> selectedMulObjValue{get;set;}
     public List<String> selectedMulObjValue1{get;set;}
     public Boolean show{get;set;}
     //List<SelectOption> Smulop{get;set;}
     List<SelectOption> mulop;
     public static List<SelectOption> Smulop= new List<SelectOption>();

    public ObjectInfoController(){
        selectedMulObjValue=new List<String>();
        allobjset=gd.keySet();
        allObj=new List<String>();
        allObj.addAll(allobjset);
        show=false;
        objlabel=new List<String>();
        objlabel.add('---None---');
    }
    
  public list<SelectOption> getStudOption(){
    List<SelectOption> myStud= new List<SelectOption>();
    for(String s : allObj){
    myStud.add(new SelectOption(s,s));
    }
    return myStud;
}
    public void selectedval(){
        objlabel.clear();
        selectedObjValuedis=selectedObjValue;
        Map <String, Schema.SObjectField> fieldMap = gd.get(selectedObjValuedis).getDescribe().fields.getMap();
       
        for(Schema.SObjectField sfield : fieldMap.Values())
        {
            schema.describefieldresult dfield = sfield.getDescribe();
            
            objlabel.add(dfield.getLabel());
        }
          system.debug('label12 ::'+objlabel.size()+' ==>'+objlabel);
          show=true;
           
    }
         
    public list<SelectOption> getMulOption(){
     mulop= new List<SelectOption>();
        if(selectedMulObjValue.size()==0)  {
       if(objlabel.size()>0){
   		    for(String s : objlabel){
  		  mulop.add(new SelectOption(s,s));
      }
     //   objlabel.clear();
    } 
        }  
        else{
            For(String s:selectedMulObjValue){
                for(String s1 : objlabel){
                    if(!s.equals(s1)){
                        mulop.add(new SelectOption(s1,s1));
                    }
                }
            }
        }
   
    system.debug('mulop==>'+mulop);
    
    return mulop;
    }   
    
    public void selectedMultipleOptions(){
        system.debug('Inside <'+selectedMulObjValue);
       
       selectedMulObjValue1=new List<String> ();
       
        system.debug('selected value==>'+selectedMulObjValue);
    }

    public list<SelectOption> getSelMulOption(){
    //Smulop= new List<SelectOption>();
    if(selectedMulObjValue.size()>0){
    for(String s : selectedMulObjValue){
    Smulop.add(new SelectOption(s,s));
     }
    }
   return Smulop;
    }  
         
}