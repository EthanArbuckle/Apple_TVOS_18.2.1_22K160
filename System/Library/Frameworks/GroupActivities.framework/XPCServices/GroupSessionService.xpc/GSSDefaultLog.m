@interface GSSDefaultLog
@end

@implementation GSSDefaultLog

void __GSSDefaultLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GroupSessionService", "Security");
  v2 = (void *)GSSDefaultLog_sLog;
  GSSDefaultLog_sLog = (uint64_t)v1;
}

@end