@interface _DASBGSystemTask
+ (BOOL)hasFastPassRun:(id)a3 semanticVersion:(int64_t)a4;
+ (BOOL)resetFastPass:(id)a3 resetAll:(BOOL)a4;
+ (id)allFastPassIdentifiers;
+ (id)resourcesDescriptionFromBitmap:(int64_t)a3;
+ (id)taskNameWithIdentifier:(id)a3 UID:(unsigned int)a4;
+ (void)garbageCollectActivityDates;
+ (void)initialize;
+ (void)markFastPassActivityDone:(id)a3 semanticVersion:(int64_t)a4;
- (BOOL)app_refresh;
- (BOOL)backlogged;
- (BOOL)beforeApplicationLaunch;
- (BOOL)blockRebootActivitiesForSU;
- (BOOL)bypassBatteryAging;
- (BOOL)bypassPeakPower;
- (BOOL)communicates_with_paired_device;
- (BOOL)data_budgeted;
- (BOOL)duet_power_budgeted;
- (BOOL)hasInstallActivityRun;
- (BOOL)magneticInterferenceSensitivity;
- (BOOL)mailFetch;
- (BOOL)may_reboot_device;
- (BOOL)overrideRateLimiting;
- (BOOL)post_install;
- (BOOL)power_nap;
- (BOOL)prevents_device_sleep;
- (BOOL)reRun;
- (BOOL)repeating;
- (BOOL)requestsApplicationLaunch;
- (BOOL)requiresExternalPower;
- (BOOL)requiresRemoteDeviceWake;
- (BOOL)requiresUserInactivity;
- (BOOL)requires_buddy_complete;
- (BOOL)requires_inexpensive_network;
- (BOOL)requires_network_connectivity;
- (BOOL)requires_significant_user_inactivity;
- (BOOL)requires_unconstrained_network;
- (BOOL)resource_intensive;
- (BOOL)runOnAppForeground;
- (BOOL)shouldWakeDevice;
- (BOOL)useStatisticalModelForTriggersRestart;
- (BOOL)user_requested_backup_task;
- (BOOL)validateFastPassSubmissionForActivity:(id)a3 featureCodes:(id)a4 service:(id)a5;
- (BOOL)validateFeatureCodes:(id)a3 forToken:(unint64_t)a4;
- (NSArray)featureCodes;
- (NSArray)involved_processes;
- (NSArray)processingTaskIdentifiers;
- (NSArray)related_applications;
- (NSDate)baseTime;
- (NSDate)startTime;
- (NSSet)dependencies;
- (NSSet)produced_result_identifiers;
- (NSString)dataBudgetName;
- (NSString)diskVolume;
- (NSString)group_name;
- (NSString)identifier;
- (NSString)name;
- (NSString)rateLimitConfigurationName;
- (NSString)remoteDevice;
- (NSString)serviceName;
- (OS_dispatch_source)dispatchSourceProcessExit;
- (OS_nw_endpoint)network_endpoint;
- (OS_nw_parameters)network_parameters;
- (OS_xpc_object)descriptor;
- (_DASActivity)scheduler_activity;
- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7;
- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7 task:(id)a8;
- (double)expected_duration;
- (double)initialDelay;
- (double)interval;
- (double)minDurationBetweenInstances;
- (double)random_initial_delay;
- (double)startAfter;
- (double)tempDelay;
- (double)trySchedulingBefore;
- (id)aboutMe;
- (id)deadlineTime;
- (id)description;
- (id)eligibleTime;
- (id)getActivityBaseTime;
- (id)resourcesDescription;
- (id)stateString;
- (int)pid;
- (int64_t)expected_network_download_size_bytes;
- (int64_t)expected_network_upload_size_bytes;
- (int64_t)priority;
- (int64_t)requires_protection_class;
- (int64_t)resources;
- (int64_t)run_on_motion_state;
- (int64_t)semanticVersion;
- (int64_t)state;
- (int64_t)targetDevice;
- (int64_t)type;
- (unint64_t)group_concurrency_limit;
- (unint64_t)requiresMinimumBatteryLevel;
- (unint64_t)requiresMinimumDataBudgetPercentage;
- (unint64_t)suspensionReason;
- (unint64_t)token;
- (unsigned)uid;
- (void)adjustBaseTimeByOffset:(double)a3;
- (void)advanceBaseTime;
- (void)loadBaseTime;
- (void)markInstallActivityDone;
- (void)markStarted:(id)a3;
- (void)markStopped:(id)a3;
- (void)resetBaseTime;
- (void)saveActivityBaseTime:(id)a3;
- (void)setBacklogged:(BOOL)a3;
- (void)setBlockRebootActivitiesForSU:(BOOL)a3;
- (void)setBypassBatteryAging:(BOOL)a3;
- (void)setBypassPeakPower:(BOOL)a3;
- (void)setDispatchSourceProcessExit:(id)a3;
- (void)setFeatureCodes:(id)a3;
- (void)setMagneticInterferenceSensitivity:(BOOL)a3;
- (void)setMailFetch:(BOOL)a3;
- (void)setOverrideRateLimiting:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setProcessingTaskIdentifiers:(id)a3;
- (void)setReRun:(BOOL)a3;
- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3;
- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3;
- (void)setScheduler_activity:(id)a3;
- (void)setSemanticVersion:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSuspensionReason:(unint64_t)a3;
- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3;
- (void)updateFeatureCodesForActivity:(id)a3;
@end

@implementation _DASBGSystemTask

+ (void)initialize
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"BGST"));
  v4 = (void *)qword_1001579B8;
  qword_1001579B8 = v3;

  v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.bg.system.task");
  v6 = (void *)qword_1001579C0;
  qword_1001579C0 = (uint64_t)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 dictionaryForKey:@"ActivityBaseDates"]);
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    v10 = (void *)qword_1001579C8;
    qword_1001579C8 = (uint64_t)v9;

    +[_DASBGSystemTask garbageCollectActivityDates](&OBJC_CLASS____DASBGSystemTask, "garbageCollectActivityDates");
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v12 = (void *)qword_1001579C8;
    qword_1001579C8 = v11;
  }

  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTaskHelper activityQueue]( &OBJC_CLASS____DASBGSystemTaskHelper,  "activityQueue"));
  dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v13);
  v15 = (void *)qword_1001579D0;
  qword_1001579D0 = (uint64_t)v14;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10004996C;
  handler[3] = &unk_100114FE0;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001579D0, handler);
  v16 = (dispatch_source_s *)qword_1001579D0;
  dispatch_time_t v17 = dispatch_time(0LL, 86400000000000LL);
  dispatch_source_set_timer(v16, v17, 0x4E94914F0000uLL, 0x13A52453C000uLL);
  dispatch_activate((dispatch_object_t)qword_1001579D0);
}

+ (void)garbageCollectActivityDates
{
  if ([(id)qword_1001579C8 count])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:-4838400.0]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001579C8, "allKeys", 0));
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C8 objectForKeyedSubscript:v9]);
          if ([v10 compare:v3] == (id)-1)
          {
            [(id)qword_1001579C8 removeObjectForKey:v9];
          }

          else if ([v10 compare:v2] == (id)1)
          {
            [(id)qword_1001579C8 setObject:v2 forKeyedSubscript:v9];
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7
{
  return -[_DASBGSystemTask initWithDescriptor:withToken:withUID:withService:staticSubmission:task:]( self,  "initWithDescriptor:withToken:withUID:withService:staticSubmission:task:",  a3,  a4,  *(void *)&a5,  a6,  a7,  0LL);
}

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7 task:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v132 = a6;
  id v133 = a8;
  v138.receiver = self;
  v138.super_class = (Class)&OBJC_CLASS____DASBGSystemTask;
  v15 = -[_DASBGSystemTask init](&v138, "init");

  if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_1000B4278();
  }
  if ((xpc_get_event_name("com.apple.bg.system.task", a4, v143) & 1) == 0)
  {
    v21 = (os_log_s *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4238(v21);
    }
    goto LABEL_9;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v143));
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v16;

  v15->_token = a4;
  v15->_uid = a5;
  objc_storeStrong((id *)&v15->_serviceName, a6);
  v15->_suspensionReason = -1LL;
  if (xpc_dictionary_get_BOOL(v14, "PostInstall"))
  {
    if (-[_DASBGSystemTask hasInstallActivityRun](v15, "hasInstallActivityRun"))
    {
      v18 = (void *)qword_1001579B8;
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: postinstall activity has already run on this build",  buf,  0xCu);
      }

      goto LABEL_9;
    }

    v15->_post_install = 1;
  }

  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v14, "RepeatingTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  v26 = v25;
  if (!v25 || xpc_get_type(v25) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v15->_type = 1LL;
    v15->_double startAfter = 0.0;
    v15->_trySchedulingBefore = 0.0;
    xpc_object_t v27 = xpc_dictionary_get_dictionary(v14, "NonRepeatingTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (!v28 || xpc_get_type(v28) != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_46;
    }
    v129 = (void *)_CFXPCCreateCFObjectFromXPCObject(v28);
    v130 = (void *)objc_claimAutoreleasedReturnValue([v129 objectForKey:@"FastPassTask"]);
    if (!v130)
    {
LABEL_45:
      v51 = (void *)objc_claimAutoreleasedReturnValue([v129 objectForKeyedSubscript:@"ScheduleAfter"]);
      v15->_double startAfter = (double)(int)[v51 intValue];

      v52 = (void *)objc_claimAutoreleasedReturnValue([v129 objectForKeyedSubscript:@"TrySchedulingBefore"]);
      v15->_trySchedulingBefore = (double)(int)[v52 intValue];

LABEL_46:
      double startAfter = v15->_startAfter;
      if (v15->_trySchedulingBefore < startAfter) {
        v15->_trySchedulingBefore = startAfter;
      }
      v26 = v28;
      goto LABEL_49;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v130 objectForKey:@"SemanticVersion"]);
    v15->_semanticVersion = (int)[v29 intValue];

    v30 = (void *)objc_claimAutoreleasedReturnValue([v130 objectForKey:@"ReRun"]);
    v15->_reRun = [v30 BOOLValue];

    if (v9)
    {
      if (v15->_reRun)
      {
        v31 = (void *)qword_1001579B8;
        if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
          sub_1000B4088(v31, v15);
        }
LABEL_34:

LABEL_9:
        v22 = 0LL;
        goto LABEL_10;
      }
    }

    else if (v15->_reRun)
    {
LABEL_39:
      v45 = (os_log_s *)(id)qword_1001579B8;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = (id)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        unsigned int v47 = -[_DASBGSystemTask semanticVersion](v15, "semanticVersion");
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%{public}@ v%d: Allowing FastPass resubmission",  buf,  0x12u);
      }

      v48 = (void *)objc_opt_class(v15);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
      [v48 resetFastPass:v49 resetAll:0];

LABEL_42:
      v50 = (void *)objc_claimAutoreleasedReturnValue([v130 objectForKey:@"ProcessingTaskIdentifiers"]);
      if ([v50 count]) {
        objc_storeStrong((id *)&v15->_processingTaskIdentifiers, v50);
      }
      v15->_type = 3LL;

      goto LABEL_45;
    }

    v38 = (void *)objc_opt_class(v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
    LODWORD(v38) = objc_msgSend( v38,  "hasFastPassRun:semanticVersion:",  v39,  -[_DASBGSystemTask semanticVersion](v15, "semanticVersion"));

    if ((_DWORD)v38)
    {
      v40 = (void *)qword_1001579B8;
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        unsigned int v43 = -[_DASBGSystemTask semanticVersion](v15, "semanticVersion");
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ v%d: FastPass activity has already run on this release",  buf,  0x12u);
      }

      goto LABEL_34;
    }

    if (!v15->_reRun) {
      goto LABEL_42;
    }
    goto LABEL_39;
  }

  if (v15->_post_install)
  {
    v32 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B41A8(v32, v15);
    }

    goto LABEL_9;
  }

  v33 = (void *)_CFXPCCreateCFObjectFromXPCObject(v26);
  v15->_type = 2LL;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Interval"]);
  v15->_double interval = (double)(int)[v34 intValue];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"MinDurationBetweenInstances"]);
  v15->_double minDurationBetweenInstances = (double)(int)[v35 intValue];

  double interval = v15->_interval;
  if (interval < 300.0)
  {
    v44 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4118(v44, v15);
    }

    goto LABEL_9;
  }

  double minDurationBetweenInstances = v15->_minDurationBetweenInstances;

LABEL_49:
  xpc_object_t array = xpc_dictionary_get_array(v14, "FeatureCodes");
  v55 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v55 && xpc_get_type(v55) == (xpc_type_t)&_xpc_type_array)
  {
    v60 = (void *)_CFXPCCreateCFObjectFromXPCObject(v55);
    if ([v60 count])
    {
      if (-[_DASBGSystemTask validateFeatureCodes:forToken:](v15, "validateFeatureCodes:forToken:", v60, a4))
      {
        objc_storeStrong((id *)&v15->_featureCodes, v60);

        goto LABEL_51;
      }

      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
        sub_1000B4024();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR))
    {
      sub_1000B3FC0();
    }

    goto LABEL_9;
  }

- (BOOL)validateFeatureCodes:(id)a3 forToken:(unint64_t)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForPlist:2]);

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
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "stringValue", (void)v16));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v12]);

        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (void)updateFeatureCodesForActivity:(id)a3
{
  id v4 = a3;
  if (self->_featureCodes)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForPlist:0]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
    id v8 = v7;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
        sub_1000B4420();
      }
      goto LABEL_20;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"FeatureCodes"]);
    id v10 = -[NSArray mutableCopy](self->_featureCodes, "mutableCopy");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    __int128 v13 = v11;
    if (v12)
    {
      id v14 = v12;
      v22 = v6;
      char v15 = 0;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          if (([v10 containsObject:v18] & 1) == 0)
          {
            [v10 addObject:v18];
            char v15 = 1;
          }
        }

        id v14 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v14);

      id v6 = v22;
      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
      __int128 v19 = self->_featureCodes;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v19));
      [v13 addObjectsFromArray:v10];
      v20 = (NSArray *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
      featureCodes = self->_featureCodes;
      self->_featureCodes = v20;
    }

LABEL_15:
LABEL_20:

    goto LABEL_21;
  }

  if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
    sub_1000B43BC();
  }
LABEL_21:
}

- (BOOL)validateFastPassSubmissionForActivity:(id)a3 featureCodes:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryForPlist:0]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
  __int128 v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4420();
    }
    goto LABEL_16;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Service"]);
  unsigned __int8 v15 = [v9 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4524();
    }
LABEL_16:
    BOOL v23 = 0;
    goto LABEL_23;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"FeatureCodes"]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    id v26 = v8;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if (([v16 containsObject:v22] & 1) == 0)
        {
          __int128 v24 = (void *)qword_1001579B8;
          if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
            sub_1000B4484(v24, v22, (uint64_t)v7);
          }
          BOOL v23 = 0;
          goto LABEL_20;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }

    BOOL v23 = 1;
LABEL_20:
    id v8 = v26;
  }

  else
  {
    BOOL v23 = 1;
  }

LABEL_23:
  return v23;
}

+ (id)taskNameWithIdentifier:(id)a3 UID:(unsigned int)a4
{
  return a3;
}

- (NSString)name
{
  return (NSString *)[(id)objc_opt_class(self) taskNameWithIdentifier:self->_identifier UID:self->_uid];
}

+ (BOOL)hasFastPassRun:(id)a3 semanticVersion:(int64_t)a4
{
  id v19 = 0LL;
  id v5 = a3;
  if (qword_1001579D8) {
    goto LABEL_2;
  }
  if (!sysctlbyname_get_data_np("kern.osrelease", &v19, &qword_1001579D8))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    free(v19);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@"."]);
    if ([v8 count]) {
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    }
    else {
      id v6 = &stru_100118C98;
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 stringForKey:@"ProductRelease"]);
    __int128 v13 = (void *)v12;
    if (v12) {
      id v14 = (__CFString *)v12;
    }
    else {
      id v14 = &stru_100118C98;
    }
    unsigned __int8 v15 = v14;

    uint64_t v16 = (os_log_s *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v21 = v6;
      *(_WORD *)&v21[8] = 2112;
      v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Product release: Current %@, Previous %@",  buf,  0x16u);
    }

    id v17 = [(id)qword_1001579C0 integerForKey:@"DASFastPassSemanticVersion"];
    id v18 = (os_log_s *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (_DWORD)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "DAS FastPass Semantic Version: Current %d, Previous %d",  buf,  0xEu);
    }

    if (!-[__CFString isEqualToString:](v15, "isEqualToString:", v6) || v17 != (id)1)
    {
      [(id)qword_1001579C0 removeObjectForKey:@"FastPassActivitiesRun"];
      [(id)qword_1001579C0 setObject:v6 forKey:@"ProductRelease"];
      [(id)qword_1001579C0 setInteger:1 forKey:@"DASFastPassSemanticVersion"];
      [(id)qword_1001579C0 synchronize];

      BOOL v9 = 0;
      goto LABEL_4;
    }

LABEL_2:
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 dictionaryForKey:@"FastPassActivitiesRun"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v6, "objectForKey:", v5));

    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_8;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v6, "objectForKey:", v5));
    BOOL v9 = (int)[v8 intValue] == a4;
LABEL_4:

LABEL_8:
    goto LABEL_9;
  }

  BOOL v9 = 1;
LABEL_9:

  return v9;
}

+ (void)markFastPassActivityDone:(id)a3 semanticVersion:(int64_t)a4
{
  id v5 = (void *)qword_1001579C0;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"FastPassActivitiesRun"]);
  id v11 = v7;
  if (v7) {
    id v8 = [v7 mutableCopy];
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  BOOL v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  [v9 setValue:v10 forKey:v6];

  [(id)qword_1001579C0 setObject:v9 forKey:@"FastPassActivitiesRun"];
  [(id)qword_1001579C0 synchronize];
}

+ (BOOL)resetFastPass:(id)a3 resetAll:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 dictionaryForKey:@"FastPassActivitiesRun"]);
  id v7 = v6;
  if (v6) {
    id v8 = [v6 mutableCopy];
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  BOOL v9 = v8;
  if (v4)
  {
    [v8 removeAllObjects];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASFeatureDurationTracker sharedInstance]( &OBJC_CLASS____DASFeatureDurationTracker,  "sharedInstance"));
    [v11 resetFeatureDurations];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    [v10 resetFastPassDependencies];
    LOBYTE(v11) = 1;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v5]);
    LODWORD(v11) = v12 != 0LL;

    if (v12) {
      [v9 removeObjectForKey:v5];
    }
    [v9 removeObjectForKey:v5];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    [v10 resetFastPassDependenciesForActivity:v5];
  }

  [(id)qword_1001579C0 setObject:v9 forKey:@"FastPassActivitiesRun"];
  [(id)qword_1001579C0 synchronize];

  return (char)v11;
}

+ (id)allFastPassIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForPlist:0]);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  id v8 = v7;

  return v8;
}

- (id)stateString
{
  unint64_t state = self->_state;
  if (state > 8) {
    return &stru_100118C98;
  }
  else {
    return *(&off_100116040 + state);
  }
}

- (id)aboutMe
{
  uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject(self->_descriptor);
  id v4 = [v3 mutableCopy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v4)
  {
    uint64_t v6 = _DASResourcesKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:_DASResourcesKey]);

    if (v7)
    {
      id v8 = (void *)objc_opt_class(self);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourcesDescriptionFromBitmap:", objc_msgSend(v9, "integerValue")));
      [v4 setObject:v10 forKeyedSubscript:v6];
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));
    [v5 setObject:v11 forKeyedSubscript:@"Criteria"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
    [v5 setObject:v12 forKeyedSubscript:@"ActivityName"];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v14 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v14, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss ZZZZ");
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    -[NSDateFormatter setLocale:](v14, "setLocale:", v15);

    if (self->_type == 2)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v14, "stringFromDate:", self->_baseTime));
      [v13 setObject:v16 forKeyedSubscript:@"BaseTime"];
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask scheduler_activity](self, "scheduler_activity"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 startAfter]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v14, "stringFromDate:", v18));
    [v13 setObject:v19 forKeyedSubscript:@"ScheduleAfter"];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask scheduler_activity](self, "scheduler_activity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 startBefore]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v14, "stringFromDate:", v21));
    [v13 setObject:v22 forKeyedSubscript:@"ScheduleBefore"];

    [v5 setObject:v13 forKeyedSubscript:@"Timings"];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask stateString](self, "stateString"));
    [v5 setObject:v23 forKeyedSubscript:@"State"];
  }

  return v5;
}

- (id)resourcesDescription
{
  return objc_msgSend( (id)objc_opt_class(self),  "resourcesDescriptionFromBitmap:",  -[_DASBGSystemTask resources](self, "resources"));
}

+ (id)resourcesDescriptionFromBitmap:(int64_t)a3
{
  char v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v4;
  if ((v3 & 1) != 0)
  {
    [v4 addObject:@"CPU"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }

  [v5 addObject:@"Memory"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v5 addObject:@"ANE"];
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (BOOL)hasInstallActivityRun
{
  id v8 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  if (!qword_1001579E0)
  {
    if (sysctlbyname_get_data_np("kern.osversion", &v8, &qword_1001579E0))
    {
      unsigned __int8 v4 = 1;
      goto LABEL_5;
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
    free(v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 stringForKey:@"ProductBuildVersion"]);
    if (([v7 isEqualToString:v6] & 1) == 0)
    {
      [(id)qword_1001579C0 removeObjectForKey:@"VersionSpecificActivitiesRun"];
      [(id)qword_1001579C0 setObject:v6 forKey:@"ProductBuildVersion"];
    }
  }

  char v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 arrayForKey:@"VersionSpecificActivitiesRun"]);
  unsigned __int8 v4 = [v3 containsObject:v2];

LABEL_5:
  return v4;
}

- (void)markInstallActivityDone
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001579C0 arrayForKey:@"VersionSpecificActivitiesRun"]);
  id v7 = v3;
  if (v3) {
    unsigned __int8 v4 = (NSMutableArray *)[v3 mutableCopy];
  }
  else {
    unsigned __int8 v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  }
  id v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  [(id)qword_1001579C0 setObject:v5 forKey:@"VersionSpecificActivitiesRun"];
}

- (double)initialDelay
{
  double random_initial_delay = self->_random_initial_delay;
  if (random_initial_delay == 0.0) {
    return 0.0;
  }
  else {
    return (double)arc4random_uniform(random_initial_delay);
  }
}

- (void)saveActivityBaseTime:(id)a3
{
  if (a3)
  {
    unsigned __int8 v4 = (void *)qword_1001579C8;
    id v5 = a3;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
    [v4 setValue:v5 forKey:v6];
  }

  [(id)qword_1001579C0 setObject:qword_1001579C8 forKey:@"ActivityBaseDates"];
}

- (id)getActivityBaseTime
{
  char v3 = (void *)qword_1001579C8;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:v4]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-4838400.0]);
  if (!v5 || [v5 compare:v7] == (id)-1 || objc_msgSend(v5, "compare:", v6) == (id)1)
  {
    -[_DASBGSystemTask initialDelay](self, "initialDelay");
    id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:"));
    -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v8);
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

- (void)loadBaseTime
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self->_type == 2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask getActivityBaseTime](self, "getActivityBaseTime"));
    baseTime = self->_baseTime;
    p_baseTime = (id *)&self->_baseTime;
    id *p_baseTime = (id)v3;

    uint64_t v6 = (NSDate *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:-*((double *)p_baseTime - 7)]);
    if ([*p_baseTime compare:v6] == (id)-1) {
      objc_storeStrong(p_baseTime, v6);
    }
  }

  else
  {
    -[_DASBGSystemTask initialDelay](self, "initialDelay");
    id v7 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
    uint64_t v6 = self->_baseTime;
    self->_baseTime = v7;
  }
}

- (void)advanceBaseTime
{
  uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self->_type != 2)
  {
    objc_storeStrong((id *)&self->_baseTime, v3);
    self->_tempDelay = 0.0;
    goto LABEL_19;
  }

  unsigned __int8 v4 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_baseTime, "dateByAddingTimeInterval:", self->_interval));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", self->_interval * -2.0));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", self->_interval + self->_interval));
  if (-[NSDate compare:](v4, "compare:", v5) == NSOrderedAscending)
  {
    id v7 = v5;

    uint64_t v12 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v12;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)__int128 v24 = 138543362;
      *(void *)&v24[4] = v10;
      id v11 = "Base Time is earlier than 2 * interval ago, moving forward for %{public}@";
      goto LABEL_9;
    }
  }

  else
  {
    if ((id)-[NSDate compare:](v4, "compare:", v6) != (id)1)
    {
      id v7 = v4;
      goto LABEL_11;
    }

    id v7 = v6;

    id v8 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)__int128 v24 = 138543362;
      *(void *)&v24[4] = v10;
      id v11 = "Base Time is later than 2 * interval from now, moving back for %{public}@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, v24, 0xCu);
    }
  }

- (void)resetBaseTime
{
  uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v3);
  baseTime = self->_baseTime;
  self->_baseTime = v3;
  uint64_t v6 = v3;

  startTime = self->_startTime;
  self->_startTime = 0LL;
}

- (id)eligibleTime
{
  if (self->_type == 2)
  {
    double tempDelay = self->_tempDelay;
    if (tempDelay == 0.0) {
      double tempDelay = self->_minDurationBetweenInstances;
    }
    baseTime = self->_baseTime;
  }

  else
  {
    double tempDelay = self->_startAfter;
    baseTime = self->_baseTime;
  }

  return (id)objc_claimAutoreleasedReturnValue( -[NSDate dateByAddingTimeInterval:]( baseTime,  "dateByAddingTimeInterval:",  tempDelay));
}

- (void)adjustBaseTimeByOffset:(double)a3
{
  unsigned __int8 v4 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_baseTime, "dateByAddingTimeInterval:", a3));
  baseTime = self->_baseTime;
  self->_baseTime = v4;
}

- (id)deadlineTime
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask eligibleTime](self, "eligibleTime"));
  uint64_t v4 = 15LL;
  if (self->_type == 2) {
    uint64_t v4 = 12LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDate dateByAddingTimeInterval:]( self->_baseTime,  "dateByAddingTimeInterval:",  *(double *)&(&self->super.isa)[v4]));
  if ([v5 compare:v3] == (id)1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (void)markStarted:(id)a3
{
}

- (void)markStopped:(id)a3
{
  startTime = self->_startTime;
  self->_startTime = 0LL;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%p)", v3, self));

  return v4;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (int64_t)type
{
  return self->_type;
}

- (double)interval
{
  return self->_interval;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (double)startAfter
{
  return self->_startAfter;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (double)expected_duration
{
  return self->_expected_duration;
}

- (double)random_initial_delay
{
  return self->_random_initial_delay;
}

- (double)tempDelay
{
  return self->_tempDelay;
}

- (NSDate)baseTime
{
  return self->_baseTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (_DASActivity)scheduler_activity
{
  return self->_scheduler_activity;
}

- (void)setScheduler_activity:(id)a3
{
}

- (unint64_t)suspensionReason
{
  return self->_suspensionReason;
}

- (void)setSuspensionReason:(unint64_t)a3
{
  self->_suspensionReason = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (NSArray)related_applications
{
  return self->_related_applications;
}

- (NSArray)involved_processes
{
  return self->_involved_processes;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (BOOL)beforeApplicationLaunch
{
  return self->_beforeApplicationLaunch;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)requires_protection_class
{
  return self->_requires_protection_class;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (BOOL)requires_significant_user_inactivity
{
  return self->_requires_significant_user_inactivity;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

- (BOOL)power_nap
{
  return self->_power_nap;
}

- (BOOL)app_refresh
{
  return self->_app_refresh;
}

- (BOOL)resource_intensive
{
  return self->_resource_intensive;
}

- (int64_t)resources
{
  return self->_resources;
}

- (BOOL)may_reboot_device
{
  return self->_may_reboot_device;
}

- (BOOL)post_install
{
  return self->_post_install;
}

- (BOOL)user_requested_backup_task
{
  return self->_user_requested_backup_task;
}

- (BOOL)requires_buddy_complete
{
  return self->_requires_buddy_complete;
}

- (BOOL)prevents_device_sleep
{
  return self->_prevents_device_sleep;
}

- (BOOL)requires_network_connectivity
{
  return self->_requires_network_connectivity;
}

- (BOOL)requires_inexpensive_network
{
  return self->_requires_inexpensive_network;
}

- (BOOL)requires_unconstrained_network
{
  return self->_requires_unconstrained_network;
}

- (int64_t)expected_network_download_size_bytes
{
  return self->_expected_network_download_size_bytes;
}

- (int64_t)expected_network_upload_size_bytes
{
  return self->_expected_network_upload_size_bytes;
}

- (OS_nw_endpoint)network_endpoint
{
  return self->_network_endpoint;
}

- (OS_nw_parameters)network_parameters
{
  return self->_network_parameters;
}

- (BOOL)communicates_with_paired_device
{
  return self->_communicates_with_paired_device;
}

- (int64_t)run_on_motion_state
{
  return self->_run_on_motion_state;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (BOOL)duet_power_budgeted
{
  return self->_duet_power_budgeted;
}

- (BOOL)data_budgeted
{
  return self->_data_budgeted;
}

- (NSString)dataBudgetName
{
  return self->_dataBudgetName;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (NSString)group_name
{
  return self->_group_name;
}

- (unint64_t)group_concurrency_limit
{
  return self->_group_concurrency_limit;
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (BOOL)magneticInterferenceSensitivity
{
  return self->_magneticInterferenceSensitivity;
}

- (void)setMagneticInterferenceSensitivity:(BOOL)a3
{
  self->_magneticInterferenceSensitivity = a3;
}

- (BOOL)mailFetch
{
  return self->_mailFetch;
}

- (void)setMailFetch:(BOOL)a3
{
  self->_mailFetch = a3;
}

- (BOOL)bypassBatteryAging
{
  return self->_bypassBatteryAging;
}

- (void)setBypassBatteryAging:(BOOL)a3
{
  self->_bypassBatteryAging = a3;
}

- (BOOL)bypassPeakPower
{
  return self->_bypassPeakPower;
}

- (void)setBypassPeakPower:(BOOL)a3
{
  self->_bypassPeakPower = a3;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (BOOL)blockRebootActivitiesForSU
{
  return self->_blockRebootActivitiesForSU;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  self->_blockRebootActivitiesForSU = a3;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  return self->_useStatisticalModelForTriggersRestart;
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  self->_useStatisticalModelForTriggersRestart = a3;
}

- (unint64_t)requiresMinimumBatteryLevel
{
  return self->_requiresMinimumBatteryLevel;
}

- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3
{
  self->_requiresMinimumBatteryLevel = a3;
}

- (unint64_t)requiresMinimumDataBudgetPercentage
{
  return self->_requiresMinimumDataBudgetPercentage;
}

- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3
{
  self->_requiresMinimumDataBudgetPercentage = a3;
}

- (OS_dispatch_source)dispatchSourceProcessExit
{
  return self->_dispatchSourceProcessExit;
}

- (void)setDispatchSourceProcessExit:(id)a3
{
}

- (NSSet)produced_result_identifiers
{
  return self->_produced_result_identifiers;
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (BOOL)reRun
{
  return self->_reRun;
}

- (void)setReRun:(BOOL)a3
{
  self->_reRun = a3;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (void)setFeatureCodes:(id)a3
{
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (void).cxx_destruct
{
}

@end