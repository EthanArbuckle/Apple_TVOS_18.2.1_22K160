@interface NSConvertReadStreamToBytes
@end

@implementation NSConvertReadStreamToBytes

void ___NSConvertReadStreamToBytes_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (a2) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DD0], a2);
  }
  *a3 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
}

@end