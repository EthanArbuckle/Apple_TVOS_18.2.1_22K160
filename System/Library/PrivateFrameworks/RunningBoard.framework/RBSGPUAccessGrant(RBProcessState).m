@interface RBSGPUAccessGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSGPUAccessGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  unsigned int v4 = [a1 role];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x189612178], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end