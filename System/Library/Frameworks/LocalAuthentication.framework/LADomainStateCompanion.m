@interface LADomainStateCompanion
- (LADomainStateCompanion)initWithResult:(id)a3;
- (NSData)stateHash;
- (NSSet)availableCompanionTypes;
- (id)description;
- (id)stateHashForCompanionType:(int64_t)a3;
- (void)_resolveCombinedStateHash;
@end

@implementation LADomainStateCompanion

- (LADomainStateCompanion)initWithResult:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___LADomainStateCompanion;
  v5 = -[LADomainStateCompanion init](&v31, sel_init);
  if (v5)
  {
    [MEMORY[0x1896077F8] mainBundle];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 bundleIdentifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 objectForKeyedSubscript:*MEMORY[0x189610650]];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v4;
    [v4 objectForKeyedSubscript:*MEMORY[0x189610660]];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_new();
    availableCompanions = v5->_availableCompanions;
    v5->_availableCompanions = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    stateHashForCompanionType = v5->_stateHashForCompanionType;
    v5->_stateHashForCompanionType = (NSMutableDictionary *)v12;

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          [v14 objectForKeyedSubscript:v19];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v21 = [v20 BOOLValue];

          if (v21)
          {
            -[NSMutableSet addObject:](v5->_availableCompanions, "addObject:", v19);
            v22 = (void *)MEMORY[0x189610798];
            [v9 objectForKeyedSubscript:v19];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 saltHash:v23 withBundleID:v7];
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_stateHashForCompanionType,  "setObject:forKeyedSubscript:",  v24,  v19);
          }
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v16);
    }

    -[LADomainStateCompanion _resolveCombinedStateHash](v5, "_resolveCombinedStateHash");
    id v4 = v26;
  }

  return v5;
}

- (NSSet)availableCompanionTypes
{
  return (NSSet *)self->_availableCompanions;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (id)stateHashForCompanionType:(int64_t)a3
{
  stateHashForCompanionType = self->_stateHashForCompanionType;
  [MEMORY[0x189607968] numberWithInteger:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](stateHashForCompanionType, "objectForKeyedSubscript:", v4);
  return v5;
}

- (void)_resolveCombinedStateHash
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = -[NSMutableDictionary allKeys](self->_stateHashForCompanionType, "allKeys");
  [v3 sortedArrayUsingSelector:sel_compare_];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v4 count] > 1)
  {
    v5 = (void *)objc_opt_new();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateHashForCompanionType,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8 * v11),  (void)v14);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 appendData:v12];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }

    [MEMORY[0x189610798] createHashForDomainState:v5];
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = -[NSMutableDictionary allValues](self->_stateHashForCompanionType, "allValues");
    [v5 firstObject];
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }

  stateHash = self->_stateHash;
  self->_stateHash = v6;
}

- (id)description
{
  v15[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)NSString;
  v6 = -[LADomainStateCompanion availableCompanionTypes](self, "availableCompanionTypes");
  [v5 stringWithFormat:@"availableCompanions: %@", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  uint64_t v8 = (void *)NSString;
  -[LADomainStateCompanion stateHash](self, "stateHash");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"stateHash: %@", v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 componentsJoinedByString:@"; "];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
}

@end