/**
@author LNazarenko
This class defines the fields and methods of the start game and visual page
*/

public with sharing class GameCallObjPeople
{

    /** Winner - field that return name of the winners */
    public String  Winner {get;set;}
    /** warrior1 - gets first warrior */
    Unit__c warrior1 {get;set;}
    /** warrior1 - gets second warrior */
    Unit__c warrior2 {get;set;}
    /** warrior1 - creates new game */
    GameObjPeople newGame = new GameObjPeople();
     /** New warrior */
    Unit__c warriorNew;
    /** id current page */
    private String vid;
    
    /** string value for search */
    public string searchstring {get;set;}  
    /** list the list of found units by SOQL */
    public List<Unit__c> unitsSOQL {get;set;}  
    /** list the list of found units by SOSL */
    public List<Unit__c> unitsSOSL {get;set;}  
        
    /** warrior1 - list warriors for the picklist1 */
    public List<Unit__c> warriorsHum{get;set;}
    /** warrior2 - list warriors for the picklist2 */
    public List<Unit__c> warriorsOrc{get;set;}
    /** created options for the picklist1 */
    public list<SelectOption> pickListHum {get;set;}
    /** created options for the picklist2 */
    public list<SelectOption> pickListOr {get;set;}
    /** returned string with the name selected warrior from the picklist1 */
    public String selectedWarHum{get;set;}
    /** returned string with the name selected warrior from the picklist2 */
    public String selectedWarOrc{get;set;}
    
    /** radiobuttons for selecting types of attacks for warrior1 */
    List<SelectOption> optionsAttack {get;set;}
    /** radiobuttons for selecting types of blocks for warrior1 */
    List<SelectOption> optionsBlock {get;set;}
    
    /** Variable keeps a selected type of attacks */
    public integer atk {get;set;}
    /** Variable keeps a selected type of blocks */
    public integer blk {get;set;}
    
    /** Variable defines a first kick */
    public Boolean firstKik = true;
      
    /** 
    * The constructor calls the first list of warriors and creates the picklist1 
    */  
     public GameCallObjPeople()
     {
        this.vid = ApexPages.currentPage().getParameters().get('id');
        getWarriors();
        Winner ='';
        pickListHum = new list<SelectOption>();
        SelectOption firstOption = new SelectOption('', ' - Select your favorite fighter' + ' -');
        pickListHum.add(firstOption);
        for (Unit__c warH : warriorsHum) 
        {
          this.pickListHum.add(new SelectOption(warH.Name,warH.Name));
        }
        getOptionsAttack();
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
     * The method assigns the type of attacks to the variable atk
     */
     public void assignmentAttack() 
     {
         atk = Integer.valueof(warrior1.TypeAttack__c.trim());
         System.debug(warrior1.TypeAttack__c);
     }
     
     /** 
     * The method assigns the type of blocks to the variable blk
     */
     public void assignmentBlock() 
     {
        blk = Integer.valueof(warrior1.TypeBlock__c.trim());
        System.debug(warrior1.TypeBlock__c);
     }
        
     /** 
     * The method creates the first list of warriors
     * @return list of warriors where HP>0 or time was more than a day from the time when a warrior was killed
     */ 
     public List<Unit__c> getWarriors()
     {
       Datetime lastDay = Datetime.Now().addDays(-1);
       warriorsHum = new List<Unit__c>([select Id, Name, HP__c, dmgMin__c , dmgMax__c, isActive__c, TypeAttack__c, TypeBlock__c,WonGames__c,Place_in_the_rating__c  
                     From Unit__c 
                     Where (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0))]);
       return warriorsHum;
     }
     
     /** 
     * The method shows fields of the first warrior and creates the second list of warriors and the picklist2 
     * and it depends which first warrior was selected
     * list of warriors where HP>0 or time was more than a day from the time when a warrior was killed
     */
     public void refreshFieldsHum()
     {
       System.debug(selectedWarHum);
       if(selectedWarHum<>null)
       {
         warrior1 = [select Id, Name, HP__c, dmgMin__c , dmgMax__c, isActive__c, TypeAttack__c, TypeBlock__c,WonGames__c,Place_in_the_rating__c    
                    From Unit__c Where Name =: selectedWarHum];
         this.warrior1 = warrior1;
                        
         {        
          pickListOr = new list<SelectOption>();
          
          Datetime lastDay = Datetime.Now().addDays(-1);
          warriorsOrc = new List<Unit__c>([select Id, Name, HP__c, dmgMin__c , dmgMax__c, isActive__c, TypeAttack__c, TypeBlock__c,WonGames__c,Place_in_the_rating__c   
                        From Unit__c 
                        Where (name!=:selectedWarHum And 
                        (HP__c>0 Or (LastModifiedDate<:lastDay and HP__c<=0)))]);
          System.debug(warriorsOrc);              
          SelectOption firstOptionOr = new SelectOption('', ' - Select your favorite fighter' + ' -');
          pickListOr.add(firstOptionOr);
          for (Unit__c warOr : warriorsOrc) 
          {
            this.pickListOr.add(new SelectOption(warOr.Name,warOr.Name));
          }
        }
         System.debug(pickListOr);  
       }
     }
     /** 
     * The method shows fields of the second warrior and assigns at warrior's field 'isActive __c' a value 'true' 
     */
     public void refreshFieldsOrc()
     {
       System.debug(selectedWarOrc);
       if(selectedWarOrc<>null)
       {
         warrior2 = [select Id, Name, HP__c, dmgMin__c, dmgMax__c, isActive__c, TypeAttack__c, TypeBlock__c, WonGames__c,Place_in_the_rating__c
                    From Unit__c Where Name =: selectedWarOrc];
         this.warrior2 = warrior2;
       }
       
       if (firstKik)
       {
          warrior1.isActive__c = true;
          update warrior1;
          firstKik = false;
       }
    } 
    
    /** 
    * Return the reendom integer number in the range 
    * @return ineger value of the the millisecond component
    */ 
    public integer randType()
    {
     System.debug((integer)(Math.floor(Math.random() * 4) + 1));
     return (integer)(Math.floor(Math.random() * 4) + 1);
    } 
    
    /** 
    * The method returns name of the winner 
    * @return string value of the winner's name in the case when all field are filled 
    * or error message 'Input please all fields' otherwise
    */    
    public void ownStart()
    { 
        System.Debug(warrior1);
        System.Debug(warrior2);
        
        if(warrior1!=null&&warrior2!=null&&warrior1.HP__c>0&&warrior2.HP__c>0)
        {
         if(warrior1.isActive__c)
         {
           System.Debug(firstKik);
           System.Debug(warrior1.isActive__c);
           
           if(atk != randType())
           {
               newGame.StageFightHuman(warrior1,warrior2); 
           }
         }
         else if (warrior2.isActive__c)
         {
           System.Debug(firstKik);
           System.Debug(warrior2.isActive__c);
           if(blk != randType())
           {
               newGame.StageFightOrc(warrior1,warrior2);
           }
         }
         refreshFieldsHum();
         refreshFieldsOrc();
         System.Debug(warrior1);
         System.Debug(warrior2);
         if(warrior1.HP__c<=0)
         {
           Winner          = warrior2.Name;
           warrior1.Stamina__c = false;
           Id idSomeWar    = warrior2.Id;
           Unit__c someWar = [select Id, Name, WonGames__c, Place_in_the_rating__c
                    From Unit__c Where Id =: idSomeWar];
           Integer var     = (Integer)someWar.WonGames__c;
           System.Debug(var);
           System.Debug(someWar.WonGames__c);
           if(someWar.WonGames__c == null)
           {
             someWar.WonGames__c = 1;
           }
           else
           {
             someWar.WonGames__c = var + 1;
           }
           update someWar;
           
         }
         else if(warrior2.HP__c<=0)
         {
           warrior2.Stamina__c = false;
           Winner          = warrior1.Name;
           Id idSomeWar    = warrior1.Id;
           Unit__c someWar = [select Id, Name, WonGames__c, Place_in_the_rating__c
                    From Unit__c Where Id =: idSomeWar];
           Integer var = (Integer)someWar.WonGames__c;
           System.Debug(var);
           System.Debug(someWar.WonGames__c);
           if(someWar.WonGames__c == null)
           {
             someWar.WonGames__c = 1;
           }
           else
           {
             someWar.WonGames__c = var + 1;
           }
           update someWar;
         }
         else
         {
           Winner = '';
         }
        } 
        else if(warrior1==null||warrior2==null)
        {
         Winner = 'Fill, please, all fields.';
        }   
         else if(warrior1.HP__c<=0||warrior2.HP__c<=0)
        {
         Winner = 'Game over.';
        }  
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
    
    
    /** 
    * The method creates radiobuttons for the warior 1
    * @return list of the radiobuttons for Attacks 
    */
    public List<SelectOption> getOptionsAttack()
    {
      optionsAttack = new List<SelectOption>();
      Schema.DescribeFieldResult fieldResult = Unit__c.TypeAttack__c.getDescribe();
      List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry fi : ple)
      {
        optionsAttack.add(new SelectOption(fi.getLabel(), fi.getValue()));
      }       
      return optionsAttack;
    }
    
     /** 
    * The method creates radiobuttons for the warior 1
    * @return list of the radiobuttons for Blocks 
    */
    public List<SelectOption> getOptionsBlock()
    {
      optionsBlock = new List<SelectOption>();
      Schema.DescribeFieldResult fieldResult = Unit__c.TypeBlock__c.getDescribe();
      List<Schema.PicklistEntry> pled = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry fil : pled)
      {
        optionsBlock.add(new SelectOption(fil.getLabel(), fil.getValue()));
      }       
      return optionsBlock;
    }
    
}
