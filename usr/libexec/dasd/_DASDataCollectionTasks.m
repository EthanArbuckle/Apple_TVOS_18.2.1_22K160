@interface _DASDataCollectionTasks
+ (void)schedule;
@end

@implementation _DASDataCollectionTasks

+ (void)schedule
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"dataCollection"));
  v3 = (void *)qword_100157B48;
  qword_100157B48 = v2;

  id v4 =  +[_DASDataCollectionSUTask taskWithName:intervalDuration:withLogger:]( &OBJC_CLASS____DASDataCollectionSUTask,  "taskWithName:intervalDuration:withLogger:",  @"com.apple.dasd.dataCollectiontask.dummyAutoSU",  qword_100157B48,  900.0);
}

@end