@interface PBControlCenterManager
+ (BOOL)isControlCenterEnabled;
+ (PBDependencyDescription)dependencyDescription;
+ (id)keyPathsForValuesAffectingIsPresenting;
+ (id)sharedInstance;
- (BOOL)dismissControlCenter;
- (BOOL)isFullScreenOverlayActive;
- (BOOL)isPresenting;
- (NSHashTable)observers;
- (PBControlCenterManager)init;
- (PBControlCenterPresenting)presenter;
- (PBPowerManager)powerManager;
- (PBSceneDeactivationManager)sceneDeactivationManager;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemGestureHandle)presentGesture;
- (PBSystemUIServicePresenter)systemUIServicePresenter;
- (PBUserProfileManager)userProfileManager;
- (UIApplicationSceneDeactivationAssertion)fullScreenOverlaySceneDeactivationAssertion;
- (id)coordinatedTransitionTokenForControlCenterPresenter:(id)a3;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (void)_notifyObserversDidDismiss;
- (void)_notifyObserversFullScreenOverlayDidActivate;
- (void)_notifyObserversFullScreenOverlayDidDeactivate;
- (void)_turnOffDoNotDisturb;
- (void)addObserver:(id)a3;
- (void)controlCenterPresenterDidDismiss:(id)a3;
- (void)controlCenterPresenterWillDismiss:(id)a3;
- (void)controlCenterPresenterWillPresent:(id)a3;
- (void)dealloc;
- (void)distributedAssertion:(id)a3 didChangeState:(id)a4;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)presentControlCenterForReason:(unint64_t)a3;
- (void)removeObserver:(id)a3;
- (void)setFullScreenOverlayActive:(BOOL)a3;
- (void)setFullScreenOverlaySceneDeactivationAssertion:(id)a3;
- (void)setPowerManager:(id)a3;
- (void)setUserProfileManager:(id)a3;
- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5;
@end

@implementation PBControlCenterManager

+ (PBDependencyDescription)dependencyDescription
{
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1001C0A04;
  v30[3] = &unk_1003CFF78;
  v30[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v30);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBPictureInPictureManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v32[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v32[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v32[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBUserProfileManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v32[3] = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v32[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 5LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v18);

  uint64_t v20 = objc_opt_self(&OBJC_CLASS___PBHomeUIManager, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v31[0] = v21;
  uint64_t v23 = objc_opt_self(&OBJC_CLASS___PBSiriManager, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v31[1] = v24;
  uint64_t v26 = objc_opt_self(&OBJC_CLASS___PBDictationManager, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v31[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v28);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C0A9C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471308 != -1) {
    dispatch_once(&qword_100471308, block);
  }
  return (id)qword_100471300;
}

+ (BOOL)isControlCenterEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 controlCenterAllowed];

  return v3;
}

- (PBControlCenterManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBControlCenterManager;
  v2 = -[PBControlCenterManager init](&v23, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001C0D34;
    v21[3] = &unk_1003D0FA8;
    v5 = v2;
    uint64_t v22 = v5;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v5,  v21);
    -[PBControlCenterPresenting setControlCenterPresenterDelegate:]( v5->_presenter,  "setControlCenterPresenterDelegate:",  v5);
    objc_initWeak(&location, v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001C0FB8;
    v18[3] = &unk_1003D1020;
    objc_copyWeak(&v19, &location);
    uint64_t v7 = (PBSystemGestureHandle *)[v6 newHandleForSystemGesture:29 actionHandler:v18];
    presentGesture = v5->_presentGesture;
    v5->_presentGesture = v7;

    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_1001C10D8;
    uint64_t v16 = &unk_1003D1020;
    objc_copyWeak(&v17, &location);
    uint64_t v9 = (PBSystemGestureHandle *)[v6 newHandleForSystemGesture:30 actionHandler:&v13];
    dismissGesture = v5->_dismissGesture;
    v5->_dismissGesture = v9;

    -[PBSystemGestureHandle acquire](v5->_presentGesture, "acquire", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBDistributedAssertion distributedAssertionForDomain:]( &OBJC_CLASS___PBDistributedAssertion,  "distributedAssertionForDomain:",  PBSAssertionDomainControlCenterFullScreenOverlay));
    [v11 setDelegate:v5];
    -[PBControlCenterManager setFullScreenOverlayActive:]( v5,  "setFullScreenOverlayActive:",  [v11 isActive]);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBControlCenterManager;
  -[PBControlCenterManager dealloc](&v3, "dealloc");
}

- (void)setFullScreenOverlayActive:(BOOL)a3
{
  if (self->_fullScreenOverlayActive != a3)
  {
    BOOL v3 = a3;
    self->_fullScreenOverlayActive = a3;
    if (a3)
    {
      p_presenter = &self->_presenter;
      double v6 = sub_100103824((uint64_t)-[PBControlCenterPresenting systemMenuLayoutLevel]( self->_presenter,  "systemMenuLayoutLevel"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBControlCenterManager fullScreenOverlaySceneDeactivationAssertion]( self,  "fullScreenOverlaySceneDeactivationAssertion"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1001C1258;
      v9[3] = &unk_1003D7748;
      *(double *)&v9[4] = v6;
      [v7 acquireWithPredicate:v9 transitionContext:0];

      -[PBControlCenterManager _notifyObserversFullScreenOverlayDidActivate]( self,  "_notifyObserversFullScreenOverlayDidActivate");
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBControlCenterManager fullScreenOverlaySceneDeactivationAssertion]( self,  "fullScreenOverlaySceneDeactivationAssertion"));
      [v8 relinquish];

      -[PBControlCenterManager _notifyObserversFullScreenOverlayDidDeactivate]( self,  "_notifyObserversFullScreenOverlayDidDeactivate");
      p_presenter = &self->_presenter;
    }

    -[PBControlCenterPresenting setSystemMenuIdleTimerActive:](*p_presenter, "setSystemMenuIdleTimerActive:", !v3);
  }

- (BOOL)isPresenting
{
  return -[PBControlCenterPresenting isSystemMenuPresenting]( self->_presenter,  "isSystemMenuPresenting");
}

+ (id)keyPathsForValuesAffectingIsPresenting
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"presenter.isSystemMenuPresenting"));
}

- (void)presentControlCenterForReason:(unint64_t)a3
{
  id v5 = sub_1000F6A24();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = PBSystemUIServicePresentMenuReasonName(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Present Control Center for reason: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  -[PBControlCenterPresenting presentSystemMenuWithActivationReason:]( self->_presenter,  "presentSystemMenuWithActivationReason:",  a3);
}

- (BOOL)dismissControlCenter
{
  return -[PBControlCenterPresenting dismissSystemMenuAnimated:]( self->_presenter,  "dismissSystemMenuAnimated:",  1LL);
}

- (void)controlCenterPresenterWillPresent:(id)a3
{
}

- (void)controlCenterPresenterWillDismiss:(id)a3
{
}

- (void)controlCenterPresenterDidDismiss:(id)a3
{
}

- (id)coordinatedTransitionTokenForControlCenterPresenter:(id)a3
{
  BOOL v3 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissControlCenterFragment",  self);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
  -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:](v4, "setRespondingFragmentDescriptor:", v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"DismissPiPEditingControls",  @"DismissDialogFragment",  0LL));
  -[PBCoordinatedTransitionToken setCoordinatedFragmentTypes:](v4, "setCoordinatedFragmentTypes:", v5);

  return v4;
}

- (UIApplicationSceneDeactivationAssertion)fullScreenOverlaySceneDeactivationAssertion
{
  fullScreenOverlaySceneDeactivationAssertion = self->_fullScreenOverlaySceneDeactivationAssertion;
  if (!fullScreenOverlaySceneDeactivationAssertion)
  {
    uint64_t v4 = (UIApplicationSceneDeactivationAssertion *)-[PBSceneDeactivationManager newAssertionWithReason:]( self->_sceneDeactivationManager,  "newAssertionWithReason:",  7LL);
    id v5 = self->_fullScreenOverlaySceneDeactivationAssertion;
    self->_fullScreenOverlaySceneDeactivationAssertion = v4;

    fullScreenOverlaySceneDeactivationAssertion = self->_fullScreenOverlaySceneDeactivationAssertion;
  }

  return fullScreenOverlaySceneDeactivationAssertion;
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v6 = a5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionHint]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBDismissControlCenterTransitionHint);
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v11 = v10;
    }
    else {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  id v12 = v11;

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionHint]);
    if ([v13 requiresFullscreenPresentation])
    {
      unsigned __int8 v14 = -[PBControlCenterManager isFullScreenOverlayActive](self, "isFullScreenOverlayActive");

      if ((v14 & 1) == 0) {
        goto LABEL_13;
      }
    }

    else
    {
    }
  }

  if ((objc_opt_respondsToSelector(self->_presenter, "transactionForDismissingSystemMenuAnimated:") & 1) == 0)
  {
LABEL_13:
    uint64_t v15 = 0LL;
    goto LABEL_14;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBControlCenterPresenting transactionForDismissingSystemMenuAnimated:]( self->_presenter,  "transactionForDismissingSystemMenuAnimated:",  1LL));
LABEL_14:

  return v15;
}

- (void)distributedAssertion:(id)a3 didChangeState:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001C168C;
  v5[3] = &unk_1003CFEB8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5
{
  id v6 = sub_1000F6A24();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Turning off Do Not Disturb due to user switching.",  v8,  2u);
  }

  -[PBControlCenterManager _turnOffDoNotDisturb](self, "_turnOffDoNotDisturb");
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(void))a5;
  id v7 = sub_1000F6A24();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Turning off Do Not Disturb due to system sleep.",  v9,  2u);
  }

  -[PBControlCenterManager _turnOffDoNotDisturb](self, "_turnOffDoNotDisturb");
  if (v6) {
    v6[2](v6);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversDidDismiss
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "controlCenterManagerDidDismiss:") & 1) != 0) {
          objc_msgSend(v8, "controlCenterManagerDidDismiss:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyObserversFullScreenOverlayDidActivate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "controlCenterManagerDidActivateFullScreenOverlay:") & 1) != 0) {
          objc_msgSend(v8, "controlCenterManagerDidActivateFullScreenOverlay:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyObserversFullScreenOverlayDidDeactivate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "controlCenterManagerDidDeactivateFullScreenOverlay:") & 1) != 0) {
          objc_msgSend(v8, "controlCenterManagerDidDeactivateFullScreenOverlay:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (PBSystemUIServicePresenter)systemUIServicePresenter
{
  return (PBSystemUIServicePresenter *)self->_presenter;
}

- (void)_turnOffDoNotDisturb
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVSystemUIService");
  -[NSUserDefaults setBool:forKey:](v2, "setBool:forKey:", 0LL, @"DoNotDisturbEnabled");
}

- (BOOL)isFullScreenOverlayActive
{
  return self->_fullScreenOverlayActive;
}

- (PBControlCenterPresenting)presenter
{
  return self->_presenter;
}

- (PBSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

- (void)setFullScreenOverlaySceneDeactivationAssertion:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (PBSystemGestureHandle)presentGesture
{
  return self->_presentGesture;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (PBUserProfileManager)userProfileManager
{
  return self->_userProfileManager;
}

- (void)setUserProfileManager:(id)a3
{
}

- (PBPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setPowerManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end