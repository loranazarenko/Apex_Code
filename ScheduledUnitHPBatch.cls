global class ScheduledUnitHPBatch implements Schedulable {
   global void execute(SchedulableContext sc) {
      unitHPBatch btch = new unitHPBatch(); 
      database.executebatch(btch);
   }
}