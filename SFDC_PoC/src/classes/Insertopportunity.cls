public class Insertopportunity{

public opportunity opp{get;set;}

public insertopportunity(){
opp=new opportunity();

}
public pagereference save(){
opportunity oppty=new opportunity();
oppty.accountid=opp.accountid;
oppty.name=opp.name;
oppty.closedate=opp.closedate;
oppty.forecastcategoryname=opp.forecastcategoryname;
oppty.stagename=opp.stagename;
insert opp;
pagereference pref=new apexpages.standardcontroller(opp).view();
return pref;
}


}