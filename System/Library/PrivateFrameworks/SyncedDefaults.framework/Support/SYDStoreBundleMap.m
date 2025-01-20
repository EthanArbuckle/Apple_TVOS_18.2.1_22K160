@interface SYDStoreBundleMap
+ (id)disabledStoreIdentifiers;
+ (id)sharedInstance;
- (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3;
- (BOOL)isStoreIdentifierUsedOnThisDevice:(id)a3;
- (BOOL)shouldSyncStoreWithIdentifier:(id)a3;
- (NSDictionary)cachedStoreBundleMap;
- (OS_dispatch_queue)queue;
- (SYDStoreBundleMap)init;
- (id)bundleIdentifiersForStoreIdentifier:(id)a3;
- (id)generateStoreBundleMap;
- (id)storeIdentifiersForInstalledBundles;
- (void)clearCachedStoreBundleMap;
- (void)dealloc;
- (void)generateStoreBundleMapIfNecessary;
- (void)installedAppsDidChange:(id)a3;
- (void)setCachedStoreBundleMap:(id)a3;
- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation SYDStoreBundleMap

+ (id)sharedInstance
{
  if (qword_100057950 != -1) {
    dispatch_once(&qword_100057950, &stru_10004C978);
  }
  return (id)qword_100057948;
}

- (SYDStoreBundleMap)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SYDStoreBundleMap;
  v2 = -[SYDStoreBundleMap init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.kvs.bundle-store-map", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v7 addObserver:v2 selector:"installedAppsDidChange:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 addObserver:v2 selector:"installedAppsDidChange:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYDStoreBundleMap;
  -[SYDStoreBundleMap dealloc](&v4, "dealloc");
}

- (BOOL)shouldSyncStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!-[SYDStoreBundleMap isStoreIdentifierUsedOnThisDevice:](self, "isStoreIdentifierUsedOnThisDevice:", v4))
  {
    id v9 = SYDGetConnectionLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002B0C0();
    }
    goto LABEL_11;
  }

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SYDTCCHelper sharedHelper](&OBJC_CLASS___SYDTCCHelper, "sharedHelper"));
  unsigned int v6 = [v5 isUbiquityDisabledForStoreIdentifier:v4];

  if (v6)
  {
    id v7 = SYDGetConnectionLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002B000();
    }
LABEL_11:

    BOOL v10 = 0;
    goto LABEL_12;
  }

  if (!-[SYDStoreBundleMap isCloudSyncUserDefaultEnabledForStoreIdentifier:]( self,  "isCloudSyncUserDefaultEnabledForStoreIdentifier:",  v4))
  {
    id v11 = SYDGetConnectionLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002B060();
    }
    goto LABEL_11;
  }

  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 1;
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003F1C;
  v9[3] = &unk_10004C9A0;
  id v10 = v5;
  id v11 = self;
  v12 = &v14;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(v6, v9);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000040E8;
  block[3] = &unk_10004C9C8;
  v12 = self;
  SEL v13 = a2;
  id v11 = v7;
  BOOL v14 = a3;
  id v9 = v7;
  dispatch_sync(v8, block);
}

+ (id)disabledStoreIdentifiers
{
  if (qword_100057960 != -1) {
    dispatch_once(&qword_100057960, &stru_10004C9E8);
  }
  return (id)qword_100057958;
}

- (BOOL)isStoreIdentifierUsedOnThisDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) disabledStoreIdentifiers];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = SYDGetConnectionLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002B1F0();
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SYDStoreBundleMap storeIdentifiersForInstalledBundles]( self,  "storeIdentifiersForInstalledBundles"));
    unsigned __int8 v12 = [v11 containsObject:v4];

    if ((v12 & 1) != 0) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = [v4 hasPrefix:@"com.apple."];
    }
  }

  return v10;
}

- (id)bundleIdentifiersForStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10000456C;
  v19 = sub_10000457C;
  id v20 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004584;
  block[3] = &unk_10004CA10;
  void block[4] = self;
  BOOL v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(v5, block);

  if ([(id)v16[5] count])
  {
    id v7 = SYDGetMiscLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002B2B0();
    }
  }

  else
  {
    id v9 = SYDGetMiscLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002B250();
    }
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)generateStoreBundleMapIfNecessary
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap cachedStoreBundleMap](self, "cachedStoreBundleMap"));
  if (!v4)
  {
    id v5 = SYDGetMiscLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002B334(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap generateStoreBundleMap](self, "generateStoreBundleMap"));
    -[SYDStoreBundleMap setCachedStoreBundleMap:](self, "setCachedStoreBundleMap:", v14);
  }

- (void)clearCachedStoreBundleMap
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000046E0;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)storeIdentifiersForInstalledBundles
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10000456C;
  uint64_t v11 = sub_10000457C;
  id v12 = 0LL;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004828;
  v6[3] = &unk_10004CA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)generateStoreBundleMap
{
  id v2 = SYDGetMiscLog();
  dispatch_queue_attr_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002B394(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  uint64_t v13 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationExtensionRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "enumeratorWithOptions:",  0LL));
  v52 = (void *)v12;
  v83[0] = v12;
  v83[1] = v51;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 2LL));
  id v55 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v72;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v14;
        uint64_t v15 = *(void **)(*((void *)&v71 + 1) + 8 * v14);
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        id v59 = v15;
        id v16 = [v59 countByEnumeratingWithState:&v67 objects:v82 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v68;
          uint64_t v57 = *(void *)v68;
          do
          {
            v19 = 0LL;
            id v58 = v17;
            do
            {
              if (*(void *)v68 != v18) {
                objc_enumerationMutation(v59);
              }
              id v20 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)v19);
              objc_opt_class(v13[75]);
              if ((objc_opt_isKindOfClass(v20) & 1) != 0)
              {
                uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 effectiveBundleIdentifier]);
              }

              else
              {
                objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
                if ((objc_opt_isKindOfClass(v20) & 1) == 0)
                {
                  id v35 = SYDGetMiscLog();
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v77 = (os_log_s *)v20;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "LSBundleRecord did not map to an effectiveBundleIdentifier or contain one: %@",  buf,  0xCu);
                  }

                  goto LABEL_25;
                }

                uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
              }

              v22 = (os_log_s *)v21;
              if (v21)
              {
                id v23 = SYDGetMiscLog();
                v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v77 = v22;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Checking if bundle identifier: %@ is entitled for KVS",  buf,  0xCu);
                }

                v25 = (void *)objc_claimAutoreleasedReturnValue([v20 entitlements]);
                id v26 = [v25 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier" ofClass:objc_opt_class(NSString)];
                uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
                uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
                uint64_t v30 = v28;
                v31 = (void *)v27;
                v32 = (void *)objc_claimAutoreleasedReturnValue( [v25 objectForKey:@"com.apple.private.ubiquity-additional-kvstore-identifiers" ofClass:v30 valuesOfClass:v29]);
                v33 = v32;
                v62 = v32;
                if (v31)
                {
                  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  -[NSMutableArray addObject:](v34, "addObject:", v31);
                  goto LABEL_29;
                }

                uint64_t v13 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
                if ([v32 count])
                {
                  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  v33 = v62;
LABEL_29:
                  if ([v33 count]) {
                    -[NSMutableArray addObjectsFromArray:](v34, "addObjectsFromArray:", v33);
                  }
                  v60 = v31;
                  v61 = v25;
                  id v38 = SYDGetMiscLog();
                  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
                    v47 = (os_log_s *)-[NSMutableArray count](v34, "count");
                    *(_DWORD *)buf = 134218498;
                    v77 = v47;
                    __int16 v78 = 2112;
                    v79 = v22;
                    __int16 v80 = 2112;
                    v81 = v34;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "Found %ld store identifiers for bundle identifier: %@ %@ ",  buf,  0x20u);
                  }

                  __int128 v65 = 0u;
                  __int128 v66 = 0u;
                  __int128 v63 = 0u;
                  __int128 v64 = 0u;
                  v40 = v34;
                  id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
                  if (v41)
                  {
                    id v42 = v41;
                    uint64_t v43 = *(void *)v64;
                    do
                    {
                      for (i = 0LL; i != v42; i = (char *)i + 1)
                      {
                        if (*(void *)v64 != v43) {
                          objc_enumerationMutation(v40);
                        }
                        uint64_t v45 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)i);
                        v46 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  v45));
                        if (!v46)
                        {
                          v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v46,  v45);
                        }

                        -[NSMutableArray addObject:](v46, "addObject:", v22);
                      }

                      id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
                    }

                    while (v42);
                  }

                  uint64_t v13 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
                  uint64_t v18 = v57;
                  id v17 = v58;
                  v31 = v60;
                  v25 = v61;
                }

                goto LABEL_44;
              }

- (void)installedAppsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDStoreBundleMap queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004F5C;
  v7[3] = &unk_10004CA88;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)cachedStoreBundleMap
{
  return self->_cachedStoreBundleMap;
}

- (void)setCachedStoreBundleMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end