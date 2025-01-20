@interface RBSHereditaryGrant
- (void)_withEndowmentFromContext:(void *)a3 block:;
@end

@implementation RBSHereditaryGrant

void __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x189612220]);
    [*(id *)(a1 + 32) endowmentNamespace];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) target];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 environment];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) assertionID];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)[v4 _initWithNamespace:v5 environment:v7 encodedEndowment:v3 originatingIdentifier:v8 attributePath:*(void *)(a1 + 56)];

    [*(id *)(a1 + 48) addInheritance:v9];
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * i),  "applyToProcessState:attributePath:context:",  *(void *)(a1 + 48),  RBSAttributePathIncrement(*(void *)(a1 + 56), v13 + i),  *(void *)(a1 + 40));
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v13 += i;
      }

      while (v12);
    }
  }
}

- (void)_withEndowmentFromContext:(void *)a3 block:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x1895C9F58]();
    [a1 encodedEndowment];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 assertionID];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      [a1 endowmentNamespace];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 availableInheritances];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 allNamespaces];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 containsObject:v10];

      if (v13)
      {
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        [a1 sourceEnvironment];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 inheritancesForEnvironment:v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v8)
        {
          v22 = v11;
          v23 = v7;
          id v24 = v5;
          uint64_t v16 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v15);
              }
              __int128 v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
              [v18 endowmentNamespace];
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
              int v20 = [v19 isEqual:v10];

              if (v20)
              {
                [v18 encodedEndowment];
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v21 = [v18 originatingIdentifier];

                v9 = (void *)v21;
                goto LABEL_15;
              }
            }

            v8 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v8) {
              continue;
            }
            break;
          }

void __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * i),  "applyToAssertionTransientState:attributePath:context:",  *(void *)(a1 + 40),  RBSAttributePathIncrement(*(void *)(a1 + 56), v6 + i),  *(void *)(a1 + 48));
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        v6 += i;
      }

      while (v5);
    }
  }

void __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * i),  "applyToAssertionIntransientState:attributePath:context:",  *(void *)(a1 + 40),  RBSAttributePathIncrement(*(void *)(a1 + 56), v6 + i),  *(void *)(a1 + 48));
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        v6 += i;
      }

      while (v5);
    }
  }

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke( id *a1,  uint64_t a2)
{
  if (a2)
  {
    [a1[4] attributes];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2;
    v4[3] = &unk_18A256AC8;
    id v5 = a1[5];
    id v6 = a1[6];
    [v3 enumerateObjectsUsingBlock:v4];
  }

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2( uint64_t a1,  void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unionSet:v3];
}

@end