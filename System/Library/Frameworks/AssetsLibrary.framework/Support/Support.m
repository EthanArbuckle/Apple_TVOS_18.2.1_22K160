}

void sub_100001E14(uint64_t a1)
{
  if (a1)
  {
    *(_BYTE *)(a1 + 40) = 0;
    v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0LL;

    if (PLIsRunningInStoreDemoMode())
    {
      uint64_t Log = PLStoreDemoModeGetLog();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Store demo mode enabled, system photo library will be modified or replaced with demo content!",  buf,  2u);
      }

      id v5 = +[PLDemoModeUtilities newDemoModeUtilitiesWithDefaultSystemPaths]( &OBJC_CLASS___PLDemoModeUtilities,  "newDemoModeUtilitiesWithDefaultSystemPaths");
      v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      uint64_t v7 = PLStoreDemoModeGetLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Replacing system photo library with staged store demo content if found",  v17,  2u);
      }

      unsigned int v9 = [*(id *)(a1 + 48) replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists];
      *(_BYTE *)(a1 + 40) = v9;
      uint64_t v10 = PLStoreDemoModeGetLog();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v12)
        {
          __int16 v16 = 0;
          v13 = "Installed store demo content as system photo library";
          v14 = (uint8_t *)&v16;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, v14, 2u);
        }
      }

      else if (v12)
      {
        __int16 v15 = 0;
        v13 = "Did not install store demo content";
        v14 = (uint8_t *)&v15;
        goto LABEL_12;
      }
    }
  }

id sub_100001F6C(id result)
{
  if (result)
  {
    id v1 = result;
    +[PLLibraryServicesManager setLibraryServicesDelegateClass:]( &OBJC_CLASS___PLLibraryServicesManager,  "setLibraryServicesDelegateClass:",  +[PLPlatformLibraryServicesDelegate platformLibraryServicesDelegateClass]( &OBJC_CLASS___PLPlatformLibraryServicesDelegate,  "platformLibraryServicesDelegateClass"));
    v2 = -[PLAssetsdServer initWithDaemonServices:]( objc_alloc(&OBJC_CLASS___PLAssetsdServer),  "initWithDaemonServices:",  *((void *)v1 + 1));
    v3 = (void *)*((void *)v1 + 2);
    *((void *)v1 + 2) = v2;

    [*((id *)v1 + 2) start];
    return +[PLLibraryRepairSupportRegistration installPeriodicMaintenanceActivity]( &OBJC_CLASS___PLLibraryRepairSupportRegistration,  "installPeriodicMaintenanceActivity");
  }

  return result;
}

void sub_100001FE0(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 16);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000023F0;
    v7[3] = &unk_1000211C8;
    id v8 = v2;
    id v3 = v2;
    v4 = sub_10000237C(0x1DuLL, v7);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v5;

    dispatch_resume(*(dispatch_object_t *)(a1 + 24));
  }

void sub_100002078(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 16);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000223C;
    v7[3] = &unk_1000211C8;
    id v8 = v2;
    id v3 = v2;
    v4 = sub_10000237C(0xFuLL, v7);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  }

void sub_100002110(uint64_t a1)
{
  if (a1 && *(_BYTE *)(a1 + 40))
  {
    uint64_t Log = PLStoreDemoModeGetLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Enqueuing request to warm up installed demo content",  buf,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLXPCTransaction transaction:]( &OBJC_CLASS___PLXPCTransaction,  "transaction:",  "-[PLPhotoLibraryDaemon warmUpDemoLibraryIfSupported]"));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100002210;
    v8[3] = &unk_1000211F0;
    v8[4] = a1;
    id v9 = v4;
    id v7 = v4;
    dispatch_async(v6, v8);
  }

id sub_100002210(uint64_t a1)
{
  return [*(id *)(a1 + 40) stillAlive];
}

uint64_t sub_10000223C(uint64_t a1)
{
  uint64_t Log = PLBackendGetLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "assetsd shutting down due to SIGTERM", v9, 2u);
  }

  pl_notify_disable_for_shutdown([*(id *)(a1 + 32) stopObservingSystemLibraryChanges]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryBundleController sharedBundleController]( &OBJC_CLASS___PLPhotoLibraryBundleController,  "sharedBundleController"));
  uint64_t v5 = PLPhotosErrorDomain;
  NSErrorUserInfoKey v10 = NSDebugDescriptionErrorKey;
  v11 = @"SIGTERM";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  41021LL,  v6));
  [v4 shutdownAllBundlesWithReason:v7];

  return xpc_transaction_exit_clean();
}

dispatch_source_s *sub_10000237C(uintptr_t a1, void *a2)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v6 = a2;
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0LL, v5);
  dispatch_source_set_event_handler(v7, v6);

  return v7;
}

id sub_1000023F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) logStatus];
}

LABEL_30:
  return v6 ^ 1;
}

void sub_100002984(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 managedObjectContext]);

  uint64_t Log = PLBackendGetLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "recalculating cached counts for albums & moments...",  buf,  2u);
  }

  id v8 = +[PLPhotoLibrary refreshCachedCountsOnAllAssetContainersInContext:]( &OBJC_CLASS___PLPhotoLibrary,  "refreshCachedCountsOnAllAssetContainersInContext:",  v3);
  uint64_t v10 = PLBackendGetLog(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "updating play/share/view counts for assets",  v19,  2u);
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  [v12 updateAssetPlayShareViewCountsInContext:v3];

  uint64_t v15 = PLBackendGetLog(v13, v14);
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "updating play/share/view counts for memories",  v18,  2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  [v17 updateMemoryPlayShareViewCountsInContext:v3];
}

id sub_100002AE8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  +[PLAggdLogging performLibraryStatisticsLoggingForLibrary:completionHandler:]( &OBJC_CLASS___PLAggdLogging,  "performLibraryStatisticsLoggingForLibrary:completionHandler:",  v2,  &stru_100020B80);

  return [*(id *)(a1 + 40) stillAlive];
}

void sub_100002B40(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t Log = PLBackendGetLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Error while performing statistic logging: %@",  (uint8_t *)&v5,  0xCu);
    }
  }
}

LABEL_16:
          -[PLIOSPlatformLibraryServicesDelegate _abortWithMigrationFailureReasonENOSPC]( self,  "_abortWithMigrationFailureReasonENOSPC");
          continue;
        }

        uint64_t v14 = [v11 code];
        if (v14 == (id)640) {
          goto LABEL_16;
        }
        if (v14 == (id)513) {
          goto LABEL_15;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v8);
  }

  uint64_t Log = PLMigrationGetLog(v18);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Database migration failed: %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v27 userInfo]);
  v22 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);
  v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v27;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot create persistent store: %@",  v24));

  v26 = v25;
  PLAbortWithReason([v26 UTF8String], 1);
}

          goto LABEL_17;
        }

        if (v20 == 2) {
          goto LABEL_14;
        }
        v40[2](v40, self);
        if (xpc_activity_get_state(self->_xpcActivity) != 3)
        {
          -[NSString removeObject:](v7, "removeObject:", v13);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSString array](v7, "array"));
          -[PLLibraryRepairSupport _saveInterruptedProcessingURLs:](self, "_saveInterruptedProcessingURLs:", v29);
          goto LABEL_16;
        }
      }

void sub_100003590(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryBundle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentContainer]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
  [v4 addChild:v6 withPendingUnitCount:1];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  id v50 = 0LL;
  id v8 = [v7 migrateOrCreateDatabaseIfNecessaryWithPersistentContainer:v3 migrationPolicy:7 error:&v50];
  id v9 = v50;

  id v10 = [*(id *)(a1 + 40) setMigrationType:v8];
  switch((unint64_t)v8)
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
      uint64_t Log = PLMigrationGetLog(v10);
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registering background migration", buf, 2u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 libraryURL]);
      +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v14);

LABEL_5:
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
      unsigned int v16 = [v15 isDeviceRestoreSupported];

      if (!v16) {
        goto LABEL_28;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 postProcessingToken]);

      v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceRestoreMigrationSupport]);
      if (![v20 isRestoreFromBackup])
      {

        goto LABEL_27;
      }

      unsigned __int8 v21 = [v18 isModelMigrationRestorePostProcessingComplete];

      if ((v21 & 1) != 0) {
        goto LABEL_27;
      }
      id v22 = [*(id *)(a1 + 32) isCloudPhotoLibraryEnabled];
      if (!(_DWORD)v22) {
        goto LABEL_24;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 deviceRestoreMigrationSupport]);
      unsigned int v25 = [v24 isRestoreFromBackupSourceDeviceToDevice];

      if (v25)
      {
        uint64_t v27 = PLMigrationGetLog(v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v29 = "Marking resources as purgeable after D2D restore";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
          goto LABEL_22;
        }

        goto LABEL_22;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceRestoreMigrationSupport]);
      unsigned int v35 = [v34 isRestoreFromBackupSourceMegaBackup];

      if (v35)
      {
        uint64_t v37 = PLMigrationGetLog(v36);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v29 = "Marking resources as purgeable after Mega-backup restore";
          goto LABEL_21;
        }

LABEL_22:
        v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cplSettings]);
        [v38 setRunOnceFlag:8 error:0];
        [v38 setRunOnceFlag:4 error:0];
LABEL_23:

        goto LABEL_24;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 deviceRestoreMigrationSupport]);
      unsigned int v46 = [v45 isRestoreFromBackupSourceiTunes];

      if (v46)
      {
        uint64_t v47 = PLMigrationGetLog(v22);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Wiping CPL directory after iTunes restore",  buf,  2u);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryBundle]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v49 indicatorFileCoordinator]);

        [v38 setWipeCPLOnOpen];
        goto LABEL_23;
      }

LABEL_24:
      uint64_t v39 = PLMigrationGetLog(v22);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 deviceRestoreMigrationSupport]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 restoreTypeDescription]);
        *(_DWORD *)buf = 138543362;
        v52 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Writing model migration restore post processing complete token after restore type %{public}@",  buf,  0xCu);
      }

      [v18 writeModelMigrationRestorePostProcessingCompleteToken];
LABEL_27:

LABEL_28:
      return;
    case 4uLL:
      [*(id *)(a1 + 40) operationCompletionActivities];
      uint64_t v30 = PLIsErrorEqualToCode(v9, PLPhotosErrorDomain, 46016LL);
      if ((_DWORD)v30)
      {
        uint64_t v31 = PLMigrationGetLog(v30);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Rebuild prevented by user", buf, 2u);
        }

        [*(id *)(a1 + 32) deactivateWithInvalidationError:v9];
        [*(id *)(a1 + 32) shutdownLibraryWithDescription:@"Rebuild prevented by user"];
      }

      else
      {
        [*(id *)(a1 + 40) _abortWithMigrationFailureError:v9];
      }

      goto LABEL_28;
    default:
      goto LABEL_28;
  }

void sub_100003AB0(uint64_t a1)
{
}

void sub_100003ACC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSystemPhotoLibrary])
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
    unsigned int v4 = [v3 cplInitialSyncMarkerFileExists];

    if (v4) {
      uint64_t v2 = 3LL;
    }
    else {
      uint64_t v2 = 2LL;
    }
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
  objc_msgSend( v5,  "setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:andBackupType:",  objc_msgSend(*(id *)(a1 + 32), "createOptions"),  v2);
}

void sub_100003B60(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundJobService]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryBundle]);
  [v3 performCrashRecoveryIfNeededOnBundle:v2];
}

void sub_100003BB8(uint64_t a1)
{
}

void sub_100003BD4(id a1)
{
}

void sub_100003BE0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) migrationType] == (id)1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) libraryURL]);
    unsigned int v3 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sharedStreamsEnabledForPhotoLibraryURL:",  v2);

    if (v3)
    {
      uint64_t Log = PLMigrationGetLog(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Initial sync of shared albums after rebuild",  v7,  2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates](&OBJC_CLASS___PLPhotoSharingHelper, "pollForAlbumListUpdates");
    }
  }

void sub_100003D34(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v9 = 0LL;
  unsigned __int8 v3 = +[PLProjectAlbum cleanupOrphanedProjectPreviewImagesInLibrary:error:]( &OBJC_CLASS___PLProjectAlbum,  "cleanupOrphanedProjectPreviewImagesInLibrary:error:",  v2,  &v9);
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error cleaning up orphaned project preview images: %@",  buf,  0xCu);
    }
  }

  [*(id *)(a1 + 40) stillAlive];
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = objc_autoreleasePoolPush();
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___PLPhotoLibraryDaemon);
  uint64_t v3 = -[PLPhotoLibraryDaemon setup](v2, "setup");
  objc_autoreleasePoolPop(v1);
  if (!(_DWORD)v3)
  {
    -[PLPhotoLibraryDaemon run](v2, "run");
    uint64_t v3 = 1LL;
  }

  objc_autoreleasePoolPop(v0);
  return v3;
}

id sub_100003FF0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 managedObjectContext]);
  +[PLMomentShare deleteExpiredSharesInManagedObjectContext:]( &OBJC_CLASS___PLMomentShare,  "deleteExpiredSharesInManagedObjectContext:",  v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v5 =  +[PLLibraryScope fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:forceNotification:]( &OBJC_CLASS___PLLibraryScope,  "fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:forceNotification:",  v4,  0LL);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managedObjectContext]);
  +[PLManagedAsset deleteOldPlaceholderAssetsInManagedObjectContext:]( &OBJC_CLASS___PLManagedAsset,  "deleteOldPlaceholderAssetsInManagedObjectContext:",  v7);

  return [*(id *)(a1 + 40) stillAlive];
}

void sub_1000041C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100004260(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained libraryServicesManager]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseContext]);
    uint64_t v6 = (objc_class *)objc_opt_class(v2, v5);
    id v7 = NSStringFromClass(v6);
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = objc_msgSend(v4, "newShortLivedLibraryWithName:", objc_msgSend(v8, "UTF8String"));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

void sub_1000049C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_17:
      BOOL v12 = (char *)v12 + 1;
    }

    while (v10 != v12);
    uint64_t v36 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
    id v10 = v36;
    if (v36) {
      continue;
    }
    break;
  }

LABEL_27:
  if (!-[NSString count](v7, "count"))
  {
    v38 = PLBackendGetLog(0LL, v37);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Done maintenance tasks for all libraries",  buf,  2u);
    }

    xpc_activity_set_state(self->_xpcActivity, 5LL);
  }
}

void sub_100005D00(uint64_t a1, Class aClass, uint64_t a3, _BYTE *a4)
{
  id v7 = NSStringFromClass(aClass);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _deferActivityIfRequiredForClassName:v8];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v9 = objc_alloc(aClass);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundle]);
    id v11 = [v9 initWithLibraryBundle:v10];

    uint64_t Log = PLBackendGetLog(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      Class v27 = aClass;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Starting critical maintenance task %{public}@",  (uint8_t *)&v26,  0xCu);
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[PLTimedPerfCheck start](&OBJC_CLASS___PLTimedPerfCheck, "start"));
    unsigned int v17 = [v11 runTaskWithTransaction:*(void *)(*(void *)(a1 + 32) + 16)];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 perfCheckLogStringWithPerfCheckInfo:0]);
    uint64_t v20 = PLBackendGetLog(v18, v19);
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = v21;
    if (v17)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543618;
        Class v27 = aClass;
        __int16 v28 = 2114;
        v29 = v18;
        v23 = "Completed maintenance task %{public}@%{public}@";
        v24 = v22;
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, (uint8_t *)&v26, 0x16u);
      }
    }

    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543618;
      Class v27 = aClass;
      __int16 v28 = 2114;
      v29 = v18;
      v23 = "Failed maintenance task %{public}@%{public}@";
      v24 = v22;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }

    goto LABEL_12;
  }

  *a4 = 1;
LABEL_12:
}

id sub_100005F28(uint64_t a1, Class aClass)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromClass(aClass);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v2 isEqualToString:v4];

  return v5;
}

void sub_10000620C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 libraryBundle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentContainer]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 modelMigrator]);
  id v22 = 0LL;
  id v7 = (char *)[v6 migrateOrCreateDatabaseIfNecessaryWithPersistentContainer:v4 migrationPolicy:7 error:&v22];
  id v8 = v22;

  id v9 = [*(id *)(a1 + 32) setMigrationType:v7];
  if ((unint64_t)(v7 - 1) < 2)
  {
    uint64_t Log = PLMigrationGetLog(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registering background migration", buf, 2u);
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pathManager]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 libraryURL]);
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v14);

LABEL_12:
    goto LABEL_13;
  }

  if (v7 == (char *)4)
  {
    uint64_t v15 = PLMigrationGetLog(v9);
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Database migration failed: %@", buf, 0xCu);
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);
    uint64_t v19 = (void *)v18;
    if (v18) {
      id v20 = (id)v18;
    }
    else {
      id v20 = v8;
    }
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot create persistent store: %@",  v20));

    id v12 = v21;
    PLAbortWithReason([v12 UTF8String], 1);
    goto LABEL_12;
  }

LABEL_13:
}
}

void sub_100006460(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
}

void sub_100006498(id a1)
{
}

void sub_100006664(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) capabilities]);
  unsigned int v3 = [v2 isCentralizedCacheDeleteCapable];

  if (v3)
  {
    uint64_t Log = PLBackendGetLog(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "verifying and fixing local availability for resources with broken fileIDs",  buf,  2u);
    }

    uint64_t v9 = 0LL;
    *(void *)buf = 0LL;
    uint64_t v8 = 0LL;
    +[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:countPresent:countMissing:countUnableToVerify:error:]( &OBJC_CLASS___PLCacheDeleteSupport,  "verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:countPresent:countMissing:countU nableToVerify:error:",  *(void *)(a1 + 40),  buf,  &v9,  &v8,  0LL);
  }

id sub_10000671C(uint64_t a1)
{
  return +[PLCacheDeleteSupport clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:pathManager:]( &OBJC_CLASS___PLCacheDeleteSupport,  "clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:pathManager:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

LABEL_33:
          unsigned int v3 = v57;
          v44 = (void *)v59;
        }

        else
        {
          v45 = PLBackendGetLog(v40, v41);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v54 = 0;
            goto LABEL_33;
          }

          *(_DWORD *)buf = 138543874;
          v68 = v24;
          v69 = 2114;
          v44 = (void *)v59;
          v70 = v59;
          v71 = 2112;
          v72 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Cannot remove partial video: %{public}@ of asset %{public}@, with error: %@",  buf,  0x20u);
          v54 = 0;
LABEL_29:
          unsigned int v3 = v57;
        }

        uint64_t v14 = v55;
        id v11 = v56;
LABEL_35:

        goto LABEL_36;
      }

      if ([v18 BOOLValue]
        && [v11 isEnumeratingDirectoryPostOrder])
      {
        uint64_t v31 = v16;
        v32 = rmdir((const char *)[v31 fileSystemRepresentation]);
        if (!(_DWORD)v32)
        {
          unsigned int v46 = PLBackendGetLog(v32, v33);
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 138412290;
          v68 = v31;
          Class v27 = v26;
          __int16 v28 = OS_LOG_TYPE_DEBUG;
          v29 = "Removed empty direcotry under partial video root directory %@";
          uint64_t v30 = 12;
          goto LABEL_15;
        }

        if (*__error())
        {
          v34 = __error();
          if (*v34 != 66)
          {
            uint64_t v36 = PLBackendGetLog(v34, v35);
            int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            uint64_t v37 = *__error();
            *(_DWORD *)buf = 67109120;
            LODWORD(v6_Block_object_dispose(va, 8) = v37;
            Class v27 = v26;
            __int16 v28 = OS_LOG_TYPE_ERROR;
            v29 = "an error occured while removing an empty directoy under partial video root directory: %d";
            uint64_t v30 = 8;
            goto LABEL_15;
          }
        }
      }

LABEL_36:
    }

    uint64_t v13 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
  }

  while (v13);
LABEL_41:

  id v50 = PLBackendGetLog(v48, v49);
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v6_Block_object_dispose(va, 8) = v58;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Total removed partial videos: %d", buf, 8u);
  }

  return v54 & 1;
}

BOOL sub_100006E7C(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t Log = PLBackendGetLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Failed to identify url: %@, error: %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

void sub_100007A7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t sub_100007B8C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStoreCoordinator]);

      if (v7)
      {
        uint64_t v8 = 1LL;
        goto LABEL_17;
      }

      uint64_t Log = PLImageManagerGetLog();
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned __int8 v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "resource availability service failure: nil persistent store coordinator",  v21,  2u);
      }

      uint64_t v11 = PLPhotosErrorDomain;
      NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
      v23 = @"resource availability service failure: nil persistent store coordinator";
      id v12 = &v23;
      uint64_t v13 = &v22;
    }

    else
    {
      uint64_t v14 = PLImageManagerGetLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned __int8 v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "resource availability service failure: nil moc",  v21,  2u);
      }

      uint64_t v11 = PLPhotosErrorDomain;
      NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
      os_log_type_t v25 = @"resource availability service failure: nil moc";
      id v12 = &v25;
      uint64_t v13 = &v24;
    }
  }

  else
  {
    uint64_t v9 = PLImageManagerGetLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned __int8 v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "resource availability service failure: nil photo library",  v21,  2u);
    }

    uint64_t v11 = PLPhotosErrorDomain;
    NSErrorUserInfoKey v26 = NSDebugDescriptionErrorKey;
    Class v27 = @"resource availability service failure: nil photo library";
    id v12 = &v27;
    uint64_t v13 = &v26;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  1LL));
  id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  46502LL,  v18));
  if (a2)
  {
    id v19 = v19;
    *a2 = v19;
  }

  uint64_t v8 = 0LL;
LABEL_17:

  return v8;
}

void sub_100007E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = PLSanitizedErrorForXPC(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v6);
}

void sub_100007E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = PLSanitizedErrorForXPC(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v6);
}

void sub_100007EB0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSinceDate:a1[4]];
  uint64_t v20 = v19;

  uint64_t Log = PLImageManagerGetLog();
  NSErrorUserInfoKey v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = a1[5];
    NSErrorUserInfoKey v24 = @"N";
    int v28 = 138544386;
    if ((_DWORD)a2) {
      NSErrorUserInfoKey v24 = @"Y";
    }
    uint64_t v29 = v23;
    __int16 v30 = 2114;
    uint64_t v31 = v24;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2048;
    uint64_t v35 = v20;
    __int16 v36 = 2114;
    id v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[RM]: %{public}@ video request replying to client with success: %{public}@, url: %@, duration: %.3fs, error: %{public}@",  (uint8_t *)&v28,  0x34u);
  }

  uint64_t v25 = a1[6];
  uint64_t v26 = PLSanitizedErrorForXPC(v14);
  Class v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  (*(void (**)(uint64_t, uint64_t, id, id, id, id, void *))(v25 + 16))(v25, a2, v13, v17, v16, v15, v27);
}

void sub_10000806C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v15 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v17 = v16;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) resourceIdentity]);
  os_log_type_t v19 = PLShouldBoostLogLevelForResourceRecipeID([v18 recipeID]) ^ 1;

  uint64_t Log = PLImageManagerGetLog();
  unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v21, v19))
  {
    id v34 = v13;
    id v36 = v11;
    if ((_DWORD)a2) {
      NSErrorUserInfoKey v22 = @"Y";
    }
    else {
      NSErrorUserInfoKey v22 = @"N";
    }
    id v23 = v14;
    uint64_t v24 = *(void *)(a1 + 48);
    id v38 = v12;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetObjectIDURL", v34, v36));
    uint64_t v26 = PLShortObjectIDFromURL();
    unsigned int v39 = a2;
    Class v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    int v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) resourceIdentity]);
    uint64_t v29 = PLResourceIdentityShortDescription();
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138544642;
    uint64_t v41 = v24;
    id v14 = v23;
    __int16 v42 = 2114;
    v43 = v22;
    id v13 = v35;
    id v11 = v37;
    __int16 v44 = 2048;
    uint64_t v45 = v17;
    __int16 v46 = 2114;
    uint64_t v47 = v37;
    __int16 v48 = 2114;
    v49 = v27;
    __int16 v50 = 2114;
    v51 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v19,  "[RM]: %{public}@ resource availability request replying to client with success: %{public}@, duration: %.3fs, error : %{public}@, asset: %{public}@, resource: %{public}@",  buf,  0x3Eu);

    id v12 = v38;
    a2 = v39;
  }

  uint64_t v31 = *(void *)(a1 + 56);
  uint64_t v32 = PLSanitizedErrorForXPC(v11);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  (*(void (**)(uint64_t, uint64_t, id, id, id, void *))(v31 + 16))(v31, a2, v14, v13, v12, v33);
}

void sub_1000083B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000083C8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedObjectContext]);
  id v15 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLPerson fetchDuplicatePersonUUIDsInManagedObjectContext:error:]( &OBJC_CLASS___PLPerson,  "fetchDuplicatePersonUUIDsInManagedObjectContext:error:",  v2,  &v15));
  id v4 = v15;

  if (v3)
  {
    id v7 = [v3 count];
    if (v7)
    {
      uint64_t Log = PLBackendGetLog(v7, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v3 count];
        *(_DWORD *)buf = 134218242;
        id v17 = v11;
        __int16 v18 = 2114;
        os_log_type_t v19 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Duplicate personUUID maintenance: Found %tu duplicates: %{public}@",  buf,  0x16u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
      [v12 setSqliteErrorForRebuildReason:19 allowsExit:1];
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v13 = PLBackendGetLog(v5, v6);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Duplicate personUUID maintenance: failed to detect duplicate personUUIDs: %@",  buf,  0xCu);
    }
  }
}

BOOL sub_100008B58(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(*(void *)(a1 + 32) + 16LL));
  if (should_defer)
  {
    BOOL v3 = xpc_activity_set_state(*(xpc_activity_t *)(*(void *)(a1 + 32) + 16LL), 3LL);
    uint64_t Log = PLMigrationGetLog(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      if (*(void *)(a1 + 40))
      {
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        *(_OWORD *)buf = 0u;
        __int128 v17 = 0u;
        uint64_t v8 = PLMigrationGetLog(v7);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          uint64_t v10 = 3LL;
        }
        else {
          uint64_t v10 = 2LL;
        }
        v15[0] = 0;
        id v11 = (uint8_t *)((uint64_t (*)(uint64_t, void, uint8_t *, uint64_t, const mach_header_64 *, os_log_s *, uint64_t, const char *, _WORD *, int))_os_log_send_and_compose_impl)( v10,  0LL,  buf,  512LL,  &_mh_execute_header,  v9,  1LL,  "Defer processing background migration",  v15,  2);

        objc_msgSend( *(id *)(a1 + 40),  "logWithMessage:fromCodeLocation:type:",  v11,  "PLBackgroundMigrationActivity.m",  47,  1);
        if (v11 != buf) {
          free(v11);
        }
      }

      else
      {
        uint64_t v12 = PLMigrationGetLog(v7);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Defer processing background migration",  buf,  2u);
        }
      }
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 24) stillAlive];
  return !should_defer;
}

void sub_100009160(void *a1, void *a2)
{
  BOOL v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = a1[4];
    id v17 = 0LL;
    unint64_t v5 = +[PLLibraryRepairSupportRegistration checkLibraryIsReadyForProcessing:libraryBundle:]( &OBJC_CLASS___PLLibraryRepairSupportRegistration,  "checkLibraryIsReadyForProcessing:libraryBundle:",  v4,  &v17);
    id v6 = v17;
    if (v5 > 6)
    {
LABEL_12:

      goto LABEL_13;
    }

    if (((1LL << v5) & 0x37) != 0)
    {
      BOOL v7 = xpc_activity_set_state(v3, 5LL);
      uint64_t Log = PLBackendGetLog(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        uint64_t v12 = "Library not ready for background migration. Identifier: %@";
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }

    else
    {
      if (v5 != 3)
      {
        uint64_t v10 = -[PLBackgroundMigrationActivity initWithLibraryBundle:xpcActivity:description:]( objc_alloc(&OBJC_CLASS___PLBackgroundMigrationActivity),  "initWithLibraryBundle:xpcActivity:description:",  v6,  v3,  a1[5]);
        -[os_log_s _runBackgroundMigrationActions](v10, "_runBackgroundMigrationActions");
        goto LABEL_11;
      }

      BOOL v13 = xpc_activity_set_state(v3, 3LL);
      uint64_t v15 = PLBackendGetLog(v13, v14);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v16;
        uint64_t v12 = "Library not ready for background migration - rebuild in progress. Identifier: %@";
        goto LABEL_6;
      }
    }

LABEL_11:
    goto LABEL_12;
  }

  return v6 != 0LL;
}

void sub_100009730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100009C1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100009C5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009C6C(uint64_t a1)
{
}

void sub_100009C74(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 cloudPhotoLibraryManager]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100009CC8(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 processObjectsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v4;
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v5 = (void *)a1[5];
    if (v5)
    {
      uint64_t v6 = *(void *)(a1[7] + 8LL);
      id v8 = *(id *)(v6 + 40);
      unsigned __int8 v7 = [v5 processObjectsWithError:&v8];
      objc_storeStrong((id *)(v6 + 40), v8);
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v7;
    }
  }

LABEL_14:
  return 1;
}

void sub_10000A16C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A1A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A1B8(uint64_t a1)
{
}

void sub_10000A1C0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[PLFetchingAlbum predicateForAlbumKind:]( &OBJC_CLASS___PLFetchingAlbum,  "predicateForAlbumKind:",  1613LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLManagedAsset entityName](&OBJC_CLASS___PLManagedAsset, "entityName"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v3));

  [v4 setPredicate:v2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 managedObjectContext]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v7 + 40);
  id v8 = [v6 countForFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
}

void sub_10000AF64(uint64_t a1)
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x3032000000LL;
  v4[3] = sub_10000B050;
  v4[4] = sub_10000B060;
  id v5 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000B068;
  v3[3] = &unk_100020EA8;
  v3[4] = v4;
  [v2 performTransactionSync:v3 withName:"+[PLLibraryRepairSupportRegistration _enqueueSocialGroupAssetContainmentOperationWithLSM:library:serverTransaction:]_block_invoke"];

  [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeSocialGroupAssetContainment];
  _Block_object_dispose(v4, 8);
}

void sub_10000B038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000B050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B060(uint64_t a1)
{
}

void sub_10000B068(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 managedObjectContext]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:error:]( &OBJC_CLASS___PLSocialGroup,  "runAssetContainmentOnAllSocialGroupsInContext:error:",  v3,  &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  if ((v5 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error running asset containment for all groups in the library: %@",  buf,  0xCu);
    }
  }

void sub_10000B16C(id *a1, uint64_t a2)
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___PLModelMigrationAction_DrawAssetPersonEdges, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] pathManager]);
  id v12 = 0LL;
  LOBYTE(v3) = +[PLBackgroundModelMigration resetBackgroundActionClass:pathManager:error:]( &OBJC_CLASS___PLBackgroundModelMigration,  "resetBackgroundActionClass:pathManager:error:",  v3,  v4,  &v12);
  id v5 = v12;

  if ((v3 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error resetting PLModelMigrationAction_DrawAssetPersonEdges: %@",  buf,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] pathManager]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 libraryURL]);
  +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v11);

  [a1[6] completeTransactionScope:PLTransactionScopeSocialGroupAssetPersonEdges];
}

id sub_10000B2C4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  [v2 performTransactionSync:&stru_100020E80 withName:"+[PLLibraryRepairSupportRegistration _enqueueSocialGroupDeduplicationOperationWithLSM:library:serverTransaction:]_block_invoke"];

  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeSocialGroupDeduplication];
}

void sub_10000B318(id a1, PLPhotoLibrary *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibrary managedObjectContext](a2, "managedObjectContext"));
  id v9 = 0LL;
  unsigned __int8 v3 = +[PLSocialGroup deleteDuplicateGraphAndUnverifiedGroupsInContext:error:]( &OBJC_CLASS___PLSocialGroup,  "deleteDuplicateGraphAndUnverifiedGroupsInContext:error:",  v2,  &v9);
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error deduplicating social groups in library: %@",  buf,  0xCu);
    }
  }
}

void sub_10000B404(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:]( &OBJC_CLASS___PLClientServerTransaction,  "beginClientTransactionWithChangeScopes:pathManager:identifier:",  v3,  *(void *)(a1 + 32),  "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionToken]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:]( &OBJC_CLASS___PLClientServerTransaction,  "beginServerTransactionWithToken:changeScopes:pathManager:identifier:",  v5,  v3,  *(void *)(a1 + 32),  "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke"));

  [v4 completeTransaction];
  uint64_t v7 = PLTransactionScopeMomentGeneration;
  if ([v3 containsObject:PLTransactionScopeMomentGeneration])
  {
    if (PLPlatformMomentsSupported())
    {
      uint64_t v8 = PLLibraryServicesOperationNameCrashRecoveryRebuildMoments;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_10000BBC0;
      v60[3] = &unk_1000211F0;
      v61 = (os_log_s *)*(id *)(a1 + 40);
      id v62 = v6;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v8,  6LL,  v9,  v60));

      [*(id *)(a1 + 40) enqueueOperation:v10 error:0];
      id v11 = v61;
    }

    else
    {
      uint64_t Log = PLMomentsGetLog([v6 completeTransactionScope:v7]);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Ignoring requested moment rebuild because of outstanding transactions",  buf,  2u);
      }
    }
  }

  if (([v3 containsObject:PLTransactionScopeAlbumCounts] & 1) != 0
    || [v3 containsObject:PLTransactionScopeImportSessionCounts])
  {
    uint64_t v13 = PLLibraryServicesOperationNameCrashRecoveryRecalculateAlbumCounts;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10000BD0C;
    v55[3] = &unk_100021088;
    id v56 = *(id *)(a1 + 40);
    id v57 = v3;
    id v58 = v6;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v13,  7LL,  v14,  v55));

    [*(id *)(a1 + 40) enqueueOperation:v15 error:0];
  }

  uint64_t v16 = PLTransactionScopeCloudFeed;
  if ([v3 containsObject:PLTransactionScopeCloudFeed])
  {
    if (PLPlatformCloudFeedSupported())
    {
      uint64_t v17 = PLLibraryServicesOperationNameCrashRecoveryRebuildCloudFeed;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_10000BDF0;
      v52[3] = &unk_1000211F0;
      v53 = v6;
      id v54 = *(id *)(a1 + 40);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v17,  7LL,  v18,  v52));

      [*(id *)(a1 + 40) enqueueOperation:v19 error:0];
      __int128 v20 = v53;
    }

    else
    {
      uint64_t v21 = PLCloudFeedGetLog([v6 completeTransactionScope:v16]);
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Ignoring requested cloud feed rebuild because of outstanding transactions",  buf,  2u);
      }
    }
  }

  id v22 = [v3 containsObject:PLTransactionScopeFileIngestion];
  if ((_DWORD)v22)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      uint64_t v23 = PLMigrationGetLog(v22);
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Not Forcing redundant import because of outstanding transactions due to outstanding File System Import",  buf,  2u);
      }
    }

    else
    {
      uint64_t v25 = PLLibraryServicesOperationNameCrashRecoveryImportFromFileSystem;
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_10000BF0C;
      v49[3] = &unk_1000211F0;
      __int16 v50 = (os_log_s *)*(id *)(a1 + 40);
      id v51 = v6;
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v25,  7LL,  v26,  v49));

      [*(id *)(a1 + 40) enqueueOperation:v27 error:0];
      __int128 v24 = v50;
    }
  }

  uint64_t v28 = PLTransactionScopeSearchIndex;
  if ([v3 containsObject:PLTransactionScopeSearchIndex])
  {
    if ([*(id *)(a1 + 40) isSearchIndexingEnabled])
    {
      uint64_t v29 = PLLibraryServicesOperationNameCrashRecoveryResetSearchIndex;
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_10000C0CC;
      v46[3] = &unk_1000211F0;
      __int128 v47 = (os_log_s *)*(id *)(a1 + 40);
      id v48 = v6;
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v29,  7LL,  v30,  v46));

      [*(id *)(a1 + 40) enqueueOperation:v31 error:0];
      __int128 v32 = v47;
    }

    else
    {
      uint64_t v33 = PLSearchIndexGetLog([v6 completeTransactionScope:v28]);
      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Ignoring requested force search reindex because isSearchIndexingEnabled is NO.",  buf,  2u);
      }
    }
  }

  if ([v3 containsObject:PLTransactionScopePlaceholderDownload])
  {
    uint64_t v34 = PLLibraryServicesOperationNameCrashRecoveryRestartPendingPlaceholderAssets;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10000C22C;
    v43[3] = &unk_1000211F0;
    id v44 = *(id *)(a1 + 48);
    id v45 = v6;
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v34,  7LL,  v35,  v43));

    [*(id *)(a1 + 40) enqueueOperation:v36 error:0];
  }

  if ([v3 containsObject:PLTransactionScopeLockedResources])
  {
    uint64_t v37 = PLLibraryServicesOperationNameCrashRecoveryRepairInterruptedLockedResourceTransfer;
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preRunningProgress]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10000C2B8;
    v40[3] = &unk_1000211F0;
    id v41 = *(id *)(a1 + 48);
    id v42 = v6;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v37,  7LL,  v38,  v40));

    [*(id *)(a1 + 40) enqueueOperation:v39 error:0];
  }

  if ([v3 containsObject:PLTransactionScopeSocialGroupDeduplication]) {
    [*(id *)(a1 + 56) _enqueueSocialGroupDeduplicationOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
  if ([v3 containsObject:PLTransactionScopeSocialGroupAssetPersonEdges]) {
    [*(id *)(a1 + 56) _enqueueDrawAssetPersonEdgesOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
  if ([v3 containsObject:PLTransactionScopeSocialGroupAssetContainment]) {
    [*(id *)(a1 + 56) _enqueueSocialGroupAssetContainmentOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
}

void sub_10000BBC0(uint64_t a1)
{
  uint64_t Log = PLMomentsGetLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Forcing moment rebuild because of outstanding transactions",  buf,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) momentGenerationDataManager]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 generator]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsEventManager]);

  [v7 startRecordingTimedEventToken];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C520;
  block[3] = &unk_1000210D8;
  id v12 = v7;
  uint64_t v14 = v8;
  id v13 = *(id *)(a1 + 40);
  id v9 = v7;
  dispatch_block_t v10 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  [v5 rebuildAllMomentsWithOptions:&__NSDictionary0__struct completionHandler:v10];
  dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000BD0C(id *a1, uint64_t a2)
{
  uint64_t Log = PLBackendGetLog(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Forcing (album, moment and/or importSession) count and keyAsset recalculation because of outstanding transactions",  buf,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] databaseContext]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C474;
  v6[3] = &unk_100020E18;
  id v7 = a1[5];
  id v8 = a1[6];
  [v5 performTransactionSync:v6 withName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke_2"];
}

void sub_10000BDF0(uint64_t a1)
{
  uint64_t Log = PLCloudFeedGetLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Forcing cloud feed rebuild because of outstanding transactions",  buf,  2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C460;
  block[3] = &unk_1000211C8;
  id v9 = *(id *)(a1 + 32);
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) databaseContext]);
  id v6 = [v5 newShortLivedLibraryWithName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke_2"];

  id v7 = [[PLCloudFeedEntriesManager alloc] initWithPhotoLibrary:v6];
  [v7 rebuildAllEntries:v4];
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000BF0C(uint64_t a1)
{
  uint64_t Log = PLMigrationGetLog(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Forcing redundant import because of outstanding transactions",  buf,  2u);
  }

  dispatch_block_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s --> forceImportFileSystemDataIntoDatabaseWithPhotoLibrary", "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOpe rationsIfNecessary:]_block_invoke"));
  id v6 = objc_msgSend(v4, "newShortLivedLibraryWithName:", objc_msgSend(v5, "UTF8String"));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 globalValues]);
  [v7 setImportFilesystemAssetsState:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C394;
  block[3] = &unk_1000211C8;
  id v15 = *(id *)(a1 + 40);
  dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000C3A8;
  v11[3] = &unk_100021120;
  id v12 = *(id *)(a1 + 32);
  id v13 = v8;
  id v10 = v8;
  [v9 loadFileSystemDataIntoDatabaseIfNeededWithReason:@"outstanding PLTransactionScopeFileIngestion transaction" completionHandler:v11];

  dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000C0CC(uint64_t a1)
{
  uint64_t Log = PLSearchIndexGetLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Forcing search reindex because of outstanding transactions",  buf,  2u);
  }

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10000C344;
  id v12 = &unk_1000211F0;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0LL, &v9);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchIndexManager", v9, v10, v11, v12));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) searchIndexManager]);
    [v6 dropSearchIndexWithCompletion:v4];

    dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    uint64_t v7 = PLSearchIndexGetLog();
    dispatch_block_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to reset search index due to nil search index manager",  buf,  2u);
    }
  }
}

id sub_10000C22C(uint64_t a1, uint64_t a2)
{
  uint64_t Log = PLBackendGetLog(a1, a2);
  dispatch_block_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Forcing restart of all pending placeholder assets",  v6,  2u);
  }

  +[PHAssetCreationRequestPlaceholderSupportCrashRecovery restartPendingPlaceholderDownloadsForLibrary:]( &OBJC_CLASS___PHAssetCreationRequestPlaceholderSupportCrashRecovery,  "restartPendingPlaceholderDownloadsForLibrary:",  *(void *)(a1 + 32));
  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopePlaceholderDownload];
}

id sub_10000C2B8(uint64_t a1, uint64_t a2)
{
  uint64_t Log = PLBackendGetLog(a1, a2);
  dispatch_block_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Forcing repair of interrupted locked resource job",  v6,  2u);
  }

  +[PLBackgroundJobLockedResourceWorker recoverFromInterruptedJobWithLibrary:]( &OBJC_CLASS___PLBackgroundJobLockedResourceWorker,  "recoverFromInterruptedJobWithLibrary:",  *(void *)(a1 + 32));
  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeLockedResources];
}

id sub_10000C344(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) searchIndexManager]);
  [v2 unpauseIndexingWithReason:PLSearchIndexPauseReasonCloseSearchIndex];

  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeSearchIndex];
}

id sub_10000C394(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransactionScope:PLTransactionScopeFileIngestion];
}

uint64_t sub_10000C3A8(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t Log = PLMigrationGetLog(a1);
    dispatch_block_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering background migration after rebuild",  v8,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryURL]);
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v6);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_10000C460(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransactionScope:PLTransactionScopeCloudFeed];
}

void sub_10000C474(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  +[PLPhotoLibrary refreshCachedCountsOnAllAssetContainersInContext:]( &OBJC_CLASS___PLPhotoLibrary,  "refreshCachedCountsOnAllAssetContainersInContext:");
  [v3 updateKeyAssetsInAlbums:0];

  uint64_t v4 = PLTransactionScopeAlbumCounts;
  uint64_t v5 = PLTransactionScopeImportSessionCounts;
}

id sub_10000C520(uint64_t a1)
{
  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeMomentGeneration];
}

void sub_10000C570(id a1, PLLibraryRepairSupport *a2)
{
}

void sub_10000C578(id a1, PLLibraryRepairSupport *a2)
{
}

void sub_10000C580(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    if ([*(id *)(a1 + 48) _shouldSuppressPeriodicMaintenanceTasks])
    {
      xpc_activity_set_state(activity, 5LL);
    }

    else
    {
      uint64_t v5 = -[PLLibraryRepairSupport initWithActivity:description:]( objc_alloc(&OBJC_CLASS___PLLibraryRepairSupport),  "initWithActivity:description:",  activity,  *(void *)(a1 + 32));
      -[PLLibraryRepairSupport runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:]( v5,  "runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:",  *(void *)(a1 + 40));
    }

    goto LABEL_7;
  }

  uint64_t v4 = activity;
  if (!state)
  {
    [*(id *)(a1 + 48) _updateXPCActivityProperties:activity];
LABEL_7:
    uint64_t v4 = activity;
  }
}

void sub_10000CCAC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedObjectContext]);
  [*(id *)(a1 + 40) deletePersistentHistoryWithContext:v2];
}

id sub_10000CFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = PLGatekeeperXPCGetLog(a1, a2);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PLKeepDaemonAliveAssertionServer: XPC keep alive server connection finalized",  v5,  2u);
  }

  return [(id)qword_1000286F0 _deactivateCameraSession];
}

void sub_10000D050(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = PLGatekeeperXPCGetLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "PLKeepDaemonAliveAssertionServer: received event",  v9,  2u);
  }

  uint64_t v5 = objc_autoreleasePoolPush();
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v2);
    uint64_t v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    if (!xpc_dictionary_get_BOOL(v2, "cameraRollVisibilityChange"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v2);
      xpc_connection_send_message(v7, reply);
    }
  }

  objc_autoreleasePoolPop(v5);
}

void sub_10000D134(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v8 = PLGatekeeperXPCGetLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "PLKeepDaemonAliveAssertionServer: listener connection went invalid.",  (uint8_t *)v10,  2u);
    }

    goto LABEL_9;
  }

  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v6 = PLGatekeeperXPCGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = xpc_connection_get_pid((xpc_connection_t)v3);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PLKeepDaemonAliveAssertionServer: New connection from PID: %d",  (uint8_t *)v10,  8u);
    }

    [*(id *)(a1 + 32) _registerNewConnection:v3];
LABEL_9:
    objc_autoreleasePoolPop(v4);

    return;
  }

  __break(1u);
}

void sub_10000D2D8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000286F0;
  qword_1000286F0 = (uint64_t)v1;
}

void sub_10000DBAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000DCCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000DCE4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedObjectContext]);
  id v17 = 0LL;
  id v3 = +[PLSceneClassification countOfOrphanedSceneClassificationsWithLimit:inContext:error:]( &OBJC_CLASS___PLSceneClassification,  "countOfOrphanedSceneClassificationsWithLimit:inContext:error:",  100000LL,  v2,  &v17);
  id v4 = v17;

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) globalValues]);
    [v5 setOrphanedSceneClassificationsCount:0];

    uint64_t Log = PLBackendGetLog(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to fetch orphaned scene classification count: %@",  buf,  0xCu);
    }

LABEL_7:
    goto LABEL_8;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) globalValues]);
  [v11 setOrphanedSceneClassificationsCount:v10];

  if ((unint64_t)v3 > 0x1869F)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    uint64_t v14 = PLBackendGetLog(v12, v13);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) libraryURL]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v15));
      *(_DWORD *)buf = 134218242;
      id v19 = v3;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Maintenance task: Excessive orphaned scene classifications found: %tu in library URL: %@",  buf,  0x16u);
    }

    goto LABEL_7;
  }

LABEL_8:
}

uint64_t sub_10000DEEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000DEFC(uint64_t a1)
{
}

void sub_10000DF04(void *a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLManagedAsset entityInManagedObjectContext:]( &OBJC_CLASS___PLManagedAsset,  "entityInManagedObjectContext:",  a1[4]));
  -[NSFetchRequest setEntity:](v2, "setEntity:", v3);

  id v4 = (void *)a1[4];
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v5 + 40);
  id v6 = [v4 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = v6;
}

void sub_10000DFA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t Log = PLBackendGetLog(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryURL]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v8));
      int v17 = 138412546;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v5;
      uint64_t v10 = "Maintenance task: Failed to snapshot journals when requested due to excessive history size for library URL: %@. Error: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v17, v13);
    }
  }

  else
  {
    id v14 = [*(id *)(a1 + 32) setSqliteErrorForRebuildReason:*(void *)(a1 + 48) allowsExit:0];
    uint64_t v16 = PLBackendGetLog(v14, v15);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryURL]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilePathDescription descriptionWithFileURL:]( &OBJC_CLASS___PLFilePathDescription,  "descriptionWithFileURL:",  v8));
      int v17 = 138412290;
      uint64_t v18 = v9;
      uint64_t v10 = "Maintenance task: Added rebuild flag for excessive persistent history size for library URL: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 12;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 40) stillAlive];
}

void sub_10000E428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10000E44C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000E45C(uint64_t a1)
{
}

id sub_10000E464(uint64_t a1, void *a2)
{
  id result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += result;
  return result;
}

void sub_10000E49C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000EB04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

id sub_10000EB5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) getPhotoCount:*(void *)(*(void *)(a1 + 40) + 8) + 24 videoCount:*(void *)(*(void *)(a1 + 48) + 8) + 24];
}

void sub_10000EB7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t Log = PLSearchBackendIndexStatusMaintenanceTaskGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Error fetching asset count from spotlight: %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
    [v8 setPayloadValue:v7 forKey:PLCoreAnalyticsSearchIndexStatusSpotlightIndexCountKey onEventWithName:PLCoreAnalyticsSearchIndexStatusEvent];
  }
}

id sub_10000EC7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSearchIndexSpotlightClientStateMismatchedCount:0];
}

void sub_10000EE64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000FB68(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  id v2 = (id)objc_claimAutoreleasedReturnValue([v1 analyticsEventManager]);

  [v2 removeEventWithName:PLCoreAnalyticsLibraryCreateEvent];
  [v2 removeEventWithName:PLCoreAnalyticsLibraryMigrateEvent];
  [v2 removeEventWithName:PLCoreAnalyticsLibraryRebuildEvent];
}

id sub_10000FBE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeChangeHandling];
}

void sub_10000FBF0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelMigrator]);
  [v1 loadFileSystemAssetsNotifyEnter];
}

void sub_10000FC20(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  id v3 = objc_msgSend( v2,  "newShortLivedLibraryWithName:",  objc_msgSend(PLLibraryServicesOperationNameCreateSingletonAlbums, "UTF8String"));

  uint64_t v4 = PLGenericAlbumHashOfSingletonAlbumValues(0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentStoreCoordinator]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStores]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:PLAlbumSingletonHashKey]);
    id v12 = [v11 unsignedIntegerValue];

    if (v12 != (id)v4) {
      [v3 repairSingletonObjects];
    }
  }

  else
  {
    uint64_t Log = PLLibraryServicesGetLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logPrefix]);
      int v16 = 138543362;
      int v17 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to get store metadata in PLLibraryServicesOperationNameCreateSingletonAlbums",  (uint8_t *)&v16,  0xCu);
    }
  }
}

id sub_10000FDC8(uint64_t a1)
{
  return +[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]( &OBJC_CLASS___PLLibraryRepairSupportRegistration,  "enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:",  *(void *)(a1 + 32));
}

void sub_10000FDDC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  id v3 = objc_msgSend( v2,  "newShortLivedLibraryWithName:",  objc_msgSend(PLLibraryServicesOperationNameEnsureLabelsUpdated, "UTF8String"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010D38;
  v6[3] = &unk_100021088;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 40);
  id v4 = v3;
  id v5 = v7;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:]( &OBJC_CLASS___PLManagedObjectContext,  "_pl_megamoc_runWithPerformWarningsSuppressed:",  v6);
}

void sub_10000FEC0(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  id v2 = objc_msgSend( v1,  "newShortLivedLibraryWithName:",  objc_msgSend(PLLibraryServicesOperationNameCheckForMediaAnalysisVersionBump, "UTF8String"));

  PLCheckForMediaAnalysisVersionBump(v2);
}

void sub_10000FF20(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) createOptions];
  char v3 = v2;
  if ((~v2 & 0x11LL) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryURL]);
    id v4 = [[PLPhotoAnalysisServiceClient alloc] initWithLibraryURL:v6];
    id v5 = v4;
    if ((v3 & 1) == 0) {
      [v4 notifyLibraryAvailableAtURLForPhotoanalysisd:v6];
    }
    if ((v3 & 0x10) == 0) {
      [v5 notifyLibraryAvailableAtURLForMediaanalysisd:v6];
    }
  }

void sub_10000FFC0(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryURL]);
  id v21 = 0LL;
  char v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:]( &OBJC_CLASS___PLPhotoLibraryIdentifier,  "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:",  v2,  0LL,  &v21));
  id v4 = v21;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 containerIdentifier]);
    if (!v5)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v17 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PLPlatformLibraryServicesDelegate.m", 254, @"Invalid parameter not satisfying: %@", @"libraryBundleID != nil" object file lineNumber description];
    }

    if ([v5 isEqualToString:PLPhotoLibraryUserDomainContainerIdentifier])
    {
      uint64_t Log = PLLibraryServicesGetLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logPrefix]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v2;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: SpaceAttribution: Skipping registration of user domain library %@",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2050000000LL;
      id v11 = (void *)qword_1000286F8;
      uint64_t v25 = qword_1000286F8;
      if (!qword_1000286F8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100010930;
        uint64_t v28 = &unk_100021188;
        uint64_t v29 = &v22;
        sub_100010930((uint64_t)buf);
        id v11 = (void *)v23[3];
      }

      id v12 = v11;
      _Block_object_dispose(&v22, 8);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 defaultManager]);
      uint64_t v22 = 0LL;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2050000000LL;
      uint32_t v13 = (void *)qword_100028708;
      uint64_t v25 = qword_100028708;
      if (!qword_100028708)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_1000109F4;
        uint64_t v28 = &unk_100021188;
        uint64_t v29 = &v22;
        sub_1000109F4((uint64_t)buf);
        uint32_t v13 = (void *)v23[3];
      }

      id v14 = v13;
      _Block_object_dispose(&v22, 8);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pathInfoWithURL:v2]);
      __int128 v26 = v15;
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100010AB8;
      v18[3] = &unk_1000210B0;
      v18[4] = *(void *)(a1 + 40);
      id v19 = v5;
      id v20 = v2;
      -[os_log_s registerPaths:forBundleID:completionHandler:]( v7,  "registerPaths:forBundleID:completionHandler:",  v16,  v19,  v18);
    }
  }

  else
  {
    uint64_t v9 = PLLibraryServicesGetLog();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logPrefix]);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to obtain library identifier for %@: %@",  buf,  0x20u);
    }
  }
}

void sub_100010380( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_1000103A4(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[PLXPCTransaction transaction:]( &OBJC_CLASS___PLXPCTransaction,  "transaction:",  "-[PLPlatformLibraryServicesDelegate commonBuiltInOperations]_block_invoke"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLConcurrencyLimiter sharedLimiter](&OBJC_CLASS___PLConcurrencyLimiter, "sharedLimiter"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 sharedBackgroundQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000107D8;
  block[3] = &unk_1000211F0;
  id v8 = v1;
  id v9 = v2;
  id v5 = v2;
  id v6 = v1;
  dispatch_sync(v4, block);
}

void sub_100010480(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) shouldSkipFileSystemImportOperation];
  if ((v2 & 1) != 0)
  {
    uint64_t Log = PLMigrationGetLog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Skipping file system import operation",  v11,  2u);
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 100LL));
    objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "totalUnitCount"));
  }

  else
  {
    dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0LL, &stru_1000210F8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) modelMigrator]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100010670;
    v12[3] = &unk_100021120;
    id v13 = *(id *)(a1 + 40);
    id v14 = v6;
    id v5 = v6;
    [v7 loadFileSystemDataIntoDatabaseIfNeededWithReason:@"Library services bringup" completionHandler:v12];

    dispatch_block_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }

  if (([*(id *)(a1 + 40) isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) databaseContext]);
    id v9 = [v8 newShortLivedLibraryWithName:"photoanalysisd FTE registration"];

    +[PLPhotoAnalysisPhotoLibraryService notifyComputeCacheDidLoadForLibrary:reply:]( &OBJC_CLASS___PLPhotoAnalysisPhotoLibraryService,  "notifyComputeCacheDidLoadForLibrary:reply:",  v9,  &stru_100021160);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) modelMigrator]);
  [v10 loadFileSystemAssetsNotifyLeave];
}

void sub_100010628(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v2 rebuildJournalManager]);
  [v1 start];
}

uint64_t sub_100010670(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t Log = PLMigrationGetLog(a1);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering background migration after rebuild",  v8,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
    dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryURL]);
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:]( &OBJC_CLASS___PLBackgroundMigrationActivity,  "installBackgroundMigrationActivity:",  v6);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100010728(id a1, NSError *a2)
{
  id v2 = a2;
  char v3 = v2;
  if (v2)
  {
    uint64_t Log = PLMigrationGetLog(v2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "photoanalysisd FTE registration failed. Error: %@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_1000107D8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databaseContext]);
  id v3 = [v2 newShortLivedLibraryWithName:"thumbnailManager_rebuildCheck"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
  uint64_t v5 = PLLibraryIDFromPathManager();
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = PLDataStoreForClassIDAndLibraryID(1LL, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 thumbnailManager]);
  id v10 = v9;
  if (v3)
  {
    if ([v9 hasExceededRebuildThumbnailRequestLimit])
    {
      [v10 handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:v3];
      [*(id *)(a1 + 32) shutdownLibraryWithDescription:@"thumbnail manager has exceeded rebuild request limit"];
    }

    if ([v10 hasRebuildThumbnailsRequest])
    {
      [v10 rebuildAllMissingThumbnailsInLibrary:v3];
    }

    else if ([v10 wantsTableOnlyRebuild])
    {
      [v10 continueRebuildingTableThumbsInLibrary:v3];
    }
  }

  else
  {
    uint64_t Log = PLThumbnailsGetLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cannot check thumbnail rebuild status because there is no library",  v13,  2u);
    }
  }

  [*(id *)(a1 + 40) stillAlive];
}

void sub_100010930(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("SAPathManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000286F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getSAPathManagerClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"PLPlatformLibraryServicesDelegate.m",  45,  @"Unable to find class %s",  "SAPathManager");

    __break(1u);
  }

void sub_1000109F4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("SAPathInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100028708 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getSAPathInfoClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"PLPlatformLibraryServicesDelegate.m",  46,  @"Unable to find class %s",  "SAPathInfo");

    __break(1u);
  }

void sub_100010AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t Log = PLLibraryServicesGetLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logPrefix]);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) path]);
      int v15 = 138544130;
      int v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      id v10 = "%{public}@: SpaceAttribution: Failed to register (%{public}@, %@) %@";
      id v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logPrefix]);
    uint64_t v14 = *(void *)(a1 + 40);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) path]);
    int v15 = 138543874;
    int v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v9;
    id v10 = "%{public}@: SpaceAttribution: Registered successfully (%{public}@, %@)";
    id v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 32;
    goto LABEL_6;
  }
}

void sub_100010C38()
{
  id v3 = 0LL;
  if (!qword_100028700)
  {
    __int128 v4 = off_1000211A8;
    uint64_t v5 = 0LL;
    qword_100028700 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_100028700)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *SpaceAttributionLibrary(void)"));
    objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v2,  @"PLPlatformLibraryServicesDelegate.m",  44,  @"%s",  v3);

    __break(1u);
    goto LABEL_7;
  }

  v0 = v3;
  if (v3) {
LABEL_7:
  }
    free(v0);
}

void sub_100010D38(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010DBC;
  v5[3] = &unk_100021088;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlockAndWait:v5];
}

void sub_100010DBC(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] managedObjectContext]);
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:](&OBJC_CLASS___PLGraphLabel, "ensureLabelsAreUpdatedInContext:", v2);

  if ([a1[5] hasChanges])
  {
    id v3 = a1[5];
    id v14 = 0LL;
    unsigned int v4 = [v3 save:&v14];
    id v5 = v14;
    uint64_t Log = PLLibraryServicesGetLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    uint64_t v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[6] logPrefix]);
        *(_DWORD *)buf = 138543362;
        int v16 = v9;
        id v10 = "%{public}@: Saved updated graph labels";
        id v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[6] logPrefix]);
      *(_DWORD *)buf = 138543618;
      int v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      id v10 = "%{public}@: Failed to save updated labels with error: %@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
  }

void sub_100010F30(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLPrivacy sharedInstance](&OBJC_CLASS___PLPrivacy, "sharedInstance"));
  id v2 = [v1 photosAccessAllowedWithScope:7];

  if (v2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"assetsd requires TCCPhotosService access",  0LL));
    objc_exception_throw(v3);
    sub_100010FA0(v4);
  }

void sub_100010FA0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  unsigned int v3 = [v2 updateGreenTeaSavedContactsAuthorizationIfNeeded];

  uint64_t Log = PLLibraryServicesGetLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logPrefix]);
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    uint64_t v8 = v7;
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2112;
    os_log_type_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: greenTeaContactsAuthorization operation contacts authorization change: %@",  (uint8_t *)&v9,  0x16u);
  }
}

void sub_1000110A8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  [v2 addObserver:v3 selector:"currentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  unsigned int v5 = [v4 updateSavedLocaleIfNeeded];

  uint64_t Log = PLLibraryServicesGetLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logPrefix]);
    int v9 = @"NO";
    if (v5) {
      int v9 = @"YES";
    }
    id v10 = v9;
    int v11 = 138543618;
    os_log_type_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: localeChangeCheck operation found locale change: %@",  (uint8_t *)&v11,  0x16u);
  }
}

void sub_100011200(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryServicesManager]);
  [v1 initializeConstraintsDirector];
}

void sub_100011230(id a1)
{
}

uint64_t sub_10001123C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001124C(uint64_t a1)
{
}

void sub_100011254(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unsigned int v5 = *(void **)(v4 + 40);
    id v10 = v3;
    if (v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 arrayByAddingObjectsFromArray:v3]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }

    else
    {
      id v9 = v3;
      uint64_t v8 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v9;
    }

    id v3 = v10;
  }
}

void sub_1000119B0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 libraryURL]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v3) = [v5 fileExistsAtPath:v4];

  if ((_DWORD)v3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
    id v18 = 0LL;
    unsigned __int8 v7 = [v6 ensureFileProviderSyncExclusionAttributeIsSetWithError:&v18];
    id v8 = v18;

    if ((v7 & 1) == 0)
    {
      uint64_t Log = PLMigrationGetLog(v9);
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to set file provider exclusion attribute for path %@: %@",  buf,  0x16u);
      }
    }
  }

  id v12 = +[PLFileUtilities filePathIsSubpathOfSyncRoot:]( &OBJC_CLASS___PLFileUtilities,  "filePathIsSubpathOfSyncRoot:",  v4);
  if ((_DWORD)v12)
  {
    uint64_t v13 = PLMigrationGetLog(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Attempting to open photo library in a sync root is forbidden: %@",  buf,  0xCu);
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v16 setObject:@"Attempting to open photo library in a sync root" forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v16 setObject:v4 forKeyedSubscript:NSFilePathErrorKey];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PLPhotosErrorDomain,  46017LL,  v16));
    [*(id *)(a1 + 32) deactivateWithInvalidationError:v17];
  }
}

void sub_100011BF8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathManager]);
  [v1 setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:32 andBackupType:1];
}

void sub_100011C30(uint64_t a1)
{
}

void sub_100011C4C(uint64_t a1)
{
  id v1 = [[PLDuplicateMergeCrashRecovery alloc] initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 performCrashRecoveryIfNeeded];
}

void sub_100011C90(uint64_t a1)
{
  id v1 = [[PHAssetCrashRecoverySupport alloc] initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 recoverFromCrashIfNeeded];
}

void sub_100011CD4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundJobService]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryBundle]);
  [v3 performCrashRecoveryIfNeededOnBundle:v2];
}

void sub_100011D2C(uint64_t a1)
{
}

void sub_100011D48(id a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[PLLibraryBookmarkManager sharedBookmarkManager]( &OBJC_CLASS___PLLibraryBookmarkManager,  "sharedBookmarkManager"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryURL]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryURL"));
  [v2 removeInvalidSSBsExcept:v1];
}

void sub_100011DA8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) libraryURL]);
  uint64_t v6 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLAssetsdService autoCreateWellKnownPhotoLibraryIfNeededWithURL:wellKnownLibraryIdentifier:]( &OBJC_CLASS___PLAssetsdService,  "autoCreateWellKnownPhotoLibraryIfNeededWithURL:wellKnownLibraryIdentifier:",  v2,  &v6));

  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PLLibraryOpenerCreationOptions);
    id v5 = [v4 initWithWellKnownLibraryIdentifier:v6];
    [*(id *)(a1 + 32) setCreateMode:1 options:v5];
  }
}

char *sub_100011E3C(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) migrationType];
  return result;
}

void sub_100011E74(uint64_t a1)
{
  if ([*(id *)(a1 + 32) migrationType] == (id)1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) libraryURL]);
    unsigned int v3 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sharedStreamsEnabledForPhotoLibraryURL:",  v2);

    if (v3)
    {
      uint64_t Log = PLMigrationGetLog(v4);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Initial sync of shared albums after rebuild",  v7,  2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates](&OBJC_CLASS___PLPhotoSharingHelper, "pollForAlbumListUpdates");
    }
  }

void sub_100012018( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000120FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001210C(uint64_t a1)
{
}

void sub_100012114(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLManagedAsset entityName](&OBJC_CLASS___PLManagedAsset, "entityName"));
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v1));

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != 0.0",  @"latitude"));
  v52[0] = v34;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != 0.0",  @"longitude"));
  v52[1] = v2;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"noindex:(%K) == %d",  @"trashedState",  0LL));
  v52[2] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"noindex:(%K) == NO",  @"hidden"));
  v52[3] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != nil",  @"additionalAttributes.reverseLocationData"));
  void v52[4] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != nil",  @"additionalAttributes.sceneprint"));
  v52[5] = v6;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K >= 0",  @"additionalAttributes.gpsHorizontalAccuracy"));
  v52[6] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K < %f",  @"additionalAttributes.gpsHorizontalAccuracy",  kPLLocationUtilsCoarseLocationHorizontalAccuracy));
  v52[7] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"additionalAttributes.importedBy",  &off_100021D38));
  v52[8] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 9LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));
  [v36 setPredicate:v11];

  [v36 setRelationshipKeyPathsForPrefetching:&off_100021D50];
  uint64_t v47 = 0LL;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10001274C;
  v43[3] = &unk_100021278;
  int v15 = v12;
  id v44 = v15;
  __int128 v46 = &v47;
  id v16 = v14;
  id v45 = v16;
  id v17 = [v16 enumerateObjectsFromFetchRequest:v36 usingDefaultBatchSizeWithBlock:v43];
  if (*((_BYTE *)v48 + 24))
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "randomIndexForSampleSize:", -[NSMutableArray count](v15, "count")));
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000127E8;
    v39[3] = &unk_1000212A0;
    __int128 v40 = v15;
    __int16 v21 = v20;
    id v41 = v21;
    [v19 enumerateIndexesUsingBlock:v39];
    if (-[NSMutableArray count](v21, "count"))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PLManagedAsset entityName](&OBJC_CLASS___PLManagedAsset, "entityName"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v22));

      [v23 setResultType:2];
      id v51 = @"uuid";
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
      [v23 setPropertiesToFetch:v24];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self IN %@",  v21));
      [v23 setPredicate:v25];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100012830;
      v37[3] = &unk_1000212C8;
      __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v38 = v26;
      id v27 = [v16 enumerateObjectsFromFetchRequest:v23 count:0 batchSize:10 usingBlock:v37];
      uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v26;
      __int128 v30 = v26;
    }
  }

  else
  {
    uint64_t Log = PLBackendGetLog(v17, v18);
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Crowd Sourced Themes Stream Collection: User does not have a home node.",  buf,  2u);
    }

    uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int16 v19 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = &__NSArray0__struct;
  }

  _Block_object_dispose(&v47, 8);
}

void sub_100012714( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_10001274C(uint64_t a1, void *a2)
{
  id v8 = a2;
  unsigned __int8 v3 = [v8 isLocatedAtHome];
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectID]);
    [v4 addObject:v5];
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(_BYTE *)(v6 + 24)) {
    char v7 = 1;
  }
  else {
    char v7 = v3;
  }
  *(_BYTE *)(v6 + 24) = v7;
  objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v8, objc_msgSend(v8, "hasChanges"));
}

void sub_1000127E8(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndex:a2]);
  [*(id *)(a1 + 40) addObject:v3];
}

void sub_100012830(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"uuid"]);
  [v2 addObject:v3];
}

id objc_msgSend__enqueueSocialGroupAssetContainmentOperationWithLSM_library_serverTransaction_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enqueueSocialGroupAssetContainmentOperationWithLSM:library:serverTransaction:");
}

id objc_msgSend__enqueueSocialGroupDeduplicationOperationWithLSM_library_serverTransaction_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enqueueSocialGroupDeduplicationOperationWithLSM:library:serverTransaction:");
}

id objc_msgSend_applyAssetScopeCorrectionsWithRequest_errorCodes_clientBundleID_library_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyAssetScopeCorrectionsWithRequest:errorCodes:clientBundleID:library:reply:");
}

id objc_msgSend_applyResourceScopeCorrectionsWithRequest_errorCodes_clientBundleID_library_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyResourceScopeCorrectionsWithRequest:errorCodes:clientBundleID:library:reply:");
}

id objc_msgSend_autoCreateWellKnownPhotoLibraryIfNeededWithURL_wellKnownLibraryIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoCreateWellKnownPhotoLibraryIfNeededWithURL:wellKnownLibraryIdentifier:");
}

id objc_msgSend_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configureEnumeratorForHyperionLocalResourcesLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:");
}

id objc_msgSend_configureEnumeratorForLibrarySizeLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureEnumeratorForLibrarySizeLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:");
}

id objc_msgSend_configureEnumeratorForLibrarySummaryForLibraryEnumerator_withSyndicationLibraryEnumerator_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configureEnumeratorForLibrarySummaryForLibraryEnumerator:withSyndicationLibraryEnumerator:cloudPhotoLibraryEn abled:dataForCA:libraryServicesManager:");
}

id objc_msgSend_deleteHistoryBeforeDate_whenHistoryPercentageOfStoreIsGreaterThan_withContext_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:withContext:error:");
}

id objc_msgSend_fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary_forceNotification_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:forceNotification:");
}

id objc_msgSend_migrateBackgroundActionsWithPhotoLibraryBundle_logger_error_continuationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateBackgroundActionsWithPhotoLibraryBundle:logger:error:continuationHandler:");
}

id objc_msgSend_migrateOrCreateDatabaseIfNecessaryWithPersistentContainer_migrationPolicy_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateOrCreateDatabaseIfNecessaryWithPersistentContainer:migrationPolicy:error:");
}

id objc_msgSend_setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions_andBackupType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:andBackupType:");
}

id objc_msgSend_verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext_countPresent_countMissing_countUnableToVerify_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:countPresent:countMissing:c ountUnableToVerify:error:");
}

id objc_msgSend_writeModelMigrationRestorePostProcessingCompleteToken(void *a1, const char *a2, ...)
{
  return [a1 writeModelMigrationRestorePostProcessingCompleteToken];
}