@interface LSContextRemoveChangeObserver
@end

@implementation LSContextRemoveChangeObserver

uint64_t ___LSContextRemoveChangeObserver_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0LL;

  LaunchServices::notifyd::NotifyToken::cancel((LaunchServices::notifyd::NotifyToken *)(*(void *)(a1 + 32) + 20LL));
  return [(id)gChangeObservers removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

@end