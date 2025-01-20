@interface RBCompoundNoneDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundNoneDomainRestriction

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBCompoundNoneDomainRestriction;
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

      id v15 = -[RBCompoundNoneDomainRestriction _initWithRestrictions:]( objc_alloc(&OBJC_CLASS___RBCompoundNoneDomainRestriction),  "_initWithRestrictions:",  v7);
      goto LABEL_16;
    }
  }

  if (a4)
  {
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v26 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RBCompoundNoneDomainRestriction doesn't specify restrictions: %@", v5];
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
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_msgSend(MEMORY[0x189607940], "stringWithString:", @"(");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = self->_restrictions;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
  char v10 = v9 == 0;
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v11 = v9;
  BOOL v23 = v9 == 0;
  uint64_t v12 = *(void *)v25;
  char v10 = 1;
  char v13 = 1;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      int v16 = [v15 allowsContext:v6 withError:0];
      v10 &= v16 ^ 1;
      if (a4 && v16)
      {
        if ((v13 & 1) == 0) {
          [v7 appendString:@" AND "];
        }
        [v15 description];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 appendString:v17];

        char v10 = 0;
        char v13 = 0;
      }
    }

    uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
  }

  while (v11);

  if (a4) {
    char v18 = v10;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    [v7 appendString:@""]);
    v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = *MEMORY[0x1896124C0];
    uint64_t v28 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Not allowed because it has %@", v7];
    id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 errorWithDomain:v20 code:1 userInfo:v21];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    char v10 = v23;
LABEL_18:
  }

  return v10;
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

  char v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCompoundNoneDomainRestriction *)a3;
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