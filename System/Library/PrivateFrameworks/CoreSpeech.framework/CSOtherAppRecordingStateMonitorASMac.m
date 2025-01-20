@interface CSOtherAppRecordingStateMonitorASMac
+ (id)sharedInstance;
- (BOOL)isOtherNonEligibleAppRecording;
@end

@implementation CSOtherAppRecordingStateMonitorASMac

- (BOOL)isOtherNonEligibleAppRecording
{
  return 0;
}

+ (id)sharedInstance
{
  if (qword_10027FCD0 != -1) {
    dispatch_once(&qword_10027FCD0, &stru_10022AC60);
  }
  return (id)qword_10027FCC8;
}

@end