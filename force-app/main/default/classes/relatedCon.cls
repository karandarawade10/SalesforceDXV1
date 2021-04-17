public class relatedCon {
    
    public ID Id1 {get;set;}
    Public static String WebRes{get;set;}
    String testURL='http://apidev.accuweather.com/locations/v1/search?q=bangalore&apikey=hoArfRosT1215';
    public static string res{get;set;}
    Public static Boolean testB{get;set;}

    public relatedCon(ApexPages.StandardSetController controller) {
        //Id1=apexpages.currentpage().getparameters().get('id');
        
    }
    
    public void test1(){
        Id1=apexpages.currentpage().getparameters().get('id');
       // return null;
    }
    
   
    
    public static void webRes(){
        testB=true;
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'https://docsample.herokuapp.com/jsonSample';
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        HttpResponse response = httpProtocol.send(request);
        res=response.getBody();
        
      
     //   return res;
    }
    
    
    
}