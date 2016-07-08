/**
* Author  LNazarenko
* this code controls a launch batch ScheduledUnitHPBatch one time a day
*/

ScheduledUnitHPBatch newShed = new ScheduledUnitHPBatch();
String timeGo = '59 59 23 * * ?';
System.schedule('Increase life', timeGo, newShed);



