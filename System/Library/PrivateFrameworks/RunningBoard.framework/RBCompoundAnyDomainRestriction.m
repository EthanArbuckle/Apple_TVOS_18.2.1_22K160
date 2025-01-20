@interface RBCompoundAnyDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundAnyDomainRestriction

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBCompoundAnyDomainRestriction;
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

      id v15 = -[RBCompoundAnyDomainRestriction _initWithRestrictions:]( objc_alloc(&OBJC_CLASS___RBCompoundAnyDomainRestriction),  "_initWithRestrictions:",  v7);
      goto LABEL_16;
    }
  }

  if (a4)
  {
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v26 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RBCompoundAnyDomainRestriction doesn't specify restrictions: %@", v5];
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
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v7 = self->_restrictions;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v39,  v46,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v39 + 1) + 8 * i) allowsContext:v6 withError:0])
        {
          BOOL v31 = 1;
          goto LABEL_24;
        }
      }

      uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v39,  v46,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    v33 = a4;
    objc_msgSend(MEMORY[0x189607940], "stringWithString:", @"(");
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v12 = self->_restrictions;
    uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v45,  16LL);
    uint64_t v14 = *MEMORY[0x1896075F0];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v36;
      char v17 = 1;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          if ((v17 & 1) == 0) {
            -[NSArray appendString:](v7, "appendString:", @" AND ");
          }
          id v34 = 0LL;
          int v20 = [v19 allowsContext:v6 withError:&v34];
          id v21 = v34;
          if (v20) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.1();
          }
          __int128 v22 = v21;
          if (!v21) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.2();
          }
          [v21 userInfo];
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 objectForKey:v14];
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.3();
          }

          [v22 userInfo];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 objectForKey:v14];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray appendString:](v7, "appendString:", v26);

          char v17 = 0;
        }

        uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v45,  16LL);
        char v17 = 0;
      }

      while (v15);
    }

    -[NSArray appendString:](v7, "appendString:", @""));
    v27 = (void *)MEMORY[0x189607870];
    uint64_t v28 = *MEMORY[0x1896124C0];
    uint64_t v43 = v14;
    v29 = (void *)-[NSArray copy](v7, "copy");
    v44 = v29;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 errorWithDomain:v28 code:1 userInfo:v30];
    id *v33 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v31 = 0;
LABEL_24:
  }

  else
  {
    BOOL v31 = 0;
  }

  return v31;
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

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCompoundAnyDomainRestriction *)a3;
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

- (void)allowsContext:withError:.cold.1()
{
}

- (void)allowsContext:withError:.cold.2()
{
}

- (void)allowsContext:withError:.cold.3()
{
}

@end