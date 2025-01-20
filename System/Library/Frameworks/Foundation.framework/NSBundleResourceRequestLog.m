@interface NSBundleResourceRequestLog
@end

@implementation NSBundleResourceRequestLog

os_log_t ___NSBundleResourceRequestLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.foundation.nsbundleresourcerequest", "general");
  qword_18C497F88 = (uint64_t)result;
  return result;
}

@end