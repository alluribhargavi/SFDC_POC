public Class CreatingAccount
{
public Account  createAccount(string name)  //method to create account
{
Account acc = new Account();
acc.Name = name;
return acc;
}
}