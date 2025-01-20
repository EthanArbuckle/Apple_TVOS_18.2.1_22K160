@interface OSAStabilityMonitor
+ (BOOL)hasSupplementalBuild;
+ (BOOL)isAvailable;
+ (id)baselineCrashCount;
+ (id)baselineUptime;
+ (id)baselineVersions;
+ (id)calculateStabilityRateWithAppUsage:(id)a3 crashCounts:(id)a4;
+ (id)monitorQueue;
+ (void)dateRangeOnBuild:(id)a3 from:(id)a4 to:(id)a5 completionHandler:(id)a6;
+ (void)evaluateStabilityOfBundleID:(id)a3 coalitionName:(id)a4 parameters:(id)a5 completionHandler:(id)a6;
+ (void)evaluateStabilityWithParameters:(id)a3;
+ (void)evaluateStabilityWithParameters:(id)a3 targetBundleID:(id)a4 coalitionName:(id)a5 completionHandler:(id)a6;
- (BOOL)excludeThirdParty;
- (BOOL)isRollbackEnabledForBundleID:(id)a3;
- (BOOL)isRollbackSupportedForBundleID:(id)a3 reason:(unint64_t *)a4;
- (BOOL)isValidBundleID:(id)a3;
- (BOOL)recommendRollbackForBundleID:(id)a3 reason:(unint64_t *)a4;
- (NSString)targetBundleID;
- (OSAStabilityMonitor)initWithParameters:(id)a3 targetBundleID:(id)a4 completionHandler:(id)a5;
- (id)coalitionBasedBundleIDs;
- (id)loadParameterForKey:(id)a3;
- (id)maximumDays;
- (id)maximumMTBF;
- (id)maximumMTBFIfNoBaselineCrashes;
- (id)minimumCrashCount;
- (id)minimumMTBFDelta;
- (id)minimumMTBFFactor;
- (id)minimumUptime;
- (void)addCrashEvent:(id)a3 to:(id)a4;
- (void)checkForOSUpdate;
- (void)evaluateStability;
- (void)reportResultsForBundleID:(id)a3 crashes:(id)a4 uptime:(id)a5 MTBF:(id)a6 result:(BOOL)a7 status:(id)a8;
- (void)setTargetBundleID:(id)a3;
- (void)totalCrashesFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 appVersions:(id)a6 isBaseline:(BOOL)a7 completionHandler:(id)a8;
- (void)totalUptimeFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 targetAppVersions:(id)a6 firstPartyBundleIDs:(id)a7 completionHandler:(id)a8;
@end

@implementation OSAStabilityMonitor

- (OSAStabilityMonitor)initWithParameters:(id)a3 targetBundleID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (+[OSAStabilityMonitor isAvailable](&OBJC_CLASS___OSAStabilityMonitor, "isAvailable"))
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___OSAStabilityMonitor;
    v12 = -[OSAStabilityMonitor init](&v17, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_parameters, a3);
      objc_storeStrong((id *)&v13->_targetBundleID, a4);
      id v14 = objc_retainBlock(v11);
      id completionHandler = v13->_completionHandler;
      v13->_id completionHandler = v14;
    }
  }

  else
  {

    v13 = 0LL;
  }

  return v13;
}

+ (void)evaluateStabilityWithParameters:(id)a3
{
}

+ (void)evaluateStabilityOfBundleID:(id)a3 coalitionName:(id)a4 parameters:(id)a5 completionHandler:(id)a6
{
}

+ (void)evaluateStabilityWithParameters:(id)a3 targetBundleID:(id)a4 coalitionName:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[OSAStabilityMonitor monitorQueue](&OBJC_CLASS___OSAStabilityMonitor, "monitorQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008BB4;
  block[3] = &unk_100020C50;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v13, block);
}

- (void)checkForOSUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor maximumDays](self, "maximumDays"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v5 = [v4 BOOLForKey:@"stability-monitor.lastBuild-hasSupplementalBuild"];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"stability-monitor.lastBuild"]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 buildVersion]);

    uint64_t v11 = OSAStabilityMonitorLogDomain(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking for OS update.", buf, 2u);
    }

    id v13 = [v7 isEqualToString:v9];
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = OSAStabilityMonitorLogDomain(v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v37 = v7;
        __int16 v38 = 2114;
        v39 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Detected build version change from (%{public}@) to (%{public}@)",  buf,  0x16u);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v16 setObject:v9 forKey:@"stability-monitor.lastBuild"];

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      objc_msgSend( v17,  "setBool:forKey:",  +[OSAStabilityMonitor hasSupplementalBuild](OSAStabilityMonitor, "hasSupplementalBuild"),  @"stability-monitor.lastBuild-hasSupplementalBuild");

      if (v7) {
        char v19 = v5;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = OSAStabilityMonitorLogDomain(v18);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calculating baseline.", buf, 2u);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v22 removeObjectForKey:@"stability-monitor.baselineUptime"];

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v23 removeObjectForKey:@"stability-monitor.baselineCrashCount"];

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v24 removeObjectForKey:@"stability-monitor.baselineVersions"];

        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100009130;
        v32[3] = &unk_100020CC8;
        id v33 = v3;
        v34 = self;
        id v35 = v7;
        +[OSAStabilityMonitor dateRangeOnBuild:from:to:completionHandler:]( &OBJC_CLASS___OSAStabilityMonitor,  "dateRangeOnBuild:from:to:completionHandler:",  v35,  0LL,  0LL,  v32);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100015364((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
  }
}

- (BOOL)isRollbackSupportedForBundleID:(id)a3 reason:(unint64_t *)a4
{
  if (a4) {
    *a4 = 2LL;
  }
  return 0;
}

- (BOOL)recommendRollbackForBundleID:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  targetBundleID = self->_targetBundleID;
  if (!targetBundleID) {
    goto LABEL_12;
  }
  BOOL v8 = -[NSString isEqualToString:](targetBundleID, "isEqualToString:", v6);
  if (!v8)
  {
    if (self->_targetBundleID)
    {
      uint64_t v12 = OSAStabilityMonitorLogDomain(v8);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100015570();
      }

      goto LABEL_11;
    }

- (void)evaluateStability
{
  uint64_t v3 = OSAStabilityMonitorLogDomain(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    targetBundleID = (const __CFString *)self->_targetBundleID;
    if (!targetBundleID) {
      targetBundleID = @"telemetry mode";
    }
    parameters = self->_parameters;
    *(_DWORD *)buf = 138543618;
    v49 = targetBundleID;
    __int16 v50 = 2114;
    v51 = parameters;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Evaluating stability for %{public}@ with parameters: %{public}@",  buf,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor maximumDays](self, "maximumDays"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor minimumUptime](self, "minimumUptime"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor minimumCrashCount](self, "minimumCrashCount"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor maximumMTBF](self, "maximumMTBF"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor maximumMTBFIfNoBaselineCrashes](self, "maximumMTBFIfNoBaselineCrashes"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor minimumMTBFDelta](self, "minimumMTBFDelta"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor minimumMTBFFactor](self, "minimumMTBFFactor"));
  uint64_t v14 = (void *)v13;
  if (v7 && v8 && v9 && v10 && v12 && v13 && v11)
  {
    v36 = v10;
    v37 = v9;
    id v33 = v8;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v34 = objc_claimAutoreleasedReturnValue( objc_msgSend( v35,  "dateByAddingTimeInterval:",  -(double)(unint64_t)(86400 * (void)objc_msgSend(v7, "unsignedIntegerValue"))));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[OSAStabilityMonitor baselineCrashCount](&OBJC_CLASS___OSAStabilityMonitor, "baselineCrashCount"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[OSAStabilityMonitor baselineUptime](&OBJC_CLASS___OSAStabilityMonitor, "baselineUptime"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[OSAStabilityMonitor baselineVersions](&OBJC_CLASS___OSAStabilityMonitor, "baselineVersions"));
    uint64_t v18 = OSAStabilityMonitorLogDomain(v17);
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = v19;
    id v21 = v15;
    if (v15 && v16 && v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10001563C();
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100009BC4;
      v38[3] = &unk_100020D40;
      v38[4] = self;
      id v39 = v17;
      id v40 = v15;
      id v41 = v16;
      BOOL v8 = v33;
      id v42 = v33;
      id v43 = v37;
      id v44 = v36;
      id v45 = v12;
      id v46 = v14;
      id v47 = v11;
      v23 = (void *)v34;
      id v22 = v35;
      +[OSAStabilityMonitor dateRangeOnBuild:from:to:completionHandler:]( &OBJC_CLASS___OSAStabilityMonitor,  "dateRangeOnBuild:from:to:completionHandler:",  0LL,  v34,  v35,  v38);
    }

    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000156B0(v20);
      }

      -[OSAStabilityMonitor reportResultsForBundleID:crashes:uptime:MTBF:result:status:]( self,  "reportResultsForBundleID:crashes:uptime:MTBF:result:status:",  0LL,  0LL,  0LL,  0LL,  0LL,  @"Error retrieving baseline values");
      v23 = (void *)v34;
      id v22 = v35;
      BOOL v8 = v33;
    }

    uint64_t v10 = v36;
    uint64_t v9 = v37;
  }

  else
  {
    uint64_t v24 = OSAStabilityMonitorLogDomain(v13);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000155D4((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
    }

    id completionHandler = (void (**)(id, void))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2](completionHandler, 0LL);
    }
  }
}

- (void)totalUptimeFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 targetAppVersions:(id)a6 firstPartyBundleIDs:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  char v19 = -[OSAAppUsageAccumulator initWithStartDate:endDate:targetAppVersions:firstPartyBundleIDs:]( objc_alloc(&OBJC_CLASS___OSAAppUsageAccumulator),  "initWithStartDate:endDate:targetAppVersions:firstPartyBundleIDs:",  v13,  v14,  v18,  v17);

  if (v15) {
    -[OSAAccumulator setTargetKey:](v19, "setTargetKey:", v15);
  }
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsIntersectingDateRangeFrom:to:",  v13,  v14));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](&OBJC_CLASS____DKSystemEventStreams, "appInFocusStream"));
  id v43 = v21;
  uint64_t v34 = v15;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  1LL));
  id v42 = v23;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v20,  v22,  0LL,  0LL,  v24));

  id v26 = objc_alloc(&OBJC_CLASS___BMCoreDuetStream);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  id v28 = [v26 initWithKnowledgeStore:v27 clientContext:0 identifier:0];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 publisherForQuery:v25]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10000AC48;
  v41[3] = &unk_100020D68;
  v41[4] = self;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 filterWithIsIncluded:v41]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10000ACE8;
  v38[3] = &unk_100020D90;
  id v40 = v16;
  id v39 = v19;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10000AD64;
  v36[3] = &unk_100020DB8;
  v37 = v39;
  uint64_t v31 = v39;
  id v32 = v16;
  id v33 = [v30 sinkWithCompletion:v38 receiveInput:v36];
}

- (void)totalCrashesFrom:(id)a3 to:(id)a4 targetBundleID:(id)a5 appVersions:(id)a6 isBaseline:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a8;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  char v19 = -[OSACrashAccumulator initWithTargetAppVersions:isBaseline:]( objc_alloc(&OBJC_CLASS___OSACrashAccumulator),  "initWithTargetAppVersions:isBaseline:",  v16,  v9);

  if (v14) {
    -[OSAAccumulator setTargetKey:](v19, "setTargetKey:", v14);
  }
  id v20 = [[BMPublisherOptions alloc] initWithStartDate:v18 endDate:v17 maxEvents:0 lastN:0 reversed:0];

  uint64_t v21 = BiomeLibrary();
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 OSAnalytics]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 Stability]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 Crash]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 publisherWithOptions:v20]);

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000AF58;
  v32[3] = &unk_100020D90;
  id v34 = v15;
  id v33 = v19;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000AFD4;
  v30[3] = &unk_100020DE0;
  v30[4] = self;
  uint64_t v31 = v33;
  uint64_t v27 = v33;
  id v28 = v15;
  id v29 = [v26 sinkWithCompletion:v32 receiveInput:v30];
}

- (void)addCrashEvent:(id)a3 to:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor coalitionBasedBundleIDs](self, "coalitionBasedBundleIDs"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v17 eventBody]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  unsigned __int8 v10 = [v7 containsObject:v9];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v17 eventBody]);
  uint64_t v12 = v11;
  if ((v10 & 1) != 0) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 coalitionName]);
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 bundleID]);
  }
  id v14 = (void *)v13;

  if (-[OSAStabilityMonitor isValidBundleID:](self, "isValidBundleID:", v14))
  {
    if (!-[OSAStabilityMonitor excludeThirdParty](self, "excludeThirdParty")
      || (id v15 = (void *)objc_claimAutoreleasedReturnValue([v17 eventBody]),
          unsigned int v16 = [v15 isFirstParty],
          v15,
          v16))
    {
      [v6 addEvent:v17 withBundleID:v14];
    }
  }
}

+ (void)dateRangeOnBuild:(id)a3 from:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams deviceMetadataStream](&OBJC_CLASS___BMStreams, "deviceMetadataStream"));
  if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    id v14 = 0LL;
    if (v10)
    {
LABEL_3:
      [v10 timeIntervalSinceReferenceDate];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 publisherWithStartTime:v14 endTime:v15 maxEvents:0 reversed:1]);

      if (!v11) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 publisherWithStartTime:v14 endTime:0 maxEvents:0 reversed:1]);
  if (v11) {
LABEL_4:
  }

LABEL_5:
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_10000B3E4;
  v39[4] = sub_10000B3F4;
  id v40 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10000B3E4;
  v37 = sub_10000B3F4;
  id v38 = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  char v32 = 0;
  if (v9)
  {
    id v17 = v9;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    id v17 = (id)objc_claimAutoreleasedReturnValue([v18 buildVersion]);

    objc_storeStrong(v34 + 5, a5);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000B3FC;
  v27[3] = &unk_100020E08;
  id v19 = v12;
  id v28 = v19;
  id v29 = v39;
  uint64_t v30 = &v33;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000B48C;
  v22[3] = &unk_100020E30;
  id v20 = v17;
  id v23 = v20;
  uint64_t v24 = &v33;
  uint64_t v25 = v31;
  id v26 = v39;
  id v21 = [v16 sinkWithCompletion:v27 shouldContinue:v22];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
}

+ (id)calculateStabilityRateWithAppUsage:(id)a3 crashCounts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v38;
    double v11 = 0.0;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v13]);
        [v14 doubleValue];
        double v16 = v15;

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
        id v18 = [v17 unsignedIntegerValue];

        if (v18)
        {
          double v19 = v16 / (double)(unint64_t)v18;
          if (!v9 || v19 < v11)
          {
            id v20 = v13;

            id v9 = v20;
            double v11 = v19;
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v21 = v5;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = 0LL;
    uint64_t v25 = *(void *)v34;
    double v26 = 0.0;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v21);
        }
        id v28 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        if ((objc_msgSend(v28, "isEqualToDate:", v9, (void)v33) & 1) == 0)
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v28]);
          [v29 doubleValue];
          double v26 = v26 + v30;

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v28]);
          uint64_t v24 = (OSAStabilityRate *)((char *)v24 + (void)[v31 unsignedIntegerValue]);
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v23);

    if (v24) {
      uint64_t v24 = -[OSAStabilityRate initWithAppUptime:crashCount:]( objc_alloc(&OBJC_CLASS___OSAStabilityRate),  "initWithAppUptime:crashCount:",  v24,  v26 / 3600.0);
    }
  }

  else
  {

    uint64_t v24 = 0LL;
  }

  return v24;
}

- (void)reportResultsForBundleID:(id)a3 crashes:(id)a4 uptime:(id)a5 MTBF:(id)a6 result:(BOOL)a7 status:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v9);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000B960;
  v25[3] = &unk_100020E58;
  id v26 = v15;
  id v27 = v16;
  id v28 = v14;
  id v29 = v17;
  BOOL v31 = v9;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v14;
  id v23 = v16;
  id v24 = v15;
  AnalyticsSendEventLazy(@"com.apple.osanalytics.stabilityMonitor", v25);
}

- (BOOL)isValidBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"com.apple.AirPlayUIAgent",  @"com.apple.AppStoreDaemon.StoreUIService",  @"com.apple.BluetoothUIServer",  @"com.apple.CoreLocationAgent",  @"com.apple.Diagnostics",  @"com.apple.DiskImageMounter",  @"com.apple.FileProviderUI.ServerAuthUIExtension",  @"com.apple.FindMyMacMessenger",  @"com.apple.mobileslideshow.photospicker",  @"com.apple.SecurityAgent",  @"com.apple.ssinvitationagent",  @"com.apple.systemevents",  @"com.apple.tv.TVNotificationContentExtension",  @"com.apple.universalcontrol",  @"com.apple.UserNotificationCenter",  @"com.apple.VoiceMemos.VoiceMemosShareExtension",  @"com.apple.VoiceOver",  @"com.apple.wifi.WiFiAgent",  0LL));
  [v4 addObjectsFromArray:&off_100022DD0];
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)hasSupplementalBuild
{
  v2 = (void *)_CFCopySystemVersionDictionary(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 buildVersion]);
  char v6 = [v3 isEqualToString:v5] ^ 1;

  return v6;
}

+ (id)baselineCrashCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"stability-monitor.baselineCrashCount"]);

  return v3;
}

+ (id)baselineUptime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"stability-monitor.baselineUptime"]);

  return v3;
}

+ (id)baselineVersions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"stability-monitor.baselineVersions"]);

  return v3;
}

- (id)loadParameterForKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 buildVersion]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v22[0] = v6;
  v22[1] = @"default";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL, 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_parameters,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11)));
        if (v13)
        {
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v4]);
            if (v15)
            {
              id v16 = (void *)v15;

              goto LABEL_13;
            }
          }
        }

        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_13:

  return v16;
}

- (BOOL)isRollbackEnabledForBundleID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"enabledBundleIDs"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)maximumDays
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"maximumDays");
}

- (id)coalitionBasedBundleIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[OSAStabilityMonitor loadParameterForKey:]( self,  "loadParameterForKey:",  @"coalitionBasedBundleIDs"));
  if (v2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (id)minimumUptime
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"minimumUptime");
}

- (id)minimumCrashCount
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"minimumCrashCount");
}

- (id)maximumMTBF
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"maximumMTBF");
}

- (id)maximumMTBFIfNoBaselineCrashes
{
  return -[OSAStabilityMonitor loadParameterForKey:]( self,  "loadParameterForKey:",  @"maximumMTBFIfNoBaselineCrashes");
}

- (id)minimumMTBFDelta
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"minimumMTBFDelta");
}

- (id)minimumMTBFFactor
{
  return -[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"minimumMTBFFactor");
}

- (BOOL)excludeThirdParty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor loadParameterForKey:](self, "loadParameterForKey:", @"excludeThirdParty"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (id)monitorQueue
{
  if (qword_100026248 != -1) {
    dispatch_once(&qword_100026248, &stru_100020E78);
  }
  return (id)qword_100026240;
}

+ (BOOL)isAvailable
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___BMStreams, a2);
  if (v2)
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___BMProcessCrash, v3);
    if (v2)
    {
      uint64_t v2 = objc_opt_class(&OBJC_CLASS____DKEventQuery, v4);
      if (v2) {
        return 1;
      }
    }
  }

  uint64_t v6 = OSAStabilityMonitorLogDomain(v2);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10001581C(v7);
  }

  return 0;
}

- (NSString)targetBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTargetBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end