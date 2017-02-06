global class apexshedule implements Schedulable{

global void execute(SchedulableContext  sc){

// batchclass b = new batchclass();
//database.execute(b);
sendmail();
}

public void sendmail(){

messaging.singleemailmessage mail=new messaging.singleemailmessage();
string[] toadress=new string[]{'abc@tcs.com'};
mail.setsubject('ajdfksfj');
mail.setplaintextbody('sagsdg');
mail.settoaddresses(toadress);
messaging.sendemail(new messaging.singleemailmessage[]{mail});

}
}