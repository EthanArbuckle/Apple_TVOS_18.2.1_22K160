@interface DSDiagnosticsSessionAvailabilityService
- (BOOL)_getHasActiveDiagnosticsSession;
- (id)_enhancedLoggingStatusOverride;
- (id)_sessionStatusOverride;
- (void)_getASTIdentitiesWithCompletionHandler:(id)a3;
- (void)_getASTSessionStatusForTicketNumber:(id)a3 timeout:(id)a4 completion:(id)a5;
- (void)_getHasActiveEnhancedLoggingSessionWithCompletionHandler:(id)a3;
- (void)getEnhancedLoggingStatusWithCompletionHandler:(id)a3;
- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5;
@end

@implementation DSDiagnosticsSessionAvailabilityService

- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSDiagnosticsSessionAvailabilityService _sessionStatusOverride](self, "_sessionStatusOverride"));
  if (v11)
  {
    v10[2](v10, v11, 0LL);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    unsigned int v13 = [v12 processIdentifier];

    id v14 = DSLogSessionAvailability();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[DSDiagnosticsSessionAvailabilityService getSessionStatusWithTicketNumber:timeout:completionHandler:]";
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 1024;
      unsigned int v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s ticketNumber: %@ timeout: %@ client PID: %d",  buf,  0x26u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100001AD4;
    block[3] = &unk_10000C428;
    block[4] = self;
    id v19 = v8;
    id v20 = v9;
    unsigned int v22 = v13;
    v21 = v10;
    dispatch_async(v17, block);
  }
}

- (void)_getASTSessionStatusForTicketNumber:(id)a3 timeout:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = DSLogSessionAvailability();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000072E4(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000021EC;
  v23[3] = &unk_10000C478;
  id v24 = v9;
  id v25 = v8;
  id v26 = v10;
  id v20 = v10;
  id v21 = v8;
  id v22 = v9;
  -[DSDiagnosticsSessionAvailabilityService _getASTIdentitiesWithCompletionHandler:]( self,  "_getASTIdentitiesWithCompletionHandler:",  v23);
}

- (BOOL)_getHasActiveDiagnosticsSession
{
  id v2 = DSLogSessionAvailability();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100007354(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  id v11 = (void *)CFPreferencesCopyAppValue(@"InCurrentSession", @"com.apple.Diagnostics");
  id v12 = DSLogSessionAvailability();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = [v11 BOOLValue];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Active Diagnostics session: %d",  (uint8_t *)v16,  8u);
  }

  unsigned __int8 v14 = [v11 BOOLValue];
  return v14;
}

- (void)_getHasActiveEnhancedLoggingSessionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = DSLogSessionAvailability();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000073C4(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](&OBJC_CLASS___ELSManager, "sharedManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100002564;
  v15[3] = &unk_10000C4A0;
  id v16 = v3;
  id v14 = v3;
  [v13 refreshWithCompletion:v15];
}

- (void)_getASTIdentitiesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v5 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DADeviceObserverLocal),  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[DADeviceObserverAggregator aggregatorWithObserverClasses:]( &OBJC_CLASS___DADeviceObserverAggregator,  "aggregatorWithObserverClasses:",  v6));
  id v9 = DSLogSessionAvailability();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discovering devices...", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000027EC;
  v13[3] = &unk_10000C4F0;
  id v11 = v4;
  id v14 = v11;
  id v12 = v3;
  id v15 = v12;
  [v8 discoverAllDevicesWithCompletionHandler:v13];

  objc_autoreleasePoolPop(v7);
}

- (void)getEnhancedLoggingStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[DSDiagnosticsSessionAvailabilityService _enhancedLoggingStatusOverride]( self,  "_enhancedLoggingStatusOverride"));
  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](&OBJC_CLASS___ELSManager, "sharedManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshot]);
    unint64_t v8 = (unint64_t)[v7 status];

    if (v8 > 8)
    {
      id v11 = DSLogSessionAvailability();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_100007434(v8, v12);
      }
    }

    else
    {
      if (((1LL << v8) & 0x1EE) != 0)
      {
        id v9 = (void (*)(void *, _UNKNOWN **))v4[2];
        uint64_t v10 = &off_10000CF38;
LABEL_12:
        v9(v4, v10);
        goto LABEL_13;
      }

      if (v8)
      {
        id v9 = (void (*)(void *, _UNKNOWN **))v4[2];
        uint64_t v10 = &off_10000CF20;
        goto LABEL_12;
      }
    }

    id v9 = (void (*)(void *, _UNKNOWN **))v4[2];
    uint64_t v10 = &off_10000CEF0;
    goto LABEL_12;
  }

  ((void (*)(void *, void *))v4[2])(v4, v5);
LABEL_13:
}

- (id)_sessionStatusOverride
{
  if (MGGetBoolAnswer(@"InternalBuild", a2))
  {
    id v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.DiagnosticsSessionAvailability");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v2, "valueForKey:", @"sessionStatus"));
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (id)_enhancedLoggingStatusOverride
{
  if (MGGetBoolAnswer(@"InternalBuild", a2))
  {
    id v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.DiagnosticsSessionAvailability");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v2, "valueForKey:", @"enhancedLoggingStatus"));
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

@end