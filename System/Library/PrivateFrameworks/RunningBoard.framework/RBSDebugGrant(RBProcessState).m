@interface RBSDebugGrant(RBProcessState)
- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (uint64_t)preventsSuspension;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSDebugGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v3 = a3;
  [v3 setIsBeingDebugged:1];
  [v3 setPreventSuspend:1];
}

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return [a3 setPreventsSuspension:1];
}

- (uint64_t)preventsSuspension
{
  return 1LL;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (![v6 targetIsSystem])
  {
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v6 originatorEntitlements],
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 hasEntitlementDomain:8],
          v16,
          (v17 & 1) != 0))
    {
      a4 = 1LL;
      goto LABEL_8;
    }

    if (!a4) {
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896123E0];
    uint64_t v19 = *MEMORY[0x1896075F0];
    v22[0] = @"Required client entitlement is missing";
    uint64_t v20 = *MEMORY[0x1896123D8];
    v21[0] = v19;
    v21[1] = v20;
    [a1 description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    v12 = (void *)MEMORY[0x189603F68];
    v13 = v22;
    v14 = v21;
    goto LABEL_4;
  }

  if (a4)
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896123E0];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v24[0] = @"Attribute is not applicable to system target";
    uint64_t v10 = *MEMORY[0x1896123D8];
    v23[0] = v9;
    v23[1] = v10;
    [a1 description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    v12 = (void *)MEMORY[0x189603F68];
    v13 = v24;
    v14 = v23;
LABEL_4:
    [v12 dictionaryWithObjects:v13 forKeys:v14 count:2];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:v8 code:2 userInfo:v15];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

@end