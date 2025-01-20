@interface WLDDispatchQueue
@end

@implementation WLDDispatchQueue

void __WLDDispatchQueue_block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.watchlistd.defaultworkqueue", 0LL);
  v2 = (void *)WLDDispatchQueue___queue;
  WLDDispatchQueue___queue = (uint64_t)v1;
}

@end