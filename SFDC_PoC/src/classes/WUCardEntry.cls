global class WUCardEntry{

@future(callout=true)
webservice static void insertData(String Name, String Firstname,integer cardnumber){
     WUCard__c WU=new WUCard__c();
     WU.WUCard_Name__c=Name;
     WU.WU__c=firstname;
     WU.Card_Number__c=cardnumber;
     insert WU;
     }
  }