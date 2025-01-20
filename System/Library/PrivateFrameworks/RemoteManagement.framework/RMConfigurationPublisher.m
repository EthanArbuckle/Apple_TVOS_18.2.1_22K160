@interface RMConfigurationPublisher
+ (id)_start;
+ (id)reportDetails;
+ (id)sharedConfigurationPublisher;
+ (void)fetchVisibleConfigurationUIs;
+ (void)reprocessActiveConfigurations;
+ (void)start;
- (NSManagedObjectContext)context;
- (NSMutableArray)plugins;
- (NSMutableDictionary)eventStreamSubscriptionByToken;
- (RMConfigurationPublisher)initWithPersistentActiveIdentifiers:(id)a3 context:(id)a4;
- (RMConfigurationPublisherDelegate)delegate;
- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers;
- (id)_createInternalPlugins;
- (void)_addEventStreamSubscriberWithSubscription:(id)a3;
- (void)_fetchVisibleConfigurationUIs;
- (void)_loadAllConfigurationSubscribersAllowingThemToCheckForChanges;
- (void)_loadPlugins;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_notifyChangedConfigurationsForTypes:(id)a3;
- (void)_notifyChangedConfigurationsIfNeeded;
- (void)_notifyChangedConfigurationsIfNeededWithStatusUpdate:(BOOL)a3;
- (void)_notifyMissingConfigurationUIsForTypes:(id)a3;
- (void)_notifySubscribersWithConfigurationTypes:(id)a3;
- (void)_notifySubscribersWithMissingConfigurationUITypes:(id)a3;
- (void)_removeEventStreamSubscriberForToken:(unint64_t)a3;
- (void)_reprocessActiveConfigurations;
- (void)_start;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventStreamSubscriptionByToken:(id)a3;
- (void)setPersistentActiveIdentifiers:(id)a3;
- (void)setPlugins:(id)a3;
@end

@implementation RMConfigurationPublisher

+ (id)sharedConfigurationPublisher
{
  if (qword_1000CF040 != -1) {
    dispatch_once(&qword_1000CF040, &stru_1000B96A0);
  }
  return (id)qword_1000CF038;
}

+ (void)start
{
  id v2 =  +[RMConfigurationPublisher sharedConfigurationPublisher]( &OBJC_CLASS___RMConfigurationPublisher,  "sharedConfigurationPublisher");
}

+ (id)_start
{
  if (+[RMBundle managementScope](&OBJC_CLASS___RMBundle, "managementScope") == (id)1) {
    id v2 = "com.apple.remotemanagement.configs.daemon";
  }
  else {
    id v2 = "com.apple.remotemanagement.configs.agent";
  }
  dispatch_queue_t v3 = dispatch_queue_create(v2, 0LL);
  uint64_t v4 = xpc_event_publisher_create(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentContainer]);

  id v8 = [v7 newBackgroundContext];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMInternalStateArchiver sharedArchiver](&OBJC_CLASS___RMInternalStateArchiver, "sharedArchiver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistentActiveIdentifiers]);
  v11 = -[RMConfigurationPublisher initWithPersistentActiveIdentifiers:context:]( objc_alloc(&OBJC_CLASS___RMConfigurationPublisher),  "initWithPersistentActiveIdentifiers:context:",  v10,  v8);
  -[RMConfigurationPublisher setDelegate:](v11, "setDelegate:", v9);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_10001E058;
  v23 = &unk_1000B96C8;
  v12 = v11;
  v24 = v12;
  id v25 = v5;
  id v13 = v5;
  xpc_event_publisher_set_handler();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001E220;
  v18[3] = &unk_1000B96F0;
  v14 = v12;
  v19 = v14;
  xpc_event_publisher_set_error_handler(v13, v18);
  xpc_event_publisher_activate(v13);
  v15 = v19;
  v16 = v14;

  return v16;
}

- (RMConfigurationPublisher)initWithPersistentActiveIdentifiers:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RMConfigurationPublisher;
  v9 = -[RMConfigurationPublisher init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentActiveIdentifiers, a3);
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    plugins = v10->_plugins;
    v10->_plugins = v11;

    objc_storeStrong((id *)&v10->_context, a4);
    id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    eventStreamSubscriptionByToken = v10->_eventStreamSubscriptionByToken;
    v10->_eventStreamSubscriptionByToken = v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSObject);
    startLock = v10->_startLock;
    v10->_startLock = v15;

    v17 = objc_opt_new(&OBJC_CLASS___NSObject);
    notificationLock = v10->_notificationLock;
    v10->_notificationLock = v17;

    v19 = objc_opt_new(&OBJC_CLASS___NSObject);
    pluginsLock = v10->_pluginsLock;
    v10->_pluginsLock = v19;
  }

  return v10;
}

- (void)_start
{
  dispatch_queue_t v3 = self->_startLock;
  objc_sync_enter(v3);
  if (self->_started)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000208E0();
    }

    objc_sync_exit(v3);
  }

  else
  {
    self->_started = 1;
    objc_sync_exit(v3);

    dispatch_queue_t v3 = _os_activity_create( (void *)&_mh_execute_header,  "ConfigurationPublisher: Starting...",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter((os_activity_t)v3, &state);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting configuration publisher...", v10, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher context](self, "context"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentStoreCoordinator]);
    [v6 addObserver:self selector:"_managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveObjectIDsNotification object:v8];

    -[RMConfigurationPublisher _loadAllConfigurationSubscribersAllowingThemToCheckForChanges]( self,  "_loadAllConfigurationSubscribersAllowingThemToCheckForChanges");
    -[RMConfigurationPublisher _notifyChangedConfigurationsIfNeeded](self, "_notifyChangedConfigurationsIfNeeded");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000208B4();
    }

    os_activity_scope_leave(&state);
  }
}

- (void)_addEventStreamSubscriberWithSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 token];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  id v7 = self->_pluginsLock;
  objc_sync_enter(v7);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002097C();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher eventStreamSubscriptionByToken](self, "eventStreamSubscriptionByToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (v10)
  {
    objc_sync_exit(v7);

    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002090C();
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher eventStreamSubscriptionByToken](self, "eventStreamSubscriptionByToken"));
    [v12 setObject:v4 forKeyedSubscript:v6];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
    [v13 addObject:v4];

    objc_sync_exit(v7);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = v5;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Added subscriber for %llu: %{public}@.",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)_removeEventStreamSubscriberForToken:(unint64_t)a3
{
  id v5 = self->_pluginsLock;
  objc_sync_enter(v5);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100020A50();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher eventStreamSubscriptionByToken](self, "eventStreamSubscriptionByToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher eventStreamSubscriptionByToken](self, "eventStreamSubscriptionByToken"));
    [v10 removeObjectForKey:v7];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
    [v11 removeObject:v9];

    objc_sync_exit(v5);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      unint64_t v14 = a3;
      __int16 v15 = 2114;
      __int16 v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Removed subscriber for %llu: %{public}@.",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {

    objc_sync_exit(v5);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000209EC();
    }
  }
}

- (void)_loadAllConfigurationSubscribersAllowingThemToCheckForChanges
{
  __int16 v16 = _os_activity_create( (void *)&_mh_execute_header,  "ConfigurationPublisher: Loading configuration subscriber plugins...",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &state);
  dispatch_queue_t v3 = self->_pluginsLock;
  objc_sync_enter(v3);
  -[RMConfigurationPublisher _loadPlugins](self, "_loadPlugins");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v9);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          sub_100020AB4(v12, v24, &v25, v11);
        }

        int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        [v5 addObject:v13];

        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 configurationTypes]);
        [v10 applyChangedConfigurationsTypes:v14];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }

    while (v7);
  }

  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Finished loading configuration subscriber plugins: %{public}@",  buf,  0xCu);
  }

  objc_sync_exit(v3);
  os_activity_scope_leave(&state);
}

- (void)_loadPlugins
{
  dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100020B30();
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationSubscriberServicePlugin loadPlugins]( &OBJC_CLASS___RMConfigurationSubscriberServicePlugin,  "loadPlugins"));
  [v4 addObjectsFromArray:v5];

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100020B04();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher _createInternalPlugins](self, "_createInternalPlugins"));
  [v7 addObjectsFromArray:v8];
}

- (id)_createInternalPlugins
{
  id v2 = objc_opt_new(&OBJC_CLASS___RMStatusSubscriptionsSubscriber);
  id v5 = v2;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

+ (void)reprocessActiveConfigurations
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[RMConfigurationPublisher sharedConfigurationPublisher]( &OBJC_CLASS___RMConfigurationPublisher,  "sharedConfigurationPublisher"));
  [v2 _reprocessActiveConfigurations];
}

- (void)_reprocessActiveConfigurations
{
  dispatch_queue_t v3 = objc_opt_new(&OBJC_CLASS___NSDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher persistentActiveIdentifiers](self, "persistentActiveIdentifiers"));
  [v4 setUniqueIdentifiersByConfigurationType:v3];

  -[RMConfigurationPublisher _notifyChangedConfigurationsIfNeededWithStatusUpdate:]( self,  "_notifyChangedConfigurationsIfNeededWithStatusUpdate:",  0LL);
}

+ (void)fetchVisibleConfigurationUIs
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[RMConfigurationPublisher sharedConfigurationPublisher]( &OBJC_CLASS___RMConfigurationPublisher,  "sharedConfigurationPublisher"));
  [v2 _fetchVisibleConfigurationUIs];
}

- (void)_fetchVisibleConfigurationUIs
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher context](self, "context"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001EEC4;
  v4[3] = &unk_1000B9150;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

+ (id)reportDetails
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationPublisher sharedConfigurationPublisher]( &OBJC_CLASS___RMConfigurationPublisher,  "sharedConfigurationPublisher",  0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 plugins]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) reportDetails]);
        -[NSMutableArray addObject:](v2, "addObject:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v2;
}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  id v5 = self->_startLock;
  objc_sync_enter(v5);
  v45 = v4;
  if (self->_started)
  {
    val = self;
    objc_sync_exit(v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSInsertedObjectIDsKey]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSUpdatedObjectIDsKey]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSDeletedObjectIDsKey]);

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    obj = v7;
    id v10 = -[NSObject countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  buf,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v50;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)i);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entity", val, v43, v44));
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayloadState entity](&OBJC_CLASS___RMConfigurationPayloadState, "entity"));
          if ([v14 isKindOfEntity:v16])
          {

LABEL_37:
LABEL_38:

LABEL_45:
            objc_initWeak((id *)buf, val);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10001F90C;
            block[3] = &unk_1000B91E8;
            objc_copyWeak(&v48, (id *)buf);
            dispatch_async(&_dispatch_main_q, block);
            objc_destroyWeak(&v48);
            objc_destroyWeak((id *)buf);
            goto LABEL_46;
          }

          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadReference entity](&OBJC_CLASS___RMAssetPayloadReference, "entity"));
          unsigned __int8 v18 = [v14 isKindOfEntity:v17];

          if ((v18 & 1) != 0) {
            goto LABEL_38;
          }
        }

        id v10 = -[NSObject countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  buf,  16LL);
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v19 = v44;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v50;
      while (2)
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)j);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 entity]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayloadState entity](&OBJC_CLASS___RMConfigurationPayloadState, "entity"));
          if ([v25 isKindOfEntity:v27])
          {

LABEL_40:
LABEL_44:

            goto LABEL_45;
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadReference entity](&OBJC_CLASS___RMAssetPayloadReference, "entity"));
          unsigned __int8 v29 = [v25 isKindOfEntity:v28];

          if ((v29 & 1) != 0) {
            goto LABEL_44;
          }
        }

        id v21 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v30 = v43;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v20 = v30;
    id v31 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v50;
      while (2)
      {
        for (k = 0LL; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v20);
          }
          id v34 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)k);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 entity]);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayloadState entity](&OBJC_CLASS___RMConfigurationPayloadState, "entity"));
          if ([v35 isKindOfEntity:v37])
          {

LABEL_43:
            goto LABEL_44;
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadReference entity](&OBJC_CLASS___RMAssetPayloadReference, "entity"));
          unsigned __int8 v39 = [v35 isKindOfEntity:v38];

          if ((v39 & 1) != 0) {
            goto LABEL_44;
          }
        }

        id v31 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

LABEL_46:
    id v5 = obj;
  }

  else
  {
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      *(_DWORD *)buf = 138543362;
      v54 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Ignoring %{public}@, the publisher has not finish starting yet.",  buf,  0xCu);
    }

    objc_sync_exit(v5);
  }
}

- (void)_notifyChangedConfigurationsIfNeeded
{
}

- (void)_notifyChangedConfigurationsIfNeededWithStatusUpdate:(BOOL)a3
{
  BOOL v34 = a3;
  dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100020C6C();
  }

  obj = self->_notificationLock;
  objc_sync_enter(obj);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_10001FE4C;
  v45 = sub_10001FE5C;
  id v46 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher context](self, "context"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10001FE64;
  v40[3] = &unk_1000B9238;
  v40[4] = &v41;
  [v4 performBlockAndWait:v40];

  id v5 = self->_persistentActiveIdentifiers;
  -[RMConfigurationPublisher setPersistentActiveIdentifiers:](self, "setPersistentActiveIdentifiers:", v42[5]);
  id v6 = (void *)v42[5];
  v36 = v5;
  id v37 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMPersistentActiveIdentifiers uniqueIdentifiersByConfigurationType]( v36,  "uniqueIdentifiersByConfigurationType"));
  uint64_t v8 = v7;
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = objc_opt_new(&OBJC_CLASS___NSDictionary);
  }
  id v10 = v9;

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueIdentifiersByConfigurationType]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v10, "allKeys"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v13]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

  unsigned __int8 v39 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v50 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v47 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:buf count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v20));
        uint64_t v22 = v21;
        if (v21) {
          v23 = v21;
        }
        else {
          v23 = objc_opt_new(&OBJC_CLASS___NSSet);
        }
        id v24 = v23;

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);
        v26 = v25;
        if (v25) {
          v27 = v25;
        }
        else {
          v27 = objc_opt_new(&OBJC_CLASS___NSSet);
        }
        v28 = v27;

        if (!-[NSSet isEqualToSet:](v24, "isEqualToSet:", v28)) {
          -[NSMutableSet addObject:](v39, "addObject:", v20);
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v47 objects:buf count:16];
    }

    while (v17);
  }

  if (-[NSMutableSet count](v39, "count"))
  {
    unsigned __int8 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v52 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Changed configuration types: %{public}@",  buf,  0xCu);
    }

    -[RMConfigurationPublisher _notifyChangedConfigurationsForTypes:]( self,  "_notifyChangedConfigurationsForTypes:",  v39);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher delegate](self, "delegate"));
    [v30 configurationPublisher:self didChangePersistentActiveIdentifiers:v42[5]];

    if (v34)
    {
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100020C14();
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
      [v32 observerStoresDidChange];

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[RMSubscribedStatusKeyPathUpdater sharedUpdater]( &OBJC_CLASS___RMSubscribedStatusKeyPathUpdater,  "sharedUpdater"));
      [v33 notifyStatusDidChangeForDeclarations];
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG)) {
        sub_100020C40();
      }
    }
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG)) {
      sub_100020BE8();
    }
  }

  _Block_object_dispose(&v41, 8);
  objc_sync_exit(obj);
}

- (void)_notifyChangedConfigurationsForTypes:(id)a3
{
  id v4 = a3;

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100020CF8(v4, v5);
  }

  -[RMConfigurationPublisher _notifySubscribersWithConfigurationTypes:]( self,  "_notifySubscribersWithConfigurationTypes:",  v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));

    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notified configuration subscribers with configurations of types: %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)_notifySubscribersWithConfigurationTypes:(id)a3
{
  id v4 = a3;

  obj = self->_pluginsLock;
  objc_sync_enter(obj);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configurationTypes]);
        id v11 = [v10 mutableCopy];

        [v11 intersectSet:v4];
        if ([v11 count])
        {
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Triggering configuration subscriber plugin: %{public}@",  buf,  0xCu);
          }

          [v9 applyChangedConfigurationsTypes:v11];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v6);
  }

  objc_sync_exit(obj);
}

- (void)_notifyMissingConfigurationUIsForTypes:(id)a3
{
  id v4 = a3;

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100020DB0(v4, v5);
  }

  -[RMConfigurationPublisher _notifySubscribersWithMissingConfigurationUITypes:]( self,  "_notifySubscribersWithMissingConfigurationUITypes:",  v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));

    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notified configuration subscribers for UI with configurations of types: %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)_notifySubscribersWithMissingConfigurationUITypes:(id)a3
{
  id v4 = a3;

  obj = self->_pluginsLock;
  objc_sync_enter(obj);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPublisher plugins](self, "plugins"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configurationTypes]);
        id v11 = [v10 mutableCopy];

        [v11 intersectSet:v4];
        if ([v11 count])
        {
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog configurationPublisher](&OBJC_CLASS___RMLog, "configurationPublisher"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Triggering configuration subscriber UI plugin: %{public}@",  buf,  0xCu);
          }

          [v9 fetchMissingConfigurationUIs];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v6);
  }

  objc_sync_exit(obj);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers
{
  return self->_persistentActiveIdentifiers;
}

- (void)setPersistentActiveIdentifiers:(id)a3
{
}

- (NSMutableArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (NSMutableDictionary)eventStreamSubscriptionByToken
{
  return self->_eventStreamSubscriptionByToken;
}

- (void)setEventStreamSubscriptionByToken:(id)a3
{
}

- (RMConfigurationPublisherDelegate)delegate
{
  return (RMConfigurationPublisherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end