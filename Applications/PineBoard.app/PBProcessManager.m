@interface PBProcessManager
+ (PBDependencyDescription)dependencyDescription;
+ (PBProcessManager)sharedInstance;
- (BOOL)_handleSpecialURL:(id)a3;
- (BOOL)_shouldRelaunchKioskForTerminatingProcessWithBundleID:(id)a3;
- (BOOL)isAirPlayViewServicePID:(int)a3;
- (BOOL)isProcessRunningForBundleID:(id)a3;
- (BOOL)isSiriViewServicePID:(int)a3;
- (BSCompoundAssertion)preventKioskRelaunchBundleIDsCompoundAssertion;
- (BSInvalidatable)airPlayProcessLaunchAssertion;
- (NSArray)recentApplicationBundleIdentifiers;
- (NSError)lastAppLaunchCompletionError;
- (PBApplicationRepairService)repairService;
- (PBKeyboardPreferenceObserver)keyboardPreferenceObserver;
- (PBProcessManager)init;
- (id)preventKioskRelaunchForTerminatingBundleIDs:(id)a3 reason:(id)a4;
- (id)preventKioskRelaunchWithReason:(id)a3 forTerminatingApplications:(id)a4;
- (id)systemServiceApplicationInfoProvider:(id)a3;
- (void)_handleFairplayLaunchFailureForApplication:(id)a3;
- (void)_openAppFromRequest:(id)a3 bundleIdentifier:(id)a4 URL:(id)a5 completion:(id)a6;
- (void)_setupRecentApplicationIdentifiers:(id)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4;
- (void)dealloc;
- (void)ensureTVAirPlayRunning;
- (void)keyboardPreferenceObserver:(id)a3 didUpdateFromKeyboardStyle:(int64_t)a4 toKeyboardStyle:(int64_t)a5;
- (void)killApplication:(id)a3 removeFromRecents:(BOOL)a4;
- (void)openApplication:(id)a3 launchURL:(id)a4 options:(id)a5 suspended:(BOOL)a6 completion:(id)a7;
- (void)prepareSystemForSleepWithCompletion:(id)a3;
- (void)preventProcessLaunchMonitor:(id)a3 updatedBundleIDsAdding:(id)a4 removing:(id)a5;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)reboot;
- (void)relaunch;
- (void)restoreSystemFromSleepWithCompletion:(id)a3;
- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5;
- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5;
- (void)systemService:(id)a3 prepareForShutdownWithOptions:(id)a4 origin:(id)a5;
- (void)systemServicePrepareForExit:(id)a3 andRelaunch:(BOOL)a4;
- (void)terminateCurrentApplicationIfRestrictedWithCompletion:(id)a3;
@end

@implementation PBProcessManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100203DB4;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (PBProcessManager)sharedInstance
{
  if (qword_1004714F8 != -1) {
    dispatch_once(&qword_1004714F8, &stru_1003DCF00);
  }
  return (PBProcessManager *)(id)qword_1004714F0;
}

- (PBProcessManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBProcessManager;
  v2 = -[PBProcessManager init](&v24, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    recentApplicationBundleIdentifiers = v2->_recentApplicationBundleIdentifiers;
    v2->_recentApplicationBundleIdentifiers = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pendingSnapshots = v2->_pendingSnapshots;
    v2->_pendingSnapshots = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___FBSSystemService);
    systemService = v2->_systemService;
    v2->_systemService = v7;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1002040D4;
    v22[3] = &unk_1003D0FA8;
    v9 = v2;
    v23 = v9;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v9,  v22);
    v10 = objc_alloc_init(&OBJC_CLASS___PBPreventProcessLaunchMonitor);
    preventProcessLaunchMonitor = v9->_preventProcessLaunchMonitor;
    v9->_preventProcessLaunchMonitor = v10;

    -[PBPreventProcessLaunchMonitor setDelegate:](v9->_preventProcessLaunchMonitor, "setDelegate:", v9);
    v12 = objc_alloc_init(&OBJC_CLASS___PBApplicationRepairService);
    repairService = v9->_repairService;
    v9->_repairService = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___PBKeyboardPreferenceObserver);
    keyboardPreferenceObserver = v9->_keyboardPreferenceObserver;
    v9->_keyboardPreferenceObserver = v14;

    -[PBKeyboardPreferenceObserver setDelegate:](v9->_keyboardPreferenceObserver, "setDelegate:", v9);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  @"com.apple.PineBoard.processManager.kioskRelaunch",  &stru_1003DCF60));
    preventKioskRelaunchBundleIDsCompoundAssertion = v9->_preventKioskRelaunchBundleIDsCompoundAssertion;
    v9->_preventKioskRelaunchBundleIDsCompoundAssertion = (BSCompoundAssertion *)v16;

    v18 = v9->_preventKioskRelaunchBundleIDsCompoundAssertion;
    id v19 = sub_1000839D8();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[BSCompoundAssertion setLog:](v18, "setLog:", v20);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v4 removeObserver:self];

  -[PBPreventProcessLaunchMonitor invalidate](self->_preventProcessLaunchMonitor, "invalidate");
  -[BSCompoundAssertion invalidate](self->_preventKioskRelaunchBundleIDsCompoundAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_airPlayProcessLaunchAssertion, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBProcessManager;
  -[PBProcessManager dealloc](&v5, "dealloc");
}

- (void)_setupRecentApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  -[NSMutableOrderedSet addObjectsFromArray:](v5->_recentApplicationBundleIdentifiers, "addObjectsFromArray:", v4);
  objc_sync_exit(v5);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100204334;
  block[3] = &unk_1003CFF08;
  block[4] = v5;
  dispatch_async(&_dispatch_main_q, block);
}

- (NSArray)recentApplicationBundleIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v2->_recentApplicationBundleIdentifiers, "array"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isSiriViewServicePID:(int)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[FBProcessManager processesForBundleIdentifier:]( self->_fbProcessManager,  "processesForBundleIdentifier:",  @"com.apple.siri",  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) pid] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isAirPlayViewServicePID:(int)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[FBProcessManager processesForBundleIdentifier:]( self->_fbProcessManager,  "processesForBundleIdentifier:",  @"com.apple.TVAirPlay",  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) pid] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isProcessRunningForBundleID:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 processesForBundleIdentifier:v3]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) state]);
        unsigned __int8 v10 = [v9 isRunning];

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)openApplication:(id)a3 launchURL:(id)a4 options:(id)a5 suspended:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  __int128 v15 = (void (**)(void, void, void))v14;
  if (v11)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
    unsigned int v18 = [v11 isEqual:v17];

    if (!v18)
    {
      if (v13) {
        v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
      }
      else {
        v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }
      v31 = v32;
      if (v8)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        -[NSMutableDictionary setObject:forKey:]( v31,  "setObject:forKey:",  v33,  FBSOpenApplicationOptionKeyActivateSuspended);
      }

      if (v12) {
        -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v12, FBSOpenApplicationOptionKeyPayloadURL);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v31));
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_100204964;
      v36[3] = &unk_1003D1688;
      v37 = v15;
      [v35 openApplication:v11 withOptions:v34 completion:v36];

      goto LABEL_18;
    }

    id v19 = sub_100083CA8();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_100292C44(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    if (v15)
    {
      v28 = @"Asking the system app to open itself, that's invalid.";
      uint64_t v29 = 2LL;
LABEL_9:
      uint64_t v30 = FBSOpenApplicationErrorCreate(v29, v28);
      v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v30);
      ((void (**)(void, void, NSMutableDictionary *))v15)[2](v15, 0LL, v31);
LABEL_18:
    }
  }

  else if (v14)
  {
    v28 = @"Passed in a nil bundleIdentifier, there is nothing to open";
    uint64_t v29 = 4LL;
    goto LABEL_9;
  }
}

- (void)killApplication:(id)a3 removeFromRecents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[FBProcessManager applicationProcessesForBundleIdentifier:]( self->_fbProcessManager,  "applicationProcessesForBundleIdentifier:",  v6));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) killForReason:1 andReport:0 withDescription:@"PBProcessManager killing application"];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  if (v6 && v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
    [v12 invalidateSnapshotsForBundleIdentifier:v6];

    id v13 = self;
    objc_sync_enter(v13);
    -[NSMutableOrderedSet removeObject:](v13->_recentApplicationBundleIdentifiers, "removeObject:", v6);
    objc_sync_exit(v13);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100204C20;
    block[3] = &unk_1003CFF08;
    block[4] = v13;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)ensureTVAirPlayRunning
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
  unsigned int v4 = [v3 appLaunchDisabled];

  if (v4)
  {
    id v5 = sub_1000824FC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#Alert #SYSTEM Inhibiting AirPlay launch.",  v14,  2u);
    }

    -[BSInvalidatable invalidate](self->_airPlayProcessLaunchAssertion, "invalidate");
    airPlayProcessLaunchAssertion = self->_airPlayProcessLaunchAssertion;
    self->_airPlayProcessLaunchAssertion = 0LL;
  }

  else
  {
    if ((sub_1001C9BFC() & 1) != 0) {
      return;
    }
    airPlayProcessLaunchAssertion = self->_airPlayProcessLaunchAssertion;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
    id v9 = (objc_class *)objc_opt_class(self);
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue([v8 launchAirPlayProcessForReason:v11]);
    id v13 = self->_airPlayProcessLaunchAssertion;
    self->_airPlayProcessLaunchAssertion = v12;

    -[BSInvalidatable invalidate](airPlayProcessLaunchAssertion, "invalidate");
  }
}

- (void)relaunch
{
}

- (void)reboot
{
  id v3 = [[FBSShutdownOptions alloc] initWithReason:@"Reboot"];
  [v3 setRebootType:1];
  [v3 setSource:1];
  -[FBSystemService shutdownUsingOptions:](self->_fbSystemAppService, "shutdownUsingOptions:", v3);
}

- (id)preventKioskRelaunchWithReason:(id)a3 forTerminatingApplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"NSString");
  if (!v8)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292C78();
    }
LABEL_13:
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x100204F1CLL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292C78();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x100204F80LL);
  }

  if (!v7)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"predicate != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292D28();
    }
    goto LABEL_13;
  }

  id v10 = [v7 copy];

  preventKioskRelaunchBundleIDsCompoundAssertion = self->_preventKioskRelaunchBundleIDsCompoundAssertion;
  id v12 = objc_retainBlock(v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( preventKioskRelaunchBundleIDsCompoundAssertion,  "acquireForReason:withContext:",  v8,  v12));

  return v13;
}

- (id)preventKioskRelaunchForTerminatingBundleIDs:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"NSSet");
  if (!v8)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292DD8();
    }
LABEL_9:
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x100205140LL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292DD8();
    }
    goto LABEL_9;
  }

  id v10 = [v8 copy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002051A8;
  v16[3] = &unk_1003D5CB0;
  id v17 = v10;
  id v11 = v10;
  id v12 = objc_retainBlock(v16);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBProcessManager preventKioskRelaunchWithReason:forTerminatingApplications:]( self,  "preventKioskRelaunchWithReason:forTerminatingApplications:",  v7,  v12));

  return v13;
}

- (id)systemServiceApplicationInfoProvider:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[PineBoard sharedApplicationLibrary]( &OBJC_CLASS___PineBoard,  "sharedApplicationLibrary",  a3));
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    Class v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

    if (v10) {
      unsigned __int8 v11 = [v10 isEnabled];
    }
    else {
      unsigned __int8 v11 = 0;
    }
    if (([v7 isEqual:@"com.apple.PBLinkHandler"] & 1) != 0
      || (id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary")),
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedApplicationWithBundleIdentifier:v7]),
          v13,
          v12,
          !v13))
    {
      uint64_t v15 = 4LL;
    }

    else
    {
      unsigned int v14 = -[PBPreventProcessLaunchMonitor terminationAssertionInEffectForProcessWithBundleIdentifier:]( self->_preventProcessLaunchMonitor,  "terminationAssertionInEffectForProcessWithBundleIdentifier:",  v7);
      if (v14) {
        uint64_t v15 = 6LL;
      }
      else {
        uint64_t v15 = 0LL;
      }
      if (((v14 | v11) & 1) == 0)
      {
        id v16 = sub_1000839D8();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = PBSAppInfoDisabledReasonsValueDescription([v10 disabledReasons]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "systemService:canActivateApplication:withResult: => Disabled because (%{public}@)",  buf,  0xCu);
        }

        uint64_t v15 = 5LL;
      }
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002053D8;
    v20[3] = &unk_1003D8458;
    id v21 = v8;
    uint64_t v22 = v15;
    dispatch_async(&_dispatch_main_q, v20);
  }
}

- (BOOL)_handleSpecialURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
  if ([v4 isEqualToString:@"prefs"])
  {
    uint64_t v29 = v4;
    id v30 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"&"]);

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v8)
    {
      id v9 = v8;
      char v31 = 0;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v35 + 1) + 8 * (void)i) componentsSeparatedByString:@"="]);
          if ([v12 count] == (id)2)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
            unsigned int v14 = [v13 isEqualToString:@"enableSetting"];

            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
            unsigned int v16 = [v15 isEqualToString:@"disableSetting"];

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
            unsigned int v18 = [v17 isEqualToString:@"AutoDownloadApps"];

            if (v18) {
              BOOL v19 = (v14 | v16) == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
              id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ams_activeiTunesAccount"));

              id v22 = objc_alloc(&OBJC_CLASS___AMSAutomaticDownloadKindsFetchTask);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag pb_bag](&OBJC_CLASS___AMSBag, "pb_bag"));
              id v24 = [v22 initWithAccount:v21 bag:v23];

              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 perform]);
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472LL;
              v32[2] = sub_100205704;
              v32[3] = &unk_1003DCFC8;
              char v34 = v14;
              id v33 = v21;
              id v26 = v21;
              [v25 addSuccessBlock:v32];
              [v25 addErrorBlock:&stru_1003DCFE8];

              char v31 = 1;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v9);
    }

    else
    {
      char v31 = 0;
    }

    BOOL v27 = v31 & 1;
    unsigned int v4 = v29;
    id v3 = v30;
  }

  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 url]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  unsigned int v13 = [v12 _shouldHandleTestURL:v11];

  unsigned int v14 = [v7 isTrusted];
  id v15 = sub_1000839D8();
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = v14 == 0;
    unsigned int v18 = v14;
    BOOL v19 = v11;
    if (v17) {
      v20 = "NO";
    }
    else {
      v20 = "YES";
    }
    unsigned int v78 = v13;
    v75 = self;
    if (v13) {
      id v21 = "  (TEST URL)";
    }
    else {
      id v21 = "";
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcess]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v20;
    unsigned __int8 v11 = v19;
    unsigned int v14 = v18;
    *(_WORD *)&buf[22] = 2114;
    v85 = v11;
    *(_WORD *)v86 = 2082;
    *(void *)&v86[2] = v21;
    unsigned int v13 = v78;
    *(_WORD *)&v86[10] = 2114;
    *(void *)&v86[12] = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Process Manager handling open request {bundleID: %{public}@, trusted: %s, URL: %{public}@%{public}s} from %{public}@}",  buf,  0x34u);

    self = v75;
  }

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_100206104;
  v80[3] = &unk_1003DD010;
  id v24 = v8;
  id v83 = v24;
  id v25 = v9;
  id v81 = v25;
  id v26 = v7;
  id v82 = v26;
  BOOL v27 = objc_retainBlock(v80);
  if ([v25 isEqualToString:@"com.apple.PBLinkHandler"])
  {
    lastAppLaunchCompletionError = self->_lastAppLaunchCompletionError;
    if (lastAppLaunchCompletionError)
    {
      uint64_t v29 = lastAppLaunchCompletionError;
LABEL_19:
      id v33 = v29;
      char v34 = self->_lastAppLaunchCompletionError;
      self->_lastAppLaunchCompletionError = 0LL;

LABEL_20:
      ((void (*)(void *, NSError *))v27[2])(v27, v33);

      goto LABEL_21;
    }

    id v30 = @"Unable to open application for the given URL. If this is a universal link ensure a supported target app is installed.";
    uint64_t v31 = 4LL;
LABEL_18:
    uint64_t v32 = FBSOpenApplicationErrorCreate(v31, v30);
    uint64_t v29 = (NSError *)objc_claimAutoreleasedReturnValue(v32);
    goto LABEL_19;
  }

  if ([v25 isEqualToString:@"com.apple.TVAirPlay"])
  {
    id v30 = @"Invalid attempt to launch AirPlay";
    uint64_t v31 = 5LL;
    goto LABEL_18;
  }

  if (!v14)
  {
    if (!v11)
    {
      v45 = self;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v26 options]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 dictionary]);
      id v48 = objc_msgSend( v47,  "bs_safeObjectForKey:ofType:",  FBSOpenApplicationOptionKeyActivateSuspended,  objc_opt_class(NSNumber));
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      unsigned int v50 = [v49 BOOLValue];

      if (v50)
      {
        uint64_t v51 = FBSOpenApplicationErrorCreate(3LL, @"Can't launch suspended for untrusted request");
        id v33 = (NSError *)objc_claimAutoreleasedReturnValue(v51);
        goto LABEL_20;
      }

      if (!v25)
      {
        uint64_t v64 = FBSOpenApplicationErrorCreate(4LL, @"Can't fund destination bundle ID for untrusted request");
        v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
        ((void (*)(void *, void *))v27[2])(v27, v65);

        id v25 = 0LL;
        goto LABEL_21;
      }

      v41 = v45;
      id v42 = v26;
      id v43 = v25;
      v44 = 0LL;
LABEL_31:
      -[PBProcessManager _openAppFromRequest:bundleIdentifier:URL:completion:]( v41,  "_openAppFromRequest:bundleIdentifier:URL:completion:",  v42,  v43,  v44,  v27);
      goto LABEL_21;
    }

    v76 = self;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 applicationsAvailableForOpeningURL:v11]);
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 valueForKey:@"bundleIdentifier"]);

    if (!v25)
    {
      id v25 = (id)objc_claimAutoreleasedReturnValue([v37 firstObject]);
      id v38 = sub_1000839D8();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v11 scheme]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Process Manager identified app %{public}@ to open URL with scheme %{public}@",  buf,  0x16u);
      }
    }

    if (([v37 containsObject:v25] | v13))
    {
      if (v25)
      {
        -[PBProcessManager _openAppFromRequest:bundleIdentifier:URL:completion:]( v76,  "_openAppFromRequest:bundleIdentifier:URL:completion:",  v26,  v25,  v11,  v27);
LABEL_55:

        goto LABEL_21;
      }
    }

    else
    {
      id v52 = sub_1000839D8();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_100292F48((uint64_t)v25, v11, v53);
      }
    }

    v77 = v37;
    v74 = v27;
    id v54 = v26;
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 clientProcess]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([v55 bundleIdentifier]);

    v56 = (void *)objc_claimAutoreleasedReturnValue([v54 bundleIdentifier]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v54 options]);

    uint64_t v58 = objc_claimAutoreleasedReturnValue([v57 url]);
    v73 = (void *)v58;
    if (!v56)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @". No app available to handle '%@'.",  v58));
      uint64_t v63 = 4LL;
LABEL_52:
      uint64_t v66 = FBSOpenApplicationErrorCreate(v63, @"[PBD] Untrusted request from '%@' to open '%@'%@");
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      id v68 = sub_1000839D8();
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "#Alert #SYSTEM open application failure: %{public}@",  buf,  0xCu);
      }

      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100208CFC;
      v85 = &unk_1003D2560;
      *(void *)v86 = v67;
      *(void *)&v86[8] = v74;
      v70 = v74;
      id v71 = v67;
      dispatch_async(&_dispatch_main_q, buf);

      __int128 v37 = v77;
      goto LABEL_55;
    }

    v72 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v56,  1LL,  0LL);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationState](v72, "applicationState"));
    v60 = v59;
    if (v59 && ([v59 isValid] & 1) != 0)
    {
      if ([v60 isPlaceholder])
      {
        v61 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @". App is a placeholder and cannot be opened. URL: '%@'.",  v58);
LABEL_50:
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        uint64_t v63 = 8LL;
        goto LABEL_51;
      }

      if (![v60 isRestricted])
      {
        v61 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @". App cannot handle '%@'.",  v58);
        goto LABEL_50;
      }

      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @". App is restricted. URL: '%@'.",  v58));
      uint64_t v63 = 3LL;
    }

    else
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @". App is invalid. URL: '%@'.",  v58));
      uint64_t v63 = 4LL;
    }

- (void)_openAppFromRequest:(id)a3 bundleIdentifier:(id)a4 URL:(id)a5 completion:(id)a6
{
  id v70 = a3;
  id v71 = (char *)a4;
  id v68 = a5;
  v72 = (void (**)(id, void))a6;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v71]);

  if (!v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    unsigned int v21 = [v20 _shouldHandleTestURL:v68];

    if (v21)
    {
      [UIApp handleTestURL:v68];
      if (v72) {
        v72[2](v72, 0LL);
      }
    }

    else if (v72)
    {
      uint64_t v22 = FBSOpenApplicationErrorCreate(4LL, @"Cound not find any application for open app system request %@");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      ((void (**)(id, void *))v72)[2](v72, v23);
    }

    goto LABEL_39;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);
  unsigned int v13 = [v12 isArcadeApplication];

  if (!v13)
  {
LABEL_36:
    v53 = (void *)objc_claimAutoreleasedReturnValue([v70 clientProcess]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([v53 bundleIdentifier]);

    id v54 = (void *)objc_claimAutoreleasedReturnValue(-[PBProcessManager recentApplicationBundleIdentifiers](self, "recentApplicationBundleIdentifiers"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 lastObject]);

    v56 = (void *)objc_claimAutoreleasedReturnValue([v69 applicationForBundleIdentifier:v67]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v69 applicationForBundleIdentifier:v55]);
    uint64_t v58 = -[PBOpenApplicationRequest initWithSystemServiceRequest:toAppInfo:fromApplication:sourceApplication:]( objc_alloc(&OBJC_CLASS___PBOpenApplicationRequest),  "initWithSystemServiceRequest:toAppInfo:fromApplication:sourceApplication:",  v70,  v11,  v57,  v56);
    objc_initWeak(&location, self);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_1002069AC;
    v73[3] = &unk_1003DD038;
    objc_copyWeak(&v76, &location);
    v59 = v58;
    v74 = v59;
    v75 = v72;
    v60 = objc_retainBlock(v73);
    v61 = -[PBOpenAppTransition initWithRequest:completion:]( objc_alloc(&OBJC_CLASS___PBOpenAppTransition),  "initWithRequest:completion:",  v59,  v60);
    id v62 = sub_100083CA8();
    uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v64 = (char *)objc_claimAutoreleasedReturnValue(-[PBOpenAppTransition debugDescription](v61, "debugDescription"));
      *(_DWORD *)buf = 136315394;
      double v79 = COERCE_DOUBLE("-[PBProcessManager _openAppFromRequest:bundleIdentifier:URL:completion:]");
      __int16 v80 = 2114;
      id v81 = v64;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "%s - opening app with transition: %{public}@\n",  buf,  0x16u);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
    [v65 addOpenAppTransition:v61];

    objc_destroyWeak(&v76);
    objc_destroyWeak(&location);

    goto LABEL_39;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v15 = v14;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);
  id v17 = objc_claimAutoreleasedReturnValue([v16 executableURL]);
  unsigned int v18 = (const char *)[v17 fileSystemRepresentation];

  if (!v18)
  {
    BOOL v24 = 0;
    int v25 = 0;
    goto LABEL_30;
  }

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);
  if ([v19 isBeta])
  {
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);
    unsigned int v27 = [v26 isInstalledByMagellan];

    if (!v27)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ams_activeiTunesAccount"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_DSID"));

      [v30 longLongValue];
      sub_10024CD08();
      int v25 = v33;
      id v34 = sub_1000839D8();
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&double v79 = v25;
        __int16 v80 = 2082;
        id v81 = v18;
        __int16 v82 = 2112;
        id v83 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "FairPlayIsApplicationLaunchableForDSID returned %ld for '%{public}s' with DSID: %@",  buf,  0x20u);
      }

      goto LABEL_18;
    }
  }

  sub_100268144();
  int v25 = v28;
  id v29 = sub_1000839D8();
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&double v79 = v25;
    __int16 v80 = 2082;
    id v81 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_LOG_TYPE_DEFAULT,  "FairPlayIsApplicationLaunchable returned %ld' for '%{public}s'",  buf,  0x16u);
  }

- (void)systemService:(id)a3 prepareForShutdownWithOptions:(id)a4 origin:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_1000839D8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
    unsigned int v12 = [v6 rebootType];
    unsigned int v13 = [v6 isUserInitiated];
    double v14 = "not ";
    int v21 = 138544130;
    __int16 v23 = 2114;
    uint64_t v22 = v10;
    if (v13) {
      double v14 = "";
    }
    BOOL v24 = v11;
    __int16 v25 = 1024;
    unsigned int v26 = v12;
    __int16 v27 = 2080;
    int v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reboot requested by '%{public}@', reason '%{public}@', type %d, %suser initiated",  (uint8_t *)&v21,  0x26u);
  }

  +[TVSPreferences synchronizeAllDomains](&OBJC_CLASS___TVSPreferences, "synchronizeAllDomains");
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeAccessoryManager sharedInstance](&OBJC_CLASS___PBHomeAccessoryManager, "sharedInstance"));
  unsigned int v16 = [v15 isOdeonConfigured];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBHotBlackManager sharedInstance](&OBJC_CLASS___PBHotBlackManager, "sharedInstance"));
    [v17 presentWithActivityIndicator];

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v18 _stopAllOdeonActivity];

    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    [v19 runUntilDate:v20];
  }
}

- (void)systemServicePrepareForExit:(id)a3 andRelaunch:(BOOL)a4
{
  id v4 = sub_1000839D8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System App Restart requested", v6, 2u);
  }

  +[TVSPreferences synchronizeAllDomains](&OBJC_CLASS___TVSPreferences, "synchronizeAllDomains");
}

- (void)_handleFairplayLaunchFailureForApplication:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 executableURL]);
  id v6 = objc_claimAutoreleasedReturnValue([v5 path]);
  id v7 = [v6 UTF8String];

  if (v7)
  {
    sub_100268144();
    int v9 = v8;
  }

  else
  {
    int v9 = 0;
  }

  unsigned int v10 = v9 + 42597;
  id v11 = sub_1000839D8();
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109376;
    v13[1] = v9;
    __int16 v14 = 1024;
    BOOL v15 = v10 < 2;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "FairPlay launchable error = %d, forFamilyLeave? %{BOOL}d",  (uint8_t *)v13,  0xEu);
  }

  if (v10 >= 2) {
    -[PBApplicationRepairService repairApplication:completion:]( self->_repairService,  "repairApplication:completion:",  v4,  0LL);
  }
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  if ([v5 isApplicationProcess])
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100206E70;
    v6[3] = &unk_1003D0378;
    objc_copyWeak(&v9, &location);
    id v7 = v5;
    int v8 = self;
    dispatch_async(&_dispatch_main_q, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  id v4 = a4;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100207814;
  v48[3] = &unk_1003DD060;
  id v39 = (id)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  id v49 = v39;
  id v5 = objc_retainBlock(v48);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 removedAppInfos]);
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        ((void (*)(void *, void, const __CFString *))v5[2])( v5,  *(void *)(*((void *)&v44 + 1) + 8LL * (void)v10),  @"Terminated due to uninstall/update");
        unsigned int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }

    while (v8);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 oldToNewUpdatedAppInfos]);
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      BOOL v15 = 0LL;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 oldToNewUpdatedAppInfos]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v16]);

        if ([v16 isEnabled] && (objc_msgSend(v18, "isEnabled") & 1) == 0)
        {
          BOOL v19 = objc_alloc(&OBJC_CLASS___NSString);
          uint64_t v20 = PBSAppInfoDisabledReasonsValueDescription([v18 disabledReasons]);
          int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          uint64_t v22 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"Terminated -- disabled for reasons (%@)",  v21);
          ((void (*)(void *, void *, NSString *))v5[2])(v5, v18, v22);
        }

        BOOL v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }

    while (v13);
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 oldToNewConfiguration]);
  id v24 = [v23 count];

  if (v24)
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v4 oldToNewConfiguration]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 keyEnumerator]);
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allObjects]);
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 oldToNewConfiguration]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectEnumerator]);
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 allObjects]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([(id)v31 firstObject]);

    int v33 = (void *)objc_claimAutoreleasedReturnValue([v28 kioskAppBundleIdentifier]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 kioskAppBundleIdentifier]);
    LOBYTE(v31) = [v33 isEqual:v34];

    if ((v31 & 1) == 0)
    {
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v28 kioskAppBundleIdentifier]);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v36]);

      if (v37) {
        ((void (*)(void *, void *, const __CFString *))v5[2])( v5,  v37,  @"Terminated for kiosk app change");
      }
    }
  }
}

- (void)preventProcessLaunchMonitor:(id)a3 updatedBundleIDsAdding:(id)a4 removing:(id)a5
{
  id v7 = a4;
  id v30 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBProcessManager currentProcess](self->_fbProcessManager, "currentProcess"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[FBProcessManager applicationProcessesForBundleIdentifier:]( self->_fbProcessManager,  "applicationProcessesForBundleIdentifier:",  v13));
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

        if (v15 != v8)
        {
          id v16 = sub_1000839D8();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v42 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Terminating process with bundle identifier: %{public}@",  buf,  0xCu);
          }

          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dynamicStateDataSource]);
          [v19 setAnyTerminationAssertionInEffect:1 forApplicationWithBundleIdentifier:v13];
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }

    while (v10);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v20 = v30;
  id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)j);
        id v26 = sub_1000839D8();
        __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v42 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Disabling cache delete for bundle identifier: %{public}@",  buf,  0xCu);
        }

        int v28 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dynamicStateDataSource]);
        [v29 setAnyTerminationAssertionInEffect:0 forApplicationWithBundleIdentifier:v25];
      }

      id v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v22);
  }
}

- (void)keyboardPreferenceObserver:(id)a3 didUpdateFromKeyboardStyle:(int64_t)a4 toKeyboardStyle:(int64_t)a5
{
  id v7 = sub_1000F70B4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10011288C(a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = sub_10011288C(a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    __int128 v37 = v10;
    __int16 v38 = 2114;
    __int128 v39 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Terminating foreground apps due to keyboard change from '%{public}@' to '%{public}@'",  buf,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfoController enabledAndVisibleAppsFilter]( &OBJC_CLASS___PBAppInfoController,  "enabledAndVisibleAppsFilter"));
  uint64_t v14 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100207F9C;
  v33[3] = &unk_1003DD088;
  id v28 = v13;
  id v34 = v28;
  id v16 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v14,  "initWithInfoStore:filter:delegate:",  v15,  v33,  0LL);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v16, "appInfos"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allApplicationProcesses]);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v26]);

        if (v27) {
          [v25 killForReason:3 andReport:0 withDescription:@"Keyboard Change" completion:0];
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v22);
  }
}

- (void)prepareSystemForSleepWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity _pb_defaultSceneIdentity]( &OBJC_CLASS___FBSSceneIdentity,  "_pb_defaultSceneIdentity"));
  [v4 foregroundSceneWithIdentity:v5 backgroundAllOtherScenes:1 completion:v3];
}

- (void)restoreSystemFromSleepWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentApplicationSceneHandle]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sceneIfExists]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientProcess]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  if ([v8 shouldLaunchCRD])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    unsigned int v10 = [v9 isPresenting];
  }

  else
  {
    unsigned int v10 = 0;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  if ([v11 shouldLaunchCRD])
  {
    unsigned int v12 = 0;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    unsigned int v12 = [v13 isEqualToString:@"com.apple.TVConferenceRoomDisplay"] ^ 1;
  }

  if ([v7 isRunning] && v10 | v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v14,  @"default"));

    [v4 foregroundSceneWithIdentity:v15 backgroundAllOtherScenes:0 completion:v3];
    id v16 = sub_1000839D8();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
      int v19 = 136315394;
      id v20 = "-[PBProcessManager restoreSystemFromSleepWithCompletion:]";
      __int16 v21 = 2114;
      id v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s - restoring process on wake: %{public}@",  (uint8_t *)&v19,  0x16u);
    }
  }

  else if (v3)
  {
    v3[2](v3, 0LL);
  }
}

- (void)terminateCurrentApplicationIfRestrictedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "processManager/terminateCurrentApplicationIfRestricted",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (v4)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1002087A4;
    v44[3] = &unk_1003CFF30;
    id v6 = (Block_layout *)v44;
    __int128 v35 = &v45;
    id v45 = v4;
  }

  else
  {
    id v6 = &stru_1003DD0A8;
  }

  id v7 = objc_retainBlock(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentApplicationSceneHandle]);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneIfExists]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientHandle]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 processHandle]);

  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v43, 0, sizeof(v43));
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromAuditToken:](&OBJC_CLASS___BSAuditToken, "tokenFromAuditToken:", v43));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationInfoForAuditToken:v13]);

  if (v15 && [v15 type] == (id)2)
  {
    id v16 = objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unsigned int v18 = -[PBRestrictionServiceRequest initWithToken:requestType:](v16, "initWithToken:requestType:", v17, 1LL);

    -[PBRestrictionServiceRequest setRestrictionContentType:](v18, "setRestrictionContentType:", 3LL);
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v15 ratingRank]));
    -[PBRestrictionServiceRequest setRating:](v18, "setRating:", v19);

    -[PBRestrictionServiceRequest setAllowInteraction:](v18, "setAllowInteraction:", 0LL);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
    unsigned __int8 v21 = [v20 requestPassesAgeRestriction:v18];

    if ((v21 & 1) != 0)
    {
      id v22 = sub_1000839D8();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        unsigned int v24 = [v12 pid];
        *(_DWORD *)buf = 67109120;
        unsigned int v48 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Current application passes age restriction {pid=%d}",  buf,  8u);
      }

      v7->invoke(v7, 0LL);
    }

    else
    {
      id v25 = sub_1000839D8();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = [v12 pid];
        *(_DWORD *)buf = 67109120;
        unsigned int v48 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Current application does not pass age restriction {pid=%d}",  buf,  8u);
      }

      id v28 = self->_fbProcessManager;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1002087C4;
      v39[3] = &unk_1003D2F08;
      id v34 = v28;
      __int128 v40 = v34;
      id v41 = v12;
      __int128 v29 = v7;
      uint64_t v42 = v29;
      __int128 v30 = objc_retainBlock(v39);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_1002089B0;
      v36[3] = &unk_1003DD0D0;
      __int128 v37 = v29;
      __int128 v31 = v30;
      id v38 = v31;
      __int128 v32 = objc_retainBlock(v36);
      -[PBRestrictionServiceRequest setServiceRequestCompletionBlock:](v18, "setServiceRequestCompletionBlock:", v32);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
      [v33 validateRestrictionForContentTypesWithRequest:v18];
    }
  }

  else
  {
    v7->invoke(v7, 0LL);
  }

  if (v4) {
  os_activity_scope_leave(&state);
  }
}

- (BOOL)_shouldRelaunchKioskForTerminatingProcessWithBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_preventKioskRelaunchBundleIDsCompoundAssertion, "context"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100208A88;
    v8[3] = &unk_1003DD0F8;
    id v9 = v4;
    unsigned int v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v8) ^ 1;
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 launchProcess]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  if (([v7 isFailed] & 1) == 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 openRequest]);
    unsigned int v11 = [v10 isForeground];

    if (v11)
    {
      if (v9)
      {
        unsigned int v12 = self;
        objc_sync_enter(v12);
        -[NSMutableOrderedSet removeObject:](v12->_recentApplicationBundleIdentifiers, "removeObject:", v9);
        -[NSMutableOrderedSet addObject:](v12->_recentApplicationBundleIdentifiers, "addObject:", v9);
        objc_sync_exit(v12);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100208BD8;
        block[3] = &unk_1003CFF08;
        block[4] = v12;
        dispatch_async(&_dispatch_main_q, block);
      }
    }
  }
}

- (PBApplicationRepairService)repairService
{
  return self->_repairService;
}

- (PBKeyboardPreferenceObserver)keyboardPreferenceObserver
{
  return self->_keyboardPreferenceObserver;
}

- (BSCompoundAssertion)preventKioskRelaunchBundleIDsCompoundAssertion
{
  return self->_preventKioskRelaunchBundleIDsCompoundAssertion;
}

- (BSInvalidatable)airPlayProcessLaunchAssertion
{
  return self->_airPlayProcessLaunchAssertion;
}

- (NSError)lastAppLaunchCompletionError
{
  return self->_lastAppLaunchCompletionError;
}

- (void).cxx_destruct
{
}

@end