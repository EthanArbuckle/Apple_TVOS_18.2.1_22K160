@interface MTLoggingCrownFilterManager
@end

@implementation MTLoggingCrownFilterManager

void __MTLoggingCrownFilterManager_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Multitouch.SessionFilter", "CrownFilterManager");
  v2 = (void *)MTLoggingCrownFilterManager::__logObj;
  MTLoggingCrownFilterManager::__logObj = (uint64_t)v1;
}

@end