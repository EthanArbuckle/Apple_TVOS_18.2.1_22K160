@interface PBApplicationLanguageChangeTransaction
- (BOOL)isLanguageChange;
- (BOOL)isLocaleChange;
- (BOOL)shouldWatchdog:(id *)a3;
- (BSInvalidatable)preventKioskLaunchAssertion;
- (BSWatchdog)watchdog;
- (FBProcessManager)fbProcessManager;
- (NSString)relaunchBundleID;
- (NSURL)relaunchURL;
- (PBApplicationLanguageChangeTransaction)init;
- (PBApplicationLanguageChangeTransaction)initWithProcessManager:(id)a3 fbProcessManager:(id)a4 sceneManager:(id)a5 openAppTransitioner:(id)a6 snapshotService:(id)a7 relaunchBundleID:(id)a8 url:(id)a9;
- (PBApplicationLanguageChangeTransaction)initWithRelaunchBundleID:(id)a3 url:(id)a4;
- (PBOpenAppTransitioner)openAppTransitioner;
- (PBProcessManager)processManager;
- (PBSceneManager)sceneManager;
- (PBSnapshotService)snapshotService;
- (double)watchdogTimeout;
- (id)_createPreventKioskRelaunchAssertion;
- (id)_processKillCompletionForRelaunchApp;
- (void)_attemptLaunchingRelaunchAppWithCompletion:(id)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_enumerateApplicationProcesses:(id)a3;
- (void)_invalidateRecentApplicationSnapshots;
- (void)dealloc;
- (void)setLanguageChange:(BOOL)a3;
- (void)setLocaleChange:(BOOL)a3;
@end

@implementation PBApplicationLanguageChangeTransaction

- (PBApplicationLanguageChangeTransaction)initWithProcessManager:(id)a3 fbProcessManager:(id)a4 sceneManager:(id)a5 openAppTransitioner:(id)a6 snapshotService:(id)a7 relaunchBundleID:(id)a8 url:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id obj = a5;
  id v17 = a5;
  id v52 = a6;
  id v18 = a6;
  id v53 = a7;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = v15;
  Class v23 = NSClassFromString(@"PBProcessManager");
  if (!v22)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271E28();
    }
LABEL_49:
    _bs_set_crash_log_message([v41 UTF8String]);
    __break(0);
    JUMPOUT(0x10002931CLL);
  }

  if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBProcessManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271E28();
    }
    _bs_set_crash_log_message([v42 UTF8String]);
    __break(0);
    JUMPOUT(0x100029380LL);
  }

  id v24 = v16;
  Class v25 = NSClassFromString(@"FBProcessManager");
  if (!v24)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271ED8();
    }
    _bs_set_crash_log_message([v43 UTF8String]);
    __break(0);
    JUMPOUT(0x1000293E4LL);
  }

  if ((objc_opt_isKindOfClass(v24, v25) & 1) == 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBProcessManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271ED8();
    }
    _bs_set_crash_log_message([v44 UTF8String]);
    __break(0);
    JUMPOUT(0x100029448LL);
  }

  id v26 = v17;
  Class v27 = NSClassFromString(@"PBSceneManager");
  if (!v26)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271F88();
    }
    _bs_set_crash_log_message([v45 UTF8String]);
    __break(0);
    JUMPOUT(0x1000294ACLL);
  }

  if ((objc_opt_isKindOfClass(v26, v27) & 1) == 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSceneManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271F88();
    }
    _bs_set_crash_log_message([v46 UTF8String]);
    __break(0);
    JUMPOUT(0x100029510LL);
  }

  if (!v18)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"openAppTransitioner != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100272038();
    }
    _bs_set_crash_log_message([v47 UTF8String]);
    __break(0);
    JUMPOUT(0x100029574LL);
  }

  id v28 = v19;
  Class v29 = NSClassFromString(@"PBSnapshotService");
  if (!v28)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002720E0();
    }
    _bs_set_crash_log_message([v48 UTF8String]);
    __break(0);
    JUMPOUT(0x1000295D8LL);
  }

  if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSnapshotServiceClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002720E0();
    }
    _bs_set_crash_log_message([v49 UTF8String]);
    __break(0);
    JUMPOUT(0x10002963CLL);
  }

  id v30 = v20;
  if (v30)
  {
    Class v31 = NSClassFromString(@"NSString");
    if ((objc_opt_isKindOfClass(v30, v31) & 1) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100272238();
      }
      _bs_set_crash_log_message([v50 UTF8String]);
      __break(0);
      JUMPOUT(0x1000296A0LL);
    }
  }

  id v32 = v21;
  if (v32)
  {
    Class v33 = NSClassFromString(@"NSURL");
    if ((objc_opt_isKindOfClass(v32, v33) & 1) == 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSURLClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100272190();
      }
      goto LABEL_49;
    }
  }

  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___PBApplicationLanguageChangeTransaction;
  v34 = -[PBApplicationLanguageChangeTransaction init](&v55, "init");
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_processManager, a3);
    objc_storeStrong((id *)&v35->_fbProcessManager, a4);
    objc_storeStrong((id *)&v35->_sceneManager, obj);
    objc_storeStrong((id *)&v35->_openAppTransitioner, v52);
    objc_storeStrong((id *)&v35->_snapshotService, v53);
    v36 = (NSString *)[v30 copy];
    relaunchBundleID = v35->_relaunchBundleID;
    v35->_relaunchBundleID = v36;

    v38 = (NSURL *)[v32 copy];
    relaunchURL = v35->_relaunchURL;
    v35->_relaunchURL = v38;
  }

  return v35;
}

- (PBApplicationLanguageChangeTransaction)initWithRelaunchBundleID:(id)a3 url:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
  v13 = -[PBApplicationLanguageChangeTransaction initWithProcessManager:fbProcessManager:sceneManager:openAppTransitioner:snapshotService:relaunchBundleID:url:]( self,  "initWithProcessManager:fbProcessManager:sceneManager:openAppTransitioner:snapshotService:relaunchBundleID:url:",  v9,  v8,  v10,  v11,  v12,  v7,  v6);

  return v13;
}

- (PBApplicationLanguageChangeTransaction)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kioskAppBundleIdentifier]);

  v5 = -[PBApplicationLanguageChangeTransaction initWithRelaunchBundleID:url:]( self,  "initWithRelaunchBundleID:url:",  v4,  0LL);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBApplicationLanguageChangeTransaction;
  -[PBApplicationLanguageChangeTransaction dealloc](&v3, "dealloc");
}

- (void)_begin
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBApplicationLanguageChangeTransaction;
  -[PBApplicationLanguageChangeTransaction _begin](&v27, "_begin");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationLanguageChangeTransaction _createPreventKioskRelaunchAssertion]( self,  "_createPreventKioskRelaunchAssertion"));
  objc_storeStrong((id *)&self->_preventKioskLaunchAssertion, v3);
  unsigned int v4 = -[PBApplicationLanguageChangeTransaction isLanguageChange](self, "isLanguageChange");
  unsigned int v5 = -[PBApplicationLanguageChangeTransaction isLocaleChange](self, "isLocaleChange");
  id v6 = @"NO";
  if (v4) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if (v5) {
    id v6 = @"YES";
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100029BB4;
  v25[3] = &unk_1003D1200;
  v25[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Terminating process due to language(%@)/locale(%@) change",  v7,  v6));
  id v26 = v8;
  -[PBApplicationLanguageChangeTransaction _enumerateApplicationProcesses:]( self,  "_enumerateApplicationProcesses:",  v25);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBProcessManager recentApplicationBundleIdentifiers]( self->_processManager,  "recentApplicationBundleIdentifiers"));
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        -[PBSnapshotService invalidateSnapshotsForBundleIdentifier:]( self->_snapshotService,  "invalidateSnapshotsForBundleIdentifier:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12));
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }

    while (v10);
  }

  if (-[PBApplicationLanguageChangeTransaction shouldWatchdog:](self, "shouldWatchdog:", 0LL))
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationLanguageChangeTransaction queue](self, "queue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100029C20;
    v18[3] = &unk_1003D1228;
    objc_copyWeak(&v19, &location);
    id v15 = -[BSWatchdog initWithProvider:queue:completion:](v13, "initWithProvider:queue:completion:", self, v14, v18);
    p_watchdog = (id *)&self->_watchdog;
    id v17 = *p_watchdog;
    id *p_watchdog = v15;

    [*p_watchdog start];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBApplicationLanguageChangeTransaction;
  -[PBApplicationLanguageChangeTransaction _didComplete](&v3, "_didComplete");
  -[BSInvalidatable invalidate](self->_preventKioskLaunchAssertion, "invalidate");
  -[BSWatchdog invalidate](self->_watchdog, "invalidate");
}

- (double)watchdogTimeout
{
  return 3.0;
}

- (BOOL)shouldWatchdog:(id *)a3
{
  if (a3)
  {
    if (self->_relaunchBundleID) {
      objc_super v3 = @"Request to launch application timed out";
    }
    else {
      objc_super v3 = @"Switching languages w/o app relaunch timed out";
    }
    *a3 = v3;
  }

  return 1;
}

- (id)_createPreventKioskRelaunchAssertion
{
  if (self->_relaunchBundleID)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:"));
    processManager = self->_processManager;
    unsigned int v5 = (objc_class *)objc_opt_class(self);
    id v6 = NSStringFromClass(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBProcessManager preventKioskRelaunchForTerminatingBundleIDs:reason:]( processManager,  "preventKioskRelaunchForTerminatingBundleIDs:reason:",  v3,  v7));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_enumerateApplicationProcesses:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"enumerator != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002722E0();
    }
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x10002A040LL);
  }

  unsigned int v5 = (void (**)(void, void, void))v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBProcessManager allApplicationProcesses](self->_fbProcessManager, "allApplicationProcesses"));
  id v7 = [v6 mutableCopy];

  relaunchBundleID = self->_relaunchBundleID;
  if (relaunchBundleID)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002A048;
    v24[3] = &unk_1003D1250;
    v9 = relaunchBundleID;
    Class v25 = v9;
    id v10 = [v7 indexOfObjectPassingTest:v24];
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      id v12 = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v10]);
      [v7 exchangeObjectAtIndex:0 withObjectAtIndex:v12];
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v15);
  }
}

- (id)_processKillCompletionForRelaunchApp
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002A0F4;
  v4[3] = &unk_1003CFEE0;
  v4[4] = self;
  return objc_retainBlock(v4);
}

- (void)_attemptLaunchingRelaunchAppWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100272388();
    }
LABEL_13:
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x10002A394LL);
  }

  if (!self->_relaunchBundleID)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only call this method if there is an app to relaunch."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100272430();
    }
    goto LABEL_13;
  }

  unsigned int v5 = (void (**)(void, void))v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneManager currentApplicationSceneHandle](self->_sceneManager, "currentApplicationSceneHandle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientProcessBundleIdentifier]);
  unsigned int v8 = [v7 isEqualToString:self->_relaunchBundleID];

  if (v8
    && (-[PBOpenAppTransitioner isTransitioning](self->_openAppTransitioner, "isTransitioning") & 1) == 0)
  {
    -[PBApplicationLanguageChangeTransaction addMilestone:](self, "addMilestone:", @"LaunchedRelaunchApp");
    processManager = self->_processManager;
    relaunchBundleID = self->_relaunchBundleID;
    relaunchURL = self->_relaunchURL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002A3F0;
    v13[3] = &unk_1003D0868;
    v13[4] = self;
    -[PBProcessManager openApplication:launchURL:options:suspended:completion:]( processManager,  "openApplication:launchURL:options:suspended:completion:",  relaunchBundleID,  relaunchURL,  0LL,  0LL,  v13);
    v5[2](v5, 1LL);
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

- (void)_invalidateRecentApplicationSnapshots
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBProcessManager recentApplicationBundleIdentifiers]( self->_processManager,  "recentApplicationBundleIdentifiers",  0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[PBSnapshotService invalidateSnapshotsForBundleIdentifier:]( self->_snapshotService,  "invalidateSnapshotsForBundleIdentifier:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (BOOL)isLanguageChange
{
  return self->_languageChange;
}

- (void)setLanguageChange:(BOOL)a3
{
  self->_languageChange = a3;
}

- (BOOL)isLocaleChange
{
  return self->_localeChange;
}

- (void)setLocaleChange:(BOOL)a3
{
  self->_localeChange = a3;
}

- (PBProcessManager)processManager
{
  return self->_processManager;
}

- (FBProcessManager)fbProcessManager
{
  return self->_fbProcessManager;
}

- (PBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (PBOpenAppTransitioner)openAppTransitioner
{
  return self->_openAppTransitioner;
}

- (PBSnapshotService)snapshotService
{
  return self->_snapshotService;
}

- (NSString)relaunchBundleID
{
  return self->_relaunchBundleID;
}

- (NSURL)relaunchURL
{
  return self->_relaunchURL;
}

- (BSInvalidatable)preventKioskLaunchAssertion
{
  return self->_preventKioskLaunchAssertion;
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
}

@end