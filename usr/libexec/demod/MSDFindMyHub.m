@interface MSDFindMyHub
+ (id)sharedInstance;
- (BOOL)askFindMyHubForHubInfo:(id *)a3;
- (BOOL)compareSavedHubHostNameWithNewHostName;
- (BOOL)compareSavedHubHostsWithNewHosts;
- (BOOL)discoverAndEnrollWithHub:(id *)a3;
- (BOOL)enrollAndSetup:(id *)a3;
- (BOOL)isLogicSync;
- (MSDTargetDevice)device;
- (NSArray)serverList;
- (NSMutableString)storesSearched;
- (NSSet)helpMenuUserTapped;
- (NSString)autoEnrollmentStoreId;
- (NSString)hubHostName;
- (NSString)hubPort;
- (NSTimer)retryTimer;
- (double)autoEnrollmentTimeStamp;
- (id)prepareBundleInfoDictionary;
- (id)prepareHubOfflineDurationString;
- (int64_t)getDefaultRetryDelay;
- (unint64_t)queryFindMyHubAndDetermineLogicSyncResult;
- (void)cellularPlanDidChange:(id)a3;
- (void)handleEnrollmentRetryUponFirstLaunch;
- (void)handleRetryTimerFireForEnrollment:(id)a3;
- (void)retryEnrollmentWithHub:(BOOL)a3;
- (void)scheduleRetryTimerForEnrollmentAtDate:(id)a3 isFirstLaunch:(BOOL)a4;
- (void)setAutoEnrollmentInfo:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5;
- (void)setAutoEnrollmentStoreId:(id)a3;
- (void)setAutoEnrollmentTimeStamp:(double)a3;
- (void)setDevice:(id)a3;
- (void)setHelpMenuUserTapped:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setIsLogicSync:(BOOL)a3;
- (void)setRetryTimer:(id)a3;
- (void)setServerList:(id)a3;
- (void)setStoresSearched:(id)a3;
- (void)tryScheduleDefaultEnrollmentRetry;
@end

@implementation MSDFindMyHub

+ (id)sharedInstance
{
  if (qword_1001254D8 != -1) {
    dispatch_once(&qword_1001254D8, &stru_1000FA458);
  }
  return (id)qword_1001254D0;
}

- (void)handleEnrollmentRetryUponFirstLaunch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  id v4 = [v3 typeOfDemoDevice];

  __int16 v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  unsigned __int8 v6 = [v5 isDemoEligible];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getDemoEnrollmentFlag]);
  unsigned int v9 = [v8 isEqualToString:@"enrollmentSuccess"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
  [v10 getDemoUpdateInProgress:(char *)&v31 + 1 operationAllowed:&v31];

  if ((v6 & 1) == 0)
  {
    id v14 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v13 = "Device is not demo eligible, skipping enrollment retry";
      goto LABEL_7;
    }

- (void)setAutoEnrollmentInfo:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5
{
  v8 = (NSString *)a4;
  unsigned int v9 = (NSSet *)a5;
  self->_autoEnrollmentTimeStamp = a3;
  autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
  self->_autoEnrollmentStoreId = v8;
  v12 = v8;

  helpMenuUserTapped = self->_helpMenuUserTapped;
  self->_helpMenuUserTapped = v9;
}

- (BOOL)discoverAndEnrollWithHub:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  id v6 = [v5 typeOfDemoDevice];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[MSDFindMyHub setIsLogicSync:](self, "setIsLogicSync:", 0LL);
  if (v6 == (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  self->_autoEnrollmentTimeStamp));
    [v7 setObject:v8 forKey:@"AutoEnrollmentTimeStamp"];

    autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
    if (autoEnrollmentStoreId) {
      [v7 setObject:autoEnrollmentStoreId forKey:@"AutoEnrollmentSelectedStoreID"];
    }
    helpMenuUserTapped = self->_helpMenuUserTapped;
    if (helpMenuUserTapped) {
      [v7 setObject:helpMenuUserTapped forKey:@"AutoEnrollmentHelpMenuUserTapped"];
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getCurrentDeviceLanguage]);
    [v7 setObject:v12 forKey:@"AutoEnrollmentLanguageCodeInfo"];

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 getCurrentDeviceRegion]);
    [v7 setObject:v14 forKey:@"AutoEnrollmentCountryCodeInfo"];

    storesSearched = self->_storesSearched;
    if (storesSearched) {
      [v7 setObject:storesSearched forKey:@"AutoEnrollmentStoresSearchedInfo"];
    }
  }

  id v31 = 0LL;
  unsigned int v16 = -[MSDFindMyHub askFindMyHubForHubInfo:](self, "askFindMyHubForHubInfo:", &v31);
  id v17 = v31;
  id v18 = v17;
  if (!v16)
  {
    id v20 = v17;
    goto LABEL_17;
  }

  id v30 = v17;
  unsigned int v19 = -[MSDFindMyHub enrollAndSetup:](self, "enrollAndSetup:", &v30);
  id v20 = v30;

  if (!v19)
  {
LABEL_17:
    if (a3) {
      *a3 = v20;
    }
    if (v6 != (id)5)
    {
      BOOL v21 = 0;
      goto LABEL_15;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    [v7 setObject:v28 forKey:@"AutoEnrollmentStatus"];

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v20 code]));
    [v7 setObject:v29 forKey:@"ErrorCode"];

    BOOL v21 = 0;
LABEL_12:
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
    [v7 setObject:v25 forKey:@"ErrorMessage"];

    goto LABEL_13;
  }

  if (v6 != (id)5)
  {
    BOOL v21 = 1;
    goto LABEL_15;
  }

  BOOL v21 = 1;
  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v7 setObject:v22 forKey:@"AutoEnrollmentStatus"];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v20 code]));
  [v7 setObject:v23 forKey:@"ErrorCode"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
  if (v24) {
    goto LABEL_12;
  }
LABEL_13:
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
  [v26 sendAutoEnrollmentResults:v7];

LABEL_15:
  return v21;
}

- (unint64_t)queryFindMyHubAndDetermineLogicSyncResult
{
  if (-[MSDFindMyHub askFindMyHubForHubInfo:](self, "askFindMyHubForHubInfo:", 0LL))
  {
    if (-[MSDFindMyHub compareSavedHubHostNameWithNewHostName](self, "compareSavedHubHostNameWithNewHostName")) {
      uint64_t v3 = 0LL;
    }
    else {
      uint64_t v3 = 2LL;
    }
    if (-[MSDFindMyHub compareSavedHubHostsWithNewHosts](self, "compareSavedHubHostsWithNewHosts")) {
      unint64_t v4 = v3;
    }
    else {
      unint64_t v4 = v3 | 4;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Logic sync completed with result - %lu",  (uint8_t *)&v8,  0xCu);
  }

  return v4;
}

- (void)cellularPlanDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  unsigned int v6 = [v5 dcotaOfflineModeDevice];

  if (v6)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) objectForKey:@"SimType"]);
          if ([v12 isEqualToNumber:&off_100106498])
          {
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
            id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10005E77C;
            block[3] = &unk_1000F9768;
            block[4] = self;
            dispatch_async(v14, block);

            goto LABEL_12;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (int64_t)getDefaultRetryDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  int64_t v3 = (int64_t)[v2 findMyHubRetryDelay];

  if (v3 < 1) {
    return 3600LL;
  }
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Overriding FMH retry delay to: %ld",  (uint8_t *)&v7,  0xCu);
  }

  return v3;
}

- (BOOL)askFindMyHubForHubInfo:(id *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___MSDFMHRequest);
  -[MSDFMHRequest setLogicSync:](v5, "setLogicSync:", -[MSDFindMyHub isLogicSync](self, "isLogicSync"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub prepareBundleInfoDictionary](self, "prepareBundleInfoDictionary"));
  -[MSDFMHRequest setBundleInfo:](v5, "setBundleInfo:", v6);

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub prepareHubOfflineDurationString](self, "prepareHubOfflineDurationString"));
  -[MSDFMHRequest setOfflineDuration:](v5, "setOfflineDuration:", v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getCurrentDeviceLanguage]);
  -[MSDFMHRequest setLanguage:](v5, "setLanguage:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getCurrentDeviceRegion]);
  -[MSDFMHRequest setCountryCode:](v5, "setCountryCode:", v11);

  if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredStoreID]);
    -[MSDFMHRequest setStoreId:](v5, "setStoreId:", v13);
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 demoUnitServerURL]);

    if (v15)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 host]);
      -[MSDCommandServerRequest setServer:](v5, "setServer:", v16);

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 port]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
      -[MSDCommandServerRequest setPort:](v5, "setPort:", v18);

      -[MSDDemoUnitServerRequest setUrlOverride:](v5, "setUrlOverride:", v15);
    }
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 handleRequestSync:v5]);

  id v22 = (id)objc_claimAutoreleasedReturnValue([v20 error]);
  if (v22 || (uint64_t v23 = objc_opt_class(&OBJC_CLASS___MSDFMHResponse, v21), (objc_opt_isKindOfClass(v20, v23) & 1) == 0))
  {
    id v46 = sub_10003A95C();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_10009AE60((uint64_t)v22, v47, v48, v49, v50, v51, v52, v53);
    }

    v24 = 0LL;
    goto LABEL_25;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v20 retryAfter]);
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v20 fmhDict]);
  id v26 = sub_10003A95C();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v80 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "FindMyHub returned: %{public}@", buf, 0xCu);
  }

  if (!v25)
  {
    if (v24 && (uint64_t)[v24 integerValue] >= 1)
    {
      id v59 = sub_10003A95C();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v80 = (uint64_t)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "FindMyHub asked for retry in %{public}@ seconds.",  buf,  0xCu);
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)[v24 integerValue]));
      if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync")) {
        -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:]( self,  "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:",  v61,  0LL);
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
      [v61 timeIntervalSinceReferenceDate];
      [v62 saveFindMyHubRetryAtTime:(uint64_t)v63];

      if ((uint64_t)[v24 integerValue] >= 31536000)
      {
        id v65 = sub_10003A95C();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          id v67 = [v24 integerValue];
          *(_DWORD *)buf = 134218240;
          uint64_t v80 = 31536000LL;
          __int16 v81 = 2048;
          id v82 = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "FindMyHub retry value %lu is greater than or equal to threshold %lu, returning unrecoverable error",  buf,  0x16u);
        }

        id v22 = 0LL;
      }

      else
      {
        id v78 = 0LL;
        sub_100087610(&v78, 3727740936LL, (uint64_t)@"Server requested retry at a later time.");
        id v22 = v78;
      }

      goto LABEL_26;
    }

- (id)prepareBundleInfoDictionary
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    id v5 = [v4 typeOfDemoDevice];

    if (v5 == (id)5)
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 readPlistFile:@"/private/var/demo_backup/Metadata/Content.plist"]);

      int64_t v3 = (NSDictionary *)v7;
      if (!v7)
      {
        id v8 = sub_10003A95C();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10009AEF0();
        }

        int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      }

      if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v3))
      {
        id v10 = sub_10003A95C();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10009AEC4();
        }

        v12 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
        int64_t v3 = v12;
      }
    }
  }

  id v13 = sub_10003A95C();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    __int128 v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Bundle Info for FindMyHub: %{public}@",  (uint8_t *)&v16,  0xCu);
  }

  return v3;
}

- (id)prepareHubOfflineDurationString
{
  if (-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    uint64_t v4 = (uint64_t)[v3 hubLastOnlineTime];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;

    if (v4 < 1 || (uint64_t v8 = (uint64_t)v7 - v4, (uint64_t)v7 <= v4))
    {
      id v9 = sub_10003A95C();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to calculate hub last online time. Use system-up time instead.",  buf,  2u);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v11 systemUptime];
      uint64_t v8 = (uint64_t)v12;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v8));
    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Hub has been offline for %{public}@ seconds.",  buf,  0xCu);
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (void)scheduleRetryTimerForEnrollmentAtDate:(id)a3 isFirstLaunch:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005F430;
  block[3] = &unk_1000FA480;
  BOOL v9 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)handleRetryTimerFireForEnrollment:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"isFirstLaunch"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 demoUpdateQueue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005F704;
  v9[3] = &unk_1000FA4A8;
  v9[4] = self;
  unsigned __int8 v10 = v6;
  dispatch_async(v8, v9);
}

- (void)retryEnrollmentWithHub:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
  unsigned __int8 v6 = [v5 isOfflineMode];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getDemoEnrollmentFlag]);

  if ([v8 isEqualToString:@"enrollmentSuccess"])
  {
    id v9 = sub_10003A95C();
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Enrollment successful, ignoring enrollment retry",  buf,  2u);
    }
  }

  else
  {
    if ((v6 & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
      [v11 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];
    }

    if (v3)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      [v12 configureNetworkInterface];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      [v13 waitForNetworkReachability];
    }

    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 getDemoEnrollmentFlag]);
      *(_DWORD *)buf = 136315394;
      id v26 = "-[MSDFindMyHub retryEnrollmentWithHub:]";
      __int16 v27 = 2114;
      v28 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: requesting discoverAndEnrollWithHub, currentEnrollFlag:%{public}@",  buf,  0x16u);
    }

    id v24 = 0LL;
    unsigned int v18 = -[MSDFindMyHub discoverAndEnrollWithHub:](v4, "discoverAndEnrollWithHub:", &v24);
    unsigned __int8 v10 = (os_log_s *)v24;
    if (v18)
    {
      -[MSDFindMyHub cancelOfflineModeEnrollmentRetry](v4, "cancelOfflineModeEnrollmentRetry");
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      [v19 setDemoEnrollmentFlag:@"enrollmentSuccess"];
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      [v20 setDemoEnrollmentFlag:@"enrollmentFailed"];

      if ((v6 & 1) == 0)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
        [v21 stopFullScreenUI:v10];
      }

      id v22 = sub_10003A95C();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = (const char *)v10;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enrollment retry failed with error: %{public}@",  buf,  0xCu);
      }
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)enrollAndSetup:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
  if (v5
    && (unsigned __int8 v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort")),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    [v9 configureNetworkInterface];

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    [v10 waitForNetworkReachability];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort"));
    id v25 = 0LL;
    unsigned __int8 v13 = [v8 enrollForDeviceName:0 pairingCredential:0 hubHostName:v11 hubPort:v12 error:&v25];
    id v14 = (os_log_s *)v25;

    if ((v13 & 1) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub serverList](self, "serverList"));
      [v15 saveHubHostNameList:v16];

      BOOL v17 = 1;
      goto LABEL_14;
    }

    id v20 = sub_10003A95C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "-[MSDFindMyHub enrollAndSetup:]";
      __int16 v28 = 2114;
      uint64_t v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: enrollment failed with error: %{public}@",  buf,  0x16u);
    }

    -[MSDFindMyHub tryScheduleDefaultEnrollmentRetry](self, "tryScheduleDefaultEnrollmentRetry");
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741088LL,  @"Cannot enroll the device with vHub."));
  }

  else
  {
    id v18 = sub_10003A95C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009AF1C(self, v14);
    }
    uint64_t v8 = 0LL;
    __int128 v19 = 0LL;
  }

  id v24 = v19;
  sub_100087694(&v24, 3727744512LL, @"Cannot enroll the device with vHub.");
  id v14 = (os_log_s *)v24;

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
  [v22 sendEnrollmentFailureEvent:v14];

  if (a3)
  {
    id v14 = v14;
    BOOL v17 = 0;
    *a3 = v14;
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)compareSavedHubHostNameWithNewHostName
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hubHostNameList]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hubHostName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

  if ([v7 hasSuffix:@"."])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 1));

    id v7 = (void *)v8;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "lowercaseString", (void)v19));
        if ([v14 hasSuffix:@"."])
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", (char *)objc_msgSend( v14,  "length") - 1));

          id v14 = (void *)v15;
        }

        unsigned __int8 v16 = [v14 isEqualToString:v7];

        if ((v16 & 1) != 0)
        {
          BOOL v17 = 1;
          goto LABEL_15;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)compareSavedHubHostsWithNewHosts
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hubHostNameList]);

  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        else {
          id v12 = v11;
        }
        unsigned __int8 v13 = v12;
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
        [v3 addObject:v14];
      }

      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v8);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub serverList](self, "serverList", 0LL));
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        __int128 v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
        else {
          id v21 = v20;
        }
        __int128 v22 = v21;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 lowercaseString]);
        [v4 addObject:v23];
      }

      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v17);
  }

  unsigned __int8 v24 = [v3 isEqualToSet:v4];
  return v24;
}

- (void)tryScheduleDefaultEnrollmentRetry
{
  if (-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    id v3 = sub_10003A95C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: not scheduling default enrollment retry for logic sync",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    uint64_t v5 = -[MSDFindMyHub getDefaultRetryDelay](self, "getDefaultRetryDelay");
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: retrying enrollment in %ld seconds",  (uint8_t *)&v11,  0x16u);
    }

    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v5));
    -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:]( self,  "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:",  v4,  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v9 timeIntervalSinceReferenceDate];
    [v8 saveFindMyHubRetryAtTime:(uint64_t)v10];
  }
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSArray)serverList
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setServerList:(id)a3
{
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHubHostName:(id)a3
{
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setHubPort:(id)a3
{
}

- (BOOL)isLogicSync
{
  return self->_isLogicSync;
}

- (void)setIsLogicSync:(BOOL)a3
{
  self->_isLogicSync = a3;
}

- (double)autoEnrollmentTimeStamp
{
  return self->_autoEnrollmentTimeStamp;
}

- (void)setAutoEnrollmentTimeStamp:(double)a3
{
  self->_autoEnrollmentTimeStamp = a3;
}

- (NSString)autoEnrollmentStoreId
{
  return self->_autoEnrollmentStoreId;
}

- (void)setAutoEnrollmentStoreId:(id)a3
{
}

- (NSSet)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
}

- (NSMutableString)storesSearched
{
  return self->_storesSearched;
}

- (void)setStoresSearched:(id)a3
{
}

- (void).cxx_destruct
{
}

@end