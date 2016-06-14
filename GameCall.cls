public class GameCall
{
    public String inputName1 {get;set;}
    public String inputName2 {get;set;}
    
    public Integer inputHP1 {get;set;}
    public Integer inputHP2 {get;set;}
    
    public Integer inputDmgMin1 {get;set;}
    public Integer inputDmgMin2 {get;set;}
    
    public Integer inputDmgMax1 {get;set;}
    public Integer inputDmgMax2 {get;set;}
    
    public Boolean ShowpageBlockFlag{get;set;}
    public String  Winner {get;set;}
    Unit warrior1;
    Unit warrior2;
    Game newGame;
    {
        ShowpageBlockFlag = false;
    }
    
    public void ShowBlockMethod(){
         ShowpageBlockFlag = true;
    }
    
     public void ownSave(){
        if(inputName1<>null&&inputHP1<>0&&inputDmgMin1<>0&&inputDmgMax1<>0&&inputName2<>null&&inputHP2<>0&&inputDmgMin2<>0&&inputDmgMax2<>0)
            {
                try 
                 {
                     warrior1 = new Unit(inputName1,inputHP1,inputDmgMin1,inputDmgMax1);
                     warrior2 = new Unit(inputName2,inputHP2,inputDmgMin2,inputDmgMax2);
                     newGame  = new Game();
                     Winner = newGame.Fight(warrior1,warrior2);
                     System.Debug(Winner);
                     ShowBlockMethod(); 
                 } catch(System.NullPointerException e) {
                    ApexPages.addMessages(e);
                 }
              }
         else
             {
                 Winner = 'Input please all fields';
                 ShowBlockMethod(); 
             }
   }
}