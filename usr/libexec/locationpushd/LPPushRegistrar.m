@interface LPPushRegistrar
+ (id)bundleIdFromTopic:(id)a3;
+ (id)sharedInstance;
+ (id)topicFromBundleId:(id)a3;
- (APSConnection)developmentAPSConnection;
- (APSConnection)productionAPSConnection;
- (BOOL)_setTopicEnabled:(BOOL)a3 forConnection:(id)a4 appBundleIdentifier:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LPPushRegistrar)init;
- (NSMutableDictionary)bundleIdentifierToApplication;
- (NSXPCListener)locationPushRegistrationServer;
- (OS_dispatch_queue)apsdQueue;
- (OS_dispatch_queue)dictionaryMutationQueue;
- (id)_apsConnectionForEnvironment:(id)a3;
- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3;
- (id)_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:(id)a3;
- (void)_addOrMoveTopic:(id)a3 forConnection:(id)a4 toList:(unint64_t)a5;
- (void)_invalidateTokenForTopic:(id)a3 fromConnection:(id)a4;
- (void)_removeTopic:(id)a3 forConnection:(id)a4;
- (void)_removeUnneededSandboxTopicsFromDevelopmentConnection;
- (void)_unregisterLocationPushApplication:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connectionDidReconnect:(id)a3;
- (void)handleApplicationUninstalledNotification:(id)a3;
- (void)registerForPushToken:(id)a3 completion:(id)a4;
- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5;
@end

@implementation LPPushRegistrar

+ (id)sharedInstance
{
  if (qword_100010EA0 != -1) {
    dispatch_once(&qword_100010EA0, &stru_10000C3B8);
  }
  return (id)qword_100010EA8;
}

- (LPPushRegistrar)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___LPPushRegistrar;
  v2 = -[LPPushRegistrar init](&v26, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.locationpushd", 0LL);
    apsdQueue = v2->_apsdQueue;
    v2->_apsdQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.locationpushd.ivar", 0LL);
    dictionaryMutationQueue = v2->_dictionaryMutationQueue;
    v2->_dictionaryMutationQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bundleIdentifierToApplication = v2->_bundleIdentifierToApplication;
    v2->_bundleIdentifierToApplication = v7;

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](v2, "apsdQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100005BA0;
    handler[3] = &unk_10000C3E0;
    v10 = v2;
    v25 = v10;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, handler);

    v11 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v12 = APSEnvironmentProduction;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 apsdQueue]);
    v14 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v11,  "initWithEnvironmentName:namedDelegatePort:queue:",  v12,  @"com.apple.aps.locationpushd.production",  v13);
    id v15 = v10[2];
    v10[2] = v14;

    [v10[2] setDelegate:v10];
    v16 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v17 = APSEnvironmentDevelopment;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v10 apsdQueue]);
    v19 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v16,  "initWithEnvironmentName:namedDelegatePort:queue:",  v17,  @"com.apple.aps.locationpushd.development",  v18);
    id v20 = v10[3];
    v10[3] = v19;

    [v10[3] setDelegate:v10];
    v21 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationpushd.pushregistration");
    id v22 = v10[1];
    v10[1] = v21;

    [v10[1] setDelegate:v10];
    [v10[1] resume];
  }

  return v2;
}

- (id)_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:(id)a3
{
  id v3 = a3;
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = APSEnvironmentDevelopment;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v8);
        id v10 = [(id)objc_opt_class(self) bundleIdFromTopic:v9];
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        id v12 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
        id v22 = 0LL;
        id v13 = [v12 initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v22];
        id v14 = v22;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 entitlements]);
        id v16 = [v15 objectForKey:@"aps-environment" ofClass:objc_opt_class(NSString)];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v5);
  }

  return v19;
}

- (void)_removeUnneededSandboxTopicsFromDevelopmentConnection
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection opportunisticTopics](self->_developmentAPSConnection, "opportunisticTopics"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection ignoredTopics](self->_developmentAPSConnection, "ignoredTopics"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:]( self,  "_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:",  v4));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:]( self,  "_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:",  v5));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v7);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = v3;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        id v14 = (os_log_s *)qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removing topic from sandbox environment %{public}@",  buf,  0xCu);
        }

        -[LPPushRegistrar _removeTopic:forConnection:]( self,  "_removeTopic:forConnection:",  v13,  self->_developmentAPSConnection);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
    }

    while (v10);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LPPushTokenServerProtocol));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.private.locationpushd.pushtokenregistration"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0) {
    [v5 resume];
  }
  else {
    [v5 invalidate];
  }

  return v8;
}

- (void)connectionDidReconnect:(id)a3
{
  id v4 = a3;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v5 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "APSConnection: %{public}@ did reconnect",  (uint8_t *)&v6,  0xCu);
  }

  -[LPPushRegistrar _removeUnneededSandboxTopicsFromDevelopmentConnection]( self,  "_removeUnneededSandboxTopicsFromDevelopmentConnection");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v7 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "APSConnection: %{public}@ did receive publicToken",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v14 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138544130;
    id v21 = v10;
    __int16 v22 = 2114;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "for connection: %{public}@ token: %{public}@ topic: %{public}@ identifier: %{public}@",  (uint8_t *)&v20,  0x2Au);
  }

  id v15 = [(id)objc_opt_class(self) bundleIdFromTopic:v12];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v16));
  __int128 v18 = v17;
  if (v17)
  {
    [v17 deliverToken:v11];
  }

  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    v19 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Could not find installed app for %{public}@, maybe it was offloaded?",  (uint8_t *)&v20,  0xCu);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  id v8 = [(id)objc_opt_class(self) bundleIdFromTopic:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v10 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543875;
    v19 = v6;
    __int16 v20 = 2114;
    *(void *)id v21 = v9;
    *(_WORD *)&v21[8] = 2113;
    __int16 v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Incoming message has topic: %{public}@ bundleID: %{public}@ userInfo %{private}@",  (uint8_t *)&v18,  0x20u);
  }

  id v11 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];
  if ([v11 isPlaceholder])
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v12 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Dropping push on the floor because it seems like the app is in the midst of updating or has been offloaded. bund leID: %{public}@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v9));
    unsigned int v14 = [v13 hasLocationPushEntitlement];
    unsigned int v15 = [v13 hasLocationPushServiceExtension];
    unsigned int v16 = v15;
    if (v14 && v15)
    {
      [v13 deliverLocationPayloadToExtension:v7];
    }

    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      __int128 v17 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543874;
        v19 = v6;
        __int16 v20 = 1026;
        *(_DWORD *)id v21 = v14;
        *(_WORD *)&v21[4] = 1026;
        *(_DWORD *)&v21[6] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Incoming message for %{public}@ caused push token deregistration because entitlement is %{public}d or extension is %{public}d",  (uint8_t *)&v18,  0x18u);
      }

      -[LPPushRegistrar _unregisterLocationPushApplication:](self, "_unregisterLocationPushApplication:", v9);
    }
  }
}

- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  unsigned int v15 = sub_100006928;
  unsigned int v16 = sub_100006938;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar dictionaryMutationQueue](self, "dictionaryMutationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006940;
  block[3] = &unk_10000C408;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v8 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to register bundle ID %{public}@ for location pushes",  buf,  0xCu);
  }

  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v6));
    id v10 = v9;
    if (v9)
    {
      if ([v9 hasLocationPushEntitlement])
      {
        if ([v10 hasLocationPushServiceExtension])
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 apsEnvironment]);
          if (v11)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v11));
            id v13 = [(id)objc_opt_class(self) topicFromBundleId:v6];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            [v10 addPendingTokenReply:v7];
            unsigned int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100006F90;
            block[3] = &unk_10000C330;
            block[4] = self;
            id v16 = v12;
            id v26 = v16;
            id v27 = v6;
            dispatch_sync(v15, block);

            if (qword_100010D10 != -1) {
              dispatch_once(&qword_100010D10, &stru_10000C450);
            }
            id v17 = (os_log_s *)qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v29 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Requesting token for topic %@",  buf,  0xCu);
            }

            [v16 requestTokenForTopic:v14 identifier:&stru_10000C630];
          }

          else
          {
            if (qword_100010D10 != -1) {
              dispatch_once(&qword_100010D10, &stru_10000C450);
            }
            __int16 v24 = (os_log_s *)qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v29 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Ignoring registerBundleIdentifier: request because no valid aps-environment present for %@",  buf,  0xCu);
            }

            id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CLLocationPushServiceErrorDomain,  2LL,  0LL));
            v7[2](v7, 0LL, v16);
          }

          goto LABEL_36;
        }

        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        id v23 = (os_log_s *)qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Ignoring registerBundleIdentifier: request because no Location Push Service Extension present for %@",  buf,  0xCu);
        }

        NSErrorDomain v20 = CLLocationPushServiceErrorDomain;
        uint64_t v21 = 1LL;
      }

      else
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        __int16 v22 = (os_log_s *)qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Ignoring registerBundleIdentifier: request because location push entitlement is missing from  %{public}@",  buf,  0xCu);
        }

        NSErrorDomain v20 = CLLocationPushServiceErrorDomain;
        uint64_t v21 = 3LL;
      }
    }

    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      v19 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Ignoring registerBundleIdentifier: request because application is not valid",  buf,  2u);
      }

      NSErrorDomain v20 = NSPOSIXErrorDomain;
      uint64_t v21 = 22LL;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  v21,  0LL));
    v7[2](v7, 0LL, v11);
LABEL_36:

    goto LABEL_37;
  }

  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  int v18 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Ignoring registerBundleIdentifier: request because bundle identifier is nil",  buf,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  v7[2](v7, 0LL, v10);
LABEL_37:
}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 apsEnvironment]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v11));

  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000070C8;
  block[3] = &unk_10000C430;
  id v18 = v12;
  v19 = self;
  BOOL v22 = a3;
  id v20 = v8;
  id v21 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar apsdQueue](self, "apsdQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000071A4;
  v7[3] = &unk_10000C2E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_unregisterLocationPushApplication:(id)a3
{
  id v4 = a3;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v5 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Unregistering application %{public}@ from Location Pushes",  buf,  0xCu);
  }

  id v6 = [(id)objc_opt_class(self) topicFromBundleId:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 apsEnvironment]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar _apsConnectionForEnvironment:](self, "_apsConnectionForEnvironment:", v9));

  if (v10)
  {
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:]( self,  "_invalidateTokenForTopic:fromConnection:",  v7,  v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar productionAPSConnection](self, "productionAPSConnection"));
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:]( self,  "_invalidateTokenForTopic:fromConnection:",  v7,  v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar developmentAPSConnection](self, "developmentAPSConnection"));
    -[LPPushRegistrar _invalidateTokenForTopic:fromConnection:]( self,  "_invalidateTokenForTopic:fromConnection:",  v7,  v12);
  }

  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[LPPushRegistrar dictionaryMutationQueue](self, "dictionaryMutationQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100007524;
  v15[3] = &unk_10000C2E0;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_sync(v13, v15);
}

- (void)_invalidateTokenForTopic:(id)a3 fromConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LPPushRegistrar _removeTopic:forConnection:](self, "_removeTopic:forConnection:", v7, v6);
  [v6 invalidateTokenForTopic:v7 identifier:&stru_10000C630];
}

- (void)_removeTopic:(id)a3 forConnection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 opportunisticTopics]);
  id v10 = [v7 mutableCopy];

  [v10 removeObject:v6];
  [v5 _setOpportunisticTopics:v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 ignoredTopics]);
  id v9 = [v8 mutableCopy];

  [v9 removeObject:v6];
  [v5 _setIgnoredTopics:v9];
}

- (void)_addOrMoveTopic:(id)a3 forConnection:(id)a4 toList:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 opportunisticTopics]);
  unsigned int v10 = [v9 containsObject:v7];

  if (v10)
  {
    if (a5 == 1)
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      id v11 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289282;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        uint64_t v12 = "{msg%{public}.0s:Not adding to OpportunisticTopics since it's already an added topic, topic:%{"
              "public, location:escape_only}@}";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v34, 0x1Cu);
        goto LABEL_42;
      }

      goto LABEL_42;
    }

    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v15 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 68289794;
      int v35 = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2114;
      unint64_t v39 = (unint64_t)v7;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2050;
      unint64_t v43 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Moving topic from opportunisitic list connection, topic:%{public, location:escape_o nly}@, connection:%{public, location:escape_only}@, toList:%{public}lu}",  (uint8_t *)&v34,  0x30u);
    }

    id v16 = v8;
    id v17 = v7;
    uint64_t v18 = 1LL;
LABEL_33:
    [v16 moveTopic:v17 fromList:v18 toList:a5];
    goto LABEL_42;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 ignoredTopics]);
  unsigned int v14 = [v13 containsObject:v7];

  if (!v14)
  {
    if (a5 == 2)
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      id v27 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289538;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Adding topic to ignored list, topic:%{public, location:escape_only}@, connectio n:%{public, location:escape_only}@}",  (uint8_t *)&v34,  0x26u);
      }

      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 ignoredTopics]);
      id v29 = (void *)v28;
      v30 = &__NSArray0__struct;
      if (v28) {
        v30 = (void *)v28;
      }
      id v31 = v30;

      -[NSMutableSet addObjectsFromArray:](v20, "addObjectsFromArray:", v31);
      -[NSMutableSet addObject:](v20, "addObject:", v7);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v20, "allObjects"));
      [v8 _setIgnoredTopics:v25];
    }

    else
    {
      if (a5 != 1)
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        v32 = (os_log_s *)qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_FAULT))
        {
          int v34 = 68289282;
          int v35 = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2050;
          unint64_t v39 = a5;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Not adding topic due to unknown list, toList:%{public}lu}",  (uint8_t *)&v34,  0x1Cu);
        }

        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        v33 = (os_log_s *)qword_100010D18;
        if (os_signpost_enabled((os_log_t)qword_100010D18))
        {
          int v34 = 68289282;
          int v35 = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2050;
          unint64_t v39 = a5;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Not adding topic due to unknown list",  "{msg%{public}.0s:Not adding topic due to unknown list, toList:%{public}lu}",  (uint8_t *)&v34,  0x1Cu);
        }

        goto LABEL_42;
      }

      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      v19 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289538;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Adding topic to opportunistic list, topic:%{public, location:escape_only}@, con nection:%{public, location:escape_only}@}",  (uint8_t *)&v34,  0x26u);
      }

      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 opportunisticTopics]);
      BOOL v22 = (void *)v21;
      id v23 = &__NSArray0__struct;
      if (v21) {
        id v23 = (void *)v21;
      }
      id v24 = v23;

      -[NSMutableSet addObjectsFromArray:](v20, "addObjectsFromArray:", v24);
      -[NSMutableSet addObject:](v20, "addObject:", v7);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v20, "allObjects"));
      [v8 _setOpportunisticTopics:v25];
    }

    goto LABEL_42;
  }

  if (a5 != 2)
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v26 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 68289794;
      int v35 = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2114;
      unint64_t v39 = (unint64_t)v7;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2050;
      unint64_t v43 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Moving topic from ignored list connection, topic:%{public, location:escape_only}@, connection:%{public, location:escape_only}@, toList:%{public}lu}",  (uint8_t *)&v34,  0x30u);
    }

    id v16 = v8;
    id v17 = v7;
    uint64_t v18 = 2LL;
    goto LABEL_33;
  }

  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v11 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 68289282;
    int v35 = 0;
    __int16 v36 = 2082;
    v37 = "";
    __int16 v38 = 2114;
    unint64_t v39 = (unint64_t)v7;
    uint64_t v12 = "{msg%{public}.0s:Not adding to IgnoredTopics since it's already an added topic, topic:%{public, lo"
          "cation:escape_only}@}";
    goto LABEL_13;
  }

- (BOOL)_setTopicEnabled:(BOOL)a3 forConnection:(id)a4 appBundleIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class(self) topicFromBundleId:v9];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[LPPushRegistrar _findOrCreateApplicationWithBundleIdentifier:]( self,  "_findOrCreateApplicationWithBundleIdentifier:",  v9));
  id v13 = v12;
  if (v12)
  {
    if ([v12 hasLocationPushEntitlement])
    {
      if (v6) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      -[LPPushRegistrar _addOrMoveTopic:forConnection:toList:]( self,  "_addOrMoveTopic:forConnection:toList:",  v11,  v8,  v14);
    }

    else
    {
      -[LPPushRegistrar _removeTopic:forConnection:](self, "_removeTopic:forConnection:", v11, v8);
    }
  }

  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v15 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Ignoring setLocationPushesActive: request because application %{public}@ is not valid",  (uint8_t *)&v17,  0xCu);
    }
  }

  return v13 != 0LL;
}

- (id)_apsConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:APSEnvironmentProduction])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar productionAPSConnection](self, "productionAPSConnection"));
  }

  else
  {
    if (![v4 isEqualToString:APSEnvironmentDevelopment])
    {
      BOOL v6 = 0LL;
      goto LABEL_7;
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[LPPushRegistrar developmentAPSConnection](self, "developmentAPSConnection"));
  }

  BOOL v6 = (void *)v5;
LABEL_7:

  return v6;
}

+ (id)bundleIdFromTopic:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "substringWithRange:",  0,  (char *)objc_msgSend(v3, "length")
                 + ~(unint64_t)[@"location-query" length]));

  return v4;
}

+ (id)topicFromBundleId:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  a3,  @"location-query");
}

- (NSXPCListener)locationPushRegistrationServer
{
  return self->_locationPushRegistrationServer;
}

- (APSConnection)productionAPSConnection
{
  return self->_productionAPSConnection;
}

- (APSConnection)developmentAPSConnection
{
  return self->_developmentAPSConnection;
}

- (OS_dispatch_queue)apsdQueue
{
  return self->_apsdQueue;
}

- (NSMutableDictionary)bundleIdentifierToApplication
{
  return self->_bundleIdentifierToApplication;
}

- (OS_dispatch_queue)dictionaryMutationQueue
{
  return self->_dictionaryMutationQueue;
}

- (void).cxx_destruct
{
}

@end