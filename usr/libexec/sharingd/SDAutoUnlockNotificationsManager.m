@interface SDAutoUnlockNotificationsManager
+ (id)sharedManager;
- (NSDictionary)promptInfo;
- (NSHashTable)observers;
- (OS_dispatch_source)notificationTimer;
- (SDAutoUnlockNotificationsManager)init;
- (SFAutoUnlockNotificationModel)notificationModel;
- (id)radarNotificationCompletion;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidateNotificationTimer;
- (void)notifyObservers:(SEL)a3;
- (void)removeObserver:(id)a3;
- (void)restartNotificationTimer:(unint64_t)a3;
- (void)setNotificationModel:(id)a3;
- (void)setNotificationTimer:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPromptInfo:(id)a3;
- (void)setRadarNotificationCompletion:(id)a3;
- (void)showAuthenticatedSiriForDeviceID:(id)a3;
- (void)showUnlockedByDeviceNotificationWithDeviceID:(id)a3;
@end

@implementation SDAutoUnlockNotificationsManager

+ (id)sharedManager
{
  if (qword_100656D08 != -1) {
    dispatch_once(&qword_100656D08, &stru_1005CB6A8);
  }
  return (id)qword_100656D00;
}

- (SDAutoUnlockNotificationsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAutoUnlockNotificationsManager;
  v2 = -[SDAutoUnlockNotificationsManager init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAutoUnlockNotificationsManager;
  -[SDAutoUnlockNotificationsManager dealloc](&v2, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](v5->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](v5->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)notifyObservers:(SEL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager observers](v4, "observers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  objc_sync_exit(v4);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, a3) & 1) != 0) {
          ((void (*)(void *, SEL))objc_msgSend(v11, "methodForSelector:", a3, (void)v12))(v11, a3);
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)showAuthenticatedSiriForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceNameForDeviceID:v3]);

  uint64_t v7 = auto_unlock_log(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting %@ authenticated Siri by Apple Watch (device ID: %@)",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)showUnlockedByDeviceNotificationWithDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceNameForDeviceID:v3]);

  uint64_t v7 = auto_unlock_log(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting %@ unlocked by Apple Watch (device ID: %@)",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)restartNotificationTimer:(unint64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting notification timer", buf, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  if (!v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100033688;
    v12[3] = &unk_1005CB2F8;
    v12[4] = self;
    id v8 = sub_100114598(0, &_dispatch_main_q, v12);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDAutoUnlockNotificationsManager setNotificationTimer:](self, "setNotificationTimer:", v9);

    v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
    dispatch_resume(v10);
  }

  __int16 v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  sub_100114638(v11, a3);
}

- (void)invalidateNotificationTimer
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  if (v5)
  {
    uint64_t v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockNotificationsManager setNotificationTimer:](self, "setNotificationTimer:", 0LL);
  }

- (SFAutoUnlockNotificationModel)notificationModel
{
  return self->_notificationModel;
}

- (void)setNotificationModel:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setObservers:(id)a3
{
}

- (NSDictionary)promptInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPromptInfo:(id)a3
{
}

- (OS_dispatch_source)notificationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setNotificationTimer:(id)a3
{
}

- (id)radarNotificationCompletion
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRadarNotificationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end