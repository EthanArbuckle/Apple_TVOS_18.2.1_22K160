@interface RBSPersistentAttribute(RBProcessState)
- (uint64_t)applyToAcquisitionContext:()RBProcessState;
- (unint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSPersistentAttribute(RBProcessState)

- (unint64_t)isValidForContext:()RBProcessState withError:
{
  v28[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 ignoreRestrictions])
  {
    BOOL v7 = a4 == 0LL;
    LODWORD(v8) = 1;
  }

  else
  {
    [v6 originatorEntitlements];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = [v9 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];

    BOOL v7 = a4 == 0LL;
    if (a4 && (v8 & 1) == 0)
    {
      unint64_t v8 = MEMORY[0x189607870];
      uint64_t v10 = *MEMORY[0x1896123E0];
      uint64_t v11 = *MEMORY[0x1896075F0];
      v28[0] = @"Required client entitlement is missing";
      uint64_t v12 = *MEMORY[0x1896123D8];
      v27[0] = v11;
      v27[1] = v12;
      [a1 description];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:2];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v8 errorWithDomain:v10 code:2 userInfo:v14];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v7 = 0;
      LODWORD(v8) = 0;
    }
  }

  [v6 assertionDescriptor];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 target];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 processIdentity];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17) {
    unint64_t v8 = v8;
  }
  else {
    unint64_t v8 = 0LL;
  }
  if (!v7 && !v17)
  {
    v18 = (void *)MEMORY[0x189607870];
    uint64_t v19 = *MEMORY[0x1896123E0];
    uint64_t v20 = *MEMORY[0x1896075F0];
    v26[0] = @"Persistent attributes must target a process identity";
    uint64_t v21 = *MEMORY[0x1896123D8];
    v25[0] = v20;
    v25[1] = v21;
    [a1 description];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 errorWithDomain:v19 code:2 userInfo:v23];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v8 = 0LL;
  }

  return v8;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v6 = a3;
  id v7 = a5;
  if ([v7 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSPersistentAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7, v8);
    }
  }

  else
  {
    [v6 setIsPersistent:1];
  }
}

- (uint64_t)applyToAcquisitionContext:()RBProcessState
{
  return [a3 setAllowAbstractTarget:1];
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1( void *a1,  os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 assertion];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Not applying RBSPersistentAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@",  (uint8_t *)&v4,  0xCu);
}

@end