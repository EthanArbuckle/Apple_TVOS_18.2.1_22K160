@interface RBCompoundAllDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundAllDomainRestriction

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBCompoundAllDomainRestriction;
  v5 = -[RBDomainRestriction _init](&v10, sel__init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v27[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectForKey:@"Restrictions"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [MEMORY[0x189603FA8] array];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        while (2)
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = +[RBDomainRestriction domainRestrictionForDictionary:withError:]( &OBJC_CLASS___RBDomainRestriction,  "domainRestrictionForDictionary:withError:",  *(void *)(*((void *)&v21 + 1) + 8 * v12),  a4);
            if (!v13)
            {

              id v15 = 0LL;
              goto LABEL_16;
            }

            v14 = (void *)v13;
            [v7 addObject:v13];

            ++v12;
          }

          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v15 = -[RBCompoundAllDomainRestriction _initWithRestrictions:]( objc_alloc(&OBJC_CLASS___RBCompoundAllDomainRestriction),  "_initWithRestrictions:",  v7);
      goto LABEL_16;
    }
  }

  if (a4)
  {
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v26 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RBCompoundAllDomainRestriction doesn't specify restrictions: %@", v5];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    id v7 = v19;
    id v15 = 0LL;
    *a4 = v7;
LABEL_16:

    goto LABEL_17;
  }

  id v15 = 0LL;
LABEL_17:

  return v15;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v27 = a3;
  objc_msgSend(MEMORY[0x189607940], "stringWithString:", @"(");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v6 = self->_restrictions;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
  char v8 = v7 == 0;
  if (!v7)
  {
    id v10 = 0LL;
    goto LABEL_19;
  }

  uint64_t v9 = v7;
  BOOL v24 = v7 == 0;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v30;
  uint64_t v25 = *MEMORY[0x1896075F0];
  char v8 = 1;
  char v12 = 1;
  do
  {
    for (uint64_t i = 0LL; i != v9; ++i)
    {
      v14 = v10;
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v6);
      }
      id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v28 = v10;
      char v16 = [v15 allowsContext:v27 withError:&v28];
      id v10 = v28;

      v8 &= v16;
      if ((v16 & 1) == 0 && a4)
      {
        if ((v12 & 1) == 0) {
          [v26 appendString:@" AND "];
        }
        [v10 userInfo];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectForKey:v25];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 appendString:v18];

        char v8 = 0;
        char v12 = 0;
      }
    }

    uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
  }

  while (v9);

  if (a4) {
    char v19 = v8;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    [v26 appendString:@""]);
    v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x1896124C0];
    uint64_t v33 = v25;
    uint64_t v6 = (NSArray *)[v26 copy];
    v34 = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:v21 code:1 userInfo:v22];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    char v8 = v24;
LABEL_19:
  }

  return v8;
}

- (id)allEntitlements
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_restrictions;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "allEntitlements", (void)v12);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 unionSet:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  id v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCompoundAllDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  restrictions = self->_restrictions;
  uint64_t v8 = v4->_restrictions;
  if (restrictions == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }

  if (restrictions) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSArray isEqual:](restrictions, "isEqual:");
    goto LABEL_11;
  }

- (unint64_t)hash
{
  return -[NSArray hash](self->_restrictions, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_restrictions];

  return v5;
}

- (void).cxx_destruct
{
}

@end