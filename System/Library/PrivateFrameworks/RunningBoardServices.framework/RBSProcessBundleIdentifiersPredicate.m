@interface RBSProcessBundleIdentifiersPredicate
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessBundleIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (RBSProcessBundleIdentifiersPredicate)initWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessBundleIdentifiersPredicate

- (RBSProcessBundleIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Bundles.m", 132, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessBundleIdentifiersPredicate;
  v6 = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v5);

  return v6;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  [v4 identity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 embeddedApplicationIdentifier];
  if (v6)
  {
    v7 = (void *)v6;
  }

  else
  {
    [v4 bundle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 identifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_5;
    }
  }

  BOOL v9 = -[NSSet containsObject:](self->super._identifiers, "containsObject:", v7);

LABEL_5:
  return v9;
}

- (RBSProcessBundleIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"_identifiers"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___RBSProcessBundleIdentifiersPredicate;
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