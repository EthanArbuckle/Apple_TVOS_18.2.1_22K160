@interface _DASAssertionArbiter
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForPID:(SEL)a3 success:(int)a4;
- (BOOL)doesAuditToken:(id *)a3 haveEntitlement:(id)a4;
- (BOOL)doesPID:(int)a3 haveEntitlement:(id)a4;
- (BOOL)isBackgroundFetchActivity:(id)a3;
- (BOOL)shouldCreateAssertionForActivity:(id)a3;
- (NSMutableDictionary)assertionAssociations;
- (OS_os_log)log;
- (_DASAssertionArbiter)initWithDelegate:(id)a3;
- (_DASAssertionArbiterDelegate)handlerDelegate;
- (id)assertionForWebBrowserContinuedProcessingTask:(id)a3 targetPID:(int)a4;
- (id)createAssertionForActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForBackgroundFetchActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForBackgroundTaskActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForHealthKitActivity:(id)a3 targetPID:(int)a4;
- (id)createUnmanagedAssertionForActivity:(id)a3 targetPID:(int)a4;
- (id)hostAssertionAssociatedWithActivity:(id)a3 targetPID:(int)a4;
- (int)hostPIDForTarget:(int)a3;
- (void)acquireAssertionsForActivity:(id)a3;
- (void)createManagedAssertionForActivity:(id)a3 targetPID:(int)a4;
- (void)installHandlersForAssertion:(id)a3;
- (void)invalidateAssertionsForActivity:(id)a3;
- (void)setAssertionAssociations:(id)a3;
- (void)setHandlerDelegate:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _DASAssertionArbiter

- (_DASAssertionArbiter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASAssertionArbiter;
  v5 = -[_DASAssertionArbiter init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handlerDelegate, v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    assertionAssociations = v6->_assertionAssociations;
    v6->_assertionAssociations = (NSMutableDictionary *)v7;

    os_log_t v9 = os_log_create("com.apple.duetactivityscheduler", "AssertionArbiter");
    log = v6->_log;
    v6->_log = v9;
  }

  return v6;
}

- (id)createUnmanagedAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createAssertionForActivity:targetPID:]( self,  "createAssertionForActivity:targetPID:",  v6,  v4));
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000B2500();
  }

  return v8;
}

- (id)hostAssertionAssociatedWithActivity:(id)a3 targetPID:(int)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
  objc_sync_enter(v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionAssociations,  "objectForKeyedSubscript:",  v5));
  objc_sync_exit(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyAssertion]);
  return v8;
}

- (void)createManagedAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createAssertionForActivity:targetPID:]( self,  "createAssertionForActivity:targetPID:",  v6,  v4));
  if (v7)
  {
    -[_DASAssertionArbiter installHandlersForAssertion:](self, "installHandlersForAssertion:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
    objc_sync_enter(v8);
    id v9 = (_DASAssertionAssociation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionAssociations,  "objectForKeyedSubscript:",  v6));
    if (!v9)
    {
      id v9 = -[_DASAssertionAssociation initWithActivity:]( objc_alloc(&OBJC_CLASS____DASAssertionAssociation),  "initWithActivity:",  v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_assertionAssociations,  "setObject:forKeyedSubscript:",  v9,  v6);
    }

    objc_sync_exit(v8);

    -[_DASAssertionAssociation trackAssertion:](v9, "trackAssertion:", v7);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000B2560();
  }
}

- (void)acquireAssertionsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionAssociations,  "objectForKeyedSubscript:",  v4));
  objc_sync_exit(v5);

  if (v6)
  {
    [v6 acquireAssertions];
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000B25C0();
  }
}

- (void)invalidateAssertionsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionAssociations,  "objectForKeyedSubscript:",  v4));
  objc_sync_exit(v5);

  if (v6)
  {
    [v6 invalidateAssertions];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
    objc_sync_enter(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_assertionAssociations, "removeObjectForKey:", v4);
    objc_sync_exit(v7);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000B2620();
  }
}

- (id)createAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (-[_DASAssertionArbiter shouldCreateAssertionForActivity:](self, "shouldCreateAssertionForActivity:", v6))
  {
    if ([v6 isBackgroundTaskActivity])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createAssertionForBackgroundTaskActivity:targetPID:]( self,  "createAssertionForBackgroundTaskActivity:targetPID:",  v6,  v4));
LABEL_11:
      v8 = (void *)v7;
      goto LABEL_12;
    }

    if (-[_DASAssertionArbiter isBackgroundFetchActivity:](self, "isBackgroundFetchActivity:", v6))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createAssertionForBackgroundFetchActivity:targetPID:]( self,  "createAssertionForBackgroundFetchActivity:targetPID:",  v6,  v4));
      goto LABEL_11;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonHealthKit];

    if (v10)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createAssertionForHealthKitActivity:targetPID:]( self,  "createAssertionForHealthKitActivity:targetPID:",  v6,  v4));
      goto LABEL_11;
    }

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
LABEL_5:
    sub_1000B2680();
  }

  v8 = 0LL;
LABEL_12:

  return v8;
}

- (BOOL)shouldCreateAssertionForActivity:(id)a3
{
  id v4 = a3;
  if (([v4 isBackgroundTaskActivity] & 1) != 0
    || -[_DASAssertionArbiter isBackgroundFetchActivity:](self, "isBackgroundFetchActivity:", v4))
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    unsigned __int8 v5 = [v6 isEqualToString:_DASLaunchReasonHealthKit];
  }

  return v5;
}

- (BOOL)isBackgroundFetchActivity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundFetch])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
    if ([v6 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
      if ([v7 isEqualToString:_DASLaunchReasonNSURLSessionComplete])
      {
        unsigned __int8 v5 = 1;
      }

      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
        unsigned __int8 v5 = [v8 isEqualToString:_DASLaunchReasonNSURLSessionAuthorizationRequired];
      }
    }
  }

  return v5;
}

- (void)installHandlersForAssertion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000329E8;
  v7[3] = &unk_1001159F0;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v4 setWarningHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100032A44;
  v5[3] = &unk_100115A18;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [v4 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)createAssertionForBackgroundFetchActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B26E0();
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  @"BackgroundDownload"));
  id v8 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v4));
  v14 = v7;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v11 = [v8 initWithExplanation:@"com.apple.das.backgroundFetch" target:v9 attributes:v10];

  objc_super v12 = -[_DASAssertion initWithRBSAssertion:forPid:]( objc_alloc(&OBJC_CLASS____DASAssertion),  "initWithRBSAssertion:forPid:",  v11,  v4);
  return v12;
}

- (id)createAssertionForHealthKitActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B2740();
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  @"HealthLaunch"));
  id v9 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v4));
  v15 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v12 = [v9 initWithExplanation:v7 target:v10 attributes:v11];

  v13 = -[_DASAssertion initWithRBSAssertion:forPid:]( objc_alloc(&OBJC_CLASS____DASAssertion),  "initWithRBSAssertion:forPid:",  v12,  v4);
  return v13;
}

- (id)createAssertionForBackgroundTaskActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B27A0();
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  unsigned __int8 v8 = [v7 isEqualToString:_DASLaunchReasonBackgroundRefresh];

  if ((v8 & 1) != 0)
  {
    id v9 = @"BGAppRefreshTask";
    goto LABEL_18;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  unsigned int v11 = [v10 isEqualToString:_DASLaunchReasonBackgroundProcessing];

  if (v11)
  {
    if ([v6 isContactTracingBackgroundActivity]
      && ![v6 requiresPlugin])
    {
      id v9 = @"BGProcessingTask-ExposureNotification";
    }

    else if ([v6 requiresPlugin])
    {
      id v9 = @"BGProcessingTask-Unrestricted";
    }

    else
    {
      id v9 = @"BGProcessingTask-Restricted";
    }

- (id)assertionForWebBrowserContinuedProcessingTask:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (-[_DASAssertionArbiter doesPID:haveEntitlement:]( self,  "doesPID:haveEntitlement:",  v4,  @"com.apple.developer.web-browser-engine.networking"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  @"ContinuousDownload"));
    id v7 = objc_alloc(&OBJC_CLASS___RBSAssertion);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v4));
    v27 = v25;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    id v10 = [v7 initWithExplanation:v24 target:v8 attributes:v9];

    unsigned int v11 = -[_DASAssertion initWithRBSAssertion:forPid:]( objc_alloc(&OBJC_CLASS____DASAssertion),  "initWithRBSAssertion:forPid:",  v10,  v4);
    uint64_t v12 = -[_DASAssertionArbiter hostPIDForTarget:](self, "hostPIDForTarget:", v4);
    if ((_DWORD)v12)
    {
      if (-[_DASAssertionArbiter doesPID:haveEntitlement:]( self,  "doesPID:haveEntitlement:",  v12,  @"com.apple.developer.web-browser"))
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  @"BackgroundDownloadHostJetsamBand"));
        id v14 = objc_alloc(&OBJC_CLASS___RBSAssertion);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v12));
        v26 = v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
        id v17 = [v14 initWithExplanation:@"Assertion on networking process host" target:v15 attributes:v16];

        v18 = -[_DASAssertion initWithRBSAssertion:forPid:]( objc_alloc(&OBJC_CLASS____DASAssertion),  "initWithRBSAssertion:forPid:",  v17,  v12);
        -[_DASAssertionArbiter installHandlersForAssertion:](self, "installHandlersForAssertion:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertionArbiter assertionAssociations](self, "assertionAssociations"));
        objc_sync_enter(v19);
        id v20 = (_DASAssertionAssociation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_assertionAssociations,  "objectForKeyedSubscript:",  v6));
        if (!v20)
        {
          id v20 = -[_DASAssertionAssociation initWithActivity:]( objc_alloc(&OBJC_CLASS____DASAssertionAssociation),  "initWithActivity:",  v6);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_assertionAssociations,  "setObject:forKeyedSubscript:",  v20,  v6);
        }

        objc_sync_exit(v19);

        -[_DASAssertionAssociation trackAssertion:](v20, "trackAssertion:", v18);
        -[_DASAssertionAssociation acquireAssertions](v20, "acquireAssertions");
        v21 = v11;

        goto LABEL_13;
      }

      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000B2860();
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B2800();
    }

    v22 = v11;
LABEL_13:

    goto LABEL_14;
  }

  unsigned int v11 = 0LL;
LABEL_14:

  return v11;
}

- (BOOL)doesPID:(int)a3 haveEntitlement:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v10 = 0;
  -[_DASAssertionArbiter auditTokenForPID:success:](self, "auditTokenForPID:success:", v4, &v10);
  if (v10)
  {
    *(_OWORD *)id v9 = *(_OWORD *)&v9[44];
    *(_OWORD *)&v9[16] = *(_OWORD *)&v9[60];
    BOOL v7 = -[_DASAssertionArbiter doesAuditToken:haveEntitlement:](self, "doesAuditToken:haveEntitlement:", v9, v6);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForPID:(SEL)a3 success:(int)a4
{
  uint64_t v6 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerDelegate);
  char v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assertionArbiter:self clientWithPID:v6]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);

  BOOL v12 = os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v12) {
      sub_1000B2980();
    }
    *a5 = 1;
    [v11 auditToken];
  }

  else
  {
    if (v12) {
      sub_1000B2920();
    }
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v6));
    id v18 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v13,  &v18));
    id v15 = v18;
    v16 = v15;
    if (!v14 || v15)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000B28C0();
      }
      *a5 = 0;
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }

    else
    {
      *a5 = 1;
      [v14 auditToken];
    }
  }

  return result;
}

- (BOOL)doesAuditToken:(id *)a3 haveEntitlement:(id)a4
{
  uint64_t v6 = (__CFString *)a4;
  __int128 v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  unsigned __int8 v8 = SecTaskCreateWithAuditToken(0LL, &token);
  if (v8)
  {
    id v9 = v8;
    *(void *)token.val = 0LL;
    char v10 = (void *)SecTaskCopyValueForEntitlement(v8, v6, (CFErrorRef *)&token);
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
    {
      sub_1000B2A7C();
      if (!v10) {
        goto LABEL_10;
      }
    }

    else if (!v10)
    {
      goto LABEL_10;
    }

    if ((objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0)
    {
      unsigned __int8 v11 = [v10 BOOLValue];
LABEL_11:
      int v13 = *(void **)token.val;
      if (*(void *)token.val)
      {
        id v14 = [*(id *)token.val code];
        log = self->_log;
        if (v14 == (id)3)
        {
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v17 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "sectask entitlement check made for not-running process",  v17,  2u);
          }
        }

        else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          sub_1000B2A1C();
        }
      }

      CFRelease(v9);

      goto LABEL_19;
    }

- (int)hostPIDForTarget:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  id v13 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v5,  &v13));
  id v7 = v13;

  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 hostProcess]);
    int v10 = objc_msgSend(v11, "rbs_pid");
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B2AF8((uint64_t)v7, v3, log);
    }
    int v10 = 0;
  }

  return v10;
}

- (_DASAssertionArbiterDelegate)handlerDelegate
{
  return (_DASAssertionArbiterDelegate *)objc_loadWeakRetained((id *)&self->_handlerDelegate);
}

- (void)setHandlerDelegate:(id)a3
{
}

- (NSMutableDictionary)assertionAssociations
{
  return self->_assertionAssociations;
}

- (void)setAssertionAssociations:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end