@interface RBSAttribute(RBProcessState)
+ (uint64_t)allowedForPrimitiveAttributeForProcessTarget:()RBProcessState withError:;
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)effectiveAttributesWithContext:()RBProcessState;
- (uint64_t)hasMandatoryAttributes:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (uint64_t)preventsSuspension;
@end

@implementation RBSAttribute(RBProcessState)

+ (uint64_t)allowedForPrimitiveAttributeForProcessTarget:()RBProcessState withError:
{
  v22[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (![v6 targetIsSystem])
  {
    [v6 originatorEntitlements];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v11 hasEntitlement:@"com.apple.runningboard.primitiveattribute"] & 1) != 0)
    {
      a4 = 1LL;
      goto LABEL_8;
    }

    if (!a4) {
      goto LABEL_8;
    }
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = *MEMORY[0x1896123E0];
    uint64_t v16 = *MEMORY[0x1896075F0];
    v20[0] = @"Required client entitlement is missing";
    uint64_t v17 = *MEMORY[0x1896123D8];
    v19[0] = v16;
    v19[1] = v17;
    [a1 description];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 errorWithDomain:v15 code:2 userInfo:v18];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    a4 = 0LL;
LABEL_8:

    goto LABEL_9;
  }

  if (a4)
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896123E0];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v22[0] = @"Attribute is not applicable to system target";
    uint64_t v10 = *MEMORY[0x1896123D8];
    v21[0] = v9;
    v21[1] = v10;
    [a1 description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:v8 code:2 userInfo:v12];
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }

- (uint64_t)effectiveAttributesWithContext:()RBProcessState
{
  return [MEMORY[0x189604010] setWithObject:a1];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return 1LL;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  return 1LL;
}

- (uint64_t)hasMandatoryAttributes:()RBProcessState error:
{
  return 1LL;
}

- (uint64_t)preventsSuspension
{
  return 0LL;
}

@end