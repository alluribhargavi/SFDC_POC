@isTest

private class allowforcastcheckTest {

    static testmethod void testallowforecast() {
    
    user us= new user (Lastname='B1',
                        alias='a',email='b@tcs.com',username='z@tcs.com', CommunityNickname='nani',
                        Profileid='00e28000000IrZP',TimeZoneSidKey='America/Los_Angeles',
                        LocaleSidKey='en_US',EmailEncodingKey='UTF-8',
                        LanguageLocaleKey='en_US',
                        forecastenabled=true);
    insert us;
    }
    }