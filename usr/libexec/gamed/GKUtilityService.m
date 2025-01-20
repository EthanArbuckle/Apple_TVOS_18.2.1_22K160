@interface GKUtilityService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (id)_bagValuesForKeys:(id)a3;
- (id)ampController;
- (void)cacheImageData:(id)a3 inSubdirectory:(id)a4 withFileName:(id)a5 handler:(id)a6;
- (void)completeGameRecording;
- (void)completeMatchRecording:(id)a3 matchType:(id)a4;
- (void)deleteCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5;
- (void)getBSServiceConnectionEndpointForMachName:(id)a3 service:(id)a4 instance:(id)a5 handler:(id)a6;
- (void)getStoreBagValuesForKeys:(id)a3 handler:(id)a4;
- (void)loadCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5;
- (void)openGameCenterSettings;
- (void)openICloudSettings;
- (void)openSoftwareUpdateSettings;
- (void)recordActiveDevices:(id)a3;
- (void)recordGameStart;
- (void)recordMatchServer:(id)a3;
- (void)recordMatchStart:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5;
- (void)recordSharePlayDevices:(id)a3;
- (void)reportLoadUrlMetricsEvent:(id)a3;
- (void)reportMetricsEventWithTopic:(id)a3 shouldFlush:(id)a4 metricsFields:(id)a5;
- (void)reportMultiplayerActivityMetricsEvent:(id)a3;
- (void)reportPerformanceMetricsEvent:(id)a3;
- (void)requestImageDataForURL:(id)a3 subdirectory:(id)a4 fileName:(id)a5 handler:(id)a6;
- (void)viewableThresholdWithCompletion:(id)a3;
@end

@implementation GKUtilityService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKUtilityServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 1LL;
}

- (BOOL)requiresAuthentication
{
  return 0;
}

- (void)getStoreBagValuesForKeys:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKUtilityService: getStoreBagValuesForKeys:",  buf,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKUtilityService _bagValuesForKeys:](self, "_bagValuesForKeys:", v6));
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000754C;
    v14[3] = &unk_10026B030;
    id v16 = v8;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (id)_bagValuesForKeys:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  131LL,  "-[GKUtilityService _bagValuesForKeys:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000076B0;
  v12[3] = &unk_10026B080;
  v12[4] = self;
  id v13 = v4;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  [v7 perform:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)requestImageDataForURL:(id)a3 subdirectory:(id)a4 fileName:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000079F8;
  v31[3] = &unk_10026B0A8;
  id v14 = v10;
  id v32 = v14;
  id v15 = v11;
  id v33 = v15;
  id v16 = v12;
  id v34 = v16;
  v35 = self;
  id v17 = v13;
  id v36 = v17;
  v18 = objc_retainBlock(v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
  uint64_t v20 = GKImageCacheRoot(&stru_10027B720);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  unsigned __int8 v22 = [v19 hasPrefix:v21];

  if ((v22 & 1) != 0
    || (v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared")),
        unsigned __int8 v24 = [v23 isInternalBuild],
        v23,
        (v24 & 1) == 0))
  {
    ((void (*)(void *))v18[2])(v18);
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 storeBag]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100007A78;
    v27[3] = &unk_10026B0D0;
    id v28 = v14;
    id v29 = v17;
    v30 = v18;
    [v28 hasTrustedImageDomainWithStoreBag:v26 completionHandler:v27];
  }
}

- (void)cacheImageData:(id)a3 inSubdirectory:(id)a4 withFileName:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  178LL,  "-[GKUtilityService cacheImageData:inSubdirectory:withFileName:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v14));

  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100007CD4;
    v20[3] = &unk_10026B080;
    id v21 = v11;
    id v22 = v12;
    id v23 = v10;
    [v15 perform:v20];
  }

  if (v13)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100007E60;
    v18[3] = &unk_10026B120;
    id v19 = v13;
    [v15 notifyOnQueue:v17 block:v18];
  }
}

- (void)loadCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  203LL,  "-[GKUtilityService loadCachedImageDataFromSubdirectory:withFileName:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  if (v8 && v9)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100008010;
    v18[3] = &unk_10026B080;
    id v19 = v8;
    id v20 = v9;
    id v21 = v12;
    [v21 perform:v18];
  }

  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000815C;
    v15[3] = &unk_10026B030;
    id v17 = v10;
    id v16 = v12;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)deleteCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  227LL,  "-[GKUtilityService deleteCachedImageDataFromSubdirectory:withFileName:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  if (v8 && v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000832C;
    v17[3] = &unk_10026B170;
    id v18 = v8;
    id v19 = v9;
    [v12 perform:v17];
  }

  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000084F0;
    v15[3] = &unk_10026B120;
    id v16 = v10;
    [v12 notifyOnQueue:v14 block:v15];
  }
}

- (void)openICloudSettings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  [v2 openICloudSettings];
}

- (void)openSoftwareUpdateSettings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  [v2 openSoftwareUpdateSettings];
}

- (id)ampController
{
  return +[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller");
}

- (void)viewableThresholdWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 replyQueue]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  271LL,  "-[GKUtilityService viewableThresholdWithCompletion:]"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v7));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000086E4;
  v17[3] = &unk_10026B170;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 perform:v17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000087BC;
  v13[3] = &unk_10026B1E8;
  id v15 = v6;
  id v16 = v4;
  id v14 = v9;
  id v10 = v6;
  id v11 = v4;
  id v12 = v9;
  [v12 notifyOnQueue:v10 block:v13];
}

- (void)reportMetricsEventWithTopic:(id)a3 shouldFlush:(id)a4 metricsFields:(id)a5
{
  id v17 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 originalBundleIdentifier]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"hostApp"]);
  unsigned int v14 = objc_msgSend(v12, "isMemberOfClass:", objc_opt_class(NSString, v13));

  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"hostApp"]);

    id v11 = (void *)v15;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v16 reportMetricsEventWithTopic:v9 hostAppBundleId:v11 shouldFlush:v8 metricsFields:v17];
}

- (void)reportPerformanceMetricsEvent:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 originalBundleIdentifier]);
  [v7 reportPerformanceEventWithHostAppBundleId:v6 metricsFields:v4];
}

- (void)reportMultiplayerActivityMetricsEvent:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 originalBundleIdentifier]);
  [v7 reportMultiplayerActivityEventWithHostAppBundleId:v6 metricsFields:v4];
}

- (void)reportLoadUrlMetricsEvent:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v4 reportLoadUrlMetricsEventWithMetricsFields:v3];
}

- (void)recordMatchStart:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "match making recording started", v14, 2u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  [v13 recordMatchStartWithType:v7 minPlayers:v8 maxPlayers:v10];
}

- (void)recordMatchServer:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  [v4 recordMatchServerWithType:v3];
}

- (void)recordActiveDevices:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  [v4 recordActiveDevicesWithCount:v3];
}

- (void)recordSharePlayDevices:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  [v4 recordSharePlayDevicesWithCount:v3];
}

- (void)completeMatchRecording:(id)a3 matchType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "recording completed result: %@ type: %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008F44;
  v12[3] = &unk_10026B210;
  v12[4] = self;
  [v11 recordMatchCompleteWithMatchType:v8 result:v6 completion:v12];
}

- (void)recordGameStart
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  [v2 recordGameStart];
}

- (void)completeGameRecording
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](&OBJC_CLASS___GKMatchReporter, "shared"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000907C;
  v4[3] = &unk_10026B210;
  v4[4] = self;
  [v3 recordGameCompleteWithCompletion:v4];
}

- (void)openGameCenterSettings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  [v5 setAuthenticatingWithSettingsBundleID:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=GAMECENTER"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  if ([v7 isGameCenter])
  {
    id v8 = 0LL;
  }

  else
  {
    uint64_t v15 = LSOpenApplicationPayloadOptionsKey;
    uint64_t v13 = @"UIApplicationLaunchOptionsSourceApplicationKey";
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    id v14 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v16 = v11;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v12 openSensitiveURL:v6 withOptions:v8];
}

- (void)getBSServiceConnectionEndpointForMachName:(id)a3 service:(id)a4 instance:(id)a5 handler:(id)a6
{
  id v9 = (void (**)(id, id))a6;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionEndpoint endpointForSystemMachName:service:instance:]( &OBJC_CLASS___BSServiceConnectionEndpoint,  "endpointForSystemMachName:service:instance:",  a3,  a4,  a5));
  v9[2](v9, v10);
}

@end