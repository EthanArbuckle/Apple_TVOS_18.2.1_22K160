@interface MTLoggingPreferenceProvider
@end

@implementation MTLoggingPreferenceProvider

void __MTLoggingPreferenceProvider_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Multitouch.SessionFilter", "PreferenceProvider");
  v2 = (void *)MTLoggingPreferenceProvider___logObj;
  MTLoggingPreferenceProvider___logObj = (uint64_t)v1;
}

@end