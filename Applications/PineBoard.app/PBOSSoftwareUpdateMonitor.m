@interface PBOSSoftwareUpdateMonitor
+ (id)_instance;
+ (id)dailyReportData;
+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4;
+ (void)checkedForUpdateTriggeredManually:(BOOL)a3 forRestore:(BOOL)a4 result:(unint64_t)a5;
+ (void)initializeMonitoring;
+ (void)noteResourceFetchOfType:(unint64_t)a3 withResult:(unint64_t)a4;
+ (void)noteStage:(id)a3;
+ (void)prepareForUpdateToOSBuild:(id)a3 forRestore:(BOOL)a4 triggeredManually:(BOOL)a5;
- (BOOL)_isCancelStage:(id)a3;
- (BOOL)_isFailedStage:(id)a3;
- (BOOL)_isFinalStage:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)isRestore;
- (BOOL)triggeredManually;
- (NSString)fromHDMI;
- (NSString)fromOSBuild;
- (NSString)toOSBuild;
- (NSString)uuid;
- (NSURL)baseURL;
- (PBOSSoftwareUpdateMonitor)init;
- (id)_computeCacheDeleteSpaceDetails;
- (id)_computeDiskSpaceDetails;
- (id)_dailyReportData;
- (unint64_t)checkResult;
- (void)_checkForUpdateTriggeredManually:(BOOL)a3 forRestore:(BOOL)a4 result:(unint64_t)a5;
- (void)_issueRequestForStage:(id)a3 withData:(id)a4 retryDelay:(int64_t)a5;
- (void)_noteResourceFetchOfType:(unint64_t)a3 withResult:(unint64_t)a4;
- (void)_noteStage:(id)a3 forUUID:(id)a4;
- (void)_processAppRestart;
- (void)_processDailyReport;
- (void)_processNewUpdateAttemptToOSBuild:(id)a3 forRestore:(BOOL)a4 triggeredManually:(BOOL)a5;
- (void)_processUpdateAttemptCompleted;
- (void)setBaseURL:(id)a3;
- (void)setCheckResult:(unint64_t)a3;
- (void)setFromHDMI:(id)a3;
- (void)setFromOSBuild:(id)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setIsRestore:(BOOL)a3;
- (void)setToOSBuild:(id)a3;
- (void)setTriggeredManually:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation PBOSSoftwareUpdateMonitor

+ (void)initializeMonitoring
{
  id v2 = +[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance");
}

+ (void)checkedForUpdateTriggeredManually:(BOOL)a3 forRestore:(BOOL)a4 result:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance"));
  [v8 _checkForUpdateTriggeredManually:v7 forRestore:v6 result:a5];
}

+ (void)prepareForUpdateToOSBuild:(id)a3 forRestore:(BOOL)a4 triggeredManually:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance"));
  [v8 _processNewUpdateAttemptToOSBuild:v7 forRestore:v6 triggeredManually:v5];
}

+ (void)noteStage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  [v4 _noteStage:v3 forUUID:v5];
}

+ (void)noteResourceFetchOfType:(unint64_t)a3 withResult:(unint64_t)a4
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance"));
  [v6 _noteResourceFetchOfType:a3 withResult:a4];
}

+ (id)dailyReportData
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateMonitor _instance](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "_instance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _dailyReportData]);

  return v3;
}

- (PBOSSoftwareUpdateMonitor)init
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___PBOSSoftwareUpdateMonitor;
  id v2 = -[PBOSSoftwareUpdateMonitor init](&v38, "init");
  if (v2)
  {
    v2->_isInternalBuild = +[TVSDevice runningAnInternalBuild]( &OBJC_CLASS___TVSDevice,  "runningAnInternalBuild");
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
    fromOSBuild = v2->_fromOSBuild;
    v2->_fromOSBuild = (NSString *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVSDevice HDMIFirmwareVersion](&OBJC_CLASS___TVSDevice, "HDMIFirmwareVersion"));
    fromHDMI = v2->_fromHDMI;
    v2->_fromHDMI = (NSString *)v5;

    baseURL = v2->_baseURL;
    v2->_baseURL = 0LL;

    uint64_t v8 = pbs_persistentUUIDString();
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    unsigned __int8 v12 = objc_msgSend(v11, "pbs_shouldObliterateOnLaunch");

    char v37 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t RestoreFilePath = lastRestoreFilePath();
    v15 = (void *)objc_claimAutoreleasedReturnValue(RestoreFilePath);
    if ((v12 & 1) != 0)
    {
      id v16 = sub_1000836CC();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MON: About to obliterate. Ignoring last restore ID.",  buf,  2u);
      }
    }

    else
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v15));
      id v18 = sub_1000836CC();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "MON: Found last restore with data %{public}@",  buf,  0xCu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v17, "objectForKey:", @"lastAttemptedUUID"));
      if (v20)
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
          [v22 setLastAttemptedUUID:v20];

          v2->_isRestore = 1;
        }
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v17, "objectForKey:", @"targetOSBuild"));

      if (v23)
      {
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
          [v25 setLastAttemptedTargetOSBuild:v23];
        }
      }

      id v36 = 0LL;
      unsigned __int8 v26 = [v13 removeItemAtPath:v15 error:&v36];
      id v27 = v36;
      if ((v26 & 1) == 0)
      {
        __int128 v54 = 0u;
        memset(v55, 0, sizeof(v55));
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        *(_OWORD *)buf = 0u;
        id v28 = sub_1000836CC();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        uint64_t v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
        int v39 = 138543362;
        id v40 = v27;
        _os_log_send_and_compose_impl( v30,  0LL,  buf,  250LL,  &_mh_execute_header,  v29,  16LL,  "MON: Failed to remove last restore file [%{public}@]",  &v39,  12);
        v32 = v31;

        id v33 = sub_1000836CC();
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        _os_log_message_persist_impl(v32, 16LL, v34);

        if (v32 != buf) {
          free(v32);
        }
      }
    }

LABEL_23:
  }

  return v2;
}

- (NSURL)baseURL
{
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKeyPath:@"metrics.ATV.metricsUrl"]);

    if (v5) {
      goto LABEL_9;
    }
    __int128 v46 = 0u;
    memset(v47, 0, sizeof(v47));
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
    __int128 v35 = 0u;
    memset(buf, 0, sizeof(buf));
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    v33[0] = 0;
    _os_log_send_and_compose_impl( v8,  0LL,  buf,  250LL,  &_mh_execute_header,  v7,  16LL,  "MON: Store bag missing metrics.ATV.metricsUrl URL. Trying metrics.metricsUrl.",  v33,  2);
    v10 = v9;

    id v11 = sub_1000836CC();
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 16LL, v12);

    if (v10 != buf) {
      free(v10);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKeyPath:@"metrics.metricsUrl"]);

    if (v5)
    {
LABEL_9:
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v5,  @"2",  @"atv_ota_update"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
    }

    else
    {
      __int128 v46 = 0u;
      memset(v47, 0, sizeof(v47));
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
      __int128 v35 = 0u;
      memset(buf, 0, sizeof(buf));
      id v25 = sub_1000836CC();
      unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      v33[0] = 0;
      LODWORD(v32) = 2;
      _os_log_send_and_compose_impl( v27,  0LL,  buf,  250LL,  &_mh_execute_header,  v26,  16LL,  "MON: Store bag missing metrics.metricsUrl. No update monitoring.",  v33,  v32);
      v29 = v28;

      id v30 = sub_1000836CC();
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      _os_log_message_persist_impl(v29, 16LL, v31);

      if (v29 != buf) {
        free(v29);
      }
      uint64_t v5 = 0LL;
      v15 = 0LL;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 osSoftwareUpdateMonitoringURLOverride]);

    if ([v17 length])
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));
      if (v18)
      {
        id v19 = sub_1000836CC();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "MON: Using override URL %{public}@ (instead of %{public}@ from bag).",  buf,  0x16u);
        }

        id v21 = v18;
        v15 = v21;
      }
    }

    if (v15)
    {
      id v22 = sub_1000836CC();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "MON: Vendor bag update monitoring URL: %{public}@.",  buf,  0xCu);
      }

      -[PBOSSoftwareUpdateMonitor setBaseURL:](self, "setBaseURL:", v15);
    }

    baseURL = self->_baseURL;
  }

  return baseURL;
}

+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4
{
  byte_100471018 = 1;
  return 3LL;
}

+ (id)_instance
{
  if (qword_100471028 != -1) {
    dispatch_once(&qword_100471028, &stru_1003D8C18);
  }
  return (id)qword_100471020;
}

- (void)_checkForUpdateTriggeredManually:(BOOL)a3 forRestore:(BOOL)a4 result:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  -[PBOSSoftwareUpdateMonitor setToOSBuild:](self, "setToOSBuild:", @"check");
  -[PBOSSoftwareUpdateMonitor setIsRestore:](self, "setIsRestore:", v6);
  -[PBOSSoftwareUpdateMonitor setTriggeredManually:](self, "setTriggeredManually:", v7);
  uint64_t v9 = off_10046C310[0];
  if (a5 - 1 <= 3)
  {
    v10 = *off_1003D8C88[a5 - 1];

    uint64_t v9 = v10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor uuid](self, "uuid"));
  -[PBOSSoftwareUpdateMonitor _noteStage:forUUID:](self, "_noteStage:forUUID:", v9, v11);
}

- (void)_processNewUpdateAttemptToOSBuild:(id)a3 forRestore:(BOOL)a4 triggeredManually:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastAttemptedUUID]);

  if (v10)
  {
    id v11 = sub_1000836CC();
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      uint64_t v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "MON: Previous update attempt still present when starting new attempt - noting app restart for UUID %{public}@",  (uint8_t *)&v23,  0xCu);
    }

    -[PBOSSoftwareUpdateMonitor _processAppRestart](self, "_processAppRestart");
  }

  -[PBOSSoftwareUpdateMonitor setToOSBuild:](self, "setToOSBuild:", v8);
  -[PBOSSoftwareUpdateMonitor setIsRestore:](self, "setIsRestore:", v6);
  -[PBOSSoftwareUpdateMonitor setTriggeredManually:](self, "setTriggeredManually:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor uuid](self, "uuid"));
  [v13 setLastAttemptedUUID:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  [v15 setLastAttemptedTargetOSBuild:v8];

  id v16 = sub_1000836CC();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
    if (-[PBOSSoftwareUpdateMonitor isInternalBuild](self, "isInternalBuild")) {
      id v19 = @"Internal";
    }
    else {
      id v19 = @"Customer";
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor uuid](self, "uuid"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor baseURL](self, "baseURL"));
    int v23 = 138544386;
    id v22 = @"NO";
    uint64_t v24 = v18;
    if (!v21) {
      id v22 = @"YES";
    }
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v19;
    __int16 v29 = 2114;
    id v30 = v20;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MON: Started monitoring update from %{public}@ to %{public}@ %{public}@ with UUID %{public}@ (queueing:%@).",  (uint8_t *)&v23,  0x34u);
  }
}

- (void)_noteStage:(id)a3 forUUID:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  BOOL v7 = (__CFString *)a4;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", off_10046C3D0[0]))
  {
    -[PBOSSoftwareUpdateMonitor _processAppRestart](self, "_processAppRestart");
  }

  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", off_10046C3D8[0]))
  {
    -[PBOSSoftwareUpdateMonitor _processDailyReport](self, "_processDailyReport");
  }

  else
  {
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", off_10046C308[0]))
    {
      if (byte_100471018 != 1) {
        goto LABEL_46;
      }
      byte_100471018 = 0;
    }

    if (-[PBOSSoftwareUpdateMonitor isRestore](self, "isRestore")
      && -[__CFString isEqualToString:](v6, "isEqualToString:", off_10046C398[0]))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor toOSBuild](self, "toOSBuild"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  @"targetOSBuild",  v7,  @"lastAttemptedUUID",  0LL));

      uint64_t RestoreFilePath = lastRestoreFilePath();
      id v11 = (void *)objc_claimAutoreleasedReturnValue(RestoreFilePath);
      [v9 writeToFile:v11 atomically:1];

      +[TVSPreferences synchronizeAllDomains](&OBJC_CLASS___TVSPreferences, "synchronizeAllDomains");
    }

    if (-[PBOSSoftwareUpdateMonitor triggeredManually](self, "triggeredManually"))
    {
      unsigned __int8 v12 = @"manual";
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      unsigned int v14 = [v13 shouldAutomaticallyApplyUpdates];

      unsigned __int8 v12 = @"background";
      if (v14) {
        unsigned __int8 v12 = @"autoapply";
      }
    }

    __int128 v51 = v12;
    v15 = @"unknownStage";
    if (v6) {
      v15 = v6;
    }
    __int128 v53 = v15;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor fromOSBuild](self, "fromOSBuild"));
    __int128 v54 = (void *)v16;
    v17 = @"unknownFromOSBuild";
    if (v16) {
      v17 = (const __CFString *)v16;
    }
    __int128 v52 = v17;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor fromHDMI](self, "fromHDMI"));
    id v19 = (void *)v18;
    v20 = @"unknownFromHDMI";
    if (v18) {
      v20 = (const __CFString *)v18;
    }
    __int128 v50 = v20;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor toOSBuild](self, "toOSBuild"));
    id v22 = (void *)v21;
    int v23 = @"unknownToOSBuild";
    if (v21) {
      int v23 = (const __CFString *)v21;
    }
    __int128 v49 = v23;
    unsigned int v24 = -[PBOSSoftwareUpdateMonitor isInternalBuild](self, "isInternalBuild");
    __int16 v25 = @"customer";
    if (v24) {
      __int16 v25 = @"internal";
    }
    __int128 v48 = v25;
    if (-[PBOSSoftwareUpdateMonitor isRestore](self, "isRestore")) {
      id v26 = @"yes";
    }
    else {
      id v26 = @"no";
    }
    __int16 v27 = @"unknownClientId";
    if (v7) {
      __int16 v27 = v7;
    }
    __int128 v46 = v27;
    __int128 v47 = v26;
    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
    __int16 v29 = (void *)v28;
    if (v28) {
      id v30 = (const __CFString *)v28;
    }
    else {
      id v30 = @"unknownHW";
    }
    if (OTAImplementationType() == 2) {
      __int16 v31 = &off_1003FDC20;
    }
    else {
      __int16 v31 = &off_1003FDC38;
    }
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 updateConfigurationID]);
    v34 = (void *)v33;
    __int128 v35 = @"unknownConfig";
    if (v33) {
      __int128 v35 = (const __CFString *)v33;
    }
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v53,  @"stage",  v52,  @"fromOS",  v50,  @"fromHDMI",  v49,  @"toOS",  v48,  @"type",  v47,  @"isRestore",  v46,  @"clientId",  v30,  @"hwModel",  v31,  @"ota_implementation",  v51,  @"trigger",  v35,  @"updateConfig",  0LL));

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor baseURL](self, "baseURL"));
    if (v37)
    {
      -[PBOSSoftwareUpdateMonitor _issueRequestForStage:withData:retryDelay:]( self,  "_issueRequestForStage:withData:retryDelay:",  v6,  v36,  qword_10046C3F0);
    }

    else
    {
      memset(v57, 0, 250);
      id v38 = sub_1000836CC();
      __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        uint64_t v40 = 3LL;
      }
      else {
        uint64_t v40 = 2LL;
      }
      int v55 = 138543362;
      v56 = v36;
      LODWORD(v45) = 12;
      _os_log_send_and_compose_impl( v40,  0LL,  v57,  250LL,  &_mh_execute_header,  v39,  16LL,  "MON: No monitor URL - skipping stage %{public}@).",  &v55,  v45);
      __int128 v42 = v41;

      id v43 = sub_1000836CC();
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      _os_log_message_persist_impl(v42, 16LL, v44);

      if (v42 != v57) {
        free(v42);
      }
    }
  }

- (void)_noteResourceFetchOfType:(unint64_t)a3 withResult:(unint64_t)a4
{
  if (a3 > 3)
  {
    BOOL v7 = 0LL;
    BOOL v6 = @"no";
  }

  else
  {
    BOOL v6 = *(&off_1003D8CC8 + a3);
    BOOL v7 = *off_1003D8CA8[a3];
  }

  v21[0] = @"stage";
  v21[1] = @"vpn";
  v22[0] = v7;
  v22[1] = v6;
  v21[2] = @"fetchResult";
  if (a4) {
    id v8 = @"FAIL";
  }
  else {
    id v8 = @"OK";
  }
  v22[2] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor baseURL](self, "baseURL"));

  if (v10)
  {
    -[PBOSSoftwareUpdateMonitor _issueRequestForStage:withData:retryDelay:]( self,  "_issueRequestForStage:withData:retryDelay:",  v7,  v9,  qword_10046C3F0);
  }

  else
  {
    memset(v20, 0, 250);
    id v11 = sub_1000836CC();
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      uint64_t v13 = 3LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    int v18 = 138543362;
    id v19 = v9;
    _os_log_send_and_compose_impl( v13,  0LL,  v20,  250LL,  &_mh_execute_header,  v12,  16LL,  "MON: No monitor URL - skipping stage %{public}@).",  &v18,  12);
    v15 = v14;

    id v16 = sub_1000836CC();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _os_log_message_persist_impl(v15, 16LL, v17);

    if (v15 != v20) {
      free(v15);
    }
  }
}

- (void)_issueRequestForStage:(id)a3 withData:(id)a4 retryDelay:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor baseURL](self, "baseURL"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10013CE04;
  v13[3] = &unk_1003D8C40;
  objc_copyWeak(v17, &location);
  id v11 = v8;
  v17[1] = (id)a5;
  id v14 = v11;
  v15 = self;
  id v12 = v9;
  id v16 = v12;
  +[PBiTunesStoreMetricsUploader uploadData:withSubtopic:toURL:withCompletion:]( &OBJC_CLASS___PBiTunesStoreMetricsUploader,  "uploadData:withSubtopic:toURL:withCompletion:",  v12,  0LL,  v10,  v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_processUpdateAttemptCompleted
{
  id v3 = sub_1000836CC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor uuid](self, "uuid"));
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "MON: Update attempt completed for UUID %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  [v6 setLastAttemptedUUID:0];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  [v7 setLastAttemptedTargetOSBuild:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t RestoreFilePath = lastRestoreFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue(RestoreFilePath);
  [v8 removeItemAtPath:v10 error:0];

  -[PBOSSoftwareUpdateMonitor setToOSBuild:](self, "setToOSBuild:", 0LL);
  -[PBOSSoftwareUpdateMonitor setIsRestore:](self, "setIsRestore:", 0LL);
  -[PBOSSoftwareUpdateMonitor setTriggeredManually:](self, "setTriggeredManually:", 0LL);
}

- (void)_processAppRestart
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastAttemptedUUID]);

  id v5 = sub_1000836CC();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v20 = 138543362;
      uint64_t v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "MON: Found lastAttemptUUID %{public}@, checking for update result.",  (uint8_t *)&v20,  0xCu);
    }

    BOOL v6 = off_10046C3B8[0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastAttemptedTargetOSBuild]);

    -[PBOSSoftwareUpdateMonitor setToOSBuild:](self, "setToOSBuild:", v9);
    if ([v9 length]
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion")),
          unsigned int v11 = [v9 isEqualToString:v10],
          v10,
          v11))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 lastUpdatedFromOSBuildVersion]);

      -[PBOSSoftwareUpdateMonitor setFromOSBuild:](self, "setFromOSBuild:", v13);
      id v14 = sub_1000836CC();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        uint64_t v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "MON: targetOSBuild %{public}@ matches current OS build - update succeeded.",  (uint8_t *)&v20,  0xCu);
      }

      id v16 = off_10046C3B0[0];
      BOOL v6 = (os_log_s *)v16;
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
      -[PBOSSoftwareUpdateMonitor setFromOSBuild:](self, "setFromOSBuild:", v17);

      id v18 = sub_1000836CC();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor fromOSBuild](self, "fromOSBuild"));
        int v20 = 138412546;
        uint64_t v21 = v9;
        __int16 v22 = 2112;
        int v23 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "MON: targetOSBuild %@ did not match current OS build %@ - update failed.",  (uint8_t *)&v20,  0x16u);
      }
    }

    -[PBOSSoftwareUpdateMonitor _noteStage:forUUID:](self, "_noteStage:forUUID:", v6, v4);
  }

  else if (v7)
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "MON: No lastAttemptUUID, ignoring app restart.",  (uint8_t *)&v20,  2u);
  }
}

- (void)_processDailyReport
{
  id v3 = sub_1000836CC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MON: Processing daily report.", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor _dailyReportData](self, "_dailyReportData"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor baseURL](self, "baseURL"));

  if (v6)
  {
    if (v5)
    {
      BOOL v7 = off_10046C3D8[0];
      id v8 = [v5 copy];
      -[PBOSSoftwareUpdateMonitor _issueRequestForStage:withData:retryDelay:]( self,  "_issueRequestForStage:withData:retryDelay:",  v7,  v8,  qword_10046C3F0);

      goto LABEL_16;
    }

    __int128 v32 = 0u;
    memset(v33, 0, sizeof(v33));
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
    *(_OWORD *)buf = 0u;
    id v13 = sub_1000836CC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = 3LL;
    }
    else {
      uint64_t v14 = 2LL;
    }
    LOWORD(v18[0]) = 0;
    _os_log_send_and_compose_impl( v14,  0LL,  buf,  250LL,  &_mh_execute_header,  v10,  16LL,  "MON: No daily data - skipping daily report.",  v18,  2,  v18[0]);
  }

  else
  {
    __int128 v32 = 0u;
    memset(v33, 0, sizeof(v33));
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
    *(_OWORD *)buf = 0u;
    id v9 = sub_1000836CC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    LOWORD(v18[0]) = 0;
    _os_log_send_and_compose_impl( v11,  0LL,  buf,  250LL,  &_mh_execute_header,  v10,  16LL,  "MON: No monitor URL - skipping daily report.",  v18,  2,  v18[0]);
  }

  v15 = v12;

  id v16 = sub_1000836CC();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  _os_log_message_persist_impl(v15, 16LL, v17);

  if (v15 != buf) {
    free(v15);
  }
LABEL_16:
}

- (id)_dailyReportData
{
  uint64_t v3 = dailyReportData(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  [v5 setObject:off_10046C3D8[0] forKeyedSubscript:@"stage"];
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateMonitor uuid](self, "uuid"));
  BOOL v7 = (void *)v6;
  if (v6) {
    id v8 = (const __CFString *)v6;
  }
  else {
    id v8 = @"unknownClientId";
  }
  [v5 setObject:v8 forKeyedSubscript:@"clientId"];

  memset(v21, 0, 250);
  id v9 = sub_1000836CC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"clientId"]);
  int v19 = 138543362;
  __int128 v20 = v12;
  _os_log_send_and_compose_impl( v11,  0LL,  v21,  250LL,  &_mh_execute_header,  v10,  0LL,  "MON: Provided daily data for clientId %{public}@",  &v19,  12);
  uint64_t v14 = v13;

  id v15 = sub_1000836CC();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  _os_log_message_persist_impl(v14, 0LL, v16);

  if (v14 != v21) {
    free(v14);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v5));

  return v17;
}

- (id)_computeDiskSpaceDetails
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  if (statfs("/var/mobile/", &v32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002856A0();
    }
  }

  else
  {
    uint64_t SpaceInfo = APFSVolumeGetSpaceInfo(v32.f_mntfromname, &v31, &v30);
    if ((_DWORD)SpaceInfo)
    {
      uint64_t v4 = SpaceInfo;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100285634(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

  if (statfs("/", &v32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002855C0();
    }
  }

  else
  {
    uint64_t v12 = APFSVolumeGetSpaceInfo(v32.f_mntfromname, &v29, &v28);
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100285554(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v31,  v28));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v21,  @"ota_datasizespace");

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v30));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v22,  @"ota_datausedspace");

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v29));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v23, @"ota_ossizespace");

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v28));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v24, @"ota_osusedspace");

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v29 - (v28 + v30)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v25, @"ota_freespace");

  id v26 = -[NSMutableDictionary copy](v2, "copy");
  return v26;
}

- (id)_computeCacheDeleteSpaceDetails
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10013DE34;
  v6[3] = &unk_1003D8C68;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v2 = v7;
  uint64_t v3 = objc_retainBlock(v6);
  ((void (*)(void *, uint64_t, const __CFString *))v3[2])(v3, 1LL, @"ota_cd_speculativespace");
  ((void (*)(void *, uint64_t, const __CFString *))v3[2])(v3, 2LL, @"ota_cd_userinitiatedspace");
  ((void (*)(void *, uint64_t, const __CFString *))v3[2])(v3, 3LL, @"ota_cd_essentialspace");
  id v4 = -[NSMutableDictionary copy](v2, "copy");

  return v4;
}

- (BOOL)_isCancelStage:(id)a3
{
  return [a3 isEqualToString:off_10046C360[0]];
}

- (BOOL)_isFailedStage:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:off_10046C338[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C358[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C378[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C380[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C388[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C390[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C3A0[0]] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:off_10046C3A8[0]];
  }

  return v4;
}

- (BOOL)_isFinalStage:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:off_10046C3B0[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C350[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C3B8[0]] & 1) != 0
    || ([v3 isEqualToString:off_10046C3C0[0]] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:off_10046C3C8[0]];
  }

  return v4;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)fromOSBuild
{
  return self->_fromOSBuild;
}

- (void)setFromOSBuild:(id)a3
{
}

- (NSString)fromHDMI
{
  return self->_fromHDMI;
}

- (void)setFromHDMI:(id)a3
{
}

- (NSString)toOSBuild
{
  return self->_toOSBuild;
}

- (void)setToOSBuild:(id)a3
{
}

- (unint64_t)checkResult
{
  return self->_checkResult;
}

- (void)setCheckResult:(unint64_t)a3
{
  self->_checkResult = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)triggeredManually
{
  return self->_triggeredManually;
}

- (void)setTriggeredManually:(BOOL)a3
{
  self->_triggeredManually = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end