@interface OSLogIndexFile
@end

@implementation OSLogIndexFile

uint64_t __50___OSLogIndexFile__loadCatalogMetadataForTimespan__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 24587)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 48) != -1LL) {
      _catalog_lite_read_limits(a2, v2 + 56, v2 + 64);
    }
  }

  else if (*(_DWORD *)a2 == 4096)
  {
    *(void *)(*(void *)(a1 + 32) + 48LL) = *(void *)(a2 + 64);
  }

  return 1LL;
}

BOOL __39___OSLogIndexFile__loadHeaderMetadata___block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  int v2 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 4096 && *((void *)a2 + 1) >= 0xA8uLL)
  {
    uuid_copy((unsigned __int8 *)(*(void *)(a1 + 32) + 24LL), a2 + 144);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return v2 != 4096;
}

@end