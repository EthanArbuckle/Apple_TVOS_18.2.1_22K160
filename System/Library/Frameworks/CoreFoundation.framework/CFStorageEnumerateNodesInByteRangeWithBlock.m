@interface CFStorageEnumerateNodesInByteRangeWithBlock
@end

@implementation CFStorageEnumerateNodesInByteRangeWithBlock

void *____CFStorageEnumerateNodesInByteRangeWithBlock_block_invoke(void *result, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(result[5] + 8LL) + 24LL))
  {
    v2 = result;
    uint64_t v3 = result[6];
    if (*(uint64_t *)(v3 + 16 * a2 + 8) >= 1)
    {
      uint64_t v4 = *(void *)(result[10] + 8 * a2);
      result = (void *)__CFStorageEnumerateNodesInByteRangeWithBlock( result[7],  *(void *)(result[8] + 8 * a2),  v4 + result[9],  *(void *)(v3 + 16 * a2) - v4);
      if ((_DWORD)result) {
        *(_BYTE *)(*(void *)(v2[5] + 8LL) + 24LL) = 1;
      }
    }
  }

  return result;
}

@end