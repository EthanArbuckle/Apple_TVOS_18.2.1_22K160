@interface MSDAnalyticsEventHandler
+ (id)sharedInstance;
- (MSDAnalyticsEventHandler)init;
- (NSArray)cellularTypeStrMapping;
- (NSDictionary)rawDataKeyMapping;
- (id)getDemoBundleInfo:(id)a3;
- (id)getDownloadSizeBucket:(int64_t)a3;
- (id)getEmbeddedSimCarrier:(id)a3;
- (id)getPhysicalSimCarrier:(id)a3;
- (id)prepareCAData:(int)a3;
- (void)sendAppUsageDataEvent:(id)a3 withExecutable:(id)a4 sessionUUID:(id)a5 sessionStart:(id)a6 sessionEnd:(id)a7 sessionDuration:(int64_t)a8 appOrder:(int64_t)a9 appDuration:(double)a10;
- (void)sendAutoEnrollmentAbortEvent:(id)a3 languageCode:(id)a4 countryCode:(id)a5 networkInformation:(id)a6 wifiSSID:(id)a7;
- (void)sendAutoEnrollmentResults:(id)a3;
- (void)sendBgDownloadPausedEvent:(int64_t)a3 forReason:(id)a4;
- (void)sendContentUpdateCompletedEvent:(int64_t)a3 withTimeTaken:(double)a4 cachingHubAvailable:(BOOL)a5 isCriticalUpdate:(BOOL)a6 contentUpdateType:(id)a7 andComponentSuccess:(int64_t)a8;
- (void)sendContentUpdateFailureEvent:(id)a3 isFatal:(BOOL)a4;
- (void)sendEnrollmentFailureEvent:(id)a3;
- (void)sendFMHFailureEvent:(id)a3;
- (void)sendFileDownloadSourceEvent:(id)a3;
- (void)sendHeartbeatEvent;
- (void)sendLastShallowRefreshTime:(id)a3;
- (void)sendNetworkAverageBandwidthEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkAverageRTTEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkFailureEvent:(id)a3 forServerType:(id)a4;
- (void)sendNetworkPacketLossEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkRawDataEvent:(id)a3 forServerType:(id)a4;
- (void)sendOSUpdateFailureEvent:(id)a3;
- (void)sendiCloudSigninFailureEvent:(id)a3;
- (void)setCellularTypeStrMapping:(id)a3;
- (void)setRawDataKeyMapping:(id)a3;
@end

@implementation MSDAnalyticsEventHandler

+ (id)sharedInstance
{
  if (qword_1001253B8 != -1) {
    dispatch_once(&qword_1001253B8, &stru_1000F9D98);
  }
  return (id)qword_1001253B0;
}

- (MSDAnalyticsEventHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDAnalyticsEventHandler;
  v2 = -[MSDAnalyticsEventHandler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDAnalyticsEventHandler setRawDataKeyMapping:](v2, "setRawDataKeyMapping:", &off_100106628);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"None",  @"Physical",  @"eSim",  0LL));
    -[MSDAnalyticsEventHandler setCellularTypeStrMapping:](v3, "setCellularTypeStrMapping:", v4);
  }

  return v3;
}

- (void)sendContentUpdateFailureEvent:(id)a3 isFatal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleInProgress]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleInfo]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v9));

  [v15 setObject:v10 forKey:@"demoBundleInProgressInfo"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 code]));
  [v15 setObject:v11 forKey:@"errorCode"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
  [v15 setObject:v12 forKey:@"errorMessage"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v15 setObject:v13 forKey:@"isFatal"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v14 sendEvent:@"com.apple.MobileStoreDemo.contentUpdateFailure" withPayload:v15];
}

- (void)sendiCloudSigninFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]));
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  [v8 setObject:v6 forKey:@"errorMessage"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v7 sendEvent:@"com.apple.MobileStoreDemo.icloudSignInFailure" withPayload:v8];
}

- (void)sendOSUpdateFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]));
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  [v8 setObject:v6 forKey:@"errorMessage"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v7 sendEvent:@"com.apple.MobileStoreDemo.osUpdateFailure" withPayload:v8];
}

- (void)sendFMHFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]));
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  [v8 setObject:v6 forKey:@"errorMessage"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v7 sendEvent:@"com.apple.MobileStoreDemo.fmhFailure" withPayload:v8];
}

- (void)sendEnrollmentFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]));
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  [v8 setObject:v6 forKey:@"errorMessage"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v7 sendEvent:@"com.apple.MobileStoreDemo.enrollmentFailure" withPayload:v8];
}

- (void)sendNetworkFailureEvent:(id)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 code]));
  [v11 setObject:v8 forKey:@"errorCode"];

  [v11 setObject:v6 forKey:@"serverType"];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);

  [v11 setObject:v9 forKey:@"errorMessage"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v10 sendEvent:@"com.apple.MobileStoreDemo.networkFailure" withPayload:v11];
}

- (void)sendContentUpdateCompletedEvent:(int64_t)a3 withTimeTaken:(double)a4 cachingHubAvailable:(BOOL)a5 isCriticalUpdate:(BOOL)a6 contentUpdateType:(id)a7 andComponentSuccess:(int64_t)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a7;
  id v26 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleInProgress]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleInfo]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v17));

  [v26 setObject:v18 forKey:@"demoBundleInProgressInfo"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  [v26 setObject:v19 forKey:@"downloadSize"];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDownloadSizeBucket:](self, "getDownloadSizeBucket:", a3));
  [v26 setObject:v20 forKey:@"downloadSizeBucket"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  [v26 setObject:v21 forKey:@"isCachingHubAvailable"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
  [v26 setObject:v22 forKey:@"isCriticalUpdate"];

  [v26 setObject:v14 forKey:@"contentUpdateType"];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  [v26 setObject:v23 forKey:@"timeTaken"];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a8));
  [v26 setObject:v24 forKey:@"componentSuccessPercent"];

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v25 sendEvent:@"com.apple.MobileStoreDemo.contentUpdateCompleted" withPayload:v26];
}

- (void)sendBgDownloadPausedEvent:(int64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
  [v9 setObject:v7 forKey:@"pauseDuration"];

  [v9 setObject:v6 forKey:@"pauseReason"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v8 sendEvent:@"com.apple.MobileStoreDemo.bgDownloadPaused" withPayload:v9];
}

- (void)sendFileDownloadSourceEvent:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  [v6 setObject:v4 forKey:@"fileDownloadSource"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v5 sendEvent:@"com.apple.MobileStoreDemo.fileDownloadSource" withPayload:v6];
}

- (void)sendNetworkAverageRTTEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
  [v9 setObject:v7 forKey:@"avgRTT"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkRTT" withPayload:v9];
}

- (void)sendNetworkPacketLossEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
  [v9 setObject:v7 forKey:@"packetLoss"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkPacketLoss" withPayload:v9];
}

- (void)sendNetworkAverageBandwidthEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
  [v9 setObject:v7 forKey:@"avgBandwidth"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkBandwidth" withPayload:v9];
}

- (void)sendNetworkRawDataEvent:(id)a3 forServerType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0LL));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataResponseEnd"]);
  if (v9)
  {
    BOOL v10 = (void *)v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataResponseStart"]);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataResponseEnd"]);
      [v12 doubleValue];
      double v14 = v13;

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataResponseStart"]);
      [v15 doubleValue];
      double v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 - v17));
      [v8 setObject:v18 forKey:@"responseDuration"];
    }
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataRequestEnd"]);
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataRequestStart"]);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataRequestEnd"]);
      [v22 doubleValue];
      double v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_kCFNTimingDataRequestStart"]);
      [v25 doubleValue];
      double v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24 - v27));
      [v8 setObject:v28 forKey:@"requestDuration"];
    }
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v29 = v6;
  id v30 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      v33 = 0LL;
      do
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler rawDataKeyMapping](self, "rawDataKeyMapping", (void)v39));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v34]);

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v34]);
          [v8 setObject:v37 forKey:v36];
        }

        v33 = (char *)v33 + 1;
      }

      while (v31 != v33);
      id v31 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v31);
  }

  [v8 setObject:v7 forKey:@"serverType"];
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v38 sendEvent:@"com.apple.MobileStoreDemo.networkRawData" withPayload:v8];
}

- (void)sendAppUsageDataEvent:(id)a3 withExecutable:(id)a4 sessionUUID:(id)a5 sessionStart:(id)a6 sessionEnd:(id)a7 sessionDuration:(int64_t)a8 appOrder:(int64_t)a9 appDuration:(double)a10
{
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v27 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1LL));
  [v27 setObject:v21 forKey:@"bundleID"];

  [v27 setObject:v20 forKey:@"executableName"];
  [v27 setObject:v19 forKey:@"sessionUUID"];

  [v27 setObject:v18 forKey:@"sessionStartTime"];
  [v27 setObject:v17 forKey:@"sessionEndTime"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a8));
  [v27 setObject:v22 forKey:@"sessionDuration"];

  double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a9));
  [v27 setObject:v23 forKey:@"appOrder"];

  *(float *)&double v24 = a10;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v24));
  [v27 setObject:v25 forKey:@"appDuration"];

  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v26 sendEvent:@"com.apple.MobileStoreDemo.appUsage" withPayload:v27];
}

- (void)sendHeartbeatEvent
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1LL));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v2 sendEvent:@"com.apple.MobileStoreDemo.heartbeat" withPayload:v3];
}

- (void)sendLastShallowRefreshTime:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1LL));
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", (uint64_t)v6));
  [v9 setObject:v7 forKey:@"LastShallowRefreshTime"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v8 sendEvent:@"com.apple.MobileStoreDemo.lastShallowRefreshTime" withPayload:v9];
}

- (void)sendAutoEnrollmentResults:(id)a3
{
  id v27 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1LL));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentTimeStamp"]);
  [v5 timeIntervalSince1970];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  (int)v7));
  [v4 setObject:v8 forKey:@"AutoEnrollmentTimeStamp"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentStatus"]);
  [v4 setObject:v9 forKey:@"AutoEnrollmentStatus"];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"ErrorCode"]);
  [v4 setObject:v10 forKey:@"errorCode"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"ErrorMessage"]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"ErrorMessage"]);
    [v4 setObject:v12 forKey:@"errorMessage"];
  }

  else
  {
    [v4 setObject:@"<NOT_SET>" forKey:@"errorMessage"];
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentSelectedStoreID"]);

  if (v13)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentSelectedStoreID"]);
    [v4 setObject:v14 forKey:@"AutoEnrollmentSelectedStoreID"];
  }

  else
  {
    [v4 setObject:@"<NOT_SET>" forKey:@"errorMessage"];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentNetworkInfo"]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getPhysicalSimCarrier:](self, "getPhysicalSimCarrier:", v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentNetworkInfo"]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getEmbeddedSimCarrier:](self, "getEmbeddedSimCarrier:", v17));

  [v4 setObject:v16 forKey:@"AutoEnrollmentPhyscialSIMCarrier"];
  [v4 setObject:v18 forKey:@"AutoEnrollmentEmbeddedSIMCarrier"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentWiFiSSID"]);
  [v4 setObject:v19 forKey:@"AutoEnrollmentWiFiSSID"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentHelpMenuUserTapped"]);
  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentHelpMenuUserTapped"]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);
    double v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", @", "));

    [v4 setObject:v23 forKey:@"AutoEnrollmentHelpMenuUserTapped"];
  }

  double v24 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentLanguageCodeInfo"]);
  [v4 setObject:v24 forKey:@"AutoEnrollmentLanguageCodeInfo"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AutoEnrollmentCountryCodeInfo"]);
  [v4 setObject:v25 forKey:@"AutoEnrollmentCountryCodeInfo"];

  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v26 sendEvent:@"com.apple.MobileStoreDemo.autoEnrollment" withPayload:v4];
}

- (void)sendAutoEnrollmentAbortEvent:(id)a3 languageCode:(id)a4 countryCode:(id)a5 networkInformation:(id)a6 wifiSSID:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v23 code]));
  [v16 setObject:v17 forKey:@"errorCode"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
    [v16 setObject:v19 forKey:@"errorMessage"];
  }

  [v16 setObject:v12 forKey:@"AutoEnrollmentAbortLanguageCodeInfo"];
  [v16 setObject:v15 forKey:@"AutoEnrollmentAbortCountryCodeInfo"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getPhysicalSimCarrier:](self, "getPhysicalSimCarrier:", v14));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getEmbeddedSimCarrier:](self, "getEmbeddedSimCarrier:", v14));

  [v16 setObject:v20 forKey:@"AutoEnrollmentPhyscialSIMCarrier"];
  [v16 setObject:v21 forKey:@"AutoEnrollmentEmbeddedSIMCarrier"];
  [v16 setObject:v13 forKey:@"AutoEnrollmentWiFiSSID"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v22 sendEvent:@"com.apple.MobileStoreDemo.autoEnrollmentAbort" withPayload:v16];
}

- (id)prepareCAData:(int)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getDeviceOptions]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"store_id"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 getDeviceOptions]);
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"store_id"]);
  }

  else
  {
    BOOL v10 = @"<unknown>";
  }

  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, @"storeID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, @"deviceSerialNumber");
  if (a3 == 1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 getDeviceOptions]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"store_type"]);
    if (v14) {
      id v15 = (const __CFString *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"store_type"]);
    }
    else {
      id v15 = @"<unknown>";
    }
    v50 = (__CFString *)v15;
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v15, @"storeType");
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 installedBundle]);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleInfo]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v18));

    v49 = (void *)v19;
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v19, @"demoBundleInfo");
    id v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v20, "setDateFormat:", @"yyyy-MM-dd");
    id v21 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
    -[NSDateFormatter setLocale:](v20, "setLocale:", v21);

    v22 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSGregorianCalendar);
    -[NSDateFormatter setCalendar:](v20, "setCalendar:", v22);

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 getLastBundleUpdateDate]);
    double v24 = v23;
    v51 = v13;
    if (v23 && ([v23 isEqualToString:@"<unknown>"] & 1) == 0)
    {
      double v26 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v26, "setDateFormat:", @"yyyy-MM-dd");
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v26, "dateFromString:", v24));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v20, "stringFromDate:", v27));

      if (!v25)
      {
        id v28 = sub_10003A95C();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_1000974F8(v29, v30, v31, v32, v33, v34, v35, v36);
        }

        v25 = @"<unknown>";
      }
    }

    else
    {

      v25 = @"<unknown>";
    }

    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, @"lastBundleUpdateDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v20, "stringFromDate:", v37));

    if (!v38)
    {
      id v39 = sub_10003A95C();
      __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_1000974C4(v40, v41, v42, v43, v44, v45, v46, v47);
      }

      v38 = @"<unknown>";
    }

    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v38, @"localDate");
  }

  return v5;
}

- (id)getDownloadSizeBucket:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld-%ld GB",  a3 / 1000000000,  a3 / 1000000000 + 1));
  id v5 = sub_10003A95C();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10009752C((uint64_t)v4, a3, v6);
  }

  return v4;
}

- (id)getDemoBundleInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"BundleName"]);

  if (v4) {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"BundleName"]);
  }
  else {
    id v5 = @"<unknown>";
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PartNumber"]);

  if (v6) {
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PartNumber"]);
  }
  else {
    double v7 = @"<unknown>";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Revision"]);

  if (v8) {
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Revision"]);
  }
  else {
    id v9 = @"<unknown>";
  }
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  v5,  v7,  v9));

  return v10;
}

- (id)getPhysicalSimCarrier:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = &stru_1000FB848;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", @"SimType", (void)v12));
        if ([v10 isEqualToNumber:&off_100106420])
        {
          double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Provider"]);

          goto LABEL_12;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    double v7 = &stru_1000FB848;
  }

- (id)getEmbeddedSimCarrier:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = &stru_1000FB848;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", @"SimType", (void)v12));
        if ([v10 isEqualToNumber:&off_100106438])
        {
          double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Provider"]);

          goto LABEL_12;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    double v7 = &stru_1000FB848;
  }

- (NSDictionary)rawDataKeyMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRawDataKeyMapping:(id)a3
{
}

- (NSArray)cellularTypeStrMapping
{
  return self->_cellularTypeStrMapping;
}

- (void)setCellularTypeStrMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end