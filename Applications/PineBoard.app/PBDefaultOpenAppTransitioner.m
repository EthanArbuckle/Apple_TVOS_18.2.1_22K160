@interface PBDefaultOpenAppTransitioner
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isTransitioning;
- (BSInvalidatable)stateCaptureHandle;
- (NSHashTable)openAppObservers;
- (NSMutableArray)coldBootQueuedTransitions;
- (PBApplicationLaunchBreadcrumbs)deepLinkingAppHistory;
- (PBDefaultOpenAppTransitioner)init;
- (PBOpenAppTransition)activeTransition;
- (PBSystemGestureHandle)cancelActiveTransitionGesture;
- (TVSConcurrentTransactionManager)backgroundOpenAppTransactionManager;
- (TVSSerialTransactionManager)foregroundOpenAppTransactionManager;
- (id)stateDumpBuilder;
- (void)_addOpenAppTransitionIfPossible:(id)a3;
- (void)_deactivateFocusedAppWithOptions:(id)a3;
- (void)_deactivateSceneHandle:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_handleDeepLinkingForTransaction:(id)a3;
- (void)_updateActiveTransitionSystemGesture;
- (void)addObserver:(id)a3;
- (void)addOpenAppTransition:(id)a3;
- (void)dealloc;
- (void)handleFocusedAppRequestDeactivationFromFailure:(BOOL)a3;
- (void)openAppTransition:(id)a3 willLaunchProcess:(id)a4;
- (void)openAppTransition:(id)a3 willReportSystemCompletionWithError:(id)a4;
- (void)openAppTransitionWillStartAnimation:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveTransition:(id)a3;
- (void)transactionManager:(id)a3 didCompleteTransaction:(id)a4;
- (void)transactionManager:(id)a3 didInterruptTransaction:(id)a4 forTransaction:(id)a5;
- (void)transactionManager:(id)a3 willBeginTransaction:(id)a4;
- (void)transactionManager:(id)a3 willInterruptTransaction:(id)a4 forTransaction:(id)a5;
@end

@implementation PBDefaultOpenAppTransitioner

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007219C;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072234;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470280 != -1) {
    dispatch_once(&qword_100470280, block);
  }
  return (id)qword_100470278;
}

- (PBDefaultOpenAppTransitioner)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBDefaultOpenAppTransitioner;
  v2 = -[PBDefaultOpenAppTransitioner init](&v25, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___TVSSerialTransactionManager);
    v4 = objc_alloc_init(&OBJC_CLASS____PBSerialTransactionManagerPolicyForegroundOpenApp);
    v5 = -[TVSSerialTransactionManager initWithPolicy:](v3, "initWithPolicy:", v4);
    foregroundOpenAppTransactionManager = v2->_foregroundOpenAppTransactionManager;
    v2->_foregroundOpenAppTransactionManager = v5;

    -[TVSSerialTransactionManager addObserver:](v2->_foregroundOpenAppTransactionManager, "addObserver:", v2);
    v7 = v2->_foregroundOpenAppTransactionManager;
    id v8 = sub_100083CA8();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVSSerialTransactionManager setLog:](v7, "setLog:", v9);

    v10 = objc_alloc_init(&OBJC_CLASS___TVSConcurrentTransactionManager);
    backgroundOpenAppTransactionManager = v2->_backgroundOpenAppTransactionManager;
    v2->_backgroundOpenAppTransactionManager = v10;

    -[TVSConcurrentTransactionManager addObserver:](v2->_backgroundOpenAppTransactionManager, "addObserver:", v2);
    v12 = v2->_backgroundOpenAppTransactionManager;
    id v13 = sub_100083CA8();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[TVSConcurrentTransactionManager setLog:](v12, "setLog:", v14);

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    coldBootQueuedTransitions = v2->_coldBootQueuedTransitions;
    v2->_coldBootQueuedTransitions = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    openAppObservers = v2->_openAppObservers;
    v2->_openAppObservers = (NSHashTable *)v17;

    v19 = objc_alloc_init(&OBJC_CLASS___PBApplicationLaunchBreadcrumbs);
    deepLinkingAppHistory = v2->_deepLinkingAppHistory;
    v2->_deepLinkingAppHistory = v19;

    id v21 = sub_1000F7E4C(&_dispatch_main_q, v2);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v22;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBDefaultOpenAppTransitioner;
  -[PBDefaultOpenAppTransitioner dealloc](&v3, "dealloc");
}

- (BOOL)isTransitioning
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDefaultOpenAppTransitioner activeTransition](self, "activeTransition"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setActiveTransition:(id)a3
{
  v5 = (PBOpenAppTransition *)a3;
  activeTransition = self->_activeTransition;
  if (activeTransition != v5)
  {
    -[PBOpenAppTransition removeObserver:](activeTransition, "removeObserver:", self);
    objc_storeStrong((id *)&self->_activeTransition, a3);
    -[PBOpenAppTransition addObserver:](self->_activeTransition, "addObserver:", self);
    -[PBDefaultOpenAppTransitioner _updateActiveTransitionSystemGesture](self, "_updateActiveTransitionSystemGesture");
  }
}

- (void)addOpenAppTransition:(id)a3
{
}

- (void)handleFocusedAppRequestDeactivationFromFailure:(BOOL)a3
{
  v6[0] = PBAppLaunchOptionDeactivation;
  v6[1] = PBAppLaunchOptionLaunchWithoutAnimation;
  v7[0] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  -[PBDefaultOpenAppTransitioner _deactivateFocusedAppWithOptions:](self, "_deactivateFocusedAppWithOptions:", v5);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_addOpenAppTransitionIfPossible:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSerialTransactionManager runningTransaction]( self->_foregroundOpenAppTransactionManager,  "runningTransaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
  unsigned int v7 = [v6 waitForDebugger];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 toAppInfo]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    unsigned int v11 = [v10 isEqual:@"com.apple.HeadBoard"];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 toAppInfo]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 toAppInfo]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
      unsigned __int8 v18 = [v14 isEqual:v17];

      if ((v18 & 1) == 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 toAppInfo]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 bundleIdentifier]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 toAppInfo]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleIdentifier]);
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Squelching launch of app '%@' while waiting for app '%@' to be debugged",  v35,  v38));
        uint64_t v39 = FBSOpenApplicationErrorCreate(5LL, @"%@");
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        [v4 _callFrontBoardCompletionIfNeededWithError:v40];
        goto LABEL_18;
      }
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
  unsigned int v20 = [v19 isForeground];

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 initialLaunchApplicationBundleID]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 toAppInfo]);
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
    unsigned __int8 v26 = [v22 isEqualToString:v25];

    if (v22 && (v26 & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_coldBootQueuedTransitions, "addObject:", v4);
LABEL_16:

      goto LABEL_18;
    }

    if (!+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
    {
LABEL_15:
      -[TVSSerialTransactionManager addTransaction:](self->_foregroundOpenAppTransactionManager, "addTransaction:", v4);
      goto LABEL_16;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"DismissControlCenterFragment",  @"DismissDialogFragment",  @"DismissFullscreenCamera",  @"DismissNowPlayingOverlay",  @"DismissRoutingUI",  @"DismissScreenSaverFragment",  0LL));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
    if (([v28 isLaunchedOverSiri] & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
      unsigned __int8 v30 = [v29 relaunchingForUserProfileSwitch];

      if ((v30 & 1) != 0)
      {
LABEL_14:
        v31 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
        -[PBCoordinatedTransitionToken setCoordinatedFragmentTypes:](v31, "setCoordinatedFragmentTypes:", v27);
        v32 = objc_alloc_init(&OBJC_CLASS___PBDismissControlCenterTransitionHint);
        -[PBCoordinatedTransitionToken addTransitionHint:](v31, "addTransitionHint:", v32);
        [v4 setCoordinatedTransitionToken:v31];

        goto LABEL_15;
      }

      v28 = v27;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v27 setByAddingObject:@"DismissSiriFragment"]);
    }

    goto LABEL_14;
  }

  -[TVSConcurrentTransactionManager addTransaction:](self->_backgroundOpenAppTransactionManager, "addTransaction:", v4);
LABEL_18:
}

- (void)_deactivateFocusedAppWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedSceneHandle]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sceneIdentity]);
  unsigned int v8 = objc_msgSend(v7, "pb_isCRDSceneIdentity");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100072AD0;
    v11[3] = &unk_1003D2E78;
    v11[4] = self;
    id v12 = v5;
    id v13 = v4;
    [v9 canStopCRDWithResult:v11];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedSceneHandle]);
    -[PBDefaultOpenAppTransitioner _deactivateSceneHandle:options:completion:]( self,  "_deactivateSceneHandle:options:completion:",  v10,  v4,  0LL);
  }
}

- (void)_deactivateSceneHandle:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProcessBundleIdentifier]);
  objc_initWeak(&location, self);
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  unsigned __int8 v26 = sub_100072D90;
  v27 = &unk_1003D2EA0;
  objc_copyWeak(&v30, &location);
  id v12 = v11;
  id v28 = v12;
  id v13 = v10;
  id v29 = v13;
  v14 = objc_retainBlock(&v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationLaunchBreadcrumbs peek](self->_deepLinkingAppHistory, "peek", v24, v25, v26, v27));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
  unsigned int v18 = [v17 appLaunchDisabled];
  unsigned int v19 = -[PBApplicationLaunchBreadcrumbs isEmpty](self->_deepLinkingAppHistory, "isEmpty");
  if ((v18 | v19) == 1)
  {
    unsigned int v20 = @"Reached top of deep link stack";
    if (!v19) {
      unsigned int v20 = 0LL;
    }
    if (v18) {
      id v21 = @"App disabled";
    }
    else {
      id v21 = v20;
    }
    [v17 openKioskApplicationWithReason:v21 options:v9 completion:v14];
  }

  else
  {
    id v22 = -[PBApplicationLaunchBreadcrumbs pop](self->_deepLinkingAppHistory, "pop");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    [v23 openApplication:v15 launchURL:0 options:v9 suspended:0 completion:v14];
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)_handleDeepLinkingForTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
  unsigned int v6 = [v5 isLaunchedOverSiri];

  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 toAppInfo]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    id v10 = [v9 copy];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    [v11 hideAssistantViewForApplication:v10];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
  if (-[PBApplicationLaunchBreadcrumbs push:](self->_deepLinkingAppHistory, "push:", v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fromApplication]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);

    id v15 = sub_100083CA8();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      unsigned int v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Pushing onto deep linking history {bundleID=%{public}@}",  (uint8_t *)&v19,  0xCu);
    }
  }

  else
  {
    id v17 = sub_100083CA8();
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Clearing deep linking history",  (uint8_t *)&v19,  2u);
    }

    -[PBApplicationLaunchBreadcrumbs clear](self->_deepLinkingAppHistory, "clear");
  }
}

- (void)_updateActiveTransitionSystemGesture
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDefaultOpenAppTransitioner activeTransition](self, "activeTransition"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 openRequest]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fromSceneIdentity]);

  unsigned int v6 = objc_msgSend(v5, "pb_isDefaultKioskAppSceneIdentity");
  cancelActiveTransitionGesture = self->_cancelActiveTransitionGesture;
  if (v6)
  {
    if (!cancelActiveTransitionGesture)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
      id v9 = (PBSystemGestureHandle *)[v8 newHandleForSystemGesture:49 actionHandler:&stru_1003D2EE0];
      id v10 = self->_cancelActiveTransitionGesture;
      self->_cancelActiveTransitionGesture = v9;
    }
  }

  else
  {
    -[PBSystemGestureHandle relinquish](cancelActiveTransitionGesture, "relinquish");
  }
}

- (void)openAppTransition:(id)a3 willLaunchProcess:(id)a4
{
  id v5 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v6 = self->_openAppObservers;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "appTransitioner:willLaunchProcessForAppTransition:") & 1) != 0) {
          objc_msgSend(v11, "appTransitioner:willLaunchProcessForAppTransition:", self, v5, (void)v12);
        }
      }

      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }
}

- (void)openAppTransitionWillStartAnimation:(id)a3
{
  id v4 = a3;
  -[PBDefaultOpenAppTransitioner _updateActiveTransitionSystemGesture](self, "_updateActiveTransitionSystemGesture");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = self->_openAppObservers;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "appTransitioner:willStartAnimationForAppTransition:") & 1) != 0) {
          objc_msgSend(v10, "appTransitioner:willStartAnimationForAppTransition:", self, v4, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)openAppTransition:(id)a3 willReportSystemCompletionWithError:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
  unsigned int v7 = [v6 isForeground];

  if (v7) {
    -[PBDefaultOpenAppTransitioner _handleDeepLinkingForTransaction:](self, "_handleDeepLinkingForTransaction:", v5);
  }
}

- (void)transactionManager:(id)a3 willBeginTransaction:(id)a4
{
  id v6 = (TVSSerialTransactionManager *)a3;
  id v7 = a4;
  if (self->_foregroundOpenAppTransactionManager == v6) {
    -[PBDefaultOpenAppTransitioner setActiveTransition:](self, "setActiveTransition:", v7);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = self->_openAppObservers;
  id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "appTransitioner:willBeginAppTransition:") & 1) != 0) {
          objc_msgSend(v13, "appTransitioner:willBeginAppTransition:", self, v7, (void)v14);
        }
      }

      id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }
}

- (void)transactionManager:(id)a3 didCompleteTransaction:(id)a4
{
  id v6 = (TVSSerialTransactionManager *)a3;
  id v7 = a4;
  if (self->_foregroundOpenAppTransactionManager == v6)
  {
    -[PBDefaultOpenAppTransitioner setActiveTransition:](self, "setActiveTransition:", 0LL);
    if (![v7 isFailed]
      || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSerialTransactionManager queuedTransactions]( self->_foregroundOpenAppTransactionManager,  "queuedTransactions")),  v9 = [v8 count],  v8,  v9))
    {
      id v10 = -[NSMutableArray copy](self->_coldBootQueuedTransitions, "copy");
      coldBootQueuedTransitions = self->_coldBootQueuedTransitions;
      self->_coldBootQueuedTransitions = 0LL;

      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            -[TVSSerialTransactionManager addTransaction:]( self->_foregroundOpenAppTransactionManager,  "addTransaction:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i));
          }

          id v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }

        while (v14);
      }

      goto LABEL_12;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    id v24 = [v23 powerState];

    if (v24 == (id)3)
    {
      id v25 = sub_100083CA8();
      id v12 = (id)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v26 = "App launch failed during sleep, system will launch to the kiosk app on next wake";
LABEL_29:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
        goto LABEL_12;
      }

      goto LABEL_12;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    unsigned __int8 v28 = [v27 isPresenting];

    if ((v28 & 1) != 0)
    {
      id v29 = sub_100083CA8();
      id v12 = (id)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v26 = "App launch failed during screensaver";
        goto LABEL_29;
      }

- (void)transactionManager:(id)a3 willInterruptTransaction:(id)a4 forTransaction:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBOpenAppTransition);
  id v9 = v6;
  id v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v12 = v11;

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___PBOpenAppTransition);
  id v14 = v7;
  uint64_t v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      __int128 v16 = v15;
    }
    else {
      __int128 v16 = 0LL;
    }
  }

  else
  {
    __int128 v16 = 0LL;
  }

  id v17 = v16;

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 openRequest]);
  id v19 = [v18 copy];
  [v12 setInterruptingOpenAppRequest:v19];

  [v17 transferSceneDeactivationAssertionFromInterruptedTransition:v12];
}

- (void)transactionManager:(id)a3 didInterruptTransaction:(id)a4 forTransaction:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = self->_openAppObservers;
  id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "appTransitioner:didInterruptAppTransition:becauseOfOtherAppTransition:") & 1) != 0) {
          objc_msgSend( v14,  "appTransitioner:didInterruptAppTransition:becauseOfOtherAppTransition:",  self,  v7,  v8,  (void)v15);
        }
      }

      id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v11);
  }
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendObject:self->_deepLinkingAppHistory withKey:@"deepLinkingAppHistory"];
  return v3;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (TVSSerialTransactionManager)foregroundOpenAppTransactionManager
{
  return self->_foregroundOpenAppTransactionManager;
}

- (TVSConcurrentTransactionManager)backgroundOpenAppTransactionManager
{
  return self->_backgroundOpenAppTransactionManager;
}

- (NSHashTable)openAppObservers
{
  return self->_openAppObservers;
}

- (NSMutableArray)coldBootQueuedTransitions
{
  return self->_coldBootQueuedTransitions;
}

- (PBApplicationLaunchBreadcrumbs)deepLinkingAppHistory
{
  return self->_deepLinkingAppHistory;
}

- (PBOpenAppTransition)activeTransition
{
  return self->_activeTransition;
}

- (PBSystemGestureHandle)cancelActiveTransitionGesture
{
  return self->_cancelActiveTransitionGesture;
}

- (void).cxx_destruct
{
}

@end