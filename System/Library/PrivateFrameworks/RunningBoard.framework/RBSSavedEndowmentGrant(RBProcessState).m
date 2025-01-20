@interface RBSSavedEndowmentGrant(RBProcessState)
- (BOOL)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSSavedEndowmentGrant(RBProcessState)

- (BOOL)isValidForContext:()RBProcessState withError:
{
  v38[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (![v6 targetIsSystem])
  {
    [v6 originatorEntitlements];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v13 hasEntitlementDomain:16] & 1) != 0)
    {
      [v6 savedEndowments];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 key];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 objectForKey:v16];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = v17 != 0LL;

      if (!a4 || v17) {
        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x189607870];
      uint64_t v19 = *MEMORY[0x1896123E0];
      uint64_t v20 = *MEMORY[0x1896075F0];
      v34[0] = @"Can't find saved endowment for key";
      uint64_t v21 = *MEMORY[0x1896123D8];
      v33[0] = v20;
      v33[1] = v21;
      [a1 description];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 errorWithDomain:v19 code:2 userInfo:v23];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      rbs_general_log();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.2((uint64_t)v15, a1, v24);
      }
    }

    else
    {
      if (!a4)
      {
LABEL_5:
        BOOL v14 = 0LL;
LABEL_19:

        goto LABEL_20;
      }

      v25 = (void *)MEMORY[0x189607870];
      uint64_t v26 = *MEMORY[0x1896123E0];
      uint64_t v27 = *MEMORY[0x1896075F0];
      v36[0] = @"Required client entitlement is missing";
      uint64_t v28 = *MEMORY[0x1896123D8];
      v35[0] = v27;
      v35[1] = v28;
      [a1 description];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v29;
      [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:2];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 errorWithDomain:v26 code:3 userInfo:v30];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      rbs_general_log();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.3( (uint64_t)v13,  (os_log_s *)v15,  v31);
      }
    }

    BOOL v14 = 0LL;
LABEL_18:

    goto LABEL_19;
  }

  if (a4)
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896123E0];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v38[0] = @"endowment grants cannot target the system";
    uint64_t v10 = *MEMORY[0x1896123D8];
    v37[0] = v9;
    v37[1] = v10;
    [a1 description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:v8 code:2 userInfo:v12];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    rbs_general_log();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.1(v6, (os_log_s *)v13);
    }
    goto LABEL_5;
  }

  BOOL v14 = 0LL;
LABEL_20:

  return v14;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  [v9 savedEndowments];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 key];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKey:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v22 = v8;
    id v13 = objc_alloc(MEMORY[0x189612220]);
    [a1 endowmentNamespace];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 target];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 environment];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    RBSEndowmentEncode();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 assertionID];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (os_log_s *)[v13 _initWithNamespace:v14 environment:v16 encodedEndowment:v17 originatingIdentifier:v18 attributePath:a4];

    rbs_general_log();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl( &dword_188634000,  v20,  OS_LOG_TYPE_DEFAULT,  "Saved endowment grant adding inheritance %{public}@",  buf,  0xCu);
    }

    id v8 = v22;
    [v22 addInheritance:v19];
  }

  else
  {
    rbs_general_log();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBSSavedEndowmentGrant(RBProcessState) applyToProcessState:attributePath:context:].cold.1((uint64_t)a1, v19, v21);
    }
  }
}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 targetIdentifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138543362;
  id v6 = v3;
  OUTLINED_FUNCTION_0_3( &dword_188634000,  a2,  v4,  "endowment grants cannot target the system: %{public}@",  (uint8_t *)&v5);
}

- (void)isValidForContext:()RBProcessState withError:.cold.2( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a2 description];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl( &dword_188634000,  a3,  OS_LOG_TYPE_ERROR,  "Can't find saved endowment:%{public}@ for %{public}@",  (uint8_t *)&v6,  0x16u);
}

- (void)isValidForContext:()RBProcessState withError:.cold.3( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_188634000, a2, a3, "Required client entitlement is missing: %{public}@", (uint8_t *)&v3);
}

- (void)applyToProcessState:()RBProcessState attributePath:context:.cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3( &dword_188634000,  a2,  a3,  "Attempting to apply saved endowment grant with no corresponding saved endowment %{public}@",  (uint8_t *)&v3);
}

@end