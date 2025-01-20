@interface ManagementTestAdapter
- (ManagementTestAdapter)init;
- (id)_addReasons:(id)a3 toError:(id)a4;
- (id)_persistedDeclarationKeysForScope:(int64_t)a3;
- (id)_userDefaultsKeyForScope:(int64_t)a3;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)_addDeclarationKey:(id)a3 scope:(int64_t)a4;
- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 reasonDescription:(id)a6 completionHandler:(id)a7;
- (void)_downloadAssetDataFromStore:(id)a3 identifier:(id)a4 reference:(id)a5 completionHandler:(id)a6;
- (void)_persistDeclarationKeys:(id)a3 scope:(int64_t)a4;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation ManagementTestAdapter

- (ManagementTestAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ManagementTestAdapter;
  v2 = -[ManagementTestAdapter init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSObject);
    lock = v2->_lock;
    v2->_lock = v3;
  }

  return v2;
}

- (id)configurationClasses
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___RMModelManagementTestDeclaration, a2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  v4 = (void (**)(id, void))a4;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementTestAdapter](&OBJC_CLASS___RMLog, "managementTestAdapter"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100005DB8(v5);
  }

  v4[2](v4, 0LL);
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  objc_super v6 = (void (**)(id, void))a5;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementTestAdapter](&OBJC_CLASS___RMLog, "managementTestAdapter"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100005DF8(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  v6[2](v6, 0LL);
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v8 = (void (**)(id, void *, void))a4;
  objc_super v6 = self->_lock;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[ManagementTestAdapter _persistedDeclarationKeysForScope:]( self,  "_persistedDeclarationKeysForScope:",  a3));
  objc_sync_exit(v6);

  v8[2](v8, v7, 0LL);
}

- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 declaration]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 store]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 payloadEchoDataAssetReference]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000046F8;
  v19[3] = &unk_1000082E0;
  v19[4] = self;
  id v20 = v10;
  id v22 = v12;
  int64_t v23 = a5;
  id v21 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  -[ManagementTestAdapter _downloadAssetDataFromStore:identifier:reference:completionHandler:]( self,  "_downloadAssetDataFromStore:identifier:reference:completionHandler:",  v14,  v15,  v18,  v19);
}

- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  uint64_t v8 = (void (**)(id, void))a5;
  uint64_t v9 = self->_lock;
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[ManagementTestAdapter _persistedDeclarationKeysForScope:]( self,  "_persistedDeclarationKeysForScope:",  a4));
  [v10 removeObject:v11];
  -[ManagementTestAdapter _persistDeclarationKeys:scope:](self, "_persistDeclarationKeys:scope:", v10, a4);

  objc_sync_exit(v9);
  v8[2](v8, 0LL);
}

- (id)declarationKeyForConfiguration:(id)a3
{
  return  +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:reference:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKeyWithSubscriberIdentifier:reference:",  @"com.apple.RemoteManagement.ManagementTestExtension",  a3);
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v29 = (void (**)(id, uint64_t, void *, void))a5;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementTestAdapter](&OBJC_CLASS___RMLog, "managementTestAdapter"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 declaration]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 declarationIdentifier]);
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 declaration]);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreLocalizable string:](&OBJC_CLASS___RMStoreLocalizable, "string:", @"UI.Title"));
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreLocalizable string:](&OBJC_CLASS___RMStoreLocalizable, "string:", @"UI.Description"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreLocalizable string:](&OBJC_CLASS___RMStoreLocalizable, "string:", @"UI.Key.Echo"));
  v32[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v10 payloadEcho]);
  v32[1] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v33[0] = v25;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreLocalizable string:](&OBJC_CLASS___RMStoreLocalizable, "string:", @"UI.Key.HasAsset"));
  v31[0] = v22;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 payloadEchoDataAssetReference]);
  if (v11) {
    id v12 = @"UI.Value.Yes";
  }
  else {
    id v12 = @"UI.Value.No";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreLocalizable string:](&OBJC_CLASS___RMStoreLocalizable, "string:", v12));
  v31[1] = v13;
  v26 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
  v33[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMStoreLocalizable string:]( &OBJC_CLASS___RMStoreLocalizable,  "string:",  @"UI.Key.ReturnStatus"));
  v30[0] = v15;
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 payloadReturnStatus]);
  id v17 = (void *)v16;
  uint64_t v18 = RMModelManagementTestDeclaration_ReturnStatus_installed;
  if (v16) {
    uint64_t v18 = v16;
  }
  v30[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  v33[2] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationUIDetails configurationUIWithTitle:description:details:]( &OBJC_CLASS___RMConfigurationUIDetails,  "configurationUIWithTitle:description:details:",  v24,  v23,  v20));

  v29[2](v29, 1LL, v21, 0LL);
}

- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 reasonDescription:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void *, void *))a7;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ManagementTestAdapter declarationKeyForConfiguration:](self, "declarationKeyForConfiguration:", v12));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 declaration]);
  if (v13)
  {
    id v17 = self->_lock;
    objc_sync_enter(v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[ManagementTestAdapter _persistedDeclarationKeysForScope:]( self,  "_persistedDeclarationKeysForScope:",  a5));
    [v18 removeObject:v13];
    -[ManagementTestAdapter _persistDeclarationKeys:scope:](self, "_persistDeclarationKeys:scope:", v18, a5);

    objc_sync_exit(v17);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadEcho]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadReturnStatus]);
  unsigned int v21 = [v20 isEqualToString:RMModelManagementTestDeclaration_ReturnStatus_installed];

  if (!v21)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadReturnStatus]);
    unsigned int v26 = [v25 isEqualToString:RMModelManagementTestDeclaration_ReturnStatus_unlocked];

    if (!v26)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      if ([v19 length] || objc_msgSend(v14, "length"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  v19,  v14,  v24));
        v35 = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));

        uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ManagementTestAdapter _addReasons:toError:](self, "_addReasons:toError:", v31, v24));
        int64_t v23 = 0LL;
        v24 = (void *)v32;
        goto LABEL_19;
      }

- (void)_downloadAssetDataFromStore:(id)a3 identifier:(id)a4 reference:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = v10;
  if (v8)
  {
    id v12 = NSTemporaryDirectory();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));

    v15 = objc_opt_new(&OBJC_CLASS___NSUUID);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v15, "UUIDString"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.txt", v16));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v17]);

    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementTestAdapter](&OBJC_CLASS___RMLog, "managementTestAdapter"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100005E78((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000050C4;
    v27[3] = &unk_100008308;
    id v28 = v18;
    id v29 = v11;
    id v26 = v18;
    +[RMAssetResolverController resolveDataAsset:assetIdentifier:downloadURL:completionHandler:]( &OBJC_CLASS___RMAssetResolverController,  "resolveDataAsset:assetIdentifier:downloadURL:completionHandler:",  v9,  v8,  v26,  v27);
  }

  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)_addDeclarationKey:(id)a3 scope:(int64_t)a4
{
  id v8 = a3;
  id v6 = self->_lock;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[ManagementTestAdapter _persistedDeclarationKeysForScope:]( self,  "_persistedDeclarationKeysForScope:",  a4));
  [v7 addObject:v8];
  -[ManagementTestAdapter _persistDeclarationKeys:scope:](self, "_persistDeclarationKeys:scope:", v7, a4);

  objc_sync_exit(v6);
}

- (void)_persistDeclarationKeys:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v12), "key", (void)v16));
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ManagementTestAdapter _userDefaultsKeyForScope:](self, "_userDefaultsKeyForScope:", a4));
  [v14 setObject:v7 forKey:v15];
}

- (id)_persistedDeclarationKeysForScope:(int64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ManagementTestAdapter _userDefaultsKeyForScope:](self, "_userDefaultsKeyForScope:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v7 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[RMStoreDeclarationKey newDeclarationKey:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13),  (void)v16);
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  return v8;
}

- (id)_userDefaultsKeyForScope:(int64_t)a3
{
  if (a3) {
    return @"ManagementTestAppliedSystemConfigurations";
  }
  else {
    return @"ManagementTestAppliedUserConfigurations";
  }
}

- (id)_addReasons:(id)a3 toError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = v7;
  if (!v7) {
    v7 = &__NSDictionary0__struct;
  }
  id v9 = [v7 mutableCopy];

  [v9 setObject:v6 forKeyedSubscript:RMSubscriberStoreNSErrorReasonsKey];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  id v11 = [v5 code];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v9));
  return v12;
}

- (void).cxx_destruct
{
}

@end