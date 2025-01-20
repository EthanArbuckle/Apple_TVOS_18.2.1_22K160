@interface _DASNetworkQualityPolicy
+ (id)policyInstance;
+ (int64_t)currentNetworkQualityWithContext:(id)a3 interface:(int64_t *)a4;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)inDiscountedHoursAtDate:(id)a3;
- (BOOL)inLowCongestionHoursAtDate:(id)a3;
- (BOOL)isiCloudKeychainActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (BOOL)unconstrainedNetworkAvailableForActivity:(id)a3 withContext:(id)a4 withRationale:(id)a5;
- (NSArray)triggers;
- (NSDictionary)discountedHours;
- (NSDictionary)lowCongestionHours;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContext)userContext;
- (_CDContextualKeyPath)wifiStatus;
- (_DASNetworkEvaluationMonitor)networkEvaluator;
- (_DASNetworkQualityPolicy)init;
- (_DKPredictionTimeline)wifiPredictionTimeline;
- (double)companionScoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9;
- (double)scoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)companionMinimumQualityForActivity:(id)a3 interface:(int64_t)a4;
- (int64_t)minimumQualityForActivity:(id)a3 interface:(int64_t)a4 interfaceSubtype:(int64_t)a5;
- (void)clearOffPeakDiscountedHours;
- (void)registerForPredictionChanges;
- (void)setDiscountedHours:(id)a3;
- (void)setLowCongestionHours:(id)a3;
- (void)setNetworkEvaluator:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUserContext:(id)a3;
- (void)setWifiPredictionTimeline:(id)a3;
- (void)setWifiStatus:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASNetworkQualityPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_wifiStatus));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.nwstatus.wifi";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121CD8;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (void)registerForPredictionChanges
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:self->_wifiStatus]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDNetworkContext predictionKey](&OBJC_CLASS____CDNetworkContext, "predictionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  objc_storeStrong((id *)&self->_wifiPredictionTimeline, v6);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000B355C((uint64_t)v6, v7, v8);
  }

  +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v6,  @"wifiPredictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextPredictionQueries keyPathForWiFiQualityPrediction]( &OBJC_CLASS____CDContextPredictionQueries,  "keyPathForWiFiQualityPrediction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v9));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10004254C;
  v16 = &unk_100115E58;
  v17 = self;
  id v18 = v9;
  id v11 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.duetactivityscheduler.wifiqualityprediction",  v10,  &v13));

  -[_CDContext registerCallback:](self->_userContext, "registerCallback:", v12, v13, v14, v15, v16, v17);
}

- (_DASNetworkQualityPolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASNetworkQualityPolicy;
  v2 = -[_DASNetworkQualityPolicy init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Network Quality Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDNetworkContext keyPathForWiFiConnectionStatus]( &OBJC_CLASS____CDNetworkContext,  "keyPathForWiFiConnectionStatus"));
    wifiStatus = v3->_wifiStatus;
    v3->_wifiStatus = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor sharedInstance](&OBJC_CLASS____DASNetworkEvaluationMonitor, "sharedInstance"));
    networkEvaluator = v3->_networkEvaluator;
    v3->_networkEvaluator = (_DASNetworkEvaluationMonitor *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    userContext = v3->_userContext;
    v3->_userContext = (_CDContext *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    -[_DASNetworkQualityPolicy clearOffPeakDiscountedHours](v3, "clearOffPeakDiscountedHours");
  }

  return v3;
}

- (void)clearOffPeakDiscountedHours
{
}

- (BOOL)inLowCongestionHoursAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)qword_1001578F8;
  if (!qword_1001578F8)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    uint64_t v7 = (void *)qword_1001578F8;
    qword_1001578F8 = v6;

    uint64_t v5 = (void *)qword_1001578F8;
  }

  id v8 = [v5 component:512 fromDate:v4];
  uint64_t v9 = 0LL;
  uint64_t v10 = (uint64_t)v8 - 1;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v10 = (v9 + v10 + 7) % 7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy lowCongestionHours](self, "lowCongestionHours"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * (void)i) containsDate:v4])
          {

            BOOL v21 = 1;
            goto LABEL_15;
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    char v11 = 0;
    BOOL v21 = 0;
    uint64_t v9 = -1LL;
  }

  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)inDiscountedHoursAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)qword_1001578F8;
  if (!qword_1001578F8)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    uint64_t v7 = (void *)qword_1001578F8;
    qword_1001578F8 = v6;

    uint64_t v5 = (void *)qword_1001578F8;
  }

  id v8 = [v5 component:512 fromDate:v4];
  uint64_t v9 = 0LL;
  uint64_t v10 = (uint64_t)v8 - 1;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v10 = (v9 + v10 + 7) % 7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy discountedHours](self, "discountedHours"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * (void)i) containsDate:v4])
          {

            BOOL v21 = 1;
            goto LABEL_15;
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    char v11 = 0;
    BOOL v21 = 0;
    uint64_t v9 = -1LL;
  }

  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_100157900 != -1) {
    dispatch_once(&qword_100157900, &stru_100115E78);
  }
  return (id)qword_100157908;
}

+ (int64_t)currentNetworkQualityWithContext:(id)a3 interface:(int64_t *)a4
{
  id v5 = a3;
  id v6 = +[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", v5);
  if (v6)
  {
    id v7 = v6;
    if (a4) {
      *a4 = (int64_t)+[_CDNetworkContext wifiInterfaceClass:]( &OBJC_CLASS____CDNetworkContext,  "wifiInterfaceClass:",  v5);
    }
  }

  else
  {
    if (a4) {
      *a4 = (int64_t)+[_CDNetworkContext cellInterfaceClass:]( &OBJC_CLASS____CDNetworkContext,  "cellInterfaceClass:",  v5);
    }
    id v7 = +[_CDNetworkContext cellQuality:](&OBJC_CLASS____CDNetworkContext, "cellQuality:", v5);
  }

  return (int64_t)v7;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  uint64_t v3 = (uint64_t)+[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  if (v3 < 21)
  {
    [v4 addConstraint:16 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v4 addConstraint:16 forSchedulingPriority:_DASSchedulingPriorityUtility];
    [v4 addConstraint:32 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v4 addConstraint:32 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }

  else
  {
    [v4 removeConstraint:16 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v4 removeConstraint:16 forSchedulingPriority:_DASSchedulingPriorityUtility];
    [v4 removeConstraint:32 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v4 removeConstraint:32 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (uint64_t)+[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", v6);
  -[_DASNetworkQualityPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);

  unsigned __int8 v9 = [v7 isEqualToString:@"com.apple.duetactivityscheduler.nwstatus.wifi"];
  if (v8 < 21) {
    return v9;
  }
  else {
    return 0;
  }
}

- (BOOL)appliesToActivity:(id)a3
{
  return [a3 requiresNetwork];
}

- (double)weightForActivity:(id)a3
{
  return (double)(unint64_t)(12 * (100 - (void)[a3 schedulingPriority])) / 100.0;
}

- (int64_t)companionMinimumQualityForActivity:(id)a3 interface:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 schedulingPriority];
  if ((unint64_t)v6 >= _DASSchedulingPriorityUserInitiated)
  {
    int64_t v8 = 20LL;
    goto LABEL_11;
  }

  unsigned __int8 v7 = [v5 deferred];
  int64_t v8 = 20LL;
  if (a4 != 3 && (v7 & 1) == 0)
  {
    if (a4 == 1)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 startBefore]);
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      if (v11 < 0.0)
      {
LABEL_9:
        int64_t v8 = 50LL;
        goto LABEL_11;
      }
    }

    id v12 = [v5 transferSize];
    id v13 = [v5 schedulingPriority];
    if ((unint64_t)v13 > _DASSchedulingPriorityMaintenance
      || (objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v5 launchReason]),
          unsigned __int8 v15 = [v14 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification],
          v14,
          (v15 & 1) != 0))
    {
LABEL_8:
      id v16 = [v5 schedulingPriority];
      if ((unint64_t)v16 > _DASSchedulingPriorityUtility
        || (a4 != 2 || (unint64_t)v12 < _DASActivityTransferSizeLarge)
        && (a4 != 1 || (unint64_t)v12 < _DASActivityTransferSizeVeryLarge))
      {
        goto LABEL_9;
      }

- (double)companionScoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  if (a9) {
    *a9 = a4 > 0;
  }
  if (a4 >= 1) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.0;
  }
  if (a4 >= 1 && !a7)
  {
    double v16 = 0.0;
    if (-[_DASNetworkQualityPolicy minimumQualityForActivity:interface:interfaceSubtype:]( self,  "minimumQualityForActivity:interface:interfaceSubtype:",  v15,  a5,  a6) <= a4)
    {
      id v17 = [v15 schedulingPriority];
      if ((unint64_t)v17 >= _DASSchedulingPriorityUserInitiated)
      {
        double v16 = (double)a4;
        goto LABEL_22;
      }

      id v18 = [v15 transferSize];
      if (a5 != 2 || (unint64_t)v18 <= _DASActivityTransferSizeLarge)
      {
        if ((unint64_t)v18 <= _DASActivityTransferSizeVerySmall)
        {
          if (a5 == 1 || v9)
          {
            BOOL v26 = a4 == 50;
            double v27 = 1.0;
LABEL_31:
            double v28 = 0.75;
LABEL_37:
            if (v26) {
              double v16 = v28;
            }
            else {
              double v16 = v27;
            }
            goto LABEL_22;
          }

          double v16 = 1.0;
          if (a5 != 2) {
            goto LABEL_22;
          }
        }

        else
        {
          if ((unint64_t)v18 <= _DASActivityTransferSizeSmall)
          {
            if (a5 == 1 || v9)
            {
              BOOL v26 = a4 == 100;
              double v27 = 0.5;
              double v28 = 1.0;
            }

            else
            {
              double v16 = 1.0;
              if (a5 != 2) {
                goto LABEL_22;
              }
              BOOL v26 = a4 == 100;
              double v27 = 0.25;
              double v28 = 0.5;
            }

            goto LABEL_37;
          }

          if ((unint64_t)v18 > _DASActivityTransferSizeModerate)
          {
            if ((unint64_t)v18 > _DASActivityTransferSizeLarge)
            {
              if ((unint64_t)v18 > _DASActivityTransferSizeVeryLarge)
              {
                if (a5 == 1)
                {
                  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 startBefore]);
                  [v19 timeIntervalSinceNow];
                  double v21 = v20;

                  if (v21 >= 0.0) {
                    double v16 = 0.0;
                  }
                  else {
                    double v16 = 0.1;
                  }
                }

                goto LABEL_22;
              }

              if (a5 == 1) {
                double v16 = 0.25;
              }
              else {
                double v16 = 1.0;
              }
              goto LABEL_50;
            }

            if (a5 != 1)
            {
              double v16 = 1.0;
LABEL_50:
              if (a5 != 2) {
                goto LABEL_22;
              }
              BOOL v23 = a4 == 100;
              double v24 = 0.1;
              double v25 = 0.0;
              goto LABEL_27;
            }

            BOOL v26 = a4 == 100;
            double v27 = 0.5;
            goto LABEL_31;
          }

          if (a5 != 1 && !v9)
          {
            double v16 = 1.0;
            if (a5 != 2) {
              goto LABEL_22;
            }
            BOOL v26 = a4 == 100;
            double v27 = 0.0;
            double v28 = 0.25;
            goto LABEL_37;
          }
        }

        BOOL v23 = a4 == 100;
        double v24 = 0.9;
        double v25 = 0.5;
LABEL_27:
        if (v23) {
          double v16 = v24;
        }
        else {
          double v16 = v25;
        }
      }
    }
  }

- (int64_t)minimumQualityForActivity:(id)a3 interface:(int64_t)a4 interfaceSubtype:(int64_t)a5
{
  return -[_DASNetworkQualityPolicy companionMinimumQualityForActivity:interface:]( self,  "companionMinimumQualityForActivity:interface:",  a3,  a4,  a5);
}

- (double)scoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  return result;
}

- (BOOL)isiCloudKeychainActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresNetwork])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications", 0));
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) lowercaseString]);
          if ([v9 containsString:@"securityd"])
          {

LABEL_15:
            BOOL v11 = 1;
            goto LABEL_16;
          }

          unsigned __int8 v10 = [v9 containsString:@"trustedpeershelper"];

          if ((v10 & 1) != 0) {
            goto LABEL_15;
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        BOOL v11 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v11 = 0;
    }

- (BOOL)unconstrainedNetworkAvailableForActivity:(id)a3 withContext:(id)a4 withRationale:(id)a5
{
  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100043500;
  uint64_t v19 = &unk_100115148;
  double v20 = self;
  id v7 = a4;
  id v21 = v7;
  if (qword_100157910 != -1) {
    dispatch_once(&qword_100157910, &v16);
  }
  int64_t v8 = objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale);
  BOOL v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( v8,  "initWithPolicyName:",  self->_policyName,  v16,  v17,  v18,  v19,  v20);
  unsigned __int8 v10 = objc_autoreleasePoolPush();
  unsigned __int8 v11 = -[_DASNetworkEvaluationMonitor isNetworkPathAvailableForActivity:]( self->_networkEvaluator,  "isNetworkPathAvailableForActivity:",  v6);
  objc_autoreleasePoolPop(v10);
  if ((v11 & 1) == 0)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"networkPathAvailability",  1.0,  0.0);
    -[_DASPolicyResponseRationale setResponseOptions:]( v9,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v9, "responseOptions") | 1);
LABEL_9:
    uint64_t v13 = 100LL;
    goto LABEL_10;
  }

  id v12 = [v6 schedulingPriority];
  if ((unint64_t)v12 < _DASSchedulingPriorityUtility
    && ([v6 deferred] & 1) == 0
    && !-[_DASNetworkQualityPolicy unconstrainedNetworkAvailableForActivity:withContext:withRationale:]( self,  "unconstrainedNetworkAvailableForActivity:withContext:withRationale:",  v6,  v7,  v9))
  {
    -[_DASPolicyResponseRationale setResponseOptions:]( v9,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v9, "responseOptions") | 2);
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"unconstrainedNetworkAvailable",  1.0,  0.0);
    goto LABEL_9;
  }

  uint64_t v13 = 0LL;
LABEL_10:
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v13,  v9,  (double)0x384uLL));

  return v14;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (_CDContextualKeyPath)wifiStatus
{
  return self->_wifiStatus;
}

- (void)setWifiStatus:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASNetworkEvaluationMonitor)networkEvaluator
{
  return self->_networkEvaluator;
}

- (void)setNetworkEvaluator:(id)a3
{
}

- (_CDContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (_DKPredictionTimeline)wifiPredictionTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setWifiPredictionTimeline:(id)a3
{
}

- (NSDictionary)lowCongestionHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLowCongestionHours:(id)a3
{
}

- (NSDictionary)discountedHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDiscountedHours:(id)a3
{
}

- (void).cxx_destruct
{
}

@end