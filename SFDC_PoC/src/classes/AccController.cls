public class AccController {
public List<Account> acc{get;set;}
 public ApexPages.StandardController stdController { get; set; }
 public string paramvalue {get;set;}
 public integer totalRecs = 0;
public integer OffsetSize = 0;
public integer LimitSize= 100;

public string id;
 public Boolean refreshPage { get; set; }
    public AccController(ApexPages.StandardController controller) {
    stdController = controller;

        // initialize the refresh value as false 
        refreshPage = false;
    acc=[select id,name,ownerid from account];
    id=acc[0].id;

    } 

public PageReference method1(){

    pageReference newpage =new PageReference('/'+paramValue+'/e?parent_id='+paramValue+'&retURL='+paramValue);
    newpage.setRedirect(true);
    return newpage;

//https://ap2.salesforce.com/00128000005drdK/e?retURL=%2F00128000005drdK

//'/'+id+'/e?parent_id='+caseId+'&retURL='+caseId

  } 
  
  public AccController ()
{
totalRecs = [select count() from account];
}
public List<account> getacclist()
{
List<account> acc = Database.Query('SELECT Name, website, AnnualRevenue, description, Type FROM account LIMIT :LimitSize OFFSET :OffsetSize');
System.debug('Values are ' + acc);
return acc;
}

public PageReference save() {

    pageReference newpage=new PageReference('/'+paramvalue +'/e?parent_id='+paramvalue +'&retURL='+paramvalue );
    newpage.setRedirect(true);
    return newpage;
  
       /* PageReference pRef = stdController.save();

        if (pRef != null) {
         
            refreshPage = true;
        }

        return pRef;*/
  

}


public void FirstPage()
{
OffsetSize = 0;
}
public void previous()
{
OffsetSize = OffsetSize - LimitSize;
}public void next()
{
OffsetSize = OffsetSize + LimitSize;
}public void LastPage()
{
OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
}
public boolean getprev()
{
if(OffsetSize == 0)
return true;
else
return false;
}
public boolean getnxt()
{
if((OffsetSize + LimitSize) > totalRecs)
return true;
else
return false;
}

}