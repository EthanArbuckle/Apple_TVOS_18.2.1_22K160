@interface RBSHereditaryGrant(RBProcessState)
- (id)effectiveAttributesWithContext:()RBProcessState;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSHereditaryGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke;
  v12[3] = &unk_18A256AA0;
  v12[4] = a1;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = a4;
  id v10 = v8;
  id v11 = v9;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v11, v12);
  [v11 popActiveDueToInheritedEndowment];
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke;
  v12[3] = &unk_18A256AA0;
  v12[4] = a1;
  id v13 = v8;
  id v14 = v9;
  uint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v10, v12);
  [v10 popActiveDueToInheritedEndowment];
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v8 = a3;
  id v9 = a5;
  [v9 pushActiveDueToInheritedEndowment];
  [v8 setHasHereditaryGrant:1];
  [a1 sourceEnvironment];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    [v8 sourceEnvironments];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v13];
  }

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke;
  v14[3] = &unk_18A256AA0;
  v14[4] = a1;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v11, v14);
  [v11 popActiveDueToInheritedEndowment];
}

- (id)effectiveAttributesWithContext:()RBProcessState
{
  id v4 = a3;
  [MEMORY[0x189603FE0] set];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 pushActiveDueToInheritedEndowment];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke;
  v11[3] = &unk_18A256AF0;
  v11[4] = a1;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v7, v11);
  [v6 addObject:a1];
  [v7 popActiveDueToInheritedEndowment];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v44[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 targetIsSystem])
  {
    if (a4)
    {
      id v7 = (void *)MEMORY[0x189607870];
      uint64_t v8 = *MEMORY[0x1896123E0];
      uint64_t v9 = *MEMORY[0x1896075F0];
      v44[0] = @"Hereditary grants may not target the system";
      uint64_t v10 = *MEMORY[0x1896123D8];
      v43[0] = v9;
      v43[1] = v10;
      [a1 description];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v11;
      id v12 = (void *)MEMORY[0x189603F68];
      id v13 = v44;
      id v14 = v43;
LABEL_18:
      [v12 dictionaryWithObjects:v13 forKeys:v14 count:2];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 errorWithDomain:v8 code:2 userInfo:v20];
      uint64_t v25 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }

  else
  {
    [v6 target];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 environment];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      [v6 originatorEntitlements];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [a1 encodedEndowment];
      if (v17
        && (v18 = (void *)v17, char v19 = [v11 hasEntitlementDomain:16], v18, (v19 & 1) == 0))
      {
        if (!a4)
        {
          uint64_t v25 = 0LL;
          goto LABEL_25;
        }

        v28 = (void *)MEMORY[0x189607870];
        uint64_t v29 = *MEMORY[0x1896123E0];
        uint64_t v30 = *MEMORY[0x1896075F0];
        v40[0] = @"Required client entitlement is missing";
        uint64_t v31 = *MEMORY[0x1896123D8];
        v39[0] = v30;
        v39[1] = v31;
        [a1 description];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v20;
        [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:2];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 errorWithDomain:v29 code:2 userInfo:v32];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        objc_msgSend(a1, "attributes", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (!v21)
        {
          uint64_t v25 = 1LL;
          goto LABEL_24;
        }

        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
LABEL_9:
        uint64_t v24 = 0LL;
        while (1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          if (![*(id *)(*((void *)&v34 + 1) + 8 * v24) isValidForContext:v6 withError:a4]) {
            break;
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
            uint64_t v25 = 1LL;
            if (v22) {
              goto LABEL_9;
            }
            goto LABEL_24;
          }
        }
      }

      uint64_t v25 = 0LL;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }

    if (a4)
    {
      id v7 = (void *)MEMORY[0x189607870];
      uint64_t v8 = *MEMORY[0x1896123E0];
      uint64_t v26 = *MEMORY[0x1896075F0];
      v42[0] = @"Hereditary grants must specify a target environment";
      uint64_t v27 = *MEMORY[0x1896123D8];
      v41[0] = v26;
      v41[1] = v27;
      [a1 description];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v11;
      id v12 = (void *)MEMORY[0x189603F68];
      id v13 = v42;
      id v14 = v41;
      goto LABEL_18;
    }
  }

  uint64_t v25 = 0LL;
LABEL_26:

  return v25;
}

@end