@interface SCNetworkCategoryManagerCopyActiveValueNoSession
@end

@implementation SCNetworkCategoryManagerCopyActiveValueNoSession

void ____SCNetworkCategoryManagerCopyActiveValueNoSession_block_invoke()
{
  v0 = dispatch_queue_create("__SCNetworkCategoryManagerCopyActiveValueNoSession_block_invoke", 0LL);
  __SCNetworkCategoryManagerCopyActiveValueNoSession_connection = (uint64_t)CategoryManagerConnectionCreate(v0, 0LL);
  dispatch_release(v0);
}

@end