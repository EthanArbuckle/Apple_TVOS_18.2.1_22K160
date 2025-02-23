@interface RBSCPUAccessGrant(RBProcessState)
- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (uint64_t)preventsSuspension;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSCPUAccessGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  uint64_t v4 = [a1 role];
  [v5 setPreventSuspend:1];
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
  return objc_msgSend(MEMORY[0x189612178], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end