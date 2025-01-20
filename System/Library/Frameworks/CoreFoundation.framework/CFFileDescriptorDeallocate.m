@interface CFFileDescriptorDeallocate
@end

@implementation CFFileDescriptorDeallocate

void ____CFFileDescriptorDeallocate_block_invoke(void *a1)
{
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = *(_DWORD *)(a1[6] + 16LL) == 0;
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_DWORD *)(a1[6] + 16LL) = 1;
    __dmb(0xBu);
    v2 = (void *)a1[6];
    v3 = (dispatch_source_s *)v2[4];
    if (v3)
    {
      dispatch_source_cancel(v3);
      uint64_t v4 = a1[6];
      if (*(_BYTE *)(v4 + 48))
      {
        *(_BYTE *)(v4 + 48) = 0;
        dispatch_resume(*(dispatch_object_t *)(v4 + 32));
        uint64_t v4 = a1[6];
      }

      *(void *)(v4 + 32) = 0LL;
      v2 = (void *)a1[6];
    }

    v5 = (dispatch_source_s *)v2[5];
    if (v5)
    {
      dispatch_source_cancel(v5);
      uint64_t v6 = a1[6];
      if (*(_BYTE *)(v6 + 49))
      {
        *(_BYTE *)(v6 + 49) = 0;
        dispatch_resume(*(dispatch_object_t *)(v6 + 40));
        uint64_t v6 = a1[6];
      }

      *(void *)(v6 + 40) = 0LL;
      v2 = (void *)a1[6];
    }

    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = v2[7];
    *(void *)(a1[6] + 56LL) = 0LL;
    char v7 = atomic_load((unint64_t *)(a1[6] + 8LL));
    if ((v7 & 2) != 0)
    {
      shutdown(*(_DWORD *)(a1[6] + 20LL), 2);
      int v8 = open("/dev/null", 0);
      dup2(v8, *(_DWORD *)(a1[6] + 20LL));
      close(v8);
      close(*(_DWORD *)(a1[6] + 20LL));
    }

    *(_DWORD *)(a1[6] + 20LL) = -1;
  }

@end