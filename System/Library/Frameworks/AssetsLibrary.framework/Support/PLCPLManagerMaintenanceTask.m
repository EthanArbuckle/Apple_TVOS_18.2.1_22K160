@interface PLCPLManagerMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (void)_reportLibraryStatsWithCPLManager:(id)a3;
- (void)_reportPhotoStateWithCPLManager:(id)a3;
@end

@implementation PLCPLManagerMaintenanceTask

- (void)_reportLibraryStatsWithCPLManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t Log = PLBackendGetLog(v6, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Library statistics logging: starting asset enumeration...",  buf,  2u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___PLLibraryContentsEnumerator);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 managedObjectContext]);
  id v13 = [v10 initWithSourceManagedObjectContext:v12 concurrent:0];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  id v15 = [v14 isCloudPhotoLibraryEnabled];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  +[PLAggdLogging configureEnumeratorForLibrarySizeLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:]( &OBJC_CLASS___PLAggdLogging,  "configureEnumeratorForLibrarySizeLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:",  v13,  v15,  v5,  v6);
  +[PLAggdLogging configureEnumeratorForHyperionLocalResourcesLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:]( &OBJC_CLASS___PLAggdLogging,  "configureEnumeratorForHyperionLocalResourcesLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:",  v13,  v15,  v5,  v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  +[PLAggdLogging configureEnumeratorForLibrarySummaryForLibraryEnumerator:withSyndicationLibraryEnumerator:cloudPhotoLibraryEnabled:dataForCA:libraryServicesManager:]( &OBJC_CLASS___PLAggdLogging,  "configureEnumeratorForLibrarySummaryForLibraryEnumerator:withSyndicationLibraryEnumerator:cloudPhotoLibraryEnabled:d ataForCA:libraryServicesManager:",  v13,  0LL,  v15,  v5,  v17);

  *(void *)buf = 0LL;
  v50 = buf;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_100009C5C;
  v53 = sub_100009C6C;
  id v54 = 0LL;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PLConcurrencyLimiter sharedLimiter](&OBJC_CLASS___PLConcurrencyLimiter, "sharedLimiter"));
  v37 = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472LL;
  v39 = sub_100009CC8;
  v40 = &unk_100020D68;
  v43 = &v45;
  id v19 = v13;
  v44 = buf;
  id v41 = v19;
  id v42 = 0LL;
  [v18 sync:&v37 identifyingBlock:0 library:0];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v37, v38, v39, v40));
  [v20 timeIntervalSinceDate:v16];
  v22 = (NSMutableDictionary *)v21;

  if (*((_BYTE *)v46 + 24))
  {
    uint64_t v25 = PLSendCoreAnalyticEvent(PLCoreAnalyticsLibrarySummaryEvent, v5);
    uint64_t v27 = PLBackendGetLog(v25, v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 134217984;
      v56 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Library statistics logging: finished in %g secs.",  v55,  0xCu);
    }

    uint64_t v31 = PLBackendGetLog(v29, v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Reporting device data: %@", v55, 0xCu);
    }

    [v4 reportMiscInformation:v6];
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v33 setObject:v34 forKey:@"PLDeviceDataFeedbackDate"];
  }

  else
  {
    uint64_t v35 = PLBackendGetLog(v23, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      v36 = (NSMutableDictionary *)*((void *)v50 + 5);
      *(_DWORD *)v55 = 138412290;
      v56 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_ERROR,  "Failed to enumerate assets library statistics logging: %@",  v55,  0xCu);
    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_reportPhotoStateWithCPLManager:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", @"YES", CPLMiscInformationAppendCPLReport);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PLAccountStore pl_sharedAccountStore](&OBJC_CLASS___PLAccountStore, "pl_sharedAccountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cachedPrimaryAppleAccount]);

  else {
    uint64_t v7 = @"NO";
  }
  id v8 = -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"SharedStreamsEnabled");
  uint64_t Log = PLBackendGetLog(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Reporting photo state: %@", (uint8_t *)&v12, 0xCu);
  }

  [v3 reportMiscInformation:v4];
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_100009C5C;
  v39 = sub_100009C6C;
  id v40 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  unsigned int v6 = [v5 isSystemPhotoLibrary];

  if (v6)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100009C74;
    v34[3] = &unk_1000212F0;
    v34[4] = self;
    v34[5] = &v35;
    dispatch_sync(&_dispatch_main_q, v34);
  }

  id v7 = [(id)v36[5] startAssetRecoveryWithTransaction:v4];
  if (v36[5])
  {
    uint64_t v9 = PLReportiCPLState(v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v10 count];
    if (v11)
    {
      uint64_t Log = PLBackendGetLog(v11, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Reporting iCPL state %@", buf, 0xCu);
      }

      PLFinishReportiCPLState([(id)v36[5] reportMiscInformation:v10]);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    unsigned int v16 = [v15 isCloudPhotoLibraryEnabled];

    if (v16)
    {
      uint64_t v19 = PLBackendGetLog(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "starting automatic prefetching/pruning during periodic maintenance",  buf,  2u);
      }

      [(id)v36[5] startAutomaticPrefetchOrPrune];
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"PLDeviceDataFeedbackDate"]);

    if (!v22 || (id v23 = [v22 timeIntervalSinceNow], fabs(v25) > 604800.0))
    {
      uint64_t v26 = PLBackendGetLog(v23, v24);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "starting library stats reporting during periodic maintenance",  buf,  2u);
      }

      id v28 = -[PLCPLManagerMaintenanceTask _reportLibraryStatsWithCPLManager:]( self,  "_reportLibraryStatsWithCPLManager:",  v36[5]);
      uint64_t v30 = PLBackendGetLog(v28, v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "starting photo state reporting during periodic maintenance",  buf,  2u);
      }

      -[PLCPLManagerMaintenanceTask _reportPhotoStateWithCPLManager:](self, "_reportPhotoStateWithCPLManager:", v36[5]);
    }
  }

  else
  {
    if (!v6) {
      goto LABEL_21;
    }
    uint64_t v33 = PLBackendGetLog(v7, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "No cplManager to perform periodic maintenance job",  buf,  2u);
    }
  }

LABEL_21:
  _Block_object_dispose(&v35, 8);

  return 1;
}

@end