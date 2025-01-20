@interface RBSPreventIdleSleepGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSPreventIdleSleepGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v6 = a5;
  id v7 = a3;
  [v7 setPreventIdleSleep:1];
  v8 = (void *)NSString;
  [v6 assertionID];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v6 assertion];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 explanation];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@:%@", v12, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addPreventIdleSleepIdentifier:v11];
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v6 = a5;
  id v7 = a3;
  [v7 setPreventIdleSleep:1];
  v8 = (void *)NSString;
  [v6 assertionID];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v6 assertion];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 explanation];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@:%@", v12, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addPreventIdleSleepIdentifier:v11];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 originatorEntitlements];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v6 ignoreRestrictions];

  if ((v8 & 1) != 0
    || ([v7 hasEntitlement:@"com.apple.runningboard.primitiveattribute"] & 1) != 0)
  {
    a4 = 1LL;
  }

  else if (a4)
  {
    v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896123E0];
    uint64_t v12 = *MEMORY[0x1896075F0];
    v17[0] = @"Required client entitlement is missing";
    uint64_t v13 = *MEMORY[0x1896123D8];
    v16[0] = v12;
    v16[1] = v13;
    [a1 description];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:v11 code:2 userInfo:v15];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

@end