@interface MTLoggingRemoteFilterManager
@end

@implementation MTLoggingRemoteFilterManager

void __MTLoggingRemoteFilterManager_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Multitouch.SessionFilter", "RemoteFilterManager");
  v2 = (void *)MTLoggingRemoteFilterManager::__logObj;
  MTLoggingRemoteFilterManager::__logObj = (uint64_t)v1;
}

@end