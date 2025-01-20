@interface NSOQOpFinished
@end

@implementation NSOQOpFinished

void ____NSOQOpFinished_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  LODWORD(v2) = atomic_load((unsigned __int8 *)(v2 + 237));
  if ((_DWORD)v2 == 244)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = v4;
    if (!v4) {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(void *)(v5 + 16) = v3;
    if (v3) {
      v6 = (void *)(v3 + 8);
    }
    else {
      v6 = (void *)(*(void *)(a1 + 32) + 24LL);
    }
    void *v6 = v4;
    if (*(unsigned __int8 *)(a1 + 48) >= 0x88u)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(_DWORD *)(v7 + 172);
      BOOL v9 = __OFSUB__(v8, 1);
      int v10 = v8 - 1;
      if (v10 < 0 == v9) {
        *(_DWORD *)(v7 + 172) = v10;
      }
    }

    *(void *)(*(void *)(a1 + 40) + 8LL) = 0LL;
    *(void *)(*(void *)(a1 + 40) + 16LL) = 0LL;
    op_invalidate_queue_and_schedule_locked(*(void *)(a1 + 40));
  }

  if (!*(_BYTE *)(a1 + 49))
  {
    v11 = (unint64_t *)(*(void *)(a1 + 32) + 144LL);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 - 1, v11));
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

@end