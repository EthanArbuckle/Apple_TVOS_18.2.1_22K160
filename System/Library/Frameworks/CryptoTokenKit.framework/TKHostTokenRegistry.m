@interface TKHostTokenRegistry
+ (id)allowedBundlesFromEntitlements:(id)a3;
+ (id)bundleIdentifierFromAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resetDB;
- (NSArray)tokenClassIDs;
- (NSArray)tokens;
- (NSDictionary)tokenExtensions;
- (NSMutableArray)externalTransactions;
- (NSMutableDictionary)pendingCreationTokens;
- (NSMutableDictionary)toBeRemovedTokens;
- (NSMutableDictionary)tokensByTokenID;
- (NSUserDefaults)storage;
- (NSXPCListener)listener;
- (TKHostKeychainHandler)keychain;
- (TKHostTokenDriverCache)driverCache;
- (TKHostTokenRegistry)initWithDriverCache:(id)a3 listener:(id)a4 keychain:(id)a5;
- (TKHostTokenRegistryDelegate)delegate;
- (id)beginTransaction:(id)a3;
- (id)createTokenWithTokenID:(id)a3 persistent:(BOOL)a4;
- (id)reloadTokenClassesFromStore;
- (id)tokenWithTokenID:(id)a3;
- (void)commitTransaction;
- (void)dealloc;
- (void)keychainItemsModified:(id)a3;
- (void)loadTokensFromStore:(id)a3;
- (void)markModified;
- (void)notifyTokenReinsertion:(id)a3;
- (void)registerClassIDs:(id)a3;
- (void)removeTokenWithTokenID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResetDB:(BOOL)a3;
@end

@implementation TKHostTokenRegistry

- (TKHostTokenRegistry)initWithDriverCache:(id)a3 listener:(id)a4 keychain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TKHostTokenRegistry;
  v12 = -[TKHostTokenRegistry init](&v27, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_driverCache, a3);
    -[TKHostTokenDriverCache setRegistry:](v13->_driverCache, "setRegistry:", v13);
    objc_storeStrong((id *)&v13->_keychain, a5);
    v14 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
    tokensByTokenID = v13->_tokensByTokenID;
    v13->_tokensByTokenID = v14;

    v16 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
    pendingCreationTokens = v13->_pendingCreationTokens;
    v13->_pendingCreationTokens = v16;

    tokenClassIDs = v13->_tokenClassIDs;
    v13->_tokenClassIDs = (NSArray *)&__NSArray0__struct;

    v19 = (NSMutableArray *)[&__NSArray0__struct mutableCopy];
    externalTransactions = v13->_externalTransactions;
    v13->_externalTransactions = v19;

    v21 = (NSMutableArray *)[&__NSArray0__struct mutableCopy];
    keychainItemsDirty = v13->_keychainItemsDirty;
    v13->_keychainItemsDirty = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    clientConnections = v13->_clientConnections;
    v13->_clientConnections = (NSHashTable *)v23;

    objc_storeStrong((id *)&v13->_listener, a4);
    -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
    -[NSXPCListener resume](v13->_listener, "resume");
    v25 = (void *)objc_claimAutoreleasedReturnValue([v9 allowedExtensionClassIDs]);
    v13->_resetDB = v25 != 0LL;
  }

  return v13;
}

+ (id)bundleIdentifierFromAuditToken:(id *)a3
{
  if (&_CPCopyBundleIdentifierAndTeamFromAuditToken)
  {
    __int128 v4 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v42[0].val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v42[0].val[4] = v4;
    CPCopyBundleIdentifierAndTeamFromAuditToken(v42, 0LL, 0LL);
  }

  id v5 = sub_100003CA0();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100010620();
  }

  __int128 v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v42[0].val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v42[0].val[4] = v7;
  uint64_t v8 = audit_token_to_pid(v42);
  int v9 = proc_pidpath(v8, v42, 0x1000u);
  if (v9 <= 0)
  {
    id v19 = sub_100003CA0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000103D8(v8, v11, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_18;
  }

  id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v42,  v9,  4LL);
  if (!v10)
  {
    id v26 = sub_100003CA0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001043C(v8, v11, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_18;
  }

  id v11 = v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  if (!v12)
  {
    id v33 = sub_100003CA0();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000104A0();
    }

LABEL_18:
    id v17 = 0LL;
LABEL_19:
    v35 = 0LL;
    goto LABEL_20;
  }

  v13 = (void *)v12;
  v14 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  if (v14)
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v14));
    v16 = v15;
    if (v15)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s bundleIdentifier](v15, "bundleIdentifier"));
      int v18 = 1;
      goto LABEL_27;
    }

    id v38 = sub_100003CA0();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1000105C0();
    }
  }

  else
  {
    id v37 = sub_100003CA0();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100010560();
    }
  }

  int v18 = 0;
  id v17 = 0LL;
LABEL_27:

  if (!v18) {
    goto LABEL_19;
  }
  id v40 = sub_100003CA0();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100010500();
  }

  id v17 = v17;
  v35 = v17;
LABEL_20:

  return v35;
}

+ (id)allowedBundlesFromEntitlements:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [a3 valueForEntitlement:@"com.apple.private.ctk.configuration-allowed-for-bundles"]);
  if (!v3)
  {
LABEL_18:
    uint64_t v12 = 0LL;
    goto LABEL_19;
  }

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    id v13 = sub_100003CA0();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100010678();
    }
LABEL_17:

    goto LABEL_18;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
        {
          id v14 = sub_100003CA0();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10001064C();
          }

          goto LABEL_17;
        }

        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = v5;
LABEL_19:

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
  }

  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TKHostTokenRegistry bundleIdentifierFromAuditToken:]( &OBJC_CLASS___TKHostTokenRegistry,  "bundleIdentifierFromAuditToken:",  &v19));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TKHostTokenRegistry allowedBundlesFromEntitlements:]( &OBJC_CLASS___TKHostTokenRegistry,  "allowedBundlesFromEntitlements:",  v8));
  uint64_t v11 = v10;
  if (v9) {
    goto LABEL_5;
  }
  if (v10 && [v10 count])
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
LABEL_5:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TKTokenConfiguration interfaceForProtocol]( &OBJC_CLASS___TKTokenConfiguration,  "interfaceForProtocol",  v19,  v20));
    [v8 setExportedInterface:v12];

    id v13 = -[TKHostTokenRegistryConfigurationProxy initWithRegistry:callerBundleID:allowedForBundles:]( objc_alloc(&OBJC_CLASS___TKHostTokenRegistryConfigurationProxy),  "initWithRegistry:callerBundleID:allowedForBundles:",  self,  v9,  v11);
    [v8 setExportedObject:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TKTokenConfiguration interfaceForChangeProtocol]( &OBJC_CLASS___TKTokenConfiguration,  "interfaceForChangeProtocol"));
    [v8 setRemoteObjectInterface:v14];

    [v8 resume];
    v15 = self;
    objc_sync_enter(v15);
    -[NSHashTable addObject:](v15->_clientConnections, "addObject:", v8);
    objc_sync_exit(v15);

    BOOL v16 = 1;
    goto LABEL_12;
  }

  id v17 = sub_100003CA0();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_1000106A4(v8, v9);
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKHostTokenRegistry;
  -[TKHostTokenRegistry dealloc](&v3, "dealloc");
}

- (NSArray)tokens
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_tokensByTokenID, "allKeys"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)beginTransaction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  ++v5->_transactionCounter;
  id v6 = -[TKHostTokenRegistryTransaction initWithRegistry:name:]( objc_alloc(&OBJC_CLASS___TKHostTokenRegistryTransaction),  "initWithRegistry:name:",  v5,  v4);
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)tokenExtensions
{
  v2 = self;
  objc_sync_enter(v2);
  tokenExtensions = v2->_tokenExtensions;
  if (!tokenExtensions)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry driverCache](v2, "driverCache"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 tokenExtensionsWithAttributes:&__NSDictionary0__struct]);
    id v6 = v2->_tokenExtensions;
    v2->_tokenExtensions = (NSDictionary *)v5;

    tokenExtensions = v2->_tokenExtensions;
  }

  id v7 = tokenExtensions;
  objc_sync_exit(v2);

  return v7;
}

- (void)markModified
{
  obj = self;
  objc_sync_enter(obj);
  obj->_storageDirty = 1;
  objc_sync_exit(obj);
}

- (void)keychainItemsModified:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_sync_exit(v4);
}

- (void)commitTransaction
{
  objc_super v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = v3->_transactionCounter - 1;
  v3->_transactionCounter = v4;
  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](v3, "storage"));
    if (v5)
    {
      BOOL storageDirty = v3->_storageDirty;

      if (storageDirty)
      {
        id v7 = [&__NSDictionary0__struct mutableCopy];
        SEL v30 = a2;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        obj = v3->_tokensByTokenID;
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
        if (v8)
        {
          uint64_t v9 = *(void *)v38;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v38 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3->_tokensByTokenID,  "objectForKeyedSubscript:",  v11));
              if (([v12 persistent] & 1) != 0
                || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keychainItems]),
                    BOOL v14 = [v13 count] == 0,
                    v13,
                    !v14))
              {
                id v36 = 0LL;
                v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v36));
                id v16 = v36;
                if (!v15)
                {
                  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSAssertionHandler currentHandler]( &OBJC_CLASS___NSAssertionHandler,  "currentHandler"));
                  [v18 handleFailureInMethod:v30, v3, @"TKHostTokenRegistry.m", 249, @"Failed to archive data of token %@, error: %@", v12, v16 object file lineNumber description];
                }

                id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 stringRepresentation]);
                [v7 setObject:v15 forKeyedSubscript:v17];
              }
            }

            id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
          }

          while (v8);
        }

        id v19 = sub_100003CA0();
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_100010758();
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](v3, "storage"));
        [v21 setObject:v7 forKey:@"tokens"];

        if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication))
        {
          id v22 = sub_100003CA0();
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_10001072C();
          }
        }

        v3->_BOOL storageDirty = 0;
      }
    }

    if (-[NSMutableArray count](v3->_keychainItemsDirty, "count"))
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v24 = v3->_clientConnections;
      id v25 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      if (v25)
      {
        uint64_t v26 = *(void *)v33;
        do
        {
          for (j = 0LL; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v33 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)j) remoteObjectProxy]);
            [v28 tokenConfigurationChanged:v3->_keychainItemsDirty];
          }

          id v25 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
        }

        while (v25);
      }

      -[NSMutableArray removeAllObjects](v3->_keychainItemsDirty, "removeAllObjects");
    }

    -[NSMutableDictionary removeAllObjects](v3->_pendingCreationTokens, "removeAllObjects");
    tokenExtensions = v3->_tokenExtensions;
    v3->_tokenExtensions = 0LL;
  }

  objc_sync_exit(v3);
}

- (id)tokenWithTokenID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_tokensByTokenID, "objectForKeyedSubscript:", v4));
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v5->_pendingCreationTokens,  "objectForKeyedSubscript:",  v4));
  }
  uint64_t v9 = v8;

  objc_sync_exit(v5);
  return v9;
}

- (void)removeTokenWithTokenID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry beginTransaction:](self, "beginTransaction:", @"removeTokenWithTokenID"));
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_tokensByTokenID, "objectForKeyedSubscript:", v4));
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_toBeRemovedTokens, "setObject:forKeyedSubscript:", v7, v4);
    -[NSMutableDictionary removeObjectForKey:](v6->_tokensByTokenID, "removeObjectForKey:", v4);
    [v7 setKeychainItems:&__NSArray0__struct];
    [v7 setRegistry:0];
    objc_sync_exit(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 driver]);
    [v8 releaseTokenWithTokenID:v4];

    uint64_t v9 = v6;
    objc_sync_enter(v9);
    -[NSMutableDictionary removeObjectForKey:](v6->_toBeRemovedTokens, "removeObjectForKey:", v4);
    objc_sync_exit(v9);

    id v10 = sub_100003CA0();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Removing token %{public}@ from system",  (uint8_t *)&v15,  0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry delegate](v9, "delegate"));
    [v12 hostTokenRegistry:v9 removedToken:v4];

    id v6 = (TKHostTokenRegistry *)objc_claimAutoreleasedReturnValue([v5 markModified]);
    -[TKHostTokenRegistry commit](v6, "commit");
  }

  else
  {
    [v5 commit];
    id v13 = sub_100003CA0();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100010784();
    }

    objc_sync_exit(v6);
  }
}

- (void)notifyTokenReinsertion:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_tokensByTokenID, "objectForKeyedSubscript:", v8));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry delegate](v4, "delegate"));
    [v6 hostTokenRegistry:v4 removedToken:v8];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry delegate](v4, "delegate"));
    [v7 hostTokenRegistry:v4 addedToken:v8];
  }

  objc_sync_exit(v4);
}

- (id)createTokenWithTokenID:(id)a3 persistent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v8 = 0;
  BOOL v9 = 0;
  int v10 = 100;
  while (1)
  {
    if (v8) {
      -[TKHostTokenRegistry removeTokenWithTokenID:](self, "removeTokenWithTokenID:", v7);
    }
    if (v9) {
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.01);
    }
    uint64_t v11 = self;
    objc_sync_enter(v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_toBeRemovedTokens,  "objectForKeyedSubscript:",  v7));
    BOOL v9 = v12 != 0LL;

    if (!v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tokensByTokenID,  "objectForKeyedSubscript:",  v7));

      if (!v13) {
        break;
      }
    }

    BOOL v8 = v12 == 0LL;
    objc_sync_exit(v11);

    if (!--v10)
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
      [v14 handleFailureInMethod:a2, v11, @"TKHostTokenRegistry.m", 353, @"createTokenWithTokenID failed %@", v15 object file lineNumber description];

      id v16 = 0LL;
      goto LABEL_16;
    }
  }

  id v16 = (TKHostToken *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11->_pendingCreationTokens,  "objectForKeyedSubscript:",  v7));
  if (v16)
  {
    -[NSMutableDictionary removeObjectForKey:](v11->_pendingCreationTokens, "removeObjectForKey:", v7);
  }

  else
  {
    id v16 = -[TKHostToken initWithTokenID:persistent:]( objc_alloc(&OBJC_CLASS___TKHostToken),  "initWithTokenID:persistent:",  v7,  v4);
    -[TKHostToken setRegistry:](v16, "setRegistry:", v11);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokensByTokenID, "setObject:forKeyedSubscript:", v16, v7);
  id v17 = sub_100003CA0();
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Adding token %{public}@ to system", buf, 0xCu);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry beginTransaction:](v11, "beginTransaction:", @"createTokenWithTokenID"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 markModified]);
  [v20 commit];

  objc_sync_exit(v11);
LABEL_16:

  return v16;
}

- (void)loadTokensFromStore:(id)a3
{
  id v37 = a3;
  id v3 = sub_100003CA0();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010858();
  }

  id v5 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.security.%@-db",  v37));
  id v7 = -[NSUserDefaults initWithSuiteName:](v5, "initWithSuiteName:", v6);
  storage = self->_storage;
  self->_storage = v7;

  if (-[TKHostTokenRegistry resetDB](self, "resetDB"))
  {
    id v9 = sub_100003CA0();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "cleaning existing registry DB", buf, 2u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](self, "storage"));
    [v11 removeObjectForKey:@"classes"];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](self, "storage"));
    [v12 removeObjectForKey:@"tokens"];
  }

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry beginTransaction:](self, "beginTransaction:", @"loadTokensFromStore"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](self, "storage"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"tokens"]);

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {

    BOOL v14 = &__NSDictionary0__struct;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v16);
        }
        __int128 v20 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___TKHostToken);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v20]);
        id v42 = 0LL;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v21,  v22,  &v42));
        id v24 = v42;

        if (v23)
        {
          [v23 setRegistry:self];
          unsigned int v25 = [v23 persistent];
          id v26 = sub_100003CA0();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          uint64_t v28 = v27;
          if (v25)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              sub_1000107E4(v47, v23, &v48, v28);
            }

            tokensByTokenID = self->_tokensByTokenID;
            SEL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 tokenID]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( tokensByTokenID,  "setObject:forKeyedSubscript:",  v23,  v30);
          }

          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v23 tokenID]);
              *(_DWORD *)buf = 138543362;
              v50 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Deleting keychain items from token %{public}@",  buf,  0xCu);
            }

            [v23 setKeychainItems:&__NSArray0__struct];
            id v33 = [v38 markModified];
            SEL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 tokenID]);
            id v34 = [v38 keychainItemsModified:v30];
          }
        }

        else
        {
          id v31 = sub_100003CA0();
          SEL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v20;
            __int16 v51 = 2114;
            id v52 = v24;
            _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to read data of token %{public}@ - skipping. Error: %{public}@",  buf,  0x16u);
          }
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }

    while (v17);
  }

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry reloadTokenClassesFromStore](self, "reloadTokenClassesFromStore"));
  -[TKHostTokenRegistry registerClassIDs:](self, "registerClassIDs:", v35);
  [v38 commit];
  objc_initWeak((id *)buf, self);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry keychain](self, "keychain"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000051C8;
  v40[3] = &unk_10001C680;
  objc_copyWeak(&v41, (id *)buf);
  [v36 accessKeychainWithBlock:v40];

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);
}

- (id)reloadTokenClassesFromStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TKHostTokenRegistry beginTransaction:]( self,  "beginTransaction:",  @"reloadTokenClassesFromStore"));
  uint64_t v77 = 0LL;
  v78 = &v77;
  uint64_t v79 = 0x2020000000LL;
  char v80 = 0;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](self, "storage"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"classes"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {

    BOOL v4 = &__NSDictionary0__struct;
  }

  id v6 = [&__NSDictionary0__struct mutableCopy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 tokenExtensions]);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_100005C38;
  v75[3] = &unk_10001C6A8;
  id v55 = v6;
  id v76 = v55;
  [v7 enumerateKeysAndObjectsUsingBlock:v75];

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obj = v4;
  id v54 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v72;
    *(void *)&__int128 v8 = 138543618LL;
    __int128 v52 = v8;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v72 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v71 + 1) + 8 * v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v10, v52));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v10]);
        unsigned __int8 v13 = [v11 isEqual:v12];
        uint64_t v57 = v9;

        if ((v13 & 1) == 0)
        {
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v10]);
          BOOL v15 = v14 == 0LL;

          if (v15)
          {
            id v16 = [&__NSArray0__struct mutableCopy];
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v68 = 0u;
            __int128 v67 = 0u;
            id v17 = self->_tokensByTokenID;
            id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v67,  v86,  16LL);
            if (v18)
            {
              uint64_t v19 = *(void *)v68;
              do
              {
                for (i = 0LL; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v68 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 classID]);
                  unsigned int v23 = [v22 isEqualToString:v10];

                  if (v23)
                  {
                    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tokensByTokenID,  "objectForKeyedSubscript:",  v21));
                    [v16 addObject:v24];
                  }
                }

                id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v67,  v86,  16LL);
              }

              while (v18);
            }

            id v25 = sub_100003CA0();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v2 tokenExtensions]);
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v10]);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
              unsigned int v30 = [v16 count];
              *(_DWORD *)buf = v52;
              v83 = v29;
              __int16 v84 = 1024;
              unsigned int v85 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Token driver %{public}@ disappeared, deleting its %d tokens",  buf,  0x12u);
            }

            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id v31 = v16;
            id v32 = [v31 countByEnumeratingWithState:&v63 objects:v81 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v64;
              do
              {
                for (j = 0LL; j != v32; j = (char *)j + 1)
                {
                  if (*(void *)v64 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  __int128 v35 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)j);
                  [v35 setKeychainItems:&__NSArray0__struct];
                  tokensByTokenID = self->_tokensByTokenID;
                  id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 tokenID]);
                  -[NSMutableDictionary removeObjectForKey:](tokensByTokenID, "removeObjectForKey:", v37);

                  id v38 = [v2 markModified];
                  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v35 tokenID]);
                  id v40 = [v2 keychainItemsModified:v39];
                }

                id v32 = [v31 countByEnumeratingWithState:&v63 objects:v81 count:16];
              }

              while (v32);
            }
          }

          *((_BYTE *)v78 + 24) = 1;
        }

        uint64_t v9 = v57 + 1;
      }

      while ((id)(v57 + 1) != v54);
      id v54 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
    }

    while (v54);
  }

  id v41 = [&__NSArray0__struct mutableCopy];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_100005CB8;
  v59[3] = &unk_10001C6D0;
  id v42 = obj;
  id v60 = v42;
  id v43 = v41;
  id v61 = v43;
  v62 = &v77;
  [v55 enumerateKeysAndObjectsUsingBlock:v59];
  if (*((_BYTE *)v78 + 24))
  {
    id v44 = sub_100003CA0();
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      sub_1000108E4((int)[v55 count], buf, v45);
    }

    __int128 v46 = (NSArray *)objc_claimAutoreleasedReturnValue([v55 allKeys]);
    tokenClassIDs = self->_tokenClassIDs;
    self->_tokenClassIDs = v46;

    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry storage](self, "storage"));
    [v48 setObject:v55 forKey:@"classes"];
  }

  [v2 commit];
  v49 = v61;
  id v50 = v43;

  _Block_object_dispose(&v77, 8);
  return v50;
}

- (void)registerClassIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry beginTransaction:](self, "beginTransaction:", @"registerClassIDs"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v32;
    *(void *)&__int128 v7 = 138543618LL;
    __int128 v28 = v7;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistry driverCache](self, "driverCache", v28));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 tokenExtensions]);
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v11 hostTokenDriverFromExtension:v13]);

        id v30 = 0LL;
        LODWORD(v12) = [v14 configureWithError:&v30];
        id v15 = v30;
        if ((_DWORD)v12)
        {
          id v16 = sub_100003CA0();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 extension]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            *(_DWORD *)buf = 138543362;
            id v36 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "New token driver %{public}@ successfully configured",  buf,  0xCu);
          }
        }

        else
        {
          __int128 v20 = self;
          objc_sync_enter(v20);
          id v21 = -[NSArray mutableCopy](self->_tokenClassIDs, "mutableCopy");
          [v21 removeObject:v10];
          id v22 = (NSArray *)[v21 copy];
          tokenClassIDs = self->_tokenClassIDs;
          self->_tokenClassIDs = v22;

          id v24 = [v5 markModified];
          objc_sync_exit(v20);

          id v25 = sub_100003CA0();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 extension]);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
            *(_DWORD *)buf = v28;
            id v36 = v27;
            __int16 v37 = 2114;
            id v38 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Configuration of token driver %{public}@ failed: %{public}@",  buf,  0x16u);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v6);
  }

  [v5 commit];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (TKHostKeychainHandler)keychain
{
  return self->_keychain;
}

- (TKHostTokenRegistryDelegate)delegate
{
  return (TKHostTokenRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TKHostTokenDriverCache)driverCache
{
  return self->_driverCache;
}

- (NSUserDefaults)storage
{
  return self->_storage;
}

- (BOOL)resetDB
{
  return self->_resetDB;
}

- (void)setResetDB:(BOOL)a3
{
  self->_resetDB = a3;
}

- (NSArray)tokenClassIDs
{
  return self->_tokenClassIDs;
}

- (NSMutableArray)externalTransactions
{
  return self->_externalTransactions;
}

- (NSMutableDictionary)pendingCreationTokens
{
  return self->_pendingCreationTokens;
}

- (NSMutableDictionary)tokensByTokenID
{
  return self->_tokensByTokenID;
}

- (NSMutableDictionary)toBeRemovedTokens
{
  return self->_toBeRemovedTokens;
}

- (void).cxx_destruct
{
}

@end