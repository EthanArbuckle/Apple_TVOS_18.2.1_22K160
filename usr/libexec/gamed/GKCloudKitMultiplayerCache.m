@interface GKCloudKitMultiplayerCache
- (BOOL)isValid;
- (CKRecordID)userRecordID;
- (GKCloudKitMultiplayerCache)init;
- (GKCloudPlayer)userPlayer;
- (NSDate)expiration;
- (NSMutableDictionary)bundleIDExpirations;
- (NSMutableDictionary)bundleIDsByContainerName;
- (NSString)databasePath;
- (id)bundleIDCacheURL;
- (id)bundleIDsForContainerName:(id)a3;
- (id)localPlayerAlias;
- (sqlite3)database;
- (void)clearWithHandler:(id)a3;
- (void)setBundleIDExpirations:(id)a3;
- (void)setBundleIDsByContainerName:(id)a3;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setDatabasePath:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setUserRecordID:(id)a3;
- (void)updateBundleIDs:(id)a3 forContainerName:(id)a4;
- (void)updateUserWithHandler:(id)a3;
- (void)writeBundleIDsToDisk;
@end

@implementation GKCloudKitMultiplayerCache

- (GKCloudKitMultiplayerCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKCloudKitMultiplayerCache;
  v2 = -[GKCloudKitMultiplayerCache init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    bundleIDsByContainerName = v2->_bundleIDsByContainerName;
    v2->_bundleIDsByContainerName = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    bundleIDExpirations = v2->_bundleIDExpirations;
    v2->_bundleIDExpirations = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.GameCenter.GKCloudKitMultiplayerCache", &_dispatch_queue_attr_concurrent);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.GameCenter.GKCloudKitMultiplayerCache.User", &_dispatch_queue_attr_concurrent);
    cacheUserQueue = v2->_cacheUserQueue;
    v2->_cacheUserQueue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)clearWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  dispatch_queue_t v7 = (os_log_s *)os_log_GKAccount;
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
    sub_10009C3DC(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  cacheQueue = (dispatch_queue_s *)self->_cacheQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10009B408;
  v17[3] = &unk_10026B310;
  v17[4] = self;
  id v18 = v5;
  id v16 = v5;
  dispatch_barrier_async(cacheQueue, v17);
}

- (BOOL)isValid
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  cacheQueue = (dispatch_queue_s *)self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B4F4;
  v5[3] = &unk_10026E058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsValid:(BOOL)a3
{
  cacheQueue = (dispatch_queue_s *)self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009B594;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_barrier_async(cacheQueue, block);
}

- (CKRecordID)userRecordID
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10009B688;
  uint64_t v10 = sub_10009B698;
  id v11 = 0LL;
  cacheUserQueue = (dispatch_queue_s *)self->_cacheUserQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B6A0;
  v5[3] = &unk_10026E058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheUserQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CKRecordID *)v3;
}

- (id)localPlayerAlias
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v5 = [v4 currentEnvironment];
  id v6 = [v2 conformsToMultiUserRestrictions];
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 currentGame]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryCredentialForEnvironment:v5 conformsToMultiUserRestrictions:v6 gameID:v8]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKCloudKitMultiplayerCache.m",  129LL,  "-[GKCloudKitMultiplayerCache localPlayerAlias]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 playerInternal]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v2 transactionGroupWithName:v10 forPlayerID:v12]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10009B874;
  v17[3] = &unk_10026C810;
  id v18 = v13;
  id v14 = v13;
  [v14 performOnManagedObjectContext:v17];
  [v14 waitWithTimeout:60.0];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 result]);

  return v15;
}

- (GKCloudPlayer)userPlayer
{
  id v3 = (GKCloudPlayer *)objc_claimAutoreleasedReturnValue(-[GKCloudKitMultiplayerCache userRecordID](self, "userRecordID"));

  if (v3)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GKCloudPlayer);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudKitMultiplayerCache userRecordID](self, "userRecordID"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
    -[GKCloudPlayer setIdentifier:](v3, "setIdentifier:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudKitMultiplayerCache localPlayerAlias](self, "localPlayerAlias"));
    -[GKCloudPlayer setName:](v3, "setName:", v6);
  }

  return v3;
}

- (void)updateUserWithHandler:(id)a3
{
  id v4 = a3;
  cacheUserQueue = (dispatch_queue_s *)self->_cacheUserQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009BA10;
  v7[3] = &unk_10026B310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(cacheUserQueue, v7);
}

- (id)bundleIDsForContainerName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10009B688;
  v17 = sub_10009B698;
  id v18 = 0LL;
  if (v4)
  {
    cacheQueue = (dispatch_queue_s *)self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009BFA8;
    block[3] = &unk_1002702B8;
    block[4] = self;
    id v11 = v4;
    uint64_t v12 = &v13;
    dispatch_sync(cacheQueue, block);

    dispatch_queue_t v7 = (void *)v14[5];
  }

  else
  {
    dispatch_queue_t v7 = 0LL;
  }

  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)updateBundleIDs:(id)a3 forContainerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    cacheQueue = (dispatch_queue_s *)self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009C0E0;
    block[3] = &unk_10026BEA0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_barrier_async(cacheQueue, block);
  }
}

- (id)bundleIDCacheURL
{
  uint64_t v2 = GKInsecureCacheRoot(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"sessions-bundleIDs"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathExtension:@"data"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  return v6;
}

- (void)writeBundleIDsToDisk
{
  v11[0] = @"bundleIDs";
  v11[1] = @"expirations";
  bundleIDExpirations = self->_bundleIDExpirations;
  v12[0] = self->_bundleIDsByContainerName;
  v12[1] = bundleIDExpirations;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  id v10 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v10));
  id v6 = v10;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudKitMultiplayerCache bundleIDCacheURL](self, "bundleIDCacheURL"));
  id v9 = v6;
  [v5 writeToURL:v7 options:1 error:&v9];
  id v8 = v9;
}

- (void)setUserRecordID:(id)a3
{
}

- (NSMutableDictionary)bundleIDsByContainerName
{
  return self->_bundleIDsByContainerName;
}

- (void)setBundleIDsByContainerName:(id)a3
{
}

- (NSMutableDictionary)bundleIDExpirations
{
  return self->_bundleIDExpirations;
}

- (void)setBundleIDExpirations:(id)a3
{
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end