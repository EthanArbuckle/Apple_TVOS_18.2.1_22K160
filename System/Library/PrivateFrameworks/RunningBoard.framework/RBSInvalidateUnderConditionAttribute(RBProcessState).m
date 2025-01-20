@interface RBSInvalidateUnderConditionAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSInvalidateUnderConditionAttribute(RBProcessState)

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if (_os_feature_enabled_impl())
  {
    if ([v8 isActiveDueToInheritedEndowment])
    {
      rbs_assertion_log();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBSInvalidateUnderConditionAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1( v8,  v9);
      }
    }

    else
    {
      [v7 invalidatesOnConditions];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        [MEMORY[0x189603FC8] dictionary];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setInvalidatesOnConditions:v10];
      }

      [a1 condition];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKey:v11];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || (uint64_t v13 = [a1 minValue], v13 < objc_msgSend(v12, "integerValue")))
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(a1, "minValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [a1 condition];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setValue:v14 forKey:v15];
      }
    }
  }
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
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
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1( void *a1,  os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 assertion];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Not applying RBSMimicTaskSuspensionAttribute as it is not permitted as the subattribute of a hereditary grant for as sertion %{public}@",  (uint8_t *)&v4,  0xCu);
}

@end