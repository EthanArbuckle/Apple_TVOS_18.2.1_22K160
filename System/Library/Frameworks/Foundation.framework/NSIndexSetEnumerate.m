@interface NSIndexSetEnumerate
@end

@implementation NSIndexSetEnumerate

uint64_t ____NSIndexSetEnumerate_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL));
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 72);
    unint64_t v5 = *(void *)(result + 64) + v4 * a2;
    unint64_t v6 = v4 + v5 - 1;
    if (v6 >= *(void *)(result + 80)) {
      unint64_t v7 = *(void *)(result + 80);
    }
    else {
      unint64_t v7 = v6;
    }
    result = __NSIndexSetChunkIterate( *(void **)(result + 32),  *(void *)(result + 88),  v5,  v7,  *(void *)(result + 96),  *(void *)(result + 104),  *(void *)(result + 40),  (unint64_t *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL));
    atomic_store(result, (unsigned __int8 *)(*(void *)(*(void *)(v3 + 48) + 8LL) + 24LL));
  }

  return result;
}

@end