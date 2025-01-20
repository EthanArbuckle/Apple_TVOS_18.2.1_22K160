@interface LSCopyClaimedActivityIdentifiersAndDomains
@end

@implementation LSCopyClaimedActivityIdentifiersAndDomains

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  CFSetRef v6 = _LSBundleCopyUserActivityTypes(**(void ***)(a1 + 48), a2, a3);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v7 = v6;
  uint64_t v8 = -[__CFSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        CFSetAddValue( *(CFMutableSetRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  *(const void **)(*((void *)&v20 + 1) + 8 * v10++));
      }

      while (v8 != v10);
      uint64_t v8 = -[__CFSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v8);
  }

  CFSetRef v11 = _LSBundleCopyUserActivityDomainNames(**(void **)(a1 + 48), a2, a3);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v12 = v11;
  uint64_t v13 = -[__CFSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        CFSetAddValue( *(CFMutableSetRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(const void **)(*((void *)&v16 + 1) + 8 * v15++));
      }

      while (v13 != v15);
      uint64_t v13 = -[__CFSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v13);
  }
}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _LSGetOSStatusFromNSError(v3);
}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11 && v7)
  {
    id v9 = (id)[v11 mutableCopy];
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v9;

    id v10 = (id)[v7 mutableCopy];
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = v10;
  }

  else
  {
    *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = _LSGetOSStatusFromNSError(v8);
  }
}

@end