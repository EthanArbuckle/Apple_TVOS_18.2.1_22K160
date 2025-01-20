@interface RMAudioAccessoryManager
+ (BOOL)isTempestActive;
+ (id)internal;
+ (void)setTempestActive:(BOOL)a3;
- (BOOL)subscribedToStatus;
- (RMAudioAccessoryManager)init;
- (id)activityHandler;
- (id)deviceMotionHandler;
- (id)deviceMotionStatusHandler;
- (void)dealloc;
- (void)setActivityHandler:(id)a3;
- (void)setDeviceMotionHandler:(id)a3;
- (void)setDeviceMotionStatusHandler:(id)a3;
- (void)setSubscribedToStatus:(BOOL)a3;
- (void)startActivityUpdatesWithHandler:(id)a3;
- (void)startDeviceMotionUpdatesWithHandler:(id)a3;
- (void)startStatusUpdatesWithHandler:(id)a3;
- (void)stopActivityUpdates;
- (void)stopDeviceMotionUpdates;
- (void)stopStatusUpdates;
@end

@implementation RMAudioAccessoryManager

+ (id)internal
{
  return +[RMAudioAccessoryManagerSharedInternal sharedInternal]( &OBJC_CLASS___RMAudioAccessoryManagerSharedInternal,  "sharedInternal");
}

- (RMAudioAccessoryManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RMAudioAccessoryManager;
  v2 = -[RMAudioAccessoryManager init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = [(id)objc_opt_class(v2) internal];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_sync_enter(v5);
    -[RMAudioAccessoryManager setSubscribedToStatus:](v3, "setSubscribedToStatus:", 0LL);
    id v6 = [(id)objc_opt_class(v3) internal];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managers]);
    [v8 addObject:v3];

    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CAE8);
    }
    v9 = (os_log_s *)(id)qword_100023978;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(id)objc_opt_class(v3) internal];
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 managers]);
      *(_DWORD *)buf = 134283779;
      v16 = v3;
      __int16 v17 = 2113;
      v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] %{private}p.init managers: %{private}@",  buf,  0x16u);
    }

    objc_sync_exit(v5);
  }

  return v3;
}

- (void)dealloc
{
  id v3 = [(id)objc_opt_class(self) internal];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(v4);
  -[RMAudioAccessoryManager stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  id v5 = [(id)objc_opt_class(self) internal];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managers]);
  [v7 removeObject:self];

  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CAE8);
  }
  v8 = (os_log_s *)(id)qword_100023978;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(id)objc_opt_class(self) internal];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 managers]);
    *(_DWORD *)buf = 134283779;
    objc_super v14 = self;
    __int16 v15 = 2113;
    v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] %{private}p.dealloc managers: %{private}@",  buf,  0x16u);
  }

  objc_sync_exit(v4);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMAudioAccessoryManager;
  -[RMAudioAccessoryManager dealloc](&v12, "dealloc");
}

- (void)startDeviceMotionUpdatesWithHandler:(id)a3
{
  id v8 = a3;
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setDeviceMotionHandler:](self, "setDeviceMotionHandler:", v8);
  id v6 = [(id)objc_opt_class(self) internal];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 startOrStopDeviceMotionUpdates];

  objc_sync_exit(v5);
}

- (void)stopDeviceMotionUpdates
{
  id v3 = [(id)objc_opt_class(self) internal];
  id obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  if (!-[RMAudioAccessoryManager subscribedToStatus](self, "subscribedToStatus")) {
    -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", 0LL);
  }
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 startOrStopStatusUpdates];

  -[RMAudioAccessoryManager setDeviceMotionHandler:](self, "setDeviceMotionHandler:", 0LL);
  id v6 = [(id)objc_opt_class(self) internal];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 startOrStopDeviceMotionUpdates];

  objc_sync_exit(obj);
}

- (void)startStatusUpdatesWithHandler:(id)a3
{
  id v11 = a3;
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setSubscribedToStatus:](self, "setSubscribedToStatus:", 1LL);
  -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", v11);
  id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[RMAudioAccessoryManager deviceMotionStatusHandler]( self,  "deviceMotionStatusHandler"));
  id v7 = [(id)objc_opt_class(self) internal];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  ((void (**)(void, id, void))v6)[2](v6, [v8 lastDeviceStatus], 0);

  id v9 = [(id)objc_opt_class(self) internal];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v10 startOrStopStatusUpdates];

  objc_sync_exit(v5);
}

- (void)stopStatusUpdates
{
  id v3 = [(id)objc_opt_class(self) internal];
  id obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", 0LL);
  -[RMAudioAccessoryManager setSubscribedToStatus:](self, "setSubscribedToStatus:", 0LL);
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 startOrStopStatusUpdates];

  objc_sync_exit(obj);
}

- (void)startActivityUpdatesWithHandler:(id)a3
{
  id v8 = a3;
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setActivityHandler:](self, "setActivityHandler:", v8);
  id v6 = [(id)objc_opt_class(self) internal];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 startOrStopActivityUpdates];

  objc_sync_exit(v5);
}

- (void)stopActivityUpdates
{
  id v3 = [(id)objc_opt_class(self) internal];
  id obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  -[RMAudioAccessoryManager setActivityHandler:](self, "setActivityHandler:", 0LL);
  id v4 = [(id)objc_opt_class(self) internal];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 startOrStopActivityUpdates];

  objc_sync_exit(obj);
}

+ (BOOL)isTempestActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 internal]);
  unsigned __int8 v3 = [v2 isTempestActive];

  return v3;
}

+ (void)setTempestActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 internal]);
  [v4 setTempestActive:v3];
}

- (BOOL)subscribedToStatus
{
  return self->_subscribedToStatus;
}

- (void)setSubscribedToStatus:(BOOL)a3
{
  self->_subscribedToStatus = a3;
}

- (id)deviceMotionHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDeviceMotionHandler:(id)a3
{
}

- (id)deviceMotionStatusHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDeviceMotionStatusHandler:(id)a3
{
}

- (id)activityHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setActivityHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end