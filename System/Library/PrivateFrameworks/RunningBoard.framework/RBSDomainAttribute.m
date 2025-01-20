@interface RBSDomainAttribute
- (uint64_t)_areAdditionalRestrictionsValidForContext:(void *)a3 withError:;
- (uint64_t)_areOriginatorEntitlementsValidForContext:(void *)a3 withError:;
- (uint64_t)_areTargetEntitlementsValidForContext:(void *)a3 withError:;
- (uint64_t)_contextContainsRequiredEndowment:(BOOL *)a3 requiresEndowment:;
- (uint64_t)_doesRestrictionAllowForContext:(uint64_t)a3 withError:;
@end

@implementation RBSDomainAttribute

- (uint64_t)_contextContainsRequiredEndowment:(BOOL *)a3 requiresEndowment:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  v6 = v5;
  if (!a1)
  {
    uint64_t v18 = 0LL;
    goto LABEL_21;
  }

  [v5 domainAttributeManager];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 domain];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 name];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 endowmentNamespaceForDomain:v8 andName:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v6 availableInheritances];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 allNamespaces];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 containsObject:v10];

    if (v13)
    {
      [v6 availableInheritances];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 sourceEnvironment];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 inheritancesForEnvironment:v15];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "endowmentNamespace", (void)v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            char v22 = [v10 isEqual:v21];

            if ((v22 & 1) != 0)
            {
              uint64_t v18 = 1LL;
              goto LABEL_17;
            }
          }

          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

void __80__RBSDomainAttribute_RBProcessState__applyToProcessState_attributePath_context___block_invoke( void *a1,  void *a2,  char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend(v7, "applyToProcessState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);
}

void __91__RBSDomainAttribute_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke( void *a1,  void *a2,  char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend( v7,  "applyToAssertionTransientState:attributePath:context:",  v5,  RBSAttributePathIncrement(v6, a3),  a1[5]);
}

void __93__RBSDomainAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke( void *a1,  void *a2,  char a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend( v7,  "applyToAssertionIntransientState:attributePath:context:",  v5,  RBSAttributePathIncrement(v6, a3),  a1[5]);
}

void __69__RBSDomainAttribute_RBProcessState__effectiveAttributesWithContext___block_invoke( uint64_t a1,  void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unionSet:v3];
}

uint64_t __64__RBSDomainAttribute_RBProcessState__applyToAcquisitionContext___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 applyToAcquisitionContext:*(void *)(a1 + 32)];
}

- (uint64_t)_areOriginatorEntitlementsValidForContext:(void *)a3 withError:
{
  v43[3] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
    uint64_t v32 = 0LL;
    goto LABEL_18;
  }

  [v5 domainAttributeManager];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 domain];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 name];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 endowmentNamespaceForDomain:v8 andName:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 sourceEnvironment];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {

    if (!v12)
    {
      if (a3)
      {
        int v13 = (void *)MEMORY[0x189607870];
        uint64_t v14 = *MEMORY[0x1896123E0];
        uint64_t v15 = *MEMORY[0x1896075F0];
        v43[0] = @"Domain attribute requires a source environment";
        uint64_t v16 = *MEMORY[0x1896123D8];
        v42[0] = v15;
        v42[1] = v16;
        [a1 description];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v17;
        v42[2] = *MEMORY[0x1896123F0];
        [a1 fullyQualifiedName];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v18;
        uint64_t v19 = (void *)MEMORY[0x189603F68];
        v20 = v43;
        v21 = v42;
LABEL_9:
        [v19 dictionaryWithObjects:v20 forKeys:v21 count:3];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v25 = v13;
        uint64_t v26 = v14;
        uint64_t v27 = 2LL;
        goto LABEL_14;
      }

      goto LABEL_19;
    }
  }

  else
  {

    if (v12)
    {
      if (a3)
      {
        int v13 = (void *)MEMORY[0x189607870];
        uint64_t v14 = *MEMORY[0x1896123E0];
        uint64_t v22 = *MEMORY[0x1896075F0];
        v41[0] = @"Domain attribute specifies a source environment when none is required";
        uint64_t v23 = *MEMORY[0x1896123D8];
        v40[0] = v22;
        v40[1] = v23;
        [a1 description];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v17;
        v40[2] = *MEMORY[0x1896123F0];
        [a1 fullyQualifiedName];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v18;
        uint64_t v19 = (void *)MEMORY[0x189603F68];
        v20 = v41;
        v21 = v40;
        goto LABEL_9;
      }

- (uint64_t)_areTargetEntitlementsValidForContext:(void *)a3 withError:
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 domainAttributeManager];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 domain];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 name];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 targetEntitlementsForDomain:v8 andName:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v6 targetEntitlements];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v10 matchesEntitlements:v11];

      if (a3 && (v12 & 1) == 0)
      {
        int v13 = (void *)MEMORY[0x189607870];
        uint64_t v14 = *MEMORY[0x1896123E0];
        uint64_t v15 = *MEMORY[0x1896075F0];
        v21[0] = @"Target is not running or required target entitlement is missing";
        uint64_t v16 = *MEMORY[0x1896123D8];
        v20[0] = v15;
        v20[1] = v16;
        [a1 description];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v17;
        [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 errorWithDomain:v14 code:3 userInfo:v18];
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v12 = 0LL;
      }
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (uint64_t)_areAdditionalRestrictionsValidForContext:(void *)a3 withError:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 domainAttributeManager];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 domain];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 name];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 additionalRestrictionsForDomain:v8 andName:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v42 = a1;
      v43 = a3;
      uint64_t v14 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v16, "isEqualToString:", @"TargetsSelf", v42))
          {
            [v6 targetIdentity];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v6 originatorProcess];
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 identity];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            char v20 = [v17 isEqual:v19];

            if ((v20 & 1) == 0)
            {
              uint64_t v29 = v43;
              if (v43)
              {
                id v25 = v11;
                v30 = (void *)MEMORY[0x189607870];
                uint64_t v31 = *MEMORY[0x1896123E0];
                uint64_t v32 = *MEMORY[0x1896075F0];
                v51[0] = @"This domain attribute can only target self";
                uint64_t v33 = *MEMORY[0x1896123D8];
                v50[0] = v32;
                v50[1] = v33;
                [v42 description];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                v51[1] = v34;
                uint64_t v35 = (void *)MEMORY[0x189603F68];
                uint64_t v36 = v51;
                v37 = v50;
LABEL_20:
                [v35 dictionaryWithObjects:v36 forKeys:v37 count:2];
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                [v30 errorWithDomain:v31 code:3 userInfo:v40];
                *uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();

                uint64_t v28 = 0LL;
                id v11 = v25;
                goto LABEL_22;
              }

- (uint64_t)_doesRestrictionAllowForContext:(uint64_t)a3 withError:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 domainAttributeManager];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 domain];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 name];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 restrictionsForDomain:v8 andName:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      uint64_t v11 = [v10 allowsContext:v6 withError:a3];
    }
    else {
      uint64_t v11 = 1LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

@end