@RestResource(urlMapping='/getContactFetchListFromAccount/*')
global class getContactFetchList {
     @Httpget
       global static list<responseWrapper> fetchContact(){
           List<Contact> conList=new List<Contact>();
           List<responseWrapper> resWrapList=new List<responseWrapper>();
           String accountId = RestContext.request.params.get('accountID');
           conList=[select id,LastName from Contact where accountId =:accountId];
           if(conList.size() >0 && conList !=null){
               For(Contact c:conList){
                  responseWrapper rw=new responseWrapper(c);
                   rw.result='success';
                   resWrapList.add(rw);
               }
               
           }else{
               Contact c=new Contact();
               responseWrapper rw=new responseWrapper(c);
               rw.result='No Record Found';
               resWrapList.add(rw);
           }
           
           system.debug('wrapper'+resWrapList);
           return resWrapList;
       }
    
    global class responseWrapper{
     
        String result='';
        Contact c;
        
        responseWrapper(Contact c1){
            c=c1;
        }
        
    }
}