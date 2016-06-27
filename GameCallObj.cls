/**
@author LNazarenko
This class defines the fields and methods of the start game and visual page
*/

public class GameCallObj
{
    /** Winner - field that return name of the winners */
    public String  Winner {get;set;}
    /** warrior1 - gets first warrior */
    Unit__c warrior1;
    /** warrior1 - gets second warrior */
    Unit__c warrior2;
    /** New game */
    GameObj newGame;
    /** New warrior */
    Unit__c warriorNew;
    
    /** string value for search */
    public string searchstring {get;set;}  
    /** list the list of found units by SOQL */
    public List<Unit__c> unitsSOQL {get;set;}  
    /** list the list of found units by SOSL */
    public List<Unit__c> unitsSOSL {get;set;}  
    
    /** warrior1 - list warriors for the picklist1 */
    public List<Unit__c> warriors1{get;set;}
    /** warrior1 - list warriors for the picklist2 */
    public List<Unit__c> warriors2{get;set;}
    /** created options for the picklist1 */
    public list<SelectOption> pickList1 {get;set;}
    /** created options for the picklist2 */
    public list<SelectOption> pickList2 {get;set;}
    /** returned string with the name selected warrior from the picklist1 */
    public String selectedWar1 {get;set;}
    /** returned string with the name selected warrior from the picklist2 */
    public String selectedWar2 {get;set;}
    /** id current page */
    private String vid;
      
    /** 
    * The constructor calls the first list of warriors and creates the picklist1 
    */  
     public GameCallObj()
     {
        this.vid = ApexPages.currentPage().getParameters().get('id'); 
        getWarriors();
        pickList1 = new list<SelectOption>();
        SelectOption firstOption = new SelectOption('', ' - Select your favorite fighter' + ' -');
        pickList1.add(firstOption);
        for (Unit__c war : warriors1) 
        {
          this.pickList1.add(new SelectOption(war.Name,war.Name));
        }
     }
     
     /** 
     * The method returns the first of warriors
     * @return warrior1
     */
     public Unit__c getWarriorNew()
     {
        return warriorNew;
     }
     
      /** 
     * The method returns the first of warriors
     * @return warrior1
     */
     public Unit__c getWarrior1()
     {
       System.debug(warrior1);
       return warrior1;
     }
     
     /** 
     * The method returns the second of warriors
     * @return warrior2
     */
     public Unit__c getWarrior2()
     {
        System.debug(warrior2);
        return warrior2;
     }
     
     /** 
     * The method sets the first of warriors
     */
     public void setWarrior1(Unit__c war)
     {
       System.debug(warrior1);
       this.warrior1 = war;
     }
     
     /** 
     * The method sets the second of warriors
     */
     public void setWarrior2(Unit__c war)
     {
        System.debug(warrior2);
        this.warrior2 = war;
     }
     
     /** 
     * The method sets a new of warrior
     */
     public void setWarriorNew(Unit__c war)
     {
        this.warriorNew = war;
     }
     
     /** 
     * The method creates the first list of warriors
     * @return list of warriors where HP>0 or time was more than a day from the time when a warrior was killed
     */ 
     public List<Unit__c> getWarriors()
     {
       Datetime lastDay = Datetime.Now().addDays(-1);
       warriors1 = [select Id, Name,HP__c,dmgMin__c,dmgMax__c,isActive__c,TypeAttack__c,TypeBlock__c
                   from Unit__c Where (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0))];
       return warriors1;
     }
     
     /** 
     * The method shows fields of the first warrior and creates the second list of warriors and the picklist2 
     * and it depends which first warrior was selected
     * list of warriors where HP>0 or time was more than a day from the time when a warrior was killed
     */
     public void refreshFields()
     {
       System.debug(selectedWar1);
       if(selectedWar1<>null)
       {
         warrior1 = [select Id,Name,HP__c,dmgMin__c,dmgMax__c,isActive__c,TypeAttack__c,TypeBlock__c
                    from Unit__c Where Name =: selectedWar1];
          {        
            pickList2 = new list<SelectOption>();
          
            Datetime lastDay = Datetime.Now().addDays(-1);
            warriors2 = [select Id, Name,HP__c,dmgMin__c,dmgMax__c,isActive__c,TypeAttack__c,TypeBlock__c from Unit__c 
                         Where (name!=:selectedWar1 And (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0)))];
            SelectOption firstOption2 = new SelectOption('', ' - Select your favorite fighter' + ' -');
            pickList2.add(firstOption2);
            for (Unit__c war : warriors2) 
            {
              this.pickList2.add(new SelectOption(war.Name,war.Name));
            }
          }
       }
     }
    
     /** 
     * The method shows fields of the second warrior
     */
     public void refreshFields2()
     {
       System.debug(selectedWar2);
       if(selectedWar2<>null)
       {
          warrior2 = [select Id,Name,HP__c,dmgMin__c,dmgMax__c,isActive__c,TypeAttack__c,TypeBlock__c
                     from Unit__c Where Name =: selectedWar2];
       }
    }
     
    /** 
    * The method returns name of the winner 
    * @return string value of the winner's name in the case when all field are filled or error message 'Input please all fields' otherwise
    */    
    public void ownStart()
    {
        newGame  = new GameObj();
        Winner   = newGame.Fight(warrior1,warrior2);
        System.Debug(Winner);
    }
    
    /** 
    * The method creates a new warior
    * @return page for edit the new warior
    */ 
    public PageReference ownCreate()
    {
        warriorNew   = new Unit__c();
        PageReference page = new Pagereference('/apex/CreateWarNew?Id='+vid);
        page.setRedirect(false);
        return page;
    }
    
    /** 
    * The method saves a new warior
    * @return start page
    */
    public PageReference ownSaveWarNewPage() 
    {   
      try
      {
        insert warriorNew;
      }
      catch(exception e){}
      PageReference page = new Pagereference('/apex/GameObj?Id='+vid);
      page.setRedirect(false);
      return page;
    }
    
    /** 
    * The method edites the warior 1
    * @return page for edit the warior 1
    */
    public PageReference ownEditWar1Page()
    {  
        PageReference page = new Pagereference('/apex/EditPageWar1?Id='+vid);
        page.setRedirect(false);
        return page;
    }
    
    /** 
    * The method edites the warior 2
    * @return page for edit the warior 2
    */
    public PageReference ownEditWar2Page()
    {  
        PageReference page = new Pagereference('/apex/EditPageWar2?Id='+vid);
        page.setRedirect(false);
        return page;
    }
  
    /** 
    * The method saves edited warrior 1
    * @return start page
    */
    public PageReference ownSaveWar1Page() 
    {   
      try
      {
        update warrior1;
      }
      catch(exception e){}
      PageReference page = new Pagereference('/apex/GameObj?Id='+vid);
      page.setRedirect(false);
      return page;
    }
    
    /** 
    * The method saves edited warrior 2
    * @return start page
    */
    public PageReference ownSaveWar2Page() 
    {   
      try
      {
        update warrior2;
      }
      catch(exception e){}
      PageReference page = new Pagereference('/apex/GameObj?Id='+vid);
      page.setRedirect(false);
      return page;
    }
     
    /** 
    * The method cancels edited or saved warriors 
    * @return start page
    */ 
    public Pagereference ownCancel()
    {
      PageReference newpage = new Pagereference('/apex/GameObj?Id='+vid);
      newpage.setRedirect(false);
      return newpage;
    }  
    
    /** 
    *  Calls SOQL and SOSL methods search warriors by input string
    */
    public void search() 
    {  
       searchSOQL();
       searchSOSL();
    } 
    
    /** 
    *  Calls SOQL method searches warriors by input string
    */
    public void searchSOQL() 
    {  
       unitsSOQL = [select name,id from Unit__c where name =: searchstring];
    }
    
    /** '
    *  Calls SOSL method searches warriors by input string
    */
    public void searchSOSL() 
    {  
       unitsSOSL = (List<Unit__c>)([FIND :searchstring IN ALL Fields RETURNING Unit__c(name,id)][0]);  
    }
    
    /** 
    * The method clears search results
    */
    public void clear()
    {  
       unitsSOQL.clear();  
       unitsSOSL.clear();
    }  
    
}
