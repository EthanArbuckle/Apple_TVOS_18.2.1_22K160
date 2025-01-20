@interface UTDynamicEnumerateTagsFoundInDatabase
@end

@implementation UTDynamicEnumerateTagsFoundInDatabase

void ___UTDynamicEnumerateTagsFoundInDatabase_block_invoke( uint64_t a1,  const __CFString *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (_LSDatabaseGetStringForCFString(*(void **)(a1 + 32), a2, 1))
  {
    int v8 = UTTypeConformsTo(a2, @"public.case-insensitive-text");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = a3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      BOOL v12 = v8 != 0;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (_LSDatabaseGetStringForCFString( *(void **)(a1 + 32),  *(const __CFString **)(*((void *)&v14 + 1) + 8 * v13),  v12))
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
            *a4 = 0;
          }

          ++v13;
        }

        while (v10 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }
  }

@end