@interface CNContactsDaemon
- (CNContactsDaemon)init;
- (NSArray)XPCActivities;
- (NSArray)XPCListenerPairs;
- (NSArray)XPCServices;
- (NSArray)activeBackgroundSystemTasks;
- (NSArray)activeXPCListenerPairs;
- (NSArray)activeXPCServices;
- (NSArray)applicationUnregisteredListeners;
- (NSArray)backgroundSystemTasks;
- (NSArray)notifydListeners;
- (OS_dispatch_queue)notificationQueue;
- (id)_notifydListenersByName;
- (void)registerBackgroundSystemTasks;
- (void)registerXPCActivities;
- (void)runOnRunLoop:(id)a3;
- (void)setActiveBackgroundSystemTasks:(id)a3;
- (void)setActiveXPCListenerPairs:(id)a3;
- (void)setActiveXPCServices:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)subscribeApplicationUnregisteredListeners;
- (void)subscribeNotifydListeners;
- (void)wakeXPCListeners;
- (void)wakeXPCServices;
@end

@implementation CNContactsDaemon

- (CNContactsDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CNContactsDaemon;
  v2 = -[CNContactsDaemon init](&v7, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.contacts.contactsd.notificationqueue", 0LL);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)XPCListenerPairs
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)XPCServices
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)notifydListeners
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)applicationUnregisteredListeners
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)XPCActivities
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)backgroundSystemTasks
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)runOnRunLoop:(id)a3
{
  id v8 = a3;
  -[CNContactsDaemon wakeXPCListeners](self, "wakeXPCListeners");
  -[CNContactsDaemon wakeXPCServices](self, "wakeXPCServices");
  -[CNContactsDaemon subscribeNotifydListeners](self, "subscribeNotifydListeners");
  -[CNContactsDaemon subscribeApplicationUnregisteredListeners](self, "subscribeApplicationUnregisteredListeners");
  -[CNContactsDaemon registerXPCActivities](self, "registerXPCActivities");
  -[CNContactsDaemon registerBackgroundSystemTasks](self, "registerBackgroundSystemTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 featureFlags]);
  unsigned int v6 = [v5 isFeatureEnabled:9];

  if (v6) {
    id v7 = +[CNDLimitedAccessSyncService sharedInstance](&OBJC_CLASS___CNDLimitedAccessSyncService, "sharedInstance");
  }
  [v8 run];
}

- (void)wakeXPCListeners
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon XPCListenerPairs](self, "XPCListenerPairs"));
  objc_msgSend(v3, "_cn_each:", &stru_100018CE0);
  -[CNContactsDaemon setActiveXPCListenerPairs:](self, "setActiveXPCListenerPairs:", v3);
}

- (void)wakeXPCServices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon XPCServices](self, "XPCServices"));
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_cn_filter:", &stru_100018D20));

  -[CNContactsDaemon setActiveXPCServices:](self, "setActiveXPCServices:", v4);
}

- (void)subscribeNotifydListeners
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E2F8(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon _notifydListenersByName](self, "_notifydListenersByName"));
  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100009C6C;
  handler[3] = &unk_100018D48;
  id v15 = v11;
  id v13 = v11;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)notificationQueue, handler);
}

- (void)subscribeApplicationUnregisteredListeners
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E39C(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100009E68;
  handler[3] = &unk_100018D48;
  void handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)notificationQueue, handler);
}

- (id)_notifydListenersByName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon notifydListeners](self, "notifydListeners"));
  id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interestedNotifications]);
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v11]);
              if (!v12)
              {
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                [v3 setObject:v12 forKey:v11];
              }

              [v12 addObject:v5];
            }

            id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }

          while (v8);
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v16);
  }

  return v3;
}

- (void)registerXPCActivities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon XPCActivities](self, "XPCActivities"));
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) registerActivity];
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

  objc_msgSend(v2, "_cn_each:", &stru_100018D88);
}

- (void)registerBackgroundSystemTasks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CNContactsDaemon backgroundSystemTasks](self, "backgroundSystemTasks"));
  objc_msgSend(v2, "_cn_each:", &stru_100018DC8);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
}

- (NSArray)activeXPCServices
{
  return self->_activeXPCServices;
}

- (void)setActiveXPCServices:(id)a3
{
}

- (NSArray)activeBackgroundSystemTasks
{
  return self->_activeBackgroundSystemTasks;
}

- (void)setActiveBackgroundSystemTasks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end