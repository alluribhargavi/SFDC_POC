@isTest
public class myclassTestClass {

    static testmethod void validatemyclass () {
     Bha__c b = new bha__c (Name ='Salesforce',price__c=100.00);
     system.debug('price before discount: ' +b.price__c);
     
     insert b;
     update b;
     
     b=[select name,price__c from bha__c where id=:b.id];
     system.debug('price after discount: ' + b.price__c);
     
     }
     
     
     }