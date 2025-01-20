@interface MSDOSUpdaterController
+ (id)sharedInstance;
- (BOOL)cleanup;
- (BOOL)doesAvailableUpdateVersion:(id)a3 andUpdateBuild:(id)a4 matchExpectedUpdateVersion:(id)a5 andUpdateBuild:(id)a6;
- (BOOL)installUpdateKicked;
- (BOOL)isOSUpdateInProgress;
- (BOOL)purged;
- (BOOL)scanDownloadFailedFlag;
- (BOOL)started;
- (MSDOSUpdaterController)init;
- (NSString)expectedOSBuild;
- (NSString)expectedOSVersion;
- (OS_dispatch_semaphore)scanFinish;
- (PBSOSUpdateDownload)lastDownload;
- (PBSOSUpdateManagerClient)manager;
- (id)prettyPrintSUDescriptor:(id)a3;
- (void)bail:(const char *)a3 error:(id)a4;
- (void)client:(id)a3 automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 downloadWasInvalidatedForNewUpdateAvailable:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidFinish:(id)a4;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)client:(id)a3 scanDidCompleteWithNewUpdateAvailable:(id)a4 error:(id)a5;
- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 update:(id)a5 error:(id)a6;
- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4;
- (void)downloadFailed:(id)a3;
- (void)downloadProgressChanged:(id)a3 withPercent:(float)a4;
- (void)saveAvailableOSVersion:(id)a3 andOSBuild:(id)a4;
- (void)setExpectedOSBuild:(id)a3;
- (void)setExpectedOSVersion:(id)a3;
- (void)setInstallUpdateKicked:(BOOL)a3;
- (void)setLastDownload:(id)a3;
- (void)setManager:(id)a3;
- (void)setPurged:(BOOL)a3;
- (void)setScanDownloadFailedFlag:(BOOL)a3;
- (void)setScanFinish:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)startOSUpdate;
@end

@implementation MSDOSUpdaterController

+ (id)sharedInstance
{
  if (qword_100125430 != -1) {
    dispatch_once(&qword_100125430, &stru_1000FA020);
  }
  return (id)qword_100125428;
}

- (MSDOSUpdaterController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDOSUpdaterController;
  v2 = -[MSDOSUpdaterController init](&v6, "init");
  if (v2)
  {
    v3 = -[PBSOSUpdateManagerClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___PBSOSUpdateManagerClient),  "initWithDelegate:",  v2);
    manager = v2->_manager;
    v2->_manager = v3;

    v2->_scanDownloadFailedFlag = 0;
  }

  return v2;
}

- (BOOL)isOSUpdateInProgress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 previousiOSBuild]);

  if (v3)
  {
    id v4 = sub_10003A95C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "An OS update is already in progress!", v7, 2u);
    }
  }

  return v3 != 0LL;
}

- (void)startOSUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previousiOSBuild]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 getOSUpdateRequest]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"OSVersion"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"_"]);

  if ([v7 count]) {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
  }
  else {
    v8 = 0LL;
  }
  else {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
  }
  -[MSDOSUpdaterController setExpectedOSVersion:](self, "setExpectedOSVersion:", v8);
  -[MSDOSUpdaterController setExpectedOSBuild:](self, "setExpectedOSBuild:", v9);
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 OSBuild]);
    unsigned __int8 v11 = [v4 isEqualToString:v10];

    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v46 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "OS build number didn't change, still %{public}@, indicating a non-successful OS update.",  buf,  0xCu);
      }

      [v3 clearCurrentiOSBuild];
      [v3 clearOSUpdateRequest];
      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", 0LL);
    }

    else
    {
      if (v14)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v3 OSBuild]);
        *(_DWORD *)buf = 138543618;
        v46 = v4;
        __int16 v47 = 2114;
        v48 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "OS build has been changed from %{public}@ to %{public}@, indicating a successful OS update.",  buf,  0x16u);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v32 updateStage:14];

      id v33 = sub_10003A95C();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Waiting for data migration to finish",  buf,  2u);
      }

      DMPerformMigrationIfNeeded();
      id v35 = sub_10003A95C();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Data migration finished.", buf, 2u);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
      [v37 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

      v38 = (void *)objc_claimAutoreleasedReturnValue( +[MSDConfigurationProfileManager sharedInstance]( &OBJC_CLASS___MSDConfigurationProfileManager,  "sharedInstance"));
      [v38 installDefaultConfigurationProfile];

      sleep(0xB4u);
      [v3 clearCurrentiOSBuild];
      [v3 clearOSUpdateRequest];
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
      [v39 disableCoreAnalticsTransformSampling];

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10004C468;
      v43[3] = &unk_1000F9F48;
      id v44 = v3;
      [v44 waitForBuddy:v43];
    }
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v15 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

    id v16 = sub_10003A95C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Wait for some extra time to make sure everything get ready for OS update.",  buf,  2u);
    }

    sleep(0x1Eu);
    -[MSDOSUpdaterController cleanup](self, "cleanup");
    id v18 = sub_10003A95C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Wait for some extra time to make sure that the cancelDownload and purgeDownload complete before starting a scan.",  buf,  2u);
    }

    sleep(0x1Eu);
    if (v8)
    {
      -[MSDOSUpdaterController setStarted:](self, "setStarted:", 1LL);
      id v20 = sub_10003A95C();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting to scan for updates...", buf, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v22 updateStage:23];

      [v3 clearMinOSVersionAvailable];
      -[MSDOSUpdaterController setInstallUpdateKicked:](self, "setInstallUpdateKicked:", 0LL);
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0LL);
      -[MSDOSUpdaterController setScanFinish:](self, "setScanFinish:", v23);

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10004C474;
      v42[3] = &unk_1000FA070;
      v42[4] = self;
      v24 = objc_retainBlock(v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
      [v25 scanForUpdates:0 withResult:v24];

      v26 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController scanFinish](self, "scanFinish"));
      dispatch_time_t v27 = dispatch_time(0LL, 30000000000LL);
      dispatch_semaphore_wait(v26, v27);

      if (-[MSDOSUpdaterController scanDownloadFailedFlag](self, "scanDownloadFailedFlag"))
      {
        id v28 = sub_10003A95C();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Rerunning [SUManagerClient scanForUpdates:withResult].",  buf,  2u);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
        [v30 scanForUpdates:0 withResult:v24];
      }
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741032LL,  @"OS update failed."));
      id v40 = sub_10003A95C();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "UpdateOS command was sent in an invalid format.",  buf,  2u);
      }

      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", v24);
    }
  }
}

- (BOOL)cleanup
{
  if (!-[MSDOSUpdaterController purged](self, "purged"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v3 clearCurrentiOSBuild];

    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004C94C;
    v21[3] = &unk_1000FA048;
    objc_super v6 = v4;
    v22 = v6;
    [v5 cancelDownload:v21];

    dispatch_time_t v7 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v6, v7))
    {
      id v8 = sub_10003A95C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Didn't wait long enough for canceling other ongoing software update downloads.",  buf,  2u);
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004CA88;
    v18[3] = &unk_1000FA048;
    unsigned __int8 v11 = v6;
    v19 = v11;
    [v10 purgeDownload:v18];

    dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v11, v12))
    {
      id v13 = sub_10003A95C();
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Didn't wait long enough for purge to complete.",  buf,  2u);
      }
    }

    id v15 = sub_10003A95C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Clean up is done.", buf, 2u);
    }

    -[MSDOSUpdaterController setPurged:](self, "setPurged:", 1LL);
  }

  return 0;
}

- (void)bail:(const char *)a3 error:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)3727741185
      || (uint64_t)[v7 code] > 3727741029 && (uint64_t)objc_msgSend(v7, "code") < 3727741034)
    {
      id v8 = sub_10003A95C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100098F88((uint64_t)a3, v7);
      }

      id v10 = v7;
    }

    else
    {
      id v16 = sub_10003A95C();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100098F88((uint64_t)a3, v7);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:reason:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:reason:",  3727741032LL,  @"OS update failed.",  v18));
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    BOOL v14 = v13;
    id v15 = v7;
  }

  else
  {
    id v11 = sub_10003A95C();
    dispatch_time_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100098F14((uint64_t)a3, v12);
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741032LL,  @"OS update failed."));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    BOOL v14 = v13;
    id v15 = v10;
  }

  [v13 sendOSUpdateFailureEvent:v15];

  -[MSDOSUpdaterController cleanup](self, "cleanup");
  if ([v7 code] != (id)3727741185)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v19 demoUpdateFailed:v10];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    uint64_t v21 = (uint64_t)[v20 timeShowingFatalError];

    if ((_DWORD)v21)
    {
      id v22 = sub_10003A95C();
      dispatch_semaphore_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v26[0] = 67109120;
        v26[1] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Override MSDTimeShowingFatalError timeout: %u",  (uint8_t *)v26,  8u);
      }
    }

    else
    {
      uint64_t v21 = 900LL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
    id v25 = [v24 setCompletionTimeForFatalError:v21];
  }
}

- (BOOL)doesAvailableUpdateVersion:(id)a3 andUpdateBuild:(id)a4 matchExpectedUpdateVersion:(id)a5 andUpdateBuild:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = 0;
  if (v9 && v11)
  {
    if ([v11 length])
    {
      unsigned int v14 = [v9 isEqualToString:v11];
      unsigned int v13 = v14;
      if (!v12 || !v14) {
        goto LABEL_11;
      }
    }

    else if (!v12)
    {
LABEL_10:
      unsigned int v13 = 1;
      goto LABEL_11;
    }

    if ([v12 length])
    {
      unsigned int v13 = [v10 isEqualToString:v12];
      goto LABEL_11;
    }

    goto LABEL_10;
  }

- (void)saveAvailableOSVersion:(id)a3 andOSBuild:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v10)
  {
    if (v5) {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v10, v5));
    }
    else {
      id v7 = v10;
    }
    id v8 = v7;
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [v9 saveMinOSVersionAvailable:v8];
}

- (id)prettyPrintSUDescriptor:(id)a3
{
  id v3 = a3;
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBSOSUpdateDescriptor, v4);
  id v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v3 updateType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 humanReadableUpdateName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 productSystemName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 releaseType]);
  id v14 = [v3 downloadSize];

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%p] Update type: %lu, Update name: %@, System name: %@, OS version: %@, Build version: %@, Release type: %@, Download size: %lld>",  v7,  self,  v8,  v9,  v10,  v11,  v12,  v13,  v14));
  return v15;
}

- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ScanRequest started\n", v6, 2u);
  }
}

- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 update:(id)a5 error:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ScanRequest finishedForOptions called.",  (uint8_t *)&v15,  2u);
  }

  id v12 = sub_10003A95C();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v14)
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v15, 0xCu);
    }
  }

  else
  {
    if (v14)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No update found.", (uint8_t *)&v15, 2u);
    }

    -[MSDOSUpdaterController bail:error:]( self,  "bail:error:",  "-[MSDOSUpdaterController client:scanRequestDidFinishForOptions:update:error:]",  v9);
  }
}

- (void)client:(id)a3 scanDidCompleteWithNewUpdateAvailable:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ScanRequest completeWithNewUpdateAvailable.",  buf,  2u);
  }

  if (!a4)
  {
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No update found.", v12, 2u);
    }

    -[MSDOSUpdaterController bail:error:]( self,  "bail:error:",  "-[MSDOSUpdaterController client:scanDidCompleteWithNewUpdateAvailable:error:]",  v7);
  }
}

- (void)client:(id)a3 automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a4 withError:(id)a5
{
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[MSDOSUpdaterController client:automaticDownloadDidFailToStartForNewUpdateAvailable:withError:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Automatic download failed.",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdateAvailable:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:reason:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:reason:",  3727741032LL,  @"OS update failed.",  @"OTA downnload invalidated."));
  -[MSDOSUpdaterController bail:error:]( self,  "bail:error:",  "-[MSDOSUpdaterController client:downloadWasInvalidatedForNewUpdateAvailable:]",  v5);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Download started for new update\n", v7, 2u);
  }

  if (-[MSDOSUpdaterController started](self, "started")) {
    -[MSDOSUpdaterController setPurged:](self, "setPurged:", 0LL);
  }
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 phase]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
  [v8 percentComplete];
  float v10 = v9;

  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    int v15 = v7;
    __int16 v16 = 2050;
    double v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Download progress: phase:%{public}@ percent:%{public}f",  (uint8_t *)&v14,  0x16u);
  }

  *(float *)&double v13 = v10;
  -[MSDOSUpdaterController downloadProgressChanged:withPercent:](self, "downloadProgressChanged:withPercent:", v7, v13);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    float v10 = "-[MSDOSUpdaterController client:downloadDidFail:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[MSDOSUpdaterController downloadFailed:](self, "downloadFailed:", v6);
}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
  id v5 = a4;
  if (!-[MSDOSUpdaterController installUpdateKicked](self, "installUpdateKicked")
    && -[MSDOSUpdaterController started](self, "started"))
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptor]);
      *(_DWORD *)buf = 136315394;
      int v15 = "-[MSDOSUpdaterController client:downloadDidFinish:]";
      __int16 v16 = 2114;
      double v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Download completed successfully. Kicking install:%{public}@.",  buf,  0x16u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004D974;
    v13[3] = &unk_1000FA048;
    v13[4] = self;
    int v9 = objc_retainBlock(v13);
    float v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    [v10 updateStage:19];

    -[MSDOSUpdaterController setInstallUpdateKicked:](self, "setInstallUpdateKicked:", 1LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptor]);
    [v11 installUpdate:v12 withOptions:0 withResult:v9];
  }
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v4 saveCurrentiOSBuild];

    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Installation started.", v7, 2u);
    }
  }

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    float v10 = "-[MSDOSUpdaterController client:installDidFail:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  if (-[MSDOSUpdaterController started](self, "started")) {
    -[MSDOSUpdaterController bail:error:]( self,  "bail:error:",  "-[MSDOSUpdaterController client:installDidFail:withError:]",  v6);
  }
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
  {
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[MSDOSUpdaterController client:installDidFinish:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }
  }

- (void)downloadProgressChanged:(id)a3 withPercent:(float)a4
{
  id v6 = a3;
  if (-[MSDOSUpdaterController started](self, "started"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
    id v17 = 0LL;
    unsigned int v8 = [v7 shouldCleanUp:&v17];
    id v9 = v17;

    if (v8)
    {
      -[MSDOSUpdaterController setStarted:](self, "setStarted:", 0LL);
      float v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
      [v10 demoUpdateFailed:v9];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
      [v11 cancelDownload:&stru_1000FA0B0];
    }

    id v12 = sub_10003A95C();
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Download/Prepare progress: %{public}@: %lf",  buf,  0x16u);
    }

    if ([v6 isEqualToString:@"SUDownloadPhaseFetching"])
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
      int v15 = v14;
      uint64_t v16 = (uint64_t)(float)(a4 * 50.0);
LABEL_11:
      [v14 demoUpdateProgress:v16];

      goto LABEL_12;
    }

    if ([v6 isEqualToString:@"SUDownloadPhasePreparingForInstallation"])
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
      int v15 = v14;
      uint64_t v16 = (uint64_t)(float)(a4 * 50.0) + 50;
      goto LABEL_11;
    }
  }

  else
  {
    id v9 = 0LL;
  }

- (void)downloadFailed:(id)a3
{
  id v4 = a3;
  if (-[MSDOSUpdaterController started](self, "started"))
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Download failed.", v7, 2u);
    }

    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController downloadFailed:]", v4);
  }
}

- (NSString)expectedOSVersion
{
  return self->_expectedOSVersion;
}

- (void)setExpectedOSVersion:(id)a3
{
}

- (NSString)expectedOSBuild
{
  return self->_expectedOSBuild;
}

- (void)setExpectedOSBuild:(id)a3
{
}

- (PBSOSUpdateManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (PBSOSUpdateDownload)lastDownload
{
  return self->_lastDownload;
}

- (void)setLastDownload:(id)a3
{
}

- (BOOL)scanDownloadFailedFlag
{
  return self->_scanDownloadFailedFlag;
}

- (void)setScanDownloadFailedFlag:(BOOL)a3
{
  self->_scanDownloadFailedFlag = a3;
}

- (OS_dispatch_semaphore)scanFinish
{
  return self->_scanFinish;
}

- (void)setScanFinish:(id)a3
{
}

- (BOOL)installUpdateKicked
{
  return self->_installUpdateKicked;
}

- (void)setInstallUpdateKicked:(BOOL)a3
{
  self->_installUpdateKicked = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)purged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (void).cxx_destruct
{
}

@end