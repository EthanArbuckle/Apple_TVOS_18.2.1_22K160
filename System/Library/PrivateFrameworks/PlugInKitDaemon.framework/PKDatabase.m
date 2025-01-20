@interface PKDatabase
- (NSCache)cache;
- (PKApplicationWorkspaceProxy)workspace;
- (PKDAnnotationStore)annotations;
- (PKDExternalProviders)external;
- (PKDPersonaCache)personaCache;
- (PKDatabase)initWithDatabase:(id)a3 externalProviders:(id)a4;
- (PKDatabaseDelegate)delegate;
- (id)_locked_cachedPlugInWithUUID:(id)a3;
- (id)addPlugIn:(id)a3;
- (id)annotationForIdentifier:(id)a3;
- (id)annotationForPlugIn:(id)a3;
- (id)cachedPlugInWithUUID:(id)a3;
- (id)createPlugInForProxy:(id)a3 uuid:(id)a4 discoveryInstanceUUID:(id)a5 extensionPointCache:(id)a6;
- (id)findPlugInAtPath:(id)a3;
- (id)findPlugInWithUUID:(id)a3;
- (id)findPlugInWithUUID:(id)a3 discoveryUUID:(id)a4 extensionPointCache:(id)a5;
- (id)findPlugInsForQuery:(id)a3 discoveryInstanceUUID:(id)a4 allVersions:(BOOL)a5;
- (id)plugInForExtensionRecord:(id)a3 discoveryInstanceUUID:(id)a4 extensionPointCache:(id)a5;
- (id)plugInForProxy:(id)a3 discoveryInstanceUUID:(id)a4 extensionPointCache:(id)a5;
- (id)plugInsWithExtensionPointName:(id)a3 platforms:(id)a4;
- (id)plugInsWithinApplication:(id)a3;
- (id)regionObserver;
- (id)removePlugIn:(id)a3;
- (id)setAnnotation:(id)a3 forPlugIn:(id)a4;
- (os_unfair_lock_s)cacheLock;
- (unint64_t)cacheHits;
- (unint64_t)cacheMisses;
- (void)_locked_autoElect:(id)a3;
- (void)notifyAnnotationChange;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsWillUninstall:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setCache:(id)a3;
- (void)setCacheHits:(unint64_t)a3;
- (void)setCacheLock:(os_unfair_lock_s)a3;
- (void)setCacheMisses:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPersonaCache:(id)a3;
- (void)setRegionObserver:(id)a3;
- (void)setWorkspace:(id)a3;
@end

@implementation PKDatabase

- (PKDatabase)initWithDatabase:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PKDatabase;
  v8 = -[PKDatabase init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_external, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](v9, "external"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 ls]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultApplicationWorkspace]);
    -[PKDatabase setWorkspace:](v9, "setWorkspace:", v12);

    v13 = objc_alloc(&OBJC_CLASS___PKDAnnotationStore);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](v9, "external"));
    v15 = -[PKDAnnotationStore initWithDatabase:externalProviders:](v13, "initWithDatabase:externalProviders:", v6, v14);
    -[PKDatabase setAnnotations:](v9, "setAnnotations:", v15);

    v16 = objc_opt_new(&OBJC_CLASS___NSCache);
    -[PKDatabase setCache:](v9, "setCache:", v16);

    -[PKDatabase setCacheLock:](v9, "setCacheLock:", 0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase workspace](v9, "workspace"));
    [v17 addObserver:v9];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __49__PKDatabase_initWithDatabase_externalProviders___block_invoke;
    v27[3] = &unk_249E8;
    v20 = v9;
    v28 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( [v18 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v19 usingBlock:v27]);
    -[PKDatabase setRegionObserver:](v20, "setRegionObserver:", v21);

    v22 = objc_alloc(&OBJC_CLASS___PKDPersonaCache);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](v20, "external"));
    v24 = -[PKDPersonaCache initWithExternalProviders:](v22, "initWithExternalProviders:", v23);
    personaCache = v20->_personaCache;
    v20->_personaCache = v24;
  }

  return v9;
}

void __49__PKDatabase_initWithDatabase_externalProviders___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pklog_handle_for_category(9LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "locale change detected; purging cache", v6, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cache]);
  [v5 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

- (id)_locked_cachedPlugInWithUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_cacheLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase cache](self, "cache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  uint64_t v8 = pklog_handle_for_category(9LL, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v10) {
      -[PKDatabase _locked_cachedPlugInWithUUID:].cold.2((uint64_t)v6, (uint64_t)v4, v9);
    }

    -[PKDatabase setCacheHits:](self, "setCacheHits:", (char *)-[PKDatabase cacheHits](self, "cacheHits") + 1);
  }

  else
  {
    if (v10) {
      -[PKDatabase _locked_cachedPlugInWithUUID:].cold.1();
    }

    -[PKDatabase setCacheMisses:](self, "setCacheMisses:", (char *)-[PKDatabase cacheMisses](self, "cacheMisses") + 1);
  }

  return v6;
}

- (id)cachedPlugInWithUUID:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase _locked_cachedPlugInWithUUID:](self, "_locked_cachedPlugInWithUUID:", v5));

  os_unfair_lock_unlock(p_cacheLock);
  return v6;
}

- (id)plugInForProxy:(id)a3 discoveryInstanceUUID:(id)a4 extensionPointCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pluginUUID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase cachedPlugInWithUUID:](self, "cachedPlugInWithUUID:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));
  if (v12 == v13)
  {
    id v15 = 0LL;
  }

  else
  {
    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 pluginUUID]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[PKDatabase createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:]( self,  "createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:",  v8,  v14,  v9,  v10));
    }

    id v15 = v12;
    v12 = v15;
  }

  return v15;
}

- (id)plugInForExtensionRecord:(id)a3 discoveryInstanceUUID:(id)a4 extensionPointCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[PKDatabase cachedPlugInWithUUID:](self, "cachedPlugInWithUUID:", v11));

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));
  if (v12 == v13)
  {
    v16 = 0LL;
  }

  else
  {
    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 compatibilityObject]);
      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
        id v12 = (id)objc_claimAutoreleasedReturnValue( -[PKDatabase createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:]( self,  "createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:",  v14,  v15,  v9,  v10));
      }

      else
      {
        id v12 = 0LL;
      }
    }

    id v12 = v12;
    v16 = v12;
  }

  return v16;
}

- (id)createPlugInForProxy:(id)a3 uuid:(id)a4 discoveryInstanceUUID:(id)a5 extensionPointCache:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = objc_alloc(&OBJC_CLASS___PKDPlugIn);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase personaCache](self, "personaCache"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
  v17 = -[PKDPlugIn initWithLSData:personaCache:discoveryInstanceUUID:extensionPointCache:externalProviders:]( v14,  "initWithLSData:personaCache:discoveryInstanceUUID:extensionPointCache:externalProviders:",  v13,  v15,  v12,  v11,  v16);

  v18 = v17;
  if (!v17) {
    v18 = (PKDPlugIn *)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));
  }
  v19 = v18;
  if (!v17) {

  }
  unsigned int v20 = -[PKDPlugIn hasEntitlement:](v17, "hasEntitlement:", PKAutoElectEntitlement);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  if (v20) {
    -[PKDatabase _locked_autoElect:](self, "_locked_autoElect:", v17);
  }
  if (v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase cache](self, "cache"));
    [v22 setObject:v19 forKey:v10];
  }

  os_unfair_lock_unlock(p_cacheLock);
  uint64_t v24 = pklog_handle_for_category(9LL, v23);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[PKDatabase createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:].cold.1();
  }

  return v17;
}

- (id)findPlugInsForQuery:(id)a3 discoveryInstanceUUID:(id)a4 allVersions:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_autoreleasePoolPush();
  [v8 signpostBegin];
  if (!a5)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 findPlugIns]);
    if (v11)
    {
      v54 = (NSMutableSet *)v11;
      [v8 signpostEnd];
      id v12 = 0LL;
      goto LABEL_33;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 criteria]);
  id v14 = [v13 count];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase workspace](self, "workspace"));
  v16 = v15;
  if (v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 criteria]);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = __68__PKDatabase_findPlugInsForQuery_discoveryInstanceUUID_allVersions___block_invoke;
    v61[3] = &unk_24A10;
    v62 = (os_log_s *)v8;
    id v12 = (id)objc_claimAutoreleasedReturnValue([v16 pluginsMatchingQuery:v17 applyFilter:v61]);

    v18 = v62;
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v15 installedPlugins]);

    uint64_t v20 = pklog_handle_for_category(3LL, v19);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PKDatabase findPlugInsForQuery:discoveryInstanceUUID:allVersions:].cold.1(v12, v18);
    }
  }

  [v8 signpostEnd];
  os_unfair_lock_lock(&self->_cacheLock);
  unint64_t v21 = -[PKDatabase cacheHits](self, "cacheHits");
  unint64_t v22 = -[PKDatabase cacheMisses](self, "cacheMisses");
  os_unfair_lock_unlock(&self->_cacheLock);
  if (!v12)
  {
    v54 = 0LL;
    goto LABEL_33;
  }

  unint64_t v50 = v21;
  os_unfair_lock_t lock = &self->_cacheLock;
  unint64_t v49 = v22;
  v52 = v10;
  id v53 = v8;
  uint64_t v23 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v12 count]);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v12 = v12;
  id v24 = [v12 countByEnumeratingWithState:&v57 objects:v67 count:16];
  v54 = v23;
  if (!v24) {
    goto LABEL_29;
  }
  uint64_t v25 = *(void *)v58;
  uint64_t v56 = *(void *)v58;
  while (2)
  {
    uint64_t v26 = 0LL;
    else {
      uint64_t v27 = (uint64_t)v24;
    }
    do
    {
      if (*(void *)v58 != v25) {
        objc_enumerationMutation(v12);
      }
      v28 = *(void **)(*((void *)&v57 + 1) + 8 * v26);
      objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bundleURL", v49, v50));

      if (v29)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v28 containingBundle]);
        if ([v31 isPlaceholder])
        {
          uint64_t v33 = pklog_handle_for_category(6LL, v32);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue([v28 pluginUUID]);
            id v36 = v12;
            v37 = self;
            v38 = (void *)objc_claimAutoreleasedReturnValue([v28 pluginIdentifier]);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleVersion]);
            *(_DWORD *)buf = 138413058;
            *(void *)v64 = v9;
            *(_WORD *)&v64[8] = 2114;
            *(void *)&v64[10] = v35;
            *(_WORD *)&v64[18] = 2112;
            *(void *)&v64[20] = v38;
            __int16 v65 = 2112;
            v66 = v39;
            _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; containing app is a placeholder",
              buf,
              0x2Au);

            self = v37;
            id v12 = v36;
            uint64_t v23 = v54;
            goto LABEL_16;
          }
        }

        else
        {
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PKDatabase plugInForProxy:discoveryInstanceUUID:extensionPointCache:]( self,  "plugInForProxy:discoveryInstanceUUID:extensionPointCache:",  v28,  v9,  v55));
          if (v34) {
            -[NSMutableSet addObject:](v23, "addObject:", v34);
          }
        }

        goto LABEL_17;
      }

      uint64_t v40 = pklog_handle_for_category(6LL, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_INFO))
      {
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 pluginUUID]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v28 pluginIdentifier]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleVersion]);
        *(_DWORD *)buf = 138413058;
        *(void *)v64 = v9;
        *(_WORD *)&v64[8] = 2114;
        *(void *)&v64[10] = v34;
        *(_WORD *)&v64[18] = 2112;
        *(void *)&v64[20] = v35;
        __int16 v65 = 2112;
        v66 = v41;
        _os_log_impl( &dword_0,  (os_log_t)v31,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; nil bundleURL from LS proxy",
          buf,
          0x2Au);

LABEL_16:
        uint64_t v25 = v56;
LABEL_17:
      }

      ++v26;
    }

    while (v27 != v26);
    id v24 = [v12 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v24) {
      continue;
    }
    break;
  }

id __68__PKDatabase_findPlugInsForQuery_discoveryInstanceUUID_allVersions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) allowPlugInWithBundleIdentifier:a2 entitlements:a3];
}

- (id)findPlugInWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PKDatabase findPlugInWithUUID:discoveryUUID:extensionPointCache:]( self,  "findPlugInWithUUID:discoveryUUID:extensionPointCache:",  v4,  0LL,  v5));

  return v6;
}

- (id)findPlugInWithUUID:(id)a3 discoveryUUID:(id)a4 extensionPointCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[PKDatabase cachedPlugInWithUUID:](self, "cachedPlugInWithUUID:", v8));
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));

  if (v11 == v12)
  {
    v17 = 0LL;
  }

  else
  {
    if (!v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ls]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 plugInKitProxyForUUID:v8]);

      if (v15)
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue( -[PKDatabase createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:]( self,  "createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:",  v15,  v8,  v9,  v10));
      }

      else
      {
        uint64_t v18 = pklog_handle_for_category(6LL, v16);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[PKDatabase findPlugInWithUUID:discoveryUUID:extensionPointCache:].cold.1(v8);
        }

        id v11 = 0LL;
      }
    }

    id v11 = v11;
    v17 = v11;
  }

  return v17;
}

- (id)findPlugInAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ls]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 plugInKitProxyForURL:v4]);

  if (v7)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 pluginUUID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase findPlugInWithUUID:](self, "findPlugInWithUUID:", v9));
  }

  else
  {
    uint64_t v11 = pklog_handle_for_category(6LL, v8);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PKDatabase findPlugInAtPath:].cold.1(v4);
    }
    id v10 = 0LL;
  }

  return v10;
}

- (id)plugInsWithinApplication:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ls]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationProxyForBundleURL:v4]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 plugInKitPlugins]);
  if ([v8 count])
  {
    id v18 = v4;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0LL;
        else {
          uint64_t v15 = (uint64_t)v12;
        }
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PKDatabase plugInForProxy:discoveryInstanceUUID:extensionPointCache:]( self,  "plugInForProxy:discoveryInstanceUUID:extensionPointCache:",  *(void *)(*((void *)&v19 + 1) + 8 * v14),  0LL,  v10));
          if (v16) {
            [v9 addObject:v16];
          }

          ++v14;
        }

        while (v15 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }

    id v4 = v18;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)plugInsWithExtensionPointName:(id)a3 platforms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  context = objc_autoreleasePoolPush();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v25 = v6;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, PKProtocolAttribute);
  if ([v7 count]) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v7,  PKExtensionPlatformsAttribute);
  }
  id v24 = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase workspace](self, "workspace"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pluginsMatchingQuery:v10 applyFilter:&__block_literal_global]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0LL;
      else {
        uint64_t v17 = (uint64_t)v14;
      }
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * v16);
        __int128 v19 = objc_autoreleasePoolPush();
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[PKDatabase plugInForProxy:discoveryInstanceUUID:extensionPointCache:]( self,  "plugInForProxy:discoveryInstanceUUID:extensionPointCache:",  v18,  0LL,  v9));
        if (v20) {
          -[NSMutableArray addObject:](v8, "addObject:", v20);
        }

        objc_autoreleasePoolPop(v19);
        ++v16;
      }

      while (v17 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v14);
  }

  objc_autoreleasePoolPop(context);
  id v21 = -[NSMutableArray copy](v8, "copy");

  return v21;
}

BOOL __54__PKDatabase_plugInsWithExtensionPointName_platforms___block_invoke( id a1,  NSString *a2,  NSDictionary *a3)
{
  return 1;
}

- (id)addPlugIn:(id)a3
{
  id v4 = a3;
  uint64_t v6 = pklog_handle_for_category(3LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    int v17 = 138412290;
    uint64_t v18 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Registering plugin at [%@]", (uint8_t *)&v17, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase workspace](self, "workspace"));
  unsigned __int8 v10 = [v9 registerPlugin:v4];

  if ((v10 & 1) != 0)
  {
    id v12 = 0LL;
  }

  else
  {
    uint64_t v13 = pklog_handle_for_category(3LL, v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PKDatabase addPlugIn:].cold.1(v4);
    }

    uint64_t v15 = pkError(2LL, @"LaunchServices failed to register the plugin");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  return v12;
}

- (id)removePlugIn:(id)a3
{
  id v4 = a3;
  uint64_t v6 = pklog_handle_for_category(3LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    int v17 = 138412290;
    uint64_t v18 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Unregistering plugin at [%@]", (uint8_t *)&v17, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase workspace](self, "workspace"));
  unsigned __int8 v10 = [v9 unregisterPlugin:v4];

  if ((v10 & 1) != 0)
  {
    id v12 = 0LL;
  }

  else
  {
    uint64_t v13 = pklog_handle_for_category(3LL, v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PKDatabase removePlugIn:].cold.1(v4);
    }

    uint64_t v15 = pkError(2LL, @"LaunchServices failed to deregister the plugin");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  return v12;
}

- (id)annotationForPlugIn:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase annotations](self, "annotations"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 annotationForPlugIn:v5]);

  os_unfair_lock_unlock(p_cacheLock);
  return v7;
}

- (id)annotationForIdentifier:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase annotations](self, "annotations"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 annotationForIdentifier:v5]);

  os_unfair_lock_unlock(p_cacheLock);
  return v7;
}

- (id)setAnnotation:(id)a3 forPlugIn:(id)a4
{
  p_cacheLock = &self->_cacheLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase annotations](self, "annotations"));
  [v9 setAnnotation:v8 forPlugIn:v7];

  os_unfair_lock_unlock(p_cacheLock);
  return 0LL;
}

- (void)notifyAnnotationChange
{
  uint64_t v2 = pklog_handle_for_category(10LL, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Notifying continous discovery clients of an annotation change.",  v4,  2u);
  }

  PKAnnotationNotificationPost();
}

- (void)_locked_autoElect:(id)a3
{
  id v12 = a3;
  os_unfair_lock_assert_owner(&self->_cacheLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase annotations](self, "annotations"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 annotationForPlugIn:v12]);

  if (v5) {
    uint64_t v6 = (void *)v5;
  }
  else {
    uint64_t v6 = &__NSDictionary0__struct;
  }
  uint64_t v7 = PKAnnotationElectionKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationElectionKey]);
  id v9 = v8;
  if (!v8 || ![v8 integerValue])
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase annotations](self, "annotations"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryChanging:v7 to:&off_25FA8]);
    [v10 setAnnotation:v11 forPlugIn:v12];
  }
}

- (void)pluginsDidInstall:(id)a3
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v23;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v6 = 0LL;
      else {
        uint64_t v7 = (uint64_t)v3;
      }
      uint64_t v19 = v7;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v6);
        uint64_t v9 = pklog_handle_for_category(3LL, v4);
        unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pluginUUID]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 pluginIdentifier]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleVersion]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleURL]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containingBundle]);
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
          *(_DWORD *)buf = 138544642;
          __int128 v27 = v11;
          __int16 v28 = 2112;
          __int128 v29 = v12;
          __int16 v30 = 2112;
          v31 = v13;
          __int16 v32 = 2112;
          uint64_t v33 = v14;
          __int16 v34 = 2112;
          v35 = v15;
          __int16 v36 = 2112;
          v37 = v17;
          _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] plugin INSTALLED; bundleID: [%@], path: [%@], contained in [%@]",
            buf,
            0x3Eu);

          uint64_t v5 = v18;
          uint64_t v7 = v19;
        }

        pkdMessageTraceInstall(v8);
        ++v6;
      }

      while (v7 != v6);
      id v3 = [obj countByEnumeratingWithState:&v22 objects:v38 count:16];
    }

    while (v3);
  }
}

- (void)pluginsWillUninstall:(id)a3
{
  id v3 = a3;
  uint64_t v5 = pklog_handle_for_category(3LL, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[PKDatabase pluginsWillUninstall:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  context = objc_autoreleasePoolPush();
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v35;
    p_cacheLock = &self->_cacheLock;
    uint64_t v29 = *(void *)v35;
    do
    {
      uint64_t v11 = 0LL;
      else {
        uint64_t v12 = (uint64_t)v7;
      }
      uint64_t v33 = v12;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        uint64_t v14 = pklog_handle_for_category(3LL, v8);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue([v13 pluginUUID]);
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v13 pluginIdentifier]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleVersion]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleURL]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v31 path]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 containingBundle]);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
          *(_DWORD *)buf = 138544642;
          v39 = v16;
          __int16 v40 = 2112;
          v41 = v17;
          __int16 v42 = 2112;
          unint64_t v43 = v18;
          __int16 v44 = 2112;
          uint64_t v45 = v19;
          __int16 v46 = 2112;
          v47 = v20;
          __int16 v48 = 2112;
          unint64_t v49 = v22;
          _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] plugin UNINSTALLED; bundleID: [%@], path: [%@], contained in [%@]",
            buf,
            0x3Eu);

          uint64_t v9 = v29;
          p_cacheLock = &self->_cacheLock;
        }

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 pluginUUID]);
        os_unfair_lock_lock(p_cacheLock);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase _locked_cachedPlugInWithUUID:](self, "_locked_cachedPlugInWithUUID:", v23));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase cache](self, "cache"));
        [v25 removeObjectForKey:v23];

        os_unfair_lock_unlock(p_cacheLock);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));

        if (v24 != v26) {
          pkdMessageTraceUninstall(v24);
        }

        ++v11;
      }

      while (v33 != v11);
      id v7 = [obj countByEnumeratingWithState:&v34 objects:v50 count:16];
    }

    while (v7);
  }

  objc_autoreleasePoolPop(context);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase delegate](self, "delegate"));
  [v27 removedPlugIns:obj];
}

- (PKApplicationWorkspaceProxy)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (PKDAnnotationStore)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (unint64_t)cacheHits
{
  return self->_cacheHits;
}

- (void)setCacheHits:(unint64_t)a3
{
  self->_cacheHits = a3;
}

- (unint64_t)cacheMisses
{
  return self->_cacheMisses;
}

- (void)setCacheMisses:(unint64_t)a3
{
  self->_cacheMisses = a3;
}

- (id)regionObserver
{
  return self->_regionObserver;
}

- (void)setRegionObserver:(id)a3
{
}

- (PKDPersonaCache)personaCache
{
  return self->_personaCache;
}

- (void)setPersonaCache:(id)a3
{
}

- (PKDatabaseDelegate)delegate
{
  return (PKDatabaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PKDExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
}

- (void)_locked_cachedPlugInWithUUID:.cold.1()
{
}

- (void)_locked_cachedPlugInWithUUID:(os_log_s *)a3 .cold.2(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));
  OUTLINED_FUNCTION_3();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_4(&dword_0, a3, v6, "%scache hit for %@", v7);
}

- (void)createPlugInForProxy:uuid:discoveryInstanceUUID:extensionPointCache:.cold.1()
{
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_4(&dword_0, v1, (uint64_t)v1, "%scache add for %@", v2);
}

- (void)findPlugInsForQuery:(void *)a1 discoveryInstanceUUID:(os_log_s *)a2 allVersions:.cold.1(void *a1, os_log_s *a2)
{
  v4[0] = 67109378;
  v4[1] = [a1 count];
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%d installedPlugins: %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

- (void)findPlugInWithUUID:(void *)a1 discoveryUUID:extensionPointCache:.cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 UUIDString]);
  OUTLINED_FUNCTION_0_0(&dword_0, v2, v3, "LaunchServices cannot find plugin with UUID: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)findPlugInAtPath:(void *)a1 .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_0, v2, v3, "LaunchServices cannot find plugin at path: [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)addPlugIn:(void *)a1 .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_0, v2, v3, "Registering plugin at [%@] failed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)removePlugIn:(void *)a1 .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_0, v2, v3, "Unregistering plugin at [%@] failed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end