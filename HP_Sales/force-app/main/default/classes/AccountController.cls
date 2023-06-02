public class AccountController { 
    public static list<AccDataWrapper> getAllAccounts(){
    	list<account> accList = [select id,name,(select id,name from contacts),(select id from cases) from account];
        list<AccDataWrapper> accWrapList = new list<AccDataWrapper>();
        for(account acc:accList){
            accWrapList.add(new AccDataWrapper(acc.Id,acc.Name,acc.contacts,acc.cases));
        }
        system.debug('accWrapList===>'+accWrapList);
        return accWrapList;
    }
    
    class AccDataWrapper{
        public id accId {get;set;}
        public string accName {get;set;}
        public list<contact> conList {get;set;}
        public list<case> caseList {get;set;}
        
        public AccDataWrapper(id acId,string acName,list<contact> cList,list<case> csList){
            this.accId = acId;
            this.accName = acName;
            this.conList=cList;
            this.caseList=csList;
        }
    }
}