global class specialaccounts{

    global class accountinfo{
        webservice string accountname;
        webservice integer accountnumber;
        }
        
    webservice static account createaccount(accountinfo info){
    account acc=new account();
    acc.name=info.accountname;
    acc.accountnumber=string.valueof(info.accountnumber);
    insert acc;
    return acc;
 }
 
    /* webservice static id[] createaccounts(account parent,account child,account grandchild){
     
     insert parent;
     child.parentid=parent.id;
     insert child;
     grandchild.parentid=child.id;
     insert grandchild;
     
     id[] results= new id[3];
     results[0]=parent.id;
     results[1]=child.id;
     results[2]=grandchild.id;
     return results;
     }*/
     
 }