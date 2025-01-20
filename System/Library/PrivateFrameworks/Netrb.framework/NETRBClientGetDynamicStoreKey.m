@interface NETRBClientGetDynamicStoreKey
@end

@implementation NETRBClientGetDynamicStoreKey

uint64_t ___NETRBClientGetDynamicStoreKey_block_invoke(uint64_t a1)
{
  uint64_t result = __NETRBClientValidateClient(*(_BYTE **)(a1 + 40));
  if ((_DWORD)result) {
    return NETRBErrorLog();
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  return result;
}

@end