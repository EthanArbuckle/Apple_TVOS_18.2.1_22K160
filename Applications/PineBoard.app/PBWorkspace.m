@interface PBWorkspace
+ (id)_defaultAnimationSettings;
+ (id)_defaultDescriptors;
+ (id)defaultSceneIdentityToken;
- (BOOL)isLayoutStyleActive:(int64_t)a3;
- (CGRect)frameForSceneWithKey:(id)a3 onCoordinateSpace:(id)a4;
- (FBSDisplayIdentity)displayIdentity;
- (NSString)debugDescription;
- (NSString)description;
- (PBSceneDeactivationManager)sceneDeactivationManager;
- (PBScenePresentationBinding)scenePresentationBinder;
- (PBWorkspace)initWithDisplayConfigurationProvider:(id)a3 displayIdentity:(id)a4 displayMonitor:(id)a5 geometry:(id)a6 sceneManager:(id)a7 localWindowSceneProvider:(id)a8;
- (PBWorkspace)initWithDisplayIdentity:(id)a3 geometry:(id)a4;
- (PBWorkspaceGeometry)geometry;
- (PBWorkspaceHandle)handle;
- (id)_displayConfiguration;
- (id)acquireEventQueueLockForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)windowSceneForLayoutGroup:(id)a3;
- (void)_enqueueTransitionRequest:(id)a3;
- (void)_legacy_displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)_modern_displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)_setupNewRootWindowWithDisplayConfiguration:(id)a3;
- (void)createWorkspaceScenesUsingSystemAppearanceManager:(id)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)enumerateScenesWithBlock:(id)a3;
- (void)executeTransitionRequest:(id)a3;
- (void)invalidate;
- (void)registerScene:(id)a3;
- (void)unregisterScene:(id)a3;
@end

@implementation PBWorkspace

- (CGRect)frameForSceneWithKey:(id)a3 onCoordinateSpace:(id)a4
{
  sceneFactory = self->_sceneFactory;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory rootSceneHostingWindow](sceneFactory, "rootSceneHostingWindow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 viewForSceneWithKey:v7]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 coordinateSpace]);
  [v9 frame];
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v6);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (id)defaultSceneIdentityToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  id v3 = sub_10010D014(@"default");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v2 newSceneIdentityTokenForIdentity:v4];

  return v5;
}

- (PBWorkspace)initWithDisplayConfigurationProvider:(id)a3 displayIdentity:(id)a4 displayMonitor:(id)a5 geometry:(id)a6 sceneManager:(id)a7 localWindowSceneProvider:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v58 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v16)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"displayIdentity != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002777B4();
    }
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x1000798B4LL);
  }

  if (!v17)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"geometry != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027785C();
    }
    _bs_set_crash_log_message([v57 UTF8String]);
    __break(0);
    JUMPOUT(0x100079918LL);
  }

  double v20 = v19;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___PBWorkspace;
  double v21 = -[PBWorkspace init](&v59, "init");
  double v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_displayConfigurationProvider, a3);
    v23 = (FBSDisplayIdentity *)[v16 copy];
    displayIdentity = v22->_displayIdentity;
    v22->_displayIdentity = v23;

    objc_storeStrong((id *)&v22->_geometry, a6);
    objc_storeStrong((id *)&v22->_displayMonitor, a5);
    -[FBSDisplayMonitor addObserver:](v22->_displayMonitor, "addObserver:", v22);
    v25 = (objc_class *)objc_opt_class(v22);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%p", v27, v22));

    v29 = -[BSEventQueue initWithName:onQueue:]( objc_alloc(&OBJC_CLASS___BSEventQueue),  "initWithName:onQueue:",  v28,  &_dispatch_main_q);
    eventQueue = v22->_eventQueue;
    v22->_eventQueue = v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue( -[BSEventQueue acquireLockForReason:]( v22->_eventQueue,  "acquireLockForReason:",  @"WorkspaceActivation"));
    eventQueueActivationLock = v22->_eventQueueActivationLock;
    v22->_eventQueueActivationLock = (BSEventQueueLock *)v31;

    v33 = objc_alloc_init(&OBJC_CLASS___PBWorkspaceSceneRegistry);
    sceneRegistry = v22->_sceneRegistry;
    v22->_sceneRegistry = v33;

    v35 = objc_alloc_init(&OBJC_CLASS___PBSceneDeactivationManager);
    sceneDeactivationManager = v22->_sceneDeactivationManager;
    v22->_sceneDeactivationManager = v35;

    id v37 = [(id)objc_opt_class(v22) _defaultDescriptors];
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = -[PBWorkspaceSceneFactory initWithDisplayConfigurationProvider:displayIdentity:sceneManager:windowSceneProvider:workspaceGeometry:descriptors:]( objc_alloc(&OBJC_CLASS___PBWorkspaceSceneFactory),  "initWithDisplayConfigurationProvider:displayIdentity:sceneManager:windowSceneProvider:workspaceGeometry:descriptors:",  v15,  v22->_displayIdentity,  v18,  v20,  v22->_geometry,  v38);
    sceneFactory = v22->_sceneFactory;
    v22->_sceneFactory = v39;

    if (sub_1001C9E00())
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayConfigurationProviding configurationForIdentity:]( v22->_displayConfigurationProvider,  "configurationForIdentity:",  v22->_displayIdentity));
      -[PBWorkspace _setupNewRootWindowWithDisplayConfiguration:]( v22,  "_setupNewRootWindowWithDisplayConfiguration:",  v41);
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UIRootSceneWindow-%@",  v28));
      v42 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayConfigurationProviding configurationForIdentity:]( v22->_displayConfigurationProvider,  "configurationForIdentity:",  v22->_displayIdentity));
      v43 = -[PBRootSceneWindow initWithDisplayConfiguration:]( objc_alloc(&OBJC_CLASS___PBRootSceneWindow),  "initWithDisplayConfiguration:",  v42);
      rootWindow = v22->_rootWindow;
      v22->_rootWindow = v43;

      v45 = -[PBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]( objc_alloc(&OBJC_CLASS___PBRootWindowScenePresentationBinder),  "initWithIdentifier:priority:appearanceStyle:rootWindow:",  v41,  0LL,  1LL,  v22->_rootWindow);
      rootWindowScenePresentationBinder = v22->_rootWindowScenePresentationBinder;
      v22->_rootWindowScenePresentationBinder = (UIRootWindowScenePresentationBinder *)v45;
    }

    id v47 = sub_1000F7E4C(&_dispatch_main_q, v22);
    uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);
    stateCaptureHandle = v22->_stateCaptureHandle;
    v22->_stateCaptureHandle = (BSInvalidatable *)v48;

    id v50 = sub_1000F7A8C();
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = v22->_displayIdentity;
      v54 = v22->_sceneRegistry;
      v53 = v22->_sceneFactory;
      *(_DWORD *)buf = 134218754;
      v61 = v22;
      __int16 v62 = 2114;
      v63 = v52;
      __int16 v64 = 2048;
      v65 = v53;
      __int16 v66 = 2048;
      v67 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[%p] Created workspace {displayIdentity=%{public}@, factory=%p, registry=%p}",  buf,  0x2Au);
    }
  }

  return v22;
}

- (PBWorkspace)initWithDisplayIdentity:(id)a3 geometry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](&OBJC_CLASS___FBDisplayManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  v10 = objc_alloc_init(&OBJC_CLASS___PBLocalSynchronousWindowSceneProvider);
  double v11 = -[PBWorkspace initWithDisplayConfigurationProvider:displayIdentity:displayMonitor:geometry:sceneManager:localWindowSceneProvider:]( self,  "initWithDisplayConfigurationProvider:displayIdentity:displayMonitor:geometry:sceneManager:localWindowSceneProvider:",  v8,  v7,  v8,  v6,  v9,  v10);

  return v11;
}

- (void)dealloc
{
  if (self->_invalidated)
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBWorkspace;
    -[PBWorkspace dealloc](&v3, "dealloc");
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"this object must be invalidated before it is released"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100277904();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

- (void)_setupNewRootWindowWithDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIRootWindowScenePresentationBinder scenes](self->_rootWindowScenePresentationBinder, "scenes"));
  id v6 = [v5 copy];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        -[UIRootWindowScenePresentationBinder removeScene:]( self->_rootWindowScenePresentationBinder,  "removeScene:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v11));
        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v9);
  }

  -[UIRootWindowScenePresentationBinder invalidate](self->_rootWindowScenePresentationBinder, "invalidate");
  rootWindowScenePresentationBinder = self->_rootWindowScenePresentationBinder;
  self->_rootWindowScenePresentationBinder = 0LL;

  -[PBRootSceneWindow setHidden:](self->_rootWindow, "setHidden:", 1LL);
  rootWindow = self->_rootWindow;
  self->_rootWindow = 0LL;

  double v14 = (objc_class *)objc_opt_class(self);
  id v15 = NSStringFromClass(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%p", v16, self));

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UIRootSceneWindow-%@",  v17));
  id v19 = -[PBRootSceneWindow initWithDisplayConfiguration:]( objc_alloc(&OBJC_CLASS___PBRootSceneWindow),  "initWithDisplayConfiguration:",  v4);
  double v20 = self->_rootWindow;
  self->_rootWindow = v19;

  double v21 = -[PBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]( objc_alloc(&OBJC_CLASS___PBRootWindowScenePresentationBinder),  "initWithIdentifier:priority:appearanceStyle:rootWindow:",  v18,  0LL,  1LL,  self->_rootWindow);
  double v22 = self->_rootWindowScenePresentationBinder;
  self->_rootWindowScenePresentationBinder = (UIRootWindowScenePresentationBinder *)v21;

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v23 = v7;
  id v24 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        -[UIRootWindowScenePresentationBinder addScene:]( self->_rootWindowScenePresentationBinder,  "addScene:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)v27));
        v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v25);
  }
}

- (void)registerScene:(id)a3
{
  sceneRegistry = self->_sceneRegistry;
  id v5 = a3;
  -[PBWorkspaceSceneRegistry registerScene:](sceneRegistry, "registerScene:", v5);
  -[PBSceneDeactivationManager beginTrackingScene:](self->_sceneDeactivationManager, "beginTrackingScene:", v5);
}

- (void)unregisterScene:(id)a3
{
  if (a3)
  {
    sceneDeactivationManager = self->_sceneDeactivationManager;
    id v5 = a3;
    -[PBSceneDeactivationManager endTrackingScene:](sceneDeactivationManager, "endTrackingScene:", v5);
    -[PBWorkspaceSceneRegistry unregisterScene:](self->_sceneRegistry, "unregisterScene:", v5);
  }

- (PBWorkspaceHandle)handle
{
  p_handle = &self->__handle;
  WeakRetained = (PBWorkspaceHandle *)objc_loadWeakRetained((id *)&self->__handle);
  if (!WeakRetained)
  {
    WeakRetained = -[PBWorkspaceHandle initWithWorkspace:]( objc_alloc(&OBJC_CLASS___PBWorkspaceHandle),  "initWithWorkspace:",  self);
    objc_storeWeak((id *)p_handle, WeakRetained);
  }

  return WeakRetained;
}

- (void)executeTransitionRequest:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "workspace/transition",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (!v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"transitionRequest != ((void *)0)"));
    id v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v12 = NSStringFromSelector(a2);
      double v13 = (PBWorkspace *)(id)objc_claimAutoreleasedReturnValue(v12);
      double v14 = (objc_class *)objc_opt_class(self);
      id v15 = NSStringFromClass(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138544642;
      double v20 = v13;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = @"PBWorkspace.m";
      __int16 v27 = 1024;
      int v28 = 296;
      __int16 v29 = 2114;
      __int128 v30 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    uint64_t v17 = _bs_set_crash_log_message([v10 UTF8String]);
    sub_10026FAD4(v17);
  }

  id v7 = [v5 copy];

  id v8 = sub_1000F7A8C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v20 = self;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%p] Executing transition request {request=%{public}@}",  buf,  0x16u);
  }

  -[PBWorkspace _enqueueTransitionRequest:](self, "_enqueueTransitionRequest:", v7);
  os_activity_scope_leave(&state);
}

- (void)enumerateScenesWithBlock:(id)a3
{
}

- (PBScenePresentationBinding)scenePresentationBinder
{
  rootWindowScenePresentationBinder = self->_rootWindowScenePresentationBinder;
  if (rootWindowScenePresentationBinder) {
    return rootWindowScenePresentationBinder;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_rootWindowScenePresentationBinder != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002779AC();
  }
  CGRect result = (PBScenePresentationBinding *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

- (void)createWorkspaceScenesUsingSystemAppearanceManager:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "workspace/createScenes",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = sub_1000F7A8C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%p] Creating workspace scenes", buf, 0xCu);
  }

  -[PBWorkspaceSceneFactory setSystemAppearanceManager:](self->_sceneFactory, "setSystemAppearanceManager:", v4);
  if (-[PBWorkspaceSceneFactory activate](self->_sceneFactory, "activate"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory rootScene](self->_sceneFactory, "rootScene"));
    -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v8);
    -[PBWorkspaceSceneRegistry registerScene:](self->_sceneRegistry, "registerScene:", v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory rootSceneHostingWindow](self->_sceneFactory, "rootSceneHostingWindow"));
    sceneFactory = self->_sceneFactory;
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    id v15 = sub_10007A2F4;
    id v16 = &unk_1003D3098;
    id v11 = v9;
    id v17 = v11;
    id v18 = self;
    -[PBWorkspaceSceneFactory enumerateScenesWithBlock:](sceneFactory, "enumerateScenesWithBlock:", &v13);
    -[BSEventQueueLock relinquish](self->_eventQueueActivationLock, "relinquish", v13, v14, v15, v16);
    eventQueueActivationLock = self->_eventQueueActivationLock;
    self->_eventQueueActivationLock = 0LL;
  }

  os_activity_scope_leave(&state);
}

- (BOOL)isLayoutStyleActive:(int64_t)a3
{
  char v5 = a3 == 0;
  if (-[PBWorkspaceSceneFactory isActive](self->_sceneFactory, "isActive"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace geometry](self, "geometry"));
    id v7 = sub_1000E3C90(a3, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory rootSceneHostingWindow](self->_sceneFactory, "rootSceneHostingWindow"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layout]);
    char v5 = BSEqualObjects(v8, v10);
  }

  return v5;
}

- (id)acquireEventQueueLockForReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000F7A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%p] Acquiring event queue lock {reason=%{public}@}",  (uint8_t *)&v9,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSEventQueue acquireLockForReason:](self->_eventQueue, "acquireLockForReason:", v4));
  return v7;
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (sub_1001C9E00()) {
    -[PBWorkspace _modern_displayMonitor:didUpdateIdentity:withConfiguration:]( self,  "_modern_displayMonitor:didUpdateIdentity:withConfiguration:",  v10,  v9,  v8);
  }
  else {
    -[PBWorkspace _legacy_displayMonitor:didUpdateIdentity:withConfiguration:]( self,  "_legacy_displayMonitor:didUpdateIdentity:withConfiguration:",  v10,  v9,  v8);
  }
}

- (void)_modern_displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentMode]);
  [v9 pixelSize];
  double v11 = v10;
  double v13 = v12;
  double height = CGSizeZero.height;

  if (v11 != CGSizeZero.width || v13 != height)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayBoundsManager sharedInstance](&OBJC_CLASS___PBDisplayBoundsManager, "sharedInstance"));
    id v17 = v16;
    if (v16)
    {
      [v16 currentDisplayBounds];
    }

    else
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
    }

    if ([v7 isEqual:self->_displayIdentity])
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBRootSceneWindow displayConfiguration](self->_rootWindow, "displayConfiguration"));
      [v18 bounds];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [v8 bounds];
      v46.origin.x = v27;
      v46.origin.y = v28;
      v46.size.width = v29;
      v46.size.double height = v30;
      v45.origin.x = v20;
      v45.origin.y = v22;
      v45.size.width = v24;
      v45.size.double height = v26;
      if (!CGRectEqualToRect(v45, v46)) {
        -[PBWorkspace _setupNewRootWindowWithDisplayConfiguration:]( self,  "_setupNewRootWindowWithDisplayConfiguration:",  v8);
      }
      sceneRegistry = self->_sceneRegistry;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10007A724;
      v34[3] = &unk_1003D30E8;
      id v35 = v7;
      id v36 = v8;
      __int128 v37 = v41;
      __int128 v38 = v42;
      __int128 v39 = v43;
      __int128 v40 = v44;
      -[PBWorkspaceSceneRegistry enumerateScenesWithBlock:](sceneRegistry, "enumerateScenesWithBlock:", v34);
    }

    else
    {
      id v32 = sub_1000F7A8C();
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
        sub_100277A54((uint64_t)v7, (os_log_s *)v18, v33);
      }
    }
  }
}

- (void)_legacy_displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 isEqual:self->_displayIdentity])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentMode]);
    [v9 pixelSize];
    double v11 = v10;
    double v13 = v12;
    double height = CGSizeZero.height;

    if (v11 != CGSizeZero.width || v13 != height)
    {
      sceneRegistry = self->_sceneRegistry;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10007A9C8;
      v17[3] = &unk_1003D3138;
      id v18 = v7;
      id v19 = v8;
      -[PBWorkspaceSceneRegistry enumerateScenesWithBlock:](sceneRegistry, "enumerateScenesWithBlock:", v17);
    }
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[FBSDisplayMonitor removeObserver:](self->_displayMonitor, "removeObserver:", self);
    -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
    -[UIRootWindowScenePresentationBinder invalidate](self->_rootWindowScenePresentationBinder, "invalidate");
    -[PBWorkspaceSceneFactory invalidate](self->_sceneFactory, "invalidate");
  }

- (id)windowSceneForLayoutGroup:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneFactory windowSceneForKey:]( self->_sceneFactory,  "windowSceneForKey:",  a3));
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[PBWorkspace succinctDescription](self, "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspace descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_displayIdentity withName:0];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspace descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeMultilinePrefix]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007AD34;
  v10[3] = &unk_1003CFEB8;
  id v7 = v5;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v10];

  id v8 = v7;
  return v8;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendObject:self->_displayIdentity withKey:@"displayIdentity"];
  id v5 = [v3 appendObject:self->_sceneFactory withKey:@"sceneFactory"];
  id v6 = [v3 appendObject:self->_sceneRegistry withKey:@"sceneRegistry"];
  return v3;
}

- (id)_displayConfiguration
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBDisplayConfigurationProviding configurationForIdentity:]( self->_displayConfigurationProvider,  "configurationForIdentity:",  self->_displayIdentity));
}

- (void)_enqueueTransitionRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10007AF3C;
  double v10 = &unk_1003D0EA0;
  id v5 = v4;
  id v11 = v5;
  objc_copyWeak(&v13, &location);
  double v12 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[BSEventQueueEvent eventWithName:handler:]( &OBJC_CLASS___BSEventQueueEvent,  "eventWithName:handler:",  @"Transition",  &v7));
  -[BSEventQueue executeOrInsertEvent:atPosition:]( self->_eventQueue,  "executeOrInsertEvent:atPosition:",  v6,  1LL,  v7,  v8,  v9,  v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (id)_defaultAnimationSettings
{
  if (qword_100470290 != -1) {
    dispatch_once(&qword_100470290, &stru_1003D3158);
  }
  return [(id)qword_100470288 copy];
}

+ (id)_defaultDescriptors
{
  v10[0] = @"wallpaper";
  v2 = sub_10007B27C(-0.5, (uint64_t)a1, @"underlay");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v11[0] = v3;
  v10[1] = @"application";
  id v4 = sub_10007B27C(0.0, (uint64_t)v3, @"default");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11[1] = v5;
  v10[2] = @"overlay";
  id v6 = sub_10007B27C(0.5, (uint64_t)v5, @"overlay");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (PBWorkspaceGeometry)geometry
{
  return self->_geometry;
}

- (PBSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

- (void).cxx_destruct
{
}

@end