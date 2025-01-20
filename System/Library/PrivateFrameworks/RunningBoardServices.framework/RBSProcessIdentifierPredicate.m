@interface RBSProcessIdentifierPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessIdentifier)identifier;
- (RBSProcessIdentifierPredicate)initWithIdentifier:(id)a3;
- (RBSProcessIdentifierPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentifierPredicate

- (RBSProcessIdentifierPredicate)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Identifier.m", 27, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessIdentifierPredicate;
  v7 = -[RBSProcessIdentifierPredicate init](&v11, sel_init);
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_identifier, a3);
  }

  return v8;
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessIdentifier matchesProcess:](self->_identifier, "matchesProcess:", a3);
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSProcessIdentifierPredicate;
  unint64_t v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[RBSProcessIdentifier hash](self->_identifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessIdentifierPredicate *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  identifier = self->_identifier;
  v8 = v4->_identifier;
  if (identifier == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }

  if (identifier) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[RBSProcessIdentifier isEqual:](identifier, "isEqual:");
    goto LABEL_11;
  }

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_identifier];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessIdentifierPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessIdentifierPredicate;
  uint64_t v5 = -[RBSProcessIdentifierPredicate init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (RBSProcessIdentifier *)v6;
  }

  return v5;
}

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end