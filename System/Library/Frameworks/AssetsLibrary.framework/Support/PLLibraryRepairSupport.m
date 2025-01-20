@interface PLLibraryRepairSupport
- (BOOL)_deferActivityIfRequiredForClassName:(id)a3;
- (BOOL)_isValidProcessingURL:(id)a3 interruptedPaths:(id)a4;
- (BOOL)_runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:(id)a3;
- (BOOL)_updateDeferredCriticalMaintenanceTaskMarker:(id)a3;
- (BOOL)_updateDeferredMaintenanceTaskMarker:(id)a3 value:(id)a4;
- (BOOL)_updateMaintenanceTaskMarker:(id)a3 key:(id)a4 value:(id)a5;
- (BOOL)shouldRunLocationOfInterestUpdateTaskWithGlobalValues:(id)a3;
- (PLLibraryRepairSupport)initWithActivity:(id)a3 description:(id)a4;
- (PLPhotoLibraryBundle)bundle;
- (id)_buildIncompleteMaintenanceTaskPathsKey;
- (id)_interruptedProcessingURLs;
- (id)_registeredCriticalMaintenaceTaskClasses;
- (id)_registeredMaintenanceTaskClasses;
- (unint64_t)_indexOfRegisteredMaintenanceTaskForMarker:(id)a3;
- (void)_maintainLibrary:(id)a3 executionBlock:(id)a4;
- (void)_saveInterruptedProcessingURLs:(id)a3;
- (void)runCuratedLibraryPeriodicMaintenanceTasks;
- (void)runPeriodicMaintenance;
- (void)runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:(id)a3;
- (void)setBundle:(id)a3;
@end

@implementation PLLibraryRepairSupport

- (PLLibraryRepairSupport)initWithActivity:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PLLibraryRepairSupport;
  v9 = -[PLLibraryRepairSupport init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcActivity, a3);
    objc_storeStrong((id *)&v10->_description, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PLXPCTransaction transaction:]( &OBJC_CLASS___PLXPCTransaction,  "transaction:",  -[NSString UTF8String](v10->_description, "UTF8String")));
    transaction = v10->_transaction;
    v10->_transaction = (PLXPCTransaction *)v11;
  }

  return v10;
}

- (id)_registeredCriticalMaintenaceTaskClasses
{
  v5[0] = objc_opt_class(&OBJC_CLASS___PLExpiredCleanupMaintenanceTask, a2);
  v5[1] = objc_opt_class(&OBJC_CLASS___PLCPLManagerMaintenanceTask, v2);
  v5[2] = objc_opt_class(&OBJC_CLASS___PLOutboundSharingFilesCleanupMaintenanceTask, v3);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v5,  3LL));
}

- (id)_registeredMaintenanceTaskClasses
{
  v30[0] = objc_opt_class(&OBJC_CLASS___PLMomentGenerationMaintenanceTask, a2);
  v30[1] = objc_opt_class(&OBJC_CLASS___PLCleanupDeferredMediaMaintenanceTask, v3);
  v30[2] = objc_opt_class(&OBJC_CLASS___PLVariationCacheEvictionMaintenanceTask, v4);
  v30[3] = objc_opt_class(&OBJC_CLASS___PLCacheUpdatesMaintenanceTask, v5);
  v30[4] = objc_opt_class(&OBJC_CLASS___PLDeletePersistentHistoryMaintenanceTask, v6);
  v30[5] = objc_opt_class(&OBJC_CLASS___PLCacheDeleteCleanupMaintenanceTask, v7);
  v30[6] = objc_opt_class(&OBJC_CLASS___PLCrashRecoveryMaintenanceTask, v8);
  v30[7] = objc_opt_class(&OBJC_CLASS___PLCleanupOrphanedProjectPreviewsMaintenanceTask, v9);
  v30[8] = objc_opt_class(&OBJC_CLASS___PLDuplicatePersonUUIDMaintenanceTask, v10);
  v30[9] = objc_opt_class(&OBJC_CLASS___PLCleanupPersonFaceDataMaintenanceTask, v11);
  v30[10] = objc_opt_class(&OBJC_CLASS___PLSharedCleanupMaintenanceTask, v12);
  v30[11] = objc_opt_class(&OBJC_CLASS___PLAnalysisStateCleanupMaintenanceTask, v13);
  v30[12] = objc_opt_class(&OBJC_CLASS___PLCSTDataCollectionMaintenanceTask, v14);
  v30[13] = objc_opt_class(&OBJC_CLASS___PLExcessiveDatabaseSizeMaintenanceTask, v15);
  v30[14] = objc_opt_class(&OBJC_CLASS___PLPartialVideoCacheCleanUpMaintenanceTask, v16);
  v30[15] = objc_opt_class(&OBJC_CLASS___PLSearchInitialSuggestionsMaintenanceTask, v17);
  v30[16] = objc_opt_class(&OBJC_CLASS___PLReportSystemWorkloadMaintenanceTask, v18);
  v30[17] = objc_opt_class(&OBJC_CLASS___PLReportSearchIndexStatusMaintenanceTask, v19);
  v30[18] = objc_opt_class(&OBJC_CLASS___PLSearchRemoveUnusedGroupsMaintenanceTask, v20);
  v30[19] = objc_opt_class(&OBJC_CLASS___PLJournalMaintenanceTask, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 20LL));
  id v23 = [v22 mutableCopy];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 libraryServicesManager]);
  unsigned __int8 v26 = [v25 isSyndicationPhotoLibrary];

  if ((v26 & 1) == 0) {
    objc_msgSend(v23, "addObject:", objc_opt_class(PLRebuildMissingThumbsMaintenanceTask, v27));
  }
  id v28 = [v23 copy];

  return v28;
}

- (unint64_t)_indexOfRegisteredMaintenanceTaskForMarker:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PLLibraryRepairSupport _registeredMaintenanceTaskClasses]( self,  "_registeredMaintenanceTaskClasses"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100005F28;
    v9[3] = &unk_100020BF0;
    id v10 = v4;
    id v6 = [v5 indexOfObjectPassingTest:v9];

    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v7 = 0LL;
    }
    else {
      unint64_t v7 = (unint64_t)v6;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)_deferActivityIfRequiredForClassName:(id)a3
{
  id v4 = a3;
  if (xpc_activity_should_defer(self->_xpcActivity))
  {
    BOOL v5 = xpc_activity_set_state(self->_xpcActivity, 3LL);
    uint64_t Log = PLBackendGetLog(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Defer processing of maintenance task: %{public}@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
    unsigned int v10 = [v9 isShuttingDown];

    if (!v10)
    {
      BOOL v16 = 0;
      goto LABEL_9;
    }

    BOOL v11 = xpc_activity_set_state(self->_xpcActivity, 3LL);
    uint64_t v13 = PLBackendGetLog(v11, v12);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 shutdownReason]);
      int v18 = 138543362;
      id v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Maintenance task early termination due to library shutdown. Reason: %{public}@",  (uint8_t *)&v18,  0xCu);
    }
  }

  BOOL v16 = 1;
LABEL_9:

  return v16;
}

- (BOOL)_runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"PLDeferredCriticalMaintenanceTask"]);
  uint64_t v6 = v5;
  if (v5 && ([v5 timeIntervalSinceNow], fabs(v7) < 86400.0))
  {
    BOOL v8 = 0;
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PLLibraryRepairSupport _registeredCriticalMaintenaceTaskClasses]( self,  "_registeredCriticalMaintenaceTaskClasses"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100005D00;
    v11[3] = &unk_100020C18;
    v11[4] = self;
    v11[5] = &v12;
    [v9 enumerateObjectsUsingBlock:v11];

    if (*((_BYTE *)v13 + 24))
    {
      BOOL v8 = 1;
    }

    else
    {
      -[PLLibraryRepairSupport _updateDeferredCriticalMaintenanceTaskMarker:]( self,  "_updateDeferredCriticalMaintenanceTaskMarker:",  v4);
      BOOL v8 = *((_BYTE *)v13 + 24) != 0;
    }

    _Block_object_dispose(&v12, 8);
  }

  return v8;
}

- (BOOL)shouldRunLocationOfInterestUpdateTaskWithGlobalValues:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 locationOfInterestUpdateDate]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    BOOL v7 = v6 > 604800.0;
    uint64_t Log = PLMomentsGetLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = @"NO";
      if (v6 > 604800.0) {
        unsigned int v10 = @"YES";
      }
      BOOL v11 = v10;
      int v14 = 138543618;
      char v15 = v11;
      __int16 v16 = 2048;
      double v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "shouldRunLocationOfInterestUpdateTask: %{public}@, time since last run: %.0f",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    uint64_t v12 = PLMomentsGetLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "shouldRunLocationOfInterestUpdateTask: YES, lastRunDate is nil",  (uint8_t *)&v14,  2u);
    }

    BOOL v7 = 1;
  }

  return v7;
}

- (void)runCuratedLibraryPeriodicMaintenanceTasks
{
  uint64_t Log = PLBackendGetLog(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "running curated library periodic maintenance tasks...",  v14,  2u);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryServicesManager]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 momentGenerationDataManager]);
  id v8 = objc_alloc(&OBJC_CLASS___PLGlobalValues);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);
  id v10 = [v8 initWithManagedObjectContext:v9];

  unsigned int v11 = -[PLLibraryRepairSupport shouldRunLocationOfInterestUpdateTaskWithGlobalValues:]( self,  "shouldRunLocationOfInterestUpdateTaskWithGlobalValues:",  v10);
  if (v11) {
    uint64_t v12 = 45LL;
  }
  else {
    uint64_t v12 = 13LL;
  }
  [v7 runPeriodicMaintenanceTasks:v12 withTransaction:self->_transaction];
  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 setLocationOfInterestUpdateDate:v13];
  }
}

- (void)runPeriodicMaintenance
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 libraryServicesManager]);
  id v5 = [v4 wellKnownPhotoLibraryIdentifier];

  uint64_t Log = PLBackendGetLog(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v43 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "running periodic maintenance tasks [library identifier: %ld]...",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport _registeredMaintenanceTaskClasses](self, "_registeredMaintenanceTaskClasses"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 libraryURL]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PLAppPrivateData appPrivateDataForLibraryURL:]( &OBJC_CLASS___PLAppPrivateData,  "appPrivateDataForLibraryURL:",  v12));

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKey:@"PLDeferredMaintenanceTask"]);
  v41 = v13;
  unsigned __int8 v15 = -[PLLibraryRepairSupport _runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:]( self,  "_runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:",  v13);
  unint64_t v16 = -[PLLibraryRepairSupport _indexOfRegisteredMaintenanceTaskForMarker:]( self,  "_indexOfRegisteredMaintenanceTaskForMarker:",  v14);
  char v17 = 0;
  v40 = v14;
  while (1)
  {
    int v18 = objc_autoreleasePoolPush();
    id v19 = objc_alloc((Class)[v10 objectAtIndexedSubscript:v16]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
    id v21 = [v19 initWithLibraryBundle:v20];

    id v23 = (objc_class *)objc_opt_class(v21, v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    unsigned __int8 v15 = -[PLLibraryRepairSupport _updateDeferredMaintenanceTaskMarker:value:]( self,  "_updateDeferredMaintenanceTaskMarker:value:",  v41,  v25);
    if ((v15 & 1) == 0) {
      break;
    }
    BOOL v26 = -[PLLibraryRepairSupport _deferActivityIfRequiredForClassName:]( self,  "_deferActivityIfRequiredForClassName:",  v25);
    if (v26) {
      goto LABEL_19;
    }
    uint64_t v28 = PLBackendGetLog(v26, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Starting maintenance task %{public}@",  buf,  0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[PLTimedPerfCheck start](&OBJC_CLASS___PLTimedPerfCheck, "start"));
    unsigned int v31 = [v21 runTaskWithTransaction:self->_transaction];
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 perfCheckLogStringWithPerfCheckInfo:0]);
    uint64_t v34 = PLBackendGetLog(v32, v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if (v31)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v43 = v25;
        __int16 v44 = 2114;
        v45 = v32;
        v37 = v36;
        os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
        v39 = "Completed maintenance task %{public}@%{public}@";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v37, v38, v39, buf, 0x16u);
      }
    }

    else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v25;
      __int16 v44 = 2114;
      v45 = v32;
      v37 = v36;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      v39 = "Failed maintenance task %{public}@%{public}@";
      goto LABEL_15;
    }

    objc_autoreleasePoolPop(v18);
    if (++v16 >= (unint64_t)[v10 count])
    {
      char v17 = 0;
      unsigned __int8 v15 = 0;
      int v14 = v40;
      goto LABEL_20;
    }
  }

  v41 = 0LL;
LABEL_19:
  int v14 = v40;
  char v17 = v15 ^ 1;

  objc_autoreleasePoolPop(v18);
LABEL_20:
  if ((v17 & 1) == 0 && (v15 & 1) == 0) {
    -[PLLibraryRepairSupport _updateDeferredMaintenanceTaskMarker:value:]( self,  "_updateDeferredMaintenanceTaskMarker:value:",  v41,  0LL);
  }
  -[PLXPCTransaction stillAlive](self->_transaction, "stillAlive");
}

- (id)_buildIncompleteMaintenanceTaskPathsKey
{
  uint64_t v2 = (void *)xpc_activity_copy_identifier(self->_xpcActivity, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
  free(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"."]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([@"PLIncompleteMaintenanceTaskPaths" stringByAppendingPathExtension:v5]);

  return v6;
}

- (void)_saveInterruptedProcessingURLs:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 mutableArrayValueForKeyPath:@"self.path"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PLLibraryRepairSupport _buildIncompleteMaintenanceTaskPathsKey]( self,  "_buildIncompleteMaintenanceTaskPathsKey"));
  [v4 setObject:v6 forKey:v5];
}

- (id)_interruptedProcessingURLs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PLLibraryRepairSupport _buildIncompleteMaintenanceTaskPathsKey]( self,  "_buildIncompleteMaintenanceTaskPathsKey"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayForKey:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return v6;
}

- (BOOL)_isValidProcessingURL:(id)a3 interruptedPaths:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    unsigned __int8 v8 = [v6 containsObject:v7];
  }

  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)_updateMaintenanceTaskMarker:(id)a3 key:(id)a4 value:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v16 = 0LL;
  unsigned __int8 v9 = [a3 setValue:v8 forKeyPath:v7 error:&v16];
  id v10 = v16;
  uint64_t v12 = v10;
  if ((v9 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog(v10, v11);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error updating %{public}@ with value %{public}@. Error: %@",  buf,  0x20u);
    }
  }

  return v9;
}

- (BOOL)_updateDeferredMaintenanceTaskMarker:(id)a3 value:(id)a4
{
  return -[PLLibraryRepairSupport _updateMaintenanceTaskMarker:key:value:]( self,  "_updateMaintenanceTaskMarker:key:value:",  a3,  @"PLDeferredMaintenanceTask",  a4);
}

- (BOOL)_updateDeferredCriticalMaintenanceTaskMarker:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(self) = -[PLLibraryRepairSupport _updateMaintenanceTaskMarker:key:value:]( self,  "_updateMaintenanceTaskMarker:key:value:",  v4,  @"PLDeferredCriticalMaintenanceTask",  v5);

  return (char)self;
}

- (void)_maintainLibrary:(id)a3 executionBlock:(id)a4
{
  id v6 = a3;
  v40 = (void (**)(id, PLLibraryRepairSupport *))a4;
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithArray:",  v6));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v44;
  while (2)
  {
    uint64_t v12 = 0LL;
    do
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v12);
      BOOL should_defer = xpc_activity_should_defer(self->_xpcActivity);
      BOOL v15 = should_defer;
      uint64_t Log = PLBackendGetLog(should_defer, v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      __int16 v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v48 = (unint64_t)v7;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Defer maintenance tasks operations on libraries: %@",  buf,  0xCu);
        }

        xpc_activity_set_state(self->_xpcActivity, 3LL);
        goto LABEL_27;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v48 = (unint64_t)v13;
        __int16 v49 = 2112;
        v50 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Maintain library at URL: %@, remaining URLs: %@",  buf,  0x16u);
      }

      id v42 = 0LL;
      unint64_t v20 = +[PLLibraryRepairSupportRegistration checkLibraryIsReadyForProcessing:libraryBundle:]( &OBJC_CLASS___PLLibraryRepairSupportRegistration,  "checkLibraryIsReadyForProcessing:libraryBundle:",  v13,  &v42);
      id v41 = v42;
      id v21 = -[PLLibraryRepairSupport setBundle:](self, "setBundle:");
      uint64_t v23 = PLBackendGetLog(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v48 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Maintain library: readyForMaintenance:%td",  buf,  0xCu);
      }

      if (v20 <= 6)
      {
        if (((1LL << v20) & 0x3B) != 0)
        {
          -[NSString removeObject:](v7, "removeObject:", v13);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSString array](v7, "array"));
          -[PLLibraryRepairSupport _saveInterruptedProcessingURLs:](self, "_saveInterruptedProcessingURLs:", v27);

LABEL_14:
          uint64_t v28 = PLBackendGetLog(v25, v26);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = v7;
            id v31 = v10;
            uint64_t v32 = v11;
            id v33 = v8;
            description = self->_description;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport bundle](self, "bundle"));
            *(_DWORD *)buf = 134218498;
            unint64_t v48 = v20;
            __int16 v49 = 2114;
            v50 = description;
            id v8 = v33;
            uint64_t v11 = v32;
            id v10 = v31;
            id v7 = v30;
            __int16 v51 = 2112;
            v52 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Error (%ld) activating library for maintenance tasks [%{public}@] for library bundle %@",  buf,  0x20u);
          }

- (void)runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:(id)a3
{
  id v42 = a3;
  uint64_t Log = PLBackendGetLog(v42, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 138543362;
    v63 = description;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Maintenance task: processing all libraries for %{public}@",  buf,  0xCu);
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryBookmarkManager sharedBookmarkManager]( &OBJC_CLASS___PLLibraryBookmarkManager,  "sharedBookmarkManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v41 allKnownLibraryURLs]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "wellKnownPhotoLibraryURLForIdentifier:",  1LL));
  v61 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v61, 1LL));

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        char v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)i) path]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PLFileUtilities realPathForPath:error:]( &OBJC_CLASS___PLFileUtilities,  "realPathForPath:error:",  v17,  0LL));

        if (v18) {
          -[NSMutableSet addObject:](v11, "addObject:", v18);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }

    while (v14);
  }

  __int16 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PLLibraryRepairSupport _interruptedProcessingURLs](self, "_interruptedProcessingURLs"));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v21 = v12;
  uint64_t v22 = v19;
  id obj = v21;
  id v23 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v51;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)j);
        if (-[PLLibraryRepairSupport _isValidProcessingURL:interruptedPaths:]( self,  "_isValidProcessingURL:interruptedPaths:",  v27,  v20))
        {
          -[NSMutableArray addObject:](v22, "addObject:", v27);
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }

    while (v24);
  }

  __int128 v43 = v22;
  __int128 v44 = v11;

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v28 = v8;
  id v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v47;
    do
    {
      for (k = 0LL; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)k);
        if (-[PLLibraryRepairSupport _isValidProcessingURL:interruptedPaths:]( self,  "_isValidProcessingURL:interruptedPaths:",  v33,  v20))
        {
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 path]);
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[PLFileUtilities realPathForPath:error:]( &OBJC_CLASS___PLFileUtilities,  "realPathForPath:error:",  v34,  0LL));
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }

    while (v30);
  }

  id v36 = -[PLLibraryRepairSupport _saveInterruptedProcessingURLs:](self, "_saveInterruptedProcessingURLs:", v43);
  uint64_t v38 = PLBackendGetLog(v36, v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (NSString *)-[NSMutableArray count](v43, "count");
    *(_DWORD *)buf = 134217984;
    v63 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Maintenance task: processing %td libraries",  buf,  0xCu);
  }

  -[PLLibraryRepairSupport _maintainLibrary:executionBlock:](self, "_maintainLibrary:executionBlock:", v43, v42);
}

- (PLPhotoLibraryBundle)bundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end