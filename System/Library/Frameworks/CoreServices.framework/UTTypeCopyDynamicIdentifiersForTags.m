@interface UTTypeCopyDynamicIdentifiersForTags
@end

@implementation UTTypeCopyDynamicIdentifiersForTags

void ___UTTypeCopyDynamicIdentifiersForTags_block_invoke(uint64_t a1, const __CFString *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        DynamicIdentifierForTag = (__CFString *)_UTTypeCreateDynamicIdentifierForTag( 0LL,  a2,  *(const __CFString **)(*((void *)&v10 + 1) + 8 * v8),  *(const __CFString **)(a1 + 40));
        if (DynamicIdentifierForTag) {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", DynamicIdentifierForTag, (void)v10);
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

@end