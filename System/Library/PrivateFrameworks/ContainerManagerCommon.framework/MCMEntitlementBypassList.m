@interface MCMEntitlementBypassList
+ (id)sharedBypassList;
- (BOOL)containerIdIsWellknown:(id)a3 class:(unint64_t)a4;
- (BOOL)isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:(id)a3 forContainerClass:(unint64_t)a4 containerIdentifier:(id)a5;
- (BOOL)systemContainerIdIsWellknown:(id)a3;
- (BOOL)systemGroupContainerIdIsWellknown:(id)a3;
- (MCMEntitlementBypassList)initWithSystemContainerMapping:(id)a3 systemGroupContainerMapping:(id)a4 bypassListedCodeSignIdentifierMapping:(id)a5;
- (NSDictionary)systemEntitlementBypassList;
- (NSDictionary)systemGroupEntitlementBypassList;
- (id)_convertArraysToSetsInNestedDictionary:(id)a3;
- (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet;
- (id)wellknownContainerForId:(id)a3 class:(unint64_t)a4;
- (id)wellknownSystemContainerForId:(id)a3;
- (id)wellknownSystemContainers;
- (id)wellknownSystemGroupContainerForId:(id)a3;
- (id)wellknownSystemGroupContainers;
- (void)setSystemEntitlementBypassList:(id)a3;
- (void)setSystemGroupEntitlementBypassList:(id)a3;
@end

@implementation MCMEntitlementBypassList

- (MCMEntitlementBypassList)initWithSystemContainerMapping:(id)a3 systemGroupContainerMapping:(id)a4 bypassListedCodeSignIdentifierMapping:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMEntitlementBypassList;
  v11 = -[MCMEntitlementBypassList init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MCMEntitlementBypassList setSystemEntitlementBypassList:](v11, "setSystemEntitlementBypassList:", v8);
    -[MCMEntitlementBypassList setSystemGroupEntitlementBypassList:](v12, "setSystemGroupEntitlementBypassList:", v9);
    uint64_t v13 = -[MCMEntitlementBypassList _convertArraysToSetsInNestedDictionary:]( v12,  "_convertArraysToSetsInNestedDictionary:",  v10);
    bypassListedLookupByCodeSignIdentifier = v12->_bypassListedLookupByCodeSignIdentifier;
    v12->_bypassListedLookupByCodeSignIdentifier = (NSDictionary *)v13;
  }

  return v12;
}

- (id)wellknownSystemContainerForId:(id)a3
{
  id v4 = a3;
  v5 = -[MCMEntitlementBypassList systemEntitlementBypassList](self, "systemEntitlementBypassList");
  [v5 valueForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)systemContainerIdIsWellknown:(id)a3
{
  id v4 = a3;
  v5 = -[MCMEntitlementBypassList systemEntitlementBypassList](self, "systemEntitlementBypassList");
  [v5 valueForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0LL;
}

- (id)wellknownSystemContainers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wellknownSystemGroupContainerForId:(id)a3
{
  id v4 = a3;
  v5 = -[MCMEntitlementBypassList systemGroupEntitlementBypassList](self, "systemGroupEntitlementBypassList");
  [v5 valueForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)systemGroupContainerIdIsWellknown:(id)a3
{
  id v4 = a3;
  v5 = -[MCMEntitlementBypassList systemGroupEntitlementBypassList](self, "systemGroupEntitlementBypassList");
  [v5 valueForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0LL;
}

- (id)wellknownSystemGroupContainers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containerIdIsWellknown:(id)a3 class:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 13)
  {
    BOOL v7 = -[MCMEntitlementBypassList systemGroupContainerIdIsWellknown:](self, "systemGroupContainerIdIsWellknown:", v6);
  }

  else
  {
    if (a4 != 12)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }

    BOOL v7 = -[MCMEntitlementBypassList systemContainerIdIsWellknown:](self, "systemContainerIdIsWellknown:", v6);
  }

  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (id)wellknownContainerForId:(id)a3 class:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 13)
  {
    uint64_t v7 = -[MCMEntitlementBypassList wellknownSystemGroupContainerForId:](self, "wellknownSystemGroupContainerForId:", v6);
  }

  else
  {
    if (a4 != 12)
    {
      BOOL v8 = 0LL;
      goto LABEL_7;
    }

    uint64_t v7 = -[MCMEntitlementBypassList wellknownSystemContainerForId:](self, "wellknownSystemContainerForId:", v6);
  }

  BOOL v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (BOOL)isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:(id)a3 forContainerClass:(unint64_t)a4 containerIdentifier:(id)a5
{
  id v8 = a5;
  if (a4 <= 0xE)
  {
    -[NSDictionary objectForKeyedSubscript:]( self->_bypassListedLookupByCodeSignIdentifier,  "objectForKeyedSubscript:",  a3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      [MEMORY[0x189603FE8] null];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) != 0)
      {
        uint64_t v13 = 0LL;
LABEL_9:
        char v9 = 1;
LABEL_11:

        goto LABEL_12;
      }

      [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKeyedSubscript:v14];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        [MEMORY[0x189603FE8] null];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        char v16 = [v13 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          char v9 = [v13 containsObject:v8];
          goto LABEL_11;
        }

        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    char v9 = 0;
    goto LABEL_11;
  }

  char v9 = 0;
LABEL_12:

  return v9;
}

- (id)_convertArraysToSetsInNestedDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  [MEMORY[0x189603FA8] arrayWithObject:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithObject:v4];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    do
    {
      [v5 lastObject];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = v5;
      [v5 removeLastObject];
      [v22 lastObject];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 removeLastObject];
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            [v9 objectForKeyedSubscript:v14];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
              char v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v16 forKeyedSubscript:v14];

              [v7 addObject:v15];
              [v8 objectForKeyedSubscript:v14];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 addObject:v17];
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                [MEMORY[0x189604010] setWithArray:v15];
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v18 forKeyedSubscript:v14];
              }

              else
              {
                [v8 setObject:v15 forKeyedSubscript:v14];
              }
            }
          }

          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
        }

        while (v11);
      }

      v5 = v7;
    }

    while ([v7 count]);
  }

  v19 = (void *)[v4 copy];

  return v19;
}

- (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet
{
  if (wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken != -1) {
    dispatch_once( &wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken,  &__block_literal_global_68);
  }
  return (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set;
}

- (NSDictionary)systemEntitlementBypassList
{
  return self->_systemEntitlementBypassList;
}

- (void)setSystemEntitlementBypassList:(id)a3
{
}

- (NSDictionary)systemGroupEntitlementBypassList
{
  return self->_systemGroupEntitlementBypassList;
}

- (void)setSystemGroupEntitlementBypassList:(id)a3
{
}

- (void).cxx_destruct
{
}

void __91__MCMEntitlementBypassList_wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet__block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"com.apple.facetime",  @"com.apple.iBooks",  @"com.apple.Maps",  @"com.apple.mobilenotes",  @"com.apple.mobilesafari",  @"com.apple.podcasts",  0);
  v1 = (void *)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set;
  wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set = v0;
}

+ (id)sharedBypassList
{
  if (sharedBypassList_onceToken != -1) {
    dispatch_once(&sharedBypassList_onceToken, &__block_literal_global_1291);
  }
  return (id)sharedBypassList_sharedInstance;
}

void __44__MCMEntitlementBypassList_sharedBypassList__block_invoke()
{
  v22[9] = *MEMORY[0x1895F89C0];
  v21[0] = @"com.apple.mobile.MobileHouseArrest";
  [MEMORY[0x189603FE8] null];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v21[1] = @"com.apple.accountsd";
  v19 = &unk_18A2BDE10;
  v20 = &unk_18A2BE848;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v0;
  v21[2] = @"com.apple.itunescloudd";
  [MEMORY[0x189603FE8] null];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v1;
  v21[3] = @"com.apple.CacheDeleteDaily";
  [MEMORY[0x189603FE8] null];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v2;
  v21[4] = @"com.apple.Safari.History";
  uint64_t v17 = &unk_18A2BDE28;
  v18 = &unk_18A2BE860;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v3;
  v21[5] = @"com.apple.mobile_installation_proxy";
  [MEMORY[0x189603FE8] null];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v4;
  v21[6] = @"com.apple.AppPredictionWidget.extension";
  [MEMORY[0x189603FE8] null];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v5;
  v21[7] = @"com.apple.Maps.Widget";
  v15 = &unk_18A2BDE28;
  char v16 = &unk_18A2BE878;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v6;
  v21[8] = @"com.apple.filecoordinationd";
  [MEMORY[0x189603FE8] null];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = containermanager_copy_global_configuration();
  LODWORD(v0) = [v9 isInternalImage];

  if ((_DWORD)v0)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:&unk_18A2BD400];
    [v10 setValue:@"systemgroup.com.apple.codecoveragedata" forKey:@"systemgroup.com.apple.codecoveragedata"];
    uint64_t v11 = (void *)[v10 copy];
  }

  else
  {
    uint64_t v11 = &unk_18A2BD400;
  }

  uint64_t v12 = -[MCMEntitlementBypassList initWithSystemContainerMapping:systemGroupContainerMapping:bypassListedCodeSignIdentifierMapping:]( objc_alloc(&OBJC_CLASS___MCMEntitlementBypassList),  "initWithSystemContainerMapping:systemGroupContainerMapping:bypassListedCodeSignIdentifierMapping:",  &unk_18A2BD3D8,  v11,  v8);
  uint64_t v13 = (void *)sharedBypassList_sharedInstance;
  sharedBypassList_sharedInstance = (uint64_t)v12;
}

@end