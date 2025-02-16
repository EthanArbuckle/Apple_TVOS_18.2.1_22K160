@interface ACCFeatureServer
+ (id)sharedServer;
- (ACCFeatureServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)isServerStarted;
- (NSCountedSet)subFeatureSubscribers;
- (int)featureUserCount;
- (void)addSubscriber:(id)a3;
- (void)dealloc;
- (void)decrementUserCount;
- (void)incrementUserCount;
- (void)removeSubscriber:(id)a3;
- (void)sendUpdatedSubscriberList;
- (void)setFeatureUserCount:(int)a3;
- (void)setIsServerStarted:(BOOL)a3;
- (void)setSubFeatureSubscribers:(id)a3;
- (void)startServer;
- (void)suspendServer;
@end

@implementation ACCFeatureServer

- (ACCFeatureServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ACCFeatureServer;
  v8 = -[ACCFeatureServer init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_xpcServiceName, a3);
    v9->_notification = a4;
    v9->_isServerStarted = 0;
    v9->_featureUserCount = 0;
    v10 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    subFeatureSubscribers = v9->_subFeatureSubscribers;
    v9->_subFeatureSubscribers = v10;

    v12 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v9->_xpcServiceName);
    listener = v9->_listener;
    v9->_listener = v12;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    v9->_notificationToken = -1;
    notify_register_check(v9->_notification, &v9->_notificationToken);
  }

  return v9;
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if ((notificationToken & 0x80000000) == 0) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACCFeatureServer;
  -[ACCFeatureServer dealloc](&v4, "dealloc");
}

- (void)startServer
{
  if (!-[ACCFeatureServer isServerStarted](self, "isServerStarted"))
  {
    -[ACCFeatureServer setIsServerStarted:](self, "setIsServerStarted:", 1LL);
    -[NSXPCListener resume](self->_listener, "resume");
    int notificationToken = self->_notificationToken;
    if ((notificationToken & 0x80000000) == 0) {
      notify_set_state(notificationToken, 1uLL);
    }
    notify_post(self->_notification);
    if (gLogObjects && gNumLogObjects >= 5)
    {
      objc_super v4 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      xpcServiceName = self->_xpcServiceName;
      int v7 = 138412290;
      v8 = xpcServiceName;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started server: %@...", (uint8_t *)&v7, 0xCu);
    }
  }

- (void)suspendServer
{
  if (-[ACCFeatureServer isServerStarted](self, "isServerStarted"))
  {
    -[ACCFeatureServer setIsServerStarted:](self, "setIsServerStarted:", 0LL);
    -[NSXPCListener suspend](self->_listener, "suspend");
    int notificationToken = self->_notificationToken;
    if ((notificationToken & 0x80000000) == 0) {
      notify_set_state(notificationToken, 0LL);
    }
    notify_post(self->_notification);
    if (gLogObjects && gNumLogObjects >= 5)
    {
      objc_super v4 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      xpcServiceName = self->_xpcServiceName;
      int v7 = 138412290;
      v8 = xpcServiceName;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Suspended server: %@...",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)incrementUserCount
{
  obj = self;
  objc_sync_enter(obj);
  -[ACCFeatureServer setFeatureUserCount:]( obj,  "setFeatureUserCount:",  -[ACCFeatureServer featureUserCount](obj, "featureUserCount") + 1);
  if (-[ACCFeatureServer featureUserCount](obj, "featureUserCount") == 1) {
    -[ACCFeatureServer startServer](obj, "startServer");
  }
  objc_sync_exit(obj);
}

- (void)decrementUserCount
{
  obj = self;
  objc_sync_enter(obj);
  -[ACCFeatureServer setFeatureUserCount:]( obj,  "setFeatureUserCount:",  -[ACCFeatureServer featureUserCount](obj, "featureUserCount") - 1);
  if (-[ACCFeatureServer featureUserCount](obj, "featureUserCount") < 0) {
    -[ACCFeatureServer setFeatureUserCount:](obj, "setFeatureUserCount:", 0LL);
  }
  if (!-[ACCFeatureServer featureUserCount](obj, "featureUserCount")) {
    -[ACCFeatureServer suspendServer](obj, "suspendServer");
  }
  objc_sync_exit(obj);
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
    [v5 addObject:v4];

    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 5;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v8 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    else
    {
      v8 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2048;
      id v13 = [v9 countForObject:v4];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Added subscriber for key: %@... New count: %lu",  (uint8_t *)&v10,  0x16u);
    }

    -[ACCFeatureServer sendUpdatedSubscriberList](self, "sendUpdatedSubscriberList");
  }
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
    [v5 removeObject:v4];

    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 5;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v8 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    else
    {
      v8 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2048;
      id v13 = [v9 countForObject:v4];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Removed subscriber for key: %@... New count: %lu",  (uint8_t *)&v10,  0x16u);
    }

    -[ACCFeatureServer sendUpdatedSubscriberList](self, "sendUpdatedSubscriberList");
  }
}

- (void)sendUpdatedSubscriberList
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "THIS METHOD MUST BE OVERRIDDEN! (sendUpdatedSubscriberList)",  v1,  2u);
}

+ (id)sharedServer
{
  return 0LL;
}

- (BOOL)isServerStarted
{
  return self->_isServerStarted;
}

- (void)setIsServerStarted:(BOOL)a3
{
  self->_isServerStarted = a3;
}

- (int)featureUserCount
{
  return self->_featureUserCount;
}

- (void)setFeatureUserCount:(int)a3
{
  self->_featureUserCount = a3;
}

- (NSCountedSet)subFeatureSubscribers
{
  return self->_subFeatureSubscribers;
}

- (void)setSubFeatureSubscribers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end