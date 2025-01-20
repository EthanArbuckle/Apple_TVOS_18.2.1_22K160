@interface PLLibraryRepairSupportRegistration
+ (BOOL)_shouldSuppressPeriodicMaintenanceTasks;
+ (int64_t)checkLibraryIsReadyForProcessing:(id)a3 libraryBundle:(id *)a4;
+ (void)_enqueueDrawAssetPersonEdgesOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)_enqueueSocialGroupAssetContainmentOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)_enqueueSocialGroupDeduplicationOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:(id)a3;
+ (void)installPeriodicMaintenanceActivity;
+ (void)registerXPCActivityHandler:(const char *)a3 description:(id)a4 executionBlock:(id)a5;
@end

@implementation PLLibraryRepairSupportRegistration

+ (BOOL)_shouldSuppressPeriodicMaintenanceTasks
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mobileslideshow");
  BOOL v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"com.apple.Photos.SuppressMaintenanceTasks");
  BOOL v5 = v3;
  if (v3)
  {
    uint64_t Log = PLBackendGetLog(v3, v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = @"com.apple.Photos.SuppressMaintenanceTasks";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MaintenanceTasks: Repair library disabled by user default %@.",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v5;
}

+ (void)registerXPCActivityHandler:(const char *)a3 description:(id)a4 executionBlock:(id)a5
{
  id v8 = a4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000C580;
  handler[3] = &unk_100020D90;
  id v13 = a5;
  id v14 = a1;
  id v12 = v8;
  id v9 = v13;
  id v10 = v8;
  xpc_activity_register(a3, XPC_ACTIVITY_CHECK_IN, handler);
}

+ (int64_t)checkLibraryIsReadyForProcessing:(id)a3 libraryBundle:(id *)a4
{
  BOOL v5 = (__CFString *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryBookmarkManager sharedBookmarkManager]( &OBJC_CLASS___PLLibraryBookmarkManager,  "sharedBookmarkManager"));
  id v62 = 0LL;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 URLFromClientLibraryURL:v5 sandboxExtension:0 error:&v62]);
  id v8 = v62;
  id v10 = v8;
  if (v7)
  {
    int64_t v11 = 6LL;
  }

  else
  {
    uint64_t Log = PLBackendGetLog(v8, v9);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v5;
      __int16 v65 = 2112;
      v66 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error getting SSB for libraryURL %@. Error: %@",  buf,  0x16u);
    }

    int64_t v11 = 0LL;
  }

  uint64_t v14 = PLBackendGetLog(v8, v9);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "accessibleLibraryURL: %@", buf, 0xCu);
  }

  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryBundleController sharedBundleController]( &OBJC_CLASS___PLPhotoLibraryBundleController,  "sharedBundleController"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 openBundleAtLibraryURL:v7]);

    if (!v19)
    {
      uint64_t v20 = PLBackendGetLog(v16, v17);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "No libraryBundle for %@", buf, 0xCu);
      }

      v19 = 0LL;
      int64_t v11 = 1LL;
    }
  }

  else
  {
    v19 = 0LL;
  }

  uint64_t v22 = PLBackendGetLog(v16, v17);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "libraryBundle: %@", buf, 0xCu);
  }

  if (v19)
  {
    if ((+[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "isSystemPhotoLibraryURL:",  v7) & 1) == 0)
    {
      id v24 = objc_alloc(&OBJC_CLASS___PLModelMigrator);
      v25 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString pathManager](v19, "pathManager"));
      id v27 = [v24 initWithPathManager:v26];
      unsigned int v28 = [v27 isPhotoLibraryDatabaseReadyForOpen:0];

      id v10 = v25;
      if (!v28)
      {
        uint64_t v54 = PLBackendGetLog(v29, v30);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Photo library database at %@ is not ready for maintenance tasks",  buf,  0xCu);
        }

        v32 = 0LL;
        int64_t v11 = 5LL;
        goto LABEL_44;
      }
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString libraryServicesManager](v19, "libraryServicesManager"));
    if (!v32)
    {
      uint64_t v33 = PLBackendGetLog(0LL, v31);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "No libraryServicesManager for library bundle %@",  buf,  0xCu);
      }

      v32 = 0LL;
      int64_t v11 = 2LL;
      goto LABEL_44;
    }
  }

  else
  {
    v32 = 0LL;
  }

  if (v11 != 6) {
    goto LABEL_45;
  }
  v60 = a4;
  id v35 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v32 reportInProgressUpgrades:0];
  id v61 = 0LL;
  unsigned int v36 = [v35 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:0 error:&v61];
  id v37 = v61;
  v58 = v37;
  if ((v36 & 1) != 0)
  {
    int64_t v11 = 6LL;
  }

  else
  {
    uint64_t v39 = PLBackendGetLog(v37, v38);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Photo library database at %@ cannot be opened",  buf,  0xCu);
    }

    int64_t v11 = 4LL;
  }

  uint64_t v41 = PLBackendGetLog(v37, v38);
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v43 = @"NO";
    if (v36) {
      v43 = @"YES";
    }
    id v57 = v35;
    v44 = v10;
    v45 = v5;
    v46 = v6;
    v47 = v43;
    *(_DWORD *)buf = 138412290;
    v64 = v47;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Maintain library: open database: %@", buf, 0xCu);

    v6 = v46;
    BOOL v5 = v45;
    id v10 = v44;
    id v35 = v57;
  }

  if (!v36)
  {
    a4 = v60;
    goto LABEL_45;
  }

  v59 = v10;
  v48 = v6;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString libraryServicesManager](v19, "libraryServicesManager"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 cplReadiness]);
  unsigned __int8 v51 = [v50 isReadyForCloudPhotoLibraryWithStatus:0];

  if ((v51 & 1) != 0)
  {
    int64_t v11 = 6LL;
    v6 = v48;
    id v10 = v59;
    a4 = v60;
    goto LABEL_45;
  }

  uint64_t v55 = PLBackendGetLog(v52, v53);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  v6 = v48;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Photo library at %@ is currently not ready",  buf,  0xCu);
  }

  int64_t v11 = 3LL;
  id v10 = v59;
  a4 = v60;
LABEL_44:

LABEL_45:
  if (a4) {
    *a4 = v19;
  }

  return v11;
}

+ (void)installPeriodicMaintenanceActivity
{
  uint64_t Log = PLBackendGetLog(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering periodic maintenance task activity",  buf,  2u);
  }

  id v5 = [a1 registerXPCActivityHandler:"com.apple.assetsd.periodicmaintenance" description:@"MaintenanceTasks: Repair library" executionBlock:&stru_100020DD0];
  uint64_t v7 = PLBackendGetLog(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Registering periodic curated library processing activity",  v9,  2u);
  }

  [a1 registerXPCActivityHandler:"com.apple.assetsd.curatedlibraryprocessing" description:@"CuratedLibraryMaintenanceTasks: Repair library" executionBlock:&stru_100020DF0];
  +[PLBackgroundMigrationActivity registerIncompleteBackgroundMigrationActivity]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "registerIncompleteBackgroundMigrationActivity");
}

+ (void)enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathManager]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 databaseContext]);
  id v7 = [v6 newShortLivedLibraryWithName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 globalValues]);
  unsigned __int8 v9 = [v8 didImportFileSystemAssets];

  uint64_t Log = PLClientServerTransactionsGetLog();
  int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Enqueuing outstanding transactions", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000B404;
  v15[3] = &unk_100020E40;
  id v16 = v5;
  id v17 = v4;
  char v20 = v9 ^ 1;
  id v18 = v7;
  id v19 = a1;
  id v12 = v7;
  id v13 = v4;
  id v14 = v5;
  [v13 registerOutstandingTransactionsHandler:v15];
}

+ (void)_enqueueSocialGroupDeduplicationOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = PLLibraryServicesOperationNameCrashRecoverySocialGroupDeduplication;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 preRunningProgress]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10000B2C4;
  id v16 = &unk_1000211F0;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v8,  7LL,  v9,  &v13));

  objc_msgSend(v11, "enqueueOperation:error:", v12, 0, v13, v14, v15, v16);
}

+ (void)_enqueueDrawAssetPersonEdgesOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = PLLibraryServicesOperationNameCrashRecoveryDrawAssetPersonEdges;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 preRunningProgress]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000B16C;
  v16[3] = &unk_100021088;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v10,  7LL,  v11,  v16));

  [v13 enqueueOperation:v15 error:0];
}

+ (void)_enqueueSocialGroupAssetContainmentOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = PLLibraryServicesOperationNameCrashRecoverySocialGroupAssetContainment;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 preRunningProgress]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10000AF64;
  id v16 = &unk_1000211F0;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v8,  7LL,  v9,  &v13));

  objc_msgSend(v11, "enqueueOperation:error:", v12, 0, v13, v14, v15, v16);
}

@end