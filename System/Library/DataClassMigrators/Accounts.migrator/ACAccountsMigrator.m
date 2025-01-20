@interface ACAccountsMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_oldAccountsPlistPath;
- (id)dataClassName;
- (void)_migrateOutdatedKeychainItems;
- (void)_removeAccountsPlist;
- (void)_removeMultipleTencentWeiboAccounts;
- (void)_runAccountMigrationPlugins;
- (void)_scheduleBackupIfNonexistent;
- (void)removeObsoleteAccountsFromStore:(id)a3;
@end

@implementation ACAccountsMigrator

- (id)dataClassName
{
  return @"acaccounts";
}

- (BOOL)performMigration
{
  uint64_t v3 = CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
  uint64_t v4 = _ACLogSystem(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "\"Migrations are done! Removing accountsettings.plist.\"", buf, 2u);
  }

  -[ACAccountsMigrator _removeAccountsPlist](self, "_removeAccountsPlist");
  -[ACAccountsMigrator _removeMultipleTencentWeiboAccounts](self, "_removeMultipleTencentWeiboAccounts");
  -[ACAccountsMigrator _migrateOutdatedKeychainItems](self, "_migrateOutdatedKeychainItems");
  -[ACAccountsMigrator _scheduleBackupIfNonexistent](self, "_scheduleBackupIfNonexistent");
  id v6 = +[ACAccountMigrationState migrationFinishedForKey:]( &OBJC_CLASS___ACAccountMigrationState,  "migrationFinishedForKey:",  @"LastAccountMigrationPluginsRunVersion");
  if ((v6 & 1) != 0)
  {
    uint64_t v7 = _ACLogSystem(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "\"Migration plugin run should only happen once per version to be safe!\"",  v10,  2u);
    }
  }

  else
  {
    +[ACAccountMigrationState writeMigrationVersionPrefForKey:]( &OBJC_CLASS___ACAccountMigrationState,  "writeMigrationVersionPrefForKey:",  @"LastAccountMigrationPluginsRunVersion");
    -[ACAccountsMigrator _runAccountMigrationPlugins](self, "_runAccountMigrationPlugins");
  }

  return 1;
}

- (void)_removeAccountsPlist
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountsMigrator _oldAccountsPlistPath](self, "_oldAccountsPlistPath"));
  id v5 = [v3 fileExistsAtPath:v4 isDirectory:0];
  if ((_DWORD)v5)
  {
    id v12 = 0LL;
    unsigned __int8 v6 = [v3 removeItemAtPath:v4 error:&v12];
    uint64_t v7 = (os_log_s *)v12;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      uint64_t v9 = _ACLogSystem(v7);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_2F94((uint64_t)v4, (uint64_t)v8, v10);
      }
    }
  }

  else
  {
    uint64_t v11 = _ACLogSystem(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "\"The legacy accounts plist could not be found at: %@\"",  buf,  0xCu);
    }
  }
}

- (id)_oldAccountsPlistPath
{
  return (id)CPCopySharedResourcesPreferencesDomainForDomain( @"com.apple.accountsettings.plist",  a2);
}

- (void)_removeMultipleTencentWeiboAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTencentWeiboDeprecated]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 accountsWithAccountType:v3]);

  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 1, (char *)objc_msgSend(v4, "count") - 1));

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v4 = v5;
    id v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v10);
          uint64_t v12 = _ACLogSystem(v7);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = v11;
            _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "\"Removing account %@ because we only support a single Tencent Weibo account\"",  buf,  0xCu);
          }

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_22F4;
          v19[3] = &unk_4198;
          v14 = v6;
          v20 = v14;
          [v2 removeAccount:v11 withCompletionHandler:v19];
          dispatch_time_t v15 = dispatch_time(0LL, 2000000000LL);
          uint64_t v16 = dispatch_semaphore_wait(v14, v15);
          if (v16)
          {
            uint64_t v17 = _ACLogSystem(v16);
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v11;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "\"Timed out removing %@\"", buf, 0xCu);
            }
          }

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
        id v8 = v7;
      }

      while (v7);
    }
  }
}

- (void)_migrateOutdatedKeychainItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v3 = _ACLogSystem(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "\"Attempting to migrate all keychain items if necessary.\"",  buf,  2u);
  }

  id v10 = 0LL;
  unsigned int v5 = [v2 triggerKeychainMigrationIfNecessary:&v10];
  id v6 = v10;
  uint64_t v7 = _ACLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "\"Keychain migration finished with success %@, error: %@\"",  buf,  0x16u);
  }
}

- (void)removeObsoleteAccountsFromStore:(id)a3
{
  id v3 = a3;
  v48[0] = ACAccountTypeIdentifierTwitterDeprecated;
  v48[1] = ACAccountTypeIdentifierFacebookDeprecated;
  v48[2] = ACAccountTypeIdentifierSinaWeiboDeprecated;
  v48[3] = ACAccountTypeIdentifierTencentWeiboDeprecated;
  v48[4] = ACAccountTypeIdentifierFlickr;
  v48[5] = ACAccountTypeIdentifierVimeo;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 6LL));
  uint64_t v5 = _ACLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "\"Will remove obsolete accounts with type identifiers %@\"",  buf,  0xCu);
  }

  id v42 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accountsWithAccountTypeIdentifiers:v4 error:&v42]);
  id v8 = (NSMutableDictionary *)v42;
  uint64_t v9 = _ACLogSystem(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v45 = v7;
    __int16 v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "\"Fetched obsolete accounts %@ error %@\"", buf, 0x16u);
  }

  v29 = v8;

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v31 = *(void *)v39;
    do
    {
      __int16 v13 = 0LL;
      do
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v13);
        id v37 = 0LL;
        dispatch_time_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataclassActionsForAccountDeletion:error:", v14, &v37, v29));
        id v16 = v37;
        uint64_t v17 = _ACLogSystem(v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v14;
          __int16 v46 = 2112;
          v47 = v15;
          _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "\"Gathered account %@ potential dataclass actions for deletion %@\"",  buf,  0x16u);
        }

        v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_29C0;
        v34[3] = &unk_41C0;
        v20 = v19;
        v35 = v20;
        v36 = v14;
        uint64_t v21 = _ACLogSystem( -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( v15,  "enumerateKeysAndObjectsUsingBlock:",  v34));
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v14;
          __int16 v46 = 2112;
          v47 = v20;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "\"Will remove obsolete account %@ with dataclass actions %@\"",  buf,  0x16u);
        }

        dispatch_semaphore_t v23 = dispatch_semaphore_create(0LL);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_2B30;
        v32[3] = &unk_41E8;
        v32[4] = v14;
        __int128 v24 = v23;
        v33 = v24;
        [v3 removeAccount:v14 withDataclassActions:v20 completion:v32];
        dispatch_time_t v25 = dispatch_time(0LL, 2000000000LL);
        uint64_t v26 = dispatch_semaphore_wait(v24, v25);
        if (v26)
        {
          uint64_t v27 = _ACLogSystem(v26);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v14;
            _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "\"Timed out removing %@\"", buf, 0xCu);
          }
        }

        __int16 v13 = (char *)v13 + 1;
      }

      while (v12 != v13);
      id v12 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v12);
  }
}

- (void)_scheduleBackupIfNonexistent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_2D0C;
  v15[3] = &unk_4198;
  id v3 = dispatch_semaphore_create(0LL);
  id v16 = v3;
  [v2 scheduleBackupIfNonexistent:v15];
  dispatch_time_t v4 = dispatch_time(0LL, 2000000000LL);
  uint64_t v5 = dispatch_semaphore_wait(v3, v4);
  if (v5)
  {
    uint64_t v6 = _ACLogSystem(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_3080(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_runAccountMigrationPlugins
{
  uint64_t v2 = _ACLogSystem(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "\"Will run account migration plugins\"", buf, 2u);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_2E78;
  v20[3] = &unk_4198;
  uint64_t v6 = v4;
  uint64_t v21 = v6;
  [v5 runAccountMigrationPlugins:v20];

  dispatch_time_t v7 = dispatch_time(0LL, 2000000000LL);
  uint64_t v8 = dispatch_semaphore_wait(v6, v7);
  if (v8)
  {
    uint64_t v9 = _ACLogSystem(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_30B4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  uint64_t v18 = _ACLogSystem(v8);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "\"Ran account migration plugins\"", buf, 2u);
  }
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

@end