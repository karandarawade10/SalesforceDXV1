public class ApexRestCallout {
    
    Public Static String restRes{get;set;}
    Public Static Map<String,Object> restCll{get;set;}
    public ApexRestCallout(){
        makeGetCallout();
        
    }

    public static HttpResponse makeGetCallout() {
        restRes='\n';
        restCll=new Map<String,Object>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://jsonplaceholder.typicode.com/posts');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of posts.
            List<Object> posts = (List<Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'posts' key as a list
            System.debug('Received the following posts:');
            for (Object post: posts) {
				Map<String, Object> onePost = (Map<String, Object>)post;
				System.debug(onePost.get('id') +' : ' + onePost.get('userId') + ' : ' + onePost.get('title'));
				System.debug(onePost.get('body')); 
                restRes+='ID: => '+ onePost.get('id')  + ' User id=>  '+ onePost.get('userId') + '  Title=> ' +onePost.get('title')+'\n';
                restCll=(Map<String, Object>)post;
            }
        }
        return response;
    }

    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://jsonplaceholder.typicode.com/posts');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"title":"Test Test", "body":"Testy Testy", "userId":1000}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }        

}