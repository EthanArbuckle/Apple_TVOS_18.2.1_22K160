@interface RBSCompoundAllPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSCompoundAllPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processIdentifier;
- (id)processIdentifiers;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)initWithPredicates:(void *)a1;
@end

@implementation RBSCompoundAllPredicate

- (void)initWithPredicates:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___RBSCompoundAllPredicate;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [MEMORY[0x189604010] setWithArray:v3];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)processIdentifier
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v2 = self->_predicates;
  uint64_t v3 = -[NSSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) processIdentifier];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            rbs_general_log();
            v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v13 = 0;
              _os_log_impl( &dword_185F67000,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to get processIdentifier for predicate with multiple possibilities",  v13,  2u);
            }

            v11 = 0LL;
            goto LABEL_17;
          }

          id v5 = v8;
        }
      }

      uint64_t v4 = -[NSSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  id v5 = v5;
  v11 = v5;
LABEL_17:

  return v11;
}

- (id)processIdentifiers
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v2 = self->_predicates;
  uint64_t v3 = -[NSSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "processIdentifiers", (void)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            uint64_t v10 = [v5 setByAddingObjectsFromSet:v8];

            id v5 = (id)v10;
          }

          else
          {
            id v5 = v8;
          }
        }
      }

      uint64_t v4 = -[NSSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NSSet count](self->_predicates, "count"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = self->_predicates;
    uint64_t v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "matchesProcess:", v4, (void)v12))
          {
            BOOL v10 = 0;
            goto LABEL_12;
          }
        }

        uint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v10 = 1;
LABEL_12:
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSCompoundAllPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBSCompoundAllPredicate;
  id v5 = -[RBSCompoundAllPredicate init](&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_predicates"];
    predicates = v5->_predicates;
    v5->_predicates = (NSSet *)v7;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSCompoundAllPredicate *)a3;
  if (self == v4) {
    goto LABEL_11;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  predicates = self->_predicates;
  uint64_t v8 = (const __CFSet *)v4->_predicates;
  if (predicates == (NSSet *)v8)
  {
LABEL_11:
    char v6 = 1;
    goto LABEL_12;
  }

  if (predicates) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    CFIndex Count = CFSetGetCount((CFSetRef)predicates);
    if (Count == CFSetGetCount(v8))
    {
      char v6 = -[NSSet isEqualToSet:](predicates, "isEqualToSet:", v8);
      goto LABEL_12;
    }
  }

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_predicates, "allObjects");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", @", ");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@ [%@]>", v4, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end