trigger SetOpportunityName on Opportunity (before insert,before update) {
for (Opportunity op: [select name,Account.Name, owner.firstname,closedate from Opportunity where Id in :Trigger.new]){
   // account acc= new account();
   // user us=new user();
   trigger.newmap.get(op.id).name= op.name+''+op.account.Name+' '+op.owner.firstname+' '+op.closedate;
     
    }
}