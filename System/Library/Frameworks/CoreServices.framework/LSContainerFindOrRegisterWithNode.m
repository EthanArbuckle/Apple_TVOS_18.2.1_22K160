@interface LSContainerFindOrRegisterWithNode
@end

@implementation LSContainerFindOrRegisterWithNode

void ___LSContainerFindOrRegisterWithNode_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
    char v7 = 1;
  }

  else
  {
    char v7 = *(_BYTE *)(a1 + 56);
    if (v7)
    {
      id v8 = v6;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
      id v6 = v8;
      char v7 = 0;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v7;
}

@end