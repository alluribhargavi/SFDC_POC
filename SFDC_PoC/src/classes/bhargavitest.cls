@Restresource(urlmapping='/Bhargavi/')

global class bhargavitest{

@HttpPOST
 global static void insertbhargavi(){
RestRequest req = RestContext.request;
RestResponse res=RestContext.response;
        Blob body=req.requestBody;
        String jsonToParse=body.toString();  
        
         system.debug('***'+jsonToParse); 
         
         list<bhargavi__c> bh=new list<bhargavi__c>();
         
         for(bhargavi__c bha:bh){
         bhargavi__c ba=new bhargavi__c();
         ba.name=bha.name;
         bh.add(ba);
         }
         insert bh;
     
         
         
}
  
  }