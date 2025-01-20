@interface RBSAttribute
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSAttribute)init;
- (RBSAttribute)initWithRBSXPCCoder:(id)a3;
- (id)_init;
@end

@implementation RBSAttribute

- (RBSAttribute)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAttribute.m" lineNumber:17 description:@"-init is not allowed on RBSAttribute"];

  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (NSString)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSAttribute)initWithRBSXPCCoder:(id)a3
{
  uint64_t v3 = self;
  if (-[RBSAttribute isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    rbs_assertion_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[RBSAttribute initWithRBSXPCCoder:].cold.1(v4);
    }

    v5 = 0LL;
  }

  else
  {
    uint64_t v3 = (RBSAttribute *)-[RBSAttribute _init](v3, "_init");
    v5 = v3;
  }

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSAttribute;
  return -[RBSAttribute init](&v3, sel_init);
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_185F67000,  log,  OS_LOG_TYPE_FAULT,  "RBSAttribute initialized without valid subclass",  v1,  2u);
}

@end