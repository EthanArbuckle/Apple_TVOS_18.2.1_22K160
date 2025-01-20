@interface PBSetTopBoxIntentDispatcher
- (BOOL)_canSTBApplication:(id)a3 handleIntent:(id)a4;
- (BOOL)_currentApplicationSceneIsFocused;
- (PBAppInfoController)appInfoController;
- (PBSceneManager)sceneManager;
- (PBSetTopBoxIntentDispatcher)initWithSceneManager:(id)a3;
- (PBSetTopBoxQueryTransaction)stbQueryTransaction;
- (PBSystemGestureHandle)guideButtonGesture;
- (PBSystemGestureHandle)tvProviderButtonGesture;
- (VSIdentityProviderInfoCenter)identityProviderInfoCenter;
- (id)_applicationRecordForBundleIdentifier:(id)a3;
- (id)_applicationRecordForCurrentApplicationScene;
- (id)_currentApplicationSceneAppInfo;
- (void)_dispatchSTBIntent:(id)a3 toSTBBundleIdentifier:(id)a4;
- (void)_dispatchSTBIntent:(id)a3 usingApplicationRecord:(id)a4;
- (void)_dispatchSTBIntentToCurrentApplication:(id)a3;
- (void)_dispatchSTBIntentToSTBApplication:(id)a3;
- (void)_fetchSTBBundleIdentifierWithCompletion:(id)a3;
- (void)dealloc;
- (void)dispatchIntentToCurrentApplication:(id)a3;
- (void)dispatchIntentToSTB:(id)a3;
@end

@implementation PBSetTopBoxIntentDispatcher

- (PBSetTopBoxIntentDispatcher)initWithSceneManager:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBSetTopBoxIntentDispatcher;
  v4 = -[PBSetTopBoxIntentDispatcher init](&v28, "init");
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_sceneManager, v5);

    v6 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderInfoCenter);
    identityProviderInfoCenter = v4->_identityProviderInfoCenter;
    v4->_identityProviderInfoCenter = v6;

    v8 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppInfoController enabledAppsFilter](&OBJC_CLASS___PBAppInfoController, "enabledAppsFilter"));
    v11 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v8,  "initWithInfoStore:filter:delegate:",  v9,  v10,  0LL);
    appInfoController = v4->_appInfoController;
    v4->_appInfoController = v11;

    objc_initWeak(&from, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10010B8FC;
    v25[3] = &unk_1003D1020;
    objc_copyWeak(&v26, &from);
    v14 = (PBSystemGestureHandle *)[v13 newHandleForSystemGesture:21 actionHandler:v25];
    guideButtonGesture = v4->_guideButtonGesture;
    v4->_guideButtonGesture = v14;

    -[PBSystemGestureHandle acquire](v4->_guideButtonGesture, "acquire");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10010B96C;
    v23 = &unk_1003D1020;
    objc_copyWeak(&v24, &from);
    v17 = (PBSystemGestureHandle *)[v16 newHandleForSystemGesture:22 actionHandler:&v20];
    tvProviderButtonGesture = v4->_tvProviderButtonGesture;
    v4->_tvProviderButtonGesture = v17;

    -[PBSystemGestureHandle acquire](v4->_tvProviderButtonGesture, "acquire", v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSetTopBoxIntentDispatcher;
  -[PBSetTopBoxIntentDispatcher dealloc](&v3, "dealloc");
}

- (void)dispatchIntentToCurrentApplication:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Handle set top box intent",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  -[PBSetTopBoxIntentDispatcher _fetchSTBBundleIdentifierWithCompletion:]( self,  "_fetchSTBBundleIdentifierWithCompletion:",  0LL);
  if (-[PBSetTopBoxIntentDispatcher _currentApplicationSceneIsFocused](self, "_currentApplicationSceneIsFocused"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBSetTopBoxIntentDispatcher _currentApplicationSceneAppInfo]( self,  "_currentApplicationSceneAppInfo"));
    unsigned int v7 = [v4 focusedAppCanHandle:v6];

    id v8 = sub_10010BA04(self);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1002815E0(v7, v9);
    }

    if (v7)
    {
      id v10 = sub_10010BA04(self);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending to current application", v14, 2u);
      }

      -[PBSetTopBoxIntentDispatcher _dispatchSTBIntentToCurrentApplication:]( self,  "_dispatchSTBIntentToCurrentApplication:",  v4);
    }

    else
    {
      -[PBSetTopBoxIntentDispatcher _dispatchSTBIntentToSTBApplication:]( self,  "_dispatchSTBIntentToSTBApplication:",  v4);
    }
  }

  else
  {
    id v12 = sub_10010BA04(self);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Current application scene is not focused",  v14,  2u);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)dispatchIntentToSTB:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Activate STB application",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v6);

  -[PBSetTopBoxIntentDispatcher _dispatchSTBIntentToSTBApplication:](self, "_dispatchSTBIntentToSTBApplication:", v4);
  os_activity_scope_leave(&v6);
}

- (BOOL)_currentApplicationSceneIsFocused
{
  p_sceneManager = &self->_sceneManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained focusedSceneHandle]);

  id v5 = objc_loadWeakRetained((id *)p_sceneManager);
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentApplicationSceneHandle]);

  LOBYTE(v5) = [v4 isEqual:v6];
  return (char)v5;
}

- (id)_currentApplicationSceneAppInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentApplicationSceneHandle]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcessBundleIdentifier]);
  if (v5)
  {
    os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
  }

  else
  {
    unsigned int v7 = 0LL;
  }

  return v7;
}

- (void)_dispatchSTBIntentToCurrentApplication:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSetTopBoxIntentDispatcher _applicationRecordForCurrentApplicationScene]( self,  "_applicationRecordForCurrentApplicationScene"));
  if (v5)
  {
    -[PBSetTopBoxIntentDispatcher _dispatchSTBIntent:usingApplicationRecord:]( self,  "_dispatchSTBIntent:usingApplicationRecord:",  v4,  v5);
    [v4 didDispatchToForegroundedApp];
  }
}

- (void)_dispatchSTBIntentToSTBApplication:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentApplicationSceneHandle]);

  id v7 = sub_10010BA04(self);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Fetching configured STB application",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010BEFC;
  v11[3] = &unk_1003D7AD0;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v4;
  id v13 = v10;
  -[PBSetTopBoxIntentDispatcher _fetchSTBBundleIdentifierWithCompletion:]( self,  "_fetchSTBBundleIdentifierWithCompletion:",  v11);

  objc_destroyWeak(buf);
}

- (void)_fetchSTBBundleIdentifierWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  p_stbQueryTransaction = &self->_stbQueryTransaction;
  if (-[PBSetTopBoxQueryTransaction isFresh](self->_stbQueryTransaction, "isFresh"))
  {
    id v6 = sub_10010BA04(self);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100281658((uint64_t)p_stbQueryTransaction, v7, v8, v9, v10, v11, v12, v13);
    }

    if (v4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSetTopBoxQueryTransaction bundleIdentifier](*p_stbQueryTransaction, "bundleIdentifier"));
      v4[2](v4, v14);
    }
  }

  else if (-[PBSetTopBoxQueryTransaction isRunning](*p_stbQueryTransaction, "isRunning"))
  {
    id v15 = sub_10010BA04(self);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1002816C0((uint64_t)p_stbQueryTransaction, v16, v17, v18, v19, v20, v21, v22);
    }

    sub_1000F209C(*p_stbQueryTransaction, v4);
  }

  else
  {
    v23 = objc_alloc(&OBJC_CLASS___PBSetTopBoxQueryTransaction);
    id v24 = sub_10010BA04(self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    identityProviderInfoCenter = self->_identityProviderInfoCenter;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBSetTopBoxQueryTransaction bundleIdentifier](self->_stbQueryTransaction, "bundleIdentifier"));
    objc_super v28 = -[PBSetTopBoxQueryTransaction initWithLog:identityProviderInfoCenter:currentBundleIdentifier:]( v23,  "initWithLog:identityProviderInfoCenter:currentBundleIdentifier:",  v25,  identityProviderInfoCenter,  v27);

    id v29 = sub_10010BA04(self);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_100281728((uint64_t)v28, v30, v31, v32, v33, v34, v35, v36);
    }

    sub_1000F209C(v28, v4);
    -[PBSetTopBoxQueryTransaction begin](v28, "begin");
    v37 = *p_stbQueryTransaction;
    *p_stbQueryTransaction = v28;
  }
}

- (BOOL)_canSTBApplication:(id)a3 handleIntent:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    appInfoController = self->_appInfoController;
    id v6 = a4;
    id v4 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](appInfoController, "appInfos"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

    LOBYTE(v4) = [v6 stbAppCanHandle:v8];
  }

  return (char)v4;
}

- (void)_dispatchSTBIntent:(id)a3 toSTBBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10010BA04(self);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218242;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Attempting to activate STB application {bundle_id=%p:%@}",  (uint8_t *)&v14,  0x16u);
  }

  if (-[PBSetTopBoxIntentDispatcher _canSTBApplication:handleIntent:](self, "_canSTBApplication:handleIntent:", v7, v6))
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PBSetTopBoxIntentDispatcher _applicationRecordForBundleIdentifier:]( self,  "_applicationRecordForBundleIdentifier:",  v7));
    if (v10)
    {
      -[PBSetTopBoxIntentDispatcher _dispatchSTBIntent:usingApplicationRecord:]( self,  "_dispatchSTBIntent:usingApplicationRecord:",  v6,  v10);
      [v6 didDispatchToSetTopBoxApp];
    }

    else
    {
      id v12 = sub_10010BA04(self);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10028178C(v13);
      }

      [v6 dispatchDidFailSetTopBoxAppNotInstalled];
    }
  }

  else
  {
    id v11 = sub_10010BA04(self);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "STB application does not support intent",  (uint8_t *)&v14,  2u);
    }
  }
}

- (id)_applicationRecordForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = 0LL;
    id v5 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v4,  0LL,  &v11);
    id v6 = (os_log_s *)v11;
    if (!v5)
    {
      id v7 = sub_10010BA04(self);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1002817CC((uint64_t)v6, (uint64_t)v4, v8);
      }
    }
  }

  else
  {
    id v9 = sub_10010BA04(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Cannot obtain application record for 'null' bundle identifier",  buf,  2u);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (id)_applicationRecordForCurrentApplicationScene
{
  p_sceneManager = &self->_sceneManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained focusedSceneHandle]);

  id v6 = objc_loadWeakRetained((id *)p_sceneManager);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentApplicationSceneHandle]);

  if ([v5 isEqual:v7])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcessBundleIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBSetTopBoxIntentDispatcher _applicationRecordForBundleIdentifier:]( self,  "_applicationRecordForBundleIdentifier:",  v8));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)_dispatchSTBIntent:(id)a3 usingApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10010BA04(self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v7)
  {
    __int16 v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    uint64_t v18 = sub_10010C734;
    uint64_t v19 = &unk_1003D4A98;
    id v20 = v9;
    id v21 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v11 = v21;
    id v12 = v10;
    uint64_t v13 = objc_retainBlock(&v16);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userActivity", v16, v17, v18, v19));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v15 openUserActivity:v14 usingApplicationRecord:v7 configuration:0 completionHandler:v13];
  }

  else if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_INFO,  "Cannot activate application for 'null' record",  buf,  2u);
  }
}

- (PBSceneManager)sceneManager
{
  return (PBSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (VSIdentityProviderInfoCenter)identityProviderInfoCenter
{
  return self->_identityProviderInfoCenter;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (PBSetTopBoxQueryTransaction)stbQueryTransaction
{
  return self->_stbQueryTransaction;
}

- (PBSystemGestureHandle)guideButtonGesture
{
  return self->_guideButtonGesture;
}

- (PBSystemGestureHandle)tvProviderButtonGesture
{
  return self->_tvProviderButtonGesture;
}

- (void).cxx_destruct
{
}

@end