@interface MTLoggingAnalyticsFilterManager
@end

@implementation MTLoggingAnalyticsFilterManager

void __MTLoggingAnalyticsFilterManager_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Multitouch.SessionFilter", "AnalyticsFilterManager");
  v2 = (void *)MTLoggingAnalyticsFilterManager::__logObj;
  MTLoggingAnalyticsFilterManager::__logObj = (uint64_t)v1;
}

@end