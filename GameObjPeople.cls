/**
@author LNazarenko
This class explains the process of the game
*/

public with sharing class GameObjPeople
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
    * The method creates next stage of the game for warrior 1  
    * @param unHuman passes the value of the warrior 1
    * @param unOrc passes the value of the warrior 2
    */
    public void StageFight(Unit__c unHuman, Unit__c unOrc, Boolean Flag)
    {
          if(Flag)
          {
            integer dmgHum = getHit((integer)unOrc.dmgMin__c,(integer)unOrc.dmgMax__c);
            integer lostLifeHum = reduceLife((integer)unHuman.HP__c,dmgHum);
            unHuman.HP__c       = lostLifeHum;
            unHuman.isActive__c = false;
            update unHuman; 
            unOrc.isActive__c   = true;
            update unOrc;
            if (lostLifeHum<=0)
            {
              unHuman.HP__c = 0;
              update unHuman;   
              System.debug('After hit Life of human is ' +unHuman.HP__c + ' Hit is ' +dmgHum );
            }
            System.debug('Life of human is ' +unHuman.HP__c);
            System.debug('Life of orc is ' +unOrc.HP__c);
          }
          else
          {
            integer dmgOrc = getHit((integer)unHuman.dmgMin__c,(integer)unHuman.dmgMax__c);
            integer lostLifeOrc = reduceLife((integer)unOrc.HP__c,dmgOrc);
            unOrc.HP__c       = lostLifeOrc;
            unOrc.isActive__c = false;
            update unOrc;
            unHuman.isActive__c = true;
            update unHuman;
            if (lostLifeOrc<=0)
            {
              unOrc.HP__c = 0;
              update unOrc;   
              System.debug('After hit Life of orc is ' +unOrc.HP__c + ' Hit is ' +dmgOrc);
            }
           System.debug('Life of human is ' +unHuman.HP__c);
           System.debug('Life of orc is ' +unOrc.HP__c);
         }
    } 
 }
