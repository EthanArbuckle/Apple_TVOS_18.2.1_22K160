@interface RBSResistTerminationGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSResistTerminationGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  uint64_t v4 = [a1 resistance];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x189612178], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end