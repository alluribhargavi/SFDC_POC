trigger shareaccount on Account (after insert,before update) {
 set <string> zips=new set<string>();
 
 if(trigger.isinsert){
     for (account a:trigger.new){
     zips.add(a.billingpostalcode);
     }
   }else  if(trigger.isupdate) {
        set<id> changedacc=new set<id>();
             for(account a:trigger.new){
             string oldzip=trigger.oldmap.get(a.id).billingpostalcode;
             string newzip=a.billingpostalcode;
                  if(oldzip!=newzip){
                  zips.add(newzip);
                  changedacc.add(a.id);
                  }
              }    
  list<accountshare> shares=[select id from accountshare where accountid in:changedacc and rowcause='Manual'];
  //delete shares; 
       } 

map<string,territory__c> terrmap=new map<string,territory__c>();
list<territory__c> terr=[select id,zip_code__c, (select id,user__c from territory_members__r) from territory__c where zip_code__c in :zips];

for(territory__c ter:terr){
terrmap.put(ter.zip_code__c,ter);
}

list<accountshare> shares =new list<accountshare>();

     for(account a:trigger.new){
         territory__c ter=terrmap.get(a.billingpostalcode);
        if(ter!=null){ 
         for(territory_members__c tm:ter.territory_members__r){
            if(tm.user__c!=a.ownerid){
                   accountshare ashare=new accountshare();
                   //ashare.accountid=a.id;
                  // ashare.userorgroupid=tm.user__c;
                   //ashare.accountaccesslevel='Edit';
                   //ashare.opportunityaccesslevel='Edit';
                   shares.add(ashare);
                   }
                }
             }          
        }    

//insert shares; 
}