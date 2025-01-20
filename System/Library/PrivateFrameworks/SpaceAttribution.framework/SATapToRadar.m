@interface SATapToRadar
+ (BOOL)forceTTR;
+ (BOOL)isTTREnabled;
+ (BOOL)shouldOpenRadar:(BOOL)a3;
+ (id)getLastTTRNotificationDate;
+ (void)sendTapToRadarNotificationWithDescription:(id)a3 highPriorityProblem:(BOOL)a4;
+ (void)setEnableTTR:(BOOL)a3;
+ (void)setForceTTR:(BOOL)a3;
+ (void)updateLastTTRNotificationDate;
@end

@implementation SATapToRadar

+ (BOOL)forceTTR
{
  return byte_10005AB28;
}

+ (void)setForceTTR:(BOOL)a3
{
  byte_10005AB28 = a3;
}

+ (BOOL)isTTREnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SARunTimeDataManager runTimeDataObjectForKey:]( &OBJC_CLASS___SARunTimeDataManager,  "runTimeDataObjectForKey:",  @"enableTTRNotification"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (void)setEnableTTR:(BOOL)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  +[SARunTimeDataManager setRunTimeDataObject:forKey:]( &OBJC_CLASS___SARunTimeDataManager,  "setRunTimeDataObject:forKey:",  v3,  @"enableTTRNotification");
}

+ (void)updateLastTTRNotificationDate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  +[SARunTimeDataManager setRunTimeDataObject:forKey:]( &OBJC_CLASS___SARunTimeDataManager,  "setRunTimeDataObject:forKey:",  v2,  @"lastTTRNotificationDate");
}

+ (id)getLastTTRNotificationDate
{
  return +[SARunTimeDataManager runTimeDataObjectForKey:]( &OBJC_CLASS___SARunTimeDataManager,  "runTimeDataObjectForKey:",  @"lastTTRNotificationDate");
}

+ (BOOL)shouldOpenRadar:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATapToRadar getLastTTRNotificationDate](&OBJC_CLASS___SATapToRadar, "getLastTTRNotificationDate"));
  if (!+[SATapToRadar forceTTR](&OBJC_CLASS___SATapToRadar, "forceTTR"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v5 timeIntervalSinceDate:v4];
      double v7 = v6;

      if (v7 < 604800.0)
      {
LABEL_10:
        BOOL v9 = 0;
        goto LABEL_11;
      }
    }
  }

  if (!a3)
  {
    BOOL v8 = +[SATapToRadar isTTREnabled](&OBJC_CLASS___SATapToRadar, "isTTREnabled");
    if (!v8)
    {
      uint64_t v10 = SALog(v8);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "not sending Tap-To-Radar notification",  v13,  2u);
      }

      goto LABEL_10;
    }
  }

  +[SATapToRadar updateLastTTRNotificationDate](&OBJC_CLASS___SATapToRadar, "updateLastTTRNotificationDate");
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (void)sendTapToRadarNotificationWithDescription:(id)a3 highPriorityProblem:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (objc_opt_class(&OBJC_CLASS___TapToRadarService))
  {
    if (os_variant_has_internal_ui(0LL))
    {
      BOOL v6 = +[SATapToRadar shouldOpenRadar:](&OBJC_CLASS___SATapToRadar, "shouldOpenRadar:", v4);
      if (v6)
      {
        uint64_t v7 = SALog(v6);
        BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100033B00(v8);
        }

        BOOL v9 = (void *)objc_opt_new(&OBJC_CLASS___RadarDraft);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[SpaceAttribution Telemetry] Inconsistent Disk Space Result (%@)",  v5));
        [v9 setTitle:v10];

        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"An inconsistent result was detected on your device during disk space usage telemetry collection.\n** %@ **\nPlease file this Radar with diagnostics to help us root-cause the issue.",  v5));
        [v9 setProblemDescription:v11];

        id v12 = [[RadarComponent alloc] initWithName:@"SpaceAttributionFramework" version:@"TTR" identifier:1509660];
        [v9 setComponent:v12];

        [v9 setReproducibility:5];
        [v9 setClassification:6];
        [v9 setDiagnosticExtensionIDs:&off_10004FCA8];
        [v9 setAttachments:0];
        [v9 setAutoDiagnostics:0];
        objc_msgSend(v9, "setIsUserInitiated:", +[SATapToRadar forceTTR](SATapToRadar, "forceTTR"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
        [v13 createDraft:v9 forProcessNamed:@"SpaceForceTelemetry" withDisplayReason:@"disk space usage calculation is inconsistent" completionHandler:&stru_10004D300];

        +[SATapToRadar setForceTTR:](&OBJC_CLASS___SATapToRadar, "setForceTTR:", 0LL);
      }
    }
  }
}

@end