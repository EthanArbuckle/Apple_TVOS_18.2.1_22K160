@interface DaemonServiceLocator
+ (id)sharedInstance;
- (DaemonServiceLocator)init;
- (LACDarwinNotificationCenter)darwinNotificationCenter;
- (LACEnvironmentService)environment;
- (LACSharedModeService)sharedMode;
- (LACUserInterfaceController)uiController;
- (id)serviceWithIdentifier:(id)a3;
- (void)_startEnvironment;
- (void)_startNotificationServices;
- (void)registerService:(id)a3 identifier:(id)a4;
- (void)startServices;
@end

@implementation DaemonServiceLocator

+ (id)sharedInstance
{
  if (qword_10003E230 != -1) {
    dispatch_once(&qword_10003E230, &stru_1000310A0);
  }
  return (id)qword_10003E228;
}

- (DaemonServiceLocator)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___DaemonServiceLocator;
  v2 = -[DaemonServiceLocator init](&v32, "init");
  if (v2 && objc_opt_class(&OBJC_CLASS___LACServiceLocator))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___LACServiceLocator);
    locator = v2->_locator;
    v2->_locator = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___LACUserInterfaceController);
    uiController = v2->_uiController;
    v2->_uiController = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    notificationObservers = v2->_notificationObservers;
    v2->_notificationObservers = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[LACDarwinNotificationCenter sharedInstance](&OBJC_CLASS___LACDarwinNotificationCenter, "sharedInstance"));
    darwinNotificationCenter = v2->_darwinNotificationCenter;
    v2->_darwinNotificationCenter = (LACDarwinNotificationCenter *)v9;

    v11 = v2->_darwinNotificationCenter;
    v12 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACDarwinNotificationCenter);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[DaemonServiceLocator registerService:identifier:](v2, "registerService:identifier:", v11, v13);

    v14 = objc_alloc(&OBJC_CLASS___LACSharedModeService);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils queue](&OBJC_CLASS___DaemonUtils, "queue"));
    v16 = -[LACSharedModeService initWithReplyQueue:](v14, "initWithReplyQueue:", v15);
    sharedMode = v2->_sharedMode;
    v2->_sharedMode = v16;

    v18 = v2->_sharedMode;
    v19 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACSharedModeService);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[DaemonServiceLocator registerService:identifier:](v2, "registerService:identifier:", v18, v20);

    v21 = objc_alloc_init(&OBJC_CLASS___LACEnvironmentDependencies);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[LACBiometryHelper sharedInstance](&OBJC_CLASS___LACBiometryHelper, "sharedInstance"));
    -[LACEnvironmentDependencies setBiometryHelper:](v21, "setBiometryHelper:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[LACPasscodeHelper sharedInstance](&OBJC_CLASS___LACPasscodeHelper, "sharedInstance"));
    -[LACEnvironmentDependencies setPasscodeHelper:](v21, "setPasscodeHelper:", v23);

    v24 = objc_alloc(&OBJC_CLASS___EnvironmentService);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils queue](&OBJC_CLASS___DaemonUtils, "queue"));
    v26 = -[EnvironmentService initWithDependencies:workQueue:](v24, "initWithDependencies:workQueue:", v21, v25);
    environment = v2->_environment;
    v2->_environment = (LACEnvironmentService *)v26;

    v28 = v2->_environment;
    v29 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACEnvironmentService);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[DaemonServiceLocator registerService:identifier:](v2, "registerService:identifier:", v28, v30);
  }

  return v2;
}

- (void)startServices
{
}

- (void)_startNotificationServices
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = self->_notificationObservers;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[LACDarwinNotificationCenter addObserver:]( self->_darwinNotificationCenter,  "addObserver:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[LACDarwinNotificationCenter listenToLaunchNotifications]( self->_darwinNotificationCenter,  "listenToLaunchNotifications");
}

- (void)_startEnvironment
{
}

- (void)registerService:(id)a3 identifier:(id)a4
{
}

- (id)serviceWithIdentifier:(id)a3
{
  return -[LACServiceLocator serviceWithIdentifier:](self->_locator, "serviceWithIdentifier:", a3);
}

- (LACDarwinNotificationCenter)darwinNotificationCenter
{
  return self->_darwinNotificationCenter;
}

- (LACEnvironmentService)environment
{
  return self->_environment;
}

- (LACSharedModeService)sharedMode
{
  return self->_sharedMode;
}

- (LACUserInterfaceController)uiController
{
  return self->_uiController;
}

- (void).cxx_destruct
{
}

@end