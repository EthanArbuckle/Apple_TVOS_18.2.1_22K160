@interface NSXPCLog
@end

@implementation NSXPCLog

os_log_t ___NSXPCLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "xpc");
  qword_18C4969C8 = (uint64_t)result;
  return result;
}

@end