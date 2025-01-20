@interface PBDialogManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)dismissActiveDialog;
- (BOOL)dismissActiveDialogAnimated:(BOOL)a3 completion:(id)a4;
- (BOOL)isPresenting;
- (NSHashTable)observers;
- (NSMutableArray)hiddenDialogAssertions;
- (NSMutableDictionary)identifiersToContexts;
- (PBDialogHiddenAssertion)systemConfigurationDialogHiddenAssertion;
- (PBDialogManager)init;
- (PBOverlayLayoutAssertion)fullScreenOverlayOcclusionAssertion;
- (PBSystemGestureHandle)dismissDialogGesture;
- (PBSystemOverlayController)overlayController;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (void)_deregisterDialogHiddenAssertion:(id)a3;
- (void)_registerDialogHiddenAssertion:(id)a3;
- (void)_registerSystemAppSettingsObservers;
- (void)_updateFullScreenOverlayOcclusion;
- (void)_updateSystemConfigurationDialogsHiddenAssertion;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dismissDialogWithContext:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)dismissDialogWithContext:(id)a3 options:(id)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didCancelSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)presentDialogWithContext:(id)a3 options:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation PBDialogManager

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A81FC;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBSystemGestureManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8294;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470908 != -1) {
    dispatch_once(&qword_100470908, block);
  }
  return (id)qword_100470900;
}

- (PBDialogManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBDialogManager;
  v2 = -[PBDialogManager init](&v16, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    identifiersToContexts = v3->_identifiersToContexts;
    v3->_identifiersToContexts = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    hiddenDialogAssertions = v3->_hiddenDialogAssertions;
    v3->_hiddenDialogAssertions = v8;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000A8418;
    v14[3] = &unk_1003D0FA8;
    v10 = v3;
    v15 = v10;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v10,  v14);
    [v10[2] addObserver:v10 forKeyPath:@"hasActivePresentation" options:0 context:&off_1003D4BE0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    void v12[2] = sub_1000A85D4;
    v12[3] = &unk_1003CFF08;
    v13 = v10;
    dispatch_async(&_dispatch_main_q, v12);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"systemDialogsAllowed"];
  -[PBOverlayLayoutAssertion invalidate](self->_fullScreenOverlayOcclusionAssertion, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBDialogManager;
  -[PBDialogManager dealloc](&v4, "dealloc");
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)presentDialogWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PBDialogOptionPresentForcedKey"]);
  id v12 = [v11 BOOLValue];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PBDialogOptionPresentWhileScreenSaverActiveKey"]);
  unsigned int v14 = [v13 BOOLValue];

  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    v15 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissDialogFragment",  self);
    objc_super v16 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:](v16, "setRespondingFragmentDescriptor:", v15);
    [v8 setCoordinatedTransitionToken:v16];
  }

  v17 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v17, "setAnimated:", 1LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v17, "setIdentifier:", v18);

  -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v17, "setClientOptions:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 provider]);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v17, "setProvider:", v19);

  -[PBMutableSystemOverlayPresentationRequest _setInsertAtFrontOfQueue:](v17, "_setInsertAtFrontOfQueue:", v12);
  -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:]( v17,  "setSceneDeactivationReasons:",  0x2000LL);
  id v20 = sub_1000F7D5C();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[PBMutableSystemOverlayPresentationRequest setSignpostLog:](v17, "setSignpostLog:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 coordinatedTransitionToken]);
  -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v17,  "setCoordinatedTransitionToken:",  v22);

  identifiersToContexts = self->_identifiersToContexts;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[NSMutableDictionary setObject:forKey:](identifiersToContexts, "setObject:forKey:", v8, v24);

  id v25 = sub_100084950();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10027A270(v8, v26);
  }

  overlayController = self->_overlayController;
  id v28 = -[PBMutableSystemOverlayPresentationRequest copy](v17, "copy");
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1000A8B00;
  v54[3] = &unk_1003CFF30;
  id v29 = v10;
  id v55 = v29;
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v28,  v54);

  int v48 = (int)v12;
  if ((v12 | v14) == 1)
  {
    id v45 = v29;
    id v47 = v9;
    id v30 = sub_100084950();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "At dialog's request, invalidating all screen saver dialog hidden assertions",  buf,  2u);
    }

    v46 = self;
    id v32 = -[NSMutableArray copy](self->_hiddenDialogAssertions, "copy");
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v33 = v32;
    id v34 = [v33 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "reason", v45));
          unsigned int v40 = [v39 isEqualToString:@"ScreenSaver"];

          if (v40) {
            [v38 invalidate];
          }
        }

        id v35 = [v33 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }

      while (v35);
    }

    self = v46;
    id v9 = v47;
    id v29 = v45;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession", v45));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);

  if (v48)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned __int8 v44 = [v42 isEqual:v43];

    if ((v44 & 1) == 0)
    {
      if (v42) {
        -[PBDialogManager dismissActiveDialogAnimated:completion:]( self,  "dismissActiveDialogAnimated:completion:",  0LL,  0LL);
      }
      if (-[PBSystemOverlayController isPaused](self->_overlayController, "isPaused"))
      {
        -[PBSystemOverlayController resume](self->_overlayController, "resume");
        -[PBSystemOverlayController pauseWithOptions:](self->_overlayController, "pauseWithOptions:", 0LL);
      }
    }
  }
}

- (void)dismissDialogWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (void)dismissDialogWithContext:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
  -[PBMutableSystemOverlayDismissalRequest setAnimated:](v13, "setAnimated:", v6);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v13, "setIdentifier:", v14);
  -[PBMutableSystemOverlayDismissalRequest setClientOptions:](v13, "setClientOptions:", v11);

  overlayController = self->_overlayController;
  id v16 = -[PBMutableSystemOverlayDismissalRequest copy](v13, "copy");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000A8C5C;
  v18[3] = &unk_1003CFF30;
  id v19 = v10;
  id v17 = v10;
  -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v16,  v18);
}

- (BOOL)dismissActiveDialog
{
  return -[PBDialogManager dismissActiveDialogAnimated:completion:]( self,  "dismissActiveDialogAnimated:completion:",  1LL,  0LL);
}

- (BOOL)dismissActiveDialogAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if (v8
    && (uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToContexts,  "objectForKeyedSubscript:",  v8))) != 0)
  {
    id v10 = (void *)v9;
    -[PBDialogManager dismissDialogWithContext:options:animated:completion:]( self,  "dismissDialogWithContext:options:animated:completion:",  v9,  0LL,  v4,  v6);

    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_1003D4BE0)
  {
    -[PBDialogManager _updateFullScreenOverlayOcclusion](self, "_updateFullScreenOverlayOcclusion");
  }

  else if (a6 == &off_1003D4BE8)
  {
    -[PBDialogManager _updateSystemConfigurationDialogsHiddenAssertion]( self,  "_updateSystemConfigurationDialogsHiddenAssertion");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBDialogManager;
    -[PBDialogManager observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_registerSystemAppSettingsObservers
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"systemDialogsAllowed" options:4 context:&off_1003D4BE8];
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  id v5 = a4;
  -[PBSystemGestureHandle acquire](self->_dismissDialogGesture, "acquire");
  identifiersToContexts = self->_identifiersToContexts;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](identifiersToContexts, "objectForKey:", v7));

  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(&self->_observersLock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "dialogManager:willPresentDialogWithContext:") & 1) != 0) {
          objc_msgSend(v15, "dialogManager:willPresentDialogWithContext:", self, v8, (void)v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  identifiersToContexts = self->_identifiersToContexts;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a4 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](identifiersToContexts, "objectForKey:", v9));

  os_unfair_lock_lock(&self->_observersLock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(&self->_observersLock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v17, "dialogManager:willDismissDialogWithContext:dismissalContext:") & 1) != 0) {
          objc_msgSend(v17, "dialogManager:willDismissDialogWithContext:dismissalContext:", self, v10, v7, (void)v18);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  dismissDialogGesture = self->_dismissDialogGesture;
  id v6 = a4;
  -[PBSystemGestureHandle relinquish](dismissDialogGesture, "relinquish");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToContexts, "objectForKey:", v7));
  [v8 _invalidate];
  -[NSMutableDictionary removeObjectForKey:](self->_identifiersToContexts, "removeObjectForKey:", v7);
}

- (void)overlayController:(id)a3 didCancelSession:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a4 identifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToContexts, "objectForKey:", v8));
  [v9 _invalidate];
  __int128 v17 = (void *)v8;
  -[NSMutableDictionary removeObjectForKey:](self->_identifiersToContexts, "removeObjectForKey:", v8);
  os_unfair_lock_lock(&self->_observersLock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(&self->_observersLock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, "dialogManager:didCancelDialogWithContext:dismissalContext:") & 1) != 0) {
          [v16 dialogManager:self didCancelDialogWithContext:v9 dismissalContext:v7];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v13);
  }
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A9528;
  v14[3] = &unk_1003D24A8;
  objc_copyWeak(&v15, &location);
  id v12 = [v11 initWithBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_registerDialogHiddenAssertion:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray count](self->_hiddenDialogAssertions, "count");
  -[NSMutableArray addObject:](self->_hiddenDialogAssertions, "addObject:", v4);
  id v6 = -[NSMutableArray count](self->_hiddenDialogAssertions, "count");
  id v7 = sub_100084950();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    id v10 = v5;
    __int16 v11 = 2048;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Register dialog hidden assertion (%lu->%lu) %@",  (uint8_t *)&v9,  0x20u);
  }

  if (!v5 && v6 == (id)1) {
    -[PBSystemOverlayController pauseWithOptions:](self->_overlayController, "pauseWithOptions:", 1LL);
  }
}

- (void)_deregisterDialogHiddenAssertion:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray count](self->_hiddenDialogAssertions, "count");
  -[NSMutableArray removeObject:](self->_hiddenDialogAssertions, "removeObject:", v4);
  id v6 = -[NSMutableArray count](self->_hiddenDialogAssertions, "count");
  id v7 = sub_100084950();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    id v10 = v5;
    __int16 v11 = 2048;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deregister dialog hidden assertion (%lu->%lu) %@",  (uint8_t *)&v9,  0x20u);
  }

  if (v5 == (id)1 && !v6) {
    -[PBSystemOverlayController resume](self->_overlayController, "resume");
  }
}

- (void)_updateFullScreenOverlayOcclusion
{
  unsigned int v3 = -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
  fullScreenOverlayOcclusionAssertion = self->_fullScreenOverlayOcclusionAssertion;
  if (v3)
  {
    if (fullScreenOverlayOcclusionAssertion) {
      return;
    }
    id v5 = (PBOverlayLayoutAssertion *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutCoordinator defaultCoordinator]( &OBJC_CLASS___PBOverlayLayoutCoordinator,  "defaultCoordinator"));
    id v6 = (PBOverlayLayoutAssertion *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutAssertion beginElementOcclusionAtLayoutLevel:reason:withTransitionContext:]( v5,  "beginElementOcclusionAtLayoutLevel:reason:withTransitionContext:",  -[PBSystemOverlayController layoutLevel]( self->_overlayController,  "layoutLevel"),  @"Dialog",  0LL));
    id v7 = self->_fullScreenOverlayOcclusionAssertion;
    self->_fullScreenOverlayOcclusionAssertion = v6;
  }

  else
  {
    if (!fullScreenOverlayOcclusionAssertion) {
      return;
    }
    -[PBOverlayLayoutAssertion invalidateWithTransitionContext:]( fullScreenOverlayOcclusionAssertion,  "invalidateWithTransitionContext:",  0LL);
    id v5 = self->_fullScreenOverlayOcclusionAssertion;
    self->_fullScreenOverlayOcclusionAssertion = 0LL;
  }
}

- (void)_updateSystemConfigurationDialogsHiddenAssertion
{
  BOOL v3 = self->_systemConfigurationDialogHiddenAssertion != 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v5 = [v4 systemDialogsAllowed];

  if (((v3 ^ v5) & 1) == 0)
  {
    if ((v5 & 1) != 0)
    {
      -[PBDialogHiddenAssertion invalidate](self->_systemConfigurationDialogHiddenAssertion, "invalidate");
      id v6 = 0LL;
    }

    else
    {
      id v6 = -[PBDialogHiddenAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBDialogHiddenAssertion),  "initWithReason:",  @"SystemConfiguration");
    }

    systemConfigurationDialogHiddenAssertion = self->_systemConfigurationDialogHiddenAssertion;
    self->_systemConfigurationDialogHiddenAssertion = v6;
  }

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableDictionary)identifiersToContexts
{
  return self->_identifiersToContexts;
}

- (PBSystemGestureHandle)dismissDialogGesture
{
  return self->_dismissDialogGesture;
}

- (NSMutableArray)hiddenDialogAssertions
{
  return self->_hiddenDialogAssertions;
}

- (PBOverlayLayoutAssertion)fullScreenOverlayOcclusionAssertion
{
  return self->_fullScreenOverlayOcclusionAssertion;
}

- (PBDialogHiddenAssertion)systemConfigurationDialogHiddenAssertion
{
  return self->_systemConfigurationDialogHiddenAssertion;
}

- (void).cxx_destruct
{
}

@end