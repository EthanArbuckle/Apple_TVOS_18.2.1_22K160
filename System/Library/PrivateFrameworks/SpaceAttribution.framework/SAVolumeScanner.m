@interface SAVolumeScanner
+ (BOOL)shouldForceTelemetry;
+ (void)disableAppSizerResultsFiltering;
+ (void)setAppSizerResultsFilteringToDefault;
+ (void)setForceTelemetry;
- (BOOL)appSizerInProgress;
- (BOOL)extendedDirStatsEnabled;
- (BOOL)fullVolumeScanFromPath:(id)a3 withPathList:(id)a4 error:(id *)a5;
- (BOOL)isSoftwareUpdateInProgressTvOS;
- (BOOL)isSoftwareUpdateInProgressWatchOS;
- (BOOL)isSoftwareUpdateInProgressiOS;
- (BOOL)knownApp;
- (NSDate)startTime;
- (NSFileManager)fileManager;
- (NSMutableDictionary)dirKeyCacheList;
- (NSMutableDictionary)tagMap;
- (NSSet)knownAppName;
- (OS_dispatch_queue)rerunQue;
- (SAAppPathList)appPathList;
- (SAAppSizerResults)appSizerResults;
- (SAPathList)pathList;
- (SAPurgeableRecords)purgeableRecords;
- (SATelemetryManager)telemetryManager;
- (SAVolumeScanner)init;
- (unint64_t)addSoftwareUpdateBundle;
- (unint64_t)analyzeDirEntry:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)analyzeDirExit:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)analyzeFile:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)childrenInsideKnown;
- (unint64_t)dataVolumeSizeUsed;
- (unint64_t)getSUVolumeUsedSpace;
- (unint64_t)knownAppByteCount;
- (unint64_t)othersByteCount;
- (unint64_t)scanOptions;
- (unint64_t)softwareUpdateVolumeUsedSpace;
- (unint64_t)systemVolumeUsedSpace;
- (unint64_t)totalHiddenAppSize;
- (unint64_t)totalPurgeableDataSize;
- (unint64_t)totalVisibleAppSize;
- (unsigned)runAppSizerWithAsyncBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 withScanOptions:(unint64_t)a6 error:(id *)a7;
- (void)calculateDiskUsedAndCapacity;
- (void)calculateSystemDataSize;
- (void)checkForSizesOverflow;
- (void)processPurgeableAttributionTags;
- (void)scanURLs:(id)a3 withSizer:(id)a4;
- (void)setAppPathList:(id)a3;
- (void)setAppSizerInProgress:(BOOL)a3;
- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3;
- (void)setAppSizerResults:(id)a3;
- (void)setChildrenInsideKnown:(unint64_t)a3;
- (void)setDataVolumeSizeUsed:(unint64_t)a3;
- (void)setDirKeyCacheList:(id)a3;
- (void)setExtendedDirStatsEnabled:(BOOL)a3;
- (void)setFileManager:(id)a3;
- (void)setKnownApp:(BOOL)a3;
- (void)setKnownAppByteCount:(unint64_t)a3;
- (void)setKnownAppName:(id)a3;
- (void)setOthersByteCount:(unint64_t)a3;
- (void)setPathList:(id)a3;
- (void)setPurgeableRecords:(id)a3;
- (void)setRerunQue:(id)a3;
- (void)setScanOptions:(unint64_t)a3;
- (void)setSoftwareUpdateVolumeUsedSpace:(unint64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setSystemVolumeUsedSpace:(unint64_t)a3;
- (void)setTagMap:(id)a3;
- (void)setTelemetryManager:(id)a3;
- (void)setTotalHiddenAppSize:(unint64_t)a3;
- (void)setTotalPurgeableDataSize:(unint64_t)a3;
- (void)setTotalVisibleAppSize:(unint64_t)a3;
- (void)updateAppSizerResultsWithSUPurgeableUrgencySizes;
@end

@implementation SAVolumeScanner

- (SAVolumeScanner)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SAVolumeScanner;
  v2 = -[SAVolumeScanner init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_scanOptions = 0LL;
    v2->_knownApp = 0;
    v2->_othersByteCount = 0LL;
    v2->_knownAppByteCount = 0LL;
    knownAppName = v2->_knownAppName;
    v2->_childrenInsideKnown = 0LL;
    v2->_knownAppName = 0LL;

    v5 = objc_opt_new(&OBJC_CLASS___NSFileManager);
    fileManager = v3->_fileManager;
    v3->_fileManager = v5;

    v3->_appSizerInProgress = 0;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(global_queue);
    rerunQue = v3->_rerunQue;
    v3->_rerunQue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    startTime = v3->_startTime;
    v3->_startTime = (NSDate *)v10;

    v3->_extendedDirStatsEnabled = 0;
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    tagMap = v3->_tagMap;
    v3->_tagMap = v12;

    *(_OWORD *)&v3->_softwareUpdateVolumeUsedSpace = 0u;
    *(_OWORD *)&v3->_totalPurgeableDataSize = 0u;
    *(_OWORD *)&v3->_totalVisibleAppSize = 0u;
  }

  return v3;
}

- (void)scanURLs:(id)a3 withSizer:(id)a4
{
  id v5 = a3;
  id v43 = a4;
  v6 = objc_opt_new(&OBJC_CLASS___SAURLSizerResults);
  v46 = objc_opt_new(&OBJC_CLASS___SATraverse);
  uint64_t v7 = SALog(v46);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100031AD8(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v5;
  id v16 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v16)
  {
    id v17 = v16;
    id v18 = 0LL;
    uint64_t v19 = *(void *)v48;
    do
    {
      v20 = 0LL;
      v21 = v18;
      do
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v20);
        v23 = objc_autoreleasePoolPush();
        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATraverse getItemSizeAtPath:](v46, "getItemSizeAtPath:", v24));

        id v18 = +[SAURLSize newWithSize:mayBePartOfCloneChain:]( SAURLSize,  "newWithSize:mayBePartOfCloneChain:",  [v25 dataSize],  (uint64_t)objc_msgSend(v25, "cloneSize") > 0);
        id v26 = -[SAURLSizerResults addURL:withSizeInfo:](v6, "addURL:withSizeInfo:", v22, v18);
        if ((self->_scanOptions & 2) != 0) {
          id v26 = [v43 callHandlerWithResults:v6 error:0];
        }
        uint64_t v27 = SALog(v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
          id v42 = [v25 dataSize];
          id v30 = [v25 cloneSize];
          id v31 = [v25 purgeableSize];
          *(_DWORD *)buf = 136316162;
          v52 = "-[SAVolumeScanner scanURLs:withSizer:]";
          __int16 v53 = 2112;
          v54 = v29;
          __int16 v55 = 2048;
          id v56 = v42;
          __int16 v57 = 2048;
          id v58 = v30;
          __int16 v59 = 2048;
          id v60 = v31;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%s path %@, data %llu, clone %llu, purge %llu",  buf,  0x34u);
        }

        objc_autoreleasePoolPop(v23);
        v20 = (char *)v20 + 1;
        v21 = v18;
      }

      while (v17 != v20);
      id v17 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }

    while (v17);
  }

  if ((self->_scanOptions & 1) != 0) {
    id v32 = [v43 callHandlerWithResults:v6 error:0];
  }
  uint64_t v33 = SALog(v32);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_100031A68(v34, v35, v36, v37, v38, v39, v40, v41);
  }
}

- (BOOL)fullVolumeScanFromPath:(id)a3 withPathList:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = SALog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100031B48(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  id v18 = objc_opt_new(&OBJC_CLASS___SAAppSizerResults);
  uint64_t v19 = objc_opt_new(&OBJC_CLASS___SATraverse);
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  uint64_t v27 = sub_100018244;
  v28 = &unk_10004CBD8;
  v29 = self;
  id v20 = v7;
  id v30 = v20;
  v21 = v18;
  id v31 = v21;
  -[SATraverse traverseWithPath:options:completionHandler:]( v19,  "traverseWithPath:options:completionHandler:",  v8,  15LL,  &v25);

  v22 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.fakeapp.SystemData" description]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v22));

  -[SAAppSizerResults updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:]( self->_appSizerResults,  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:",  v23,  0LL,  self->_othersByteCount,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v25,  v26,  v27,  v28,  v29);
  -[SATraverse debugLogStatistics](v19, "debugLogStatistics");
  -[SAAppSizerResults print](v21, "print");
  -[SAAppSizerResults updateTimestamp](v21, "updateTimestamp");
  -[SAAppSizerResults setStatus:](v21, "setStatus:", 0LL);
  if ((self->_scanOptions & 1) != 0) {
    +[SACallbackManager callAppSizeHandlersWithResults:error:]( &OBJC_CLASS___SACallbackManager,  "callAppSizeHandlersWithResults:error:",  v21,  0LL);
  }

  return 1;
}

- (BOOL)isSoftwareUpdateInProgressiOS
{
  return 0;
}

- (BOOL)isSoftwareUpdateInProgressWatchOS
{
  return 0;
}

- (BOOL)isSoftwareUpdateInProgressTvOS
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_100016E0C;
  v12[4] = sub_100016E1C;
  id v13 = 0LL;
  id v2 = [[SUControllerManager alloc] initWithDelegate:0];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100018498;
  v8[3] = &unk_10004CC00;
  uint64_t v10 = v12;
  uint64_t v11 = &v14;
  v4 = v3;
  uint64_t v9 = v4;
  [v2 managerStatus:v8];
  dispatch_time_t v5 = dispatch_time(0LL, 4000000000LL);
  dispatch_group_wait(v4, v5);
  char v6 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (void)updateAppSizerResultsWithSUPurgeableUrgencySizes
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = [&off_10004FBE8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      char v6 = 0LL;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(&off_10004FBE8);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v6);
        bzero(&v22, 0x878uLL);
        id v8 = v7;
        statfs((const char *)[v8 fileSystemRepresentation], &v22);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner dirKeyCacheList](self, "dirKeyCacheList"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner purgeableRecords](self, "purgeableRecords"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 SUPurgeableUrgencyData]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100018804;
        v15[3] = &unk_10004CC28;
        id v16 = v10;
        char v17 = self;
        id v14 = v10;
        [v13 enumerateKeysAndObjectsUsingBlock:v15];

        char v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [&off_10004FBE8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v4);
  }

- (void)checkForSizesOverflow
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Check For Sizes OverFlow",  buf,  2u);
  }

  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  uint64_t v37 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  -[SAVolumeScanner setTotalVisibleAppSize:](self, "setTotalVisibleAppSize:", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100018CD4;
  v21[3] = &unk_10004CC50;
  v21[4] = self;
  v21[5] = &v34;
  v21[6] = &v30;
  v21[7] = &v26;
  v21[8] = &v22;
  [v5 enumerateAppsDataUsingBlock:v21];

  unint64_t v6 = v27[3];
  unint64_t v7 = -[SAVolumeScanner totalHiddenAppSize](self, "totalHiddenAppSize");
  if (v6 > v7)
  {
    uint64_t v8 = SALog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100031CC4((uint64_t)v46, v27[3], -[SAVolumeScanner totalHiddenAppSize](self, "totalHiddenAppSize"), v9);
    }
  }

  uint64_t v10 = SALog(v7);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v31[3];
    unint64_t v13 = -[SAVolumeScanner totalVisibleAppSize](self, "totalVisibleAppSize");
    unint64_t v14 = -[SAVolumeScanner totalHiddenAppSize](self, "totalHiddenAppSize");
    uint64_t v15 = v27[3];
    *(_DWORD *)buf = 134218752;
    uint64_t v39 = v12;
    __int16 v40 = 2048;
    unint64_t v41 = v13;
    __int16 v42 = 2048;
    unint64_t v43 = v14;
    __int16 v44 = 2048;
    uint64_t v45 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "totalAppSize = %llu, totalVisibleAppSize = %llu, totalHiddenAppSize = %llu, unreportedSize = %llu",  buf,  0x2Au);
  }

  uint64_t v17 = SALog(v16);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v35[3];
    unint64_t v20 = v23[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = v19;
    __int16 v40 = 2048;
    unint64_t v41 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "totalVisibleAppCount = %llu, unreportedIncidents = %llu",  buf,  0x16u);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

- (void)calculateDiskUsedAndCapacity
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate DiskUsed And diskCapacity",  (uint8_t *)&v31,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  -[SAVolumeScanner setTotalPurgeableDataSize:]( self,  "setTotalPurgeableDataSize:",  [v5 totalCDAvailable]);

  uint64_t v7 = SALog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    id v10 = [v9 totalCDAvailable];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    id v12 = [v11 totalPurgeableClones];
    int v31 = 134218240;
    id v32 = v10;
    __int16 v33 = 2048;
    id v34 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "App Sizer totalCDAvailable:%llu purgeableClonesSize: %llu",  (uint8_t *)&v31,  0x16u);
  }

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  [v13 initDiskUsedAndCapacity];

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  objc_msgSend( v14,  "updateTotalsInfo:totalPurgeable:",  objc_msgSend(v15, "diskUsed"),  -[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize"));

  uint64_t v17 = SALog(v16);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    id v20 = [v19 diskUsed];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    id v22 = [v21 diskCapacity];
    unint64_t v23 = -[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize");
    int v31 = 134218496;
    id v32 = v20;
    __int16 v33 = 2048;
    id v34 = v22;
    __int16 v35 = 2048;
    unint64_t v36 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "App Sizer diskUsed:%llu diskCapacity:%llu totalPurgeableDataSize:%llu",  (uint8_t *)&v31,  0x20u);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  id v25 = [v24 diskUsed];
  unint64_t v26 = -[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize");

  if ((unint64_t)v25 < v26)
  {
    uint64_t v28 = SALog(v27);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100031DE0(self, v29);
    }

    -[SAVolumeScanner setTotalPurgeableDataSize:](self, "setTotalPurgeableDataSize:", 0LL);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  objc_msgSend( v30,  "setDiskUsed:",  (_BYTE *)objc_msgSend(v30, "diskUsed")
  - (_BYTE *)-[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize"));
}

- (void)calculateSystemDataSize
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v45) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate 'System Data' Size",  (uint8_t *)&v45,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  uint64_t v6 = (char *)[v5 diskUsed];
  unint64_t v7 = -[SAVolumeScanner totalVisibleAppSize](self, "totalVisibleAppSize");
  uint64_t v8 = (char *)-[SAVolumeScanner softwareUpdateVolumeUsedSpace](self, "softwareUpdateVolumeUsedSpace") + v7;
  uint64_t v9 = (char *)-[SAVolumeScanner systemVolumeUsedSpace](self, "systemVolumeUsedSpace") + (void)v8;

  if (v6 < v9)
  {
    unint64_t v10 = -[SAVolumeScanner totalVisibleAppSize](self, "totalVisibleAppSize");
    unint64_t v11 = -[SAVolumeScanner softwareUpdateVolumeUsedSpace](self, "softwareUpdateVolumeUsedSpace");
    unint64_t v12 = -[SAVolumeScanner systemVolumeUsedSpace](self, "systemVolumeUsedSpace");
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    unint64_t v14 = v10 + v11 + v12 - (void)[v13 diskUsed] + 0x40000000;

    unint64_t v15 = -[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize");
    if (v14 <= v15)
    {
      __int128 v18 = (char *)-[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize") - v14;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      objc_msgSend(v19, "setDiskUsed:", (char *)objc_msgSend(v19, "diskUsed") + v14);

      uint64_t v20 = SALog(-[SAVolumeScanner setTotalPurgeableDataSize:](self, "setTotalPurgeableDataSize:", v18));
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100031F6C(self, v17);
      }
    }

    else
    {
      uint64_t v16 = SALog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100031EE4(self, v14, v17);
      }
    }
  }

  unint64_t v21 = -[SAVolumeScanner dataVolumeSizeUsed](self, "dataVolumeSizeUsed");
  unint64_t v22 = v21 - -[SAVolumeScanner totalVisibleAppSize](self, "totalVisibleAppSize");
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  uint64_t v24 = [v23 diskUsed];
  unint64_t v25 = -[SAVolumeScanner totalVisibleAppSize](self, "totalVisibleAppSize");
  unint64_t v26 = -[SAVolumeScanner softwareUpdateVolumeUsedSpace](self, "softwareUpdateVolumeUsedSpace");
  unint64_t v27 = v24 - ((_BYTE *)-[SAVolumeScanner systemVolumeUsedSpace](self, "systemVolumeUsedSpace") + v25 + v26);

  if ((v27 & 0x8000000000000000LL) != 0)
  {
    uint64_t v29 = SALog(v28);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100031E80();
    }

    unint64_t v27 = 0x40000000LL;
  }

  if (v22 <= v27) {
    unint64_t v31 = v27;
  }
  else {
    unint64_t v31 = v22;
  }
  if (v22 >= v27) {
    unint64_t v32 = v27;
  }
  else {
    unint64_t v32 = v22;
  }
  __int16 v33 = (void *)(v31 - v32);
  if (v31 - v32 >= 0x20000001)
  {
    uint64_t v34 = SALog(v28);
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v45 = 134218496;
      id v46 = v33;
      __int16 v47 = 2048;
      unint64_t v48 = v22;
      __int16 v49 = 2048;
      unint64_t v50 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Large System data size gap (%llu). calculatedSystemDataFormula1 (%llu) calculatedSystemDataFormula2 (%llu)",  (uint8_t *)&v45,  0x20u);
    }
  }

  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.fakeapp.SystemData"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 appsDataInternal]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"com.apple.fakeapp.SystemData"]);

  if (!v39) {
    uint64_t v39 = (void *)objc_opt_new(&OBJC_CLASS___SAAppSize);
  }
  [v39 setDataSize:v27];
  uint64_t v40 = SALog([v39 setFixedSize:0]);
  unint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = [v39 dataSize];
    int v45 = 134217984;
    id v46 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "systemData = %llu", (uint8_t *)&v45, 0xCu);
  }

  unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
  [v43 setAppSet:v36 withAppSize:v39];

  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  objc_msgSend(v44, "setSystemDataSize:", objc_msgSend(v39, "dataSize"));
}

- (unint64_t)getSUVolumeUsedSpace
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000199B0;
  v4[3] = &unk_10004CC78;
  v4[4] = &v5;
  +[SASupport getVolSizeFromAttrList:completionHandler:]( SASupport,  "getVolSizeFromAttrList:completionHandler:",  [@"/private/var/MobileSoftwareUpdate" fileSystemRepresentation],  v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)addSoftwareUpdateBundle
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate Software Update Volume Size",  (uint8_t *)&v18,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  [v5 startTimeForTimeInfoEntry:10];

  LODWORD(v5) = -[SAVolumeScanner isSoftwareUpdateInProgressTvOS](self, "isSoftwareUpdateInProgressTvOS");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  [v6 stopTimeForTimeInfoEntry:10];

  if ((_DWORD)v5)
  {
    unint64_t v8 = -[SAVolumeScanner getSUVolumeUsedSpace](self, "getSUVolumeUsedSpace");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.fakeapp.SoftwareUpdate"));
    unint64_t v10 = (void *)objc_opt_new(&OBJC_CLASS___SAAppSize);
    [v10 setDataSize:v8];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    [v11 updateAppSet:v9 withAppSize:v10];

    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v12 addValue:v8 forAppInfoEntry:22 forBundleSet:v9];

    uint64_t v14 = SALog(v13);
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      unint64_t v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "softwareUpdateVolumeUsedSpace %llu",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    uint64_t v16 = SALog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Software Update is not in progress",  (uint8_t *)&v18,  2u);
    }

    unint64_t v8 = 0LL;
  }

  return v8;
}

- (void)processPurgeableAttributionTags
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Purgeable Attribution Tagging",  buf,  2u);
  }

  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  *(void *)buf = 0LL;
  uint64_t v24 = buf;
  uint64_t v25 = 0x3032000000LL;
  unint64_t v26 = sub_100016E0C;
  unint64_t v27 = sub_100016E1C;
  id v28 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner purgeableRecords](self, "purgeableRecords"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100019FA4;
  v22[3] = &unk_10004CCA0;
  v22[4] = &v33;
  v22[5] = &v29;
  v22[6] = buf;
  [v5 processAttributionTagsPurgeableWithReply:v22];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [&off_10004FC00 countByEnumeratingWithState:&v18 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      unint64_t v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(&off_10004FC00);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v24 + 5) objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * (void)v8)]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100019FCC;
        v17[3] = &unk_10004CCC8;
        v17[4] = self;
        [v9 enumerateKeysAndObjectsUsingBlock:v17];

        unint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [&off_10004FC00 countByEnumeratingWithState:&v18 objects:v41 count:16];
    }

    while (v6);
  }

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  [v10 setValue:v34[3] forTimeInfoEntry:9];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
  [v11 setValue:v30[3] forTotalsInfoEntry:3];

  uint64_t v13 = SALog(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v15 = v34[3] / 0xF4240uLL;
    uint64_t v16 = v30[3];
    *(_DWORD *)uint64_t v37 = 134218240;
    unint64_t v38 = v15;
    __int16 v39 = 2048;
    uint64_t v40 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Completed processing purgeable attribution tags (timeElapsed: %llu) (tagsCount: %llu)",  v37,  0x16u);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (unsigned)runAppSizerWithAsyncBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 withScanOptions:(unint64_t)a6 error:(id *)a7
{
  id v208 = a5;
  v289[0] = 0LL;
  v289[1] = v289;
  v289[2] = 0x3032000000LL;
  v289[3] = sub_100016E0C;
  v289[4] = sub_100016E1C;
  id v290 = 0LL;
  uint64_t v286 = 0LL;
  v287 = &v286;
  uint64_t v288 = 0x2020000000LL;
  uint64_t v7 = SALog(v208);
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "START: App Sizer", buf, 2u);
  }

  if ((a6 & 0x10) == 0)
  {
    unint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    startTime = self->_startTime;
    self->_startTime = v10;
  }

  if (v208)
  {
    uint64_t v12 = SALog(v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "App Sizer: Daily Activity";
  }

  else
  {
    uint64_t v15 = SALog(v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "App Sizer: User Initiated";
  }

  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
LABEL_11:

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SAAppSizerScan appSizerScan](&OBJC_CLASS___SAAppSizerScan, "appSizerScan"));
  v285[0] = _NSConcreteStackBlock;
  v285[1] = 3221225472LL;
  v285[2] = sub_10001BE7C;
  v285[3] = &unk_10004CCF0;
  v285[5] = &v286;
  v285[4] = self;
  [v16 initiatePathsScanWithBlocksNum:a3 withRunMode:a4 withActivity:v208 scanOptions:a6 withReplyBlock:v285];
  v207 = v16;
  LODWORD(v16) = *((unsigned __int8 *)v287 + 24);
  if ((_DWORD)v16 == 2)
  {
    [v207 resetState:a4];
    LODWORD(v16) = *((unsigned __int8 *)v287 + 24);
  }

  if (!(_DWORD)v16)
  {
    LODWORD(v16) = [v207 shouldDefer:a4 activity:v208];
    if ((_DWORD)v16)
    {
      uint64_t v18 = SALog([v207 resetState:a4]);
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      v204 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", buf, 2u);
      }

      v213 = 0LL;
      goto LABEL_144;
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v207 pathList]);
    -[SAVolumeScanner setPathList:](self, "setPathList:", v20);

    v204 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/private/var",  @"/private/var/mobile",  0LL));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v207 dirKeyCacheList]);
    -[SAVolumeScanner setDirKeyCacheList:](self, "setDirKeyCacheList:", v21);

    if ((a6 & 0x4000) != 0)
    {
      uint64_t v23 = SALog(v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer SU Purgeable Processing",  buf,  2u);
      }

      id v25 = +[SAPurgeableRecords newWithActivity:withRunMode:]( &OBJC_CLASS___SAPurgeableRecords,  "newWithActivity:withRunMode:",  v208,  a4);
      -[SAVolumeScanner setPurgeableRecords:](self, "setPurgeableRecords:", v25);

      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner purgeableRecords](self, "purgeableRecords"));
      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner pathList](self, "pathList"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner dirKeyCacheList](self, "dirKeyCacheList"));
      [v26 asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:v27 andDirKeyCacheList:v28];
    }

    uint64_t v29 = SALog(v22);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate Fixed Sizes",  buf,  2u);
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v207 appPathList]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 appPathList]);
    id v33 = [v32 copy];

    group = dispatch_group_create();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    v211 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v35 startTimeForTimeInfoEntry:5];

    uint64_t v36 = objc_opt_new(&OBJC_CLASS___SATraverse);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v207 appPathList]);
    -[SAVolumeScanner setAppPathList:](self, "setAppPathList:", v37);

    unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 appsDataInternal]);
    v203 = (void *)objc_claimAutoreleasedReturnValue([v39 allKeys]);

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SAUtilities splitArray:into:](&OBJC_CLASS___SAUtilities, "splitArray:into:", v203, 4LL));
    for (int i = 0; i != 4; ++i)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001BEE0;
      block[3] = &unk_10004CD18;
      id v210 = v40;
      id v279 = v210;
      int v284 = i;
      id v209 = v33;
      id v280 = v209;
      v213 = v36;
      v281 = v213;
      v282 = self;
      unint64_t v283 = a6;
      dispatch_group_async(group, v211, block);
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v42 stopTimeForTimeInfoEntry:5];

    if ((a6 & 4) != 0) {
      -[SATraverse debugLogStatistics](v213, "debugLogStatistics");
    }
    LODWORD(v16) = [v207 shouldDefer:a4 activity:v208];
    if ((_DWORD)v16)
    {
      uint64_t v43 = SALog([v207 resetState:a4]);
      __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", buf, 2u);
      }

      int v45 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner purgeableRecords](self, "purgeableRecords"));
      [v45 waitForProcessingSUPurgeableUrgencyFiles];

      goto LABEL_143;
    }

    id v46 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    unint64_t v47 = (unint64_t)[v46 getValueForDirStatsTotalsInfoEntry:2];

    unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    id v49 = [v48 getValueForDirStatsTotalsInfoEntry:3];

    unint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    v51 = (uint64_t (*)(uint64_t, uint64_t))[v50 getValueForDirStatsTotalsInfoEntry:4];

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    id v53 = [v52 getValueForDirStatsTotalsInfoEntry:5];

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    id v55 = [v54 getValueForDirStatsTotalsInfoEntry:6];

    uint64_t v57 = SALog(v56);
    id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219008;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2048;
      v304 = v51;
      *(_WORD *)v305 = 2048;
      *(void *)&v305[2] = v53;
      *(_WORD *)&v305[10] = 2048;
      *(void *)&v305[12] = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Extended dir-stats : numOfPaths %llu, numOfPathsDirStatEnabled %llu, numOfPathsDirStatUsed %llu,  numOfPathsDirS tatFailed %llu, numOfPathsDirStatSkipped %llu",  buf,  0x34u);
    }

    if ((char *)((char *)v51 + (void)v55) > (char *)(v47 >> 1))
    {
      uint64_t v60 = SALog(v59);
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Extended dir-stats enabled on half of valid paths, enable attribution tagging",  buf,  2u);
      }

      +[SAAttributionTag enableAttributionTagging:](&OBJC_CLASS___SAAttributionTag, "enableAttributionTagging:", 1LL);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
      [v62 startTimeForTimeInfoEntry:4];

      uint64_t v64 = SALog(v63);
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        sub_100032178(v65, v66, v67, v68, v69, v70, v71, v72);
      }

      __int128 v277 = 0u;
      __int128 v276 = 0u;
      __int128 v275 = 0u;
      __int128 v274 = 0u;
      id obj = v204;
      id v73 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v274,  v302,  16LL);
      if (v73)
      {
        uint64_t v74 = *(void *)v275;
        do
        {
          for (j = 0LL; j != v73; j = (char *)j + 1)
          {
            if (*(void *)v275 != v74) {
              objc_enumerationMutation(obj);
            }
            uint64_t v76 = *(void *)(*((void *)&v274 + 1) + 8LL * (void)j);
            *(void *)buf = 0LL;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000LL;
            v304 = sub_100016E0C;
            *(void *)v305 = sub_100016E1C;
            *(void *)&v305[8] = objc_opt_new(&OBJC_CLASS___NSMutableArray);
            v273[0] = _NSConcreteStackBlock;
            v273[1] = 3221225472LL;
            v273[2] = sub_10001C730;
            v273[3] = &unk_10004CD40;
            v273[4] = v76;
            v273[5] = self;
            v273[8] = a6;
            v273[6] = v289;
            v273[7] = buf;
            +[SAAttributionTag processAttributionTagsForVol:withBlock:]( &OBJC_CLASS___SAAttributionTag,  "processAttributionTagsForVol:withBlock:",  v76,  v273);
            if ((a6 & 0x40) != 0)
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
              v78 = (void *)objc_claimAutoreleasedReturnValue([v77 attributionTags]);

              objc_sync_enter(v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
              v80 = (void *)objc_claimAutoreleasedReturnValue([v79 attributionTags]);
              [v80 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v76];

              objc_sync_exit(v78);
            }

            _Block_object_dispose(buf, 8);
          }

          id v73 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v274,  v302,  16LL);
        }

        while (v73);
      }

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
      [v81 stopTimeForTimeInfoEntry:4];
    }

    uint64_t v82 = SALog(v59);
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "START: App Sizer Clone Mapper", buf, 2u);
    }

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v84 startTimeForTimeInfoEntry:8];

    uint64_t v269 = 0LL;
    v270 = &v269;
    uint64_t v271 = 0x2020000000LL;
    uint64_t v272 = 0LL;
    __int128 v265 = 0u;
    __int128 v266 = 0u;
    __int128 v267 = 0u;
    __int128 v268 = 0u;
    v214 = v204;
    id v85 = -[os_log_s countByEnumeratingWithState:objects:count:]( v214,  "countByEnumeratingWithState:objects:count:",  &v265,  v301,  16LL);
    if (v85)
    {
      id obja = *(id *)v266;
      do
      {
        for (k = 0LL; k != v85; k = (char *)k + 1)
        {
          if (*(id *)v266 != obja) {
            objc_enumerationMutation(v214);
          }
          uint64_t v87 = *(void *)(*((void *)&v265 + 1) + 8LL * (void)k);
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner dirKeyCacheList](self, "dirKeyCacheList"));
          v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v87]);

          v90 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner pathList](self, "pathList"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
          v92 = (void *)objc_claimAutoreleasedReturnValue([v91 appSizeBreakdownList]);
          v263[0] = _NSConcreteStackBlock;
          v263[1] = 3221225472LL;
          v263[2] = sub_10001CB14;
          v263[3] = &unk_10004CD90;
          v263[4] = v87;
          v263[5] = self;
          v263[6] = v289;
          v263[7] = &v269;
          char v264 = (unsigned __int16)(a6 & 0x100) >> 8;
          +[SACloneTreeWalker processCloneMapOnVol:pathList:appSizeBreakdownList:dirKeyCache:collectClonesPaths:reply:]( &OBJC_CLASS___SACloneTreeWalker,  "processCloneMapOnVol:pathList:appSizeBreakdownList:dirKeyCache:collectClonesPaths:reply:",  v87,  v90,  v92,  v89,  (a6 & 0x100) != 0,  v263);
        }

        id v85 = -[os_log_s countByEnumeratingWithState:objects:count:]( v214,  "countByEnumeratingWithState:objects:count:",  &v265,  v301,  16LL);
      }

      while (v85);
    }

    uint64_t v94 = SALog(v93);
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v96 = v270[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v96;
      _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "CloneTreeWalker: totalClonesSize = %llu",  buf,  0xCu);
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v97 stopTimeForTimeInfoEntry:8];

    uint64_t v99 = SALog(v98);
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Get Purgeable Information",  buf,  2u);
    }

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    v262[0] = _NSConcreteStackBlock;
    v262[1] = 3221225472LL;
    v262[2] = sub_10001D074;
    v262[3] = &unk_10004CDB8;
    v262[4] = self;
    [v101 enumerateAppsDataUsingBlock:v262];

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appPathList](self, "appPathList"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 appPathList]);
    v261[0] = _NSConcreteStackBlock;
    v261[1] = 3221225472LL;
    v261[2] = sub_10001D3D8;
    v261[3] = &unk_10004C810;
    v261[4] = self;
    [v103 enumerateKeysAndObjectsUsingBlock:v261];

    uint64_t v105 = SALog(v104);
    v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate System Volume Size",  buf,  2u);
    }

    objb = objc_opt_new(&OBJC_CLASS___SAHelper);
    objc_initWeak(&location, self);
    v258[0] = _NSConcreteStackBlock;
    v258[1] = 3221225472LL;
    v258[2] = sub_10001D6E0;
    v258[3] = &unk_10004CE08;
    objc_copyWeak(&v259, &location);
    uint64_t v107 = SALog(-[SAHelper computeSizeOfSystemVolume:](objb, "computeSizeOfSystemVolume:", v258));
    v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calculate Data And User Volumes Size:",  buf,  2u);
    }

    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v304 = sub_100016E0C;
    *(void *)v305 = sub_100016E1C;
    *(void *)&v305[8] = 0LL;
    uint64_t v252 = 0LL;
    v253 = &v252;
    uint64_t v254 = 0x3032000000LL;
    v255 = sub_100016E0C;
    v256 = sub_100016E1C;
    id v257 = 0LL;
    uint64_t v246 = 0LL;
    v247 = &v246;
    uint64_t v248 = 0x3032000000LL;
    v249 = sub_100016E0C;
    v250 = sub_100016E1C;
    id v251 = 0LL;
    v244[0] = 0LL;
    v244[1] = v244;
    v244[2] = 0x3032000000LL;
    v244[3] = sub_100016E0C;
    v244[4] = sub_100016E1C;
    id v245 = 0LL;
    uint64_t v240 = 0LL;
    v241 = &v240;
    uint64_t v242 = 0x2020000000LL;
    char v243 = 1;
    v109 = objc_opt_new(&OBJC_CLASS___SADispatchGroup);
    -[SADispatchGroup enter](v109, "enter");
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/private/var/mobile"));
    v234[0] = _NSConcreteStackBlock;
    v234[1] = 3221225472LL;
    v234[2] = sub_10001D894;
    v234[3] = &unk_10004CE30;
    v236 = &v246;
    v237 = v244;
    v234[4] = self;
    v238 = &v252;
    v239 = &v240;
    v215 = v109;
    v235 = v215;
    -[SAHelper getPurgeableInfo:options:reply:](objb, "getPurgeableInfo:options:reply:", v110, 1LL, v234);

    id v111 = (id)-[SADispatchGroup wait:](v215, "wait:", dispatch_time(0LL, 60000000000LL));
    if (*((_BYTE *)v241 + 24))
    {
      uint64_t v112 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  60LL,  0LL));
      v113 = (void *)v253[5];
      v253[5] = v112;
    }

    if (v253[5])
    {
      uint64_t v114 = SALog(v111);
      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v116 = (void *)objc_claimAutoreleasedReturnValue([(id)v253[5] description]);
        sub_10003212C(v116, (uint64_t)v300, v115);
      }
    }

    __int128 v232 = 0u;
    __int128 v233 = 0u;
    __int128 v230 = 0u;
    __int128 v231 = 0u;
    v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/private/var/mobile",  @"/private/var",  0LL));
    id v118 = [v117 countByEnumeratingWithState:&v230 objects:v299 count:16];
    if (v118)
    {
      uint64_t v119 = *(void *)v231;
      do
      {
        for (m = 0LL; m != v118; m = (char *)m + 1)
        {
          if (*(void *)v231 != v119) {
            objc_enumerationMutation(v117);
          }
          uint64_t v121 = *(void *)(*((void *)&v230 + 1) + 8LL * (void)m);
          v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v121));
          v229[0] = _NSConcreteStackBlock;
          v229[1] = 3221225472LL;
          v229[2] = sub_10001DE70;
          v229[3] = &unk_10004CE58;
          v229[4] = self;
          v229[5] = v121;
          v229[6] = buf;
          -[SAHelper computeSizeOfVolumeAtURL:options:completionHandler:]( objb,  "computeSizeOfVolumeAtURL:options:completionHandler:",  v122,  1LL,  v229);
        }

        id v118 = [v117 countByEnumeratingWithState:&v230 objects:v299 count:16];
      }

      while (v118);
    }

    uint64_t v123 = SALog( -[SAVolumeScanner setDataVolumeSizeUsed:]( self,  "setDataVolumeSizeUsed:",  (_BYTE *)-[SAVolumeScanner dataVolumeSizeUsed](self, "dataVolumeSizeUsed")
             - (_BYTE *)[(id)v247[5] longLongValue]));
    v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v200 = -[SAVolumeScanner dataVolumeSizeUsed](self, "dataVolumeSizeUsed");
      v201 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      id v202 = [v201 totalCDAvailable];
      *(_DWORD *)v293 = 134218496;
      double v294 = 0.0;
      __int16 v295 = 2048;
      unint64_t v296 = v200;
      __int16 v297 = 2048;
      id v298 = v202;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEBUG,  "data volume sizes: dataVolumeSizeCapacity %llu, dataVolumeSizeUsed %llu, totalCDAvailable %llu",  v293,  0x20u);
    }

    v228[0] = _NSConcreteStackBlock;
    v228[1] = 3221225472LL;
    v228[2] = sub_10001DF18;
    v228[3] = &unk_10004CE80;
    v228[4] = self;
    +[SAUtilities getFileSize:reply:]( &OBJC_CLASS___SAUtilities,  "getFileSize:reply:",  @"/private/var/.overprovisioning_file",  v228);
    id v125 = -[SAVolumeScanner setSoftwareUpdateVolumeUsedSpace:]( self,  "setSoftwareUpdateVolumeUsedSpace:",  -[SAVolumeScanner addSoftwareUpdateBundle](self, "addSoftwareUpdateBundle"));
    if ((byte_10005AA88 & 1) == 0)
    {
      uint64_t v126 = SALog(v125);
      v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "START: postProcessFiltering", v293, 2u);
      }

      v128 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appPathList](self, "appPathList"));
      -[SAVolumeScanner setTotalHiddenAppSize:]( self,  "setTotalHiddenAppSize:",  [v128 postProcessFilteringWithAppPathList:v129]);
    }

    uint64_t v130 = SALog(v125);
    v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v293 = 0;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "START: Add vendor-name", v293, 2u);
    }

    v132 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    v227[0] = _NSConcreteStackBlock;
    v227[1] = 3221225472LL;
    v227[2] = sub_10001DFB0;
    v227[3] = &unk_10004CDB8;
    v227[4] = self;
    [v132 enumerateAppsDataUsingBlock:v227];

    if ((byte_10005AA88 & 1) == 0)
    {
      uint64_t v134 = SALog(v133);
      v135 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "START: postProcessMerging", v293, 2u);
      }

      v136 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v136 postProcessMerging];

      uint64_t v138 = SALog(v137);
      v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "START: zeroSizeAppsFiltering", v293, 2u);
      }

      v140 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v140 zeroSizeAppsFiltering];
    }

    uint64_t v141 = SALog(v133);
    v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v293 = 0;
      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "START: billLLMsToSystemOn", v293, 2u);
    }

    v143 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    +[SALLMList billLLMsToSystemOn:andTelemetry:]( &OBJC_CLASS___SALLMList,  "billLLMsToSystemOn:andTelemetry:",  v143,  v144);

    v145 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    v146 = (void *)objc_claimAutoreleasedReturnValue([v145 appsDataInternal]);
    v147 = (void *)objc_claimAutoreleasedReturnValue([v146 objectForKeyedSubscript:@"com.apple.fakeapp.System"]);

    if (v147)
    {
      -[SAVolumeScanner setSystemVolumeUsedSpace:](self, "setSystemVolumeUsedSpace:", [v147 dataSize]);
    }

    else
    {
      uint64_t v149 = SALog(v148);
      v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
        sub_1000320F0(v150);
      }
    }

    v151 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    objc_msgSend( v151,  "addValue:forTotalsInfoEntry:",  -[SAVolumeScanner systemVolumeUsedSpace](self, "systemVolumeUsedSpace"),  17);

    -[SAVolumeScanner checkForSizesOverflow](self, "checkForSizesOverflow");
    -[SAVolumeScanner calculateDiskUsedAndCapacity](self, "calculateDiskUsedAndCapacity");
    -[SAVolumeScanner calculateSystemDataSize](self, "calculateSystemDataSize");
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    [v152 updateTimestamp];

    if ((a6 & 2) != 0)
    {
      uint64_t v154 = SALog(v153);
      v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_DEFAULT,  "Calling Handlers with intermittent results",  v293,  2u);
      }

      v156 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v156 populateAppsData];

      v157 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      +[SACallbackManager callAppSizeHandlersWithResults:error:]( &OBJC_CLASS___SACallbackManager,  "callAppSizeHandlersWithResults:error:",  v157,  0LL);
    }

    if ((a6 & 0x80) != 0)
    {
      v158 = (void *)objc_claimAutoreleasedReturnValue( +[SASupport getFSPurgeableDataOnVolumes:]( &OBJC_CLASS___SASupport,  "getFSPurgeableDataOnVolumes:",  &off_10004FC18));
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v159 setFSPurgeableData:v158];
    }

    if ((a6 & 4) != 0)
    {
      v160 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v160 print];
    }

    if ((a6 & 0x4000) != 0)
    {
      v161 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner purgeableRecords](self, "purgeableRecords"));
      LODWORD(v16) = [v161 waitForProcessingSUPurgeableUrgencyFiles];

      if ((_DWORD)v16)
      {
        [v207 resetState:a4];
LABEL_142:

        _Block_object_dispose(&v240, 8);
        _Block_object_dispose(v244, 8);

        _Block_object_dispose(&v246, 8);
        _Block_object_dispose(&v252, 8);

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v259);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v269, 8);
LABEL_143:

LABEL_144:
        uint64_t v17 = v213;
        goto LABEL_145;
      }

      uint64_t v163 = SALog(v162);
      v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v164,  OS_LOG_TYPE_DEFAULT,  "End: App Sizer SU Purgeable Processing",  v293,  2u);
      }

      -[SAVolumeScanner updateAppSizerResultsWithSUPurgeableUrgencySizes]( self,  "updateAppSizerResultsWithSUPurgeableUrgencySizes");
      -[SAVolumeScanner checkForSizesOverflow](self, "checkForSizesOverflow");
      -[SAVolumeScanner calculateSystemDataSize](self, "calculateSystemDataSize");
    }

    if ((a6 & 8) != 0)
    {
      v165 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
      v166 = (void *)objc_claimAutoreleasedReturnValue([v165 dictionaryDescription]);
      v167 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v167 setReportedTelemetry:v166];
    }

    v168 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    v169 = (void *)objc_claimAutoreleasedReturnValue([v168 appSizeBreakdownList]);

    if (v169)
    {
      v170 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      v171 = (void *)objc_claimAutoreleasedReturnValue([v170 appSizeBreakdownList]);
      v172 = (void *)objc_claimAutoreleasedReturnValue([v171 generateDictionary]);
      v173 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      [v173 setAppsInfo:v172];
    }

    v174 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    [v174 populateAppsData];

    v175 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
    [v175 setStatus:0];

    id v176 = [v207 resetState:a4];
    if ((a6 & 1) != 0)
    {
      uint64_t v177 = SALog(v176);
      v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v293 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Calling Handlers",  v293,  2u);
      }

      v179 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appSizerResults](self, "appSizerResults"));
      +[SACallbackManager callAppSizeHandlersWithResults:error:]( &OBJC_CLASS___SACallbackManager,  "callAppSizeHandlersWithResults:error:",  v179,  0LL);
    }

    uint64_t v180 = SALog(v176);
    v181 = (os_log_s *)objc_claimAutoreleasedReturnValue(v180);
    if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v293 = 0;
      _os_log_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEFAULT, "END: App Sizer", v293, 2u);
    }

    v182 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    [v182 stopTimeForTimeInfoEntry:6];

    v183 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner appPathList](self, "appPathList"));
    [v183 updateSAFOptionWithPathsList:v184];

    if ((a6 & 0x200) != 0)
    {
      if (os_variant_has_internal_ui(0LL)
        && +[SATelemetryManager shouldSendTelemetry:]( &OBJC_CLASS___SATelemetryManager,  "shouldSendTelemetry:",  v208 != 0LL))
      {
        -[SAVolumeScanner processPurgeableAttributionTags](self, "processPurgeableAttributionTags");
      }

      v185 = (void *)objc_claimAutoreleasedReturnValue(-[SAVolumeScanner telemetryManager](self, "telemetryManager"));
      [v185 sendTelemetry:v208 != 0];
    }

    if ((a6 & 0x1000) != 0)
    {
      int v186 = +[SACallbackManager handlersCount](&OBJC_CLASS___SACallbackManager, "handlersCount");
      LOBYTE(v16) = 5;
      if (a4 == 2 && v186 >= 1)
      {
        id v187 = -[NSDate timeIntervalSinceNow](self->_startTime, "timeIntervalSinceNow");
        double v189 = v188;
        uint64_t v190 = SALog(v187);
        v191 = (os_log_s *)objc_claimAutoreleasedReturnValue(v190);
        double v192 = -v189;
        if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v293 = 134218240;
          double v294 = v192;
          __int16 v295 = 1024;
          LODWORD(v296) = dword_10005A8A8;
          _os_log_impl( (void *)&_mh_execute_header,  v191,  OS_LOG_TYPE_DEFAULT,  "App Sizer timeSinceStart is %f, timeout is %u",  v293,  0x12u);
        }

        LODWORD(v193) = dword_10005A8A8;
        if (v192 <= (double)v193)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SACallbackManager activeHandlers](&OBJC_CLASS___SACallbackManager, "activeHandlers"));
          do
            unsigned int v196 = __ldaxr(&dword_10005AA8C);
          while (__stlxr(v196 + 1, &dword_10005AA8C));
          dispatch_time_t v197 = dispatch_time(0LL, 60000000000LL);
          rerunQue = self->_rerunQue;
          v221[0] = _NSConcreteStackBlock;
          v221[1] = 3221225472LL;
          v221[2] = sub_10001E078;
          v221[3] = &unk_10004CEA8;
          id v195 = v16;
          id v222 = v195;
          v223 = self;
          int v226 = a3;
          id v224 = v208;
          unint64_t v225 = a6;
          dispatch_after(v197, (dispatch_queue_t)rerunQue, v221);

          LOBYTE(v16) = 5;
        }

        else
        {
          NSErrorUserInfoKey v291 = NSLocalizedFailureReasonErrorKey;
          v292 = @"SAF Exhaustion";
          v194 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v292,  &v291,  1LL));
          id v195 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4610LL,  v194));

          +[SACallbackManager callAppSizeHandlersWithResults:error:]( &OBJC_CLASS___SACallbackManager,  "callAppSizeHandlersWithResults:error:",  0LL,  v195);
          LOBYTE(v16) = 3;
        }
      }
    }

    else
    {
      LOBYTE(v16) = 5;
    }

    goto LABEL_142;
  }

  uint64_t v17 = 0LL;
LABEL_145:

  _Block_object_dispose(&v286, 8);
  _Block_object_dispose(v289, 8);

  return v16;
}

- (unint64_t)analyzeFile:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SATraverse getFileSize:](&OBJC_CLASS___SATraverse, "getFileSize:", a3, a4, a5, a6));
  id v8 = [v7 dataSize];
  uint64_t v9 = 6LL;
  if (!self->_knownApp) {
    uint64_t v9 = 5LL;
  }
  (&self->super.isa)[v9] = (Class)((char *)(&self->super.isa)[v9] + (unint64_t)v8);

  return 0LL;
}

- (unint64_t)analyzeDirEntry:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  if (self->_knownApp)
  {
    ++self->_childrenInsideKnown;
  }

  else
  {
    id v8 = a4;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a3, 1LL));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001E2A4;
    v11[3] = &unk_10004CED0;
    v11[4] = self;
    [v8 getAppsSetForURL:v9 completionHandler:v11];
  }

  return 0LL;
}

- (unint64_t)analyzeDirExit:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_knownApp)
  {
    unint64_t v14 = self->_childrenInsideKnown - 1;
    self->_childrenInsideKnown = v14;
    if (!v14)
    {
      self->_knownApp = 0;
      unint64_t knownAppByteCount = self->_knownAppByteCount;
      if (knownAppByteCount) {
        [v12 updateAppSet:self->_knownAppName fixedSize:0 dataSize:knownAppByteCount cloneSize:0 purgeableSize:0 FSPurgeableSize:0 physicalSize:0 appCacheSize:0 CDPluginSize:0];
      }
      if ((self->_scanOptions & 2) != 0)
      {
        [v12 updateTimestamp];
        +[SACallbackManager callAppSizeHandlersWithResults:error:]( &OBJC_CLASS___SACallbackManager,  "callAppSizeHandlersWithResults:error:",  v12,  0LL);
      }
    }
  }

  return 0LL;
}

- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3
{
  dword_10005A8A8 = a3;
}

+ (void)setAppSizerResultsFilteringToDefault
{
  byte_10005AA88 = 0;
}

+ (void)disableAppSizerResultsFiltering
{
  byte_10005AA88 = 1;
}

+ (void)setForceTelemetry
{
  uint64_t v2 = SALog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "+[SAVolumeScanner setForceTelemetry]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: set to TRUE", (uint8_t *)&v4, 0xCu);
  }

  byte_10005AA90 = 1;
}

+ (BOOL)shouldForceTelemetry
{
  int v2 = byte_10005AA90;
  byte_10005AA90 = 0;
  if (v2 == 1)
  {
    uint64_t v3 = SALog(a1);
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "+[SAVolumeScanner shouldForceTelemetry]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: forceTelemetry", (uint8_t *)&v6, 0xCu);
    }
  }

  return v2;
}

- (unint64_t)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(unint64_t)a3
{
  self->_scanOptions = a3;
}

- (SAAppSizerResults)appSizerResults
{
  return (SAAppSizerResults *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAppSizerResults:(id)a3
{
}

- (SATelemetryManager)telemetryManager
{
  return (SATelemetryManager *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTelemetryManager:(id)a3
{
}

- (BOOL)extendedDirStatsEnabled
{
  return self->_extendedDirStatsEnabled;
}

- (void)setExtendedDirStatsEnabled:(BOOL)a3
{
  self->_extendedDirStatsEnabled = a3;
}

- (BOOL)appSizerInProgress
{
  return self->_appSizerInProgress;
}

- (void)setAppSizerInProgress:(BOOL)a3
{
  self->_appSizerInProgress = a3;
}

- (unint64_t)othersByteCount
{
  return self->_othersByteCount;
}

- (void)setOthersByteCount:(unint64_t)a3
{
  self->_othersByteCount = a3;
}

- (BOOL)knownApp
{
  return self->_knownApp;
}

- (void)setKnownApp:(BOOL)a3
{
  self->_knownApp = a3;
}

- (unint64_t)knownAppByteCount
{
  return self->_knownAppByteCount;
}

- (void)setKnownAppByteCount:(unint64_t)a3
{
  self->_unint64_t knownAppByteCount = a3;
}

- (unint64_t)childrenInsideKnown
{
  return self->_childrenInsideKnown;
}

- (void)setChildrenInsideKnown:(unint64_t)a3
{
  self->_childrenInsideKnown = a3;
}

- (NSSet)knownAppName
{
  return (NSSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setKnownAppName:(id)a3
{
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFileManager:(id)a3
{
}

- (OS_dispatch_queue)rerunQue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setRerunQue:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSMutableDictionary)tagMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setTagMap:(id)a3
{
}

- (unint64_t)totalVisibleAppSize
{
  return self->_totalVisibleAppSize;
}

- (void)setTotalVisibleAppSize:(unint64_t)a3
{
  self->_totalVisibleAppSize = a3;
}

- (unint64_t)totalHiddenAppSize
{
  return self->_totalHiddenAppSize;
}

- (void)setTotalHiddenAppSize:(unint64_t)a3
{
  self->_totalHiddenAppSize = a3;
}

- (unint64_t)totalPurgeableDataSize
{
  return self->_totalPurgeableDataSize;
}

- (void)setTotalPurgeableDataSize:(unint64_t)a3
{
  self->_totalPurgeableDataSize = a3;
}

- (unint64_t)dataVolumeSizeUsed
{
  return self->_dataVolumeSizeUsed;
}

- (void)setDataVolumeSizeUsed:(unint64_t)a3
{
  self->_dataVolumeSizeUsed = a3;
}

- (unint64_t)softwareUpdateVolumeUsedSpace
{
  return self->_softwareUpdateVolumeUsedSpace;
}

- (void)setSoftwareUpdateVolumeUsedSpace:(unint64_t)a3
{
  self->_softwareUpdateVolumeUsedSpace = a3;
}

- (unint64_t)systemVolumeUsedSpace
{
  return self->_systemVolumeUsedSpace;
}

- (void)setSystemVolumeUsedSpace:(unint64_t)a3
{
  self->_systemVolumeUsedSpace = a3;
}

- (SAAppPathList)appPathList
{
  return (SAAppPathList *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setAppPathList:(id)a3
{
}

- (NSMutableDictionary)dirKeyCacheList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDirKeyCacheList:(id)a3
{
}

- (SAPathList)pathList
{
  return (SAPathList *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setPathList:(id)a3
{
}

- (SAPurgeableRecords)purgeableRecords
{
  return (SAPurgeableRecords *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPurgeableRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end