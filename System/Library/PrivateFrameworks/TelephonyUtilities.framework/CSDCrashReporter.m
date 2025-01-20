@interface CSDCrashReporter
+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5;
+ (void)simulateCrashReportWithFormat:(id)a3;
+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5;
@end

@implementation CSDCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (qword_10044CE08 != -1) {
    dispatch_once(&qword_10044CE08, &stru_1003D7798);
  }
  char v8 = off_10044CE00(v6, a5, v7);
  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B17D8((uint64_t)v7, v11);
    }
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    sub_1002B184C((uint64_t)v7, v11);
  }
}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v8, &v10);

  [a1 simulateCrashReportWithReason:v9 pid:v6 code:v5];
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v6);

  [a1 simulateCrashReportWithReason:v5 pid:getpid() code:14593455];
}

@end