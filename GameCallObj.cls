/**
@author LNazarenko
This class defines the fields and methods of the start game and visual page
*/

public class GameCallObj
{
    /** Warrior 1 shows information about warrior 1 */
    public String  inputName1 {get;set;}
    public Integer inputHP1 {get;set;}
    public Integer inputDmgMin1 {get;set;}
    public Integer inputDmgMax1 {get;set;}
    
    /** Warrior 2 shows information about warrior 2 */
    public String inputName2 {get;set;}
    public Integer inputHP2 {get;set;}
    public Integer inputDmgMin2 {get;set;}
    public Integer inputDmgMax2 {get;set;}
   
   /** Winner - field that return name of the winners */
    public String  Winner {get;set;}
    /** warrior1 - gets first warrior */
    Unit__c warrior1;
    /** warrior1 - gets second warrior */
    Unit__c warrior2;
    /** warrior1 - creates new game */
    GameObj newGame;
    
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
  
    /** 
    * The constructor calls the first list of warriors and creates the picklist1 
    */  
     public GameCallObj()
     {
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
     * The method creates the first list of warriors
     * @return list of warriors where HP>0 or time was more than a day from the time when a warrior was killed
     */ 
     public List<Unit__c> getWarriors()
     {
       Datetime lastDay = Datetime.Now().addDays(-1);
       warriors1 = [select Id, Name from Unit__c Where (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0))];
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
         warrior1 = [select Id,Name,HP__c,dmgMin__c,dmgMax__c from Unit__c Where Name =: selectedWar1];
         inputName1    = warrior1.name;
         inputHP1      = (integer)warrior1.HP__c;
         inputDmgMin1  = (integer)warrior1.dmgMin__c;
         inputDmgMax1  = (integer)warrior1.dmgMax__c;
       
         {        
          pickList2 = new list<SelectOption>();
          
          Datetime lastDay = Datetime.Now().addDays(-1);
          warriors2 = [select Id, Name from Unit__c Where (name!=:selectedWar1 And (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0)))];
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
        warrior2 = [select Id,Name,HP__c,dmgMin__c,dmgMax__c from Unit__c Where Name =: selectedWar2];
        inputName2    = warrior2.name;
        inputHP2      = (integer)warrior2.HP__c;
        inputDmgMin2  = (integer)warrior2.dmgMin__c;
        inputDmgMax2  = (integer)warrior2.dmgMax__c;
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
    public PageReference ownSave()
    {
        Unit__c warriorNew   = new Unit__c();
        insert warriorNew;
        PageReference unPage = new ApexPages.StandardController(warriorNew).edit();
        unPage.setRedirect(true);
        return unPage;
    }
    
    /** 
    * The method edites the warior 1
    * @return page for edit the warior 1
    */
    public PageReference ownEditWar1()
    {
        PageReference unPage = new ApexPages.StandardController(warrior1).edit();
        unPage.setRedirect(true);
        return unPage;
    }
    
    /** 
    * The method edites the warior 2
    * @return page for edit the warior 2
    */
    public PageReference ownEditWar2()
    {
        PageReference unPage = new ApexPages.StandardController(warrior2).edit();
        unPage.setRedirect(true);
        return unPage;
    }
    
    /** 
    * SOQL and SOSL The methods searches warriors by input string
    */
    public void search() 
    {  
       string searchquerySOQL ='select name,id from Unit__c where name like \'%'+searchstring+'%\'';  
       unitsSOQL = Database.query(searchquerySOQL);  
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
