@interface RBSProcessCollectionPredicateImpl
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessCollectionPredicateImpl)initWithIdentifiers:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessCollectionPredicateImpl

- (RBSProcessCollectionPredicateImpl)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate.m", 361, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessCollectionPredicateImpl;
  v6 = -[RBSProcessCollectionPredicateImpl init](&v11, sel_init);
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSSet *)v7;
  }

  return v6;
}

- (BOOL)matchesProcess:(id)a3
{
  return 0;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_identifiers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessCollectionPredicateImpl *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  identifiers = self->_identifiers;
  v8 = v4->_identifiers;
  if (identifiers == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }

  if (identifiers) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSSet isEqual:](identifiers, "isEqual:");
    goto LABEL_11;
  }

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_identifiers];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end