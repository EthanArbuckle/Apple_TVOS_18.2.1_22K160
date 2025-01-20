@interface LSUnregisterBundle
@end

@implementation LSUnregisterBundle

void ___LSUnregisterBundle_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _LSGetOSStatusFromNSError(v3);
}

void ___LSUnregisterBundle_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    int v7 = 0;
  }

  else
  {
    id v8 = v5;
    int v7 = _LSGetOSStatusFromNSError(v5);
    v6 = v8;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
}

@end