@interface TVRDNPLog
@end

@implementation TVRDNPLog

void ___TVRDNPLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tvremoted", "NowPlayingMonitor");
  v2 = (void *)_TVRDNPLog_log;
  _TVRDNPLog_log = (uint64_t)v1;
}

@end