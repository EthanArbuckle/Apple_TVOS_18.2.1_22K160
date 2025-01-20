@interface _DASUtils
+ (id)processNameFromPID:(int)a3;
@end

@implementation _DASUtils

+ (id)processNameFromPID:(int)a3
{
  if (proc_pidinfo(a3, 13, 1uLL, buffer, 64) != 64
    || (__int128 v6 = v9,
        char v7 = 0,
        (v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v6))) == 0LL))
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dasUtils"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B9144(v4);
    }

    v3 = 0LL;
  }

  return v3;
}

@end