public class Game
{
    public integer getHit(integer wdmgMin,integer wdmgMax )
        { 
            return (Integer)(Math.floor(Math.random() * (wdmgMax - wdmgMin + 1) + wdmgMin));
        }
        
    public integer increaseLife(integer life, integer dmg)
        {
            return (life - dmg);
        }    

    public Integer MillisecOfNow()
        {
            System.debug(system.now().millisecond());
            return system.now().millisecond(); 
        }

    public String Fight(Unit unOrc, Unit unHuman)
        {
           integer millisecond = MillisecOfNow();
        
           if (math.mod(millisecond,2) == 0)
           {
           
                integer dmgHum = getHit(unOrc.getDmgMin(),unOrc.getDmgMax());
                integer lostLifeHum = increaseLife(unHuman.getHP(),dmgHum);
                unHuman.sethHP(lostLifeHum);
                
                if (lostLifeHum<=0)
                {
                    System.debug('After hit Life of human is ' +unHuman.getHP() + ' Hit is ' +dmgHum );
                    return unOrc.getName();
                }
            }
            else
            {           
                integer dmgOrc = getHit(unHuman.getDmgMin(),unHuman.getDmgMax());
                integer lostLifeOrc = increaseLife(unOrc.getHP(),dmgOrc);
                unOrc.sethHP(lostLifeOrc);
                if (lostLifeOrc<=0)
                {
                    System.debug('After hit Life of orc is ' +unOrc.getHP() + ' Hit is ' +dmgOrc);
                    return unHuman.getName();
                }
            }            
            System.debug('Life of human is ' +unHuman.getHP());
            System.debug('Life of orc is ' +unOrc.getHP());
            
            return Fight(unOrc,unHuman);
         } 
    
 }