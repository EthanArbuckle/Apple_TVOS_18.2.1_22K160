@interface WLDOperationQueue
@end

@implementation WLDOperationQueue

void __WLDOperationQueue_block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v2 = (void *)WLDOperationQueue___opQueue;
  WLDOperationQueue___opQueue = (uint64_t)v1;

  [(id)WLDOperationQueue___opQueue setMaxConcurrentOperationCount:1];
  v3 = (void *)WLDOperationQueue___opQueue;
  id v4 = WLDDispatchQueue();
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  [v3 setUnderlyingQueue:v5];
}

@end