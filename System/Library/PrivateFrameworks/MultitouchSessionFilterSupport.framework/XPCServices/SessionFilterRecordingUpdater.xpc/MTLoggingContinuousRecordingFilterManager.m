@interface MTLoggingContinuousRecordingFilterManager
@end

@implementation MTLoggingContinuousRecordingFilterManager

void __MTLoggingContinuousRecordingFilterManager_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Multitouch.SessionFilter", "ContinuousRecordingFilterManager");
  v2 = (void *)MTLoggingContinuousRecordingFilterManager::__logObj;
  MTLoggingContinuousRecordingFilterManager::__logObj = (uint64_t)v1;
}

@end