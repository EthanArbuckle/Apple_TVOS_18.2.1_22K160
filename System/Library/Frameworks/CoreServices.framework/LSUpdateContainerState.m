@interface LSUpdateContainerState
@end

@implementation LSUpdateContainerState

void ___LSUpdateContainerState_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 52LL);
  if (v1) {
    _LSContainerSetMounted(*(void **)(a1 + 32), *(_DWORD *)(a1 + 48), v1);
  }
  else {
    _CSStoreWriteToUnit();
  }
}

uint64_t ___LSUpdateContainerState_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void ___LSUpdateContainerState_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _LSGetOSStatusFromNSError(v3);
}

void ___LSUpdateContainerState_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _LSGetOSStatusFromNSError(v5);
    uint64_t v6 = a1 + 32;
    goto LABEL_5;
  }

  uint64_t v6 = a1 + 32;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  if ([v7 length] != 20)
  {
LABEL_5:
    *(_DWORD *)(*(void *)(*(void *)v6 + 8LL) + 24LL) = -10817;
    goto LABEL_6;
  }

  objc_msgSend(v7, "getBytes:range:", *(void *)(*(void *)(a1 + 40) + 8) + 48, 0, 20);
LABEL_6:
}

@end