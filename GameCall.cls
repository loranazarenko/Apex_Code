/**
@author LNazarenko
This class defines the fields and methods of the start game and visual page
*/

public class GameCall
{
    /** Warrior 1 required info that would be input by user */
    public String inputName1 {get;set;}
    public Integer inputHP1 {get;set;}
    public Integer inputDmgMin1 {get;set;}
    public Integer inputDmgMax1 {get;set;}
    
    /** Warrior 2 required info that would be input by user */
    public String inputName2 {get;set;}
    public Integer inputHP2 {get;set;}
    public Integer inputDmgMin2 {get;set;}
    public Integer inputDmgMax2 {get;set;}
   
   /** Winner - field that return name of the winners */
    public String  Winner {get;set;}
    /** warrior1 - creates first warrior */
    Unit warrior1;
    /** warrior1 - creates second warrior */
    Unit warrior2;
    /** warrior1 - creates new game */
    Game newGame;
     
     /** 
    * The method returns name of the winner 
    * @return string value of the winner's name in the case when all field are filled or error message 'Input please all fields' otherwise
    */    
    public void ownSave(){
      if(inputName1<>null&&inputHP1<>0&&inputDmgMin1<>0&&inputDmgMax1<>0&&inputName2<>null&&inputHP2<>0&&inputDmgMin2<>0&&inputDmgMax2<>0)
      {
        warrior1 = new Unit(inputName1,inputHP1,inputDmgMin1,inputDmgMax1);
        warrior2 = new Unit(inputName2,inputHP2,inputDmgMin2,inputDmgMax2);
        newGame  = new Game();
        Winner = newGame.Fight(warrior1,warrior2);
        System.Debug(Winner);
      }
      else
      {
        Winner = 'Input please all fields';
      }
    }
}