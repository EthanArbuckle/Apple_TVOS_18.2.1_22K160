@interface OSRepairTimesync
@end

@implementation OSRepairTimesync

BOOL ___OSRepairTimesync_block_invoke(uint64_t a1, const char *a2)
{
  int v3 = _timesync_repair(*(_DWORD *)(a1 + 48), a2, (uint64_t)&__block_literal_global_1564);
  if (v3 < 0)
  {
    **(_DWORD **)(a1 + 40) = *__error();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  return v3 >= 0;
}

@end