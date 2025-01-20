@interface MAPushNotificationServiceDaemon
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MAPushNotificationServiceDaemon)init;
- (MAPushServiceConnection)pushServiceConnection;
- (NSMutableArray)clients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)clientUpstreamQueue;
- (OS_dispatch_queue)serviceQueue;
- (int64_t)channelTypeForDevice;
- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6;
- (void)channelSubscriptionsFailedWithReasons:(id)a3;
- (void)didReceivePushNotification:(id)a3;
- (void)pushJobsAwaitingTriggerWithCompletion:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setClientUpstreamQueue:(id)a3;
- (void)setClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setPushServiceConnection:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)startListeningForConnections;
- (void)subscribeToChannelForCurrentPlatform;
- (void)subscribeToChannelWithIdentifier:(id)a3;
- (void)subscribedChannelIDsWithCompletion:(id)a3;
- (void)triggerPushNotificationWithPayload:(id)a3;
- (void)unsubscribeFromAllChannels;
- (void)unsubscribeToChannelWithIdentifier:(id)a3;
@end

@implementation MAPushNotificationServiceDaemon

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_22);
  }
  return (id)sharedInstance_instance;
}

void __49__MAPushNotificationServiceDaemon_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MAPushNotificationServiceDaemon);
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;
}

- (MAPushNotificationServiceDaemon)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAPushNotificationServiceDaemon;
  v2 = -[MAPushNotificationServiceDaemon init](&v14, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobileassetd.push-notifications.Service", 0LL);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobileassetd.push-notifications.Client", 0LL);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobileassetd.push-notifications.Client-Upstream", 0LL);
    clientUpstreamQueue = v2->_clientUpstreamQueue;
    v2->_clientUpstreamQueue = (OS_dispatch_queue *)v7;

    v9 = -[MAPushServiceConnection initWithDelegate:]( objc_alloc(&OBJC_CLASS___MAPushServiceConnection),  "initWithDelegate:",  v2);
    pushServiceConnection = v2->_pushServiceConnection;
    v2->_pushServiceConnection = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clients = v2->_clients;
    v2->_clients = (NSMutableArray *)v11;
  }

  return v2;
}

- (void)startListeningForConnections
{
  dispatch_queue_t v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mobileassetd.push-notifications");
  listener = self->_listener;
  self->_listener = v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (int64_t)channelTypeForDevice
{
  else {
    int64_t v2 = 5LL;
  }
  dispatch_queue_t v3 = (void *)CFPreferencesCopyAppValue(@"SeedProgram", @"com.apple.seeding");
  v8 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"CustomerSeed"])
    {
      int64_t v2 = 4LL;
    }

    else if ([v8 isEqualToString:@"DeveloperSeed"])
    {
      int64_t v2 = 2LL;
    }

    else if ([v8 isEqualToString:@"PublicSeed"])
    {
      int64_t v2 = 3LL;
    }

    else
    {
      _MobileAssetLog( 0LL,  4,  (uint64_t)"-[MAPushNotificationServiceDaemon channelTypeForDevice]",  @"Unknown seeding program for channel? %@",  v9,  v10,  v11,  v12,  (uint64_t)v8);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon channelTypeForDevice]",  @"Not enrolled in seed for channel",  v4,  v5,  v6,  v7,  v14);
  }

  return v2;
}

- (void)subscribeToChannelForCurrentPlatform
{
  dispatch_queue_t v3 = -[MAPushChannel initWithPopulationType:]( objc_alloc(&OBJC_CLASS___MAPushChannel),  "initWithPopulationType:",  -[MAPushNotificationServiceDaemon channelTypeForDevice](self, "channelTypeForDevice"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subscribedChannels]);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) identifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel identifier](v3, "identifier"));
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon subscribeToChannelForCurrentPlatform]",  @"Already subscribed to channel %@",  v14,  v15,  v16,  v17,  (uint64_t)v3);
          v22 = v6;
          goto LABEL_11;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon subscribeToChannelForCurrentPlatform]",  @"Subscribing to platform channel %@",  v18,  v19,  v20,  v21,  (uint64_t)v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  [v22 subscribeToChannel:v3];
LABEL_11:
}

- (void)subscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon subscribeToChannelWithIdentifier:]",  @"Subscribing to channel: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  uint64_t v10 = -[MAPushChannel initWithIdentifier:](objc_alloc(&OBJC_CLASS___MAPushChannel), "initWithIdentifier:", v4);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  [v9 subscribeToChannel:v10];
}

- (void)unsubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon unsubscribeToChannelWithIdentifier:]",  @"Subscribing to channel: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  uint64_t v10 = -[MAPushChannel initWithIdentifier:](objc_alloc(&OBJC_CLASS___MAPushChannel), "initWithIdentifier:", v4);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  [v9 unsubscribeFromChannel:v10];
}

- (void)unsubscribeFromAllChannels
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subscribedChannels]);

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon unsubscribeFromAllChannels]",  @"Unsubscribing from all channels: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      unsigned int v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
        [v15 unsubscribeFromChannel:v14];

        unsigned int v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }
}

- (void)subscribedChannelIDsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subscribedChannels]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "identifier", (void)v15));
        [v7 addObject:v13];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  id v14 = [v7 copy];
  v4[2](v4, v14);
}

- (void)triggerPushNotificationWithPayload:(id)a3
{
  id v4 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon triggerPushNotificationWithPayload:]",  @"Triggering push notification with payload: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  id v9 = -[MAPushNotification initWithUserInfo:](objc_alloc(&OBJC_CLASS___MAPushNotification), "initWithUserInfo:", v4);

  -[MAPushNotificationServiceDaemon didReceivePushNotification:](self, "didReceivePushNotification:", v9);
}

- (void)pushJobsAwaitingTriggerWithCompletion:(id)a3
{
  dispatch_queue_t v3 = (void (**)(id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler jobsAwaitingTrigger]( &OBJC_CLASS___MADAutoAssetScheduler,  "jobsAwaitingTrigger"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "pushedJob", (void)v14))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
          [v5 addObject:v12];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v13 = [v5 copy];
  v3[2](v3, v13);
}

- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v18 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  v11,  v10,  v9,  0LL);

  id v12 = -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:]( objc_alloc(&OBJC_CLASS___MADAutoAssetScheduledJob),  "initForAssetSelector:withActivityInterval:forPushedJob:",  v18,  a6,  0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon addSyntheticJobWithType:assetSpecifier:matchingAssetVersion:triggerInterval:]",  @"Adding synthetic job: %@",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  +[MADAutoAssetScheduler scheduleSelector:triggeringAtIntervalSecs:]( &OBJC_CLASS___MADAutoAssetScheduler,  "scheduleSelector:triggeringAtIntervalSecs:",  v18,  a6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.mobileassetd.push-notifications.private"]);

  if (v6)
  {
    uint64_t v7 = MAPushServiceInterface();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    [v5 setExportedInterface:v8];
    uint64_t v9 = MAServiceClientInterface([v5 setExportedObject:self]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setRemoteObjectInterface:v10];
    id v11 = -[MAPushNotificationClient initWithConnection:]( objc_alloc(&OBJC_CLASS___MAPushNotificationClient),  "initWithConnection:",  v5);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon clientQueue](self, "clientQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_34DB98;
    id v13 = v11;
    __int128 v25 = v13;
    __int128 v26 = self;
    dispatch_sync(v12, block);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke_2;
    v22[3] = &unk_34DB98;
    v22[4] = self;
    __int128 v23 = v13;
    uint64_t v14 = v13;
    [v5 setInvalidationHandler:v22];
    [v5 setInterruptionHandler:&__block_literal_global_654];
    [v5 resume];

    id v5 = (id)v8;
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectInterface]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 exportedInterface]);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushNotificationServiceDaemon listener:shouldAcceptNewConnection:]",  @"Entitlement %@ not satisfied for connection remote object interface: %@, exported interface: %@",  v15,  v16,  v17,  v18,  (uint64_t)@"com.apple.mobileassetd.push-notifications.private");

    [v5 invalidate];
  }

  return v6 != 0LL;
}

void __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon listener:shouldAcceptNewConnection:]_block_invoke",  @"Adding client: %@",  v3,  v4,  v5,  v6,  (uint64_t)v2);

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clients]);
  [v7 addObject:*(void *)(a1 + 32)];
}

void __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientQueue]);
  v12[0] = (uint64_t)_NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = (uint64_t)__70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke_3;
  v12[3] = (uint64_t)&unk_34DB98;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v10;
  uint64_t v14 = v11;
  dispatch_async(v9, v12);
}

void __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon listener:shouldAcceptNewConnection:]_block_invoke_3",  @"Removing client: %@",  v3,  v4,  v5,  v6,  (uint64_t)v2);

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clients]);
  [v7 removeObject:*(void *)(a1 + 32)];
}

void __70__MAPushNotificationServiceDaemon_listener_shouldAcceptNewConnection___block_invoke_4(id a1)
{
}

- (void)didReceivePushNotification:(id)a3
{
  id v4 = a3;
  v99 = (void *)objc_claimAutoreleasedReturnValue([v4 pushPayload]);
  id v5 = [v99 safeObjectForKey:@"MAPushTestUniqueID" ofClass:objc_opt_class(NSString)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = _MAPreferencesCopyNSStringValue(@"MAPushTestUniqueID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 isEqualToString:v6];
    if (!(_DWORD)v9)
    {
      _MobileAssetLog( (uint64_t)v9,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon didReceivePushNotification:]",  @"Push test unique IDs don't match, ignoring push notification",  v10,  v11,  v12,  v13,  v91);

      goto LABEL_30;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon didReceivePushNotification:]",  @"Received matching push test unique ID, processing push notification",  v10,  v11,  v12,  v13,  v91);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:@"UpdatePolicyIdentifiers"]);
  __int128 v19 = v14;
  if (v14)
  {
    v94 = v6;
    id v95 = v4;
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 count]));
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    v93 = v19;
    id obj = v19;
    id v100 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
    if (v100)
    {
      uint64_t v97 = *(void *)v124;
      v114 = self;
      do
      {
        id v20 = 0LL;
        do
        {
          if (*(void *)v124 != v97) {
            objc_enumerationMutation(obj);
          }
          v113 = (char *)v20;
          uint64_t v21 = *(void *)(*((void *)&v123 + 1) + 8LL * (void)v20);
          context = objc_autoreleasePoolPush();
          v22 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:v21]);
          id v23 = [v22 safeObjectForKey:@"PushReason" ofClass:objc_opt_class(NSNumber)];
          v116 = (void *)objc_claimAutoreleasedReturnValue(v23);
          id v24 = [v22 safeObjectForKey:@"AssetType" ofClass:objc_opt_class(NSString)];
          uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
          id v26 = [v22 safeObjectForKey:@"AssetSpecifier" ofClass:objc_opt_class(NSString)];
          v110 = (void *)objc_claimAutoreleasedReturnValue(v26);
          id v27 = [v22 safeObjectForKey:@"AssetSetIdentifier" ofClass:objc_opt_class(NSString)];
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          id v29 = [v22 safeObjectForKey:@"ClientDomainName" ofClass:objc_opt_class(NSString)];
          v115 = (void *)objc_claimAutoreleasedReturnValue(v29);
          id v30 = [v22 safeObjectForKey:@"MatchingAssetVersion" ofClass:objc_opt_class(NSString)];
          v109 = (void *)objc_claimAutoreleasedReturnValue(v30);
          id v31 = [v22 safeObjectForKey:@"UpdatePolicyName" ofClass:objc_opt_class(NSString)];
          v108 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v111 = (void *)v25;
          id v32 = -[MAAutoAssetUpdatePolicy initUpdatePolicy:forAssetType:]( objc_alloc(&OBJC_CLASS___MAAutoAssetUpdatePolicy),  "initUpdatePolicy:forAssetType:",  v108,  v25);
          id v33 = [v22 safeObjectForKey:@"UserInitiated" ofClass:objc_opt_class(NSNumber)];
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          unsigned int v106 = [v34 BOOLValue];

          id v35 = [v22 safeObjectForKey:@"LockAcrossTermination" ofClass:objc_opt_class(NSNumber)];
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          unsigned int v105 = [v36 BOOLValue];

          id v37 = [v22 safeObjectForKey:@"LockAcrossReboot" ofClass:objc_opt_class(NSNumber)];
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          unsigned __int8 v104 = [v38 BOOLValue];

          id v39 = [v22 safeObjectForKey:@"LockAcrossTermination" ofClass:objc_opt_class(NSNumber)];
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          unsigned __int8 v103 = [v40 BOOLValue];

          id v41 = [v22 safeObjectForKey:@"ScanInterval" ofClass:objc_opt_class(NSNumber)];
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          objc_msgSend(v32, "setCheckForNewerIntervalSecs:", objc_msgSend(v42, "integerValue"));

          id v43 = [v22 safeObjectForKey:@"NetworkTimeout" ofClass:objc_opt_class(NSNumber)];
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          objc_msgSend(v32, "setCheckForNewerTimeoutSecs:", objc_msgSend(v44, "integerValue"));

          id v45 = [v22 safeObjectForKey:@"AllowCheckOverNetworkExpensive" ofClass:objc_opt_class(NSNumber)];
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          objc_msgSend(v32, "setAllowAutoCheckForNewerOverExpensive:", objc_msgSend(v46, "BOOLValue"));

          id v47 = [v22 safeObjectForKey:@"AllowAutoCheckForNewerWhenCPUHigh" ofClass:objc_opt_class(NSNumber)];
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          objc_msgSend(v32, "setAllowAutoCheckForNewerWhenCPUHigh:", objc_msgSend(v48, "BOOLValue"));

          id v49 = [v22 safeObjectForKey:@"AllowAutoCheckForNewerWhenBatteryLow" ofClass:objc_opt_class(NSNumber)];
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          objc_msgSend(v32, "setAllowAutoCheckForNewerWhenBatteryLow:", objc_msgSend(v50, "BOOLValue"));

          id v51 = [v22 safeObjectForKey:@"AllowAutoDownloadWhenBatteryLow" ofClass:objc_opt_class(NSNumber)];
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          objc_msgSend(v32, "setAllowAutoDownloadWhenBatteryLow:", objc_msgSend(v52, "BOOLValue"));

          id v53 = [v22 safeObjectForKey:@"AllowAutoDownloadWhenCPUHigh" ofClass:objc_opt_class(NSNumber)];
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          objc_msgSend(v32, "setAllowAutoDownloadWhenCPUHigh:", objc_msgSend(v54, "BOOLValue"));

          id v55 = [v22 safeObjectForKey:@"Jitter" ofClass:objc_opt_class(NSNumber)];
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          objc_msgSend(v32, "setNewerFoundAutoDownloadJitterSecs:", objc_msgSend(v56, "integerValue"));

          v107 = v32;
          v57 = (void *)objc_claimAutoreleasedReturnValue([v32 summary]);
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon didReceivePushNotification:]",  @"Created the following push MAAutoAssetUpdatePolicy: %@",  v58,  v59,  v60,  v61,  (uint64_t)v57);

          uint64_t v62 = objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"AdditionalInfo"]);
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon pushServiceConnection](self, "pushServiceConnection"));
          uint64_t v64 = objc_claimAutoreleasedReturnValue([v63 subscribedChannels]);
          v65 = (void *)v64;
          v66 = &__NSArray0__struct;
          if (v64) {
            v66 = (void *)v64;
          }
          id v67 = v66;

          v68 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          __int128 v121 = 0u;
          __int128 v122 = 0u;
          id v69 = v67;
          id v70 = [v69 countByEnumeratingWithState:&v119 objects:v127 count:16];
          if (v70)
          {
            id v71 = v70;
            uint64_t v72 = *(void *)v120;
            do
            {
              for (i = 0LL; i != v71; i = (char *)i + 1)
              {
                if (*(void *)v120 != v72) {
                  objc_enumerationMutation(v69);
                }
                -[NSMutableArray addObject:](v68, "addObject:", v74);
              }

              id v71 = [v69 countByEnumeratingWithState:&v119 objects:v127 count:16];
            }

            while (v71);
          }

          v101 = v28;
          v102 = v22;
          if (v28)
          {
            v75 = v111;
            v76 = (void *)v62;
            if (v115)
            {
              id v77 = v115;

              id v78 = v28;
              v79 = v78;
              v75 = v77;
              v80 = v113;
            }

            else
            {
              v80 = v113;
              v79 = v110;
            }
          }

          else
          {
            v76 = (void *)v62;
            v80 = v113;
            v79 = v110;
            v75 = v111;
          }

          id v81 = objc_msgSend( [MAAutoAssetPushNotification alloc],  "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:",  objc_msgSend(v116, "integerValue"),  v75,  v79,  v109,  v107,  v76);
          v82 = (void *)objc_claimAutoreleasedReturnValue( +[MADAnalyticsManager getAnalyticsManager]( &OBJC_CLASS___MADAnalyticsManager,  "getAnalyticsManager"));
          BYTE1(v92) = v103;
          LOBYTE(v92) = v104;
          id v83 =  [v82 recordPushNotification:v79 assetType:v75 cloudChannels:v68 forPopulationType:-[MAPushNotificationServiceDaemon channelTypeForDevice](v114 userInitiated:"channelTypeForDevice") interestAcrossTerm:v106 lo ckAcrossReboot:v105 lockAcrossTermination:v92];

          [v98 addObject:v81];
          objc_autoreleasePoolPop(context);
          id v20 = v80 + 1;
          self = v114;
        }

        while (v20 != v100);
        id v100 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
      }

      while (v100);
    }

    id v84 = [v98 copy];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushNotificationServiceDaemon didReceivePushNotification:]",  @"Created the following MAAutoAssetPushNotifications: %@",  v85,  v86,  v87,  v88,  (uint64_t)v84);

    id v89 = [v98 copy];
    +[MADAutoAssetControlManager handleReceivedPushNotifications:]( &OBJC_CLASS___MADAutoAssetControlManager,  "handleReceivedPushNotifications:",  v89);

    uint64_t v6 = v94;
    id v4 = v95;
    __int128 v19 = v93;
  }

  else
  {
    _MobileAssetLog( 0LL,  4,  (uint64_t)"-[MAPushNotificationServiceDaemon didReceivePushNotification:]",  @"No push notification update policies found",  v15,  v16,  v17,  v18,  v91);
  }

  v90 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationServiceDaemon clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __62__MAPushNotificationServiceDaemon_didReceivePushNotification___block_invoke;
  block[3] = &unk_34DB98;
  void block[4] = self;
  id v118 = v4;
  dispatch_sync(v90, block);

LABEL_30:
}

void __62__MAPushNotificationServiceDaemon_didReceivePushNotification___block_invoke(uint64_t a1)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
  id v3 = [v2 copy];

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v7);
        id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientUpstreamQueue]);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = __62__MAPushNotificationServiceDaemon_didReceivePushNotification___block_invoke_2;
        v10[3] = &unk_34DB98;
        v10[4] = v8;
        id v11 = *(id *)(a1 + 40);
        dispatch_async(v9, v10);

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

void __62__MAPushNotificationServiceDaemon_didReceivePushNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pushPayload]);
  [v1 didReceivePushNotificationWithInfo:v2];
}

- (void)channelSubscriptionsFailedWithReasons:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientUpstreamQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientUpstreamQueue:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setServiceQueue:(id)a3
{
}

- (NSMutableArray)clients
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setClients:(id)a3
{
}

- (MAPushServiceConnection)pushServiceConnection
{
  return (MAPushServiceConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPushServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end