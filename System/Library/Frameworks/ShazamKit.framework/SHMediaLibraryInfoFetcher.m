@interface SHMediaLibraryInfoFetcher
+ (int64_t)libraryStatusForAccountStatus:(int64_t)a3;
- (NSString)currentUserID;
- (void)clearCachedSyncStatus;
- (void)fetchAccountTokensWithAccountInfo:(id)a3 completion:(id)a4;
- (void)fetchLibraryInfoWithCompletionHandler:(id)a3;
- (void)setCurrentUserID:(id)a3;
@end

@implementation SHMediaLibraryInfoFetcher

- (void)fetchLibraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SHCloudContainer sharedContainer](&OBJC_CLASS___SHCloudContainer, "sharedContainer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100036578;
  v7[3] = &unk_10006DBD8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 accountInfoWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)fetchAccountTokensWithAccountInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([v6 accountStatus] == (id)1)
  {
    objc_initWeak(&location, self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHCloudContainer sharedContainer](&OBJC_CLASS___SHCloudContainer, "sharedContainer"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100036898;
    v11[3] = &unk_10006DC00;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    [v8 fetchUserRecordIDWithCompletionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ubiquityIdentityToken]);

    if (!v10) {
      -[SHMediaLibraryInfoFetcher setCurrentUserID:](self, "setCurrentUserID:", 0LL);
    }
    v7[2](v7);
  }
}

- (NSString)currentUserID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SHLibraryAvailabilityListenerUserID"]);

  return (NSString *)v3;
}

- (void)setCurrentUserID:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SHMediaLibraryInfoFetcher currentUserID](self, "currentUserID"));
  if (v4 | v5)
  {
    id v6 = [(id)v4 isEqualToString:v5];
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = sh_log_object(v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "iCloud account has changed, updating current user account id",  buf,  2u);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v9 setObject:v4 forKey:@"SHLibraryAvailabilityListenerUserID"];

      if (v5)
      {
        uint64_t v11 = sh_log_object(v10);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Clear all local data and cache sync status",  v15,  2u);
        }

        id v13 = -[SHMediaLibraryDataStore initWithStoreType:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryDataStore),  "initWithStoreType:",  1LL);
        -[SHMediaLibraryDataStore deleteAllItems](v13, "deleteAllItems");
        -[SHMediaLibraryInfoFetcher clearCachedSyncStatus](self, "clearCachedSyncStatus");
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      [v14 postNotificationName:SHMediaLibraryAccountChangeNotification object:0 userInfo:0 deliverImmediately:1];
    }
  }
}

- (void)clearCachedSyncStatus
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"com.apple.shazamlibrary.cloud"]);
  char v37 = 0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v37];

  if (v7) {
    BOOL v8 = v37 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v36 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:v5 error:&v36]);
    id v29 = v36;

    if (v10)
    {
      v28 = v5;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SHCloudContainer sharedContainer](&OBJC_CLASS___SHCloudContainer, "sharedContainer"));
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 containerIdentifier]);

      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      v27 = v10;
      id obj = v10;
      id v14 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v33;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
            v19 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
            uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
            v21 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v19,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v18,  v13,  v20);

            id v31 = 0LL;
            LOBYTE(v20) = -[SHLCloudLibraryCache resetWithError:](v21, "resetWithError:", &v31);
            id v22 = v31;
            v23 = v22;
            if ((v20 & 1) == 0)
            {
              uint64_t v24 = sh_log_object(v22);
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v39 = v13;
                __int16 v40 = 2112;
                uint64_t v41 = v18;
                __int16 v42 = 2112;
                id v43 = v29;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to reset cache (%@) for %@, error: %@",  buf,  0x20u);
              }
            }
          }

          id v15 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
        }

        while (v15);
      }

      uint64_t v5 = v28;
      uint64_t v10 = v27;
    }

    else
    {
      uint64_t v26 = sh_log_object(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = (os_log_s *)v29;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "No cached sync status to reset %@",  buf,  0xCu);
      }
    }
  }
}

+ (int64_t)libraryStatusForAccountStatus:(int64_t)a3
{
  else {
    return qword_100052358[a3];
  }
}

@end