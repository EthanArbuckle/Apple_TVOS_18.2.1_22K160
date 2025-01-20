@interface TKHostTokenRegistryConfigurationProxy
- (BOOL)ensureAccessForClassID:(id)a3;
- (BOOL)haveAccessForClassID:(id)a3 verbose:(BOOL)a4;
- (TKHostTokenRegistry)registry;
- (TKHostTokenRegistryConfigurationProxy)initWithRegistry:(id)a3 callerBundleID:(id)a4 allowedForBundles:(id)a5;
- (id)ensureTokenWithTokenID:(id)a3;
- (void)beginTransactionWithReply:(id)a3;
- (void)createTokenID:(id)a3 persistent:(BOOL)a4 reply:(id)a5;
- (void)endTransactionWithReply:(id)a3;
- (void)getClassIDsWithReply:(id)a3;
- (void)getKeychainItemsForTokenID:(id)a3 reply:(id)a4;
- (void)getTokenIDsForClassID:(id)a3 reply:(id)a4;
- (void)readDataForTokenID:(id)a3 reply:(id)a4;
- (void)removeTokenID:(id)a3 reply:(id)a4;
- (void)updateKeychainItemsForTokenID:(id)a3 items:(id)a4 reply:(id)a5;
- (void)updateTokenID:(id)a3 data:(id)a4 reply:(id)a5;
@end

@implementation TKHostTokenRegistryConfigurationProxy

- (TKHostTokenRegistryConfigurationProxy)initWithRegistry:(id)a3 callerBundleID:(id)a4 allowedForBundles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKHostTokenRegistryConfigurationProxy;
  v11 = -[TKHostTokenRegistryConfigurationProxy init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_registry, v8);
    objc_storeStrong((id *)&v12->_callerBundleID, a4);
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v12->_allowedForBundles, v13);
  }

  return v12;
}

- (BOOL)haveAccessForClassID:(id)a3 verbose:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v50 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"haveAccessForClassID"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenExtensions]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  [v8 commit];
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _plugIn]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 url]);

    if ((_os_feature_enabled_impl("CryptoTokenKit", "RegisterTokens") & 1) == 0)
    {
      if (![v12 isFileURL]
        || (v21 = (void *)objc_claimAutoreleasedReturnValue([v12 path]),
            unsigned __int8 v22 = [v21 hasPrefix:@"/System/"],
            v21,
            (v22 & 1) == 0))
      {
        id v23 = sub_100003CA0();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_100010A0C();
        }
        LOBYTE(v20) = 0;
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
    }

    BOOL v49 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 _plugIn]);
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 identifier]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 _plugIn]);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 containingUrl]);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 _plugIn]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 containingUrl]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v17));
    }

    else
    {
      v18 = 0LL;
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
    callerBundleID = v50->_callerBundleID;
    if (v24)
    {
      v26 = (void *)v24;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
      if (-[NSString hasPrefix:](callerBundleID, "hasPrefix:", v27))
      {

LABEL_20:
        BOOL v20 = 1;
LABEL_36:
        if (v49)
        {
          id v39 = sub_100003CA0();
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            if (v20) {
              v42 = @"Allowing";
            }
            else {
              v42 = @"Refusing";
            }
            v48 = v12;
            v43 = v50->_callerBundleID;
            v44 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
            allowedForBundles = v50->_allowedForBundles;
            *(_DWORD *)buf = 138544642;
            v57 = v42;
            __int16 v58 = 2114;
            v59 = v43;
            v12 = v48;
            __int16 v60 = 2114;
            id v61 = v6;
            __int16 v62 = 2114;
            v63 = v51;
            __int16 v64 = 2114;
            v65 = v44;
            __int16 v66 = 2114;
            v67 = allowedForBundles;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}@ caller %{public}@, to access token classID=%{public}@ identifier=%{public}@ containing=%{public }@ entitled for=%{public}@",  buf,  0x3Eu);
          }
        }

        goto LABEL_40;
      }

      unsigned __int8 v28 = -[os_log_s hasPrefix:](v51, "hasPrefix:", v50->_callerBundleID);

      if ((v28 & 1) != 0) {
        goto LABEL_20;
      }
    }

    else if ((-[os_log_s hasPrefix:](v51, "hasPrefix:", v50->_callerBundleID) & 1) != 0)
    {
      goto LABEL_20;
    }

    id v46 = v6;
    v47 = v12;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    v29 = v50->_allowedForBundles;
    id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v52,  v68,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v53;
      while (2)
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v53 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          uint64_t v35 = objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
          if (v35)
          {
            v36 = (void *)v35;
            v37 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
            unsigned __int8 v38 = [v34 hasPrefix:v37];

            if ((v38 & 1) != 0) {
              goto LABEL_34;
            }
          }

          else if ([v34 isEqualToString:v51])
          {
LABEL_34:

            BOOL v20 = 1;
            goto LABEL_35;
          }
        }

        id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v52,  v68,  16LL);
        if (v31) {
          continue;
        }
        break;
      }
    }

    BOOL v20 = 0;
LABEL_35:
    id v6 = v46;
    v12 = v47;
    goto LABEL_36;
  }

  if (v4)
  {
    id v19 = sub_100003CA0();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100010988((uint64_t)self, (uint64_t)v6, (os_log_t)v12);
    }
    LOBYTE(v20) = 0;
    goto LABEL_41;
  }

  LOBYTE(v20) = 0;
LABEL_42:

  return v20;
}

- (void)getClassIDsWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"getClassIDsWithReply"]);

  id v7 = [&__NSArray0__struct mutableCopy];
  id v8 = objc_loadWeakRetained((id *)&self->_registry);
  objc_sync_enter(v8);
  id v9 = objc_loadWeakRetained((id *)&self->_registry);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reloadTokenClassesFromStore]);

  objc_sync_exit(v8);
  id v11 = objc_loadWeakRetained((id *)&self->_registry);
  [v11 registerClassIDs:v10];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokenExtensions", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);

  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[TKHostTokenRegistryConfigurationProxy haveAccessForClassID:verbose:]( self,  "haveAccessForClassID:verbose:",  v17,  0LL))
        {
          [v7 addObject:v17];
        }
      }

      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }

  [v6 commit];
  v4[2](v4, v7);
}

- (BOOL)ensureAccessForClassID:(id)a3
{
  return -[TKHostTokenRegistryConfigurationProxy haveAccessForClassID:verbose:]( self,  "haveAccessForClassID:verbose:",  a3,  1LL);
}

- (void)beginTransactionWithReply:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 beginTransaction:@"beginTransactionWithReply"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 externalTransactions]);
  [v7 addObject:v8];

  v4[2](v4);
}

- (void)endTransactionWithReply:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 externalTransactions]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 lastObject]);

  [v9 commit];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 externalTransactions]);
  [v8 removeLastObject];

  v4[2](v4);
}

- (void)getTokenIDsForClassID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [&__NSArray0__struct mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"getTokenIDsForClassID"]);

  if (-[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v6))
  {
    id obj = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(obj);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tokens]);

    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "classID", obj));
          unsigned int v17 = [v16 isEqualToString:v6];

          if (v17) {
            [v8 addObject:v15];
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v12);
    }

    objc_sync_exit(obj);
  }

  objc_msgSend(v20, "commit", obj);
  id v18 = [v8 copy];
  v7[2](v7, v18);
}

- (void)createTokenID:(id)a3 persistent:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v8 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"createTokenID"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v18 classID]);
  unsigned int v12 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v11);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    id v14 = [v13 createTokenWithTokenID:v18 persistent:v6];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 delegate]);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    [v16 hostTokenRegistry:v17 addedToken:v18];
  }

  [v10 commit];
  v8[2](v8);
}

- (id)ensureTokenWithTokenID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"ensureTokenWithTokenID"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tokensByTokenID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pendingCreationTokens]);
    id v11 = (TKHostToken *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v4]);
  }

  if (!v11)
  {
    id v11 = -[TKHostToken initWithTokenID:persistent:]( objc_alloc(&OBJC_CLASS___TKHostToken),  "initWithTokenID:persistent:",  v4,  0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    -[TKHostToken setRegistry:](v11, "setRegistry:", v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pendingCreationTokens]);
    [v16 setObject:v11 forKeyedSubscript:v4];

    id v17 = sub_100003CA0();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100010A38();
    }
  }

  [v6 commit];

  return v11;
}

- (void)getKeychainItemsForTokenID:(id)a3 reply:(id)a4
{
  id v15 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"getKeychainItemsForTokenID"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 classID]);
  unsigned int v10 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v9);

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v11);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TKHostTokenRegistryConfigurationProxy ensureTokenWithTokenID:]( self,  "ensureTokenWithTokenID:",  v15));
    uint64_t v13 = v12;
    if (v12) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 keychainItems]);
    }
    else {
      id v14 = &__NSArray0__struct;
    }

    objc_sync_exit(v11);
  }

  else
  {
    id v14 = &__NSArray0__struct;
  }

  [v8 commit];
  v6[2](v6, v14);
}

- (void)updateKeychainItemsForTokenID:(id)a3 items:(id)a4 reply:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"updateKeychainItemsForTokenID"]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v23 classID]);
  unsigned int v13 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v12);

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v14);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[TKHostTokenRegistryConfigurationProxy ensureTokenWithTokenID:]( self,  "ensureTokenWithTokenID:",  v23));
    v16 = v15;
    if (v15)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 keychainItems]);
      if (v17)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 keychainItems]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  0LL,  0LL));
      }

      else
      {
        __int128 v19 = 0LL;
      }

      if (v8) {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  0LL,  0LL));
      }
      else {
        __int128 v20 = 0LL;
      }
      if (([v19 isEqualToData:v20] & 1) == 0)
      {
        [v16 setKeychainItems:v8];
        id v21 = [v11 keychainItemsModified:v23];
      }
    }

    objc_sync_exit(v14);
  }

  [v11 commit];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
  [v22 notifyTokenReinsertion:v23];

  v9[2](v9);
}

- (void)readDataForTokenID:(id)a3 reply:(id)a4
{
  id v15 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"readDataForTokenID"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 classID]);
  unsigned int v10 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v9);

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v11);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TKHostTokenRegistryConfigurationProxy ensureTokenWithTokenID:]( self,  "ensureTokenWithTokenID:",  v15));
    unsigned int v13 = v12;
    if (v12) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 configurationData]);
    }
    else {
      id v14 = 0LL;
    }

    objc_sync_exit(v11);
  }

  else
  {
    id v14 = 0LL;
  }

  [v8 commit];
  v6[2](v6, v14);
}

- (void)updateTokenID:(id)a3 data:(id)a4 reply:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"updateTokenID"]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v20 classID]);
  unsigned int v13 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v12);

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v14);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[TKHostTokenRegistryConfigurationProxy ensureTokenWithTokenID:]( self,  "ensureTokenWithTokenID:",  v20));
    v16 = v15;
    if (v15)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 configurationData]);
      unsigned __int8 v18 = [v17 isEqualToData:v8];

      if ((v18 & 1) == 0)
      {
        [v16 setConfigurationData:v8];
        id v19 = [v11 markModified];
      }
    }

    objc_sync_exit(v14);
  }

  [v11 commit];
  v9[2](v9);
}

- (void)removeTokenID:(id)a3 reply:(id)a4
{
  id v12 = a3;
  BOOL v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained beginTransaction:@"removeTokenID"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 classID]);
  unsigned int v10 = -[TKHostTokenRegistryConfigurationProxy ensureAccessForClassID:](self, "ensureAccessForClassID:", v9);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenRegistryConfigurationProxy registry](self, "registry"));
    [v11 removeTokenWithTokenID:v12];
  }

  [v8 commit];
  v6[2](v6);
}

- (TKHostTokenRegistry)registry
{
  return (TKHostTokenRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (void).cxx_destruct
{
}

@end