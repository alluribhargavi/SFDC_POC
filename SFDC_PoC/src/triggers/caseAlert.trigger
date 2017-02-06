trigger caseAlert on Case (after update) {
    for(Case cs : Trigger.New)
        {
    // Instantiating a notification
    Messaging.PushNotification msg =new Messaging.PushNotification();
    
    //Android
    Map<String, Object> androidPayload = new Map<String, Object>();
    androidPayload.put('number', 1);
    androidPayload.put('name', 'test');
    
        // Adding the assembled payload to the notification
    msg.setPayload(androidPayload);
   
    // Getting recipient users
    String userId1 = cs.OwnerId;
    
   
    // Adding recipient users to list
    Set<String> users = new Set<String>();
    users.add(userId1);
  
    // Sending the notification to the specified app and users.
    // Here we specify the API name of the connected app.
    msg.send('Test_App', users);
    

}
}