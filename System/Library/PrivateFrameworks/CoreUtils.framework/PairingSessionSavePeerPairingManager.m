@interface PairingSessionSavePeerPairingManager
@end

@implementation PairingSessionSavePeerPairingManager

uint64_t ___PairingSessionSavePeerPairingManager_block_invoke(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NSErrorToOSStatusEx(a2, 0LL);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end