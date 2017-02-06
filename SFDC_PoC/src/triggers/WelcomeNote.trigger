trigger WelcomeNote on Contact (after insert) {

list <messaging.singleemailmessage> mails= new list<messaging.singleemailmessage>();

for(contact con:trigger.new){
    if(con.email!=null && con.firstname!=null){
    messaging.singleemailmessage mail=new messaging.singleemailmessage();
    
   list<string> sendto=new list<string>();
   sendto.add(con.email);
   mail.settoaddresses(sendto);
   
   mail.setreplyto('abc@tcs.com');
   mail.setsenderdisplayname('Bhargavi');
   
   mail.setsubject('Welcome Note');
   string body='hi'+con.firstname+'Welcome to Salesforce' ;
   
   mails.add(mail);
   }
  } 

messaging.sendemail(mails);
}