public class RecordTransfer {

public user u ;
public string query;
public string test;
private ApexPages.StandardController controller {get; set;}

    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public String selectedObject { get; set; }
    
        public RecordTransfer(ApexPages.StandardController controller){

        this.controller = controller;
        this.u = (User)controller.getRecord();   
        getObjectNames();

        }
        
        public List<SelectOption> getObjectNames() {
            
            List<SelectOption> objNames = new List<SelectOption>();
            List<String> entities = new List<String>(schemaMap.keySet()); //List of SObjects
            entities.sort();
                for(String key : entities){
                    // Creating a key/name entry
                    Schema.SObjectType obj = schemaMap.get(key);
                    String objLabel = obj.getDescribe().getLabel();
                    String objName = obj.getDescribe().getName();

                    objNames.add(new SelectOption(objName, objLabel));
                }

            return objNames;
        }
        
        

        public pagereference TransferOfRecords(){
            test=u.From_User__c;
            query='select ownerId from '+selectedObject+' where ownerId=:'+'test';
            system.debug('from_user is   '+ u.From_User__c);
            List<sObject> records = recordsOwnedByUser(query);
            system.debug('query'+query);
            system.debug('recordsize inside transferofrecords'+ records.size());
            if(records.size()>0&&u.To_User__c!=null){
                changeOwnerShip(records);
            }
            else if (u.To_User__c==null){
                String message='User to whom records to be transfered should not be null';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,message));
            }
            else if (u.From_User__c==null){
                String message='User from whom records to be transfered should not be null';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,message));
            }
            else if(records.size()==0){
                 String message = 'No Records found with the selected Users';
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,message));
             }
            return null;
        }           
                
        public list<sObject> recordsOwnedByUser(String query){
            system.debug('inside recordsownedbyuser');
            List<sObject> newrecords=new list<sObject>();
            try{
                List<sObject> records=Database.query(query);
                
                for(sObject rec:records){
                system.debug('record id is '+rec.id);
                        if(rec.id!=null){
                        newrecords.add(rec);
                    }
                }
            }
            catch(exception e){
                String message= 'Objcet is not queriable';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,message));
            }  
            
            return newrecords;
        }      
                            
        
        public void changeOwnerShip(List<sObject> records){
             
             Schema.SObjectType sobjType = schemaMap.get(selectedObject);
             SObjectType objToken = Schema.getGlobalDescribe().get(selectedObject);
             DescribeSObjectResult objDef = objToken.getDescribe();
             Map<String, SObjectField> fields = objDef.fields.getMap();
             system.debug('inside changeofownership');
             List<sObject> sobList = new List<sObject>();
             List<sObject> sobListfin = new List<sObject>();             
             for(sObject s : records)
             {
              sobList.add(s);
             }
             
             for(sObject sob: sobList){
                 sob.put(fields.get('ownerid'),u.To_User__c);
                 sobListfin.add(sob);
             }
             if(u.From_User__c==u.To_User__c){
                 String message = 'Source and Destination Users should not be same';
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,message));
             }
             if(sobList.size()>0&&(u.From_User__c!=u.To_User__c)){
                 try{
                 update sobListfin;
                 String message='Total '+ sobList.size()+'records are transferred successfully';
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,message));
                 }
                 catch(DMLexception e){
                 String message= 'Objcet is not queriable';
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,message));                
                 }
             }
             if(sobList.size()==0){
                 String message = 'No Records found with the selected Users';
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,message));
             }
                         
        }    
        
        
}