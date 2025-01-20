@interface NWStatsEntityMapperDynamicLaunchServices
- (NWStatsEntityMapperDynamicLaunchServices)init;
- (id)_attemptConvertingPluginNameToContainingAppName:(id)a3;
- (id)_identifierForUUID:(id)a3 fromSet:(id)a4;
- (id)extensionNameForUUID:(id)a3;
- (id)handleNewUUID:(id)a3;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (void)dealloc;
@end

@implementation NWStatsEntityMapperDynamicLaunchServices

- (NWStatsEntityMapperDynamicLaunchServices)init
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapperDynamicLaunchServices;
  v2 = -[NWStatsEntityMapperDynamicLaunchServices init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapCache);
    entityMap = v2->_entityMap;
    v2->_entityMap = v3;

    v5 = dlopen((const char *)gCoreServicesFrameworkPath, 4);
    v2->_coreServicesDylibHandle = v5;
    if (!v5
      || (v2->_LSPlugInKitProxyClass Class = objc_getClass("LSPlugInKitProxy"),
          v2->_LSApplicationProxyClass Class = objc_getClass("LSApplicationProxy"),
          Class Class = objc_getClass("LSApplicationWorkspace"),
          v2->_LSApplicationWorkspaceClass Class = Class,
          !v2->_coreServicesDylibHandle)
      || !v2->_LSPlugInKitProxyClass
      || !v2->_LSApplicationProxyClass
      || !Class)
    {
      NStatGetLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        coreServicesDylibHandle = v2->_coreServicesDylibHandle;
        LSPlugInKitProxyClass Class = v2->_LSPlugInKitProxyClass;
        LSApplicationProxyClass Class = v2->_LSApplicationProxyClass;
        LSApplicationWorkspaceClass Class = v2->_LSApplicationWorkspaceClass;
        *(_DWORD *)buf = 134218752;
        v15 = coreServicesDylibHandle;
        __int16 v16 = 2048;
        Class v17 = LSPlugInKitProxyClass;
        __int16 v18 = 2048;
        Class v19 = LSApplicationProxyClass;
        __int16 v20 = 2048;
        Class v21 = LSApplicationWorkspaceClass;
        _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_FAULT,  "LS Mapping dylib failure handle %p plugin proxy class %p app proxy class %p app workspace class %p",  buf,  0x2Au);
      }
    }
  }

  return v2;
}

- (void)dealloc
{
  coreServicesDylibHandle = self->_coreServicesDylibHandle;
  if (coreServicesDylibHandle) {
    dlclose(coreServicesDylibHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWStatsEntityMapperDynamicLaunchServices;
  -[NWStatsEntityMapperDynamicLaunchServices dealloc](&v4, sel_dealloc);
}

- (id)_attemptConvertingPluginNameToContainingAppName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v4 = v3;
  if (v3)
  {
    [v3 containingBundle];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      [v5 applicationIdentifier];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)_identifierForUUID:(id)a3 fromSet:(id)a4
{
  v12[2] = *MEMORY[0x1895F89C0];
  objc_msgSend(a4, "allObjects", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectAtIndex:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = -[NWStatsEntityMapperDynamicLaunchServices _attemptConvertingPluginNameToContainingAppName:]( self,  "_attemptConvertingPluginNameToContainingAppName:",  v6);
  v8 = (void *)v7;
  if (v7)
  {
    v12[0] = v7;
    v12[1] = v6;
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = v6;
  }

  v10 = v9;

  return v10;
}

- (id)handleNewUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1895BB0FC]();
  v6 = -[objc_class defaultWorkspace](self->_LSApplicationWorkspaceClass, "defaultWorkspace");
  [MEMORY[0x189604010] setWithObject:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v6 bundleIdentifiersForMachOUUIDs:v7 error:&v15];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v15;

  if (!v9 && [v8 count])
  {
    [v8 objectForKeyedSubscript:v4];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 count])
    {
      v14 = -[NWStatsEntityMapperDynamicLaunchServices _identifierForUUID:fromSet:]( self,  "_identifierForUUID:fromSet:",  v4,  v13);
      if (v14)
      {
        id v10 = v14;
        v11 = v10;
        goto LABEL_3;
      }
    }

    else
    {
    }
  }

  [MEMORY[0x189603FE8] null];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0LL;
LABEL_3:
  -[NWStatsEntityMapCache setEntry:forUUID:](self->_entityMap, "setEntry:forUUID:", v10, v4);

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 UUIDString];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 length];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1895BB0FC]();
      v11 = self->_entityMap;
      objc_sync_enter(v11);
      -[NWStatsEntityMapCache entryForUUID:](self->_entityMap, "entryForUUID:", v7);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[NWStatsEntityMapperDynamicLaunchServices handleNewUUID:](self, "handleNewUUID:", v7);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12) {
          goto LABEL_12;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [NSString stringWithString:v12];
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = 1;
        goto LABEL_13;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v12 = v12;
        __int16 v16 = (void *)NSString;
        [v12 objectAtIndexedSubscript:0];
        Class v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 stringWithString:v17];
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();

        int v14 = 2;
      }

      else
      {
LABEL_12:
        int v14 = 0;
        objc_super v13 = 0LL;
      }

- (id)extensionNameForUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 UUIDString],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1895BB0FC]();
    uint64_t v9 = self->_entityMap;
    objc_sync_enter(v9);
    -[NWStatsEntityMapCache entryForUUID:](self->_entityMap, "entryForUUID:", v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v10;
      id v12 = (void *)NSString;
      [v11 objectAtIndexedSubscript:1];
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 stringWithString:v13];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v14 = 0LL;
    }

    objc_sync_exit(v9);
    objc_autoreleasePoolPop(v8);
  }

  else
  {
    int v14 = 0LL;
  }

  return v14;
}

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = self->_entityMap;
  objc_sync_enter(v4);
  v5 = -[NWStatsEntityMapCache stateDictionary](self->_entityMap, "stateDictionary");
  [v3 setObject:v5 forKeyedSubscript:@"EntityMapper"];

  objc_sync_exit(v4);
  return v3;
}

- (void).cxx_destruct
{
}

@end