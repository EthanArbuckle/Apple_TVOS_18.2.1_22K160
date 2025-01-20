@interface BagObserverLog
@end

@implementation BagObserverLog

void ___BagObserverLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.watchlistd", "BagObserver");
  v2 = (void *)_BagObserverLog_log;
  _BagObserverLog_log = (uint64_t)v1;
}

@end