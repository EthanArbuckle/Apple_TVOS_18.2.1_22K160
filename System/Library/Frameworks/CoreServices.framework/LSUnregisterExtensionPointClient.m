@interface LSUnregisterExtensionPointClient
@end

@implementation LSUnregisterExtensionPointClient

uint64_t ___LSUnregisterExtensionPointClient_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = _LSGetOSStatusFromNSError(a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t ___LSUnregisterExtensionPointClient_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) != 0) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = _LSGetOSStatusFromNSError(a3);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end