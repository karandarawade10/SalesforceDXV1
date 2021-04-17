global with sharing class AccountOpportunityController {
 
    public List<OpportunityResponse> opportunityList { get; set; }
 
    public AccountOpportunityController() {
       
    }

    public PageReference getOpps() {
      //  string endpt = Label.SupermanCavesAPI;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://superman-caves.herokuapp.com/opportunities?name=Wintheiser,%20Feil%20and%20Leffler');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        string body =res.getBody();
        System.debug('------>>>'+body);
        //opportunityList = parse(body);      
   
        insertOpportunityList(opportunityList);
               
        return null;
    }
    public void insertOpportunityList(List<OpportunityResponse> oppList){
        List<Opportunity> newOppList = new List<Opportunity>();
        Map<String,Id> accountNameVsIdMap = new Map<String,Id>();
        List<Account> accList = [Select Id, Name from Account limit 500];
       
        for(Account a: accList){
            accountNameVsIdMap.put(a.Name, a.Id);
        }
       
        Opportunity newopp;
        for(OpportunityResponse opp:oppList){
            newopp = new Opportunity();
            newopp.Amount = opp.amount;
            newopp.Name = opp.name;
            newopp.Probability = opp.probabliity;
            newopp.Quote__c = opp.quote;
            newopp.StageName = opp.stagename;
            newopp.NextStep = opp.nextstep;
            newopp.Type = opp.type;
            newopp.AccountId = accountNameVsIdMap.get(opp.name);
            newOppList.add(newopp);
        }
       
      insert (newOppList);
        
    }

        public class OpportunityResponse 
{   
        public Long amount;
        public String description;
        public Long expectedrevenue;
        public String forecastcategoryname;
        public Integer id;
        public String leadsource;
        public String name;
        public String nextstep;
        public Integer probabliity;
        public Integer quote;
        public String stagename;
        public String type;
        }
    
 
     
}