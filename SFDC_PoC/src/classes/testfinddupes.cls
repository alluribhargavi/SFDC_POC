@isTest

public class testfinddupes{

    static testmethod void validatefinddupesclass() {
    
     
    contact con=new contact();
    con.lastname='ABC';
    con.Email='pranav@tcs.com';
    insert con;
    
     lead l1= new lead();
    l1.firstname='abc';
    l1.lastname='dp';
    l1.email='pranav@tcs.com';
    l1.company='Tcs';
    
       
    try {
       insert l1;
       } catch (exception e) {
           system.debug('An error occured');
           }
       
     list<lead> dupes =[select id from lead where email='pranav@tcs.com'];
     system.assertEquals(0, dupes.size());
     
     
     lead l2=new lead();
     l2.firstname='sfg';
     l2.lastname='sf';
     l2.email='dp@tcs.com';
     l2.company='tcs';
     insert l2;
     
     list<lead> dupes1=[select id from lead where email='as@tcs.com'];
     
  
    system.assertequals(0, dupes1.size());
 }
 }