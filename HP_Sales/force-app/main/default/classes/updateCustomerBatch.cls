global class updateCustomerBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {         
        String query = 'SELECT Id, Name,CreatedDate,test_date__c FROM Customer__c';
        return Database.getQueryLocator(query);
    }   
    global void execute(Database.BatchableContext BC, List<Customer__c> custList) {
        system.debug('===>');
        list<customer__c> updList = new list<customer__c>();
        for(Customer__c cust : custList) {   
            Integer NDays = (Date.valueOf(cust.test_date__c)).daysBetween(system.today());
            system.debug('NDays===>'+NDays);
            if((Date.valueOf(cust.test_date__c)).daysBetween(system.today()) >= 1){
                cust.Phase1__c = false;
                cust.Phase2__c = false;
                cust.Phase3__c = false;
                //updList.add(cust);
            }
            else if((Date.valueOf(cust.test_date__c)).daysBetween(system.today()) >= 2){
                cust.Phase1__c = false;
                cust.Phase2__c = false;
                cust.Phase3__c = false;
                //updList.add(cust);
            }
            else if((Date.valueOf(cust.test_date__c)).daysBetween(system.today()) >= 3){
                cust.Phase1__c = false;
                cust.Phase2__c = false;
                cust.Phase3__c = false;
                //updList.add(cust);
            }
        }
        if(custList.size()>0) update custList;
    }  
    global void finish(Database.BatchableContext BC) {
        AsyncApexJob[] apxAsyJb = [SELECT Id, NumberOfErrors FROM AsyncApexJob WHERE Id = :bc.getJobId()];       
        if (apxAsyJb[0].NumberOfErrors > 0) system.debug('Error===>'+apxAsyJb);
    }
}