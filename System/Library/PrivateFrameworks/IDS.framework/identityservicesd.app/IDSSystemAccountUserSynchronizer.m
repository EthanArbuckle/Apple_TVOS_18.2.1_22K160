@interface IDSSystemAccountUserSynchronizer
- (CUTPromise)migrationPromise;
- (IDSDataMigrationTracker)migrationTracker;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IDSSystemAccountUserSynchronizer)initWithSystemAccountAdapter:(id)a3 userStore:(id)a4 migrationTracker:(id)a5 queue:(id)a6;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)setMigrationPromise:(id)a3;
- (void)setMigrationTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setUserStore:(id)a3;
@end

@implementation IDSSystemAccountUserSynchronizer

- (IDSSystemAccountUserSynchronizer)initWithSystemAccountAdapter:(id)a3 userStore:(id)a4 migrationTracker:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSSystemAccountUserSynchronizer;
  v15 = -[IDSSystemAccountUserSynchronizer init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a3);
    objc_storeStrong((id *)&v16->_userStore, a4);
    objc_storeStrong((id *)&v16->_migrationTracker, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1006AC58C((uint64_t)v4, v5);
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v5 = a4;
  if (-[IDSDataMigrationTracker hasPerformedMigration](self->_migrationTracker, "hasPerformedMigration"))
  {
    id v35 = v5;
    id v6 = v5;
    id v36 = [v6 mutableCopy];
    systemAccountAdapter = self->_systemAccountAdapter;
    id v43 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iCloudSystemAccountWithError:]( systemAccountAdapter,  "iCloudSystemAccountWithError:",  &v43));
    id v34 = v43;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v38 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v38) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userName]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
          if (v13 == v14)
          {
            unsigned int v17 = 1;
          }

          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v12 userName]);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
            unsigned int v17 = [v15 isEqual:v16];
          }

          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v12 DSID]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v8 DSID]);
          if (v18 == v19)
          {
            unsigned int v22 = 1;
          }

          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v12 DSID]);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v8 DSID]);
            unsigned int v22 = [v20 isEqual:v21];
          }

          if ((v22 & v17 & 1) == 0) {
            [v36 removeObject:v12];
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      }

      while (v10);
    }

    if (![v36 count] && v8)
    {
      v23 = objc_alloc(&OBJC_CLASS___IDSAppleUser);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 DSID]);
      v26 = -[IDSAppleUser initWithUserName:DSID:](v23, "initWithUserName:DSID:", v24, v25);

      [v36 addObject:v26];
    }

    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    id v5 = v35;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v46 = obj;
      __int16 v47 = 2112;
      id v48 = v36;
      __int16 v49 = 2112;
      v50 = v8;
      __int16 v51 = 2112;
      id v52 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Finished synchronizing SystemAccounts to users {currentUsers: %@, updatedUsers: %@, iCloudAccount: %@, error: %@}",  buf,  0x2Au);
    }

    id v28 = v36;
  }

  else
  {
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Waiting on migration -- deferring updateUsers",  buf,  2u);
    }

    if (!self->_migrationPromise)
    {
      v30 = (CUTPromise *)objc_claimAutoreleasedReturnValue( -[IDSDataMigrationTracker performMigrationIfNeeded]( self->_migrationTracker,  "performMigrationIfNeeded"));
      migrationPromise = self->_migrationPromise;
      self->_migrationPromise = v30;

      v32 = self->_migrationPromise;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1003CE84C;
      v44[3] = &unk_1008F7798;
      v44[4] = self;
      -[CUTPromise registerResultBlock:](v32, "registerResultBlock:", v44);
    }

    id v28 = v5;
  }

  return v28;
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSDataMigrationTracker)migrationTracker
{
  return self->_migrationTracker;
}

- (void)setMigrationTracker:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CUTPromise)migrationPromise
{
  return self->_migrationPromise;
}

- (void)setMigrationPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end