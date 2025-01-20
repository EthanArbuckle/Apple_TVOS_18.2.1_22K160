@interface PLBackgroundMigrationActivity
+ (id)_backgroundMigrationUniqueID:(const char *)a3;
+ (id)_criteriaForBackgroundMigration;
+ (void)installBackgroundMigrationActivity:(id)a3;
+ (void)registerIncompleteBackgroundMigrationActivity;
- (BOOL)_runTask;
- (PLBackgroundMigrationActivity)initWithLibraryBundle:(id)a3 xpcActivity:(id)a4 description:(id)a5;
- (void)_runBackgroundMigrationActions;
@end

@implementation PLBackgroundMigrationActivity

- (PLBackgroundMigrationActivity)initWithLibraryBundle:(id)a3 xpcActivity:(id)a4 description:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PLBackgroundMigrationActivity;
  v12 = -[PLBackgroundMigrationActivity init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundle, a3);
    objc_storeStrong((id *)&v13->_xpcActivity, a4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[PLXPCTransaction transaction:]( PLXPCTransaction, "transaction:", [v11 UTF8String]));
    transaction = v13->_transaction;
    v13->_transaction = (PLXPCTransaction *)v14;
  }

  return v13;
}

- (BOOL)_runTask
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLFileBackedLogger setupWithLibraryIdentifier:type:]( &OBJC_CLASS___PLFileBackedLogger,  "setupWithLibraryIdentifier:type:",  0LL,  1LL));
  v4 = v3;
  bundle = self->_bundle;
  if (bundle)
  {
    id v34 = 0LL;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100008B58;
    v32[3] = &unk_100020D18;
    v32[4] = self;
    id v6 = v3;
    id v33 = v6;
    id v7 = +[PLBackgroundModelMigration migrateBackgroundActionsWithPhotoLibraryBundle:logger:error:continuationHandler:]( &OBJC_CLASS___PLBackgroundModelMigration,  "migrateBackgroundActionsWithPhotoLibraryBundle:logger:error:continuationHandler:",  bundle,  v6,  &v34,  v32);
    id v8 = v34;
    id v9 = v8;
    if (v7 == (id)3)
    {
      uint64_t Log = PLMigrationGetLog(v8);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (v12)
      {
        if (v6)
        {
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          *(_OWORD *)buf = 0u;
          __int128 v38 = 0u;
          uint64_t v14 = PLMigrationGetLog(v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            uint64_t v16 = 3LL;
          }
          else {
            uint64_t v16 = 2LL;
          }
          int v35 = 138412290;
          v36 = v9;
          objc_super v17 = (uint8_t *)_os_log_send_and_compose_impl( v16,  0LL,  buf,  512LL,  &_mh_execute_header,  v15,  16LL,  "Failed to perform background migration tasks. Setting activity to DEFER. Error: %@",  &v35,  12);

          objc_msgSend(v6, "logWithMessage:fromCodeLocation:type:", v17, "PLBackgroundMigrationActivity.m", 57, 16);
          if (v17 != buf) {
            free(v17);
          }
        }

        else
        {
          uint64_t v29 = PLMigrationGetLog(v13);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to perform background migration tasks. Setting activity to DEFER. Error: %@",  buf,  0xCu);
          }
        }
      }

      xpc_activity_set_state(self->_xpcActivity, 3LL);
    }

    BOOL v28 = v7 == (id)1;
  }

  else
  {
    uint64_t v18 = PLMigrationGetLog(v3);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      if (v4)
      {
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        *(_OWORD *)buf = 0u;
        __int128 v38 = 0u;
        uint64_t v22 = PLMigrationGetLog(v21);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          uint64_t v24 = 3LL;
        }
        else {
          uint64_t v24 = 2LL;
        }
        LOWORD(v35) = 0;
        v25 = (uint8_t *)_os_log_send_and_compose_impl( v24,  0LL,  buf,  512LL,  &_mh_execute_header,  v23,  16LL,  "Missing bundle for background migration actions",  &v35,  2);

        objc_msgSend(v4, "logWithMessage:fromCodeLocation:type:", v25, "PLBackgroundMigrationActivity.m", 65, 16);
        if (v25 != buf) {
          free(v25);
        }
      }

      else
      {
        uint64_t v26 = PLMigrationGetLog(v21);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Missing bundle for background migration actions",  buf,  2u);
        }
      }
    }

    BOOL v28 = 0;
  }

  [v4 close];

  return v28;
}

- (void)_runBackgroundMigrationActions
{
  uint64_t Log = PLBackendGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "running background migration tasks...",  (uint8_t *)&v10,  2u);
  }

  BOOL v5 = -[PLBackgroundMigrationActivity _runTask](self, "_runTask");
  if (v5)
  {
    uint64_t v7 = PLBackendGetLog(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      transaction = self->_transaction;
      int v10 = 138412290;
      id v11 = transaction;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Done background migrating: %@",  (uint8_t *)&v10,  0xCu);
    }

    xpc_activity_set_state(self->_xpcActivity, 5LL);
  }

- (void).cxx_destruct
{
}

+ (id)_criteriaForBackgroundMigration
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_GROUP_NAME, "com.apple.assetsd.backgroundmigrations");
  xpc_dictionary_set_uint64(v2, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  return v2;
}

+ (id)_backgroundMigrationUniqueID:(const char *)a3
{
  uint64_t v3 = stat(a3, &v11);
  if (!(_DWORD)v3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d.%llu",  v11.st_dev,  v11.st_ino));
  }
  uint64_t Log = PLBackendGetLog(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = *__error();
    id v8 = __error();
    id v9 = strerror(*v8);
    *(_DWORD *)buf = 67109378;
    int v13 = v7;
    __int16 v14 = 2080;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to obtain uniqueID for background migration registration. Error: [%d] %s",  buf,  0x12u);
  }

  return 0LL;
}

+ (void)registerIncompleteBackgroundMigrationActivity
{
  uint64_t v2 = PLRegisteredBackgroundMigrationPaths(a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      int v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7),  1LL));
        +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v8);

        int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

+ (void)installBackgroundMigrationActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_backgroundMigrationUniqueID:", objc_msgSend(v4, "fileSystemRepresentation")));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%s.migration.%@",  "assetsd",  v5));
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BackgroundMigrationTasks: Migrate library: %@",  v5));
    PLRegisterBackgroundMigrationLibraryURL(v4);
    id v8 = v6;
    __int128 v9 = (const char *)[v8 UTF8String];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _criteriaForBackgroundMigration]);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100009160;
    handler[3] = &unk_100020D40;
    id v14 = v4;
    id v15 = v7;
    id v16 = v8;
    id v11 = v8;
    id v12 = v7;
    xpc_activity_register(v9, v10, handler);
  }
}

@end