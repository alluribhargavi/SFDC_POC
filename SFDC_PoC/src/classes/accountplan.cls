global class accountplan{

webservice string area;
webservice string region;

global class plan{
webservice string name;
webservice integer plannumber;
webservice date planningperiod;
webservice id planid;
}

webservice static plan createaccountplan(plan vplan){
account acc=new account();
acc.name=vplan.name;
acc.accountnumber=string.valueof(vplan.plannumber);
insert acc;
vplan.planid=acc.id;
return vplan;
}

}