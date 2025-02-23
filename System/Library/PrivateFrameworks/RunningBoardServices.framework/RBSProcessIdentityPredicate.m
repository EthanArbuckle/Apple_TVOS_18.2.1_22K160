@interface RBSProcessIdentityPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessIdentityPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)initWithIdentity:(void *)a1;
@end

@implementation RBSProcessIdentityPredicate

- (void)initWithIdentity:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 handleFailureInMethod:sel_initWithIdentity_, a1, @"RBSProcessPredicate+Identity.m", 71, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
    }

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___RBSProcessIdentityPredicate;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v5 = [v4 copy];
      v6 = (void *)a1[1];
      a1[1] = v5;
    }
  }

  return a1;
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessIdentity matchesProcess:](self->_identity, "matchesProcess:", a3);
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSProcessIdentityPredicate;
  unint64_t v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[RBSProcessIdentity hash](self->_identity, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessIdentityPredicate *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      identity = self->_identity;
      if (v4) {
        v8 = v4->_identity;
      }
      else {
        v8 = 0LL;
      }
      objc_super v9 = v8;
      v10 = v9;
      if (identity == v9)
      {
        char v6 = 1;
      }

      else
      {
        if (identity) {
          BOOL v11 = v9 == 0LL;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11) {
          char v6 = 0;
        }
        else {
          char v6 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v9);
        }
      }
    }

    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_identity];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessIdentityPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessIdentityPredicate;
  uint64_t v5 = -[RBSProcessIdentityPredicate init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end