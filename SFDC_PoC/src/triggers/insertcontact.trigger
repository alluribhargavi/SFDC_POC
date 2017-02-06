trigger insertcontact on Account (after insert) {

   list<contact> newcon=new list<contact>();
   
   for(account acc:trigger.new){
   
    contact cont=new contact();
    cont.lastname=acc.name+'_Contact';
    cont.accountid=acc.id;
    newcon.add(cont);
}
insert newcon;
}