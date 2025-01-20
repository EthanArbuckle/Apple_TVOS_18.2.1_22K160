@interface RBSEndowmentGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSEndowmentGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 targetIsSystem])
  {
    if (!a4)
    {
      uint64_t v13 = 0LL;
      goto LABEL_9;
    }

    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896123E0];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v24[0] = @"endowment grants cannot target the system";
    uint64_t v10 = *MEMORY[0x1896123D8];
    v23[0] = v9;
    v23[1] = v10;
    [a1 description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:v8 code:2 userInfo:v12];
    uint64_t v13 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v6 originatorEntitlements];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 hasEntitlementDomain:16];
    uint64_t v13 = v14;
    if (!a4 || (v14 & 1) != 0) {
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x1896123E0];
    uint64_t v17 = *MEMORY[0x1896075F0];
    v22[0] = @"Required client entitlement is missing";
    uint64_t v18 = *MEMORY[0x1896123D8];
    v21[0] = v17;
    v21[1] = v18;
    [a1 description];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:v16 code:2 userInfo:v19];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
LABEL_9:

  return v13;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v8 = (objc_class *)MEMORY[0x189612220];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc(v8);
  [a1 endowmentNamespace];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 target];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 environment];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 encodedEndowment];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 assertionID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  id v17 = (id)[v11 _initWithNamespace:v12 environment:v14 encodedEndowment:v15 originatingIdentifier:v16 attributePath:a4];
  [v10 addInheritance:v17];
}

@end