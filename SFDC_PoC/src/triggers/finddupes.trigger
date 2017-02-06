trigger finddupes on Lead (before insert ,before update) {

for(lead mylead:trigger.new){
    if(mylead.email!=null){
            list<contact> dupes =[select id from contact where email=:mylead.email];
        if(dupes.size()>0)
            mylead.email=dupes[0].id;
            else
            mylead.email=null;
           }
         }
       
 
}