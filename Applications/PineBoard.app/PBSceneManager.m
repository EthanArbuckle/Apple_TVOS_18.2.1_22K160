@interface PBSceneManager
+ (PBDependencyDescription)dependencyDescription;
+ (PBSceneManager)sharedInstance;
- (BKSMutableHIDEventDeferringTarget)lastDeferringTarget;
- (BOOL)_eventsCanBeDeferredToSceneHandle:(id)a3;
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BSInvalidatable)focusDeferral;
- (BSInvalidatable)stateCaptureHandle;
- (FBSceneManager)fbSceneManager;
- (NSMutableArray)deferralTargetAssertions;
- (NSMutableSet)pendingSnapshots;
- (PBAuxiliarySceneManager)auxiliarySceneManager;
- (PBSceneDeactivationManager)sceneDeactivationManager;
- (PBSceneHandle)currentApplicationSceneHandle;
- (PBSceneHandle)focusedSceneHandle;
- (PBSceneManager)init;
- (PBScenePresentationBinding)rootWindowScenePresentationBinder;
- (PBScenePresenter)scenePresenter;
- (PBSceneRegistry)workspaceSceneRegistry;
- (PBSceneShroudController)shroudController;
- (PBSetTopBoxIntentDispatcher)setTopBoxIntentDispatcher;
- (TVSConcurrentTransactionManager)updateSceneTransactionManager;
- (TVSObserverSet)observers;
- (id)stateDumpBuilder;
- (void)_didAddProcess:(id)a3;
- (void)_didAddProcesses:(id)a3;
- (void)_didRemoveProcess:(id)a3;
- (void)_notifyObserversDidUpdateFocusedFrame:(CGRect)a3 forFocusedScene:(id)a4;
- (void)_notifyObserversDidUpdateOverlayInsets:(UIEdgeInsets)a3 forFocusedScene:(id)a4;
- (void)_receivedRequestCompactSceneAction:(id)a3 fromScene:(id)a4;
- (void)_updateFocusDeferralsIfNeeded;
- (void)addObserver:(id)a3;
- (void)addSceneDeferralTargetAssertion:(id)a3;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 forProcess:(id)a4 completion:(id)a5;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)foregroundSceneWithIdentity:(id)a3 backgroundAllOtherScenes:(BOOL)a4 completion:(id)a5;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeSceneDeferralTargetAssertion:(id)a3;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneLayoutViewController:(id)a3 didChangeOldFocusedSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 completion:(id)a5;
@end

@implementation PBSceneManager

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001EC674;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDisplayManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

+ (PBSceneManager)sharedInstance
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001EC70C;
  v3[3] = &unk_1003D32B0;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_100471448 != -1) {
    dispatch_once(&qword_100471448, v3);
  }
  return (PBSceneManager *)(id)qword_100471440;
}

- (PBSceneManager)init
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___PBSceneManager;
  uint64_t v3 = -[PBSceneManager init](&v47, "init");
  if (!v3) {
    return v3;
  }
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PBAuxiliarySceneManager);
  auxiliarySceneManager = v3->_auxiliarySceneManager;
  v3->_auxiliarySceneManager = v4;

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  fbSceneManager = v3->_fbSceneManager;
  v3->_fbSceneManager = (FBSceneManager *)v6;

  -[FBSceneManager setDelegate:](v3->_fbSceneManager, "setDelegate:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  [v8 addObserver:v3];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allProcesses]);
  -[PBSceneManager _didAddProcesses:](v3, "_didAddProcesses:", v9);

  v10 = objc_alloc_init(&OBJC_CLASS___PBScenePresenter);
  scenePresenter = v3->_scenePresenter;
  v3->_scenePresenter = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___PBSceneShroudController);
  shroudController = v3->_shroudController;
  v3->_shroudController = v12;

  v14 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
  observers = v3->_observers;
  v3->_observers = v14;

  v16 = objc_alloc_init(&OBJC_CLASS___TVSConcurrentTransactionManager);
  updateSceneTransactionManager = v3->_updateSceneTransactionManager;
  v3->_updateSceneTransactionManager = v16;

  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  deferralTargetAssertions = v3->_deferralTargetAssertions;
  v3->_deferralTargetAssertions = v18;

  v20 = -[PBSetTopBoxIntentDispatcher initWithSceneManager:]( objc_alloc(&OBJC_CLASS___PBSetTopBoxIntentDispatcher),  "initWithSceneManager:",  v3);
  setTopBoxIntentDispatcher = v3->_setTopBoxIntentDispatcher;
  v3->_setTopBoxIntentDispatcher = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
  [v22 setSceneHandleDelegate:v3];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mainWorkspace]);

  if (v24)
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 handle]);
    workspaceSceneRegistry = v3->_workspaceSceneRegistry;
    v3->_workspaceSceneRegistry = (PBSceneRegistry *)v25;

    if ((sub_1001C9E00() & 1) == 0)
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v24 scenePresentationBinder]);
      rootWindowScenePresentationBinder = v3->_rootWindowScenePresentationBinder;
      v3->_rootWindowScenePresentationBinder = (PBScenePresentationBinding *)v27;
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v24 sceneDeactivationManager]);
    sceneDeactivationManager = v3->_sceneDeactivationManager;
    v3->_sceneDeactivationManager = (PBSceneDeactivationManager *)v29;

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001ECAFC;
    v45[3] = &unk_1003D0FA8;
    v31 = v3;
    v46 = v31;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v31,  v45);
    objc_initWeak(&location, v31);
    v32 = (objc_class *)objc_opt_class(v31);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%p)",  v34,  v31));

    v36 = &_dispatch_main_q;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001ECBC0;
    v42[3] = &unk_1003D3F18;
    objc_copyWeak(&v43, &location);
    uint64_t v37 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v35, v42);
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    stateCaptureHandle = v31->_stateCaptureHandle;
    v31->_stateCaptureHandle = (BSInvalidatable *)v38;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

    return v3;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"mainWorkspace != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100291844(a2, (uint64_t)v3, (uint64_t)v41);
  }
  result = (PBSceneManager *)_bs_set_crash_log_message([v41 UTF8String]);
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusCoordinator]);
  [v5 removeObserver:self];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  [v6 removeStateObserver:self];

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBSceneManager;
  -[PBSceneManager dealloc](&v7, "dealloc");
}

- (PBSceneHandle)currentApplicationSceneHandle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedSceneHandle]);

  return (PBSceneHandle *)v3;
}

- (void)foregroundSceneWithIdentity:(id)a3 backgroundAllOtherScenes:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = -[PBForegroundSceneTransaction initWithSceneIdentity:backgroundAllOtherScenes:]( objc_alloc(&OBJC_CLASS___PBForegroundSceneTransaction),  "initWithSceneIdentity:backgroundAllOtherScenes:",  v9,  v5);

  -[PBForegroundSceneTransaction setCompletionBlock:](v10, "setCompletionBlock:", v8);
  -[TVSConcurrentTransactionManager addTransaction:](self->_updateSceneTransactionManager, "addTransaction:", v10);
}

- (void)addObserver:(id)a3
{
  if (a3) {
    id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[TVSObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)addSceneDeferralTargetAssertion:(id)a3
{
}

- (void)removeSceneDeferralTargetAssertion:(id)a3
{
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 forProcess:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v11 = (NSMutableArray *)v8;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v44,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneManager sceneWithIdentifier:](self->_fbSceneManager, "sceneWithIdentifier:", v16));
        v18 = v17;
        if (v17)
        {
          id v19 = (id)objc_claimAutoreleasedReturnValue([v17 clientProcess]);

          if (v19 != v9)
          {
            NSErrorUserInfoKey v42 = NSLocalizedFailureReasonErrorKey;
            id v43 = @"Scene does not belong to requesting client process.";
            v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBSceneManager",  1LL,  v28));
            v20 = v30;
            (*((void (**)(id, void, void *))v30 + 2))(v30, 0LL, v29);

            v21 = v11;
            goto LABEL_24;
          }

          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v44,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (-[NSMutableArray count](v10, "count"))
  {
    v20 = v30;
    (*((void (**)(id, uint64_t, void))v30 + 2))(v30, 1LL, 0LL);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v21 = v10;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v41,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneManager sceneWithIdentifier:](self->_fbSceneManager, "sceneWithIdentifier:", v26));

          if (v27) {
            -[FBSceneManager destroyScene:withTransitionContext:]( self->_fbSceneManager,  "destroyScene:withTransitionContext:",  v26,  0LL);
          }
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v41,  16LL);
      }

      while (v23);
      v20 = v30;
    }
  }

  else
  {
    NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
    v40 = @"No scene handles found for provided persistence IDs.";
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBSceneManager",  2LL,  v21));
    v20 = v30;
    (*((void (**)(id, void, void *))v30 + 2))(v30, 0LL, v18);
LABEL_24:
  }
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 clientProcess]);
  if ([v3 hasEntitlement:@"com.apple.springboard.requestScene-daemon"])
  {
    LOBYTE(v4) = 1;
  }

  else if ([v3 isApplicationProcess])
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    unsigned int v4 = [v3 isCurrentProcess] ^ 1;
  }

  return v4;
}

- (void)_updateFocusDeferralsIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_deferralTargetAssertions, "lastObject"));
  unsigned int v4 = (PBSceneHandle *)objc_claimAutoreleasedReturnValue([v3 sceneHandle]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v5 activeWindow]);

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___BKSMutableHIDEventDeferringTarget);
  if (!v4 || !-[PBSceneManager _eventsCanBeDeferredToSceneHandle:](self, "_eventsCanBeDeferredToSceneHandle:", v4))
  {
    id v16 = [v55 _contextId];
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v62 = sub_1001ED8A8;
    v63 = sub_1001ED8B8;
    id v64 = 0LL;
    fbSceneManager = self->_fbSceneManager;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1001ED8D0;
    v59[3] = &unk_1003DC5F0;
    int v60 = (int)v16;
    v59[4] = buf;
    -[FBSceneManager enumerateScenesWithBlock:](fbSceneManager, "enumerateScenesWithBlock:", v59);
    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      v18 = objc_alloc(&OBJC_CLASS___PBSceneHandle);
      id v19 = -[PBSceneHandle initWithScene:](v18, "initWithScene:", *(void *)(*(void *)&buf[8] + 40LL));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentProcess]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 state]);
      -[BKSMutableHIDEventDeferringTarget setPid:](v6, "setPid:", [v22 pid]);

      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:]( &OBJC_CLASS___BKSHIDEventDeferringToken,  "tokenForIdentifierOfCAContext:",  v16));
      -[BKSMutableHIDEventDeferringTarget setToken:](v6, "setToken:", v23);

      unsigned int v4 = v19;
    }

    _Block_object_dispose(buf, 8);

    goto LABEL_13;
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle scene](v4, "scene"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identityToken]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 stringRepresentation]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringToken tokenForString:]( &OBJC_CLASS___BKSHIDEventDeferringToken,  "tokenForString:",  v9));
    -[BKSMutableHIDEventDeferringTarget setToken:](v6, "setToken:", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle scene](v4, "scene"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientProcess]);
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 state]);
    id v15 = [v14 pid];
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 clientHandle]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 processHandle]);
    id v15 = [v24 pid];
  }

  if ((int)v15 >= 1)
  {
    -[BKSMutableHIDEventDeferringTarget setPid:](v6, "setPid:", v15);

LABEL_13:
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](v4, "sceneIfExists"));
    if (v9)
    {
      if (sub_100200238()
        && (-[BKSMutableHIDEventDeferringTarget isEqual:](self->_lastDeferringTarget, "isEqual:", v6) & 1) == 0)
      {
        objc_storeStrong((id *)&self->_lastDeferringTarget, v6);
        BKSHIDServicesCancelTouchesOnMainDisplay();
        uint64_t v27 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___BKSMutableHIDEventDeferringPredicate);
        -[BSInvalidatable invalidate](self->_focusDeferral, "invalidate");
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeliveryManager sharedInstance]( &OBJC_CLASS___BKSHIDEventDeliveryManager,  "sharedInstance"));
        __int128 v31 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v30 deferEventsMatchingPredicate:v27 toTarget:v6 withReason:@"PineBoardFocusDeferral"]);
        focusDeferral = self->_focusDeferral;
        self->_focusDeferral = v31;

        v54 = self->_focusedSceneHandle;
        objc_storeStrong((id *)&self->_focusedSceneHandle, v4);
        __int128 v33 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIdentifier](v4, "sceneIdentifier"));
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v9 clientProcess]);
        unsigned int v35 = [v34 isCurrentProcess];

        if (v35)
        {
          __int128 v36 = objc_alloc(&OBJC_CLASS___NSString);
          __int128 v37 = (objc_class *)objc_opt_class(v55);
          __int128 v38 = NSStringFromClass(v37);
          NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v40 = -[NSString initWithFormat:](v36, "initWithFormat:", @"%@ (%@)", v33, v39);

          __int128 v33 = v40;
        }

        id v41 = sub_100083C30();
        NSErrorUserInfoKey v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v43 = -[BKSMutableHIDEventDeferringTarget pid](v6, "pid");
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[PBSceneManager _updateFocusDeferralsIfNeeded]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v62) = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s - Updated events to new focused scene %{public}@ pid: %d",  buf,  0x1Cu);
        }

        if ([v9 isActive])
        {
          id v44 = [[UIResetFocusAction alloc] initWithInfo:0 responder:0];
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v44));
          [v9 sendActions:v45];
        }

        observers = self->_observers;
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_1001EDA20;
        v56[3] = &unk_1003DC618;
        v56[4] = self;
        v57 = v54;
        id v9 = v9;
        id v58 = v9;
        objc_super v47 = v54;
        -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v56);
      }

      else
      {
        BOOL v25 = sub_100200238();
        id v26 = sub_100083C30();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
        if (v25)
        {
          if (v28) {
            sub_1002919E4(v6, v27);
          }
        }

        else if (v28)
        {
          sub_100291A80(v27);
        }
      }
    }

    else
    {
      id v29 = sub_100083C30();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100291944(v4, v27);
      }
    }

    goto LABEL_36;
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle scene](v4, "scene"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 clientProcess]);
  v50 = v49;
  if (v49)
  {
    uint64_t v27 = v49;
  }

  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle scene](v4, "scene"));
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 clientHandle]);
  }

  id v52 = sub_100083C30();
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_100291AFC();
  }

LABEL_36:
}

- (BOOL)_eventsCanBeDeferredToSceneHandle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sceneIfExists]);
  BOOL v5 = v4;
  if (!v4)
  {
    id v23 = sub_100083C30();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v3 sceneIdentifier]);
    int v32 = 136315394;
    __int128 v33 = "-[PBSceneManager _eventsCanBeDeferredToSceneHandle:]";
    __int16 v34 = 2114;
    unsigned int v35 = v24;
    BOOL v25 = "%s - Will not defer events to missing scene %{public}@";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v32, 0x16u);

    goto LABEL_19;
  }

  if (([v4 isValid] & 1) == 0)
  {
    id v26 = sub_100083C30();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v32 = 136315394;
    __int128 v33 = "-[PBSceneManager _eventsCanBeDeferredToSceneHandle:]";
    __int16 v34 = 2114;
    unsigned int v35 = v24;
    BOOL v25 = "%s - Will not defer events to invalid scene %{public}@";
    goto LABEL_18;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  unsigned __int8 v7 = [v6 isForeground];

  if ((v7 & 1) == 0)
  {
    id v27 = sub_100083C30();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v32 = 136315394;
    __int128 v33 = "-[PBSceneManager _eventsCanBeDeferredToSceneHandle:]";
    __int16 v34 = 2114;
    unsigned int v35 = v24;
    BOOL v25 = "%s - Will not defer events to background scene %{public}@";
    goto LABEL_18;
  }

  if ([v5 contentState] != (id)2)
  {
    id v28 = sub_100083C30();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v32 = 136315394;
    __int128 v33 = "-[PBSceneManager _eventsCanBeDeferredToSceneHandle:]";
    __int16 v34 = 2114;
    unsigned int v35 = v24;
    BOOL v25 = "%s - Will not defer events to non-ready scene %{public}@";
    goto LABEL_18;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 definition]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 specification]);
  uint64_t v11 = objc_opt_self(&OBJC_CLASS___UIApplicationSceneSpecification, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v12);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  unsigned __int8 v15 = [v14 isUISubclass];

  if ((v15 & 1) != 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
    unint64_t v17 = (unint64_t)[v16 deactivationReasons];

    if ((v17 & 0xFFFFFFFFFFFFFFDFLL) != 0)
    {
      id v18 = sub_100083C30();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        uint64_t v21 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents(v17);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        int v32 = 136315650;
        __int128 v33 = "-[PBSceneManager _eventsCanBeDeferredToSceneHandle:]";
        __int16 v34 = 2114;
        unsigned int v35 = v20;
        __int16 v36 = 2112;
        __int128 v37 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s - Will not defer events to UI scene %{public}@ due to deactivation reasons %@",  (uint8_t *)&v32,  0x20u);
      }

      goto LABEL_19;
    }

- (void)_notifyObserversDidUpdateOverlayInsets:(UIEdgeInsets)a3 forFocusedScene:(id)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v9 = a4;
  observers = self->_observers;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_1001EE0FC;
  v12[3] = &unk_1003DC640;
  CGFloat v14 = top;
  CGFloat v15 = left;
  CGFloat v16 = bottom;
  CGFloat v17 = right;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v12);
}

- (void)_notifyObserversDidUpdateFocusedFrame:(CGRect)a3 forFocusedScene:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  observers = self->_observers;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_1001EE1EC;
  v12[3] = &unk_1003DC640;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v12);
}

- (void)_didAddProcesses:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[PBSceneManager _didAddProcess:](self, "_didAddProcess:", *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_didAddProcess:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 workspace]);
  [v4 setDelegate:self];
}

- (void)_didRemoveProcess:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 workspace]);
  [v3 setDelegate:0];
}

- (void)_receivedRequestCompactSceneAction:(id)a3 fromScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "sceneManager/actions/requestCompact",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  observers = self->_observers;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001EE478;
  v11[3] = &unk_1003DC668;
  v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v11);

  os_activity_scope_leave(&state);
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  if (a4 == 2) {
    -[PBSceneManager _updateFocusDeferralsIfNeeded](self, "_updateFocusDeferralsIfNeeded", a3, v4, v5);
  }
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 process]);
  if ([v11 hasEntitlement:@"com.apple.springboard.requestScene-daemon"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001EE7A4;
    block[3] = &unk_1003DC690;
    v20 = v11;
    id v21 = v9;
    id v22 = v8;
    id v23 = self;
    id v24 = v10;
    dispatch_async(&_dispatch_main_q, block);

    id v12 = v20;
LABEL_13:

    goto LABEL_14;
  }

  if ([v11 isApplicationProcess])
  {
    unsigned int v13 = -[PBAuxiliarySceneManager createdSceneForProcess:withOptions:completion:]( self->_auxiliarySceneManager,  "createdSceneForProcess:withOptions:completion:",  v11,  v9,  v10);
    id v14 = sub_100083C30();
    CGFloat v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v12 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v28 = "-[PBSceneManager workspace:didReceiveSceneRequestWithOptions:completion:]";
        __int16 v29 = 2114;
        id v30 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s - process (%{public}@) requested auxiliary scene creation",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_100291B84();
    }

    goto LABEL_13;
  }

  id v16 = sub_100083C30();
  CGFloat v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100291BF4();
  }

  if (v10)
  {
    NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
    id v26 = @"Scene creation failed, daemon lacks entitlement";
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PineBoard.PBSceneManager",  1LL,  v12));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v18);

    goto LABEL_13;
  }

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcess]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  unsigned int v11 = [v10 isEqual:@"com.apple.siri"];

  if (v11) {
    [v8 setLevel:sub_100103824(11)];
  }
  -[PBSceneDeactivationManager amendSceneSettings:forScene:]( self->_sceneDeactivationManager,  "amendSceneSettings:forScene:",  v8,  v7);
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_100083C30();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v12 = 136315394;
    unsigned int v13 = "-[PBSceneManager sceneManager:didCreateScene:]";
    __int16 v14 = 2114;
    CGFloat v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, scene: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  if (-[PBSceneManager _shouldAutoHostScene:](self, "_shouldAutoHostScene:", v5))
  {
    if (sub_1001C9E00())
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainWorkspace]);
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scenePresentationBinder]);
      [v11 addScene:v5];
    }

    else
    {
      -[PBScenePresentationBinding addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v5);
    }
  }

  [v5 setDelegate:self];
  -[PBSceneDeactivationManager beginTrackingScene:](self->_sceneDeactivationManager, "beginTrackingScene:", v5);
  -[PBSceneRegistry registerScene:](self->_workspaceSceneRegistry, "registerScene:", v5);
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_100083C30();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v9 = 136315394;
    id v10 = "-[PBSceneManager sceneManager:willDestroyScene:]";
    __int16 v11 = 2114;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, scene: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[PBSceneDeactivationManager endTrackingScene:](self->_sceneDeactivationManager, "endTrackingScene:", v5);
  [v5 setDelegate:0];
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_100083C30();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v12 = 136315394;
    unsigned int v13 = "-[PBSceneManager sceneManager:didDestroyScene:]";
    __int16 v14 = 2114;
    CGFloat v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, scene: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[PBSceneManager _updateFocusDeferralsIfNeeded](self, "_updateFocusDeferralsIfNeeded");
  if (sub_1001C9E00())
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainWorkspace]);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scenePresentationBinder]);
    [v11 removeScene:v5];
  }

  else
  {
    -[PBScenePresentationBinding removeScene:](self->_rootWindowScenePresentationBinder, "removeScene:", v5);
  }

  -[PBSceneRegistry unregisterScene:](self->_workspaceSceneRegistry, "unregisterScene:", v5);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v5 = a3;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
    uint64_t v9 = *(void *)v71;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v71 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(v8[192]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
          id v14 = v11;
          CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue([v14 context]);
          id v16 = [v14 type];
          if (v16 == (id)2)
          {
            id v31 = sub_100083C30();
            int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
              *(_DWORD *)buf = 136315394;
              v75 = "-[PBSceneManager scene:didReceiveActions:]";
              __int16 v76 = 2114;
              v77 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s - received SnapshotRequestAction, type Invalidate, for scene of app %{public}@",  buf,  0x16u);
            }

            v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
            __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
            [v20 invalidateSnapshotsForBundleIdentifier:v34];

LABEL_25:
          }

          else
          {
            if (v16 == (id)1)
            {
              id v17 = sub_100083C30();
              id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
                *(_DWORD *)buf = 136315394;
                v75 = "-[PBSceneManager scene:didReceiveActions:]";
                __int16 v76 = 2114;
                v77 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s - received SnapshotRequestAction, type Perform, for scene of app %{public}@",  buf,  0x16u);
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
              v69[0] = _NSConcreteStackBlock;
              v69[1] = 3221225472LL;
              v69[2] = sub_1001EFA68;
              v69[3] = &unk_1003D4120;
              v69[4] = v14;
              [v20 saveSnapshotForScene:v5 context:v15 completion:v69];
              goto LABEL_25;
            }

            id v35 = sub_100083C30();
            __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v37 = (os_log_s *)[v14 type];
              __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
              *(_DWORD *)buf = 136315650;
              v75 = "-[PBSceneManager scene:didReceiveActions:]";
              __int16 v76 = 2048;
              v77 = v37;
              __int16 v78 = 2114;
              v79 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s - received SnapshotRequestAction, unknown type %ld, for scene of app %{public}@",  buf,  0x20u);
            }

            uint64_t v39 = FBSSceneSnapshotActionResponseForErrorCode(1LL);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            [v14 sendResponse:v40];
          }

          id v8 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
          continue;
        }

        if (![v11 UIActionType])
        {
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___PBSUIRequestCompactSceneAction);
          if ((objc_opt_isKindOfClass(v11, v30) & 1) != 0)
          {
            -[PBSceneManager _receivedRequestCompactSceneAction:fromScene:]( self,  "_receivedRequestCompactSceneAction:fromScene:",  v11,  v5);
            continue;
          }

          id v50 = sub_100083C30();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 identity]);
            *(_DWORD *)buf = 138543618;
            v75 = (const char *)v11;
            __int16 v76 = 2114;
            v77 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received unknown action %{public}@ for %{public}@",  buf,  0x16u);
          }

          goto LABEL_55;
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);

        id v23 = [v11 UIActionType];
        if (v23 == (id)44)
        {
          id v41 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
          NSErrorUserInfoKey v42 = (void *)objc_claimAutoreleasedReturnValue([v41 bundleIdentifier]);
          unsigned int v43 = [v42 isEqualToString:@"com.apple.purplebuddy"];

          if (v43)
          {
            id v44 = sub_100083C30();
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v75 = "-[PBSceneManager scene:didReceiveActions:]";
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s - Buddy sent DismissSceneAction, let's open the kiosk app",  buf,  0xCu);
            }

            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppDelegate sharedApplicationDelegate]( &OBJC_CLASS___PBAppDelegate,  "sharedApplicationDelegate"));
            [v29 launchPostSetupApp];
            goto LABEL_54;
          }

          v55 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 currentApplicationSceneHandle]);
          id v57 = (id)objc_claimAutoreleasedReturnValue([v56 scene]);

          id v58 = sub_100083C30();
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v58);
          BOOL v59 = os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT);
          if (v57 != v5)
          {
            if (v59)
            {
              int v60 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 bundleIdentifier]);
              *(_DWORD *)buf = 136315394;
              v75 = "-[PBSceneManager scene:didReceiveActions:]";
              __int16 v76 = 2114;
              v77 = v61;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "%s - ignored DismissSceneAction for scene of app %{public}@",  buf,  0x16u);
            }

            goto LABEL_54;
          }

          if (v59)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
            v66 = (os_log_s *)objc_claimAutoreleasedReturnValue([v65 bundleIdentifier]);
            *(_DWORD *)buf = 136315394;
            v75 = "-[PBSceneManager scene:didReceiveActions:]";
            __int16 v76 = 2114;
            v77 = v66;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "%s - received DismissSceneAction for scene of app %{public}@",  buf,  0x16u);
          }

          goto LABEL_53;
        }

        if (v23 == (id)12)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
          NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue([v24 kioskAppBundleIdentifier]);
          unsigned int v26 = -[os_log_s isEqual:](v22, "isEqual:", v25);

          if (v26)
          {
            id v27 = sub_100083C30();
            id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v75 = "-[PBSceneManager scene:didReceiveActions:]";
              __int16 v76 = 2114;
              v77 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s - Received UnhandledMenuButton from kiosk (%{public}@)",  buf,  0x16u);
            }

            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
            [v29 activateScreenSaverRequestedByClient:v22 completion:0];
          }

          else
          {
            id v52 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppDelegate sharedApplicationDelegate]( &OBJC_CLASS___PBAppDelegate,  "sharedApplicationDelegate"));
            unsigned int v53 = [v52 handleUnhandledMenuEvent];

            if (v53)
            {
              id v54 = sub_100083C30();
              __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v75 = "-[PBSceneManager scene:didReceiveActions:]";
                __int16 v76 = 2114;
                v77 = v22;
                objc_super v47 = (os_log_s *)v29;
                v48 = "%s - UnhandledMenuButton for %{public}@ was handled by PBAppDelegate";
                goto LABEL_47;
              }
            }

            else
            {
              id v62 = (id)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_focusedSceneHandle, "sceneIfExists"));

              id v63 = sub_100083C30();
              __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v63);
              BOOL v64 = os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT);
              if (v62 == v5)
              {
                if (v64)
                {
                  *(_DWORD *)buf = 136315394;
                  v75 = "-[PBSceneManager scene:didReceiveActions:]";
                  __int16 v76 = 2114;
                  v77 = v22;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "%s - UnhandledMenuButton causing deactivation of %{public}@",  buf,  0x16u);
                }

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 transitionContext]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
  else {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v12 = [v8 isForeground];
  }
  if ((v11 | v12) == 1)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 clientProcess]);
    [v10 level];
    double v15 = v14;
    if (![v13 isApplicationProcess]
      || [v13 isCurrentProcess] & 1 | (v15 != 1.0))
    {
      goto LABEL_32;
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001F0060;
    v47[3] = &unk_1003DC6B8;
    v47[4] = self;
    v40 = objc_retainBlock(v47);
    if (v11)
    {
      if ([v10 isUISubclass])
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        id v16 = sub_100083F78();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[PBSceneManager scene:didPrepareUpdateWithContext:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s - Cancelling snapshots if needed for %{public}@ because we're taking new snapshots",  buf,  0x16u);
        }

        ((void (*)(void *, void *))v40[2])(v40, v39);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v18 installedApplicationWithBundleIdentifier:v19]);

        else {
          uint64_t v20 = (uint64_t)[v37 supportedUserInterfaceStyle];
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
        id v52 = v23;
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));

        if (!v20)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
          id v25 = [v24 userInterfaceStyle];

          unsigned int v26 = &off_1003FE980;
          if (v25 == (id)1) {
            unsigned int v26 = &off_1003FE968;
          }
          __int128 v38 = v26;
        }

        id v27 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v38 count]);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_1001F01C8;
        v44[3] = &unk_1003DC6E0;
        id v45 = v10;
        __int16 v36 = v27;
        id v46 = v36;
        [v38 enumerateObjectsUsingBlock:v44];
        if (v7)
        {
          id v28 = self->_pendingSnapshots;
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          uint32_t v49 = sub_1001ED8A8;
          id v50 = sub_1001ED8B8;
          id v51 = 0LL;
          id v29 = objc_alloc(&OBJC_CLASS___FBSceneSnapshotAction);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_1001F024C;
          v41[3] = &unk_1003DC708;
          uint64_t v30 = v28;
          NSErrorUserInfoKey v42 = v30;
          unsigned int v43 = buf;
          id v31 = [v29 initWithScene:v6 requests:v36 expirationInterval:v41 responseHandler:5.0];
          int v32 = *(void **)(*(void *)&buf[8] + 40LL);
          *(void *)(*(void *)&buf[8] + 40LL) = v31;

          -[NSMutableSet addObject:](self->_pendingSnapshots, "addObject:", *(void *)(*(void *)&buf[8] + 40LL));
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v9 actions]);
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v33));

          [v34 addObject:*(void *)(*(void *)&buf[8] + 40)];
          [v9 setActions:v34];

          _Block_object_dispose(buf, 8);
        }

        else
        {
          id v35 = sub_100083C30();
          uint64_t v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
            sub_100291D60(v6, (os_log_s *)v30);
          }
        }

LABEL_30:
      }
    }

    else if (v12)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v21 = sub_100083F78();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[PBSceneManager scene:didPrepareUpdateWithContext:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s - Cancelling snapshots for %{public}@ because we're moving to the foreground",  buf,  0x16u);
      }

      ((void (*)(void *, void *))v40[2])(v40, v39);
      goto LABEL_30;
    }

LABEL_32:
  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = sub_100083C30();
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    *(_DWORD *)buf = 136315394;
    v99 = "-[PBSceneManager scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:]";
    __int16 v100 = 2114;
    v101 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s, scene: %{public}@", buf, 0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 settingsByApplyingToMutableCopyOfSettings:v11]);
  if ([v17 isUISubclass])
  {
    id v79 = v12;
    id v18 = v17;
    id v19 = v11;
    unsigned int v20 = [v18 idleTimerDisabled];
    if (v20 != [v19 idleTimerDisabled])
    {
      observers = self->_observers;
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_1001F0A7C;
      v96[3] = &unk_1003DC668;
      v96[4] = self;
      id v97 = v10;
      -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v96);
    }

    unsigned int v22 = [v18 idleModeVisualEffectsEnabled];
    if (v22 != [v19 idleModeVisualEffectsEnabled])
    {
      id v23 = self->_observers;
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472LL;
      v94[2] = sub_1001F0AC0;
      v94[3] = &unk_1003DC668;
      v94[4] = self;
      id v95 = v10;
      -[TVSObserverSet enumerateObserversUsingBlock:](v23, "enumerateObserversUsingBlock:", v94);
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneManager currentApplicationSceneHandle](self, "currentApplicationSceneHandle"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 clientProcess]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
    v81 = (void *)objc_claimAutoreleasedReturnValue([v24 installedApplicationWithBundleIdentifier:v26]);

    uint64_t v27 = objc_claimAutoreleasedReturnValue([v18 displayConfigurationRequest]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v19 displayConfigurationRequest]);
    id v29 = (void *)v28;
    v77 = (void *)v28;
    id v78 = v11;
    if (v27 && v28)
    {
      id v30 = [(id)v27 hdrMode];
      id v31 = [v29 hdrMode];
      [(id)v27 refreshRate];
      int v32 = PBSDisplayRefreshRateEqualToRefreshRate([v29 refreshRate]) ^ 1;
      if (v30 == v31) {
        BOOL v33 = v32;
      }
      else {
        BOOL v33 = 1;
      }
    }

    else
    {
      BOOL v33 = (v27 | v28) != 0;
    }

    unsigned int v34 = [v81 supportsHDR] & v33;
    id v35 = v80;
    id v36 = (id)objc_claimAutoreleasedReturnValue([v80 sceneIfExists]);

    if (v36 == v10)
    {
      unsigned int v76 = v34;
      id v37 = [v18 userInterfaceStyle];
      if (v37 != [v19 userInterfaceStyle])
      {
        id v38 = sub_100083C30();
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          *(_DWORD *)buf = 136315394;
          v99 = "-[PBSceneManager scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:]";
          __int16 v100 = 2114;
          v101 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%s - Changing the wallpaper for scene: %{public}@",  buf,  0x16u);
        }

        id v41 = (void *)objc_claimAutoreleasedReturnValue(+[PBWallpaperManager sharedInstance](&OBJC_CLASS___PBWallpaperManager, "sharedInstance"));
        [v41 updateWallpaperWithTransitionContext:v79];
      }
    }

    else
    {
      unsigned int v76 = v34 & [v81 hasModeSwitchEntitlement];
    }

    NSErrorUserInfoKey v42 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneManager focusedSceneHandle](self, "focusedSceneHandle"));
    id v43 = (id)objc_claimAutoreleasedReturnValue([v42 sceneIfExists]);

    if (v43 == v10)
    {
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v10 definition]);
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 specification]);
      uint64_t v47 = objc_opt_self(&OBJC_CLASS___UIApplicationSceneSpecification, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      char isKindOfClass = objc_opt_isKindOfClass(v45, v48);

      id v35 = v80;
      if ((isKindOfClass & 1) != 0)
      {
        [v18 primaryWindowOverlayInsets];
        -[PBSceneManager _notifyObserversDidUpdateOverlayInsets:forFocusedScene:]( self,  "_notifyObserversDidUpdateOverlayInsets:forFocusedScene:",  v10);
        [v19 screenFocusedFrame];
        CGFloat v51 = v50;
        CGFloat v53 = v52;
        CGFloat v55 = v54;
        CGFloat v57 = v56;
        [v18 screenFocusedFrame];
        v103.origin.CGFloat x = v58;
        v103.origin.CGFloat y = v59;
        v103.size.CGFloat width = v60;
        v103.size.CGFloat height = v61;
        v102.origin.CGFloat x = v51;
        v102.origin.CGFloat y = v53;
        v102.size.CGFloat width = v55;
        v102.size.CGFloat height = v57;
        if (!CGRectEqualToRect(v102, v103))
        {
          [v18 screenFocusedFrame];
          -[PBSceneManager _notifyObserversDidUpdateFocusedFrame:forFocusedScene:]( self,  "_notifyObserversDidUpdateFocusedFrame:forFocusedScene:",  v10);
        }

        id v62 = [v18 playbackControlsState];
        if (v62 != [v19 playbackControlsState])
        {
          id v63 = self->_observers;
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472LL;
          v91[2] = sub_1001F0B04;
          v91[3] = &unk_1003DC730;
          v91[4] = self;
          id v93 = v62;
          id v92 = v10;
          -[TVSObserverSet enumerateObserversUsingBlock:](v63, "enumerateObserversUsingBlock:", v91);
        }

        if (sub_1001C9E00())
        {
          BOOL v64 = (void *)objc_claimAutoreleasedReturnValue([v18 otherSettings]);
          v65 = (void *)objc_claimAutoreleasedReturnValue([v19 otherSettings]);
          uint64_t v66 = PBUIWantsFullDisplaySessionSettingKey;
          v75 = v64;
          id v67 = [v64 flagForSetting:PBUIWantsFullDisplaySessionSettingKey];
          if ([v65 flagForSetting:v66] != v67)
          {
            v68 = self->_observers;
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_1001F0B4C;
            v88[3] = &unk_1003DC730;
            v88[4] = self;
            id v90 = v67;
            id v89 = v10;
            -[TVSObserverSet enumerateObserversUsingBlock:](v68, "enumerateObserversUsingBlock:", v88);
          }

          uint64_t v69 = PBUIDisablingFullDisplaySessionsSettingKey;
          id v70 = [v75 flagForSetting:PBUIDisablingFullDisplaySessionsSettingKey];
          if ([v65 flagForSetting:v69] != v70)
          {
            __int128 v71 = self->_observers;
            v85[0] = _NSConcreteStackBlock;
            v85[1] = 3221225472LL;
            v85[2] = sub_1001F0B94;
            v85[3] = &unk_1003DC730;
            v85[4] = self;
            id v87 = v70;
            id v86 = v10;
            -[TVSObserverSet enumerateObserversUsingBlock:](v71, "enumerateObserversUsingBlock:", v85);
          }
        }
      }
    }

    unsigned int v72 = [v18 systemInputActive];
    if (v72 != [v19 systemInputActive])
    {
      __int128 v73 = self->_observers;
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_1001F0BDC;
      v82[3] = &unk_1003DC758;
      v82[4] = self;
      char v84 = v72;
      id v83 = v10;
      -[TVSObserverSet enumerateObserversUsingBlock:](v73, "enumerateObserversUsingBlock:", v82);
    }

    id v11 = v78;
    if (v76)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
      [v74 performModeSwitchForDisplayConfigurationRequest:v27];
    }

    id v12 = v79;
  }
}

- (void)sceneLayoutViewController:(id)a3 didChangeOldFocusedSceneHandle:(id)a4 toSceneHandle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  observers = self->_observers;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_1001F0CCC;
  v12[3] = &unk_1003DC618;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v12);
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 =  [v3 appendArray:self->_deferralTargetAssertions withKey:@"deferralTargetAssertions" skipIfEmpty:0 objectTransformer:&stru_1003DC798];
  return v3;
}

- (PBSceneHandle)focusedSceneHandle
{
  return self->_focusedSceneHandle;
}

- (PBScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (PBSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

- (PBAuxiliarySceneManager)auxiliarySceneManager
{
  return self->_auxiliarySceneManager;
}

- (PBSceneShroudController)shroudController
{
  return self->_shroudController;
}

- (PBSetTopBoxIntentDispatcher)setTopBoxIntentDispatcher
{
  return self->_setTopBoxIntentDispatcher;
}

- (FBSceneManager)fbSceneManager
{
  return self->_fbSceneManager;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (NSMutableSet)pendingSnapshots
{
  return self->_pendingSnapshots;
}

- (PBSceneRegistry)workspaceSceneRegistry
{
  return self->_workspaceSceneRegistry;
}

- (PBScenePresentationBinding)rootWindowScenePresentationBinder
{
  return self->_rootWindowScenePresentationBinder;
}

- (TVSConcurrentTransactionManager)updateSceneTransactionManager
{
  return self->_updateSceneTransactionManager;
}

- (NSMutableArray)deferralTargetAssertions
{
  return self->_deferralTargetAssertions;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (BKSMutableHIDEventDeferringTarget)lastDeferringTarget
{
  return self->_lastDeferringTarget;
}

- (BSInvalidatable)focusDeferral
{
  return self->_focusDeferral;
}

- (void).cxx_destruct
{
}

  ;
}

@end