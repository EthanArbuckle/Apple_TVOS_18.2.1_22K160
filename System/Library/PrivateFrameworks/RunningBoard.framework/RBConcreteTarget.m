@interface RBConcreteTarget
+ (id)systemTarget;
+ (id)targetWithIdentity:(id)a3 environment:(id)a4;
+ (id)targetWithProcess:(id)a3 environment:(id)a4;
- (BOOL)isSystem;
- (NSString)description;
- (NSString)environment;
- (RBProcess)process;
- (RBSProcessIdentity)identity;
- (id)createRBSTarget;
@end

@implementation RBConcreteTarget

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1) {
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_15);
  }
  return (id)systemTarget_systemTarget;
}

void __32__RBConcreteTarget_systemTarget__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RBConcreteTarget);
  v1 = (void *)systemTarget_systemTarget;
  systemTarget_systemTarget = (uint64_t)v0;
}

+ (id)targetWithProcess:(id)a3 environment:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = a4;
    v8 = objc_alloc(&OBJC_CLASS___RBComplexConcreteTarget);
    [v6 identity];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]((id *)&v8->super.super.isa, v6, v9, v7);
  }

  else
  {
    v10 = (id *)v5;
  }

  return v10;
}

+ (id)targetWithIdentity:(id)a3 environment:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = a4;
    v8 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]( (id *)objc_alloc(&OBJC_CLASS___RBComplexConcreteTarget),  0LL,  v6,  v7);
  }

  else
  {
    v8 = (id *)v5;
  }

  return v8;
}

- (BOOL)isSystem
{
  return 1;
}

- (id)createRBSTarget
{
  return (id)[MEMORY[0x189612388] systemTarget];
}

- (RBProcess)process
{
  return 0LL;
}

- (RBSProcessIdentity)identity
{
  return 0LL;
}

- (NSString)environment
{
  return 0LL;
}

- (NSString)description
{
  return (NSString *)@"system";
}

@end