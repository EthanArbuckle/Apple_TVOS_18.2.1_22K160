@interface NEPerApp
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)noRestriction;
- (BOOL)removeAppRuleByID:(id)a3;
- (BOOL)restrictDomains;
- (NEPerApp)init;
- (NEPerApp)initWithCoder:(id)a3;
- (NSArray)appRules;
- (NSArray)excludedDomains;
- (id)copyAppRuleByID:(id)a3;
- (id)copyAppRuleIDs;
- (id)copyCachedMachOUUIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setNoRestriction:(BOOL)a3;
- (void)setRestrictDomains:(BOOL)a3;
- (void)updateAppRulesForUID:(unsigned int)a3;
@end

@implementation NEPerApp

- (NEPerApp)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEPerApp;
  result = -[NEPerApp init](&v3, sel_init);
  if (result) {
    result->_noRestriction = 1;
  }
  return result;
}

- (NEPerApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEPerApp init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEPerApp appRules](self, "appRules");
  [v4 encodeObject:v5 forKey:@"Rules"];

  -[NEPerApp excludedDomains](self, "excludedDomains");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"ExcludedDomains"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NEPerApp appRules](self, "appRules");
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    -[NEPerApp appRules](self, "appRules");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setAppRules:v8];
  }

  id v9 = objc_alloc(MEMORY[0x189603F18]);
  v10 = -[NEPerApp excludedDomains](self, "excludedDomains");
  v11 = (void *)[v9 initWithArray:v10 copyItems:1];
  [v4 setExcludedDomains:v11];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NEPerApp appRules](self, "appRules");
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    -[NEPerApp appRules](self, "appRules", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
          }

          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid app rule", v4);
            char v10 = 0;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    else
    {
      char v10 = 1;
    }

    BOOL v13 = v10 & 1;
  }

  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NEPerApp appRules](self, "appRules");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"appRules" andIndent:v5 options:a4];

  -[NEPerApp excludedDomains](self, "excludedDomains");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"excludedDomains" andIndent:v5 options:a4];

  return v7;
}

- (id)copyAppRuleByID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v5->_appRules;
  id v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "matchSigningIdentifier", (void)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = (void *)[v10 copy];
          goto LABEL_11;
        }
      }

      id v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)removeAppRuleByID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x189603FA8]);
  appRules = self->_appRules;
  p_appRules = &self->_appRules;
  uint64_t v8 = (void *)[v5 initWithArray:appRules];
  if ([v8 count])
  {
    uint64_t v9 = 0LL;
    while (1)
    {
      [v8 objectAtIndex:v9];
      char v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 matchSigningIdentifier];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
    }

    [v8 removeObjectAtIndex:v9];
    objc_storeStrong((id *)p_appRules, v8);

    BOOL v13 = 1;
  }

  else
  {
LABEL_5:
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyAppRuleIDs
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](self->_appRules, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_appRules;
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
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "matchSigningIdentifier", (void)v12);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

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

- (void)updateAppRulesForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obj = self->_appRules;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v43;
    uint64_t v9 = &off_18A087000;
    unsigned int v31 = v3;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
        [v11 matchSigningIdentifier];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          __int128 v13 = v9[423];
          [v11 matchSigningIdentifier];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          id v41 = 0LL;
          [v13 bundleProxyForIdentifier:v14 uid:v3 plugins:&v41];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v41;

          v36 = v16;
          if (v15 && [v16 count])
          {
            v33 = v15;
            uint64_t v34 = v10;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v38;
              do
              {
                for (uint64_t i = 0LL; i != v19; ++i)
                {
                  if (*(void *)v38 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  [v22 identifier];
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  id v24 = -[NEPerApp copyAppRuleByID:](self, "copyAppRuleByID:", v23);

                  if (!v24)
                  {
                    v25 = objc_alloc(&OBJC_CLASS___NEAppRule);
                    [v22 identifier];
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = -[NEAppRule initWithSigningIdentifier:](v25, "initWithSigningIdentifier:", v26);

                    if (v27)
                    {
                      if (!v7) {
                        id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
                      }
                      [v7 addObject:v27];
                    }
                  }
                }

                uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }

              while (v19);
            }

            uint64_t v3 = v31;
            uint64_t v8 = v30;
            uint64_t v6 = v32;
            __int128 v15 = v33;
            uint64_t v9 = &off_18A087000;
            uint64_t v10 = v34;
          }
        }

        ++v10;
      }

      while (v10 != v6);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if ([v7 count])
  {
    v28 = -[NEPerApp appRules](self, "appRules");
    [v28 arrayByAddingObjectsFromArray:v7];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPerApp setAppRules:](self, "setAppRules:", v29);
  }
}

- (id)copyCachedMachOUUIDs
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  -[NEPerApp appRules](self, "appRules", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 cachedMachOUUIDs];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 count];

        if (v11)
        {
          [v9 cachedMachOUUIDs];
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 addObjectsFromArray:v12];
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  if ([v3 count]) {
    __int128 v13 = v3;
  }
  else {
    __int128 v13 = 0LL;
  }
  id v14 = v13;

  return v14;
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAppRules:(id)a3
{
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void)setRestrictDomains:(BOOL)a3
{
  self->_restrictDomains = a3;
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setExcludedDomains:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end