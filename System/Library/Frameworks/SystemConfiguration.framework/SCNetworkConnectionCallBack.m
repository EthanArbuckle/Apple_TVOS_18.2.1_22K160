@interface SCNetworkConnectionCallBack
@end

@implementation SCNetworkConnectionCallBack

void ____SCNetworkConnectionCallBack_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v2 = *(const __SCNetworkConnection **)(a1 + 32);
  v3 = *(__CFRunLoop **)(a1 + 40);
  v4 = *(const void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  __int128 v7 = *(_OWORD *)(a1 + 56);
  SCNetworkConnectionStatus Status = SCNetworkConnectionGetStatus(v2);
  CFRetain(v2);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____SCNetworkConnectionCallBackPerformRunLoop_block_invoke;
  block[3] = &__block_descriptor_tmp_104;
  block[4] = v2;
  SCNetworkConnectionStatus v11 = Status;
  __int128 v9 = v7;
  uint64_t v10 = v5;
  CFRunLoopPerformBlock(v3, v4, block);
  CFRunLoopWakeUp(v3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end