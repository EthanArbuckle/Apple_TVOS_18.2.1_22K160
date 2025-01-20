@interface IOHIDEventSystemConnectionCreateVirtualService
@end

@implementation IOHIDEventSystemConnectionCreateVirtualService

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke(uint64_t a1)
{
  if (_IOHIDServiceInitVirtual(*(void *)(a1 + 32)))
  {
    _IOHIDEventSystemAddService(*(const void **)(*(void *)(a1 + 40) + 8LL), *(void **)(a1 + 32));
  }

  else
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    v4 = *(dispatch_queue_s **)(v2 + 96);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2;
    block[3] = &__block_descriptor_tmp_97;
    uint64_t v5 = *(void *)(a1 + 48);
    block[4] = v2;
    block[5] = v5;
    block[6] = v3;
    dispatch_async(v4, block);
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2(uint64_t a1)
{
}

@end