/**
@author LNazarenko
This class defines the fields and methods of the warrior
*/

public class Unit
{
    /** name of the warrior */
    private String name;
    /** amount of warrior's life */
    private integer HP;
    /** minimal damaging for the enemy's */
    private integer dmgMin;
    /** maximal damaging for the enemy's */
    private integer dmgMax;
    
    /** 
    * The constructor creates warrior in the game
    * @param vName - name of the warrior
    * @param vHP  - initial amount of warrior's life
    * @param vMinDmg - minimal damaging for the enemy's 
    * @param vMaxDmg  - maximal damaging for the enemy's
    */
    public Unit(String vName,integer vHP,integer vMinDmg, integer vMaxDmg)
    {
        name   = vName;
        HP     = vHP;
        dmgMin = vMinDmg;
        dmgMax = vMaxDmg;
    }
    
    public String getName()
    {return name;}
    
    public void setName(String vName)
    {name= vName;}
    
    public Integer getHP()
    {return HP;}
    
    public void sethHP(integer vHP)
    {HP= vHP;}
    
    public Integer getDmgMin()
    {return dmgMin;}
    
    public void setDmgMin(integer vdmgMin)
    {dmgMin= vdmgMin;}
    
    public Integer getDmgMax()
    {return dmgMax;}
    
    public void setDmgMax(integer vdmgMax)
    {dmgMax = vdmgMax;}
 }