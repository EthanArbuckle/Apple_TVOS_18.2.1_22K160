@interface MobileAssetGetWorkQueue
@end

@implementation MobileAssetGetWorkQueue

void ___MobileAssetGetWorkQueue_block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MobileAsset.workQueue", 0LL);
  v2 = (void *)_MobileAssetGetWorkQueue_workQueue;
  _MobileAssetGetWorkQueue_workQueue = (uint64_t)v1;
}

@end