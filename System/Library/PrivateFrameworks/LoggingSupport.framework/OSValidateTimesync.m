@interface OSValidateTimesync
@end

@implementation OSValidateTimesync

BOOL ___OSValidateTimesync_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _timesync_validate( *(unsigned int *)(a1 + 48),  a2,  0LL,  0LL);
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if ((v3 & 0x80000000) == 0) {
    return v3 != 0;
  }
  v5 = __error();
  BOOL result = 0LL;
  **(_DWORD **)(a1 + 40) = *v5;
  return result;
}

@end