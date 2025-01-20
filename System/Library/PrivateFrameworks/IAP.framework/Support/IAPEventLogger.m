@interface IAPEventLogger
+ (void)AddToStr:(id)a3 WithKey:(id)a4 AndValue:(id)a5;
+ (void)LogMsg:(int)a3 WithDictionary:(id)a4 andKeys:(id)a5;
+ (void)LogMsg:(int)a3 WithKey:(id)a4 AndValue:(id)a5;
+ (void)LogMsg:(int)a3 WithStr:(id)a4;
@end

@implementation IAPEventLogger

+ (void)LogMsg:(int)a3 WithStr:(id)a4
{
  if (qword_10011C7F0 != -1) {
    dispatch_once(&qword_10011C7F0, &stru_10010A4F0);
  }
  if (qword_10011C7E0)
  {
    else {
      v6 = (&off_10010A510)[a3];
    }
    asl_set((asl_object_t)qword_10011C7E8, "IapLoggerEventType", v6);
    if (asl_log( (asl_object_t)qword_10011C7E0,  (asl_object_t)qword_10011C7E8,  4,  "%s",  (const char *)[a4 cStringUsingEncoding:1]))
    {
      syslog(3, "Error writing to the Event Log file. status=%d");
    }
  }

  else
  {
    syslog(3, "Could not write to the Event Log file");
  }

+ (void)LogMsg:(int)a3 WithKey:(id)a4 AndValue:(id)a5
{
  +[IAPEventLogger LogMsg:WithStr:]( &OBJC_CLASS___IAPEventLogger,  "LogMsg:WithStr:",  *(void *)&a3,  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ = %@;", a4, a5));
}

+ (void)LogMsg:(int)a3 WithDictionary:(id)a4 andKeys:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  +[IAPEventLogger LogMsg:WithStr:]( &OBJC_CLASS___IAPEventLogger,  "LogMsg:WithStr:",  *(void *)&a3,  @"AccessoryInfo = {");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v13 = [a4 objectForKey:v12];
        if (v13) {
          +[IAPEventLogger LogMsg:WithKey:AndValue:]( &OBJC_CLASS___IAPEventLogger,  "LogMsg:WithKey:AndValue:",  v7,  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"    %@", v12),  v13);
        }
      }

      id v9 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  +[IAPEventLogger LogMsg:WithStr:]( &OBJC_CLASS___IAPEventLogger,  "LogMsg:WithStr:",  v7,  @"} // End AccessoryInfo");
}

+ (void)AddToStr:(id)a3 WithKey:(id)a4 AndValue:(id)a5
{
  [a3 appendFormat:@"%@ = %@;", a4, a5];
}

@end