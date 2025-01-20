@interface SUControllerEventReporter
+ (id)_newEventWithName:(id)a3;
+ (id)addApplyInfoToUMEventFields:(id)a3 withApplyInvokedBy:(id)a4;
+ (id)newPreflightOptionsForSessionUUID:(id)a3 withDescriptor:(id)a4;
+ (id)newUMContextFromConfig:(id)a3;
+ (id)newUMEventFieldsFromConfig:(id)a3 forSessionUUID:(id)a4 reason:(id)a5;
+ (void)_describeAndReportEvent:(id)a3 withControllerConfig:(id)a4 withControllerStatus:(id)a5 forSessionUUID:(id)a6 fromCurrentState:(int64_t)a7 targetingUpdateState:(int64_t)a8 activeDescriptor:(id)a9;
+ (void)_extendWithCommonFields:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5;
+ (void)reportAbandonedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 abandonedDescriptor:(id)a8 dueToError:(id)a9;
+ (void)reportAvailableEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 availableDescriptor:(id)a8;
+ (void)reportDownloadedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 downloadedDescriptor:(id)a8;
+ (void)reportPostponedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 postponedDescriptor:(id)a8 dueToError:(id)a9;
@end

@implementation SUControllerEventReporter

+ (id)newPreflightOptionsForSessionUUID:(id)a3 withDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003E108(v12);
    }

    v7 = 0LL;
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  kMSUOptionsKeyFirstPreflightPhase);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v5, @"UpdateUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 productBuildVersion]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 productBuildVersion]);
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v14, @"Build");
    }

    +[SUControllerEventReporter _addRecordingServiceBaseURLToOptions:withDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "_addRecordingServiceBaseURLToOptions:withDescriptor:",  v9,  v6);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, kMSUUpdateAttributesDictionaryKey);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  kMSUOptionsKeyRecordPreflightEvents);
  }

  return v7;
}

+ (id)newUMEventFieldsFromConfig:(id)a3 forSessionUUID:(id)a4 reason:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v8) {
    +[SUControllerEventReporter _extendWithCommonFields:withControllerConfig:forSessionUUID:]( &OBJC_CLASS___SUControllerEventReporter,  "_extendWithCommonFields:withControllerConfig:forSessionUUID:",  v8,  v6,  v7);
  }

  return v8;
}

+ (id)newUMContextFromConfig:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 updateMetricContext]);

  if (!v4)
  {
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v9 = [v3 useSUCore];
    BOOL v10 = @"false";
    if (v9) {
      BOOL v10 = @"true";
    }
    v11 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@=%@", @"SUCUsingSUCore", v10);
    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 updateMetricContext]);
  unsigned __int8 v6 = [v5 isEqualToString:@"none"];

  if ((v6 & 1) == 0)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue([v3 updateMetricContext]);
LABEL_8:
    id v7 = v11;
    goto LABEL_9;
  }

  id v7 = 0LL;
LABEL_9:

  return v7;
}

+ (void)reportAvailableEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 availableDescriptor:(id)a8
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = +[SUControllerEventReporter _newEventWithName:]( &OBJC_CLASS___SUControllerEventReporter,  "_newEventWithName:",  kSUCoreControllerEventOTAAvailable);
  if (v16) {
    +[SUControllerEventReporter _describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateState:activeDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "_describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateS tate:activeDescriptor:",  v16,  v13,  v17,  v14,  a6,  a7,  v15);
  }
}

+ (void)reportDownloadedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 downloadedDescriptor:(id)a8
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = +[SUControllerEventReporter _newEventWithName:]( &OBJC_CLASS___SUControllerEventReporter,  "_newEventWithName:",  kSUCoreControllerEventOTADownloaded);
  if (v16) {
    +[SUControllerEventReporter _describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateState:activeDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "_describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateS tate:activeDescriptor:",  v16,  v13,  v17,  v14,  a6,  a7,  v15);
  }
}

+ (void)reportPostponedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 postponedDescriptor:(id)a8 dueToError:(id)a9
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[SUControllerEventReporter _newEventWithName:]( &OBJC_CLASS___SUControllerEventReporter,  "_newEventWithName:",  kSUCoreControllerEventOTAPostponed);
  if (v18)
  {
    if (v17) {
      +[SUCoreEventReporter augmentEvent:withError:]( &OBJC_CLASS___SUCoreEventReporter,  "augmentEvent:withError:",  v18,  v17);
    }
    +[SUControllerEventReporter _describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateState:activeDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "_describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateS tate:activeDescriptor:",  v18,  v14,  v19,  v15,  a6,  a7,  v16);
  }
}

+ (void)reportAbandonedEvent:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5 fromCurrentState:(int64_t)a6 targetingUpdateState:(int64_t)a7 abandonedDescriptor:(id)a8 dueToError:(id)a9
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[SUControllerEventReporter _newEventWithName:]( &OBJC_CLASS___SUControllerEventReporter,  "_newEventWithName:",  kSUCoreControllerEventOTAAbandoned);
  if (v18)
  {
    if (v17) {
      +[SUCoreEventReporter augmentEvent:withError:]( &OBJC_CLASS___SUCoreEventReporter,  "augmentEvent:withError:",  v18,  v17);
    }
    +[SUControllerEventReporter _describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateState:activeDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "_describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUpdateS tate:activeDescriptor:",  v18,  v14,  v19,  v15,  a6,  a7,  v16);
  }
}

+ (id)_newEventWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = v4;
  if (v4)
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v3, kSUCoreEventNameKey);
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003E148((uint64_t)v3, v7);
    }
  }

  return v5;
}

+ (void)_extendWithCommonFields:(id)a3 withControllerConfig:(id)a4 forSessionUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"SUC-%@",  @"4.2.1");
  unsigned int v10 = [v8 useSUCore];
  v11 = @"false";
  if (v10) {
    v11 = @"true";
  }
  v12 = v11;
  unsigned int v13 = [v8 performAutoInstall];
  id v14 = @"autoOff";
  if (v13) {
    id v14 = @"autoOn";
  }
  id v15 = v14;
  id v16 = +[SUControllerEventReporter newUMContextFromConfig:]( &OBJC_CLASS___SUControllerEventReporter,  "newUMContextFromConfig:",  v8);

  [v9 setSafeObject:v17 forKey:kSUCoreControllerControllerVersionKey];
  [v9 setSafeObject:v12 forKey:@"SUCUsingSUCore"];

  [v9 setSafeObject:v16 forKey:kSUCoreEventContextKey];
  [v9 setSafeObject:v7 forKey:kSUCoreEventUUIDKey];

  [v9 setSafeObject:v15 forKey:kSUCoreControllerInstallTonightKey];
}

+ (id)addApplyInfoToUMEventFields:(id)a3 withApplyInvokedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
  }
  else {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v8 = v7;
  if (v7) {
    -[NSMutableDictionary setSafeObject:forKey:](v7, "setSafeObject:forKey:", v6, @"applyInvokedBy");
  }

  return v8;
}

+ (void)_describeAndReportEvent:(id)a3 withControllerConfig:(id)a4 withControllerStatus:(id)a5 forSessionUUID:(id)a6 fromCurrentState:(int64_t)a7 targetingUpdateState:(int64_t)a8 activeDescriptor:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  uint64_t v16 = kSUCoreEventNameKey;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 safeStringForKey:v16]);
  +[SUControllerEventReporter _extendWithCommonFields:withControllerConfig:forSessionUUID:]( &OBJC_CLASS___SUControllerEventReporter,  "_extendWithCommonFields:withControllerConfig:forSessionUUID:",  v14,  v19,  v17);

  [v14 setSafeObject:v18 forKey:kSUCoreControllerControllerStatusKey];
  if (v15)
  {
    unsigned int v21 = [v15 fullReplacement];
    v22 = @"incremental";
    if (v21) {
      v22 = @"full";
    }
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v15 productBuildVersion]);
    [v14 setSafeObject:v24 forKey:kSUCoreControllerTargetOsVersionKey];

    [v14 setSafeObject:v23 forKey:kSUCoreControllerUpdateTypeKey];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  a7));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  a8));
    int v30 = 138544130;
    v31 = v20;
    __int16 v32 = 2114;
    v33 = v27;
    __int16 v34 = 2114;
    v35 = v28;
    __int16 v36 = 2114;
    id v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORT(%{public}@)] %{public}@ (targeting %{public}@) | reporting OTA event:%{public}@",  (uint8_t *)&v30,  0x2Au);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreEventReporter sharedReporter](&OBJC_CLASS___SUCoreEventReporter, "sharedReporter"));
  [v29 sendEvent:v14 toServerURL:0];
}

@end