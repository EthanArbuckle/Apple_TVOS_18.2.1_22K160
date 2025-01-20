@interface PBOpenAppTransition
+ (id)_sharedAppInfoController;
- (BOOL)_canBeInterrupted;
- (BOOL)_canPerformAppLaunch:(id *)a3;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)isAnimating;
- (BOOL)isColdLaunch;
- (BOOL)isResigning;
- (BOOL)isTransitionStarted;
- (BOOL)shouldDelaySceneActivation;
- (BOOL)shouldRunLayoutTransaction;
- (BSProcessDeathWatcher)processDeathWatcher;
- (FBApplicationProcess)launchProcess;
- (FBApplicationUpdateScenesTransaction)updateSceneTransaction;
- (NSHashTable)openAppObservers;
- (NSString)debugDescription;
- (NSString)description;
- (PBOpenAppTransition)initWithRequest:(id)a3 completion:(id)a4;
- (PBOpenApplicationRequest)interruptingOpenAppRequest;
- (PBOpenApplicationRequest)openRequest;
- (UIApplicationSceneDeactivationAssertion)transitionSceneDeactivationAssertion;
- (_PBSceneLayoutManagementTransaction)sceneLayoutManagementTransaction;
- (id)completion;
- (int64_t)transitionType;
- (unint64_t)coordinatedTransitionChildSchedulingPolicy;
- (unint64_t)deactivationReasonsUpdate;
- (void)_begin;
- (void)_beginSceneTransitionInTransaction:(id)a3;
- (void)_beginSceneUpdateTransactionInTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4 completion:(id)a5;
- (void)_callFrontBoardCompletionIfNeededWithError:(id)a3;
- (void)_callFrontBoardCompletionIfNeededWithError:(id)a3 process:(id)a4;
- (void)_didComplete;
- (void)_relinquishSystemAnimationDeactivationAssertion;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setInterruptingOpenAppRequest:(id)a3;
- (void)transaction:(id)a3 didLaunchProcess:(id)a4;
- (void)transaction:(id)a3 willLaunchProcess:(id)a4;
- (void)transferSceneDeactivationAssertionFromInterruptedTransition:(id)a3;
@end

@implementation PBOpenAppTransition

+ (id)_sharedAppInfoController
{
  if (qword_100471478 != -1) {
    dispatch_once(&qword_100471478, &stru_1003DC890);
  }
  return (id)qword_100471470;
}

- (PBOpenAppTransition)initWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
  v9 = -[PBOpenAppTransition init](&v72, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v9->_openRequest, a3);
  id v11 = objc_retainBlock(v8);
  id completion = v10->_completion;
  v10->_id completion = v11;

  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  openAppObservers = v10->_openAppObservers;
  v10->_openAppObservers = (NSHashTable *)v13;

  id v15 = v7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
  p_info = (__objc2_class_ro **)(&OBJC_CLASS___PBControlCenterRemoteViewController + 32);
  id v69 = v8;
  if (([v16 isActive] & 1) == 0)
  {

    goto LABEL_6;
  }

  unsigned int v18 = [v15 relaunchingForUserProfileSwitch];

  if (v18)
  {
LABEL_6:
    id v68 = v7;
    id v20 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activePictureInPictureApplicationBundleIDs]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 toAppInfo]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
    unsigned __int8 v25 = [v22 containsObject:v24];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v20 fromAppInfo]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
    unsigned int v30 = [v27 isEqual:v29];

    if (v30 && (v25 & 1) != 0)
    {
      uint64_t v19 = 5LL;
LABEL_9:
      id v7 = v68;
LABEL_18:
      p_info = &OBJC_CLASS___PBControlCenterRemoteViewController.info;
      goto LABEL_19;
    }

    id v31 = v20;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 fromSceneIdentity]);
    unsigned int v33 = objc_msgSend(v32, "pb_isDefaultKioskAppSceneIdentity");

    v34 = (void *)objc_claimAutoreleasedReturnValue([v31 fromAppInfo]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 bundleIdentifier]);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleIdentifier]);
    unsigned int v38 = [v35 isEqual:v37];

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 focusedSceneHandle]);
    unsigned __int8 v41 = [v40 isDefaultKioskAppScene];

    if ((v33 | v38) == 1 && (v41 & 1) != 0)
    {
      unsigned int v42 = [v31 isLaunchedByDeactivation];

      if (!v42)
      {
        uint64_t v19 = 2LL;
        goto LABEL_9;
      }
    }

    else
    {
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue([v31 toSceneIdentity]);
    unsigned __int8 v44 = objc_msgSend(v43, "pb_isDefaultKioskAppSceneIdentity");

    id v7 = v68;
    if ((v44 & 1) != 0) {
      uint64_t v19 = 3LL;
    }
    else {
      uint64_t v19 = [v31 isLaunchedByDeactivation];
    }
    goto LABEL_18;
  }

  uint64_t v19 = 4LL;
LABEL_19:
  v10->_transitionType = v19;
  v45 = (void *)objc_claimAutoreleasedReturnValue([p_info + 76 sharedInstance]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 currentApplicationSceneHandle]);

  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 sceneIdentifier]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v15 toSceneIdentity]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
  unsigned int v50 = [v47 isEqual:v49];

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    BOOL v52 = [v51 activeLayoutLevel] != (id)1;
  }

  else
  {
    BOOL v52 = 1;
  }

  v10->_BOOL shouldRunLayoutTransaction = [v15 isForeground] & v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue([v15 toAppInfo]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v53 applicationInfo]);
  v55 = (void *)objc_claimAutoreleasedReturnValue([v54 processIdentity]);

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 processForIdentity:v55]);
  v10->_coldLaunch = [v57 isRunning] ^ 1;

  BOOL shouldRunLayoutTransaction = v10->_shouldRunLayoutTransaction;
  if (shouldRunLayoutTransaction) {
    BOOL shouldRunLayoutTransaction = !v10->_coldLaunch && v10->_transitionType == 2;
  }
  v10->_shouldDelaySceneActivation = shouldRunLayoutTransaction;
  v59 = (void *)objc_claimAutoreleasedReturnValue([v15 toAppInfo]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 bundleIdentifier]);
  unsigned int v61 = [v60 isEqual:@"com.apple.facetime"];

  if (v61) {
    v10->_shouldDelaySceneActivation = 0;
  }
  v62 = objc_alloc(&OBJC_CLASS___FBApplicationUpdateScenesTransaction);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_1001F3478;
  v70[3] = &unk_1003DC8D8;
  id v71 = v15;
  v63 = -[FBApplicationUpdateScenesTransaction initWithProcessIdentity:executionContextProvider:]( v62,  "initWithProcessIdentity:executionContextProvider:",  v55,  v70);
  updateSceneTransaction = v10->_updateSceneTransaction;
  v10->_updateSceneTransaction = v63;

  -[FBApplicationUpdateScenesTransaction addObserver:](v10->_updateSceneTransaction, "addObserver:", v10);
  id v65 = sub_100083CA8();
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  -[PBOpenAppTransition _addDebugLogCategory:](v10, "_addDebugLogCategory:", v66);

  -[PBOpenAppTransition setAuditHistoryEnabled:](v10, "setAuditHistoryEnabled:", 1LL);
  id v8 = v69;
LABEL_29:

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
  -[PBOpenAppTransition dealloc](&v3, "dealloc");
}

- (FBApplicationProcess)launchProcess
{
  return (FBApplicationProcess *)(id)objc_claimAutoreleasedReturnValue( -[FBApplicationUpdateScenesTransaction process]( self->_updateSceneTransaction,  "process"));
}

- (BOOL)isAnimating
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[_PBSceneLayoutManagementTransaction animationTransaction]( self->_sceneLayoutManagementTransaction,  "animationTransaction"));
  unsigned __int8 v3 = [v2 isRunning];

  return v3;
}

- (BOOL)isResigning
{
  return -[_PBSceneLayoutManagementTransaction isResigning](self->_sceneLayoutManagementTransaction, "isResigning");
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
    id v4 = a3;
    -[PBOpenAppTransition addObserver:](&v5, "addObserver:", v4);
    -[NSHashTable addObject:](self->_openAppObservers, "addObject:", v4, v5.receiver, v5.super_class);
  }

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
    id v4 = a3;
    -[PBOpenAppTransition removeObserver:](&v5, "removeObserver:", v4);
    -[NSHashTable removeObject:](self->_openAppObservers, "removeObject:", v4, v5.receiver, v5.super_class);
  }

- (void)transferSceneDeactivationAssertionFromInterruptedTransition:(id)a3
{
  id v4 = (id *)a3;
  id v5 = sub_100083C30();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = UIApplicationSceneDeactivationReasonDescription([v4[13] reason]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Transfering scene assertion %{public}@ from interrupted transition",  (uint8_t *)&v10,  0xCu);
  }

  objc_storeStrong((id *)&self->_transitionSceneDeactivationAssertion, v4[13]);
  id v9 = v4[13];
  v4[13] = 0LL;
}

- (NSString)description
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toSceneIdentity](self->_openRequest, "toSceneIdentity"));
  id v5 = [v3 appendObject:v4 withName:@"toSceneIdentity"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest fromSceneIdentity](self->_openRequest, "fromSceneIdentity"));
  id v7 = [v3 appendObject:v6 withName:@"fromSceneIdentity"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v8;
}

- (NSString)debugDescription
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_1001F38B4;
  id v9 = &unk_1003CFEB8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  id v11 = self;
  id v3 = v10;
  [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build", v6, v7, v8, v9));

  return (NSString *)v4;
}

- (unint64_t)coordinatedTransitionChildSchedulingPolicy
{
  return 1LL;
}

- (BOOL)_canBeInterrupted
{
  BOOL v3 = -[PBOpenApplicationRequest isForeground](self->_openRequest, "isForeground");
  if (v3) {
    LOBYTE(v3) = !-[PBOpenApplicationRequest isDebugging](self->_openRequest, "isDebugging");
  }
  return v3;
}

- (void)_begin
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
  -[PBOpenAppTransition _begin](&v22, "_begin");
  id v3 = sub_100083CA8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppTransition openRequest](self, "openRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 toSceneIdentity]);
    BOOL coldLaunch = self->_coldLaunch;
    *(_DWORD *)buf = 134218498;
    v24 = self;
    __int16 v25 = 2114;
    v26 = v6;
    __int16 v27 = 1024;
    BOOL v28 = coldLaunch;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%p] Begin open app transition for %{public}@ (isColdLaunch: %d)",  buf,  0x1Cu);
  }

  id v21 = 0LL;
  unsigned __int8 v8 = -[PBOpenAppTransition _canPerformAppLaunch:](self, "_canPerformAppLaunch:", &v21);
  id v9 = v21;
  if ((v8 & 1) != 0)
  {
    if (-[PBOpenApplicationRequest isForeground](self->_openRequest, "isForeground"))
    {
      id v10 = -[PBOpenAppDialogsTransaction initWithRequest:]( objc_alloc(&OBJC_CLASS___PBOpenAppDialogsTransaction),  "initWithRequest:",  self->_openRequest);
      -[PBOpenAppTransition addChildTransaction:](self, "addChildTransaction:", v10);
      objc_initWeak((id *)buf, self);
      id v11 = objc_alloc(&OBJC_CLASS___TVSBlockTransaction);
      v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472LL;
      v16 = sub_1001F3C04;
      v17 = &unk_1003DC900;
      objc_copyWeak(&v20, (id *)buf);
      v12 = v10;
      unsigned int v18 = v12;
      uint64_t v19 = self;
      id v13 = [v11 initWithBlock:&v14 failsForChildTransaction:&stru_1003DC920];
      -[PBOpenAppTransition addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v13,  1LL,  v14,  v15,  v16,  v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      -[PBOpenAppTransition _beginSceneTransitionInTransaction:](self, "_beginSceneTransitionInTransaction:", self);
    }
  }

  else
  {
    -[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:]( self,  "_callFrontBoardCompletionIfNeededWithError:",  v9);
  }
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return 1;
}

- (void)_didComplete
{
  id v3 = sub_100083CA8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = self;
    __int16 v17 = 2114;
    unsigned int v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%p] Did complete open app transition %{public}@",  buf,  0x16u);
  }

  -[BSProcessDeathWatcher invalidate](self->_processDeathWatcher, "invalidate");
  processDeathWatcher = self->_processDeathWatcher;
  self->_processDeathWatcher = 0LL;

  if ((-[PBOpenAppTransition isFailed](self, "isFailed") & 1) != 0
    || -[PBOpenAppTransition isInterrupted](self, "isInterrupted"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    else {
      unsigned __int8 v8 = @"failed";
    }
    v12 = v8;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppTransition error](self, "error"));
    id v11 = v7;
    uint64_t v9 = FBSOpenApplicationErrorCreate(1LL, @"The app launch for %@ %@: %@");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    id v10 = 0LL;
  }

  -[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:]( self,  "_callFrontBoardCompletionIfNeededWithError:",  v10,  v11,  v12,  v13);
  -[PBOpenAppTransition _relinquishSystemAnimationDeactivationAssertion]( self,  "_relinquishSystemAnimationDeactivationAssertion");
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBOpenAppTransition;
  -[PBOpenAppTransition _didComplete](&v14, "_didComplete");
}

- (void)_callFrontBoardCompletionIfNeededWithError:(id)a3
{
  updateSceneTransaction = self->_updateSceneTransaction;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBApplicationUpdateScenesTransaction process](updateSceneTransaction, "process"));
  -[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:process:]( self,  "_callFrontBoardCompletionIfNeededWithError:process:",  v5,  v6);
}

- (void)_callFrontBoardCompletionIfNeededWithError:(id)a3 process:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pbs_xpcSafeDeepCopy"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 processesForBundleIdentifier:v11]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  if (v7 && !v13)
  {
    id v13 = v7;
    id v14 = sub_100083CA8();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100291EA4((uint64_t)v13, v15);
    }
  }

  unsigned int v33 = v13;
  if (![v13 pid] && !objc_msgSend(v6, "code"))
  {
    uint64_t v16 = FBSOpenApplicationErrorCreate( 1LL,  @"Attempted to call the open app system completion block with a pid of 0 for %@");
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

    unsigned __int8 v8 = (void *)v17;
  }

  unsigned int v18 = (void (**)(id, void *))objc_retainBlock(self->_completion);
  id completion = self->_completion;
  self->_id completion = 0LL;

  if (v18)
  {
    id v20 = [v8 code];
    id v21 = sub_100083CA8();
    objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    id v32 = v6;
    if (v20)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:process:]";
        __int16 v41 = 2114;
        unsigned int v42 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s - error: %{public}@", buf, 0x16u);
      }
    }

    else if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
      *(_DWORD *)buf = 136315394;
      v40 = "-[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:process:]";
      __int16 v41 = 2114;
      unsigned int v42 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s - successfully calling system completion block for %{public}@",  buf,  0x16u);
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v26 = self->_openAppObservers;
    id v27 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v31, "openAppTransition:willReportSystemCompletionWithError:") & 1) != 0) {
            [v31 openAppTransition:self willReportSystemCompletionWithError:v8];
          }
        }

        id v28 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
      }

      while (v28);
    }

    v18[2](v18, v8);
    id v6 = v32;
  }
}

- (void)_beginSceneUpdateTransactionInTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v59 = a5;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toSceneIdentity](self->_openRequest, "toSceneIdentity"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sceneWithIdentifier:v10]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 parameters]);
    id v60 = [v12 mutableCopy];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 settings]);
    id v14 = [v13 mutableCopy];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 clientSettings]);
    id v16 = [v15 mutableCopy];
  }

  else
  {
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___UIApplicationSceneSpecification);
    id v60 = (id)objc_claimAutoreleasedReturnValue( +[FBSMutableSceneParameters parametersForSpecification:]( &OBJC_CLASS___FBSMutableSceneParameters,  "parametersForSpecification:",  v17));

    id v14 = objc_alloc_init(&OBJC_CLASS___UIMutableApplicationSceneSettings);
    id v16 = objc_alloc_init(&OBJC_CLASS___UIMutableApplicationSceneClientSettings);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 mainWorkspace]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 geometry]);

  [v20 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 settings]);
  BOOL v30 = ([v29 isForeground] & 1) != 0
     || -[PBOpenApplicationRequest isForeground](self->_openRequest, "isForeground");
  v58 = v7;

  [v14 setForeground:v30];
  v56 = v20;
  if (!sub_1001C9E00())
  {
    unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));

    [v14 setDisplayConfiguration:v44];
    double v32 = v22;
LABEL_12:
    double v34 = v24;
    double v36 = v26;
    double v38 = v28;
    goto LABEL_13;
  }

  [v20 fullDisplayBounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBFullDisplaySceneManager sharedInstance](&OBJC_CLASS___PBFullDisplaySceneManager, "sharedInstance"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 bundleIdentifier]);
  unsigned int v42 = [v39 bundleIdWantsFullDisplay:v41];

  if (!v42)
  {
    v65.origin.x = v32;
    v65.origin.y = v34;
    v65.size.width = v36;
    v65.size.height = v38;
    double Width = CGRectGetWidth(v65);
    v66.origin.x = v22;
    v66.origin.y = v24;
    v66.size.width = v26;
    v66.size.height = v28;
    double v32 = (Width - CGRectGetWidth(v66)) * 0.5;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[FBDisplayManager pb_transformToAppJailConfigurationIfNeeded:]( &OBJC_CLASS___FBDisplayManager,  "pb_transformToAppJailConfigurationIfNeeded:",  v46));

    [v14 setDisplayConfiguration:v47];
    objc_msgSend(v14, "setPb_isAppJailed:", 1);

    goto LABEL_12;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));
  [v14 setDisplayConfiguration:v43];

  objc_msgSend(v14, "setPb_isAppJailed:", 0);
LABEL_13:
  objc_msgSend(v14, "setFrame:", v32, v34, v36, v38);
  [v14 setLevel:1.0];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppearanceManager sharedInstance](&OBJC_CLASS___PBSystemAppearanceManager, "sharedInstance"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
  unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue([v49 bundleIdentifier]);
  objc_msgSend(v14, "setUserInterfaceStyle:", objc_msgSend(v48, "effectiveUserInterfaceStyleForBundleIdentifier:", v50));

  [v14 setInterfaceOrientation:1];
  objc_msgSend( v14,  "setDeactivationReasons:",  self->_deactivationReasonsUpdate | (unint64_t)objc_msgSend(v14, "deactivationReasons"));
  [v60 setSettings:v14];
  [v60 setClientSettings:v16];
  updateSceneTransaction = self->_updateSceneTransaction;
  BOOL v52 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toSceneIdentity](self->_openRequest, "toSceneIdentity"));
  v53 = (void *)objc_claimAutoreleasedReturnValue( -[PBOpenApplicationRequest makeSceneTransitionContext]( self->_openRequest,  "makeSceneTransitionContext"));
  -[FBApplicationUpdateScenesTransaction updateSceneWithIdentity:parameters:transitionContext:]( updateSceneTransaction,  "updateSceneWithIdentity:parameters:transitionContext:",  v52,  v60,  v53);

  objc_initWeak(location, self);
  v54 = self->_updateSceneTransaction;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1001F48C4;
  v61[3] = &unk_1003DC970;
  objc_copyWeak(&v63, location);
  id v55 = v59;
  id v62 = v55;
  -[FBApplicationUpdateScenesTransaction registerBlockObserver:](v54, "registerBlockObserver:", v61);
  [v58 addChildTransaction:self->_updateSceneTransaction withSchedulingPolicy:a4];

  objc_destroyWeak(&v63);
  objc_destroyWeak(location);
}

- (void)_beginSceneTransitionInTransaction:(id)a3
{
  id v4 = a3;
  self->_transitionStarted = 1;
  if (self->_shouldRunLayoutTransaction)
  {
    objc_initWeak(&location, self);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v5 = self->_openAppObservers;
    id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v45,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v39 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v9, "openAppTransitionWillStartAnimation:") & 1) != 0) {
            [v9 openAppTransitionWillStartAnimation:self];
          }
        }

        id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v45,  16LL);
      }

      while (v6);
    }

    id v10 = -[_PBSceneLayoutManagementTransaction initWithRequest:transitionType:]( objc_alloc(&OBJC_CLASS____PBSceneLayoutManagementTransaction),  "initWithRequest:transitionType:",  self->_openRequest,  self->_transitionType);
    sceneLayoutManagementTransaction = self->_sceneLayoutManagementTransaction;
    self->_sceneLayoutManagementTransaction = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue( -[_PBSceneLayoutManagementTransaction fromViewController]( self->_sceneLayoutManagementTransaction,  "fromViewController"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sceneHandle]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[_PBSceneLayoutManagementTransaction toViewController]( self->_sceneLayoutManagementTransaction,  "toViewController"));
    double v33 = (void *)objc_claimAutoreleasedReturnValue([v14 sceneHandle]);

    if (v13
      && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 sceneIdentity]),
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v33 sceneIdentity]),
          unsigned __int8 v17 = [v15 isEqual:v16],
          v16,
          v15,
          (v17 & 1) == 0))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v19 startPIPTransactionForSceneHandleEnteringBackground:v13]);

      if (v18) {
        -[PBOpenAppTransition addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v18,  1LL);
      }
    }

    else
    {
      unsigned int v18 = 0LL;
    }

    if (-[_PBSceneLayoutManagementTransaction isAnimated](self->_sceneLayoutManagementTransaction, "isAnimated")
      && !self->_transitionSceneDeactivationAssertion)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sceneDeactivationManager]);
      CGFloat v22 = (UIApplicationSceneDeactivationAssertion *)[v21 newAssertionWithReason:5];
      transitionSceneDeactivationAssertion = self->_transitionSceneDeactivationAssertion;
      self->_transitionSceneDeactivationAssertion = v22;

      -[UIApplicationSceneDeactivationAssertion acquire](self->_transitionSceneDeactivationAssertion, "acquire");
      id v24 = sub_100083C30();
      double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = UIApplicationSceneDeactivationReasonDescription(-[UIApplicationSceneDeactivationAssertion reason](self->_transitionSceneDeactivationAssertion, "reason"));
        double v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v44 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Acquired scene assertion for reason: %{public}@",  buf,  0xCu);
      }
    }

    if (-[_PBSceneLayoutManagementTransaction isAnimated](self->_sceneLayoutManagementTransaction, "isAnimated")
      && !self->_shouldDelaySceneActivation)
    {
      self->_deactivationReasonsUpdate |= 0x20uLL;
    }

    CGFloat v28 = self->_sceneLayoutManagementTransaction;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001F4EF8;
    v36[3] = &unk_1003D0A28;
    objc_copyWeak(&v37, &location);
    -[_PBSceneLayoutManagementTransaction registerBlockObserver:](v28, "registerBlockObserver:", v36);
    if (self->_shouldDelaySceneActivation)
    {
      -[PBOpenAppTransition addMilestone:](self, "addMilestone:", @"PBOpenAppDelayActivationMilestone");
    }

    else
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sceneDeactivationManager]);
      id v31 = [v30 newAssertionWithReason:5];

      if (-[_PBSceneLayoutManagementTransaction isAnimated](self->_sceneLayoutManagementTransaction, "isAnimated")) {
        [v31 acquire];
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1001F5298;
      v34[3] = &unk_1003DB0C8;
      id v32 = v31;
      id v35 = v32;
      -[PBOpenAppTransition _beginSceneUpdateTransactionInTransaction:withSchedulingPolicy:completion:]( self,  "_beginSceneUpdateTransactionInTransaction:withSchedulingPolicy:completion:",  v4,  0LL,  v34);
    }

    [v4 addChildTransaction:self->_sceneLayoutManagementTransaction];
    objc_destroyWeak(&v37);

    objc_destroyWeak(&location);
  }

  else
  {
    -[PBOpenAppTransition _beginSceneUpdateTransactionInTransaction:withSchedulingPolicy:completion:]( self,  "_beginSceneUpdateTransactionInTransaction:withSchedulingPolicy:completion:",  v4,  0LL,  0LL);
  }
}

- (void)_relinquishSystemAnimationDeactivationAssertion
{
  if (-[UIApplicationSceneDeactivationAssertion isAcquired]( self->_transitionSceneDeactivationAssertion,  "isAcquired"))
  {
    -[UIApplicationSceneDeactivationAssertion relinquish](self->_transitionSceneDeactivationAssertion, "relinquish");
    id v3 = sub_100083C30();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = UIApplicationSceneDeactivationReasonDescription(-[UIApplicationSceneDeactivationAssertion reason](self->_transitionSceneDeactivationAssertion, "reason"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Relinquished scene assertion for reason: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    transitionSceneDeactivationAssertion = self->_transitionSceneDeactivationAssertion;
    self->_transitionSceneDeactivationAssertion = 0LL;
  }

- (BOOL)_canPerformAppLaunch:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  id v7 = [(id)objc_opt_class(self) _sharedAppInfoController];
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appInfos]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationInfo]);
  if (v11)
  {
    if (v6 && [v10 isAnyTerminationAssertionInEffect])
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App '%@' looks busy",  v6));
      uint64_t v13 = 6LL;
      if (!a3) {
        goto LABEL_35;
      }
      goto LABEL_30;
    }

    if ([v11 signatureState] == (id)4)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
      unsigned __int8 v15 = [v14 isEnabled];

      if ((v15 & 1) != 0)
      {
        unsigned int v16 = [v6 isEqual:@"com.apple.purplebuddy"];
        unsigned int v17 = -[PBOpenApplicationRequest isForeground](self->_openRequest, "isForeground");
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationInfo]);
        else {
          int v21 = 0;
        }
        int v27 = v17 ^ 1;

        if ((v16 & 1) != 0) {
          int v28 = 1;
        }
        else {
          int v28 = v27 | v21;
        }
        id v29 = sub_100083CA8();
        BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          __int128 v41 = "-[PBOpenAppTransition _canPerformAppLaunch:]";
          __int16 v42 = 2114;
          v43 = v6;
          __int16 v44 = 1024;
          unsigned int v45 = v16;
          __int16 v46 = 1024;
          int v47 = v27;
          __int16 v48 = 1024;
          int v49 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s - Buddy needs to run and we are not factory activated. bundleIdentifier=%{public}@, isBuddy=%{BOOL}d, isB ackgroundRequest=%{BOOL}d, shouldAllowApplicationLaunch=%{BOOL}d",  buf,  0x28u);
        }

        if ((v28 & 1) != 0) {
          goto LABEL_27;
        }
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot launch app '%@' while Setup Assistant is running",  v6));
      }

      else
      {
        CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
        if ([v22 disabledReasons] == (id)64)
        {
          unsigned __int8 v23 = -[PBOpenApplicationRequest isForeground](self->_openRequest, "isForeground");

          if ((v23 & 1) == 0)
          {
LABEL_27:
            v12 = 0LL;
            LOBYTE(a3) = 1;
            goto LABEL_35;
          }
        }

        else
        {
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_openRequest, "toAppInfo"));
        uint64_t v25 = PBSAppInfoDisabledReasonsValueDescription([v24 disabledReasons]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App '%@' is not enabled (%@)",  v6,  v26));
      }

      uint64_t v13 = 5LL;
      if (!a3) {
        goto LABEL_35;
      }
      goto LABEL_30;
    }

    v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"App '%@' is not trusted (signature state: %ld)",  v6,  [v11 signatureState]));
    objc_msgSend(v11, "pb_reportUntrustedLaunchAttempt");
    uint64_t v13 = 3LL;
    if (!a3) {
      goto LABEL_35;
    }
  }

  else
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Tried to launch app with bundle identifier %@, but no such app is installed",  v6));
    uint64_t v13 = 4LL;
    if (!a3) {
      goto LABEL_35;
    }
  }

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
  unsigned int v9 = [v8 isRunning];

  int v21 = v6;
  if (v9)
  {
    id v10 = sub_100083CA8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v28 = "-[PBOpenAppTransition transaction:willLaunchProcess:]";
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", buf, 0x16u);
    }

    v12 = 0LL;
  }

  else
  {
    uint64_t v13 = FBSOpenApplicationErrorCreate(8LL, @"Transaction's process %@ is not running: %@");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = sub_100083CA8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v28 = "-[PBOpenAppTransition transaction:willLaunchProcess:]";
      __int16 v29 = 2114;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - error: %{public}@", buf, 0x16u);
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  unsigned __int8 v15 = self->_openAppObservers;
  id v16 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v20, "openAppTransition:willLaunchProcess:") & 1) != 0) {
          [v20 openAppTransition:self willLaunchProcess:v7];
        }
      }

      id v17 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v17);
  }

  -[PBOpenAppTransition _callFrontBoardCompletionIfNeededWithError:process:]( self,  "_callFrontBoardCompletionIfNeededWithError:process:",  v12,  v7);
}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = objc_alloc(&OBJC_CLASS___BSProcessDeathWatcher);
  id v9 = [v7 pid];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppTransition queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001F5B9C;
  v13[3] = &unk_1003D0890;
  objc_copyWeak(&v14, &location);
  id v11 = -[BSProcessDeathWatcher initWithPID:queue:deathHandler:](v8, "initWithPID:queue:deathHandler:", v9, v10, v13);
  processDeathWatcher = self->_processDeathWatcher;
  self->_processDeathWatcher = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (PBOpenApplicationRequest)openRequest
{
  return self->_openRequest;
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (BOOL)isColdLaunch
{
  return self->_coldLaunch;
}

- (BOOL)isTransitionStarted
{
  return self->_transitionStarted;
}

- (PBOpenApplicationRequest)interruptingOpenAppRequest
{
  return self->_interruptingOpenAppRequest;
}

- (void)setInterruptingOpenAppRequest:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)updateSceneTransaction
{
  return self->_updateSceneTransaction;
}

- (unint64_t)deactivationReasonsUpdate
{
  return self->_deactivationReasonsUpdate;
}

- (BSProcessDeathWatcher)processDeathWatcher
{
  return self->_processDeathWatcher;
}

- (_PBSceneLayoutManagementTransaction)sceneLayoutManagementTransaction
{
  return self->_sceneLayoutManagementTransaction;
}

- (NSHashTable)openAppObservers
{
  return self->_openAppObservers;
}

- (id)completion
{
  return self->_completion;
}

- (UIApplicationSceneDeactivationAssertion)transitionSceneDeactivationAssertion
{
  return self->_transitionSceneDeactivationAssertion;
}

- (BOOL)shouldRunLayoutTransaction
{
  return self->_shouldRunLayoutTransaction;
}

- (BOOL)shouldDelaySceneActivation
{
  return self->_shouldDelaySceneActivation;
}

- (void).cxx_destruct
{
}

@end