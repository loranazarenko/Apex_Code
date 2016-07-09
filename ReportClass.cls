/**
*@author LNazarenko
* This class - custom Controller defines of the behaviour of checkboxes and the processes button on the visual page
*/
public with sharing class ReportClass
{
    /** List of the Accounts */
    public List<Account>accs{get; set;}
   /** List of the wrapper's files */
    public List<Wrapper> accounts{get; set;}
   /** Wrapper's class object */ 
    Wrapper wrap;
   /** Text that would return after press the button Process */ 
    public String myResults{get; set;}
    
    /**
    * Constructor of the class ReportClass, it calls method getAccounts()
    */
    public ReportClass()
    {  
	 getAccounts();
    }
    
    /**
    * Method getAccounts() wraps accounts through special class Wrapper with checkboxes 
    * @return list of the wrapped accounts
    */
    public List<Wrapper> getAccounts()
    {
      accounts = new List<Wrapper>();
      accs     = new List<Account>([Select Id,Name from Account Order by Name ASC]);
      for(Account accc : accs)
      {
        wrap          = new Wrapper();
        wrap.checkbox = false;
        wrap.acc      = accc;
        accounts.add(wrap);
      }
      return accounts;
    }
    
    /**
    * Method processWrapps() creates string with names of the checked accounts 
    */
    public void processWrapps()
    {
      myResults = 'Next Wraps were selected: ';
      for(Wrapper item : accounts)
      {
       if(item.checkbox)
       {
         myResults += item.acc.Name+', ';
       }
      }
    }
    
    /** 
    * Wrapper class - class that helps to add to the page checkboxes
    */
    public class Wrapper
    {
      public boolean checkbox{get;set;}
      public Account acc{get;set;}
    }
 }
