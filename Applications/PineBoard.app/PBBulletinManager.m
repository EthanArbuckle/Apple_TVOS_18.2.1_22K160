@interface PBBulletinManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)dismissOrShrinkCurrentBulletin;
- (BOOL)handleBackButton;
- (BOOL)isCurrentBulletinActive;
- (BOOL)isPresenting;
- (BOOL)shouldActivateCurrentBulletinForAction:(unint64_t)a3;
- (BSInvalidatable)idleTimerAssertion;
- (BSInvalidatable)stateCaptureHandle;
- (BSInvalidatable)systemHomeUIServicePreheatAssertion;
- (NSHashTable)pausedAssertions;
- (NSMutableDictionary)identifiersToBulletinInfos;
- (OS_dispatch_source)bulletinDismissalTimer;
- (PBBulletinManager)init;
- (PBSystemGestureHandle)activateGameControllerHomeGesture;
- (PBSystemGestureHandle)activateTVButtonGesture;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemOverlayController)overlayController;
- (TVSObserverSet)observers;
- (UIApplicationSceneDeactivationAssertion)interactiveBulletinSceneDeactivationAssertion;
- (id)_activateGameControllerHomeGestureCreatingIfNeeded;
- (id)_activateTVButtonGestureCreatingIfNeeded;
- (id)_bulletinActivationGestureActionHandler;
- (id)_createBulletinActivationGestureHandle:(unint64_t)a3;
- (id)stateDumpBuilder;
- (void)_cancelTimer;
- (void)_createIdleTimerAssertion;
- (void)_deregisterBulletinPausedAssertion:(id)a3;
- (void)_invalidateIdleTimerAssertion;
- (void)_notifyObserversDidBeginFocusOnBulletinViewController:(id)a3;
- (void)_notifyObserversDidDismissBulletinViewController:(id)a3;
- (void)_notifyObserversDidEndFocusOnBulletinViewController:(id)a3;
- (void)_notifyObserversWillPresentBulletinViewController:(id)a3;
- (void)_registerBulletinPausedAssertion:(id)a3;
- (void)_setAcceptsEventFocus:(BOOL)a3 forViewController:(id)a4;
- (void)_startTimerForViewController:(id)a3 withTimeout:(double)a4;
- (void)_updateActivationGestures;
- (void)activateCurrentBulletin;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dismissBulletinViewController:(id)a3;
- (void)dismissBulletinWithInfo:(id)a3;
- (void)overlayController:(id)a3 didCancelSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 didPresentSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)presentBulletinWithUIProvider:(id)a3 bulletinInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setCurrentBulletinActive:(BOOL)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)setInteractiveBulletinSceneDeactivationAssertion:(id)a3;
- (void)updateBulletinViewControllerTimeout:(id)a3 timeoutInSeconds:(double)a4;
@end

@implementation PBBulletinManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100066CD0;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066D68;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470240 != -1) {
    dispatch_once(&qword_100470240, block);
  }
  return (id)qword_100470238;
}

- (PBBulletinManager)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBBulletinManager;
  v2 = -[PBBulletinManager init](&v29, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    identifiersToBulletinInfos = v2->_identifiersToBulletinInfos;
    v2->_identifiersToBulletinInfos = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v2->_observers;
    v2->_observers = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    pausedAssertions = v2->_pausedAssertions;
    v2->_pausedAssertions = (NSHashTable *)v7;

    objc_initWeak(&location, v2);
    v9 = (objc_class *)objc_opt_class(v2);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%p)", v11, v2));

    v13 = &_dispatch_main_q;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100066FFC;
    v26[3] = &unk_1003D04B8;
    objc_copyWeak(&v27, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v12, v26);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v15;

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100067050;
    v24[3] = &unk_1003D0FA8;
    v17 = v2;
    v25 = v17;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v17,  v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100067104;
    v22[3] = &unk_1003D1020;
    objc_copyWeak(&v23, &location);
    v19 = (PBSystemGestureHandle *)[v18 newHandleForSystemGesture:36 actionHandler:v22];
    dismissGesture = v17->_dismissGesture;
    v17->_dismissGesture = v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBBulletinManager;
  -[PBBulletinManager dealloc](&v3, "dealloc");
}

- (UIApplicationSceneDeactivationAssertion)interactiveBulletinSceneDeactivationAssertion
{
  interactiveBulletinSceneDeactivationAssertion = self->_interactiveBulletinSceneDeactivationAssertion;
  if (!interactiveBulletinSceneDeactivationAssertion)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneDeactivationManager]);
    v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:6];
    uint64_t v7 = self->_interactiveBulletinSceneDeactivationAssertion;
    self->_interactiveBulletinSceneDeactivationAssertion = v6;

    interactiveBulletinSceneDeactivationAssertion = self->_interactiveBulletinSceneDeactivationAssertion;
  }

  return interactiveBulletinSceneDeactivationAssertion;
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (BOOL)isCurrentBulletinActive
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentPresentingViewController]);
    unsigned __int8 v7 = [v6 acceptsEventFocus];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)shouldActivateCurrentBulletinForAction:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  if (v6)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bulletinViewController]);
    BOOL v9 = +[PBBulletinService applicationShouldActivateBulletinViewController:forAction:]( &OBJC_CLASS___PBBulletinService,  "applicationShouldActivateBulletinViewController:forAction:",  v8,  a3);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)activateCurrentBulletin
{
  if (!-[PBBulletinManager isCurrentBulletinActive](self, "isCurrentBulletinActive"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bulletinViewController]);
      if ((id)+[PBBulletinService applicationActivateBulletinViewController:]( &OBJC_CLASS___PBBulletinService,  "applicationActivateBulletinViewController:",  v6) == (id)1)
      {
        -[PBBulletinManager _cancelTimer](self, "_cancelTimer");
        unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 contentPresentingViewController]);
        -[PBBulletinManager _setAcceptsEventFocus:forViewController:]( self,  "_setAcceptsEventFocus:forViewController:",  1LL,  v7);
        -[PBBulletinManager _notifyObserversDidBeginFocusOnBulletinViewController:]( self,  "_notifyObserversDidBeginFocusOnBulletinViewController:",  v6);
      }
    }
  }

- (BOOL)dismissOrShrinkCurrentBulletin
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (v4)
  {
    id v5 = sub_100082754();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "dismissOrShrinkCurrentBulletin activeIdentifier=%{public}@",  (uint8_t *)&v15,  0xCu);
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentPresentingViewController]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bulletinViewController]);
    if ([v8 acceptsEventFocus])
    {
      -[PBBulletinManager _setAcceptsEventFocus:forViewController:]( self,  "_setAcceptsEventFocus:forViewController:",  0LL,  v8);
      +[PBBulletinService applicationDeactivateBulletinViewController:]( &OBJC_CLASS___PBBulletinService,  "applicationDeactivateBulletinViewController:",  v9);
      +[PBBulletinService applicationToggleBulletinViewControllerSize:]( &OBJC_CLASS___PBBulletinService,  "applicationToggleBulletinViewControllerSize:",  v9);
      [v7 timeoutInSeconds];
      -[PBBulletinManager _startTimerForViewController:withTimeout:]( self,  "_startTimerForViewController:withTimeout:",  v9,  v10 * 0.5);
      -[PBBulletinManager _notifyObserversDidEndFocusOnBulletinViewController:]( self,  "_notifyObserversDidEndFocusOnBulletinViewController:",  v9);
      BOOL v11 = 1;
    }

    else
    {
      BOOL v11 = +[PBBulletinService applicationDismissBulletinViewController:]( &OBJC_CLASS___PBBulletinService,  "applicationDismissBulletinViewController:",  v9);
    }

    id v12 = sub_100082754();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109120;
      LODWORD(v16) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "dismissOrShrinkCurrentBulletin didHandle=%d",  (uint8_t *)&v15,  8u);
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)handleBackButton
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (!v4) {
    goto LABEL_10;
  }
  id v5 = sub_100082754();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "handleBackButton activeIdentifier=%{public}@",  buf,  0xCu);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentPresentingViewController]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bulletinViewController]);
  unsigned int v10 = [v8 acceptsEventFocus];
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000677E0;
    v15[3] = &unk_1003CFEE0;
    v15[4] = self;
    +[PBBulletinService applicationBulletinHandleMenuButtonForViewController:withCompletion:]( &OBJC_CLASS___PBBulletinService,  "applicationBulletinHandleMenuButtonForViewController:withCompletion:",  v9,  v15);
  }

  id v11 = sub_100082754();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "handleBackButton didHandle=%d", buf, 8u);
  }

  if ((v10 & 1) != 0) {
    BOOL v13 = 1;
  }
  else {
LABEL_10:
  }
    BOOL v13 = -[PBBulletinManager dismissOrShrinkCurrentBulletin](self, "dismissOrShrinkCurrentBulletin");

  return v13;
}

- (void)addObserver:(id)a3
{
  id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
}

- (void)overlayController:(id)a3 didPresentSession:(id)a4
{
  id v5 = a4;
  id v6 = sub_100082754();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100275A70(v5, v7);
  }

  identifiersToBulletinInfos = self->_identifiersToBulletinInfos;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](identifiersToBulletinInfos, "objectForKey:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bulletinViewController]);
  [v10 timeoutInSeconds];
  -[PBBulletinManager _startTimerForViewController:withTimeout:](self, "_startTimerForViewController:withTimeout:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bulletinViewController]);
  -[PBBulletinManager _notifyObserversWillPresentBulletinViewController:]( self,  "_notifyObserversWillPresentBulletinViewController:",  v12);

  -[PBBulletinManager _updateActivationGestures](self, "_updateActivationGestures");
  if (([v10 isVideoBulletin] & 1) != 0
    || [v10 isMultiCamBulletin])
  {
    -[BSInvalidatable invalidate](self->_systemHomeUIServicePreheatAssertion, "invalidate");
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeUIManager sharedInstance](&OBJC_CLASS___PBHomeUIManager, "sharedInstance"));
    uint64_t v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v13 preheatSystemHomeUIServiceForReason:@"TVSystemBulletinService"]);
    systemHomeUIServicePreheatAssertion = self->_systemHomeUIServicePreheatAssertion;
    self->_systemHomeUIServicePreheatAssertion = v14;
  }
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  id v5 = a4;
  id v6 = sub_100082754();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100275AF0(v5, v7);
  }

  identifiersToBulletinInfos = self->_identifiersToBulletinInfos;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](identifiersToBulletinInfos, "objectForKey:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bulletinViewController]);
  -[PBBulletinManager _notifyObserversDidDismissBulletinViewController:]( self,  "_notifyObserversDidDismissBulletinViewController:",  v11);

  id v12 = self->_identifiersToBulletinInfos;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

  -[PBSystemGestureHandle relinquish](self->_dismissGesture, "relinquish");
  -[PBBulletinManager _updateActivationGestures](self, "_updateActivationGestures");
  -[BSInvalidatable invalidate](self->_systemHomeUIServicePreheatAssertion, "invalidate");
  systemHomeUIServicePreheatAssertion = self->_systemHomeUIServicePreheatAssertion;
  self->_systemHomeUIServicePreheatAssertion = 0LL;
}

- (void)overlayController:(id)a3 didCancelSession:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = sub_100082754();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100275B70(v6, v8);
  }

  identifiersToBulletinInfos = self->_identifiersToBulletinInfos;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary removeObjectForKey:](identifiersToBulletinInfos, "removeObjectForKey:", v10);
}

- (void)presentBulletinWithUIProvider:(id)a3 bulletinInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v8, "setIdentifier:", v10);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v8, "setAnimated:", 0LL);
  -[PBMutableSystemOverlayPresentationRequest _setInsertAtFrontOfQueue:]( v8,  "_setInsertAtFrontOfQueue:",  [v6 insertAtFrontOfQueue]);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v8, "setProvider:", v7);

  id v11 = sub_1000F7C6C();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[PBMutableSystemOverlayPresentationRequest setSignpostLog:](v8, "setSignpostLog:", v12);

  identifiersToBulletinInfos = self->_identifiersToBulletinInfos;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayPresentationRequest identifier](v8, "identifier"));
  -[NSMutableDictionary setObject:forKey:](identifiersToBulletinInfos, "setObject:forKey:", v6, v14);

  id v15 = sub_100082754();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100275BF0(v8, v16);
  }

  -[PBSystemOverlayController presentWithRequest:completion:]( self->_overlayController,  "presentWithRequest:completion:",  v8,  0LL);
}

- (void)updateBulletinViewControllerTimeout:(id)a3 timeoutInSeconds:(double)a4
{
  id v6 = a3;
  id v7 = sub_100082754();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100275C70();
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_identifiersToBulletinInfos, "allKeys", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v14));
        id v16 = (id)objc_claimAutoreleasedReturnValue([v15 bulletinViewController]);

        if (v16 == v6)
        {
          [v15 setTimeoutInSeconds:a4];
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
          unsigned int v19 = [v14 isEqual:v18];

          if (v19)
          {
            -[PBBulletinManager _cancelTimer](self, "_cancelTimer");
            v20 = (void *)objc_claimAutoreleasedReturnValue([v15 contentPresentingViewController]);
            unsigned __int8 v21 = [v20 acceptsEventFocus];

            if ((v21 & 1) == 0) {
              -[PBBulletinManager _startTimerForViewController:withTimeout:]( self,  "_startTimerForViewController:withTimeout:",  v6,  a4);
            }

            goto LABEL_16;
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (void)dismissBulletinViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082754();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100275D38();
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_identifiersToBulletinInfos, "allKeys", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v12));
        id v14 = (id)objc_claimAutoreleasedReturnValue([v13 bulletinViewController]);

        if (v14 == v4)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 contentPresentingViewController]);
          if ([v15 acceptsEventFocus])
          {
            -[PBBulletinManager _setAcceptsEventFocus:forViewController:]( self,  "_setAcceptsEventFocus:forViewController:",  0LL,  v15);
            -[PBBulletinManager _notifyObserversDidEndFocusOnBulletinViewController:]( self,  "_notifyObserversDidEndFocusOnBulletinViewController:",  v4);
          }

          id v16 = sub_100082754();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_100275CD4();
          }

          v18 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
          -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v18, "setIdentifier:", v12);
          -[PBMutableSystemOverlayDismissalRequest setAnimated:](v18, "setAnimated:", 0LL);
          overlayController = self->_overlayController;
          id v20 = -[PBMutableSystemOverlayDismissalRequest copy](v18, "copy");
          -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v20,  0LL);

          goto LABEL_17;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)dismissBulletinWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082754();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100275D9C();
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_identifiersToBulletinInfos, "allKeys", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToBulletinInfos, "objectForKey:", v12));
        if (v13 == v4)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 contentPresentingViewController]);
          if ([v14 acceptsEventFocus])
          {
            -[PBBulletinManager _setAcceptsEventFocus:forViewController:]( self,  "_setAcceptsEventFocus:forViewController:",  0LL,  v14);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 bulletinViewController]);
            -[PBBulletinManager _notifyObserversDidEndFocusOnBulletinViewController:]( self,  "_notifyObserversDidEndFocusOnBulletinViewController:",  v15);
          }

          id v16 = sub_100082754();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_100275CD4();
          }

          v18 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
          -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v18, "setIdentifier:", v12);
          -[PBMutableSystemOverlayDismissalRequest setAnimated:](v18, "setAnimated:", 0LL);
          overlayController = self->_overlayController;
          id v20 = -[PBMutableSystemOverlayDismissalRequest copy](v18, "copy");
          -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v20,  0LL);

          goto LABEL_17;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)_registerBulletinPausedAssertion:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSHashTable count](self->_pausedAssertions, "count");
  -[NSHashTable addObject:](self->_pausedAssertions, "addObject:", v4);
  NSUInteger v6 = -[NSHashTable count](self->_pausedAssertions, "count");
  id v7 = sub_1000827CC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
    int v10 = 134218498;
    NSUInteger v11 = v5;
    __int16 v12 = 2048;
    NSUInteger v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Register bulletin paused assertion (%lu->%lu) {assertion.reason=%{public}@}",  (uint8_t *)&v10,  0x20u);
  }

  if (!v5 && v6 == 1) {
    -[PBSystemOverlayController pauseWithOptions:](self->_overlayController, "pauseWithOptions:", 0LL);
  }
}

- (void)_deregisterBulletinPausedAssertion:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSHashTable count](self->_pausedAssertions, "count");
  -[NSHashTable removeObject:](self->_pausedAssertions, "removeObject:", v4);
  NSUInteger v6 = -[NSHashTable count](self->_pausedAssertions, "count");
  id v7 = sub_1000827CC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
    int v10 = 134218498;
    NSUInteger v11 = v5;
    __int16 v12 = 2048;
    NSUInteger v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deregister bulletin paused assertion (%lu->%lu) {assertion.reason=%{public}@}",  (uint8_t *)&v10,  0x20u);
  }

  if (v5 == 1 && !v6) {
    -[PBSystemOverlayController resume](self->_overlayController, "resume");
  }
}

- (void)_startTimerForViewController:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (a4 > 0.0)
  {
    -[PBBulletinManager _cancelTimer](self, "_cancelTimer");
    id v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    bulletinDismissalTimer = self->_bulletinDismissalTimer;
    self->_bulletinDismissalTimer = v7;

    id v9 = self->_bulletinDismissalTimer;
    double v10 = a4 * 1000000000.0;
    dispatch_time_t v11 = dispatch_time(0LL, llround(v10));
    dispatch_source_set_timer((dispatch_source_t)v9, v11, (uint64_t)v10, 0x3B9ACA00uLL);
    __int16 v12 = self->_bulletinDismissalTimer;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000685BC;
    v13[3] = &unk_1003CFEB8;
    v13[4] = self;
    id v14 = v6;
    dispatch_source_set_event_handler((dispatch_source_t)v12, v13);
    dispatch_resume((dispatch_object_t)self->_bulletinDismissalTimer);
  }
}

- (void)_cancelTimer
{
  bulletinDismissalTimer = self->_bulletinDismissalTimer;
  if (bulletinDismissalTimer)
  {
    dispatch_source_cancel((dispatch_source_t)bulletinDismissalTimer);
    id v4 = self->_bulletinDismissalTimer;
    self->_bulletinDismissalTimer = 0LL;
  }

- (void)_setAcceptsEventFocus:(BOOL)a3 forViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([v6 acceptsEventFocus] != v4)
  {
    if (v4)
    {
      -[PBBulletinManager _createIdleTimerAssertion](self, "_createIdleTimerAssertion");
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager interactiveBulletinSceneDeactivationAssertion]( self,  "interactiveBulletinSceneDeactivationAssertion"));
      [v7 acquire];

      id v8 = sub_100083C30();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager interactiveBulletinSceneDeactivationAssertion]( self,  "interactiveBulletinSceneDeactivationAssertion"));
        uint64_t v11 = UIApplicationSceneDeactivationReasonDescription([v10 reason]);
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        int v17 = 138543362;
        v18 = v12;
        NSUInteger v13 = "Acquired scene assertion for reason: %{public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, 0xCu);
      }
    }

    else
    {
      -[PBBulletinManager _invalidateIdleTimerAssertion](self, "_invalidateIdleTimerAssertion");
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager interactiveBulletinSceneDeactivationAssertion]( self,  "interactiveBulletinSceneDeactivationAssertion"));
      [v14 relinquish];

      id v15 = sub_100083C30();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager interactiveBulletinSceneDeactivationAssertion]( self,  "interactiveBulletinSceneDeactivationAssertion"));
        uint64_t v16 = UIApplicationSceneDeactivationReasonDescription([v10 reason]);
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v17 = 138543362;
        v18 = v12;
        NSUInteger v13 = "Relinquished scene assertion for reason: %{public}@";
        goto LABEL_7;
      }
    }

    [v6 setAcceptsEventFocus:v4];
  }
}

- (void)_createIdleTimerAssertion
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068838;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_invalidateIdleTimerAssertion
{
  idleTimerAssertion = self->_idleTimerAssertion;
  if (idleTimerAssertion)
  {
    -[BSInvalidatable invalidate](idleTimerAssertion, "invalidate");
    BOOL v4 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0LL;
  }

- (void)_updateActivationGestures
{
  if (-[PBBulletinManager shouldActivateCurrentBulletinForAction:]( self,  "shouldActivateCurrentBulletinForAction:",  2LL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager _activateTVButtonGestureCreatingIfNeeded]( self,  "_activateTVButtonGestureCreatingIfNeeded"));
    [v3 acquire];
  }

  else
  {
    -[PBSystemGestureHandle relinquish](self->_activateTVButtonGesture, "relinquish");
  }

  if (-[PBBulletinManager shouldActivateCurrentBulletinForAction:]( self,  "shouldActivateCurrentBulletinForAction:",  4LL))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager _activateGameControllerHomeGestureCreatingIfNeeded]( self,  "_activateGameControllerHomeGestureCreatingIfNeeded"));
    [v4 acquire];
  }

  else
  {
    -[PBSystemGestureHandle relinquish](self->_activateGameControllerHomeGesture, "relinquish");
  }

- (id)_bulletinActivationGestureActionHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100068A28;
  v4[3] = &unk_1003D1020;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_createBulletinActivationGestureHandle:(unint64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager _bulletinActivationGestureActionHandler]( self,  "_bulletinActivationGestureActionHandler"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  id v6 = [v5 newHandleForSystemGesture:a3 actionHandler:v4];

  return v6;
}

- (id)_activateTVButtonGestureCreatingIfNeeded
{
  activateTVButtonGesture = self->_activateTVButtonGesture;
  if (!activateTVButtonGesture)
  {
    BOOL v4 = (PBSystemGestureHandle *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager _createBulletinActivationGestureHandle:]( self,  "_createBulletinActivationGestureHandle:",  37LL));
    id v5 = self->_activateTVButtonGesture;
    self->_activateTVButtonGesture = v4;

    activateTVButtonGesture = self->_activateTVButtonGesture;
  }

  return activateTVButtonGesture;
}

- (id)_activateGameControllerHomeGestureCreatingIfNeeded
{
  activateGameControllerHomeGesture = self->_activateGameControllerHomeGesture;
  if (!activateGameControllerHomeGesture)
  {
    BOOL v4 = (PBSystemGestureHandle *)objc_claimAutoreleasedReturnValue( -[PBBulletinManager _createBulletinActivationGestureHandle:]( self,  "_createBulletinActivationGestureHandle:",  38LL));
    id v5 = self->_activateGameControllerHomeGesture;
    self->_activateGameControllerHomeGesture = v4;

    activateGameControllerHomeGesture = self->_activateGameControllerHomeGesture;
  }

  return activateGameControllerHomeGesture;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 =  [v3 appendCollection:self->_pausedAssertions withKey:@"pausedAssertions" skipIfEmpty:0];
  return v3;
}

- (void)_notifyObserversWillPresentBulletinViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[PBBulletinService applicationActivationActionsForBulletinViewController:]( &OBJC_CLASS___PBBulletinService,  "applicationActivationActionsForBulletinViewController:",  v4);
  observers = self->_observers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100068C4C;
  v8[3] = &unk_1003D2818;
  v8[4] = self;
  id v9 = v4;
  unint64_t v10 = v5;
  id v7 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v8);
}

- (void)_notifyObserversDidDismissBulletinViewController:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100068D10;
  v7[3] = &unk_1003D2840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

- (void)_notifyObserversDidBeginFocusOnBulletinViewController:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100068DD0;
  v7[3] = &unk_1003D2840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

- (void)_notifyObserversDidEndFocusOnBulletinViewController:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100068E90;
  v7[3] = &unk_1003D2840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

- (void)setCurrentBulletinActive:(BOOL)a3
{
  self->_currentBulletinActive = a3;
}

- (NSMutableDictionary)identifiersToBulletinInfos
{
  return self->_identifiersToBulletinInfos;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (OS_dispatch_source)bulletinDismissalTimer
{
  return self->_bulletinDismissalTimer;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (NSHashTable)pausedAssertions
{
  return self->_pausedAssertions;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setInteractiveBulletinSceneDeactivationAssertion:(id)a3
{
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (PBSystemGestureHandle)activateTVButtonGesture
{
  return self->_activateTVButtonGesture;
}

- (PBSystemGestureHandle)activateGameControllerHomeGesture
{
  return self->_activateGameControllerHomeGesture;
}

- (BSInvalidatable)systemHomeUIServicePreheatAssertion
{
  return self->_systemHomeUIServicePreheatAssertion;
}

- (void).cxx_destruct
{
}

@end