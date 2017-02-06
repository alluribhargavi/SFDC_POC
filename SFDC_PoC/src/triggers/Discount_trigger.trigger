trigger Discount_trigger on Bha__c (before update) {

    bha__c [] bhargavi= trigger.new;
    
    myclass.applydiscount(bhargavi);
}