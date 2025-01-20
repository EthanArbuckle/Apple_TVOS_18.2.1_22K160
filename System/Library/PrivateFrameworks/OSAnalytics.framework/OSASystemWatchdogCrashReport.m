@interface OSASystemWatchdogCrashReport
- (OSASystemWatchdogCrashReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7;
- (id)problemType;
@end

@implementation OSASystemWatchdogCrashReport

- (OSASystemWatchdogCrashReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSASystemWatchdogCrashReport;
  return -[OSACrackShotReport initWithPid:procName:bundleID:exitSnapshot:reason:]( &v8,  sel_initWithPid_procName_bundleID_exitSnapshot_reason_,  *(void *)&a3,  a4,  a5,  a6,  a7);
}

- (id)problemType
{
  return @"409";
}

@end