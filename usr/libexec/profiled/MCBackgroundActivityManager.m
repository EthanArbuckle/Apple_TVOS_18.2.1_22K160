@interface MCBackgroundActivityManager
- (MCProfileServiceServer)server;
- (OS_dispatch_queue)workQueue;
- (const)_jobNameForBackgroundActivityType:(int64_t)a3;
- (id)_jobDescriptionForBackgroundActivityType:(int64_t)a3;
- (id)_nextActivationLockCleanupDate;
- (id)_nextManagedAppValidationDateWithOverride:(id)a3;
- (id)_nextRegularDate;
- (int)managedAppChangeNotificationToken;
- (int)passcodeChangedNotificationToken;
- (int)passcodePolicyChangedNotificationToken;
- (int)profileChangeNotificationToken;
- (void)_handleXPCActivity:(int64_t)a3 proposedStartDate:(id)a4 normalizeStartDate:(BOOL)a5 proposedGracePeriod:(id)a6 proposedPriority:(const char *)a7 repeatingInterval:(id)a8 requireNetwork:(BOOL)a9 requireUnlock:(BOOL)a10;
- (void)_rescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7;
- (void)_workQueueReschedule:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7;
- (void)_workQueueReschedulePasscodeExpiryJob;
- (void)_workQueueRescheduleRecoveryPasscodeExpiryJob;
- (void)activationLockBypassCodeWasStored:(id)a3;
- (void)rescheduleManagedAppValidationJob;
- (void)rescheduleManagedAppValidationJob:(id)a3;
- (void)reschedulePasscodeExpiryJob;
- (void)rescheduleProfileJanitorJob;
- (void)rescheduleRecoveryPasscodeExpiryJob;
- (void)scheduleRecomputeNagMetadataJob;
- (void)setManagedAppChangeNotificationToken:(int)a3;
- (void)setPasscodeChangedNotificationToken:(int)a3;
- (void)setPasscodePolicyChangedNotificationToken:(int)a3;
- (void)setProfileChangeNotificationToken:(int)a3;
- (void)setServer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MCBackgroundActivityManager

- (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018858;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  if (qword_1000DC038 != -1) {
    dispatch_once(&qword_1000DC038, block);
  }
  v3 = (const char *)[MCProfileListChangedNotification UTF8String];
  workQueue = (dispatch_queue_s *)self->_workQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000188B8;
  handler[3] = &unk_1000C33C8;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_profileChangeNotificationToken, workQueue, handler);
  v5 = (const char *)[MCManagedAppsChangedNotification UTF8String];
  v6 = (dispatch_queue_s *)self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100018A74;
  v16[3] = &unk_1000C33C8;
  v16[4] = self;
  notify_register_dispatch(v5, &self->_managedAppChangeNotificationToken, v6, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"activationLockBypassCodeWasStored:" name:MCActivationLockBypassCodeWasStoredNotification object:0];

  v8 = (const char *)[MCPasscodeChangedNotification UTF8String];
  v9 = (dispatch_queue_s *)self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100018B74;
  v15[3] = &unk_1000C33C8;
  v15[4] = self;
  notify_register_dispatch(v8, &self->_passcodeChangedNotificationToken, v9, v15);
  v10 = (const char *)[MCPasscodePolicyChangedNotification UTF8String];
  v11 = (dispatch_queue_s *)self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100018BEC;
  v14[3] = &unk_1000C33C8;
  v14[4] = self;
  notify_register_dispatch(v10, &self->_passcodePolicyChangedNotificationToken, v11, v14);
  v12 = (dispatch_queue_s *)self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100018C5C;
  v13[3] = &unk_1000C29D0;
  v13[4] = self;
  dispatch_async(v12, v13);
}

- (void)stop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)activationLockBypassCodeWasStored:(id)a3
{
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Activation lock bypass code was stored. Rescheduling activation lock cleanup.",  v7,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _nextActivationLockCleanupDate](self, "_nextActivationLockCleanupDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  40 * XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:",  2LL,  v5,  v6,  0LL,  0LL);
}

- (id)_nextRegularDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 components:2097212 fromDate:v3]);

  uint64_t v5 = (uint64_t)[v4 hour];
  v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 timeZone]);
  -[NSDateComponents setTimeZone:](v6, "setTimeZone:", v7);

  -[NSDateComponents setYear:](v6, "setYear:", [v4 year]);
  -[NSDateComponents setMonth:](v6, "setMonth:", [v4 month]);
  v8 = (char *)[v4 day];
  if (v5 <= 2) {
    v9 = v8;
  }
  else {
    v9 = v8 + 1;
  }
  -[NSDateComponents setDay:](v6, "setDay:", v9);
  -[NSDateComponents setHour:](v6, "setHour:", 3LL);
  -[NSDateComponents setMinute:](v6, "setMinute:", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v2 dateFromComponents:v6]);

  return v10;
}

- (id)_nextActivationLockCleanupDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 doubleForKey:@"ActivationLockCleanupJobInterval"];
  double v4 = v3;

  double v5 = 1296000.0;
  if (v4 != 0.0) {
    double v5 = v4;
  }
  return +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v5);
}

- (id)_nextManagedAppValidationDateWithOverride:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 earliestRequiredManagedAppValidationDate]);

  if (v3 && v5)
  {
    id v6 = v3;

    double v5 = v6;
  }

  return v5;
}

- (const)_jobNameForBackgroundActivityType:(int64_t)a3
{
  else {
    return off_1000C3458[a3 - 1];
  }
}

- (id)_jobDescriptionForBackgroundActivityType:(int64_t)a3
{
  else {
    return off_1000C3498[a3 - 1];
  }
}

- (void)_handleXPCActivity:(int64_t)a3 proposedStartDate:(id)a4 normalizeStartDate:(BOOL)a5 proposedGracePeriod:(id)a6 proposedPriority:(const char *)a7 repeatingInterval:(id)a8 requireNetwork:(BOOL)a9 requireUnlock:(BOOL)a10
{
  BOOL v13 = a5;
  id v16 = a4;
  id v36 = a6;
  id v34 = a8;
  identifier = -[MCBackgroundActivityManager _jobNameForBackgroundActivityType:]( self,  "_jobNameForBackgroundActivityType:",  a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[MCBackgroundActivityManager _jobDescriptionForBackgroundActivityType:]( self,  "_jobDescriptionForBackgroundActivityType:",  a3));
  if (v16)
  {
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _nextRegularDate](self, "_nextRegularDate"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 earlierDate:v17]);

      id v16 = (id)v18;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v16 laterDate:v19]);

    v20 = v36;
    if (!v36) {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  2 * XPC_ACTIVITY_INTERVAL_1_HOUR));
    }
    if (a7) {
      v21 = a7;
    }
    else {
      v21 = XPC_ACTIVITY_PRIORITY_MAINTENANCE;
    }
    xpc_object_t v22 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v22, XPC_ACTIVITY_GRACE_PERIOD, (int64_t)[v20 longValue]);
    [v32 timeIntervalSinceNow];
    xpc_dictionary_set_int64(v22, XPC_ACTIVITY_DELAY, (uint64_t)v23);
    xpc_dictionary_set_string(v22, XPC_ACTIVITY_PRIORITY, v21);
    if (v34)
    {
      xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v22, XPC_ACTIVITY_INTERVAL, (int64_t)[v34 longValue]);
      if (!a9)
      {
LABEL_12:
        id v36 = v20;
        if (a10) {
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
        }
        if (v34) {
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", Repeat Interval: %@",  v34));
        }
        else {
          v24 = &stru_1000C4568;
        }
        v26 = @", Require Network: true";
        if (!a9) {
          v26 = &stru_1000C4568;
        }
        v27 = v26;
        v28 = @", Require Unlock: true";
        if (!a10) {
          v28 = &stru_1000C4568;
        }
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Scheduling %@ at %@. Priority: %s, Grace Period: %@%@%@%@",  v35,  v32,  v21,  v36,  v24,  v27,  v29));
        v31 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_10001957C;
        handler[3] = &unk_1000C3410;
        v41[1] = identifier;
        objc_copyWeak(v41, (id *)buf);
        id v38 = v35;
        v41[2] = (id)a3;
        id v39 = v34;
        v40 = self;
        v41[3] = (id)v21;
        xpc_activity_register(identifier, v22, handler);

        objc_destroyWeak(v41);
        objc_destroyWeak((id *)buf);

        goto LABEL_29;
      }
    }

    else
    {
      xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 0);
      if (!a9) {
        goto LABEL_12;
      }
    }

    xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    goto LABEL_12;
  }

  v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Cancelling %{public}@", buf, 0xCu);
  }

  xpc_activity_unregister(identifier);
LABEL_29:
}

- (void)rescheduleProfileJanitorJob
{
  id v3 = objc_opt_new(&OBJC_CLASS___MCProfileJanitor);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileJanitor earliestExpiryDate](v3, "earliestExpiryDate"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_5_MIN));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:",  0LL,  v4,  v5,  XPC_ACTIVITY_PRIORITY_UTILITY,  0LL);

  id v6 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager earlistProfileEventExpiry](v6, "earlistProfileEventExpiry"));

  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_5_MIN));
    -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:",  1LL,  v8,  v7,  XPC_ACTIVITY_PRIORITY_UTILITY,  0LL);
  }
}

- (void)rescheduleManagedAppValidationJob
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:",  3LL,  v3,  0LL,  0LL,  0LL);
}

- (void)rescheduleManagedAppValidationJob:(id)a3
{
}

- (void)reschedulePasscodeExpiryJob
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019AE0;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_workQueueReschedulePasscodeExpiryJob
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 passcodeExpiryDate]);

  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:",  5LL,  v5,  v4,  XPC_ACTIVITY_PRIORITY_UTILITY,  0LL);
}

- (void)rescheduleRecoveryPasscodeExpiryJob
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019BD4;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_workQueueRescheduleRecoveryPasscodeExpiryJob
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recoveryPasscodeExpiryDate]);

  if (!v4)
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No recovery passcode, clearing associated data if necessary",  buf,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    id v13 = 0LL;
    unsigned int v7 = [v6 clearRecoveryPasscodeOpaqueDataWithOutError:&v13];
    id v8 = v13;

    if (v7)
    {
      +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  7LL);
    }

    else if (v8)
    {
      os_log_t v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to clear recovery passcode opaque data: %{public}@",  buf,  0xCu);
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:]( self,  "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:",  6LL,  v4,  v12,  XPC_ACTIVITY_PRIORITY_UTILITY,  0LL);
}

- (void)scheduleRecomputeNagMetadataJob
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019E08;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_rescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100019F68;
  v19[3] = &unk_1000C3438;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(workQueue, v19);
}

- (void)_workQueueReschedule:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7
{
  id v17 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a3 == 3)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[MCBackgroundActivityManager _nextManagedAppValidationDateWithOverride:]( self,  "_nextManagedAppValidationDateWithOverride:",  v17));

    id v15 = (id)v14;
  }

  else
  {
    id v15 = v17;
  }

  LOBYTE(v16) = a3 == 3;
  BYTE1(v16) = (unint64_t)(a3 - 7) < 2;
  id v18 = v15;
  -[MCBackgroundActivityManager _handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterval:requireNetwork:requireUnlock:]( self,  "_handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterval:requi reNetwork:requireUnlock:",  a3,  v15,  ((unint64_t)a3 > 8) | (0x9Bu >> a3) & 1,  v12,  a6,  v13,  v16);
}

- (MCProfileServiceServer)server
{
  return (MCProfileServiceServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
}

- (int)profileChangeNotificationToken
{
  return self->_profileChangeNotificationToken;
}

- (void)setProfileChangeNotificationToken:(int)a3
{
  self->_profileChangeNotificationToken = a3;
}

- (int)managedAppChangeNotificationToken
{
  return self->_managedAppChangeNotificationToken;
}

- (void)setManagedAppChangeNotificationToken:(int)a3
{
  self->_managedAppChangeNotificationToken = a3;
}

- (int)passcodeChangedNotificationToken
{
  return self->_passcodeChangedNotificationToken;
}

- (void)setPasscodeChangedNotificationToken:(int)a3
{
  self->_passcodeChangedNotificationToken = a3;
}

- (int)passcodePolicyChangedNotificationToken
{
  return self->_passcodePolicyChangedNotificationToken;
}

- (void)setPasscodePolicyChangedNotificationToken:(int)a3
{
  self->_passcodePolicyChangedNotificationToken = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end