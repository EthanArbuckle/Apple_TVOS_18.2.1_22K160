@interface ZWUIServer
+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3;
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXDispatchTimer)keyboardHideTimer;
- (NSMutableArray)externalWindowScenes;
- (NSMutableDictionary)zoomRootViewControllers;
- (OS_dispatch_group)showHideGroup;
- (OS_dispatch_queue)showHideQueue;
- (ZWUIServer)init;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_showingOrHidingControllerWillBegin;
- (void)_showingOrHidingControllerWillEnd;
- (void)_waitForControllerShowHideToComplete:(id)a3;
- (void)dealloc;
- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:(BOOL)a3;
- (void)setExternalWindowScenes:(id)a3;
- (void)setKeyboardHideTimer:(id)a3;
- (void)setShowHideGroup:(id)a3;
- (void)setShowHideQueue:(id)a3;
- (void)updateZoomListeners:(id)a3;
@end

@implementation ZWUIServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  return (id)sharedInstance__service;
}

void __28__ZWUIServer_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___ZWUIServer);
  v2 = (void *)sharedInstance__service;
  sharedInstance__service = (uint64_t)v1;
}

- (ZWUIServer)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ZWUIServer;
  v2 = -[ZWUIServer init](&v21, "init");
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)_appTransitionOccurred,  @"com.apple.mobile.SubstantialTransition",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:]( &OBJC_CLASS___UIPopoverPresentationController,  "_setAlwaysAllowPopoverPresentations:",  1LL);
    dispatch_group_t v4 = dispatch_group_create();
    -[ZWUIServer setShowHideGroup:](v2, "setShowHideGroup:", v4);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.Zoom.ShowHide", 0LL);
    -[ZWUIServer setShowHideQueue:](v2, "setShowHideQueue:", v5);

    v6 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWUIServer setKeyboardHideTimer:](v2, "setKeyboardHideTimer:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[ZWUIServer setExternalWindowScenes:](v2, "setExternalWindowScenes:", v7);

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    zoomListeners = v2->_zoomListeners;
    v2->_zoomListeners = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    zoomAttributeListeners = v2->_zoomAttributeListeners;
    v2->_zoomAttributeListeners = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessibility.zoom.update_listeners", 0LL);
    zoomListenersUpdateQueue = v2->_zoomListenersUpdateQueue;
    v2->_zoomListenersUpdateQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.accessibility.zoom.focused_apps_retrieval", 0LL);
    focusedAppsRetrievalQueue = v2->_focusedAppsRetrievalQueue;
    v2->_focusedAppsRetrievalQueue = (OS_dispatch_queue *)v14;

    v16 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  v2->_zoomListenersUpdateQueue);
    zoomListenerUpdateTimer = v2->_zoomListenerUpdateTimer;
    v2->_zoomListenerUpdateTimer = v16;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_zoomListenerUpdateTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v18 = objc_alloc_init(&OBJC_CLASS___AXDispatchTimer);
    zoomServicesUpdate = v2->_zoomServicesUpdate;
    v2->_zoomServicesUpdate = v18;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.SubstantialTransition", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWUIServer;
  -[ZWUIServer dealloc](&v4, "dealloc");
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ZWRootViewController);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  double result = UIWindowLevelNormal;
  if ((isKindOfClass & 1) != 0) {
    return 10000016.0;
  }
  return result;
}

- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  zoomRootViewControllers = self->_zoomRootViewControllers;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _sceneIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( zoomRootViewControllers,  "objectForKeyedSubscript:",  v7));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer externalWindowScenes](self, "externalWindowScenes"));
    [v9 addObject:v5];

    v10 = objc_alloc(&OBJC_CLASS___ZWRootViewController);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 screen]);
    dispatch_queue_t v12 = -[ZWRootViewController initWithAXUIService:onScreen:isMainDisplay:]( v10,  "initWithAXUIService:onScreen:isMainDisplay:",  self,  v11,  0LL);

    v13 = self->_zoomRootViewControllers;
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 _sceneIdentifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_zoomRootViewControllers,  "objectForKeyedSubscript:",  @"MAIN-DISPLAY"));
    if ([v15 isZoomLensVisible])
    {
      -[ZWUIServer _showingOrHidingControllerWillBegin](self, "_showingOrHidingControllerWillBegin");
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      [v16 addContentViewController:v12 withUserInteractionEnabled:1 forService:self context:0 userInterfaceStyle:1 forWindowScene:v5 completion:0];

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
      unsigned __int8 v18 = [v17 ignoreLogging];

      if ((v18 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
        uint64_t v20 = AXLoggerForFacility();
        objc_super v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

        os_log_type_t v22 = AXOSLogLevelFromAXLogLevel(2LL);
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = AXColorizeFormatLog( 2LL,  @"Showing zoom window. Root view bounds: %@, Window bounds: %@, Orientation we have: %ld");
          v34 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](v12, "view"));
          [v33 bounds];
          v24 = NSStringFromCGRect(v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          os_log_type_t v32 = v22;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](v12, "view"));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 window]);
          [v27 bounds];
          v28 = NSStringFromCGRect(v39);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v28);
          -[ZWRootViewController interfaceOrientation](v12, "interfaceOrientation");
          uint64_t v29 = _AXStringForArgs(v34);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

          if (os_log_type_enabled(v21, v32))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v30;
            _os_log_impl(&dword_0, v21, v32, "%{public}@", buf, 0xCu);
          }
        }
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = __69__ZWUIServer_externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke;
      v35[3] = &unk_6CBC0;
      v35[4] = self;
      -[ZWRootViewController showZoomSlugAndLens:completion:](v12, "showZoomSlugAndLens:completion:", 1LL, v35);
    }
  }
}

id __69__ZWUIServer_externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showingOrHidingControllerWillEnd];
}

- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer externalWindowScenes](self, "externalWindowScenes"));
  [v6 removeObject:v5];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _sceneIdentifier]);

  [v8 removeObjectForKey:v7];
}

- (void)updateZoomListeners:(id)a3
{
  id v4 = a3;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ZWAttributeKeyDisplayID]);
  zoomListenersUpdateQueue = (dispatch_queue_s *)self->_zoomListenersUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__ZWUIServer_updateZoomListeners___block_invoke;
  block[3] = &unk_6CF90;
  uint64_t v20 = v24;
  block[4] = self;
  id v7 = v5;
  id v18 = v7;
  objc_super v21 = v22;
  id v8 = v4;
  id v19 = v8;
  dispatch_sync(zoomListenersUpdateQueue, block);
  objc_initWeak(&location, self);
  zoomListenerUpdateTimer = self->_zoomListenerUpdateTimer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __34__ZWUIServer_updateZoomListeners___block_invoke_2;
  v12[3] = &unk_6CFE0;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  -[AXDispatchTimer afterDelay:processBlock:](zoomListenerUpdateTimer, "afterDelay:processBlock:", v12, 0.25);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __34__ZWUIServer_updateZoomListeners___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v9 = *(id *)(a1 + 48);
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v14]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v14]);
          unsigned __int8 v17 = [v15 isEqual:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v14]);
            if ([v18 count]) {
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) unionSet:v18];
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v11);
    }
  }

  v27 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v19 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIClientMessenger clientMessengerWithIdentifier:]( &OBJC_CLASS___AXUIClientMessenger,  "clientMessengerWithIdentifier:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)j)));
        uint64_t v25 = *(void *)(a1 + 48);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
        [v24 sendAsynchronousMessage:v25 withIdentifier:3000 targetAccessQueue:v26 completionRequiresWritingBlock:0 completion:0];
      }

      id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v21);
  }
}

void __34__ZWUIServer_updateZoomListeners___block_invoke_2(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = (dispatch_queue_s *)WeakRetained[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__ZWUIServer_updateZoomListeners___block_invoke_3;
  block[3] = &unk_6CFB8;
  block[4] = WeakRetained;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async(v3, block);
}

id __34__ZWUIServer_updateZoomListeners___block_invoke_3(void *a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1[4] + 16LL);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIClientMessenger clientMessengerWithIdentifier:]( &OBJC_CLASS___AXUIClientMessenger,  "clientMessengerWithIdentifier:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v6),  (void)v11));
        uint64_t v8 = a1[5];
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
        [v7 sendAsynchronousMessage:v8 withIdentifier:3000 targetAccessQueue:v9 completionRequiresWritingBlock:0 completion:0];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  return [*(id *)(a1[4] + 32) setObject:a1[5] forKeyedSubscript:a1[6]];
}

- (void)notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateDockedZoomRegionVisibility:v3];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)_waitForControllerShowHideToComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWUIServer showHideQueue](self, "showHideQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __51__ZWUIServer__waitForControllerShowHideToComplete___block_invoke;
  v7[3] = &unk_6CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__ZWUIServer__waitForControllerShowHideToComplete___block_invoke(uint64_t a1)
{
  id v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showHideGroup]);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  dispatch_sync(&_dispatch_main_q, *(dispatch_block_t *)(a1 + 40));
}

- (void)_showingOrHidingControllerWillBegin
{
  id v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[ZWUIServer showHideGroup](self, "showHideGroup"));
  dispatch_group_enter(v2);
}

- (void)_showingOrHidingControllerWillEnd
{
  id v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[ZWUIServer showHideGroup](self, "showHideGroup"));
  dispatch_group_leave(v2);
}

- (NSMutableDictionary)zoomRootViewControllers
{
  zoomRootViewControllers = self->_zoomRootViewControllers;
  if (!zoomRootViewControllers)
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v5 = self->_zoomRootViewControllers;
    self->_zoomRootViewControllers = v4;

    id v6 = objc_alloc(&OBJC_CLASS___ZWRootViewController);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v8 = -[ZWRootViewController initWithAXUIService:onScreen:isMainDisplay:]( v6,  "initWithAXUIService:onScreen:isMainDisplay:",  self,  v7,  1LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_zoomRootViewControllers,  "setObject:forKeyedSubscript:",  v8,  @"MAIN-DISPLAY");

    zoomRootViewControllers = self->_zoomRootViewControllers;
  }

  return zoomRootViewControllers;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  id result = 0LL;
  if ((uint64_t)a3 <= 2199)
  {
    switch(a3)
    {
      case 0x7D3uLL:
      case 0x7D7uLL:
      case 0x7D8uLL:
        return @"com.apple.accessibility.SpringBoard";
      case 0x7D4uLL:
      case 0x7D5uLL:
      case 0x7D6uLL:
      case 0x7D9uLL:
      case 0x7DAuLL:
      case 0x7DBuLL:
      case 0x7DCuLL:
      case 0x7DFuLL:
      case 0x7E1uLL:
      case 0x7E2uLL:
        return result;
      case 0x7DDuLL:
      case 0x7DEuLL:
        id result = @"com.apple.accessibility.voiceover";
        break;
      case 0x7E0uLL:
        id result = @"com.apple.springboard.inCallPresentation";
        break;
      case 0x7E3uLL:
      case 0x7E4uLL:
      case 0x7E5uLL:
        return @"com.apple.accessibility.zoom.client";
      default:
        if (a3 - 1000 >= 2) {
          id result = 0LL;
        }
        else {
          id result = @"com.apple.accessibility.BackBoard";
        }
        break;
    }
  }

  else
  {
    char v4 = a3 + 59;
    if (a3 - 2501 <= 0xD)
    {
      if (((1LL << v4) & 0x3C03) != 0) {
        return @"com.apple.accessibility.SpringBoard";
      }
      if (((1LL << v4) & 0x3C0) != 0) {
        return @"com.apple.accessibility.Carousel";
      }
    }

    if (a3 - 2200 < 4) {
      return @"com.apple.accessibility.zoom.client";
    }
  }

  return result;
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 - 2004 <= 0xB && ((1LL << (a3 + 44)) & 0x821) != 0)
  {
    uint64_t v5 = &off_6F390;
  }

  else
  {
    if (a3 != 2500) {
      return 0LL;
    }
    uint64_t v5 = &off_6F378;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5, v3, v4));
}

+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  BOOL result = 1;
  return result;
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  __int128 v10 = v9;
  if ((uint64_t)a4 > 2199)
  {
    v40 = 0LL;
    switch(a4)
    {
      case 0x9C4uLL:
      case 0x9C5uLL:
      case 0x9C6uLL:
      case 0x9CBuLL:
      case 0x9D0uLL:
      case 0x9D1uLL:
      case 0x9D2uLL:
        goto LABEL_207;
      case 0x9C7uLL:
      case 0x9C8uLL:
      case 0x9C9uLL:
      case 0x9CAuLL:
LABEL_39:
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected message sent: %@",  v26));
        v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Zoom Exception",  v64,  0LL));
        [v65 raise];

        goto LABEL_265;
      case 0x9CCuLL:
        __int128 v380 = 0u;
        __int128 v379 = 0u;
        __int128 v378 = 0u;
        __int128 v377 = 0u;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 allValues]);

        id v43 = [v42 countByEnumeratingWithState:&v377 objects:v437 count:16];
        if (v43)
        {
          id v44 = v43;
          uint64_t v45 = *(void *)v378;
          do
          {
            for (i = 0LL; i != v44; i = (char *)i + 1)
            {
              if (*(void *)v378 != v45) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v377 + 1) + 8 * (void)i) handleDeviceReturnedToClockAtIdle];
            }

            id v44 = [v42 countByEnumeratingWithState:&v377 objects:v437 count:16];
          }

          while (v44);
        }

        goto LABEL_205;
      case 0x9CDuLL:
        __int128 v376 = 0u;
        __int128 v375 = 0u;
        __int128 v374 = 0u;
        __int128 v373 = 0u;
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v66 allValues]);

        id v67 = [v42 countByEnumeratingWithState:&v373 objects:v436 count:16];
        if (v67)
        {
          id v68 = v67;
          uint64_t v69 = *(void *)v374;
          do
          {
            for (j = 0LL; j != v68; j = (char *)j + 1)
            {
              if (*(void *)v374 != v69) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v373 + 1) + 8 * (void)j) handleCarouselLockBegan];
            }

            id v68 = [v42 countByEnumeratingWithState:&v373 objects:v436 count:16];
          }

          while (v68);
        }

        goto LABEL_205;
      case 0x9CEuLL:
        __int128 v372 = 0u;
        __int128 v371 = 0u;
        __int128 v370 = 0u;
        __int128 v369 = 0u;
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v71 allValues]);

        id v72 = [v42 countByEnumeratingWithState:&v369 objects:v435 count:16];
        if (v72)
        {
          id v73 = v72;
          uint64_t v74 = *(void *)v370;
          do
          {
            for (k = 0LL; k != v73; k = (char *)k + 1)
            {
              if (*(void *)v370 != v74) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v369 + 1) + 8 * (void)k) handleCarouselLockEnded];
            }

            id v73 = [v42 countByEnumeratingWithState:&v369 objects:v435 count:16];
          }

          while (v73);
        }

        goto LABEL_205;
      case 0x9CFuLL:
        __int128 v327 = 0u;
        __int128 v328 = 0u;
        __int128 v325 = 0u;
        __int128 v326 = 0u;
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v76 allValues]);

        id v77 = [v42 countByEnumeratingWithState:&v325 objects:v418 count:16];
        if (v77)
        {
          id v78 = v77;
          uint64_t v79 = *(void *)v326;
          do
          {
            for (m = 0LL; m != v78; m = (char *)m + 1)
            {
              if (*(void *)v326 != v79) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v325 + 1) + 8 * (void)m) handleDeviceWillWake];
            }

            id v78 = [v42 countByEnumeratingWithState:&v325 objects:v418 count:16];
          }

          while (v78);
        }

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke( uint64_t a1)
{
  uint64_t v1 = a1;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomRootViewControllers]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v51;
    uint64_t v40 = v1;
    uint64_t v42 = *(void *)v51;
    do
    {
      id v7 = 0LL;
      id v43 = v5;
      do
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) zoomRootViewControllers]);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

        if (([v10 isZoomLensVisible] & 1) == 0)
        {
          [*(id *)(v1 + 32) _showingOrHidingControllerWillBegin];
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) externalWindowScenes]);
          id v12 = [v11 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v47;
            while (2)
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v47 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
                unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _sceneIdentifier]);
                unsigned int v18 = [v17 isEqualToString:v8];

                if (v18)
                {
                  id v19 = v16;
                  goto LABEL_17;
                }
              }

              id v13 = [v11 countByEnumeratingWithState:&v46 objects:v56 count:16];
              if (v13) {
                continue;
              }
              break;
            }

            id v19 = 0LL;
LABEL_17:
            uint64_t v1 = v40;
          }

          else
          {
            id v19 = 0LL;
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
          [v20 addContentViewController:v10 withUserInteractionEnabled:1 forService:*(void *)(v1 + 32) forSceneClientIdentifier:@"kAXZoomSceneClientIdentifier" context:0 userInterfac eStyle:1 forWindowScene:v19 completion:0];

          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
          unsigned __int8 v22 = [v21 ignoreLogging];

          if ((v22 & 1) == 0)
          {
            double v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
            uint64_t v24 = AXLoggerForFacility();
            double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

            os_log_type_t v26 = AXOSLogLevelFromAXLogLevel(2LL);
            if (os_log_type_enabled(v25, v26))
            {
              uint64_t v27 = AXColorizeFormatLog( 2LL,  @"Showing zoom window. Root view bounds: %@, Window bounds: %@, Orientation we have: %ld");
              v41 = (void *)objc_claimAutoreleasedReturnValue(v27);
              unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
              [v39 bounds];
              __int128 v28 = NSStringFromCGRect(v58);
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              os_log_type_t v38 = v26;
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 window]);
              [v31 bounds];
              __int128 v32 = NSStringFromCGRect(v59);
              v36 = (void *)objc_claimAutoreleasedReturnValue(v32);
              id v37 = [v10 interfaceOrientation];
              __int128 v35 = v29;
              uint64_t v33 = _AXStringForArgs(v41);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

              if (os_log_type_enabled(v25, v38))
              {
                *(_DWORD *)buf = 138543362;
                v55 = v34;
                _os_log_impl(&dword_0, v25, v38, "%{public}@", buf, 0xCu);
              }
            }
          }

          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_221;
          v45[3] = &unk_6CBC0;
          v45[4] = *(void *)(v1 + 32);
          objc_msgSend(v10, "showZoomSlugAndLens:completion:", 1, v45, v35, v36, v37);

          uint64_t v6 = v42;
          id v5 = v43;
        }

        id v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    }

    while (v5);
  }
}

id __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_221( uint64_t a1)
{
  return [*(id *)(a1 + 32) _showingOrHidingControllerWillEnd];
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_2( uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomRootViewControllers]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v8 isZoomLensVisible])
        {
          [*(id *)(a1 + 32) _showingOrHidingControllerWillBegin];
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472LL;
          v10[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_3;
          v10[3] = &unk_6D008;
          uint64_t v9 = *(void *)(a1 + 32);
          v10[4] = v8;
          v10[5] = v9;
          [v8 hideZoomSlugAndLens:1 completion:v10];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

id __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_3( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  [v2 removeContentViewController:*(void *)(a1 + 32) withUserInteractionEnabled:1 forService:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 40) _showingOrHidingControllerWillEnd];
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_4( uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (v2) {
    [v4 addObject:v3];
  }
  else {
    [v4 removeObject:v3];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_5;
  block[3] = &unk_6CDA8;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v8 = *(_BYTE *)(a1 + 48);
  id v7 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_5( uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  int v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoomRootViewControllers", 0));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

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
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) zoomListenerRegisteredForAllAttributeUpdatesCoalesced:*(unsigned __int8 *)(a1 + 48) clientIdentifier:*(void *)(a1 + 40)];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_6( uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        __int128 v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v7]);
        __int128 v9 = v8;
        if (*(_BYTE *)(a1 + 56))
        {
          if (!v8)
          {
            __int128 v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
            [*(id *)(*(void *)(a1 + 40) + 24) setObject:v9 forKey:v7];
          }

          -[NSMutableSet addObject:](v9, "addObject:", *(void *)(a1 + 48));
        }

        else
        {
          -[NSMutableSet removeObject:](v8, "removeObject:", *(void *)(a1 + 48));
          id v10 = -[NSMutableSet count](v9, "count");
          __int128 v11 = *(void **)(*(void *)(a1 + 40) + 24LL);
          if (v10) {
            [v11 setObject:v9 forKey:*(void *)(a1 + 48)];
          }
          else {
            [v11 removeObjectForKey:v7];
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_7;
  block[3] = &unk_6D030;
  int8x16_t v13 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v13.i64[0];
  int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
  char v17 = *(_BYTE *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  dispatch_async(&_dispatch_main_q, block);
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_7( uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoomRootViewControllers", 0));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) zoomListenerRegisteredForAttributeUpdatesImmediately:*(void *)(a1 + 40) registered:*(unsigned __int8 *)(a1 + 56) clientIdentifier:*(void *)(a1 + 48)];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (OS_dispatch_group)showHideGroup
{
  return self->_showHideGroup;
}

- (void)setShowHideGroup:(id)a3
{
}

- (OS_dispatch_queue)showHideQueue
{
  return self->_showHideQueue;
}

- (void)setShowHideQueue:(id)a3
{
}

- (AXDispatchTimer)keyboardHideTimer
{
  return self->_keyboardHideTimer;
}

- (void)setKeyboardHideTimer:(id)a3
{
}

- (NSMutableArray)externalWindowScenes
{
  return self->_externalWindowScenes;
}

- (void)setExternalWindowScenes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end