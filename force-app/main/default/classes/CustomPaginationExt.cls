public with sharing class CustomPaginationExt {

    public List<Account> accounts{get;set;}
    public List<Account> accounts1;
    public string msg{get;set;}
    public Integer pageSize = 10;
    public Integer pageNumber = 0;
    public Integer total=0;
    private String baseQuery = 'SELECT name, industry FROM Account ORDER BY name';
    public Integer totalpageNumber=0;
    
    public CustomPaginationExt(){
   //  if(pageNumber==0)
       accounts=new List<Account>([SELECT name, industry FROM Account ORDER BY name Limit 10 offset 0]);
       String query1 = baseQuery;
        accounts1 = Database.query(query1);
            total=accounts1.size();
            totalpageNumber=total/pageSize;
    }
    public PageReference next(){
       if(pageNumber<totalpageNumber)
        pageNumber++;
        
        msg=total+''+totalpageNumber+''+pageNumber+'';
        if(pageNumber>totalpageNumber){
           return null;
        }
        queryAccounts();
        return null;
    }

    public PageReference previous(){
      if(pageNumber>0)
        pageNumber--;
        
        if (pageNumber < 0)
            return null;
        queryAccounts();
        return null;
    }
    
    public PageReference Last(){
        pageNumber=total/pageSize;
        queryAccounts();
        return null;
    }
    
     public PageReference First(){
        pageNumber=0;
        queryAccounts();
        return null;
    }

    private void queryAccounts()
    {
        Integer offset = pageNumber * pageSize;
        String query = baseQuery + ' LIMIT '+pageSize +' OFFSET '+ offset;
        //String query1 = baseQuery;
        try{
            accounts = Database.query(query);
           
        }
        catch(Exception e){
            msg=e.getMessage();
            ApexPages.addMessages(e);
        }
    }
    
}