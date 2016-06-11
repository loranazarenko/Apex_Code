public class Unit
{
    private String name;
    private integer HP;
    private integer dmgMin;
    private integer dmgMax;
    
    public Unit(String vName,integer vHP,integer vMinDmg, integer vMaxDmg)
    {
        name= vName;
        HP= vHP;
        dmgMin= vMinDmg;
        dmgMax= vMaxDmg;
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