@interface RBSDefineRelativeStartTimeGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (uint64_t)preventsSuspension;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSDefineRelativeStartTimeGrant(RBProcessState)

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v6 = a3;
  id v7 = a5;
  if ([v7 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSDefineRelativeStartTimeGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7);
    }
  }

  else
  {
    [v6 setDefinesRelativeStartTime:1];
    [v6 setPreventsSuspension:1];
  }
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v6 = a3;
  id v7 = a5;
  if ([v7 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSDefineRelativeStartTimeGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7);
    }
  }

  else
  {
    [v6 setPreventSuspend:1];
  }
}

- (uint64_t)preventsSuspension
{
  return 1LL;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x189612178], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1( void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0( &dword_188634000,  v2,  v3,  "Not applying RBSDefineRelativeStartTimeGrant as it is not permitted as the subattribute of a hereditary grant for as sertion %{public}@",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_1();
}

@end