@interface UIKeyboardManagementLink
- (BOOL)isAvailable;
- (NSString)description;
- (NSString)serviceName;
- (_UIKeyboardArbiter)owner;
- (void)attach:(id)a3;
- (void)connectWithQueue:(id)a3;
- (void)createSceneWithCompletion:(id)a3;
- (void)detach:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)setOwner:(id)a3;
- (void)updateSceneSettings;
- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)workspace:(id)a3 didReceiveActions:(id)a4;
- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
@end

@implementation UIKeyboardManagementLink

- (NSString)serviceName
{
  return 0LL;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UIKeyboardManagementLink;
  v3 = -[UIKeyboardManagementLink description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@; workspace = %@; scene = %@>",
                   v4,
                   self->_workspace,
                   self->_scene));

  return (NSString *)v5;
}

- (BOOL)isAvailable
{
  return self->_scene != 0LL;
}

- (void)connectWithQueue:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[FBSWorkspaceInitializationOptions optionsWithDelegate:]( &OBJC_CLASS___FBSWorkspaceInitializationOptions,  "optionsWithDelegate:",  self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSerialQueue queueWithDispatchQueue:](&OBJC_CLASS___FBSSerialQueue, "queueWithDispatchQueue:", v4));

  [v9 setCallOutQueue:v5];
  uint64_t v6 = FBSWorkspaceInitialize(v9);
  objc_super v7 = (FBSWorkspace *)objc_claimAutoreleasedReturnValue(v6);
  workspace = self->_workspace;
  self->_workspace = v7;
}

- (void)createSceneWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___FBSMutableSceneClientSettings);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIKeyboardManagementLink owner](self, "owner"));
  [v6 updateSceneClientSettings:v5];

  id v7 = objc_alloc_init(&OBJC_CLASS___FBSWorkspaceSceneRequestOptions);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  v8 = (void *)qword_100008A00;
  uint64_t v20 = qword_100008A00;
  if (!qword_100008A00)
  {
    id v9 = sub_1000025C8();
    v8 = dlsym(v9, "_UIKeyboardArbiter_SceneIdentifier");
    v18[3] = (uint64_t)v8;
    qword_100008A00 = (uint64_t)v8;
  }

  _Block_object_dispose(&v17, 8);
  if (v8)
  {
    [v7 setIdentifier:*v8];
    [v7 setInitialClientSettings:v5];
    [v7 setKeyboardScene:1];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[FBSServiceFacilityClient defaultShellEndpoint]( &OBJC_CLASS___FBSServiceFacilityClient,  "defaultShellEndpoint"));
    workspace = self->_workspace;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100001E5C;
    v15[3] = &unk_1000041D8;
    id v16 = v4;
    id v12 = v4;
    -[FBSWorkspace requestSceneFromEndpoint:withOptions:completion:]( workspace,  "requestSceneFromEndpoint:withOptions:completion:",  v10,  v7,  v15);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *get_UIKeyboardArbiter_SceneIdentifier(void)"));
    objc_msgSend( v13,  "handleFailureInFunction:file:lineNumber:description:",  v14,  @"_UIKeyboardManagement.m",  17,  @"%s",  dlerror());

    __break(1u);
  }

- (void)updateSceneSettings
{
  scene = self->_scene;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100001ED0;
  v3[3] = &unk_100004200;
  v3[4] = self;
  -[FBSScene updateClientSettingsWithBlock:](scene, "updateClientSettingsWithBlock:", v3);
}

- (void)attach:(id)a3
{
}

- (void)detach:(id)a3
{
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v10 = a4;
  v11 = (void (**)(id, id))a6;
  sub_1000020CC();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[UIKeyboardManagementLink workspace:didCreateScene:withTransitionContext:completion:]";
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  if (self->_scene)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"_UIKeyboardManagement.m", 85, @"Invalid parameter not satisfying: %@", @"_scene == nil" object file lineNumber description];
  }

  objc_storeStrong((id *)&self->_scene, a4);
  -[FBSScene setDelegate:](self->_scene, "setDelegate:", self);
  if (v11)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___FBSWorkspaceCreateSceneResponse);
    v11[2](v11, v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIKeyboardManagementLink owner](self, "owner"));
  [v15 activateClients];
}

- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a6;
  sub_1000020CC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    id v16 = "-[UIKeyboardManagementLink workspace:willDestroyScene:withTransitionContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  scene = self->_scene;
  self->_scene = 0LL;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIKeyboardManagementLink owner](self, "owner"));
  [v13 attemptConnection];

  if (v9)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___FBSWorkspaceDestroySceneResponse);
    v9[2](v9, v14);
  }
}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  id v4 = a4;
  sub_1000020CC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[UIKeyboardManagementLink workspace:didReceiveActions:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a6;
  sub_1000020CC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "-[UIKeyboardManagementLink scene:didUpdateWithDiff:transitionContext:completion:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  if (v8)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___FBSWorkspaceSceneUpdateResponse);
    v8[2](v8, v11);
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v4 = a4;
  sub_1000020CC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[UIKeyboardManagementLink scene:didReceiveActions:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
  }
}

- (_UIKeyboardArbiter)owner
{
  return (_UIKeyboardArbiter *)objc_loadWeakRetained((id *)&self->owner);
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end