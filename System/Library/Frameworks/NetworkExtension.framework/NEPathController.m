@interface NEPathController
+ (BOOL)supportsSecureCoding;
+ (id)copyAggregatePathRules;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasNonDefaultRules;
- (BOOL)ignoreFallback;
- (BOOL)ignoreRouteRules;
- (BOOL)isEnabled;
- (BOOL)removePathRuleBySigningIdentifier:(id)a3;
- (NEPathController)initWithCoder:(id)a3;
- (NSArray)pathRules;
- (id)copyPathRuleBySigningIdentifier:(id)a3;
- (id)copyPathRuleSigningIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)cellularFallbackFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularFallbackFlags:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIgnoreFallback:(BOOL)a3;
- (void)setIgnoreRouteRules:(BOOL)a3;
- (void)setPathRules:(id)a3;
@end

@implementation NEPathController

- (NEPathController)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEPathController;
  v5 = -[NEPathController init](&v19, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    pathRules = v5->_pathRules;
    v5->_pathRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"PayloadAppRules"];
    payloadAppRules = v5->_payloadAppRules;
    v5->_payloadAppRules = (NSArray *)v16;

    v5->_cellularFallbackFlags = [v4 decodeIntegerForKey:@"cellularFallbackFlags"];
    v5->_ignoreRouteRules = [v4 decodeBoolForKey:@"IgnoreRouteRules"];
    v5->_ignoreFallback = [v4 decodeBoolForKey:@"IgnoreFallback"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController isEnabled](self, "isEnabled"), @"Enabled");
  -[NEPathController pathRules](self, "pathRules");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"Rules"];

  if (self) {
    id Property = objc_getProperty(self, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 encodeObject:Property forKey:@"PayloadAppRules"];
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"),  @"cellularFallbackFlags");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"),  @"IgnoreRouteRules");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[NEPathController ignoreFallback](self, "ignoreFallback"),  @"IgnoreFallback");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEPathController init]( +[NEPathController allocWithZone:](&OBJC_CLASS___NEPathController, "allocWithZone:", a3),  "init");
  -[NEPathController setEnabled:](v4, "setEnabled:", -[NEPathController isEnabled](self, "isEnabled"));
  v5 = -[NEPathController pathRules](self, "pathRules");
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x189603F18]);
    v8 = -[NEPathController pathRules](self, "pathRules");
    uint64_t v9 = (void *)[v7 initWithArray:v8 copyItems:1];
    -[NEPathController setPathRules:](v4, "setPathRules:", v9);
  }

  if (self && objc_getProperty(self, v6, 32LL, 1))
  {
    id v10 = objc_alloc(MEMORY[0x189603F18]);
    uint64_t v13 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", objc_getProperty(self, v11, 32, 1), 1);
    if (v4) {
      objc_setProperty_atomic_copy(v4, v12, v13, 32LL);
    }
  }

  -[NEPathController setCellularFallbackFlags:]( v4,  "setCellularFallbackFlags:",  -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"));
  -[NEPathController setIgnoreRouteRules:]( v4,  "setIgnoreRouteRules:",  -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"));
  -[NEPathController setIgnoreFallback:]( v4,  "setIgnoreFallback:",  -[NEPathController ignoreFallback](self, "ignoreFallback"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NEPathController pathRules](self, "pathRules");
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v6 = -[NEPathController pathRules](self, "pathRules", 0LL);
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
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEPathController isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEPathController pathRules](self, "pathRules");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"pathRules" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"payloadAppRules" andIndent:v5 options:a4];
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"),  @"cellularFallbackFlags",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"),  @"ignoreRouteRules",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEPathController ignoreFallback](self, "ignoreFallback"),  @"ignoreFallback",  v5,  a4);
  return v7;
}

- (id)copyPathRuleBySigningIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  -[NEPathController pathRules](self, "pathRules", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v9 matchSigningIdentifier];
        char v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)removePathRuleBySigningIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x189603FA8]);
  -[NEPathController pathRules](self, "pathRules");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v5 initWithArray:v6];

  if ([v7 count])
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      [v7 objectAtIndex:v8];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 matchSigningIdentifier];
      char v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
    }

    [v7 removeObjectAtIndex:v8];
    -[NEPathController setPathRules:](self, "setPathRules:", v7);

    BOOL v12 = 1;
  }

  else
  {
LABEL_5:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyPathRuleSigningIdentifiers
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(MEMORY[0x189603FA8]);
  -[NEPathController pathRules](self, "pathRules");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[NEPathController pathRules](self, "pathRules", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v10) matchSigningIdentifier];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  BOOL v12 = (void *)[v5 copy];
  return v12;
}

- (BOOL)hasNonDefaultRules
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[NEPathController pathRules](self, "pathRules", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 cellularBehavior] != 2
          || [v7 wifiBehavior] != 2 && objc_msgSend(v7, "wifiBehavior")
          || ([v7 denyMulticast] & 1) != 0
          || ([v7 denyAll] & 1) != 0)
        {
          BOOL v8 = 1;
          goto LABEL_16;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)ignoreRouteRules
{
  return self->_ignoreRouteRules;
}

- (void)setIgnoreRouteRules:(BOOL)a3
{
  self->_ignoreRouteRules = a3;
}

- (BOOL)ignoreFallback
{
  return self->_ignoreFallback;
}

- (void)setIgnoreFallback:(BOOL)a3
{
  self->_ignoreFallback = a3;
}

- (int64_t)cellularFallbackFlags
{
  return self->_cellularFallbackFlags;
}

- (void)setCellularFallbackFlags:(int64_t)a3
{
  self->_cellularFallbackFlags = a3;
}

- (NSArray)pathRules
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPathRules:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)copyAggregatePathRules
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  uint64_t configuration_generation = ne_get_configuration_generation();
  uint64_t v3 = configuration_generation;
  uint64_t v4 = (void *)copyAggregatePathRules_cachedRules;
  if (copyAggregatePathRules_cachedRules)
  {
    if (configuration_generation && configuration_generation == copyAggregatePathRules_savedGeneration)
    {
      copyAggregatePathRules_savedGeneration = configuration_generation;
      goto LABEL_19;
    }

    copyAggregatePathRules_cachedRules = 0LL;

    uint64_t v4 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_savedGeneration = v3;
    if (copyAggregatePathRules_cachedRules) {
      goto LABEL_19;
    }
  }

  else
  {
    copyAggregatePathRules_savedGeneration = configuration_generation;
  }

  uint64_t v5 = NEHelperCopyAggregatePathRules();
  id v6 = (void *)v5;
  if (v5 && MEMORY[0x1895ADD58](v5) == MEMORY[0x1895F9240])
  {
    id v7 = objc_alloc(MEMORY[0x189603F48]);
    bytes_ptr = xpc_data_get_bytes_ptr(v6);
    uint64_t v9 = (void *)[v7 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v6) freeWhenDone:0];
    id v22 = 0LL;
    __int128 v10 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v9 error:&v22];
    id v11 = v22;
    if (v11)
    {
      ne_log_obj();
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create a unarchiver for the aggregate path rules: %@",  buf,  0xCu);
      }
    }

    __int128 v13 = (void *)MEMORY[0x189604010];
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v10 decodeObjectOfClasses:v15 forKey:@"config-aggregate-rules"];
    __int128 v17 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_cachedRules = v16;

    if ((isa_nsarray((void *)copyAggregatePathRules_cachedRules) & 1) == 0)
    {
      ne_log_obj();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to de-serialize the aggregate path rules",  buf,  2u);
      }

      uint64_t v19 = (void *)copyAggregatePathRules_cachedRules;
      copyAggregatePathRules_cachedRules = 0LL;
    }
  }

  uint64_t v4 = (void *)copyAggregatePathRules_cachedRules;
LABEL_19:
  id v20 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  return v20;
}

@end