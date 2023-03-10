public with sharing class testsigninController {
        
    public String  strUsername      {get;set;} //To get the user name from login page
    public String  strPassword      {get;set;} //To get the password from login page
    
    String strRetURL = '';
    String jobId = '';
    
    //Constructor
    public testsigninController () 
    {
        if(ApexPages.currentPage().getParameters().containsKey('jobId') && ApexPages.currentPage().getParameters().get('jobId') !='')
            jobId = ApexPages.currentPage().getParameters().get('jobId');
    }
    
    //If the user logged in community and trying to open signin page, it will redirect to home page
    public Pagereference redirectAuthenticatedUser()
    {
        if(Userinfo.getUserType() == 'CspLitePortal' || Userinfo.getUserType() == 'PowerCustomerSuccess')
        {
            return new Pagereference('/Home_v2');
        }
        return null;
    }
    
    //To check the Username and Password for login to community
    public pageReference login() 
    {
        String startUrl = ApexPages.currentPage().getParameters().containsKey('startURL') ? ApexPages.currentPage().getParameters().get('startURL') : '/Home_v2';
        System.debug('startUrl0-->'+startUrl);
        String returnPath = String.isBlank(jobId) ? startUrl  : '/JobDetail?apply=1&Id='+jobId;
        System.debug('returnPath-->'+returnPath);
        return Site.login(strUsername, strPassword, returnPath);
    }
    

}