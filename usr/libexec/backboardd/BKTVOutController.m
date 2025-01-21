@interface BKTVOutController
- (BKTVOutController)init;
- (BOOL)displayIsConnected:(id)a3;
- (BOOL)supportCloningToDisplay:(id)a3;
- (NSArray)windowServerDisplays;
- (id)windowServerDisplayForDisplayIdentifier:(unsigned int)a3;
- (void)_handleIapServerConnectionDied;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)systemShellDidFinishLaunching:(id)a3;
@end

@implementation BKTVOutController

- (BKTVOutController)init
{
  v34.receiver = self;
  [v34 setSuperclass:[BKTVOutController class]];
  BKTVOutController *v2 = [[BKTVOutController alloc] init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboardd.BKTVOutController.workQueue");
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;

    BKDisplayCloneMirroringManager *v5 = [[BKDisplayCloneMirroringManager alloc] initWithDisplayProvider:v2];
    queue_cloneMirrorManager = v2->_queue_cloneMirrorManager;
    v2->_queue_cloneMirrorManager = v5;

    v27 = [CAWindowServer serverIfRunning];
    v7 = [v27 displayWithName:@"TVOut"];
    if (v7)
    {
      id v8 = sub_1000195F8();
      v9 = [v8 autorelease];

      if (v7 == v9) {
        v2->_queue_forceTVOutMode = 1;
      }
    }

    v26 = [CADisplay TVOutDisplay];
    [v26 addObserver:v2 forKeyPath:@"currentMode" options:0 context:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_1000443DC,  @"com.apple.iapd.videoout.SettingsChanged",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( LocalCenter,  v2,  (CFNotificationCallback)sub_1000443F0,  @"kIAPDServerDiedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = [NSNotificationCenter defaultCenter];
    v13 = [BKTetherController sharedInstance];
    [v12 addObserver:v2 selector:"_tetherSettingChanged:" name:@"BKTetherControllerTetherStateChangedNotification" object:v13];

    v14 = [BKSystemShellSentinel sharedInstance];
    uint64_t v15 = [v14 addSystemShellObserver:v2 reason:@"BKTVOutController"];
    systemShellObserving = v2->_systemShellObserving;
    v2->_systemShellObserving = (BSInvalidatable *)v15;

    id v32 = 0LL;
    v33 = 0LL;
    sub_100043638((uint64_t)v2, &v33, &v32, 0);
    v17 = v33;
    id v18 = v32;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v19 = v17;
    [v19 countByEnumeratingWithState:v28 objects:v35 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          [v24 addObserver:v2 forKeyPath:@"availableModes" options:0 context:@"Wireless"];
          [v2 observeValueForKeyPath:@"availableModes" ofObject:v24 change:nil context:@"Wireless"];
        }

        [v19 countByEnumeratingWithState:v28 objects:v35 count:16];
      }

      while (v21);
    }

    if (v7 && v18)
    {
      sub_100043F20((uint64_t)v2, 1, v7);
      [v18 addObserver:v2 forKeyPath:@"availableModes" options:0 context:@"PurpleTVOut"];
      [v2 observeValueForKeyPath:@"availableModes" ofObject:nil change:nil context:@"PurpleTVOut"];
    }
  }

  return v2;
}

- (void)dealloc
{
  if (self)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"com.apple.iapd.videoout.SettingsChanged", 0LL);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, 0LL, @"kIAPDServerDiedNotification", 0LL);
    v5 = [NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"BKTetherControllerTetherStateChangedNotification" object:0];
  }

  v6.receiver = self;
  v6.super_class = [BKTVOutController class];
  [v6 dealloc];
}

- (NSArray)windowServerDisplays
{
  v2 = [CAWindowServer serverIfRunning];
  v3 = (void *)[v2 displays];

  return (NSArray *)v3;
}

- (id)windowServerDisplayForDisplayIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [CAWindowServer serverIfRunning];
  v5 = (void *)[v4 displayWithDisplayId:v3];

  return v5;
}

- (BOOL)displayIsConnected:(id)a3
{
  unsigned int v4 = [a3 displayId];
  if (self)
  {
    unsigned int v5 = v4;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    NSArray *v6 = [CADisplay displays];
    id v7 = [v6 countByEnumeratingWithState:v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ([v11 displayId] == v5)
          {
            id v12 = [v11 immutableCopy];
            goto LABEL_12;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = 0LL;
LABEL_12:
  }

  else
  {
    id v12 = 0LL;
  }

  v13 = (void *)[v12 availableModes];
  BOOL v14 = [v13 count] != 0;

  return v14;
}

- (BOOL)supportCloningToDisplay:(id)a3
{
  unsigned int v4 = (void *)[a3 name];
  if ([v4 isEqualToString:@"Wireless"])
  {
    BOOL v5 = 1;
  }

  else if ([v4 isEqualToString:@"TVOut"])
  {
    BOOL v5 = !self->_queue_forceTVOutMode;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v14 = [CADisplay class];
  id v15 = v11;
  __int128 v16 = v15;
  if (v14)
  {
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
      __int128 v17 = v16;
    }
    else {
      __int128 v17 = 0LL;
    }
  }

  else
  {
    __int128 v17 = 0LL;
  }

  id v18 = v17;

  if (v18)
  {
    if ([v10 isEqualToString:@"currentMode"])
    {
      id v19 = [v18 immutableCopy];
      workQueue = (dispatch_queue_s *)self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100043F90;
      block[3] = &unk_1000B6F18;
      id v32 = v16;
      id v33 = v12;
      objc_super v34 = self;
      id v35 = v19;
      id v21 = (os_log_s *)v19;
      dispatch_async(workQueue, block);

      uint64_t v22 = v32;
    }

    else
    {
      id v23 = [v10 isEqualToString:@"availableModes"];
      if (!(_DWORD)v23)
      {
        uint64_t v27 = BKLogDisplay(v23);
        os_log_s *v21 = v27;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v37 = v10;
          __int16 v38 = 2114;
          v39 = v16;
          __int16 v40 = 2114;
          id v41 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ changed on %{public}@ -> %{public}@",  buf,  0x20u);
        }

        goto LABEL_14;
      }

      id v24 = [v18 immutableCopy];
      v25 = (dispatch_queue_s *)self->_workQueue;
      v28[0] = _NSConcreteStackBlock;
      uint64_t v26 = 2LL * (a6 == @"Wireless");
      v28[1] = 3221225472LL;
      v28[2] = sub_1000441CC;
      v28[3] = &unk_1000B6F40;
      if (a6 == @"PurpleTVOut") {
        uint64_t v26 = 1LL;
      }
      v28[4] = self;
      id v29 = v24;
      uint64_t v30 = v26;
      id v21 = (os_log_s *)v24;
      dispatch_async(v25, v28);
      uint64_t v22 = v29;
    }

LABEL_14:
  }
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v11 = 0LL;
  id v12 = 0LL;
  sub_100043638((uint64_t)self, &v12, &v11, 1);
  unsigned int v4 = v12;
  id v5 = v11;
  if (-[NSMutableArray count](v4, "count")) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (!v6)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100043980;
    block[3] = &unk_1000B7158;
    void block[4] = self;
    uint64_t v9 = v4;
    id v10 = v5;
    dispatch_async(workQueue, block);
  }
}

- (void).cxx_destruct
{
}

- (void)_handleIapServerConnectionDied
{
  if (a1)
  {
    v1 = *(dispatch_queue_s **)(a1 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000435C8;
    block[3] = &unk_1000B8058;
    void block[4] = a1;
    dispatch_async(v1, block);
  }

@end