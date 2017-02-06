global class SampleApexWebSvc {
    global class AccountInfo {
        WebService String AcctName;
        WebService Integer AcctNumber;
    }
    
    WebService static Account createAccount(AccountInfo info) {
        Account acct = new Account();
        acct.Name = info.AcctName;
        acct.AccountNumber = String.valueOf(info.AcctNumber);
        insert acct;
        return acct;
    }
}