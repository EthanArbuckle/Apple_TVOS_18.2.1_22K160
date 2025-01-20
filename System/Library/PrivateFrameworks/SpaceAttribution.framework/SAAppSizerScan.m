@interface SAAppSizerScan
+ (id)appSizerScan;
- (BOOL)scanInProgress;
- (BOOL)shouldContinueScanning;
- (NSLock)pathScanLock;
- (NSMutableDictionary)dirKeyCacheList;
- (OS_os_transaction)scanOSTransaction;
- (SAAppPathList)appPathList;
- (SAAppSizerResults)appSizerResults;
- (SAAppSizerScan)init;
- (SAPathList)pathList;
- (unint64_t)runMode;
- (unsigned)shouldDefer:(unint64_t)a3 activity:(id)a4;
- (unsigned)shouldInitiatePathsScan:(unint64_t)a3 withActivity:(id)a4;
- (unsigned)waitForScan:(id)a3 mode:(unint64_t)a4 activity:(id)a5;
- (void)initiatePathsScanWithBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 scanOptions:(unint64_t)a6 withReplyBlock:(id)a7;
- (void)resetState:(unint64_t)a3;
- (void)scanPathsWithRunMode:(unint64_t)a3 activity:(id)a4 scanOptions:(unint64_t)a5 reply:(id)a6;
- (void)setAppPathList:(id)a3;
- (void)setAppSizerResults:(id)a3;
- (void)setPathList:(id)a3;
- (void)setPathScanLock:(id)a3;
- (void)setRunMode:(unint64_t)a3;
- (void)setScanInProgress:(BOOL)a3;
- (void)setScanOSTransaction:(id)a3;
- (void)setShouldContinueScanning:(BOOL)a3;
@end

@implementation SAAppSizerScan

- (SAAppSizerScan)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SAAppSizerScan;
  v2 = -[SAAppSizerScan init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_runMode = 0LL;
    *(_WORD *)&v2->_shouldContinueScanning = 1;
    v4 = objc_opt_new(&OBJC_CLASS___NSLock);
    pathScanLock = v3->_pathScanLock;
    v3->_pathScanLock = v4;

    uint64_t v6 = os_transaction_create("com.apple.spaceattributiond.appSizerScan");
    scanOSTransaction = v3->_scanOSTransaction;
    v3->_scanOSTransaction = (OS_os_transaction *)v6;

    dirKeyCacheList = v3->_dirKeyCacheList;
    v3->_dirKeyCacheList = 0LL;
  }

  return v3;
}

- (void)resetState:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_runMode == a3)
  {
    appSizerResults = obj->_appSizerResults;
    obj->_runMode = 0LL;
    obj->_appSizerResults = 0LL;
    *(_WORD *)&obj->_shouldContinueScanning = 1;

    appPathList = obj->_appPathList;
    obj->_appPathList = 0LL;

    pathList = obj->_pathList;
    obj->_pathList = 0LL;

    scanOSTransaction = obj->_scanOSTransaction;
    obj->_scanOSTransaction = 0LL;

    dirKeyCacheList = obj->_dirKeyCacheList;
    obj->_dirKeyCacheList = 0LL;
  }

  objc_sync_exit(obj);
}

- (NSMutableDictionary)dirKeyCacheList
{
  dirKeyCacheList = self->_dirKeyCacheList;
  if (!dirKeyCacheList)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/private/var",  @"/private/var/mobile",  0LL));
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
    uint64_t v6 = self->_dirKeyCacheList;
    self->_dirKeyCacheList = v5;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
          -[NSMutableDictionary setObject:forKey:](self->_dirKeyCacheList, "setObject:forKey:", v13, v12);

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    dirKeyCacheList = self->_dirKeyCacheList;
  }

  return dirKeyCacheList;
}

+ (id)appSizerScan
{
  if (qword_10005AA80 != -1) {
    dispatch_once(&qword_10005AA80, &stru_10004CB38);
  }
  return (id)qword_10005AA78;
}

- (unsigned)shouldInitiatePathsScan:(unint64_t)a3 withActivity:(id)a4
{
  id v6 = a4;
  id v7 = self;
  uint64_t v8 = objc_sync_enter(v7);
  if (v7->_scanInProgress)
  {
    if (a3 == 2 && v7->_runMode == 1)
    {
      uint64_t v9 = SALog(v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        v20 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
        __int16 v21 = 2048;
        *(void *)v22 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Updating runMode to %lu",  (uint8_t *)&v19,  0x16u);
      }

      unsigned __int8 v11 = 0;
      v7->_unint64_t runMode = 2LL;
    }

    else
    {
      uint64_t v16 = SALog(v8);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        v20 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s App sizer is already running. Rejecting the thread",  (uint8_t *)&v19,  0xCu);
      }

      unsigned __int8 v11 = 1;
    }
  }

  else
  {
    uint64_t v12 = SALog(v8);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL scanInProgress = v7->_scanInProgress;
      unint64_t runMode = v7->_runMode;
      int v19 = 136315906;
      v20 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
      __int16 v21 = 1024;
      *(_DWORD *)v22 = scanInProgress;
      *(_WORD *)&v22[4] = 2048;
      *(void *)&v22[6] = a3;
      __int16 v23 = 2048;
      unint64_t v24 = runMode;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Initiating paths scan. scanInProgress: %d mode: %lu runMode: %lu",  (uint8_t *)&v19,  0x26u);
    }

    unsigned __int8 v11 = 0;
    v7->_unint64_t runMode = a3;
    v7->_BOOL scanInProgress = 1;
  }

  objc_sync_exit(v7);

  return v11;
}

- (unsigned)shouldDefer:(unint64_t)a3 activity:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 != 1) {
    goto LABEL_11;
  }
  id v7 = [v5 shouldDefer];
  if (!(_DWORD)v7)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SAAppSizerScan appSizerScan](&OBJC_CLASS___SAAppSizerScan, "appSizerScan"));
    id v12 = [v11 runMode];

    if (v12 == (id)2)
    {
      uint64_t v14 = SALog(v13);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        __int128 v17 = "-[SAAppSizerScan shouldDefer:activity:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s mode was updated to non-defer, deferring app sizer",  (uint8_t *)&v16,  0xCu);
      }

      unsigned __int8 v10 = 4;
      goto LABEL_10;
    }

- (void)scanPathsWithRunMode:(unint64_t)a3 activity:(id)a4 scanOptions:(unint64_t)a5 reply:(id)a6
{
  unint64_t v41 = a3;
  id v48 = a4;
  id v44 = a6;
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x3032000000LL;
  v64 = sub_100016E0C;
  v65 = sub_100016E1C;
  id v66 = 0LL;
  v47 = dispatch_group_create();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2020000000LL;
  char v60 = 1;
  if ((os_variant_has_internal_ui(0LL) & 1) != 0
    || +[SATelemetryManager shouldSendTelemetry:](&OBJC_CLASS___SATelemetryManager, "shouldSendTelemetry:", v48 != 0LL))
  {
    id v9 = +[SATelemetryManager newWithSAFOptions:](&OBJC_CLASS___SATelemetryManager, "newWithSAFOptions:", 1LL, v41);
  }

  else
  {
    id v9 = 0LL;
  }

  objc_msgSend(v9, "startTimeForTimeInfoEntry:", 6, v41);
  uint64_t v10 = SALog(-[NSLock lock](self->_pathScanLock, "lock"));
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "START: App Sizer Importing Paths", buf, 2u);
  }

  [v9 startTimeForTimeInfoEntry:7];
  id v12 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppSizerScan dirKeyCacheList](self, "dirKeyCacheList"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100016E24;
  v56[3] = &unk_10004CB60;
  v56[4] = self;
  v56[5] = &v57;
  -[SAAppPathList defaultListWithSAActivity:dirKeyCacheList:reply:]( v12,  "defaultListWithSAActivity:dirKeyCacheList:reply:",  v48,  v13,  v56);

  [v9 stopTimeForTimeInfoEntry:7];
  if (*((_BYTE *)v58 + 24))
  {
    -[NSLock unlock](self->_pathScanLock, "unlock");
    (*((void (**)(id, uint64_t, void, void))v44 + 2))(v44, 2LL, 0LL, 0LL);
    v43 = 0LL;
  }

  else
  {
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___SAPathList);
    pathList = self->_pathList;
    self->_pathList = v14;

    int v16 = objc_opt_new(&OBJC_CLASS___SAAppSizerResults);
    appSizerResults = self->_appSizerResults;
    self->_appSizerResults = v16;

    if ((a5 & 0x2000) != 0) {
      -[SAAppSizerResults enableAppSizeBreakdown](self->_appSizerResults, "enableAppSizeBreakdown");
    }
    uint64_t v18 = -[SAAppSizerScan shouldDefer:activity:](self, "shouldDefer:activity:", v42, v48);
    uint64_t v19 = v18;
    if ((_DWORD)v18)
    {
      -[SAAppSizerScan resetState:](self, "resetState:", v42);
      -[NSLock unlock](self->_pathScanLock, "unlock");
      (*((void (**)(id, uint64_t, void, void))v44 + 2))(v44, v19, 0LL, 0LL);
      v43 = 0LL;
    }

    else
    {
      if ((a5 & 0x400) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList appPathList](self->_appPathList, "appPathList"));
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_100016E6C;
        v55[3] = &unk_10004C810;
        v55[4] = self;
        [v20 enumerateKeysAndObjectsUsingBlock:v55];
      }

      uint64_t v21 = SALog(v18);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Update Paths List",  buf,  2u);
      }

      -[SAPathList updateWithAppPathList:](self->_pathList, "updateWithAppPathList:", self->_appPathList);
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SAPathList pathToBundlesSet](self->_pathList, "pathToBundlesSet"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v23 allKeys]);

      int v24 = (int)[v43 count] / 1000;
      if (v24 <= 4) {
        uint64_t v25 = 4LL;
      }
      else {
        uint64_t v25 = v24;
      }
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[SAUtilities splitArray:into:](&OBJC_CLASS___SAUtilities, "splitArray:into:", v43, v25));
      v27 = (void *)v62[5];
      v62[5] = v26;

      uint64_t v28 = -[SAAppSizerScan shouldDefer:activity:](self, "shouldDefer:activity:", v42, v48);
      uint64_t v29 = v28;
      if ((_DWORD)v28)
      {
        -[SAAppSizerScan resetState:](self, "resetState:", v42);
        -[NSLock unlock](self->_pathScanLock, "unlock");
        v30 = 0LL;
        id v31 = 0LL;
      }

      else
      {
        uint64_t v32 = SALog(v28);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v34 = [v43 count];
          *(_DWORD *)buf = 67109376;
          unsigned int v68 = v34;
          __int16 v69 = 1024;
          int v70 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "START: App Sizer Scanning Paths. Number Of Paths: (%d), Number of threads: (%d)",  buf,  0xEu);
        }

        [v9 startTimeForTimeInfoEntry:3];
        int v35 = 0;
        do
        {
          v36 = objc_opt_new(&OBJC_CLASS___SATraverse);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100016FB0;
          block[3] = &unk_10004CBB0;
          v52 = &v61;
          int v54 = v35;
          block[4] = self;
          v50 = v36;
          id v31 = v9;
          id v51 = v31;
          unint64_t v53 = a5;
          v37 = v36;
          dispatch_group_async(v47, v46, block);

          ++v35;
        }

        while ((_DWORD)v25 != v35);
        uint64_t v29 = -[SAAppSizerScan waitForScan:mode:activity:](self, "waitForScan:mode:activity:", v47, v42, v48);
        id v38 = -[NSLock unlock](self->_pathScanLock, "unlock");
        if ((_DWORD)v29)
        {
          uint64_t v39 = SALog(v38);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v68 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Stopped: App Sizer Scanning Paths Stopped With Result (%d)",  buf,  8u);
          }
        }

        else
        {
          [v31 stopTimeForTimeInfoEntry:3];
        }

        v30 = self->_appSizerResults;
      }

      (*((void (**)(id, uint64_t, SAAppSizerResults *, id))v44 + 2))(v44, v29, v30, v31);
    }
  }

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
}

- (unsigned)waitForScan:(id)a3 mode:(unint64_t)a4 activity:(id)a5
{
  uint64_t v8 = (dispatch_group_s *)a3;
  id v9 = a5;
  uint64_t v10 = SALog(v9);
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315138;
    v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Waiting for scan to complete",  (uint8_t *)&v26,  0xCu);
  }

  if (a4 == 2)
  {
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
    unsigned __int8 v16 = 0;
  }

  else if (a4 == 1)
  {
    while (1)
    {
      dispatch_time_t v13 = dispatch_time(0LL, 2000000000LL);
      uint64_t v14 = dispatch_group_wait(v8, v13);
      uint64_t v15 = -[SAAppSizerScan shouldDefer:activity:](self, "shouldDefer:activity:", 1LL, v9);
      if ((_DWORD)v15) {
        break;
      }
      if (self->_runMode == 2)
      {
        uint64_t v22 = SALog(v15);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136315138;
          v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Activity interrupted, stopping",  (uint8_t *)&v26,  0xCu);
        }

        unsigned __int8 v16 = 4;
        goto LABEL_19;
      }

      if (!v14) {
        goto LABEL_10;
      }
    }

    unsigned __int8 v16 = v15;
    uint64_t v20 = SALog(v15);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315138;
      v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Activity should defer, stopping",  (uint8_t *)&v26,  0xCu);
    }

- (void)initiatePathsScanWithBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 scanOptions:(unint64_t)a6 withReplyBlock:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  dispatch_time_t v13 = (void (**)(void, void, void, void))v12;
  if (a4 != 1 || v11)
  {
    if (-[SAAppSizerScan shouldInitiatePathsScan:withActivity:](self, "shouldInitiatePathsScan:withActivity:", a4, v11)) {
      v13[2](v13, 1LL, 0LL, 0LL);
    }
    else {
      -[SAAppSizerScan scanPathsWithRunMode:activity:scanOptions:reply:]( self,  "scanPathsWithRunMode:activity:scanOptions:reply:",  a4,  v11,  a6,  v13);
    }
  }

  else
  {
    uint64_t v14 = SALog(v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000319F4(v15, v16, v17);
    }

    v13[2](v13, 3LL, 0LL, 0LL);
  }
}

- (unint64_t)runMode
{
  return self->_runMode;
}

- (void)setRunMode:(unint64_t)a3
{
  self->_unint64_t runMode = a3;
}

- (BOOL)shouldContinueScanning
{
  return self->_shouldContinueScanning;
}

- (void)setShouldContinueScanning:(BOOL)a3
{
  self->_shouldContinueScanning = a3;
}

- (BOOL)scanInProgress
{
  return self->_scanInProgress;
}

- (void)setScanInProgress:(BOOL)a3
{
  self->_BOOL scanInProgress = a3;
}

- (SAAppSizerResults)appSizerResults
{
  return (SAAppSizerResults *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAppSizerResults:(id)a3
{
}

- (SAAppPathList)appPathList
{
  return (SAAppPathList *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAppPathList:(id)a3
{
}

- (SAPathList)pathList
{
  return (SAPathList *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPathList:(id)a3
{
}

- (NSLock)pathScanLock
{
  return (NSLock *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPathScanLock:(id)a3
{
}

- (OS_os_transaction)scanOSTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setScanOSTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end