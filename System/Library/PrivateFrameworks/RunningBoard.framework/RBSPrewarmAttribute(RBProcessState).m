@interface RBSPrewarmAttribute(RBProcessState)
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSPrewarmAttribute(RBProcessState)

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return [a3 setInvalidatesSynchronously:1];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  [a1 identity];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 interval];
  objc_msgSend(v4, "prewarmIdentity:withInterval:", v5);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 target];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isSystem];

  if ((v8 & 1) != 0)
  {
    [v6 originatorEntitlements];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v9 hasEntitlement:@"com.apple.runningboard.launchprocess"] & 1) != 0)
    {
      a4 = 1LL;
LABEL_8:

      goto LABEL_9;
    }

    if (!a4) {
      goto LABEL_8;
    }
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = *MEMORY[0x1896123E0];
    uint64_t v18 = *MEMORY[0x1896075F0];
    v22[0] = @"Required client entitlement is missing for attribute";
    uint64_t v19 = *MEMORY[0x1896123D8];
    v21[0] = v18;
    v21[1] = v19;
    [a1 description];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:v17 code:2 userInfo:v20];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a4 = 0LL;
    goto LABEL_8;
  }

  if (a4)
  {
    v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896123E0];
    uint64_t v12 = *MEMORY[0x1896075F0];
    v24[0] = @"Prewarm attribute must target system";
    uint64_t v13 = *MEMORY[0x1896123D8];
    v23[0] = v12;
    v23[1] = v13;
    [a1 description];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:v11 code:2 userInfo:v14];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 1LL;
  }

  else if (a4)
  {
    [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x1896123E0];
    uint64_t v12 = *MEMORY[0x1896075F0];
    v13[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:v10 code:2 userInfo:v11];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

@end