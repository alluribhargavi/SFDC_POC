// Trigger to update the Attachment__c custom checkbox field in Custom Object if the attachment is deleted.
trigger DeleteIntimation on Attachment (before delete) {
   
     if(trigger.isdelete){

List<Bha__c> Pt = [select id,Attachment_Deleted__c   from Bha__c where id =: Trigger.Old[0].ParentId];         

If(pt.size()>0)         
{             
           
pt[0].Attachment_Deleted__c = True; 
    update pt;         

}
     }
}