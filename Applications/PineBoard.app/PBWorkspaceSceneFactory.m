@interface PBWorkspaceSceneFactory
- (BOOL)activate;
- (BOOL)isActive;
- (BOOL)isInvalidated;
- (FBScene)rootScene;
- (NSString)debugDescription;
- (NSString)description;
- (PBSystemAppearanceManager)systemAppearanceManager;
- (PBWorkspaceHostingWindow)rootSceneHostingWindow;
- (PBWorkspaceSceneFactory)initWithDisplayConfigurationProvider:(id)a3 displayIdentity:(id)a4 sceneManager:(id)a5 windowSceneProvider:(id)a6 workspaceGeometry:(id)a7 descriptors:(id)a8;
- (UIWindowScene)rootWindowScene;
- (id)_createRootScene;
- (id)_createSceneUsingDescriptor:(id)a3 geometry:(id)a4;
- (id)_displayConfiguration;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sceneForKey:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)windowSceneForKey:(id)a3;
- (void)_handleDisplayBoundsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)enumerateScenesWithBlock:(id)a3;
- (void)invalidate;
- (void)setSystemAppearanceManager:(id)a3;
@end

@implementation PBWorkspaceSceneFactory

- (PBWorkspaceSceneFactory)initWithDisplayConfigurationProvider:(id)a3 displayIdentity:(id)a4 sceneManager:(id)a5 windowSceneProvider:(id)a6 workspaceGeometry:(id)a7 descriptors:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v43 = v14;
  if (!v14)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"displayConfigurationProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E098();
    }
LABEL_40:
    _bs_set_crash_log_message([v35 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C351CLL);
  }

  v20 = v19;
  id v21 = v15;
  Class v22 = NSClassFromString(@"FBSDisplayIdentity");
  if (!v21)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E140();
    }
    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3580LL);
  }

  if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBSDisplayIdentityClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E140();
    }
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C35E4LL);
  }

  id v23 = v16;
  Class v24 = NSClassFromString(@"FBSceneManager");
  if (!v23)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E1F0();
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3648LL);
  }

  if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBSceneManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E1F0();
    }
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C36ACLL);
  }

  if (!v17)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"windowSceneProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E2A0();
    }
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3710LL);
  }

  if (!v18)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"workspaceGeometry != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E348();
    }
    _bs_set_crash_log_message([v41 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3774LL);
  }

  id v25 = v20;
  Class v26 = NSClassFromString(@"NSDictionary");
  if (!v25)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E3F0();
    }
    _bs_set_crash_log_message([v42 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C37D8LL);
  }

  if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E3F0();
    }
    goto LABEL_40;
  }

  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PBWorkspaceSceneFactory;
  v27 = -[PBWorkspaceSceneFactory init](&v45, "init");
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_displayConfigurationProvider, a3);
    v29 = (FBSDisplayIdentity *)[v21 copy];
    displayIdentity = v28->_displayIdentity;
    v28->_displayIdentity = v29;

    objc_storeStrong((id *)&v28->_sceneManager, a5);
    objc_storeStrong((id *)&v28->_windowSceneProvider, a6);
    objc_storeStrong((id *)&v28->_workspaceGeometry, a7);
    v31 = (NSDictionary *)[v25 copy];
    descriptors = v28->_descriptors;
    v28->_descriptors = v31;

    if (sub_1001C9E00())
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v33 addObserver:v28 selector:"_handleDisplayBoundsDidChangeNotification:" name:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
    }
  }

  return v28;
}

- (void)dealloc
{
  if (sub_1001C9E00())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
  }

  if (self->_invalidated)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBWorkspaceSceneFactory;
    -[PBWorkspaceSceneFactory dealloc](&v5, "dealloc");
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"this object must be invalidated before it is released"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E4A0();
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

- (FBScene)rootScene
{
  if (!-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E5F0();
    }
LABEL_9:
    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C39C8LL);
  }

  rootScene = self->_rootScene;
  if (!rootScene)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_rootScene != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E548();
    }
    goto LABEL_9;
  }

  return rootScene;
}

- (UIWindowScene)rootWindowScene
{
  if (!-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E740();
    }
LABEL_9:
    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3AD4LL);
  }

  rootWindowScene = self->_rootWindowScene;
  if (!rootWindowScene)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_rootWindowScene != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E698();
    }
    goto LABEL_9;
  }

  return rootWindowScene;
}

- (PBWorkspaceHostingWindow)rootSceneHostingWindow
{
  if (-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    rootSceneHostingWindow = self->_rootSceneHostingWindow;
    if (!rootSceneHostingWindow)
    {
      v4 = -[PBWorkspaceHostingWindow initWithWindowScene:]( objc_alloc(&OBJC_CLASS___PBWorkspaceHostingWindow),  "initWithWindowScene:",  self->_rootWindowScene);
      objc_super v5 = self->_rootSceneHostingWindow;
      self->_rootSceneHostingWindow = v4;

      rootSceneHostingWindow = self->_rootSceneHostingWindow;
    }

    return rootSceneHostingWindow;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E7E8();
    }
    result = (PBWorkspaceHostingWindow *)_bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

  return result;
}

- (BOOL)activate
{
  BOOL active = self->_active;
  if (self->_active)
  {
    id v4 = sub_1000F7B7C();
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10028E890((uint64_t)self, v5);
    }
  }

  else
  {
    self->_BOOL active = 1;
    v6 = (FBScene *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory _createRootScene](self, "_createRootScene"));
    rootScene = self->_rootScene;
    self->_rootScene = v6;

    v8 = (UIWindowScene *)objc_claimAutoreleasedReturnValue( -[PBLocalSynchronousWindowSceneProviding windowSceneForFBScene:]( self->_windowSceneProvider,  "windowSceneForFBScene:",  self->_rootScene));
    rootWindowScene = self->_rootWindowScene;
    self->_rootWindowScene = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSDictionary count](self->_descriptors, "count")));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSDictionary count](self->_descriptors, "count")));
    descriptors = self->_descriptors;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001C3E2C;
    v23[3] = &unk_1003DB9F8;
    v23[4] = self;
    objc_super v5 = v10;
    Class v24 = v5;
    id v13 = v11;
    id v25 = v13;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](descriptors, "enumerateKeysAndObjectsUsingBlock:", v23);
    id v14 = (NSDictionary *)-[os_log_s copy](v5, "copy");
    scenes = self->_scenes;
    self->_scenes = v14;

    id v16 = (NSDictionary *)[v13 copy];
    windowScenes = self->_windowScenes;
    self->_windowScenes = v16;

    id v18 = sub_1000F7B7C();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_rootScene;
      NSUInteger v21 = -[NSDictionary count](self->_scenes, "count");
      *(_DWORD *)buf = 134218496;
      v27 = self;
      __int16 v28 = 2048;
      v29 = v20;
      __int16 v30 = 2048;
      NSUInteger v31 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%p] Created scenes {rootScene=%p, scenes.count=%lu}",  buf,  0x20u);
    }
  }

  return !active;
}

- (id)sceneForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"key != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E904();
    }
LABEL_13:
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3F94LL);
  }

  objc_super v5 = v4;
  if (!-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028EA54();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C3FF8LL);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_scenes, "objectForKey:", v5));
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"scene != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028E9AC();
    }
    goto LABEL_13;
  }

  v7 = (void *)v6;

  return v7;
}

- (id)windowSceneForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"key != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028EAFC();
    }
LABEL_13:
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C412CLL);
  }

  objc_super v5 = v4;
  if (!-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028EC4C();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1001C4190LL);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_windowScenes, "objectForKey:", v5));
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"windowScene != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028EBA4();
    }
    goto LABEL_13;
  }

  v7 = (void *)v6;

  return v7;
}

- (void)enumerateScenesWithBlock:(id)a3
{
  id v4 = a3;
  if (-[PBWorkspaceSceneFactory isActive](self, "isActive"))
  {
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_scenes, "enumerateKeysAndObjectsUsingBlock:", v4);
  }

  else
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isActive]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028ECF4();
    }
    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
  }

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = _os_activity_create( (void *)&_mh_execute_header,  "workspace/sceneFactory/invalidate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v12);

    id v4 = sub_1000F7B7C();
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      rootScene = self->_rootScene;
      NSUInteger v7 = -[NSDictionary count](self->_scenes, "count");
      *(_DWORD *)buf = 134218496;
      id v14 = self;
      __int16 v15 = 2048;
      id v16 = rootScene;
      __int16 v17 = 2048;
      NSUInteger v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%p] Invalidating {rootScene=%p, scenes.count=%lu}",  buf,  0x20u);
    }

    if (self->_active)
    {
      self->_BOOL active = 0;
      -[PBWorkspaceHostingWindow setHidden:](self->_rootSceneHostingWindow, "setHidden:", 1LL);
      -[PBWorkspaceHostingWindow invalidate](self->_rootSceneHostingWindow, "invalidate");
      rootSceneHostingWindow = self->_rootSceneHostingWindow;
      self->_rootSceneHostingWindow = 0LL;

      -[FBScene invalidate](self->_rootScene, "invalidate");
      v9 = self->_rootScene;
      self->_rootScene = 0LL;

      -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( self->_scenes,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1003DBA38);
      scenes = self->_scenes;
      self->_scenes = 0LL;

      windowScenes = self->_windowScenes;
      self->_windowScenes = 0LL;
    }

    os_activity_scope_leave(&v12);
  }

- (void)_handleDisplayBoundsDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayBoundsManager sharedInstance](&OBJC_CLASS___PBDisplayBoundsManager, "sharedInstance", a3));
  objc_super v5 = v4;
  if (v4)
  {
    [v4 currentDisplayBounds];
  }

  else
  {
    __int128 v6 = 0u;
    __int128 v7 = 0u;
  }

  -[PBWorkspaceHostingWindow setFrame:](self->_rootSceneHostingWindow, "setFrame:", v6, v7);
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneFactory succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneFactory descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_displayIdentity withName:0];
  id v5 = [v3 appendBool:self->_active withName:@"active"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneFactory descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v6 = [v5 appendObject:self->_displayIdentity withName:0];
  id v7 = [v5 appendBool:self->_active withName:@"active"];
  [v5 setActiveMultilinePrefix:v4];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 activeMultilinePrefix]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001C4704;
  v12[3] = &unk_1003CFEB8;
  id v9 = v5;
  id v13 = v9;
  id v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendBool:self->_active withKey:@"active"];
  id v5 = [v3 appendObject:self->_displayIdentity withKey:@"displayIdentity"];
  id v6 = [v3 appendObject:self->_rootScene withKey:@"rootScene"];
  id v7 = [v3 appendObject:self->_rootSceneHostingWindow withKey:@"rootSceneHostingWindow"];
  id v8 = [v3 appendDictionary:self->_scenes withKey:@"scenes" skipIfEmpty:0];
  id v9 = [v3 appendDictionary:self->_windowScenes withKey:@"windowScenes" skipIfEmpty:0];
  return v3;
}

- (id)_displayConfiguration
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBDisplayConfigurationProviding configurationForIdentity:]( self->_displayConfigurationProvider,  "configurationForIdentity:",  self->_displayIdentity));
}

- (id)_createRootScene
{
  if (self->_rootScene)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_rootScene == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028ED9C();
    }
    id result = (id) _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBRootWindowSceneSpecification workspaceSceneDescriptor]( &OBJC_CLASS___PBRootWindowSceneSpecification,  "workspaceSceneDescriptor"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory _displayConfiguration](self, "_displayConfiguration"));
    id v5 = -[PBRootWindowGeometry initWithDisplayConfiguration:fallbackGeometry:]( objc_alloc(&OBJC_CLASS___PBRootWindowGeometry),  "initWithDisplayConfiguration:fallbackGeometry:",  v4,  self->_workspaceGeometry);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneFactory _createSceneUsingDescriptor:geometry:]( self,  "_createSceneUsingDescriptor:geometry:",  v3,  v5));

    return v6;
  }

  return result;
}

- (id)_createSceneUsingDescriptor:(id)a3 geometry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAppearanceManager);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneFactory _displayConfiguration](self, "_displayConfiguration"));
    [v7 bounds];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    if (sub_1001C9E00())
    {
      [v7 fullDisplayBounds];
      uint64_t v12 = v19;
      uint64_t v14 = v20;
      uint64_t v16 = v21;
      uint64_t v18 = v22;
    }

    id v23 = [v9 effectiveUserInterfaceStyle];
    Class v24 = (void *)objc_claimAutoreleasedReturnValue([v6 definition]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 specification]);
    Class v26 = (void *)objc_claimAutoreleasedReturnValue( +[FBSMutableSceneParameters parametersForSpecification:]( &OBJC_CLASS___FBSMutableSceneParameters,  "parametersForSpecification:",  v25));

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001C4DD0;
    v32[3] = &unk_1003DBA88;
    uint64_t v35 = v12;
    uint64_t v36 = v14;
    uint64_t v37 = v16;
    uint64_t v38 = v18;
    id v33 = v10;
    id v34 = v6;
    id v39 = v23;
    id v27 = v6;
    id v28 = v10;
    [v26 updateSettingsWithBlock:v32];
    [v26 updateClientSettingsWithBlock:&stru_1003DBAA8];
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[FBSceneManager createSceneWithDefinition:initialParameters:]( self->_sceneManager,  "createSceneWithDefinition:initialParameters:",  v24,  v26));

    return v29;
  }

  else
  {
    NSUInteger v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemAppearanceManager != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028EE44();
    }
    id result = (id) _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
  }

  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (PBSystemAppearanceManager)systemAppearanceManager
{
  return (PBSystemAppearanceManager *)objc_loadWeakRetained((id *)&self->_systemAppearanceManager);
}

- (void)setSystemAppearanceManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end