@interface NSDictionary(MobileInstallationAdditions)
+ (id)MI_dictionaryByMergingDictionaries:()MobileInstallationAdditions;
+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:;
- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions format:error:;
- (uint64_t)MI_writeToURL:()MobileInstallationAdditions format:options:error:;
@end

@implementation NSDictionary(MobileInstallationAdditions)

+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:
{
  id v16 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:a3 options:2 error:&v16];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v16;
  if (v7)
  {
    id v15 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v7 options:a4 format:0 error:&v15];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v15;

    objc_opt_class();
    id v11 = v9;
    id v12 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v12 = v11;
    }

    if (v12)
    {
      id v13 = v11;
      id v8 = v10;
      id v11 = v13;
      if (!a5) {
        goto LABEL_12;
      }
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:2048 userInfo:0];
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      id v13 = 0LL;
      if (!a5) {
        goto LABEL_12;
      }
    }
  }

  else
  {
    id v13 = 0LL;
    id v11 = 0LL;
    if (!a5) {
      goto LABEL_12;
    }
  }

  if (!v13) {
    *a5 = v8;
  }
LABEL_12:

  return v13;
}

+ (id)MI_dictionaryByMergingDictionaries:()MobileInstallationAdditions
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  v4 = (void *)objc_opt_new();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", *(void *)(*((void *)&v12 + 1) + 8 * v9++), (void)v12);
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  id v10 = (void *)[v4 copy];
  return v10;
}

- (uint64_t)MI_writeToURL:()MobileInstallationAdditions format:options:error:
{
  id v10 = a3;
  id v18 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a1 format:a4 options:0 error:&v18];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v18;
  __int128 v13 = v12;
  if (v11)
  {
    id v17 = v12;
    uint64_t v14 = [v11 writeToURL:v10 options:a5 error:&v17];
    id v15 = v17;

    __int128 v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    if (!a6) {
      goto LABEL_7;
    }
  }

  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions format:error:
{
  id v8 = a3;
  id v16 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a1 format:a4 options:0 error:&v16];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    id v15 = v10;
    uint64_t v12 = objc_msgSend(v9, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:", v8, &v15);
    id v13 = v15;

    id v11 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if ((v12 & 1) == 0) {
    *a5 = v11;
  }
LABEL_7:

  return v12;
}

@end