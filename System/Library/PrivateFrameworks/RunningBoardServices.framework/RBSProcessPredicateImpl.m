@interface RBSProcessPredicateImpl
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)matchesProcess:(id)a3;
- (NSString)description;
- (id)processIdentifier;
- (id)processIdentifiers;
- (id)processPredicate;
- (unint64_t)hash;
@end

@implementation RBSProcessPredicateImpl

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (NSString)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  return [(id)objc_opt_class() hash];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (id)processIdentifier
{
  id v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v3 = v2;
  }
  else {
    v3 = 0LL;
  }
  v4 = v3;
  v5 = -[RBSProcessPredicateImpl identifier](v4, "identifier");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    v8 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
    v10 = v9;
    v11 = -[RBSProcessPredicateImpl processIdentifier](v10, "processIdentifier");
    v12 = v11;
    if (v11)
    {
      id v7 = v11;
    }

    else
    {
      v13 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v14 = v13;
      }
      else {
        v14 = 0LL;
      }
      v15 = v14;
      v16 = -[RBSProcessPredicateImpl processIdentifier](v15, "processIdentifier");
      v17 = v16;
      if (v16)
      {
        id v7 = v16;
      }

      else
      {
        v18 = v13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          v19 = v18;
        }
        else {
          v19 = 0LL;
        }
        v20 = v19;
        v21 = -[RBSProcessPredicateImpl processIdentifier](v20, "processIdentifier");
        v22 = v21;
        if (v21)
        {
          id v7 = v21;
        }

        else
        {
          v23 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            v24 = v23;
          }
          else {
            v24 = 0LL;
          }
          v25 = v24;

          -[RBSProcessPredicateImpl processIdentifier](v25, "processIdentifier");
          id v7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v7;
}

- (id)processIdentifiers
{
  id v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v3 = v2;
  }
  else {
    v3 = 0LL;
  }
  v4 = v3;

  uint64_t v5 = -[RBSProcessPredicateImpl processIdentifiers](v4, "processIdentifiers");
  if (v5)
  {
    id v6 = (id)v5;
LABEL_6:

    return v6;
  }

  id v7 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }
  v9 = v8;
  v10 = -[RBSProcessPredicateImpl processIdentifiers](v9, "processIdentifiers");
  v11 = v10;
  if (v10)
  {
    id v6 = v10;
  }

  else
  {
    v12 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v13 = v12;
    }
    else {
      v13 = 0LL;
    }
    v14 = v13;
    v15 = -[RBSProcessPredicateImpl processIdentifiers](v14, "processIdentifiers");
    v16 = v15;
    if (v15)
    {
      id v6 = v15;
    }

    else
    {
      v17 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v18 = v17;
      }
      else {
        v18 = 0LL;
      }
      v19 = v18;

      -[RBSProcessPredicateImpl processIdentifiers](v19, "processIdentifiers");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (!v6)
  {
    -[RBSProcessPredicateImpl processIdentifier](v7, "processIdentifier");
    v4 = (RBSProcessPredicateImpl *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v21 = (void *)MEMORY[0x189604010];
      v22 = +[RBSProcessIdentifier identifierForIdentifier:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierForIdentifier:",  v4);
      [v21 setWithObject:v22];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v6 = 0LL;
    }

    goto LABEL_6;
  }

  return v6;
}

- (BOOL)matchesProcess:(id)a3
{
  return result;
}

@end