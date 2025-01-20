@interface EAWiFiUnconfiguredAccessoryBrowserManager
+ (EAWiFiUnconfiguredAccessoryBrowserManager)sharedInstance;
- (BOOL)isConfiguring;
- (EAWiFiUnconfiguredAccessory)accessoryBeingConfigured;
- (EAWiFiUnconfiguredAccessoryBrowserManager)init;
- (NSCopying)currentRequestIdentifier;
- (NSExtension)extension;
- (NSMutableDictionary)_accessoryToDeviceID;
- (NSMutableSet)_accessories;
- (NSSet)unconfiguredAccessories;
- (NSString)unconfiguredDeviceID;
- (NSXPCConnection)connectionToWACEAService;
- (UIViewController)targetViewController;
- (WACUIRemoteViewController)remoteViewController;
- (int64_t)currentBrowserState;
- (void)_signalPresentationComplete;
- (void)cancelActiveConfiguration;
- (void)configureAccessory:(id)a3 withConfigurationUIOnViewController:(id)a4;
- (void)didFindNewUnconfiguredAccessories:(id)a3 andRemovedUnconfiguredAccessories:(id)a4;
- (void)dismissWithStatus:(int)a3;
- (void)openHomeAppForConfiguration;
- (void)purgeAccessoriesSet;
- (void)setAccessoryBeingConfigured:(id)a3;
- (void)setConnectionToWACEAService:(id)a3;
- (void)setCurrentBrowserState:(int64_t)a3;
- (void)setCurrentRequestIdentifier:(id)a3;
- (void)setExtension:(id)a3;
- (void)setIsConfiguring:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setTargetViewController:(id)a3;
- (void)setUnconfiguredDeviceID:(id)a3;
- (void)set_accessories:(id)a3;
- (void)set_accessoryToDeviceID:(id)a3;
- (void)setup;
- (void)startSearchingForUnconfiguredAccessories;
- (void)stopSearchingForUnconfiguredAccessories;
- (void)updateState:(int64_t)a3;
- (void)wifiDidShutdown;
@end

@implementation EAWiFiUnconfiguredAccessoryBrowserManager

+ (EAWiFiUnconfiguredAccessoryBrowserManager)sharedInstance
{
  if (qword_CF50 != -1) {
    dispatch_once(&qword_CF50, &stru_8240);
  }
  return (EAWiFiUnconfiguredAccessoryBrowserManager *)(id)qword_CF58;
}

- (EAWiFiUnconfiguredAccessoryBrowserManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EAWiFiUnconfiguredAccessoryBrowserManager;
  v2 = -[EAWiFiUnconfiguredAccessoryBrowserManager init](&v8, "init");
  if (v2)
  {
    v2->__debugLog = +[WACLogging isEnabled](&OBJC_CLASS___WACLogging, "isEnabled");
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    v4 = (void *)setupSemaphore;
    setupSemaphore = (uint64_t)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WAC.workQueue", 0LL);
    v6 = (void *)workQueue;
    workQueue = (uint64_t)v5;

    dispatch_async((dispatch_queue_t)workQueue, &stru_8260);
    v2->_isConfiguring = 0;
    -[EAWiFiUnconfiguredAccessoryBrowserManager setup](v2, "setup");
  }

  return v2;
}

- (void)setup
{
  BOOL debugLog = self->__debugLog;
  id v31 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionWithIdentifier:error:]( &OBJC_CLASS___NSExtension,  "extensionWithIdentifier:error:",  @"com.apple.ExternalAccessory.WACUI",  &v31));
  id v17 = v31;
  -[EAWiFiUnconfiguredAccessoryBrowserManager setExtension:](self, "setExtension:", v4);

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager extension](self, "extension"));
  LODWORD(v4) = v5 == 0LL;

  if ((_DWORD)v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"Unable to load WAC UI extension",  @"Unable to load WAC UI extension: %@",  v6);
  }

  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: setup method called, error value returned: %@", v17);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_35EC;
  v28[3] = &unk_8288;
  BOOL v30 = debugLog;
  objc_copyWeak(&v29, &location);
  -[NSExtension setRequestCompletionBlock:](self->_extension, "setRequestCompletionBlock:", v28);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_365C;
  v25[3] = &unk_82B0;
  BOOL v27 = debugLog;
  objc_copyWeak(&v26, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_36E0;
  v22[3] = &unk_8320;
  BOOL v24 = debugLog;
  objc_copyWeak(&v23, &location);
  -[NSExtension setRequestInterruptionBlock:](self->_extension, "setRequestInterruptionBlock:", v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager currentRequestIdentifier](self, "currentRequestIdentifier"));
  BOOL v8 = v7 == 0LL;

  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
    extension = self->_extension;
    v33 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_3900;
    v19[3] = &unk_8348;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    BOOL v21 = debugLog;
    -[NSExtension instantiateViewControllerWithInputItems:connectionHandler:]( extension,  "instantiateViewControllerWithInputItems:connectionHandler:",  v11,  v19);

    objc_destroyWeak(&v20);
  }

  if (self->__debugLog) {
    NSLog(@"### WAC XPC: Starting call to XPC service");
  }
  v12 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.externalaccessory.WACEAService");
  connectionToWACEAService = self->_connectionToWACEAService;
  self->_connectionToWACEAService = v12;

  if (self->__debugLog) {
    NSLog(@"### WAC XPC: NSXPCConnection ");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___WACEAServiceProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToWACEAService, "setRemoteObjectInterface:", v14);

  if (self->__debugLog) {
    NSLog(@"### WAC XPC: _connectionToWACEAService.remoteObjectInterface");
  }
  -[NSXPCConnection setInterruptionHandler:](self->_connectionToWACEAService, "setInterruptionHandler:", &stru_8368);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToWACEAService, "setInvalidationHandler:", &stru_8388);
  -[NSXPCConnection resume](self->_connectionToWACEAService, "resume");
  if (self->__debugLog) {
    NSLog(@"### WAC XPC: _connectionToWACEAService resume");
  }
  v15 = self->_connectionToWACEAService;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_3A00;
  v18[3] = &unk_83B0;
  v18[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v15, "remoteObjectProxyWithErrorHandler:", v18));
  [v16 setup];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)startSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog( @"### WAC:%s:%d",  a2,  "-[EAWiFiUnconfiguredAccessoryBrowserManager startSearchingForUnconfiguredAccessories]",  288LL);
  }
  if (self->_currentBrowserState != 2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_3B00;
    block[3] = &unk_83D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, block);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_3BD0;
    v3[3] = &unk_83D8;
    v3[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, v3);
  }

- (void)stopSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog( @"### WAC:%s",  a2,  "-[EAWiFiUnconfiguredAccessoryBrowserManager stopSearchingForUnconfiguredAccessories]");
  }
  if (self->_currentBrowserState != 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_3CAC;
    block[3] = &unk_83D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }

- (void)cancelActiveConfiguration
{
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: cancelActiveConfiguration", a2);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3D6C;
  block[3] = &unk_83D8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)configureAccessory:(id)a3 withConfigurationUIOnViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->__debugLog) {
    NSLog(@"### WAC: BrowserManager: configureAccessory: self %@:  accessory: %@", self, v6);
  }
  objc_initWeak(&location, self);
  accessoryToDeviceID = self->__accessoryToDeviceID;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 macAddress]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](accessoryToDeviceID, "objectForKey:", v9));

  if (v10)
  {
    if (self->__debugLog) {
      NSLog( @"### WAC:%s:%d Reconfiguring SecureWAC device",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]",  333LL);
    }
    v11 = (dispatch_queue_s *)workQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_3FB8;
    v24[3] = &unk_8428;
    v12 = &v27;
    objc_copyWeak(&v27, &location);
    v13 = &v25;
    v14 = (id *)v26;
    id v25 = v6;
    v26[0] = v7;
    v26[1] = self;
    id v15 = v7;
    id v16 = v6;
    id v17 = v24;
  }

  else
  {
    if (self->__debugLog) {
      NSLog( @"### WAC XPC:%s:%d Reconfiguring WAC1 device",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]",  391LL);
    }
    v11 = (dispatch_queue_s *)workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_4308;
    block[3] = &unk_8428;
    v12 = &v23;
    objc_copyWeak(&v23, &location);
    v13 = &v21;
    v14 = (id *)v22;
    id v21 = v6;
    v22[0] = v7;
    v22[1] = self;
    id v18 = v7;
    id v19 = v6;
    id v17 = block;
  }

  dispatch_async(v11, v17);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)didFindNewUnconfiguredAccessories:(id)a3 andRemovedUnconfiguredAccessories:(id)a4
{
  id v43 = a3;
  id v6 = a4;
  if (!self->__accessories)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    accessories = self->__accessories;
    self->__accessories = v7;
  }

  if (!self->__accessoryToDeviceID)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    accessoryToDeviceID = self->__accessoryToDeviceID;
    self->__accessoryToDeviceID = v9;
  }

  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v59;
    uint64_t v44 = *(void *)v59;
    do
    {
      id v15 = 0LL;
      id v45 = v13;
      do
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v15);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___EAWiFiUnconfiguredAccessory);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          -[NSMutableSet removeObject:](self->__accessories, "removeObject:", v16);
          -[NSMutableSet addObject:](v11, "addObject:", v16);
        }

        else
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"wacMACAddress"]);
          uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"macAddress == %@",  v18));

          id v48 = (id)v19;
          id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableSet filteredSetUsingPredicate:]( self->__accessories,  "filteredSetUsingPredicate:",  v19));
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          id v21 = [v20 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v55;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v55 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
                -[NSMutableSet removeObject:](self->__accessories, "removeObject:", v25);
                id v26 = self->__accessoryToDeviceID;
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 macAddress]);
                -[NSMutableDictionary removeObjectForKey:](v26, "removeObjectForKey:", v27);

                -[NSMutableSet addObject:](v11, "addObject:", v25);
              }

              id v22 = [v20 countByEnumeratingWithState:&v54 objects:v63 count:16];
            }

            while (v22);
          }

          uint64_t v14 = v44;
          id v13 = v45;
        }

        id v15 = (char *)v15 + 1;
      }

      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }

    while (v13);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v49 = v43;
  id v28 = [v49 countByEnumeratingWithState:&v50 objects:v62 count:16];
  id v29 = v47;
  if (v28)
  {
    id v30 = v28;
    uint64_t v31 = *(void *)v51;
    do
    {
      for (j = 0LL; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v49);
        }
        v33 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
        v34 = -[EAWiFiUnconfiguredAccessory initWithAirPortAssistantWACDevice:]( objc_alloc(&OBJC_CLASS___EAWiFiUnconfiguredAccessory),  "initWithAirPortAssistantWACDevice:",  v33);
        -[NSMutableSet addObject:](self->__accessories, "addObject:", v34);
        if (self->__debugLog) {
          NSLog( @"### WAC: %s:%d: Checking SecureWAC and HomeKit flags",  "-[EAWiFiUnconfiguredAccessoryBrowserManager didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:]",  460LL);
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"wacSupportsSpruce"]);
        if ([v35 BOOLValue])
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"wacSupportsSecureWAC"]);
          unsigned int v37 = [v36 BOOLValue];

          id v29 = v47;
          if (!v37) {
            goto LABEL_35;
          }
          if (self->__debugLog) {
            NSLog( @"### WAC: %s:%d: New SecureWAC Accessory Found: %@",  "-[EAWiFiUnconfiguredAccessoryBrowserManager didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:]",  466LL,  v33);
          }
          v38 = self->__accessoryToDeviceID;
          v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"wacDeviceID"]);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessory macAddress](v34, "macAddress"));
          -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", v35, v39);

          id v29 = v47;
        }

LABEL_35:
        -[NSMutableSet addObject:](v29, "addObject:", v34);
      }

      id v30 = [v49 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }

    while (v30);
  }

  objc_storeStrong((id *)&self->_unconfiguredAccessories, self->__accessories);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if (-[NSMutableSet count](v11, "count"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v11,  @"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"));
    [v40 postNotificationName:@"EAWiFiUnconfiguredAccessoriesRemovedNotification" object:self userInfo:v41];

    id v29 = v47;
  }

  if (-[NSMutableSet count](v29, "count"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v29,  @"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"));
    [v40 postNotificationName:@"EAWiFiUnconfiguredAccessoriesAddedNotification" object:self userInfo:v42];

    id v29 = v47;
  }
}

- (void)updateState:(int64_t)a3
{
  if (self->__debugLog) {
    NSLog( @"### WAC: %s:%d state: %d",  "-[EAWiFiUnconfiguredAccessoryBrowserManager updateState:]",  502LL,  a3);
  }
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v5,  @"EAWiFiUnconfiguredAccessoryBrowserState"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserDidUpdateState" object:self userInfo:v7];
}

- (void)purgeAccessoriesSet
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserPurgeAccessoriesSet" object:self userInfo:0];
}

- (void)dismissWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: dismissWithStatus method called, status: %d", a2, a3);
  }
  self->_isConfiguring = 0;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager targetViewController](self, "targetViewController"));
  [v5 dismissViewControllerAnimated:1 completion:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager accessoryBeingConfigured](self, "accessoryBeingConfigured"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v6,  @"EAWiFiUnconfiguredAccessoryConfigured"));

  if (self->__debugLog) {
    NSLog( @" WAC: BrowserManager: dismissWithStatus, status: %d (cancel=%d), notificationInfoDict %@",  v3,  -6723LL,  v7);
  }
  if ((_DWORD)v3)
  {
    else {
      uint64_t v10 = 2LL;
    }
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[EAWiFiUnconfiguredAccessoryBrowserManager accessoryBeingConfigured]( self,  "accessoryBeingConfigured"));
    id v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    -[EAWiFiUnconfiguredAccessoryBrowserManager didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:]( self,  "didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:",  0LL,  v9);

    uint64_t v10 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  [v7 setObject:v11 forKey:@"EAWiFiUnconfiguredAccessoryBrowserConfigurationStatus"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification" object:self userInfo:v7];

  -[EAWiFiUnconfiguredAccessoryBrowserManager setAccessoryBeingConfigured:](self, "setAccessoryBeingConfigured:", 0LL);
}

- (void)_signalPresentationComplete
{
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: _signalPresentationComplete method called", a2);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)setupSemaphore);
}

- (void)wifiDidShutdown
{
  if ((char *)-[EAWiFiUnconfiguredAccessoryBrowserManager currentBrowserState](self, "currentBrowserState") == (char *)&dword_0 + 2)
  {
    -[EAWiFiUnconfiguredAccessoryBrowserManager stopSearchingForUnconfiguredAccessories]( self,  "stopSearchingForUnconfiguredAccessories");
  }

  else if ((char *)-[EAWiFiUnconfiguredAccessoryBrowserManager currentBrowserState](self, "currentBrowserState") == (char *)&dword_0 + 3)
  {
    -[EAWiFiUnconfiguredAccessoryBrowserManager cancelActiveConfiguration](self, "cancelActiveConfiguration");
  }

  -[EAWiFiUnconfiguredAccessoryBrowserManager updateState:](self, "updateState:", 0LL);
}

- (void)openHomeAppForConfiguration
{
  if (self->__debugLog)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager unconfiguredDeviceID](self, "unconfiguredDeviceID"));
    NSLog(@"%s: (id: %@)", "-[EAWiFiUnconfiguredAccessoryBrowserManager openHomeAppForConfiguration]", v3);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"com.apple.Home://reprovisionDevice/"));
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager unconfiguredDeviceID](self, "unconfiguredDeviceID"));
  id v7 = [v6 length];

  if ((uint64_t)v7 >= 1)
  {
    for (uint64_t i = 0LL; i < (uint64_t)v7; i += 2LL)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EAWiFiUnconfiguredAccessoryBrowserManager unconfiguredDeviceID](self, "unconfiguredDeviceID"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", i, 2));
      -[NSMutableArray addObject:](v5, "addObject:", v10);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", @":"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uppercaseString]);

  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v12]);
  if (self->__debugLog) {
    NSLog( @"%s: launchURL: %@",  "-[EAWiFiUnconfiguredAccessoryBrowserManager openHomeAppForConfiguration]",  v13);
  }
  -[EAWiFiUnconfiguredAccessoryBrowserManager openURL:](self, "openURL:", v13);
}

- (NSSet)unconfiguredAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (EAWiFiUnconfiguredAccessory)accessoryBeingConfigured
{
  return (EAWiFiUnconfiguredAccessory *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAccessoryBeingConfigured:(id)a3
{
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExtension:(id)a3
{
}

- (WACUIRemoteViewController)remoteViewController
{
  return (WACUIRemoteViewController *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (UIViewController)targetViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_targetViewController);
}

- (void)setTargetViewController:(id)a3
{
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setCurrentRequestIdentifier:(id)a3
{
}

- (NSMutableSet)_accessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)set_accessories:(id)a3
{
}

- (int64_t)currentBrowserState
{
  return self->_currentBrowserState;
}

- (void)setCurrentBrowserState:(int64_t)a3
{
  self->_currentBrowserState = a3;
}

- (BOOL)isConfiguring
{
  return self->_isConfiguring;
}

- (void)setIsConfiguring:(BOOL)a3
{
  self->_isConfiguring = a3;
}

- (NSXPCConnection)connectionToWACEAService
{
  return self->_connectionToWACEAService;
}

- (void)setConnectionToWACEAService:(id)a3
{
}

- (NSMutableDictionary)_accessoryToDeviceID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)set_accessoryToDeviceID:(id)a3
{
}

- (NSString)unconfiguredDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setUnconfiguredDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end