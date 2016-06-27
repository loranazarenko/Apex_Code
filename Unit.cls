/**
@author LNazarenko
This class defines the fields and methods of the warrior
*/

public class Unit
{
    /** name of the warrior */
    private String vName;
    /** amount of warrior's life */
    private integer vHP;
    /** minimal damaging for the enemy's */
    private integer vMinDmg;
    /** maximal damaging for the enemy's */
    private integer vMaxDmg;
      
    /** 
    * The constructor creates warrior in the game
    * Default
    */
    public Unit()
    {
        this.vName   = '';
        this.vHP     = 0;
        this.vMinDmg = 0;
        this.vMaxDmg = 0;
    }  
       
    /** 
    * The constructor creates warrior in the game
    * @param vName - name of the warrior
    * @param vHP  - initial amount of warrior's life
    * @param vMinDmg - minimal damaging for the enemy's 
    * @param vMaxDmg  - maximal damaging for the enemy's
    */
    public Unit(String vName,integer vHP,integer vMinDmg, integer vMaxDmg)
    {
        this.vName   = vName;
        this.vHP     = vHP;
        this.vMinDmg = vMinDmg;
        this.vMaxDmg = vMaxDmg;
    }
    
    public String getName()
    {
      return this.vName;
    }
    
    public void setName(String vName)
    {
      this.vName = vName;
    }
    
    public Integer getHP()
    {
      return this.vHP;
    }
    
    public void setHP(integer vHP)
    {
      this.vHP= vHP;
    }
    
    public Integer getDmgMin()
    {
      return this.vMinDmg;
    }
    
    public void setDmgMin(integer vMinDmg)
    {
      this.vMinDmg = vMinDmg;
    }
    
    public Integer getDmgMax()
    {
      return this.vMaxDmg;
    }
    
    public void setDmgMax(integer vMaxDmg)
    {
      this.vMaxDmg = vMaxDmg;
    }
 }
