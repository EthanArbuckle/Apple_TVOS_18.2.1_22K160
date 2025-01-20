@interface MLRXPCActivityManager
- (BOOL)setStateForXPCActivity:(id)a3 state:(int64_t)a4;
- (BOOL)shouldDeferForXPCActivity:(id)a3;
- (MLRXPCActivityManager)init;
- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandlerForActivity:(id)a3 handler:(id)a4;
- (id)createXPCActivityTasks;
- (int64_t)getStateForForXPCActivity:(id)a3;
- (void)_registerXPCActivityTasks:(id)a3;
- (void)handleCompleteActivityTask:(id)a3 withError:(id)a4;
- (void)handleDeferActivityTask:(id)a3 withStartTime:(double)a4;
- (void)registerIfNeeded;
- (void)registerWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5;
- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3;
- (void)runActivityTask:(id)a3;
- (void)setCriteriaForXPCActivityIfNeeded:(id)a3 criteria:(id)a4;
- (void)unregisterXPCActivityWithIdentifier:(const char *)a3;
@end

@implementation MLRXPCActivityManager

- (MLRXPCActivityManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MLRXPCActivityManager;
  return -[MLRXPCActivityManager init](&v3, "init");
}

- (void)handleCompleteActivityTask:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    *(_DWORD *)v15 = 138543618;
    *(void *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2114;
    *(void *)&v15[14] = v7;
    v11 = "%{public}@ failed: %{public}@.";
    v12 = v8;
    uint32_t v13 = 22;
  }

  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    *(_DWORD *)v15 = 138543362;
    *(void *)&v15[4] = v10;
    v11 = "%{public}@ completed successfully.";
    v12 = v8;
    uint32_t v13 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, v15, v13);

LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
  [v6 setActivity:0];
  if ([v6 eligibilityHandler])
  {
    -[MLRXPCActivityManager removeEligibilityChangedHandler:]( self,  "removeEligibilityChangedHandler:",  [v6 eligibilityHandler]);
    [v6 setEligibilityHandler:0];
  }

  if (objc_msgSend(v6, "activityDeferred", *(_OWORD *)v15, *(void *)&v15[16]))
  {
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v14, 3LL);
  }

  else
  {
    +[DESUserDefaultsStoreRecord purgeObsoleted](&OBJC_CLASS___DESUserDefaultsStoreRecord, "purgeObsoleted");
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v14, 5LL);
  }
}

- (void)handleDeferActivityTask:(id)a3 withStartTime:(double)a4
{
  id v5 = a3;
  if ([v5 activityDeferred])
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      int v15 = 138412290;
      v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DAS request to defer activity=%@ again. Ignoring.",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    [v5 setActivityDeferred:1];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      int v15 = 138412290;
      v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DAS request to defer activity: %@.",  (uint8_t *)&v15,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v10 systemUptime];
    double v12 = v11 - a4;

    uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    *(float *)&double v14 = v12;
    +[DESCoreAnalyticsEventManager sendEventActivityShouldDeferWithActivityID:connectionDuration:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventActivityShouldDeferWithActivityID:connectionDuration:",  v13,  v14);

    [v5 stop];
  }
}

- (void)runActivityTask:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting %{public}@.", buf, 0xCu);
  }

  [v4 setActivityDeferred:0];
  if (-[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    +[DESCoreAnalyticsEventManager sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:",  v7,  0LL,  MKBGetDeviceLockState(0LL),  0.0);

LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v10 systemUptime];
    double v12 = v11;

    uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 activity]);
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v13, 4LL);

    objc_initWeak((id *)buf, self);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 activity]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000B120;
    v20[3] = &unk_100014AB8;
    objc_copyWeak(v22, (id *)buf);
    id v15 = v4;
    id v21 = v15;
    v22[1] = v12;
    objc_msgSend( v15,  "setEligibilityHandler:",  -[MLRXPCActivityManager addEligibilityChangedHandlerForActivity:handler:]( self,  "addEligibilityChangedHandlerForActivity:handler:",  v14,  v20));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000B1B8;
    v18[3] = &unk_100014AE0;
    v18[4] = self;
    id v19 = v15;
    [v19 startTaskWithCompletion:v18];

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }

  unsigned int v8 = [v4 bypassDiagnosticsUsage];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  +[DESCoreAnalyticsEventManager sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:",  v9,  v8 ^ 1,  MKBGetDeviceLockState(0LL),  0.0);

  if ((v8 & 1) != 0) {
    goto LABEL_6;
  }
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Skipping %{public}@ because D&U is not allowed.",  buf,  0xCu);
  }

  -[MLRXPCActivityManager handleCompleteActivityTask:withError:](self, "handleCompleteActivityTask:withError:", v4, 0LL);
LABEL_10:
}

- (void)_registerXPCActivityTasks:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v24;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v21 = v8;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v11);
        if ((v5 & 1) != 0
          || ([*(id *)(*((void *)&v23 + 1) + 8 * (void)v11) bypassDiagnosticsUsage] & 1) != 0)
        {
          uint32_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel", v21));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            *(_DWORD *)buf = v21;
            v28 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Registering xpc activity %@.",  buf,  0xCu);
          }

          id v15 = objc_claimAutoreleasedReturnValue([v12 identifier]);
          id v16 = [v15 UTF8String];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          id v22[2] = sub_10000B47C;
          v22[3] = &unk_100014B08;
          v22[4] = self;
          v22[5] = v12;
          -[MLRXPCActivityManager registerWithIdentifier:criteria:handler:]( self,  "registerWithIdentifier:criteria:handler:",  v16,  XPC_ACTIVITY_CHECK_IN,  v22);
        }

        else
        {
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            *(_DWORD *)buf = v21;
            v28 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unregistering xpc activity %@ because D&U is not allowed.",  buf,  0xCu);
          }

          id v19 = objc_claimAutoreleasedReturnValue([v12 identifier]);
          -[MLRXPCActivityManager unregisterXPCActivityWithIdentifier:]( self,  "unregisterXPCActivityWithIdentifier:",  [v19 UTF8String]);
        }

        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v20 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
      id v9 = v20;
    }

    while (v20);
  }
}

- (id)createXPCActivityTasks
{
  v2 = objc_opt_new(&OBJC_CLASS___MLRXPCActivityTaskWithLockedDevice);
  v7[0] = v2;
  objc_super v3 = objc_opt_new(&OBJC_CLASS___MLRXPCActivityTaskFedStatsWithLockedDevice);
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v4));

  return v5;
}

- (void)registerIfNeeded
{
  unsigned int v3 = -[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed");
  int submissionWasAllowed = self->_submissionWasAllowed;
  self->_int submissionWasAllowed = v3;
  if (self->_hasRegistered && submissionWasAllowed == v3)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not re-registering because we have registered and D&U has not changed",  buf,  2u);
    }
  }

  else
  {
    self->_hasRegistered = 1;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityManager createXPCActivityTasks](self, "createXPCActivityTasks"));
    -[MLRXPCActivityManager _registerXPCActivityTasks:](self, "_registerXPCActivityTasks:", v7);
  }

- (BOOL)setStateForXPCActivity:(id)a3 state:(int64_t)a4
{
  unsigned __int8 v5 = (_xpc_activity_s *)a3;
  BOOL v6 = xpc_activity_set_state(v5, a4);
  if (!v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B934(v5, a4, v7);
    }
  }

  return v6;
}

- (int64_t)getStateForForXPCActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandlerForActivity:(id)a3 handler:(id)a4
{
  return (_xpc_activity_eligibility_changed_handler_s *)xpc_activity_add_eligibility_changed_handler(a3, a4);
}

- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
}

- (BOOL)shouldDeferForXPCActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (void)unregisterXPCActivityWithIdentifier:(const char *)a3
{
}

- (void)registerWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
}

- (void)setCriteriaForXPCActivityIfNeeded:(id)a3 criteria:(id)a4
{
  unsigned __int8 v5 = (_xpc_activity_s *)a3;
  id v6 = a4;
  xpc_object_t v7 = xpc_activity_copy_criteria(v5);
  int64_t int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_INTERVAL);
  if (!v7 || xpc_dictionary_get_int64(v7, XPC_ACTIVITY_INTERVAL) != int64)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134349314;
      int64_t v11 = int64;
      __int16 v12 = 2114;
      uint32_t v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Set new activity interval to %{public}lld seconds for %{public}@",  (uint8_t *)&v10,  0x16u);
    }

    xpc_activity_set_criteria(v5, v6);
  }
}

@end