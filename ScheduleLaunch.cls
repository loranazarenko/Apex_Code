unitHPBatch newBatch = new unitHPBatch();
scheduledunitHPBatch newShed = new scheduledunitHPBatch();
String timeGo = '59 59 23 * * ?';
System.schedule('Increase life', timeGo, newShed);



