trigger insertacccount on Account (before insert)
{
Account acc = new Account();
acc.Name = Trigger.new[0].name;
insert acc;
}