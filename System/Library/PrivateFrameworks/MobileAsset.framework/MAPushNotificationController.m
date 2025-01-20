@interface MAPushNotificationController
+ (id)sharedInstance;
- (MAPushNotificationController)init;
- (NSLock)serviceConnectionLock;
- (NSXPCConnection)serviceConnection;
- (id)_serviceConnection;
- (id)asyncProxy;
- (id)pushJobDescriptions;
- (id)subscribedChannelIDs;
- (id)synchronousProxy;
- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6;
- (void)asyncSubscribeToChannelWithIdentifier:(id)a3;
- (void)asyncUnsubscribeToChannelWithIdentifier:(id)a3;
- (void)didReceivePushNotificationWithInfo:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)setServiceConnectionLock:(id)a3;
- (void)subscribeToChannelWithIdentifier:(id)a3;
- (void)subscribedChannelIDsWithCompletion:(id)a3;
- (void)triggerNotificationWithPayload:(id)a3;
- (void)unsubscribeFromAllChannels;
- (void)unsubscribeToChannelWithIdentifier:(id)a3;
@end

@implementation MAPushNotificationController

- (MAPushNotificationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MAPushNotificationController;
  v2 = -[MAPushNotificationController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  return (id)sharedInstance_instance_0;
}

void __46__MAPushNotificationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MAPushNotificationController);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;
}

- (id)_serviceConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 lock];
  v4 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
  if (!v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.mobileassetd.push-notifications" options:4096];
    -[MAPushNotificationController setServiceConnection:](self, "setServiceConnection:", v5);

    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushNotificationController _serviceConnection]",  @"Could not connect to service %@",  v7,  v8,  v9,  v10,  (uint64_t)@"com.apple.mobileassetd.push-notifications");
    }
    MAPushServiceInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    [v12 setRemoteObjectInterface:v11];

    MAServiceClientInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    [v14 setExportedInterface:v13];
    v15 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    [v15 setExportedObject:self];

    objc_initWeak(&location, self);
    v16 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    [v16 setInterruptionHandler:&__block_literal_global_6];
    v17 = -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __50__MAPushNotificationController__serviceConnection__block_invoke_2;
    v22[3] = &unk_189FFB450;
    objc_copyWeak(&v23, &location);
    [v17 setInvalidationHandler:v22];

    id v18 = objc_loadWeakRetained(&location);
    [v18 serviceConnection];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 resume];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  v20 = -[MAPushNotificationController serviceConnectionLock](self, "serviceConnectionLock");
  [v20 unlock];

  -[MAPushNotificationController serviceConnection](self, "serviceConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__MAPushNotificationController__serviceConnection__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
}

void __50__MAPushNotificationController__serviceConnection__block_invoke_2( id *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained serviceConnectionLock];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 lock];

  id v11 = objc_loadWeakRetained(a1);
  [v11 setServiceConnection:0];

  id v14 = objc_loadWeakRetained(a1);
  [v14 serviceConnectionLock];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 unlock];
}

- (id)synchronousProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__MAPushNotificationController_synchronousProxy__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (id)asyncProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_15];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __42__MAPushNotificationController_asyncProxy__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)asyncSubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 subscribeToChannelWithIdentifier:v4];
}

- (void)subscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 subscribeToChannelWithIdentifier:v4];
}

- (void)asyncUnsubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 unsubscribeToChannelWithIdentifier:v4];
}

- (void)unsubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 unsubscribeToChannelWithIdentifier:v4];
}

- (void)subscribedChannelIDsWithCompletion:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 subscribedChannelIDsWithCompletion:v4];
}

- (void)unsubscribeFromAllChannels
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unsubscribeFromAllChannels];
}

- (id)subscribedChannelIDs
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0LL;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __52__MAPushNotificationController_subscribedChannelIDs__block_invoke;
  v5[3] = &unk_189FFB4D8;
  v5[4] = &v6;
  [v2 subscribedChannelIDsWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__MAPushNotificationController_subscribedChannelIDs__block_invoke(uint64_t a1, void *a2)
{
}

- (void)triggerNotificationWithPayload:(id)a3
{
  id v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 triggerPushNotificationWithPayload:v4];
}

- (id)pushJobDescriptions
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0LL;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__MAPushNotificationController_pushJobDescriptions__block_invoke;
  v5[3] = &unk_189FFB4D8;
  v5[4] = &v6;
  [v2 pushJobsAwaitingTriggerWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__MAPushNotificationController_pushJobDescriptions__block_invoke(uint64_t a1, void *a2)
{
}

- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 addSyntheticJobWithType:v12 assetSpecifier:v11 matchingAssetVersion:v10 triggerInterval:a6];
}

- (void)didReceivePushNotificationWithInfo:(id)a3
{
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (NSLock)serviceConnectionLock
{
  return self->_serviceConnectionLock;
}

- (void)setServiceConnectionLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end