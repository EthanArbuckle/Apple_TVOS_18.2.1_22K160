@interface RBSConditionAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToSystemState:()RBProcessState attributePath:context:;
@end

@implementation RBSConditionAttribute(RBProcessState)

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    [a1 condition];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upgradeCondition:toValue:", v4, objc_msgSend(a1, "value"));
  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v26[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (([v6 targetIsSystem] & 1) == 0)
  {
    if (!a4) {
      goto LABEL_8;
    }
    v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x1896123E0];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v26[0] = @"Attribute is not current supported for process target";
    uint64_t v12 = *MEMORY[0x1896123D8];
    v25[0] = v11;
    v25[1] = v12;
    [a1 description];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    uint64_t v16 = v10;
    uint64_t v17 = 2LL;
LABEL_7:
    [v15 errorWithDomain:v16 code:v17 userInfo:v14];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
    goto LABEL_8;
  }

  if (([v6 ignoreRestrictions] & 1) == 0)
  {
    [v6 originatorEntitlements];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    if ((v8 & 1) == 0)
    {
      if (!a4) {
        goto LABEL_8;
      }
      v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *MEMORY[0x1896123E0];
      uint64_t v21 = *MEMORY[0x1896075F0];
      v24[0] = @"Required client entitlement is missing";
      uint64_t v22 = *MEMORY[0x1896123D8];
      v23[0] = v21;
      v23[1] = v22;
      [a1 description];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      uint64_t v16 = v20;
      uint64_t v17 = 3LL;
      goto LABEL_7;
    }
  }

  a4 = 1LL;
LABEL_8:

  return a4;
}

@end