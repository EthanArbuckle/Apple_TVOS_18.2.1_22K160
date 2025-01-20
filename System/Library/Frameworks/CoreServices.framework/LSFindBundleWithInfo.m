@interface LSFindBundleWithInfo
@end

@implementation LSFindBundleWithInfo

uint64_t ___LSFindBundleWithInfo_NoIOFiltered_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_DWORD *)(a3 + 12))
  {
    v5 = (void *)result;
    if (*(void *)(a3 + 280) == *(void *)(result + 56))
    {
      int v6 = a2;
      result = *(void *)(result + 32);
      if (!result
        || (result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(result + 16))(result, v5[8], a2, a3),
            (_DWORD)result))
      {
        *(_DWORD *)(*(void *)(v5[5] + 8LL) + 24LL) = v6;
        *(_BYTE *)(*(void *)(v5[6] + 8LL) + 24LL) = 1;
        *a4 = 1;
      }
    }
  }

  return result;
}

@end