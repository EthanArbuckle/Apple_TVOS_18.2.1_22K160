@interface PBPictureInPictureManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_acceptsEventFocus;
- (BOOL)_shouldAdjustInsetsForLayoutLevel:(int64_t)a3;
- (BOOL)_shouldAvoidFocusForLayoutLevel:(int64_t)a3;
- (BOOL)_shouldInterruptForLayoutLevel:(int64_t)a3;
- (BOOL)isEditing;
- (BOOL)isHidden;
- (BOOL)isPresenting;
- (BOOL)isStashed;
- (BOOL)isStashingEnabled;
- (BOOL)isStoppingFromSystemShell;
- (BOOL)isSwapping;
- (BOOL)pictureInPictureController:(id)a3 shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:(id)a4;
- (BOOL)pictureInPictureController:(id)a3 shouldCancelPictureInPictureForApplication:(id)a4 whenStartingPictureInPictureForApplication:(id)a5;
- (BOOL)pictureInPictureController:(id)a3 shouldDenyNewConnection:(id)a4;
- (BOOL)pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:(id)a3;
- (BOOL)shouldAvoidFocusOnNextUpdate;
- (BOOL)shouldAvoidNestingPiPOnNextSplitViewPresentation;
- (BOOL)shouldResumePlaybackOnInterruptionEnd;
- (BOOL)shouldShowControlsHintOnActivation;
- (BOOL)splitViewController:(id)a3 shouldShowStartPictureInPictureForApplication:(id)a4;
- (BOOL)splitViewController:(id)a3 startPictureInPictureForApplication:(id)a4;
- (NSDate)currentQuadrantStartDate;
- (NSDate)sessionStartDate;
- (NSHashTable)observers;
- (NSMutableSet)activeInterruptions;
- (NSSet)activePictureInPictureApplicationBundleIDs;
- (OS_dispatch_queue)mediaRemoteQueue;
- (PBAutoPIPTransaction)deferredAutoPipTransaction;
- (PBCoordinatedTransitionToken)editingControlsTransitionToken;
- (PBMediaRemoteObserver)mediaRemoteObserver;
- (PBPIPRootViewController)pipRootViewController;
- (PBPictureInPictureManager)init;
- (PBPictureInPictureOverlayCoordinator)overlayCoordinator;
- (PBSPictureInPictureState)currentState;
- (PBSplitViewController)splitViewController;
- (PBSystemGestureHandle)toggleEditingControlsGesture;
- (PBSystemUIServiceSplitViewStatePublishing)splitViewStatePublisher;
- (PGPictureInPictureController)pictureInPictureController;
- (TVSStateMachine)stateMachine;
- (UIApplicationSceneDeactivationAssertion)pipSceneDeactivationAssertion;
- (id)_controlsProvider;
- (id)_createStateMachine;
- (id)_machineStateChangeHandler;
- (id)_startSplitViewTransactionWithApplication:(id)a3;
- (id)fetchCurrentPictureInPictureState;
- (id)startPIPTransactionForSceneHandleEnteringBackground:(id)a3;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (int64_t)appearanceStyle;
- (int64_t)currentQuadrant;
- (os_unfair_lock_s)observersLock;
- (void)_beginNestingPiPInsideSplitView:(id)a3;
- (void)_dismiss;
- (void)_dismissEditingControlsWithReason:(id)a3 animationStyle:(int64_t)a4;
- (void)_endNestingPiPInsideSplitView;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_handleInterruptionsEnded;
- (void)_handleInterruptionsStarted;
- (void)_notifyObserversDidCancelForApplication:(id)a3;
- (void)_notifyObserversDidStopForApplication:(id)a3;
- (void)_notifyObserversPictureInPictureDidUpdateState;
- (void)_notifyObserversSendPictureInPicturePlaybackCommand:(unint64_t)a3;
- (void)_present;
- (void)_runDeferredAutoPipIfRequired;
- (void)_setAcceptsEventFocus:(BOOL)a3;
- (void)_setupSystemGesturesWithManager:(id)a3;
- (void)addObserver:(id)a3;
- (void)bulletinManager:(id)a3 didBeginFocusOnBulletinViewController:(id)a4;
- (void)bulletinManager:(id)a3 didDismissBulletinViewController:(id)a4;
- (void)bulletinManager:(id)a3 didEndFocusOnBulletinViewController:(id)a4;
- (void)bulletinManager:(id)a3 willPresentBulletinViewController:(id)a4 withActivationActions:(unint64_t)a5;
- (void)cancelPictureInPictureWithReason:(id)a3 sourceBundleID:(id)a4 sourcePlayerInterface:(int64_t)a5;
- (void)controlCenterManagerDidActivateFullScreenOverlay:(id)a3;
- (void)controlCenterManagerDidDeactivateFullScreenOverlay:(id)a3;
- (void)controlsProvider:(id)a3 didRequestEditingControlsDismissalWithAnimationStyle:(int64_t)a4;
- (void)dealloc;
- (void)didStartSimultaneousPlayback;
- (void)dismissEditingControlsWithReason:(id)a3;
- (void)expandPictureInPicture;
- (void)getPictureInPicturePlayerPath:(id)a3;
- (void)movePictureInPicture;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 didPresentSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)pictureInPictureController:(id)a3 didCreatePictureInPictureViewController:(id)a4;
- (void)pictureInPictureController:(id)a3 willDestroyPictureInPictureViewController:(id)a4;
- (void)pictureInPictureInterruptionBegan:(id)a3;
- (void)pictureInPictureInterruptionEnded:(id)a3;
- (void)presentEditingControlsWithReason:(id)a3;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)removeObserver:(id)a3;
- (void)rootViewController:(id)a3 didCancelPictureInPictureForApplication:(id)a4;
- (void)rootViewController:(id)a3 didMovePictureInPictureToQuadrant:(int64_t)a4;
- (void)rootViewController:(id)a3 didRequestEditingControlsDismissalWithStyle:(int64_t)a4;
- (void)rootViewController:(id)a3 didStopPictureInPictureForApplication:(id)a4;
- (void)rootViewController:(id)a3 didUpdatePresentationState:(unint64_t)a4;
- (void)rootViewControllerDidRequestEnterSplitView:(id)a3 forApplication:(id)a4;
- (void)rootViewControllerDidRequestPagingSkipByNumberOfPages:(int64_t)a3 forApplication:(id)a4;
- (void)rootViewControllerDidRequestTogglePlayPause:(id)a3;
- (void)rootViewControllerDidToggleStashing:(id)a3;
- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)sceneManager:(id)a3 didReceiveCompactSceneRequestForScene:(id)a4;
- (void)sceneManager:(id)a3 didUpdateFocusedFrame:(CGRect)a4 forFocusedScene:(id)a5;
- (void)sceneManager:(id)a3 didUpdateOverlayInsets:(UIEdgeInsets)a4 forFocusedScene:(id)a5;
- (void)screenSaverManagerWillDismissScreenSaver:(id)a3;
- (void)screenSaverManagerWillPresentScreenSaver:(id)a3;
- (void)sendPictureInPicturePlaybackCommand:(unint64_t)a3;
- (void)setCurrentQuadrantStartDate:(id)a3;
- (void)setDeferredAutoPipTransaction:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPIPRootViewController:(id)a3;
- (void)setPipSceneDeactivationAssertion:(id)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSplitViewStatePublisher:(id)a3;
- (void)setStashingEnabled:(BOOL)a3;
- (void)setStoppingFromSystemShell:(BOOL)a3;
- (void)setSwapping:(BOOL)a3;
- (void)siriManager:(id)a3 didUpdateVisibleState:(int64_t)a4;
- (void)siriManagerDidUnhideSiriWindow:(id)a3;
- (void)splitViewController:(id)a3 requestsApplicationLaunch:(id)a4;
- (void)splitViewControllerDidDismiss:(id)a3;
- (void)splitViewControllerDidHide:(id)a3;
- (void)splitViewControllerWillDismiss:(id)a3;
- (void)splitViewControllerWillHide:(id)a3;
- (void)splitViewControllerWillPresent:(id)a3;
- (void)splitViewControllerWillUnhide:(id)a3;
- (void)startObservingMediaRemoteChanges;
- (void)stopObservingMediaRemoteChanges;
- (void)updateInsetsForActiveLayoutLevelIfNecessary:(int64_t)a3 insets:(UIEdgeInsets)a4 isPineBoard:(BOOL)a5;
@end

@implementation PBPictureInPictureManager

+ (PBDependencyDescription)dependencyDescription
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100059EB0;
  v26[3] = &unk_1003CFF78;
  v26[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v26);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBBulletinManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v27[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBControlCenterManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v27[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v27[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBScreenSaverManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v27[3] = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBSiriManager, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v27[4] = v17;
  uint64_t v19 = objc_opt_self(&OBJC_CLASS___PBSystemGestureManager, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v27[5] = v20;
  uint64_t v22 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v27[6] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 7LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v24);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059F48;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470158 != -1) {
    dispatch_once(&qword_100470158, block);
  }
  return (id)qword_100470150;
}

- (PBPictureInPictureManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBPictureInPictureManager;
  v2 = -[PBPictureInPictureManager init](&v19, "init");
  if (v2)
  {
    *((void *)v2 + 12) = sub_10013573C();
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 _createStateMachine]);
    uint64_t v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    uint64_t v6 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v5;

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___PGPictureInPictureController);
    v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v7;

    [*((id *)v2 + 7) setDelegate:v2];
    [*((id *)v2 + 7) activateBackgroundPIPAuthorizationService];
    *((_DWORD *)v2 + 4) = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    uint64_t v10 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v12 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v11;

    v2[14] = 0;
    *(_WORD *)(v2 + 11) = 257;
    v2[9] = 0;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PineBoard.PBPictureInPictureManager.mediaRemoteQueue", 0LL);
    v14 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v13;

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005A0EC;
    v17[3] = &unk_1003D0FA8;
    uint64_t v15 = v2;
    uint64_t v18 = v15;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v15,  v17);
    [v15 startObservingMediaRemoteChanges];
  }

  return (PBPictureInPictureManager *)v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusCoordinator]);
  [v4 removeObserver:self];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v5 removeObserver:self];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v6 removeObserver:self];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v7 removeObserver:self];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  [v8 removeObserver:self];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  [v9 removeObserver:self];

  -[PBSystemGestureHandle invalidate](self->_toggleEditingControlsGesture, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBPictureInPictureManager;
  -[PBPictureInPictureManager dealloc](&v10, "dealloc");
}

- (UIApplicationSceneDeactivationAssertion)pipSceneDeactivationAssertion
{
  pipSceneDeactivationAssertion = self->_pipSceneDeactivationAssertion;
  if (!pipSceneDeactivationAssertion)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneDeactivationManager]);
    uint64_t v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:12];
    uint64_t v7 = self->_pipSceneDeactivationAssertion;
    self->_pipSceneDeactivationAssertion = v6;

    pipSceneDeactivationAssertion = self->_pipSceneDeactivationAssertion;
  }

  return pipSceneDeactivationAssertion;
}

- (void)setSplitViewStatePublisher:(id)a3
{
  uint64_t v5 = (PBSystemUIServiceSplitViewStatePublishing *)a3;
  if (self->_splitViewStatePublisher != v5)
  {
    objc_storeStrong((id *)&self->_splitViewStatePublisher, a3);
    -[PBSystemUIServiceSplitViewStatePublishing setSplitViewVisibility:]( self->_splitViewStatePublisher,  "setSplitViewVisibility:",  -[PBSplitViewController isVisible](self->_splitViewController, "isVisible"));
  }
}

- (BOOL)isPresenting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager currentState](self, "currentState"));
  unsigned __int8 v3 = [v2 isPictureInPictureActive];

  return v3;
}

- (PBSPictureInPictureState)currentState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 presentationState];
    id v6 = [v4 currentQuadrant];
  }

  else
  {
    id v6 = (id)sub_10013573C();
    id v5 = 0LL;
  }

  uint64_t v7 = sub_1001356C8((unint64_t)v6);
  if (-[PBSplitViewController isVisible](self->_splitViewController, "isVisible"))
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  else
  {
    [v4 preferredContainerFrame];
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
  }

  BOOL v16 = -[PBPictureInPictureManager _acceptsEventFocus](self, "_acceptsEventFocus") || self->_stoppingFromSystemShell;
  v17 = -[PBSPictureInPictureState initWithPresentationState:isFocused:currentQuadrant:nextQuadrant:preferredContainerFrame:]( objc_alloc(&OBJC_CLASS___PBSPictureInPictureState),  "initWithPresentationState:isFocused:currentQuadrant:nextQuadrant:preferredContainerFrame:",  v5,  v16,  v6,  v7,  x,  y,  width,  height);

  return v17;
}

- (BOOL)isSwapping
{
  return -[PBPIPRootViewController isSwapping](self->_pipRootViewController, "isSwapping");
}

- (BOOL)isHidden
{
  return -[PBPIPRootViewController isHidden](self->_pipRootViewController, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_initWeak(&location, self);
  pipRootViewController = self->_pipRootViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005A808;
  v8[3] = &unk_1003D1228;
  objc_copyWeak(&v9, &location);
  -[PBPIPRootViewController setHidden:animated:completion:]( pipRootViewController,  "setHidden:animated:completion:",  v5,  v4,  v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)appearanceStyle
{
  return -[PBPIPRootViewController appearanceStyle](self->_pipRootViewController, "appearanceStyle");
}

- (id)startPIPTransactionForSceneHandleEnteringBackground:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcessBundleIdentifier]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationForBundleIdentifier:v5]);

    unsigned __int8 v8 = +[TUCallCenter isCurrentJoinedConversationSharePlayOnly]( &OBJC_CLASS___TUCallCenter,  "isCurrentJoinedConversationSharePlayOnly");
    id v9 = 0LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController existingPictureInPictureApplicationForBundleIdentifier:]( self->_pictureInPictureController,  "existingPictureInPictureApplicationForBundleIdentifier:",  v5));
    v11 = (void *)v10;
    if (!v10)
    {
      id v9 = 0LL;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }

    v28 = (void *)v10;
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController activePictureInPictureApplications]( self->_pictureInPictureController,  "activePictureInPictureApplications"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController activePictureInPictureApplicationsStoppingOrCancelling]( self->_pictureInPictureController,  "activePictureInPictureApplicationsStoppingOrCancelling"));
    double v14 = v12;
    double v15 = [v12 count];
    v27 = v13;
    uint64_t v16 = v15 - (_BYTE *)[v13 count];
    unsigned int v17 = -[PBSplitViewController isPresenting](self->_splitViewController, "isPresenting");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewController activeApplication](self->_splitViewController, "activeApplication"));
    unsigned __int8 v19 = [v18 isEqual:v7];

    if ((v19 & 1) != 0)
    {
      v20 = v14;
      v11 = v28;
      if (v17 & 1) != 0 || ([v20 containsObject:v28])
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneIdentifier]);
        id v22 = sub_100083780();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v21;
          __int16 v31 = 2048;
          uint64_t v32 = v16;
          __int16 v33 = 1024;
          unsigned int v34 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Unable to start PiP for scene entering background {scene.identifier=%{public}@, pip.count=%lu, splitView.pre senting=%{BOOL}d}",  buf,  0x1Cu);
        }

        id v9 = 0LL;
      }

      else
      {
        id v9 = (PBAutoPIPTransaction *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureManager _startSplitViewTransactionWithApplication:]( self,  "_startSplitViewTransactionWithApplication:",  v7));
      }
    }

    else
    {
      if (+[TUCallCenter isCurrentJoinedConservationGroupFaceTime]( &OBJC_CLASS___TUCallCenter,  "isCurrentJoinedConservationGroupFaceTime"))
      {
        id v9 = (PBAutoPIPTransaction *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureManager _startSplitViewTransactionWithApplication:]( self,  "_startSplitViewTransactionWithApplication:",  v7));
        v20 = v14;
      }

      else
      {
        v20 = v14;
        if (v16 <= 0)
        {
          v11 = v28;
          v26 = -[PBAutoPIPTransaction initWithPictureInPictureController:pictureInPictureApplication:sceneHandle:application:]( objc_alloc(&OBJC_CLASS___PBAutoPIPTransaction),  "initWithPictureInPictureController:pictureInPictureApplication:sceneHandle:application:",  self->_pictureInPictureController,  v28,  v4,  v7);
          v24 = v27;
          if ([v27 count])
          {
            -[PBPictureInPictureManager setDeferredAutoPipTransaction:](self, "setDeferredAutoPipTransaction:", v26);
            id v9 = 0LL;
          }

          else
          {
            id v9 = v26;
          }

          goto LABEL_20;
        }

        id v9 = 0LL;
      }

      v11 = v28;
    }

    v24 = v27;
LABEL_20:

    goto LABEL_21;
  }

  id v9 = 0LL;
LABEL_23:

  return v9;
}

- (id)_startSplitViewTransactionWithApplication:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self->_splitViewController);
  id v5 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005AC34;
  v9[3] = &unk_1003D22F0;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 initWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (NSSet)activePictureInPictureApplicationBundleIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController activePictureInPictureApplications]( self->_pictureInPictureController,  "activePictureInPictureApplications"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_map:", &stru_1003D2330));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  id v6 = v5;

  return (NSSet *)v6;
}

- (BOOL)isEditing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager _controlsProvider](self, "_controlsProvider"));
  unsigned __int8 v3 = [v2 isEditingControlsVisible];

  return v3;
}

- (void)presentEditingControlsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager _controlsProvider](self, "_controlsProvider"));
  if (([v5 isEditingControlsVisible] & 1) == 0)
  {
    id v6 = sub_100083780();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      double v15 = self;
      __int16 v16 = 2080;
      unsigned int v17 = "-[PBPictureInPictureManager presentEditingControlsWithReason:]";
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %s Request to begin PIP editing with reason: %{public}@",  (uint8_t *)&v14,  0x20u);
    }

    if (!v5)
    {
      id v13 = sub_100083780();
      unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100274C80();
      }
      goto LABEL_11;
    }

    -[PBPictureInPictureManager _setAcceptsEventFocus:](self, "_setAcceptsEventFocus:", 1LL);
    -[PBPictureInPictureManager setStashingEnabled:](self, "setStashingEnabled:", 0LL);
    [v5 setEditingControlsVisible:1 animationStyle:1];
    if (-[PBPIPRootViewController isVisibleAndSplitViewNested]( self->_pipRootViewController,  "isVisibleAndSplitViewNested"))
    {
      -[PBPIPRootViewController setEditingControlsVisible:animationStyle:]( self->_pipRootViewController,  "setEditingControlsVisible:animationStyle:",  1LL,  2LL);
    }

    if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
    {
      unsigned __int8 v8 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissPiPEditingControls",  self);
      id v9 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
      editingControlsTransitionToken = self->_editingControlsTransitionToken;
      self->_editingControlsTransitionToken = v9;

      -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_editingControlsTransitionToken,  "setRespondingFragmentDescriptor:",  v8);
      id v11 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransition);
      -[PBCoordinatedTransition setCoordinatedTransitionToken:]( v11,  "setCoordinatedTransitionToken:",  self->_editingControlsTransitionToken);
      double v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayTransitionCoordinator sharedInstance]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "sharedInstance"));
      [v12 registerTransition:v11];

      -[PBCoordinatedTransition begin](v11, "begin");
LABEL_11:
    }
  }
}

- (void)dismissEditingControlsWithReason:(id)a3
{
}

- (void)_dismissEditingControlsWithReason:(id)a3 animationStyle:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager _controlsProvider](self, "_controlsProvider"));
  if ([v7 isEditingControlsVisible])
  {
    id v8 = sub_100083780();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543874;
      int v14 = self;
      __int16 v15 = 2080;
      __int16 v16 = "-[PBPictureInPictureManager _dismissEditingControlsWithReason:animationStyle:]";
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %s Request to end PIP editing with reason: %{public}@",  (uint8_t *)&v13,  0x20u);
    }

    if (v7)
    {
      editingControlsTransitionToken = self->_editingControlsTransitionToken;
      self->_editingControlsTransitionToken = 0LL;

      -[PBPictureInPictureManager _setAcceptsEventFocus:](self, "_setAcceptsEventFocus:", 0LL);
      [v7 setEditingControlsVisible:0 animationStyle:a4];
      if (-[PBPIPRootViewController isVisibleAndSplitViewNested]( self->_pipRootViewController,  "isVisibleAndSplitViewNested"))
      {
        -[PBPIPRootViewController setEditingControlsVisible:animationStyle:]( self->_pipRootViewController,  "setEditingControlsVisible:animationStyle:",  0LL,  2LL);
      }
    }

    else
    {
      id v11 = sub_100083780();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100274CF0();
      }
    }
  }
}

- (void)cancelPictureInPictureWithReason:(id)a3 sourceBundleID:(id)a4 sourcePlayerInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100083780();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138544130;
    v20 = self;
    __int16 v21 = 2080;
    id v22 = "-[PBPictureInPictureManager cancelPictureInPictureWithReason:sourceBundleID:sourcePlayerInterface:]";
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %s Received request to cancel PIP with reason: %{public}@, source: %{public}@",  (uint8_t *)&v19,  0x2Au);
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
    [v13 cancelPictureInPicture];

    if ([v8 isEqualToString:@"User cancelled"])
    {
      if (v9)
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureManager activePictureInPictureApplicationBundleIDs]( self,  "activePictureInPictureApplicationBundleIDs"));
        unsigned int v15 = [v14 containsObject:v9] ^ 1;

        if (a5)
        {
LABEL_7:
          if (a5 == 2)
          {
            __int16 v16 = @"HostCustomPlayer";
            __int16 v17 = @"ExternalCustomPlayer";
            goto LABEL_13;
          }

          if (a5 == 1)
          {
            __int16 v16 = @"HostPlayer";
            __int16 v17 = @"ExternalPlayer";
LABEL_13:
            if (v15) {
              __int16 v16 = (__CFString *)v17;
            }
            id v18 = v16;
            goto LABEL_17;
          }

          id v18 = @"UnknownPlayer";
LABEL_17:
          sub_1000A2590(v18);

          goto LABEL_18;
        }
      }

      else
      {
        unsigned int v15 = 1;
        if (a5) {
          goto LABEL_7;
        }
      }

      id v18 = @"SystemEvent";
      goto LABEL_17;
    }
  }

- (void)sendPictureInPicturePlaybackCommand:(unint64_t)a3
{
  id v5 = sub_100083780();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBPictureInPictureManager sendPictureInPicturePlaybackCommand:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - Received playback command: %lu",  (uint8_t *)&v7,  0x16u);
  }

  -[PBPictureInPictureManager _notifyObserversSendPictureInPicturePlaybackCommand:]( self,  "_notifyObserversSendPictureInPicturePlaybackCommand:",  a3);
}

- (void)didStartSimultaneousPlayback
{
  id v2 = sub_100083780();
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[PBPictureInPictureManager didStartSimultaneousPlayback]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s - Started simultaneous video playback while in PiP",  (uint8_t *)&v4,  0xCu);
  }

  sub_1000A2CAC();
}

- (void)expandPictureInPicture
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10005B534;
  v2[3] = &unk_1003D0890;
  objc_copyWeak(&v3, &location);
  BSDispatchMain(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)movePictureInPicture
{
  if ((id)-[PBPictureInPictureManager appearanceStyle](self, "appearanceStyle") != (id)1)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10005B628;
    v3[3] = &unk_1003D0890;
    objc_copyWeak(&v4, &location);
    BSDispatchMain(v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }

- (void)pictureInPictureInterruptionBegan:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083780();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBPictureInPictureManager pictureInPictureInterruptionBegan:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - Beginning interruption: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[NSMutableSet addObject:](self->_activeInterruptions, "addObject:", v4);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Interruptions Did Change");
}

- (void)pictureInPictureInterruptionEnded:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083780();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBPictureInPictureManager pictureInPictureInterruptionEnded:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - Ending interruption: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[NSMutableSet removeObject:](self->_activeInterruptions, "removeObject:", v4);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Interruptions Did Change");
}

- (void)_handleInterruptionsStarted
{
}

- (void)_handleInterruptionsEnded
{
  id v3 = sub_100083780();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL shouldResumePlaybackOnInterruptionEnd = self->_shouldResumePlaybackOnInterruptionEnd;
    v6[0] = 67109120;
    v6[1] = shouldResumePlaybackOnInterruptionEnd;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Interruptions ended. Resuming playback: %d",  (uint8_t *)v6,  8u);
  }

  -[PBSystemGestureHandle acquire](self->_toggleEditingControlsGesture, "acquire");
  if (self->_shouldResumePlaybackOnInterruptionEnd)
  {
    -[PBPictureInPictureManager sendPictureInPicturePlaybackCommand:](self, "sendPictureInPicturePlaybackCommand:", 1LL);
    self->_BOOL shouldResumePlaybackOnInterruptionEnd = 1;
  }

- (id)_createStateMachine
{
  id v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager _machineStateChangeHandler](self, "_machineStateChangeHandler"));
  id v8 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Inactive",  0LL,  v7);

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10005BC60;
  v22[3] = &unk_1003D0990;
  objc_copyWeak(&v23, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v8,  "registerDefaultHandlerForEvent:withBlock:",  @"Activate",  v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005BE60;
  v20[3] = &unk_1003D1740;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v8,  "registerHandlerForEvent:onState:withBlock:",  @"Interruptions Did Change",  @"Active",  v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005C328;
  v18[3] = &unk_1003D0990;
  objc_copyWeak(&v19, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v8,  "registerHandlerForEvent:onState:withBlock:",  @"Interruptions Did Change",  @"Interrupted",  v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005C420;
  v16[3] = &unk_1003D0990;
  objc_copyWeak(&v17, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v8,  "registerHandlerForEvent:onState:withBlock:",  @"Expand PiP",  @"Active",  v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10005C464;
  v14[3] = &unk_1003D0990;
  objc_copyWeak(&v15, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v8,  "registerHandlerForEvent:onState:withBlock:",  @"Expand PiP",  @"Interrupted",  v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005C624;
  v12[3] = &unk_1003D1740;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v8,  "registerDefaultHandlerForEvent:withBlock:",  @"Deactivate",  v12);
  id v9 = sub_100083780();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[TVSStateMachine setLogObject:](v8, "setLogObject:", v10);

  -[TVSStateMachine setShouldAcceptEvents:](v8, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v8;
}

- (id)_machineStateChangeHandler
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005C818;
  v5[3] = &unk_1003D16D0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = objc_retainBlock(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (BOOL)_acceptsEventFocus
{
  return -[PBPictureInPictureOverlayCoordinator acceptsEventFocus](self->_overlayCoordinator, "acceptsEventFocus");
}

- (void)_setAcceptsEventFocus:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PBPictureInPictureOverlayCoordinator acceptsEventFocus](self->_overlayCoordinator, "acceptsEventFocus") != a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipSceneDeactivationAssertion](self, "pipSceneDeactivationAssertion"));
    id v6 = v5;
    if (v3)
    {
      [v5 acquire];

      id v7 = sub_100083C30();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipSceneDeactivationAssertion](self, "pipSceneDeactivationAssertion"));
        uint64_t v10 = UIApplicationSceneDeactivationReasonDescription([v9 reason]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        int v15 = 138543362;
        __int16 v16 = v11;
        double v12 = "Acquired scene assertion for reason: %{public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, 0xCu);
      }
    }

    else
    {
      [v5 relinquish];

      id v13 = sub_100083C30();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipSceneDeactivationAssertion](self, "pipSceneDeactivationAssertion"));
        uint64_t v14 = UIApplicationSceneDeactivationReasonDescription([v9 reason]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v15 = 138543362;
        __int16 v16 = v11;
        double v12 = "Relinquished scene assertion for reason: %{public}@";
        goto LABEL_7;
      }
    }

    -[PBPictureInPictureOverlayCoordinator setAcceptsEventFocus:]( self->_overlayCoordinator,  "setAcceptsEventFocus:",  v3);
    -[PBPictureInPictureManager _notifyObserversPictureInPictureDidUpdateState]( self,  "_notifyObserversPictureInPictureDidUpdateState");
  }

- (void)_present
{
}

- (void)_dismiss
{
}

- (void)_setupSystemGesturesWithManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005CC9C;
  v7[3] = &unk_1003D1020;
  objc_copyWeak(&v8, &location);
  id v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:50 actionHandler:v7];
  toggleEditingControlsGesture = self->_toggleEditingControlsGesture;
  self->_toggleEditingControlsGesture = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_controlsProvider
{
  BOOL v3 = (PBPIPRootViewController *)objc_claimAutoreleasedReturnValue( -[PBSplitViewController controlsViewController]( self->_splitViewController,  "controlsViewController"));
  pipRootViewController = v3;
  if (!v3) {
    pipRootViewController = self->_pipRootViewController;
  }
  id v5 = pipRootViewController;

  return v5;
}

- (void)_runDeferredAutoPipIfRequired
{
}

- (void)controlsProvider:(id)a3 didRequestEditingControlsDismissalWithAnimationStyle:(int64_t)a4
{
}

- (void)pictureInPictureController:(id)a3 didCreatePictureInPictureViewController:(id)a4
{
  if (a4)
  {
    stateMachine = self->_stateMachine;
    id v7 = @"PIPViewController";
    id v8 = a4;
    id v5 = a4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Activate",  0LL,  v6);
  }

- (void)pictureInPictureController:(id)a3 willDestroyPictureInPictureViewController:(id)a4
{
  if (a4)
  {
    stateMachine = self->_stateMachine;
    id v8 = @"PIPViewController";
    id v9 = a4;
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Deactivate",  0LL,  v7);
  }

  self->_shouldAvoidFocusOnNextUpdate = 1;
}

- (BOOL)pictureInPictureController:(id)a3 shouldCancelPictureInPictureForApplication:(id)a4 whenStartingPictureInPictureForApplication:(id)a5
{
  return 0;
}

- (BOOL)pictureInPictureController:(id)a3 shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:(id)a4
{
  id v4 = a4;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentApplicationSceneHandle]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 clientProcessBundleIdentifier]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationForBundleIdentifier:v4]);

    else {
      unsigned int v7 = [v4 isEqualToString:v6] ^ 1;
    }
    id v12 = sub_100083780();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 1024;
      unsigned int v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received background PIP authorization request for %@. shouldAuthorize=%{BOOL}d",  (uint8_t *)&v15,  0x12u);
    }
  }

  else
  {
    id v5 = sub_100083780();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Rejecting background PIP authorization request for %@ - system is asleep.",  (uint8_t *)&v15,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:(id)a3
{
  return 1;
}

- (BOOL)pictureInPictureController:(id)a3 shouldDenyNewConnection:(id)a4
{
  return 0;
}

- (void)rootViewController:(id)a3 didRequestEditingControlsDismissalWithStyle:(int64_t)a4
{
}

- (void)rootViewController:(id)a3 didStopPictureInPictureForApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pictureInPictureController](self, "pictureInPictureController"));
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_10005D21C;
  id v13 = &unk_1003D23A8;
  uint64_t v14 = self;
  id v9 = v7;
  id v15 = v9;
  objc_copyWeak(&v16, &location);
  [v8 stopPictureInPictureForApplication:v9 sceneSessionPersistentIdentifier:0 animated:1 completionHandler:&v10];

  -[PBPictureInPictureManager _notifyObserversDidStopForApplication:]( self,  "_notifyObserversDidStopForApplication:",  v9,  v10,  v11,  v12,  v13,  v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)rootViewControllerDidToggleStashing:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[PBPictureInPictureManager isStashingEnabled](self, "isStashingEnabled");
  char v6 = v5;
  -[PBPictureInPictureManager setStashingEnabled:](self, "setStashingEnabled:", v5 ^ 1);
  if ((v6 & 1) == 0)
  {
    [v4 setStashed:1 animated:1];
    -[PBPictureInPictureManager _dismissEditingControlsWithReason:animationStyle:]( self,  "_dismissEditingControlsWithReason:animationStyle:",  @"PiP Stashed",  2LL);
  }
}

- (void)rootViewControllerDidRequestEnterSplitView:(id)a3 forApplication:(id)a4
{
  id v5 = a4;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationForBundleIdentifier:v7]);

  if (v8)
  {
    -[PBPictureInPictureManager _dismissEditingControlsWithReason:animationStyle:]( self,  "_dismissEditingControlsWithReason:animationStyle:",  @"requesting split view",  2LL);
    -[PGPictureInPictureController cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:]( self->_pictureInPictureController,  "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:",  v5,  0LL);
    self->_shouldAvoidNestingPiPOnNextSplitViewPresentation = 1;
    -[PBSplitViewController presentApplication:completion:]( self->_splitViewController,  "presentApplication:completion:",  v8,  0LL);
  }

  else
  {
    id v9 = sub_100083780();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100274E04(v10, v11, v12);
    }
  }
}

- (void)rootViewController:(id)a3 didUpdatePresentationState:(unint64_t)a4
{
}

- (void)rootViewController:(id)a3 didCancelPictureInPictureForApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005D504;
  v9[3] = &unk_1003D0418;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  BSDispatchMain(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)rootViewController:(id)a3 didMovePictureInPictureToQuadrant:(int64_t)a4
{
  int64_t currentQuadrant = self->_currentQuadrant;
  -[NSDate timeIntervalSinceNow](self->_currentQuadrantStartDate, "timeIntervalSinceNow", a3);
  if (v7 != 0.0) {
    sub_1000A2778(currentQuadrant, fabs(v7));
  }
  self->_int64_t currentQuadrant = a4;
  id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  currentQuadrantStartDate = self->_currentQuadrantStartDate;
  self->_currentQuadrantStartDate = v8;

  -[PBPictureInPictureManager _notifyObserversPictureInPictureDidUpdateState]( self,  "_notifyObserversPictureInPictureDidUpdateState");
}

- (void)rootViewControllerDidRequestTogglePlayPause:(id)a3
{
}

- (void)rootViewControllerDidRequestPagingSkipByNumberOfPages:(int64_t)a3 forApplication:(id)a4
{
}

- (void)_beginNestingPiPInsideSplitView:(id)a3
{
  p_shouldAvoidNestingPiPOnNextSplitViewPresentation = &self->_shouldAvoidNestingPiPOnNextSplitViewPresentation;
  if (!self->_shouldAvoidNestingPiPOnNextSplitViewPresentation)
  {
    pipRootViewController = self->_pipRootViewController;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 geometry]);
    -[PBPIPRootViewController setSplitViewGeometry:](pipRootViewController, "setSplitViewGeometry:", v6);

    p_shouldAvoidNestingPiPOnNextSplitViewPresentation = &self->_shouldAvoidFocusOnNextUpdate;
  }

  BOOL *p_shouldAvoidNestingPiPOnNextSplitViewPresentation = 0;
}

- (void)_endNestingPiPInsideSplitView
{
  self->_shouldAvoidFocusOnNextUpdate = 1;
}

- (void)splitViewController:(id)a3 requestsApplicationLaunch:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  [v5 openApplication:v6 launchURL:0 options:0 suspended:0 completion:0];
}

- (BOOL)splitViewController:(id)a3 shouldShowStartPictureInPictureForApplication:(id)a4
{
  pictureInPictureController = self->_pictureInPictureController;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bundleIdentifier", a3));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController existingPictureInPictureApplicationForBundleIdentifier:]( pictureInPictureController,  "existingPictureInPictureApplicationForBundleIdentifier:",  v6));

  if (v7) {
    unsigned __int8 v8 = -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]( self->_pictureInPictureController,  "shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:",  v7,  0LL);
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)splitViewController:(id)a3 startPictureInPictureForApplication:(id)a4
{
  id v5 = a4;
  pictureInPictureController = self->_pictureInPictureController;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureController existingPictureInPictureApplicationForBundleIdentifier:]( pictureInPictureController,  "existingPictureInPictureApplicationForBundleIdentifier:",  v7));

  if (!v8)
  {
    id v11 = sub_100083780();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100274E74(v5, v12);
    }

    goto LABEL_7;
  }

  if (!-[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]( self->_pictureInPictureController,  "shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:",  v8,  0LL))
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }

  id v9 = self->_pictureInPictureController;
  BOOL v10 = 1;
  -[PGPictureInPictureController startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:]( v9,  "startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:",  v8,  0LL,  1LL,  0LL);
LABEL_8:

  return v10;
}

- (void)splitViewControllerWillPresent:(id)a3
{
  id v4 = a3;
  -[PBPictureInPictureManager _beginNestingPiPInsideSplitView:](self, "_beginNestingPiPInsideSplitView:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 controlsViewController]);
  [v5 setControlsDelegate:self];
  -[PBPictureInPictureOverlayCoordinator setSplitViewControlsViewController:]( self->_overlayCoordinator,  "setSplitViewControlsViewController:",  v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 activeApplication]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureManager activePictureInPictureApplicationBundleIDs]( self,  "activePictureInPictureApplicationBundleIDs"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned int v9 = [v7 containsObject:v8];

  if (v9)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    -[PBPictureInPictureManager cancelPictureInPictureWithReason:sourceBundleID:sourcePlayerInterface:]( self,  "cancelPictureInPictureWithReason:sourceBundleID:sourcePlayerInterface:",  @"Split View presented",  v11,  0LL);
  }

  -[PBSystemUIServiceSplitViewStatePublishing setSplitViewVisibility:]( self->_splitViewStatePublisher,  "setSplitViewVisibility:",  1LL);
}

- (void)splitViewControllerWillDismiss:(id)a3
{
}

- (void)splitViewControllerDidDismiss:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureOverlayCoordinator splitViewControlsViewController]( self->_overlayCoordinator,  "splitViewControlsViewController",  a3));
  [v4 setControlsDelegate:0];
  -[PBPictureInPictureOverlayCoordinator setSplitViewControlsViewController:]( self->_overlayCoordinator,  "setSplitViewControlsViewController:",  0LL);
  -[PBPictureInPictureOverlayCoordinator setSplitViewStashOverlayHintState:]( self->_overlayCoordinator,  "setSplitViewStashOverlayHintState:",  0LL);
  -[PBSystemUIServiceSplitViewStatePublishing setSplitViewVisibility:]( self->_splitViewStatePublisher,  "setSplitViewVisibility:",  0LL);
}

- (void)splitViewControllerWillHide:(id)a3
{
}

- (void)splitViewControllerDidHide:(id)a3
{
}

- (void)splitViewControllerWillUnhide:(id)a3
{
  overlayCoordinator = self->_overlayCoordinator;
  id v5 = a3;
  -[PBPictureInPictureOverlayCoordinator setSplitViewStashOverlayHintState:]( overlayCoordinator,  "setSplitViewStashOverlayHintState:",  2LL);
  -[PBPictureInPictureManager _beginNestingPiPInsideSplitView:](self, "_beginNestingPiPInsideSplitView:", v5);

  -[PBSystemUIServiceSplitViewStatePublishing setSplitViewVisibility:]( self->_splitViewStatePublisher,  "setSplitViewVisibility:",  1LL);
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  id v6 = (NSHashTable *)-[NSHashTable copy](self->_observers, "copy");
  -[NSHashTable addObject:](v6, "addObject:", v5);

  observers = self->_observers;
  self->_observers = v6;

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  id v6 = (NSHashTable *)-[NSHashTable copy](self->_observers, "copy");
  -[NSHashTable removeObject:](v6, "removeObject:", v5);

  observers = self->_observers;
  self->_observers = v6;

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = self->_observers;
  os_unfair_lock_unlock(p_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  double v7 = v6;
  id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (void)_notifyObserversPictureInPictureDidUpdateState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10005DCE4;
  v2[3] = &unk_1003D23D0;
  void v2[4] = self;
  -[PBPictureInPictureManager _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v2);
}

- (void)_notifyObserversSendPictureInPicturePlaybackCommand:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10005DD9C;
  v3[3] = &unk_1003D23F8;
  void v3[4] = self;
  v3[5] = a3;
  -[PBPictureInPictureManager _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v3);
}

- (void)_notifyObserversDidStopForApplication:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DE58;
  v4[3] = &unk_1003D2420;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PBPictureInPictureManager _enumerateObserversUsingBlock:](v5, "_enumerateObserversUsingBlock:", v4);
}

- (void)_notifyObserversDidCancelForApplication:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DF14;
  v4[3] = &unk_1003D2420;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PBPictureInPictureManager _enumerateObserversUsingBlock:](v5, "_enumerateObserversUsingBlock:", v4);
}

- (id)fetchCurrentPictureInPictureState
{
  return (id)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager currentState](self, "currentState"));
}

- (void)overlayController:(id)a3 didPresentSession:(id)a4
{
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
}

- (void)sceneManager:(id)a3 didUpdateOverlayInsets:(UIEdgeInsets)a4 forFocusedScene:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "clientProcess", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  id v12 = [v11 isEqualToString:@"com.apple.PineBoard"];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  -[PBPictureInPictureManager updateInsetsForActiveLayoutLevelIfNecessary:insets:isPineBoard:]( self,  "updateInsetsForActiveLayoutLevelIfNecessary:insets:isPineBoard:",  [v13 activeLayoutLevel],  v12,  top,  left,  bottom,  right);
}

- (void)sceneManager:(id)a3 didUpdateFocusedFrame:(CGRect)a4 forFocusedScene:(id)a5
{
  if (self->_shouldAvoidFocusOnNextUpdate)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController", a3, a5));
    objc_msgSend(v9, "adjustPositionForFocusedFrame:", x, y, width, height);
  }

- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "clientProcessBundleIdentifier", a3));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBPictureInPictureManager activePictureInPictureApplicationBundleIDs]( self,  "activePictureInPictureApplicationBundleIDs"));
  unsigned int v8 = [v7 containsObject:v6];

  if (v8) {
    sub_1000A2C38();
  }
}

- (void)sceneManager:(id)a3 didReceiveCompactSceneRequestForScene:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 clientHandle]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationForBundleIdentifier:v9]);

  if ([v12 isFaceTime])
  {
    -[PBSplitViewController presentApplication:completion:]( self->_splitViewController,  "presentApplication:completion:",  v12,  0LL);
  }

  else
  {
    id v13 = sub_100083780();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100274EFC(v5, v14);
    }
  }
}

- (BOOL)_shouldAdjustInsetsForLayoutLevel:(int64_t)a3
{
  if (qword_100470168 != -1) {
    dispatch_once(&qword_100470168, &stru_1003D2440);
  }
  return [(id)qword_100470160 containsValue:a3];
}

- (BOOL)_shouldAvoidFocusForLayoutLevel:(int64_t)a3
{
  if (qword_100470178 != -1) {
    dispatch_once(&qword_100470178, &stru_1003D2460);
  }
  return [(id)qword_100470170 containsValue:a3] ^ 1;
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  if (-[PBPictureInPictureManager isPresenting](self, "isPresenting", a3))
  {
    if (-[PBPictureInPictureManager _shouldInterruptForLayoutLevel:](self, "_shouldInterruptForLayoutLevel:", a4))
    {
      if (a4 < 11 || a5 > 10)
      {
        if (a4 <= 10 && a5 >= 11) {
          -[PBPictureInPictureManager pictureInPictureInterruptionEnded:]( self,  "pictureInPictureInterruptionEnded:",  @"Focused Layout Above PIP");
        }
      }

      else
      {
        -[PBPictureInPictureManager pictureInPictureInterruptionBegan:]( self,  "pictureInPictureInterruptionBegan:",  @"Focused Layout Above PIP");
      }
    }

    if (-[PBPictureInPictureManager _shouldAvoidFocusForLayoutLevel:](self, "_shouldAvoidFocusForLayoutLevel:", a4))
    {
      self->_shouldAvoidFocusOnNextUpdate = 1;
    }

    else
    {
      self->_shouldAvoidFocusOnNextUpdate = 0;
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
      objc_msgSend( v8,  "adjustPositionForFocusedFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 focusedSceneHandle]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uiClientSettings]);
    [v11 primaryWindowOverlayInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 sceneIfExists]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 definition]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 clientIdentity]);
    id v23 = [v22 isLocal];

    -[PBPictureInPictureManager updateInsetsForActiveLayoutLevelIfNecessary:insets:isPineBoard:]( self,  "updateInsetsForActiveLayoutLevelIfNecessary:insets:isPineBoard:",  a4,  v23,  v13,  v15,  v17,  v19);
  }

- (BOOL)_shouldInterruptForLayoutLevel:(int64_t)a3
{
  if (qword_100470188 != -1) {
    dispatch_once(&qword_100470188, &stru_1003D2480);
  }
  return [(id)qword_100470180 containsValue:a3] ^ 1;
}

- (void)siriManager:(id)a3 didUpdateVisibleState:(int64_t)a4
{
  if (-[PBPictureInPictureManager isPresenting](self, "isPresenting", a3))
  {
    if ((unint64_t)(a4 - 2) < 2)
    {
      -[PBPictureInPictureManager pictureInPictureInterruptionBegan:]( self,  "pictureInPictureInterruptionBegan:",  @"Full screen Siri");
    }

    else if ((unint64_t)a4 <= 1)
    {
      -[PBPictureInPictureManager pictureInPictureInterruptionEnded:]( self,  "pictureInPictureInterruptionEnded:",  @"Full screen Siri");
    }
  }

- (void)siriManagerDidUnhideSiriWindow:(id)a3
{
  if (-[PBPictureInPictureManager isPresenting](self, "isPresenting", a3))
  {
    if (-[PBPictureInPictureManager isEditing](self, "isEditing")) {
      -[PBPictureInPictureManager dismissEditingControlsWithReason:]( self,  "dismissEditingControlsWithReason:",  @"Siri presenting");
    }
  }

- (void)updateInsetsForActiveLayoutLevelIfNecessary:(int64_t)a3 insets:(UIEdgeInsets)a4 isPineBoard:(BOOL)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  if (!a5
    || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance", a3)),
        id v11 = [v10 activeLayoutLevel],
        v10,
        -[PBPictureInPictureManager _shouldAdjustInsetsForLayoutLevel:](self, "_shouldAdjustInsetsForLayoutLevel:", v11)))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager currentState](self, "currentState", a3));
    id v13 = [v12 presentationState];

    if (v13 != (id)1)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
      objc_msgSend(v14, "setOverlayInsets:", top, left, bottom, right);
    }
  }

- (void)bulletinManager:(id)a3 willPresentBulletinViewController:(id)a4 withActivationActions:(unint64_t)a5
{
  if ((a5 & 2) != 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10005E7D4;
    v5[3] = &unk_1003CFF08;
    v5[4] = self;
    BSDispatchMain(v5);
  }

- (void)bulletinManager:(id)a3 didDismissBulletinViewController:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005E86C;
  v4[3] = &unk_1003CFF08;
  void v4[4] = self;
  BSDispatchMain(v4);
}

- (void)bulletinManager:(id)a3 didBeginFocusOnBulletinViewController:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005E8CC;
  v4[3] = &unk_1003CFF08;
  void v4[4] = self;
  BSDispatchMain(v4);
}

- (void)bulletinManager:(id)a3 didEndFocusOnBulletinViewController:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005E93C;
  v4[3] = &unk_1003CFF08;
  void v4[4] = self;
  BSDispatchMain(v4);
}

- (void)screenSaverManagerWillPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerWillDismissScreenSaver:(id)a3
{
}

- (void)controlCenterManagerDidActivateFullScreenOverlay:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10005E9E4;
  v3[3] = &unk_1003CFF08;
  void v3[4] = self;
  BSDispatchMain(v3);
}

- (void)controlCenterManagerDidDeactivateFullScreenOverlay:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10005EA54;
  v3[3] = &unk_1003CFF08;
  void v3[4] = self;
  BSDispatchMain(v3);
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 respondingFragmentDescriptor]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
  if (![v12 isEqual:@"DismissPiPEditingControls"])
  {

    goto LABEL_5;
  }

  unsigned int v13 = -[PBPictureInPictureManager isEditing](self, "isEditing");

  if (!v13)
  {
LABEL_5:
    id v15 = 0LL;
    goto LABEL_6;
  }

  objc_initWeak(&location, self);
  id v14 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005EBDC;
  v17[3] = &unk_1003D24A8;
  objc_copyWeak(&v18, &location);
  id v15 = [v14 initWithBlock:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_6:

  return v15;
}

- (void)getPictureInPicturePlayerPath:(id)a3
{
  id v4 = a3;
  mediaRemoteQueue = self->_mediaRemoteQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005ECB0;
  v7[3] = &unk_1003D24F8;
  id v8 = v4;
  id v6 = v4;
  MRMediaRemoteGetActivePlayerPathsForOrigin(0LL, mediaRemoteQueue, v7);
}

- (void)startObservingMediaRemoteChanges
{
}

- (void)stopObservingMediaRemoteChanges
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1004697A8 == a6 || off_1004697A0 == a6)
  {
    if (-[PBPictureInPictureManager isPresenting](self, "isPresenting"))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteObserver nowPlayingPlayerPath](self->_mediaRemoteObserver, "nowPlayingPlayerPath"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBMediaRemoteObserver pictureInPicturePlayerPath]( self->_mediaRemoteObserver,  "pictureInPicturePlayerPath"));
      int v16 = BSEqualObjects(v14, v15);
      if (off_1004697A0 == a6) {
        double v17 = @"pip";
      }
      else {
        double v17 = @"unknown";
      }
      if (off_1004697A8 == a6) {
        id v18 = @"nowplaying";
      }
      else {
        id v18 = (__CFString *)v17;
      }
      double v19 = v18;
      id v20 = sub_100083780();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        int v26 = v16 ^ 1;
        __int16 v27 = 2114;
        v28 = v14;
        __int16 v29 = 2114;
        v30 = v15;
        __int16 v31 = 2114;
        uint64_t v32 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Simultaneous video started: %d, pip: %{public}@, nowPlaying: %{public}@, changeContext: %{public}@",  buf,  0x26u);
      }

      if ((v16 & 1) == 0 && -[PBPictureInPictureManager isPresenting](self, "isPresenting")) {
        -[PBPictureInPictureManager didStartSimultaneousPlayback](self, "didStartSimultaneousPlayback");
      }
    }
  }

  else if (off_1004697B0 == a6)
  {
    if (-[PBPictureInPictureManager isStashingEnabled](self, "isStashingEnabled")
      && !-[PBMediaRemoteObserver nowPlayingMediaTypeAudioOnly]( self->_mediaRemoteObserver,  "nowPlayingMediaTypeAudioOnly"))
    {
      BOOL v22 = -[PBMediaRemoteObserver playing](self->_mediaRemoteObserver, "playing");
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureManager pipRootViewController](self, "pipRootViewController"));
      [v23 setStashed:v22 animated:1];
    }
  }

  else
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___PBPictureInPictureManager;
    -[PBPictureInPictureManager observeValueForKeyPath:ofObject:change:context:]( &v24,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (PBSystemUIServiceSplitViewStatePublishing)splitViewStatePublisher
{
  return self->_splitViewStatePublisher;
}

- (void)setSwapping:(BOOL)a3
{
  self->_swapping = a3;
}

- (BOOL)isStashingEnabled
{
  return self->_stashingEnabled;
}

- (void)setStashingEnabled:(BOOL)a3
{
  self->_stashingEnabled = a3;
}

- (BOOL)isStashed
{
  return self->_stashed;
}

- (PBSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (PBAutoPIPTransaction)deferredAutoPipTransaction
{
  return self->_deferredAutoPipTransaction;
}

- (void)setDeferredAutoPipTransaction:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (PGPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

- (PBPIPRootViewController)pipRootViewController
{
  return self->_pipRootViewController;
}

- (void)setPIPRootViewController:(id)a3
{
}

- (BOOL)shouldShowControlsHintOnActivation
{
  return self->_shouldShowControlsHintOnActivation;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (PBPictureInPictureOverlayCoordinator)overlayCoordinator
{
  return self->_overlayCoordinator;
}

- (PBMediaRemoteObserver)mediaRemoteObserver
{
  return self->_mediaRemoteObserver;
}

- (int64_t)currentQuadrant
{
  return self->_currentQuadrant;
}

- (NSDate)currentQuadrantStartDate
{
  return self->_currentQuadrantStartDate;
}

- (void)setCurrentQuadrantStartDate:(id)a3
{
}

- (BOOL)shouldAvoidFocusOnNextUpdate
{
  return self->_shouldAvoidFocusOnNextUpdate;
}

- (BOOL)shouldAvoidNestingPiPOnNextSplitViewPresentation
{
  return self->_shouldAvoidNestingPiPOnNextSplitViewPresentation;
}

- (NSMutableSet)activeInterruptions
{
  return self->_activeInterruptions;
}

- (BOOL)shouldResumePlaybackOnInterruptionEnd
{
  return self->_shouldResumePlaybackOnInterruptionEnd;
}

- (void)setPipSceneDeactivationAssertion:(id)a3
{
}

- (OS_dispatch_queue)mediaRemoteQueue
{
  return self->_mediaRemoteQueue;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
}

- (BOOL)isStoppingFromSystemShell
{
  return self->_stoppingFromSystemShell;
}

- (void)setStoppingFromSystemShell:(BOOL)a3
{
  self->_stoppingFromSystemShell = a3;
}

- (PBSystemGestureHandle)toggleEditingControlsGesture
{
  return self->_toggleEditingControlsGesture;
}

- (PBCoordinatedTransitionToken)editingControlsTransitionToken
{
  return self->_editingControlsTransitionToken;
}

- (void).cxx_destruct
{
}

@end