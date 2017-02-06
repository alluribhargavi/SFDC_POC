trigger autooppty on Account (after insert) {

list<opportunity> newopp= new list<opportunity>();

for (Account acc:trigger.new){
    opportunity opp= new opportunity();
    opp.name=acc.name+ 'opportunity';
    opp.stagename='Prospecting';
    opp.closedate=date.today()+90;
    opp.accountid=acc.id;
    
  newopp.add(opp);
  }
  insert newopp;  

}