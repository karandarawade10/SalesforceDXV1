@RestResource(urlMapping='/getUserPhoto/*')
global class sendUserPhoto {
    
    @Httpget
    global static String sendUserPhoto(){
        PageReference page = new PageReference('https://karan-dev-ed--c.ap7.content.force.com/profilephoto/7290I000000kP5V/F');
        Blob bodyBlob = page.getContent(); // callout
        
        system.debug('page data'+bodyBlob);
        
        string paramvalue = EncodingUtil.base64Encode(bodyBlob); 
        
        system.debug('encode date'+paramvalue);
        
        return paramvalue;
        
    }

}