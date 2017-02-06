@isTest

public class insertcontacttest {

static testmethod void validateinsertcontacttest(){
    
    account acc=new account(name='ABC');
    contact cont=new contact(lastname='alluri');
    insert acc;
    insert cont;
    }
    }