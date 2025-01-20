@interface OSIsAncientArchive
@end

@implementation OSIsAncientArchive

uint64_t ___OSIsAncientArchive_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == a2 && *(_DWORD *)a2 == 4096 && *(void *)(a2 + 8) >= 0x88uLL) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = strcmp((const char *)(a2 + 104), "X619AP") == 0;
  }
  return 0LL;
}

@end