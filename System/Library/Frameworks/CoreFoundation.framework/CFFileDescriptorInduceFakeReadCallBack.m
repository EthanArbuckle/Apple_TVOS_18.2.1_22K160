@interface CFFileDescriptorInduceFakeReadCallBack
@end

@implementation CFFileDescriptorInduceFakeReadCallBack

void ___CFFileDescriptorInduceFakeReadCallBack_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(dispatch_object_s **)(v2 + 32);
  if (v3)
  {
    *(_BYTE *)(v2 + 50) = 1;
    if (!*(_BYTE *)(v2 + 48))
    {
      dispatch_suspend(v3);
      uint64_t v2 = *(void *)(a1 + 32);
      *(_BYTE *)(v2 + 48) = 1;
    }

    v4 = *(__CFRunLoopSource **)(v2 + 56);
    if (v4)
    {
      CFRunLoopSourceSignal(v4);
      _CFRunLoopSourceWakeUpRunLoops(*(void *)(*(void *)(a1 + 32) + 56LL));
    }
  }

@end