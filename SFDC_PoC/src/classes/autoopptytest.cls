@isTest

private class autoopptytest{

    static testmethod void validateautooppty(){
    
        account acc=new account(name='alluri');
        insert acc;
        opportunity opp= new opportunity(name='WER',stagename='Prospecting',closedate=date.today()+90,accountid=acc.id);
//        insert acc;
        insert opp;
        }
 }