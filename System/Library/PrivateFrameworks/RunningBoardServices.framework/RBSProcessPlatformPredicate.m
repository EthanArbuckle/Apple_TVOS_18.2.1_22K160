@interface RBSProcessPlatformPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessPlatformPredicate)initWithPlatform:(int)a3;
- (RBSProcessPlatformPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (int)platform;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessPlatformPredicate

- (RBSProcessPlatformPredicate)initWithPlatform:(int)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___RBSProcessPlatformPredicate;
    v4 = -[RBSProcessPlatformPredicate init](&v7, sel_init);
    if (v4) {
      v4->_platform = a3;
    }
    self = v4;
    v5 = self;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)matchesProcess:(id)a3
{
  return [a3 platform] == self->_platform;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessPlatformPredicate;
  return -[RBSProcessPredicateImpl hash](&v3, sel_hash) ^ self->_platform;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessPlatformPredicate *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_platform == v4->_platform;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %d>", v4, self->_platform];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessPlatformPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSProcessPlatformPredicate;
  uint64_t v5 = -[RBSProcessPlatformPredicate init](&v7, sel_init);
  if (v5) {
    v5->_platform = [v4 decodeInt64ForKey:@"_platform"];
  }

  return v5;
}

- (int)platform
{
  return self->_platform;
}

@end