public class ErrorFinderController {
    public String failingPageResponse { get; set; }
    
    public void fetchFailingPage() {
       try {
           // Make a call to failing sites page here
           failingPageResponse = (new PageReference(Label.ErrorFinderURL)).getContent().toString();
       } catch (Exception e) {
           failingPageResponse = e.getTypeName() + ' : ' + e.getMessage() ;
       }       
    }   
}