@interface RBSTagAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSTagAttribute(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  [a1 tag];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addTag:v5];
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  [a1 tag];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addTag:v5];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v4 = a3;
  [a1 tag];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addTag:v5];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 ignoreRestrictions])
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    [v6 originatorEntitlements];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v8 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    if (a4 && (v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x189607870];
      uint64_t v10 = *MEMORY[0x1896123E0];
      uint64_t v11 = *MEMORY[0x1896075F0];
      v17[0] = @"Required client entitlement is missing";
      uint64_t v12 = *MEMORY[0x1896123D8];
      v16[0] = v11;
      v16[1] = v12;
      [a1 description];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:2];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 errorWithDomain:v10 code:2 userInfo:v14];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v7 = 0LL;
    }
  }

  return v7;
}

@end