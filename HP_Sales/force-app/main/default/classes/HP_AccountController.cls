public class HP_AccountController {
    public static list<account> getAllAccounts(){
        return [select id,name from account];
    }
}