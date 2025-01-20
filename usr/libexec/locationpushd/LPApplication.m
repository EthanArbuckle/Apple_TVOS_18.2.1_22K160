@interface LPApplication
- (BOOL)_extensionQueue_deliverLocationPayloadToExtension:(id)a3;
- (BOOL)hasLocationPushEntitlement;
- (BOOL)hasLocationPushServiceExtension;
- (LPApplication)init;
- (LPApplication)initWithAppBundleIdentifier:(id)a3;
- (NSMutableArray)pendingReplies;
- (NSString)apsEnvironment;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)extensionQueue;
- (OS_dispatch_queue)pendingReplyQueue;
- (id)serviceExtensionForBundleIdentifier:(id)a3;
- (void)addPendingTokenReply:(id)a3;
- (void)deliverLocationPayloadToExtension:(id)a3;
- (void)deliverToken:(id)a3;
- (void)setExtensionQueue:(id)a3;
- (void)setPendingReplies:(id)a3;
- (void)setPendingReplyQueue:(id)a3;
@end

@implementation LPApplication

- (LPApplication)init
{
}

- (LPApplication)initWithAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___LPApplication;
    v7 = -[LPApplication init](&v18, "init");
    if (v7)
    {
      id v8 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@".extension-run"]);
      dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
      extensionQueue = v7->_extensionQueue;
      v7->_extensionQueue = (OS_dispatch_queue *)v9;

      id v11 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@".token-reply"]);
      dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
      pendingReplyQueue = v7->_pendingReplyQueue;
      v7->_pendingReplyQueue = (OS_dispatch_queue *)v12;

      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      pendingReplies = v7->_pendingReplies;
      v7->_pendingReplies = (NSMutableArray *)v14;

      objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    }

    self = v7;
    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (void)deliverToken:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPApplication pendingReplyQueue](self, "pendingReplyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004510;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)addPendingTokenReply:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPApplication pendingReplyQueue](self, "pendingReplyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000046BC;
  block[3] = &unk_10000C308;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)deliverLocationPayloadToExtension:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPApplication extensionQueue](self, "extensionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000047A8;
  v7[3] = &unk_10000C2E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSString)apsEnvironment
{
  id v3 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  id v5 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entitlements]);
  id v7 = [v6 objectForKey:@"aps-environment" ofClass:objc_opt_class(NSString)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (([v8 isEqualToString:APSEnvironmentProduction] & 1) != 0
    || [v8 isEqualToString:APSEnvironmentDevelopment])
  {
    id v9 = v8;
  }

  else
  {
    id v9 = 0LL;
  }

  return (NSString *)v9;
}

- (BOOL)hasLocationPushEntitlement
{
  id v3 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  id v5 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entitlements]);
  id v7 = [v6 objectForKey:@"com.apple.developer.location.push" ofClass:objc_opt_class(NSNumber)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)hasLocationPushServiceExtension
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication serviceExtensionForBundleIdentifier:](v2, "serviceExtensionForBundleIdentifier:", v3));
  LOBYTE(v2) = v4 != 0LL;

  return (char)v2;
}

- (BOOL)_extensionQueue_deliverLocationPayloadToExtension:(id)a3
{
  id v51 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication serviceExtensionForBundleIdentifier:](self, "serviceExtensionForBundleIdentifier:", v4));

  v52 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
    id v72 = 0LL;
    unsigned __int8 v7 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:]( &OBJC_CLASS___CLLocationManager,  "_checkAndExerciseAuthorizationForBundleID:error:",  v6,  &v72);
    id v49 = v72;

    if ((v7 & 1) != 0)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(global_queue);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_100005260;
      v69[3] = &unk_10000C2E0;
      id v47 = v52;
      id v70 = v47;
      id v10 = v5;
      id v71 = v10;
      v48 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[BSTimer scheduledTimerWithFireInterval:queue:handler:]( &OBJC_CLASS___BSTimer,  "scheduledTimerWithFireInterval:queue:handler:",  v9,  v69,  30.0));
      double v12 = BSMachAbsoluteTime();
      *(void *)&__int128 v81 = 0LL;
      *((void *)&v81 + 1) = &v81;
      uint64_t v82 = 0x3032000000LL;
      v83 = sub_100005334;
      v84 = sub_100005344;
      id v85 = 0LL;
      id obj = 0LL;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 beginExtensionRequestWithOptions:0 inputItems:0 error:&obj]);
      objc_storeStrong(&v85, obj);
      objc_opt_class(&OBJC_CLASS___NSUUID);
      id v14 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v15 = v14;
      }
      else {
        v15 = 0LL;
      }
      id v50 = v15;

      [v11 cancel];
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 _extensionContextForUUID:v50]);
      BOOL v17 = v16 != 0LL;
      if (v16)
      {
        if (BSPIDIsBeingDebugged([v10 pidForRequestIdentifier:v50]))
        {
          if (qword_100010D10 != -1) {
            dispatch_once(&qword_100010D10, &stru_10000C398);
          }
          objc_super v18 = (os_log_s *)qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v74 = v47;
            __int16 v75 = 2114;
            id v76 = v50;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "[%{public}@] Extension is being debugged, will skip scheduling timers: sessionUUID=%{public}@",  buf,  0x16u);
          }

          id v19 = 0LL;
          v20 = 0LL;
        }

        else
        {
          double v29 = BSMachAbsoluteTime();
          id v30 = objc_alloc(&OBJC_CLASS___BSTimer);
          double v31 = fmax(v12 - v29 + 30.0, 0.0);
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_10000534C;
          v64[3] = &unk_10000C330;
          id v46 = v47;
          id v65 = v46;
          id v32 = v50;
          id v66 = v32;
          id v33 = v10;
          id v67 = v33;
          id v34 = [v30 initWithFireInterval:v48 queue:v64 handler:v31];
          id v35 = objc_alloc(&OBJC_CLASS___BSTimer);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_100005428;
          v60[3] = &unk_10000C330;
          id v61 = v33;
          id v36 = v32;
          id v62 = v36;
          id v63 = v16;
          id v19 = [v35 initWithFireInterval:v48 queue:v60 handler:25.0];
          if (qword_100010D10 != -1) {
            dispatch_once(&qword_100010D10, &stru_10000C398);
          }
          v37 = (os_log_s *)qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            id v74 = v46;
            __int16 v75 = 2114;
            id v76 = v36;
            __int16 v77 = 2048;
            double v78 = v31;
            __int16 v79 = 2048;
            uint64_t v80 = 0x4039000000000000LL;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "[%{public}@] Extension started, scheduled timers: sessionUUID=%{public}@, serviceTime=%lf, graceTime=%lf",  buf,  0x2Au);
          }

          v20 = v34;
        }

        v38 = v20;
        objc_msgSend(v20, "schedule", v46);
        [v19 schedule];
        v39 = (void *)objc_claimAutoreleasedReturnValue([v16 _auxiliaryConnection]);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_100005550;
        v56[3] = &unk_10000C358;
        v59 = &v81;
        id v40 = v47;
        id v57 = v40;
        id v41 = v50;
        id v58 = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue([v39 synchronousRemoteObjectProxyWithErrorHandler:v56]);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_100005658;
        v53[3] = &unk_10000C2E0;
        id v54 = v40;
        id v55 = v41;
        [v42 didReceiveLocationPushPayload:v51 reply:v53];

        v43 = (void *)objc_claimAutoreleasedReturnValue([v16 _auxiliaryConnection]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 remoteObjectProxy]);
        [v44 serviceExtensionPerformCleanup];

        [v38 cancel];
        [v19 cancel];
      }

      else
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C398);
        }
        v27 = (os_log_s *)qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(*((void *)&v81 + 1) + 40LL);
          *(_DWORD *)buf = 138543618;
          id v74 = v47;
          __int16 v75 = 2114;
          id v76 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Could not start an extension session: error=%{public}@",  buf,  0x16u);
        }
      }

      _Block_object_dispose(&v81, 8);
    }

    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C398);
      }
      v24 = (void *)qword_100010D18;
      BOOL v17 = 0;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
        LODWORD(v81) = 138543362;
        *(void *)((char *)&v81 + 4) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Don't yet have non-provisional authorization for %{public}@, bailing...",  (uint8_t *)&v81,  0xCu);

        BOOL v17 = 0;
      }
    }
  }

  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C398);
    }
    v21 = (void *)qword_100010D18;
    BOOL v17 = 0;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
      LODWORD(v81) = 138543362;
      *(void *)((char *)&v81 + 4) = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Tried to deliver payload to %{public}@, but couldn't find a location push extension",  (uint8_t *)&v81,  0xCu);

      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)serviceExtensionForBundleIdentifier:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPApplication bundleIdentifier](self, "bundleIdentifier"));
  id v6 = [v4 initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  if (v6)
  {
    v15[0] = @"com.apple.location.push.service";
    v14[0] = NSExtensionPointName;
    v14[1] = NSExtensionContainingAppName;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    v15[1] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

    uint64_t v13 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionsWithMatchingAttributes:error:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:error:",  v9,  &v13));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (OS_dispatch_queue)extensionQueue
{
  return self->_extensionQueue;
}

- (void)setExtensionQueue:(id)a3
{
}

- (OS_dispatch_queue)pendingReplyQueue
{
  return self->_pendingReplyQueue;
}

- (void)setPendingReplyQueue:(id)a3
{
}

- (NSMutableArray)pendingReplies
{
  return self->_pendingReplies;
}

- (void)setPendingReplies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end