@interface RBSProcessIdentifiersPredicate
- (BOOL)matchesProcess:(id)a3;
- (NSSet)processIdentifiers;
- (RBSProcessIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (RBSProcessIdentifiersPredicate)initWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentifiersPredicate

- (RBSProcessIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Identifier.m", 89, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessIdentifiersPredicate;
  v6 = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v5);

  return v6;
}

- (NSSet)processIdentifiers
{
  return self->super._identifiers;
}

- (BOOL)matchesProcess:(id)a3
{
  identifiers = self->super._identifiers;
  [a3 instance];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifiers) = -[NSSet containsObject:](identifiers, "containsObject:", v5);

  return (char)identifiers;
}

- (RBSProcessIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"_identifiers"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___RBSProcessIdentifiersPredicate;
    self = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v6);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end