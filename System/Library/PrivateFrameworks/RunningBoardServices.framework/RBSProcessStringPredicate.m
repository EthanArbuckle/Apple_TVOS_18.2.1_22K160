@interface RBSProcessStringPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)identifier;
- (RBSProcessStringPredicate)initWithIdentifier:(id)a3;
- (RBSProcessStringPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessStringPredicate

- (RBSProcessStringPredicate)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate.m", 242, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessStringPredicate;
  v6 = -[RBSProcessStringPredicate init](&v11, sel_init);
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;
  }

  return v6;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSProcessStringPredicate;
  unint64_t v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessStringPredicate *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      identifier = self->_identifier;
      uint64_t v8 = -[RBSProcessStringPredicate identifier](v4, "identifier");
      v9 = (void *)v8;
      if (identifier == (NSString *)v8)
      {
        char v6 = 1;
      }

      else
      {
        if (identifier) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          char v6 = 0;
        }
        else {
          char v6 = -[NSString isEqual:](identifier, "isEqual:", v8);
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
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ %@>", v4, self->_identifier];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessStringPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessStringPredicate;
  uint64_t v5 = -[RBSProcessStringPredicate init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (BOOL)matchesProcess:(id)a3
{
  return result;
}

@end