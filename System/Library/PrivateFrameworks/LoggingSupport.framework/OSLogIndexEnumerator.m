@interface OSLogIndexEnumerator
@end

@implementation OSLogIndexEnumerator

uint64_t __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke( void *a1,  uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  if (!*(_BYTE *)(v3 + 24))
  {
    if (*(_DWORD *)a2 == 1)
    {
      if (*(void *)(a2 + 64)) {
        return 1LL;
      }
    }

    else if ((*(_DWORD *)a2 - 1) >= 2)
    {
      *(_BYTE *)(v3 + 24) = 1;
    }
  }

  if (((*(uint64_t (**)(void))(a1[4] + 16LL))() & 1) == 0)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
    return result;
  }

  return 1LL;
}

@end