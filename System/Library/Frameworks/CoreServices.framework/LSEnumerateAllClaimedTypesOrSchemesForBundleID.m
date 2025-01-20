@interface LSEnumerateAllClaimedTypesOrSchemesForBundleID
@end

@implementation LSEnumerateAllClaimedTypesOrSchemesForBundleID

void ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSClaimGet();
  if (v2)
  {
    uint64_t v3 = v2;
    if ((*(_DWORD *)(a1 + 48) & *(unsigned __int16 *)(v2 + 14)) != 0)
    {
      if (*(_DWORD *)(v2 + 68))
      {
        uint64_t v4 = MEMORY[0x1895F87A8];
        if (!*(_BYTE *)(a1 + 52)) {
          goto LABEL_7;
        }
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2;
        v10[3] = &unk_189D74CE0;
        uint64_t v5 = *(void *)(a1 + 40);
        id v11 = *(id *)(a1 + 32);
        uint64_t v12 = v3;
        _LSEnumerateClaimedTypes(v5, v3, v10);

        if (!*(_BYTE *)(a1 + 52))
        {
LABEL_7:
          v7[0] = v4;
          v7[1] = 3221225472LL;
          v7[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3;
          v7[3] = &unk_189D74CE0;
          uint64_t v6 = *(void *)(a1 + 40);
          id v8 = *(id *)(a1 + 32);
          uint64_t v9 = v3;
          _LSEnumerateClaimedSchemes(v6, v3, v7);
        }
      }
    }
  }

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2,  *(void *)(a1 + 40));
}

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2,  *(void *)(a1 + 40));
}

@end