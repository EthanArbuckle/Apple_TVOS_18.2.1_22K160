@interface RBSProcessIdentity(RBConcreteTargeting)
- (uint64_t)createRBSTarget;
- (uint64_t)environment;
- (uint64_t)isSystem;
- (uint64_t)process;
@end

@implementation RBSProcessIdentity(RBConcreteTargeting)

- (uint64_t)process
{
  return 0LL;
}

- (uint64_t)environment
{
  return 0LL;
}

- (uint64_t)isSystem
{
  return 0LL;
}

- (uint64_t)createRBSTarget
{
  return [MEMORY[0x189612388] targetWithProcessIdentity:a1];
}

@end