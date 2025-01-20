@interface LSLoggingQueue
@end

@implementation LSLoggingQueue

void ___LSLoggingQueue_block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.logging", v2);
  v1 = (void *)_LSLoggingQueue_logQueue;
  _LSLoggingQueue_logQueue = (uint64_t)v0;
}

@end