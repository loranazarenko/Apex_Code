/**
* Author  LNazarenko
* this code launch batch scheduledUnitHPBatch
*/

unitHPBatch newBatch = new unitHPBatch();
scheduledUnitHPBatch newShed = new scheduledUnitHPBatch();
String timeGo = '59 59 23 * * ?';
System.schedule('Increase life', timeGo, newShed);



