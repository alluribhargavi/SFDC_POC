trigger allowforcastcheck on User (before insert) {

    for(user us:trigger.new){
    us.managerid='00528000000TpUU';
    
}
}