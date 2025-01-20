@interface CLRecordingTriggerBase
- (BOOL)isRecording;
- (CLRecordingSettings)getSettings;
- (CLRecordingTriggerBase)initWithDelegate:(id)a3 universe:(id)a4 andSettings:()unique_ptr<CLRecordingSettings;
- (id)getDeferredStopTimer;
- (id)getDelegate;
- (id)getRecording;
- (id)getUniverse;
@end

@implementation CLRecordingTriggerBase

- (CLRecordingTriggerBase)initWithDelegate:(id)a3 universe:(id)a4 andSettings:()unique_ptr<CLRecordingSettings
{
  return 0LL;
}

- (id)getDelegate
{
  return 0LL;
}

- (id)getUniverse
{
  return 0LL;
}

- (id)getDeferredStopTimer
{
  return 0LL;
}

- (BOOL)isRecording
{
  return 0;
}

- (id)getRecording
{
  return 0LL;
}

- (CLRecordingSettings)getSettings
{
  return 0LL;
}

@end