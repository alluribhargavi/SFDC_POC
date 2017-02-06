@isTest 

    public class recordTransfer_UT{    

        static testmethod void testRecordTransfer() {
             Account a = new Account();
                 a.name = 'Test Account';
                 a.ownerid='00528000000TpUU';
             insert a;
             system.debug('account name '+ a.name+' account owner' + a.ownerid);
             
             User u = new User(Lastname='B1',alias='a',email='b@tcs.com',username='z@tcs.com', CommunityNickname='nani',
                        Profileid='00e28000000IrZP',TimeZoneSidKey='America/Los_Angeles',LocaleSidKey='en_US',EmailEncodingKey='UTF-8',
                        LanguageLocaleKey='en_US',forecastenabled=true);
             insert u;
             u.from_user__c=a.ownerid;
             u.to_user__c='00528000001FUx2';
             update u;
             system.debug('user '+ u.id + 'from user '+u.from_user__c + 'to user '+ u.to_user__c);
             
             list<Account> ua = [SELECT Id,Name,ownerid FROM Account WHERE ownerid= :u.from_user__c];
                 ua[0].ownerid= u.to_user__c;
             update ua;

            
 
        }
}