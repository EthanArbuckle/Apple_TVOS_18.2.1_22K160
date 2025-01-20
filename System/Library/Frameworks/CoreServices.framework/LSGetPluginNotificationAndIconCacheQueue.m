@interface LSGetPluginNotificationAndIconCacheQueue
@end

@implementation LSGetPluginNotificationAndIconCacheQueue

void ___LSGetPluginNotificationAndIconCacheQueue_block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS plugin notifications/icon cache queue", v2);
  v1 = (void *)_LSGetPluginNotificationAndIconCacheQueue::result;
  _LSGetPluginNotificationAndIconCacheQueue::result = (uint64_t)v0;
}

@end