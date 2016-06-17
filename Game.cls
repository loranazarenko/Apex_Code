/**
@author LNazarenko
This class explains the process of the game
*/

public class Game
{    
    /** 
    * The method returns power of hit by choosing random number within max and min the damage 
    * @param wdmgMin setting a minimum value of damage
    * @param wdmgMax setting a maximimum value of damage
    * @return ineger value of the damage
    */    
        
     public integer getHit(integer wdmgMin,integer wdmgMax )
    { 
       return (Integer)(Math.floor(Math.random() * (wdmgMax - wdmgMin + 1) + wdmgMin));
    }
    /** 
    * The method returns the rest of life after the damage 
    * @param life the current amount of lives
    * @param dmg the received damage
    * @return ineger value of the damage
    */      
    public integer reduceLife(integer life, integer dmg)
    {
       return (life - dmg);
    }    
    /** 
    * Return the millisecond component of the current time 
    * @return ineger value of the the millisecond component
    */ 
    public Integer MillisecOfNow()
    {
       System.debug(system.now().millisecond());
       return system.now().millisecond(); 
    }
     /** 
    * Return the random integer number in the range 1-4
    * @return integer value 
    */ 
    public integer randType()
    {
     System.debug((integer)(Math.floor(Math.random() * 4)+1));
     return (integer)(Math.floor(Math.random() * 4)+1);
    }    
    /** 
    * The method returns winner of the game 
    * @param unOrc passes the value of the warrior 1
    * @param unHuman passes the value of the warrior 2
    * @return String value of the winner's name
    */
    public String Fight(Unit unOrc, Unit unHuman)
    {
       
      /** depending on even or odd milliseconds method determines who will make the first hit */
       integer millisecond = MillisecOfNow();
       if (math.mod(millisecond,2) == 0)
       {
          integer randAtt = randType(); 
          integer randBlc = randType(); 
                   
          if(randAtt == randBlc)
          { 
          integer dmgHum = getHit(unOrc.getDmgMin(),unOrc.getDmgMax());
          integer lostLifeHum = reduceLife(unHuman.getHP(),dmgHum);
          unHuman.sethHP(lostLifeHum);
                
          if (lostLifeHum<=0)
          {
            System.debug('After hit Life of human is ' +unHuman.getHP() + ' Hit is ' +dmgHum );
            return unOrc.getName();
          }
         }
       }
       else
       {   
          integer randAtt = randType(); 
          integer randBlc = randType(); 
          
          if(randAtt == randBlc)
          {     
           integer dmgOrc = getHit(unHuman.getDmgMin(),unHuman.getDmgMax());
           integer lostLifeOrc = reduceLife(unOrc.getHP(),dmgOrc);
           unOrc.sethHP(lostLifeOrc);
           if (lostLifeOrc<=0)
           {
              System.debug('After hit Life of orc is ' +unOrc.getHP() + ' Hit is ' +dmgOrc);
              return unHuman.getName();
           }
          }
       }            
       System.debug('Life of human is ' +unHuman.getHP());
       System.debug('Life of orc is ' +unOrc.getHP());
       return Fight(unOrc,unHuman);
    } 
 }