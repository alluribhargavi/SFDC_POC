@isTest

public class specialaccountstest{

    testmethod static void createaccounttest(){
    
    specialaccounts.accountinfo info=new specialaccounts.accountinfo();
    info.accountname='sfg';
    info.accountnumber=1245;
    account acc=specialaccounts.createaccount(info);
    system.assert(acc!=null);
   
        
    /*account parent=new account(name='sfg');
    insert parent;
    account child= new account(name='sgsdg');
    insert child;
    account grandchild= new account(name='dfh');
    insert grandchild;*/
    }
    }