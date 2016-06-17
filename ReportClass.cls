public with sharing class ReportClass
{
   public list<Account>accs{get; set;}
   public list<Wrapper> accounts{get; set;}
    Wrapper wrap;
    public String myResults{get; set;}
    
    public ReportClass()
    {  getAccounts(); }
    
    public list<Wrapper> getAccounts()
    {
    accs=new list<Account>();
    accounts=new list<Wrapper>();
    accs=[Select Id,Name from Account];
    for(Account accc : accs)
    {
        wrap          = new Wrapper();
        wrap.checkbox = false;
        wrap.acc      = accc;
        accounts.add(wrap);
    }
    return accounts;
    }
    
   public void processWrapps()
    {
        myResults = 'Next Wraps were selected: ';
        for(Wrapper item:accounts)
        {
            if(item.checkbox)
            {
                myResults += item.acc.Name+', ';
            }
        }
    }
    
    /** wrapper class */
    public class Wrapper
    {
    public boolean checkbox{get;set;}
    public Account acc{get;set;}
    }

 }