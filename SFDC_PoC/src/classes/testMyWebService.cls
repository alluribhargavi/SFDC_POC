@isTest
private class testMyWebService
{
  
  
  static testMethod void testMyWebSvc()
  {
      SampleApexWebSvc.AccountInfo act = new SampleApexWebSvc.AccountInfo();
      act.AcctName = 'test';
      act.AcctNumber = 123;
      SampleApexWebSvc.createAccount( act );
      
      Account[] a = [select AccountNumber from Account where AccountNumber = '123'];
      System.assertEquals(a.size(), 1);
  }
}