@interface PBApplicationSupportServiceDelegate
+ (id)defaultApplicationInitializationContext;
- (PBApplicationSupportServiceDelegate)init;
- (UISApplicationSupportService)service;
- (id)service:(id)a3 initializeClient:(id)a4;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 forClient:(id)a6 completion:(id)a7;
- (void)requestPasscodeUnlockUIForClient:(id)a3 withCompletion:(id)a4;
@end

@implementation PBApplicationSupportServiceDelegate

- (PBApplicationSupportServiceDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBApplicationSupportServiceDelegate;
  v2 = -[PBApplicationSupportServiceDelegate init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UISApplicationSupportService sharedInstance](&OBJC_CLASS___UISApplicationSupportService, "sharedInstance"));
    service = v2->_service;
    v2->_service = (UISApplicationSupportService *)v3;

    -[UISApplicationSupportService setDelegate:](v2->_service, "setDelegate:", v2);
    id v5 = [(id)objc_opt_class(v2) defaultApplicationInitializationContext];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[UISApplicationSupportService setDefaultContext:](v2->_service, "setDefaultContext:", v6);
    -[UISApplicationSupportService start](v2->_service, "start");
  }

  return v2;
}

- (void)requestPasscodeUnlockUIForClient:(id)a3 withCompletion:(id)a4
{
  id v4 = a4;
  id v5 = v4;
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FF758;
    block[3] = &unk_1003D0110;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (id)service:(id)a3 initializeClient:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processForPID:", objc_msgSend(v4, "pid")));
  if (([v6 isCurrentProcess] & 1) == 0
    && [v6 isRunning]
    && (([v6 isApplicationProcess] & 1) != 0
     || [v6 isExtensionProcess]))
  {
    id v7 = v6;
    objc_super v8 = v7;
    if ([v7 isExtensionProcess])
    {
      objc_super v8 = v7;
      do
      {
        id v9 = v8;
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v9 hostProcess]);

        if (!v8) {
          objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processForPID:", objc_msgSend(v9, "hostPID")));
        }
      }

      while (([v8 isExtensionProcess] & 1) != 0);
    }

    if ([v8 isApplicationProcess])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
      if (sub_1001C9E00())
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](&OBJC_CLASS___FBDisplayManager, "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainConfiguration]);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[FBDisplayManager pb_transformToAppJailConfigurationIfNeeded:]( &OBJC_CLASS___FBDisplayManager,  "pb_transformToAppJailConfigurationIfNeeded:",  v12));

        id v14 = [[UISMutableDisplayContext alloc] initWithDisplayConfiguration:v13 displayEdgeInfo:0];
      }

      else
      {
        id v19 = objc_alloc(&OBJC_CLASS___UISMutableDisplayContext);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](&OBJC_CLASS___FBDisplayManager, "sharedInstance"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v13 mainConfiguration]);
        id v14 = [v19 initWithDisplayConfiguration:v20 displayEdgeInfo:0];
      }

      if ((BSEqualStrings(v10, @"com.apple.TVAirPlay") & 1) == 0
        && (BSEqualStrings(v10, @"com.apple.TVSystemUIService") & 1) == 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000FFB90;
        block[3] = &unk_1003CFEB8;
        id v32 = v10;
        id v33 = v14;
        dispatch_sync(&_dispatch_main_q, block);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](&OBJC_CLASS___BSPlatform, "sharedInstance"));
      id v21 = objc_alloc(&OBJC_CLASS___UISDeviceContext);
      uint64_t v34 = UISDeviceContextDeviceClassKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v29 deviceClass]));
      v35 = v22;
      v30 = (os_log_s *)v10;
      v23 = v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      id v25 = [v21 initWithDeviceInfoValues:v24];

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v30,  @"default"));
      id v15 = [[UISMutableApplicationInitializationContext alloc] initWithMainDisplayContext:v23 launchDisplayContext:0 deviceContext:v25 persistedSceneIdentifiers:0 supportAppSceneRequests:1];
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
      id v28 = [v27 newSceneIdentityTokenForIdentity:v26];
      [v15 setDefaultSceneToken:v28];

      v18 = v30;
    }

    else
    {
      id v17 = sub_1000824FC();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_100280B34(v4, v18);
      }
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 animationType:(unint64_t)a4 destroySessions:(BOOL)a5 forClient:(id)a6 completion:(id)a7
{
  id v9 = a3;
  id v10 = a7;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  id v13 = [v11 pid];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 processForPID:v13]);
  id v15 = sub_1000824FC();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v14;
    __int16 v31 = 2114;
    id v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[PBApplicationSupportServiceDelegate] Received destroy scenes request from %{public}@ for %{public}@",  buf,  0x16u);
  }

  if ([v14 hasEntitlement:@"com.apple.springboard.requestScene-daemon"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FFE84;
    block[3] = &unk_1003D2F08;
    id v24 = v9;
    id v25 = v14;
    id v26 = v10;
    dispatch_async(&_dispatch_main_q, block);

    id v17 = v24;
  }

  else if ([v14 isApplicationProcess])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000FFEC4;
    v19[3] = &unk_1003D2F08;
    id v20 = v9;
    id v21 = v14;
    id v22 = v10;
    dispatch_async(&_dispatch_main_q, v19);

    id v17 = v20;
  }

  else
  {
    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    id v28 = @"This functionality is only provided for application processes.";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBApplicationSupportServiceDelegate",  1LL,  v17));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v18);
  }
}

+ (id)defaultApplicationInitializationContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UISMutableApplicationInitializationContext defaultContext]( &OBJC_CLASS___UISMutableApplicationInitializationContext,  "defaultContext"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));
  id v4 = [[UISDisplayContext alloc] initWithDisplayConfiguration:v3];
  [v2 setMainDisplayContext:v4];
  id v5 = [v2 copy];

  return v5;
}

- (UISApplicationSupportService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

@end