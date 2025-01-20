@interface CFMachPortQueue
@end

@implementation CFMachPortQueue

dispatch_queue_t ___CFMachPortQueue_block_invoke()
{
  v0 = (dispatch_queue_attr_s *)dispatch_queue_attr_make_with_overcommit();
  dispatch_queue_t result = dispatch_queue_create("com.apple.CFMachPort", v0);
  _CFMachPortQueue___CFMachPortQueue = (uint64_t)result;
  return result;
}

@end