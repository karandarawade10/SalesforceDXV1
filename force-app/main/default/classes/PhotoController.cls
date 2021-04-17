public class PhotoController {
    
    public String getData() {
        PageReference page = new PageReference('https://karan-dev-ed--c.ap7.content.force.com/profilephoto/7290I000000kP5V/F');
        Blob bodyBlob = page.getContent(); 
        system.debug('page data'+bodyBlob);
        
        string paramvalue = EncodingUtil.base64Encode(bodyBlob);
        
        system.debug('encode date'+paramvalue);
        
        return paramvalue;
  }

}