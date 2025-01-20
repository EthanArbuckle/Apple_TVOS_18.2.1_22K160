@interface RMExternalStatusPublisher
+ (RMExternalStatusPublisher)sharedPublisher;
+ (void)start;
- (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5;
- (NSArray)plugins;
- (NSDictionary)eventsByStatusKey;
- (NSDictionary)predicateStatusKeysByStoreIdentifier;
- (NSDictionary)publisherByEventKey;
- (NSManagedObjectContext)context;
- (NSSet)allEvents;
- (NSSet)statusKeys;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_event_publisher)XPCEventPublisher;
- (RMExternalStatusPublisher)initWithContext:(id)a3;
- (RMSharedLock)persistLock;
- (id)_buildDictionaryFromArrayValue:(id)a3;
- (id)_fetchSubscribedStatusKeyPaths;
- (id)_filteredArray:(id)a3 metadata:(id)a4 lastAcknowledgedDate:(id)a5;
- (id)_mergeOldStatus:(id)a3 newStatus:(id)a4 changedStatusKeyPaths:(id)a5 error:(id *)a6;
- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (id)_subscribedStatusKeyPathsByStoreForKeyPaths:(id)a3;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (id)reportDetails;
- (id)statusForChannel:(id)a3 error:(id *)a4;
- (void)_buildPredicateStatusKeyPaths;
- (void)_loadAllStatusPublishers;
- (void)_mergeOldArrayValue:(id)a3 oldValueMetadata:(id)a4 newValue:(id)a5 completionHandler:(id)a6;
- (void)_notifyChangesWithStoreIdentifier:(id)a3 statusKeyPaths:(id)a4;
- (void)_start;
- (void)_waitForQueueWithCompletionHandler:(id)a3;
- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4;
- (void)listenToNotificationsForAllKeyPaths;
- (void)listenToNotificationsForSubscribedKeyPaths:(id)a3;
- (void)publishAllSubscribedStatus;
- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4;
- (void)setAllEvents:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventsByStatusKey:(id)a3;
- (void)setPlugins:(id)a3;
- (void)setPredicateStatusKeysByStoreIdentifier:(id)a3;
- (void)setPublisherByEventKey:(id)a3;
- (void)setStatusKeys:(id)a3;
- (void)setXPCEventPublisher:(id)a3;
@end

@implementation RMExternalStatusPublisher

+ (RMExternalStatusPublisher)sharedPublisher
{
  if (qword_1000CF0E0 != -1) {
    dispatch_once(&qword_1000CF0E0, &stru_1000B9988);
  }
  return (RMExternalStatusPublisher *)(id)qword_1000CF0D8;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028230;
  block[3] = &unk_1000B9100;
  block[4] = a1;
  if (qword_1000CF0E8 != -1) {
    dispatch_once(&qword_1000CF0E8, block);
  }
}

- (RMExternalStatusPublisher)initWithContext:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RMExternalStatusPublisher;
  v6 = -[RMExternalStatusPublisher init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    XPCEventPublisher = v7->_XPCEventPublisher;
    v7->_XPCEventPublisher = 0LL;

    plugins = v7->_plugins;
    v7->_plugins = (NSArray *)&__NSArray0__struct;

    publisherByEventKey = v7->_publisherByEventKey;
    v7->_publisherByEventKey = (NSDictionary *)&__NSDictionary0__struct;

    eventsByStatusKey = v7->_eventsByStatusKey;
    v7->_eventsByStatusKey = (NSDictionary *)&__NSDictionary0__struct;

    v12 = objc_opt_new(&OBJC_CLASS___NSSet);
    statusKeys = v7->_statusKeys;
    v7->_statusKeys = v12;

    predicateStatusKeysByStoreIdentifier = v7->_predicateStatusKeysByStoreIdentifier;
    v7->_predicateStatusKeysByStoreIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    v15 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:]( &OBJC_CLASS___RMSharedLock,  "newSharedLockWithDescription:",  @"RMExternalStatusPublisher");
    persistLock = v7->_persistLock;
    v7->_persistLock = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.RemoteManagement.RMExternalStatusPublisher", 0LL);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v17;
  }

  return v7;
}

- (void)_start
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "ExternalStatusPublisher: Starting...",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v20);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002C0C4(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  -[RMExternalStatusPublisher _loadAllStatusPublishers](self, "_loadAllStatusPublishers");
  -[RMExternalStatusPublisher listenToNotificationsForAllKeyPaths](self, "listenToNotificationsForAllKeyPaths");
  -[RMExternalStatusPublisher publishAllSubscribedStatus](self, "publishAllSubscribedStatus");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002C094(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  os_activity_scope_leave(&v20);
}

- (void)_loadAllStatusPublishers
{
  v26 = _os_activity_create( (void *)&_mh_execute_header,  "ExternalStatusPublisher: Loading XPC service plugins...",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v26, &state);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002C0F4(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[RMStatusPublisherServicePlugin loadPlugins]( &OBJC_CLASS___RMStatusPublisherServicePlugin,  "loadPlugins"));
  -[RMExternalStatusPublisher setPlugins:](self, "setPlugins:", v10);

  v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v28 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher plugins](self, "plugins"));
  id v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 statusKeysByXPCEvent]);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_10002882C;
        v31[3] = &unk_1000B99B0;
        v32 = v30;
        v33 = v16;
        v34 = v29;
        v35 = v28;
        [v17 enumerateKeysAndObjectsUsingBlock:v31];

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 statusKeys]);
        -[NSMutableSet unionSet:](v11, "unionSet:", v18);
      }

      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableDictionary copy](v30, "copy");
  -[RMExternalStatusPublisher setPublisherByEventKey:](self, "setPublisherByEventKey:", v19);

  id v20 = -[NSMutableDictionary copy](v29, "copy");
  -[RMExternalStatusPublisher setEventsByStatusKey:](self, "setEventsByStatusKey:", v20);

  id v21 = -[NSMutableSet copy](v28, "copy");
  -[RMExternalStatusPublisher setAllEvents:](self, "setAllEvents:", v21);

  id v22 = -[NSMutableSet copy](v11, "copy");
  -[RMExternalStatusPublisher setStatusKeys:](self, "setStatusKeys:", v22);

  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher plugins](self, "plugins"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 valueForKey:@"identifier"]);
    *(_DWORD *)buf = 138543362;
    v42 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Finished loading status publisher XPC service plugins: %{public}@",  buf,  0xCu);
  }

  os_activity_scope_leave(&state);
}

- (void)listenToNotificationsForAllKeyPaths
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher _fetchSubscribedStatusKeyPaths](self, "_fetchSubscribedStatusKeyPaths"));
  -[RMExternalStatusPublisher _buildPredicateStatusKeyPaths](self, "_buildPredicateStatusKeyPaths");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Subscribing to all key paths: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  -[RMExternalStatusPublisher listenToNotificationsForSubscribedKeyPaths:]( self,  "listenToNotificationsForSubscribedKeyPaths:",  v3);
}

- (void)listenToNotificationsForSubscribedKeyPaths:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", a3));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher predicateStatusKeysByStoreIdentifier]( self,  "predicateStatusKeysByStoreIdentifier"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100028E4C;
  v51[3] = &unk_1000B99D8;
  id v6 = v4;
  id v52 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v51];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher allEvents](self, "allEvents"));
  id v8 = [v7 mutableCopy];

  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v34 = *(void *)v48;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v12);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        uint64_t v14 = self;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher eventsByStatusKey](self, "eventsByStatusKey"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);

        id v17 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v44;
          do
          {
            id v20 = 0LL;
            do
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)v20);
              if (v21)
              {
                -[NSMutableSet addObject:](v9, "addObject:", *(void *)(*((void *)&v43 + 1) + 8LL * (void)v20));
                [v8 removeObject:v21];
              }

              id v20 = (char *)v20 + 1;
            }

            while (v18 != v20);
            id v18 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }

          while (v18);
        }

        v12 = (char *)v12 + 1;
        self = v14;
      }

      while (v12 != v11);
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }

    while (v11);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMXPCNotifications sharedNotifier](&OBJC_CLASS___RMXPCNotifications, "sharedNotifier"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v23 = v9;
  id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v39,  v54,  16LL);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 addObserverForEvent:*(void *)(*((void *)&v39 + 1) + 8 * (void)v27) observer:self];
        v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v39,  v54,  16LL);
    }

    while (v25);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v28 = v8;
  id v29 = [v28 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      v32 = 0LL;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        [v22 removeObserverForEvent:*(void *)(*((void *)&v35 + 1) + 8 * (void)v32)];
        v32 = (char *)v32 + 1;
      }

      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v35 objects:v53 count:16];
    }

    while (v30);
  }
}

- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMXPCEvent eventKeyForStream:notificationName:]( &OBJC_CLASS___RMXPCEvent,  "eventKeyForStream:notificationName:",  a3,  a4));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Received status notification: %{public}@",  buf,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher publisherByEventKey](self, "publisherByEventKey"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

  if (v8)
  {
    id v20 = v5;
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 statusKeys]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher _subscribedStatusKeyPathsByStoreForKeyPaths:]( self,  "_subscribedStatusKeyPathsByStoreForKeyPaths:"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
          uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher dispatchQueue](self, "dispatchQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000290CC;
          block[3] = &unk_1000B9A00;
          id v22 = v8;
          id v23 = v15;
          uint64_t v24 = v14;
          id v17 = v15;
          dispatch_async(v16, block);
        }

        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v11);
    }

    id v18 = (os_log_s *)v19;
    int v5 = v20;
  }

  else
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002C124();
    }
  }
}

- (void)_waitForQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002916C;
  block[3] = &unk_1000B94D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  return -[RMExternalStatusPublisher _queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:error:]( self,  "_queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:error:",  a3,  0LL,  a4,  a5);
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return -[RMExternalStatusPublisher _queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:error:]( self,  "_queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:error:",  a3,  a4,  a5,  a6);
}

- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v48 = 0LL;
  __int128 v43 = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher statusForChannel:error:](self, "statusForChannel:error:", v12, &v48));
  id v14 = v48;
  uint64_t v15 = v14;
  if (v13)
  {
    id v38 = v14;
    id v39 = v12;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v10 count]));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v40 = v10;
    id v17 = v10;
    id v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      __int128 v41 = v13;
      id v42 = v17;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKeyPath:v22]);
          if (v24)
          {
            if (v11 && (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray, v23), (objc_opt_isKindOfClass(v24, v25) & 1) != 0))
            {
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"_metadata",  v22));
              uint64_t v27 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v26]);
              __int128 v28 = v16;
              id v29 = (void *)v27;

              id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v22]);
              id v31 = v19;
              uint64_t v32 = v20;
              id v33 = v11;
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher _filteredArray:metadata:lastAcknowledgedDate:]( v43,  "_filteredArray:metadata:lastAcknowledgedDate:",  v24,  v29,  v30));
              [v28 setObject:v34 forKeyedSubscript:v22];

              id v11 = v33;
              uint64_t v20 = v32;
              id v19 = v31;

              uint64_t v16 = v28;
              uint64_t v13 = v41;
              id v17 = v42;
            }

            else
            {
              [v16 setObject:v24 forKeyedSubscript:v22];
            }
          }

          else
          {
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:]( &OBJC_CLASS___RMErrorUtilities,  "createUnsupportedStatusValueErrorWithKeyPath:",  v22));
            [v16 setObject:v35 forKeyedSubscript:v22];
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }

      while (v19);
    }

    id v12 = v39;
    id v10 = v40;
    uint64_t v15 = v38;
  }

  else
  {
    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10002C184(v12, (uint64_t)v15, v36);
    }

    uint64_t v16 = 0LL;
    if (a6 && v15)
    {
      uint64_t v16 = 0LL;
      *a6 = v15;
    }
  }

  return v16;
}

- (id)statusForChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100029614;
  __int128 v26 = sub_100029624;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100029614;
  uint64_t v20 = sub_100029624;
  id v21 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher persistLock](self, "persistLock"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002962C;
  v12[3] = &unk_1000B9A28;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v16;
  [v7 performBlockUnderLock:v12];

  if (a4)
  {
    uint64_t v9 = (void *)v17[5];
    if (v9) {
      *a4 = v9;
    }
  }

  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)publishAllSubscribedStatus
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Publishing all subscribed status items", buf, 2u);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher _subscribedStatusKeyPathsByStoreForKeyPaths:]( self,  "_subscribedStatusKeyPathsByStoreForKeyPaths:",  0LL));
  id v21 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v32;
    *(void *)&__int128 v4 = 134218242LL;
    __int128 v19 = v4;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * v5);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v6, v19));
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v7 count];
          *(_DWORD *)buf = v19;
          id v37 = v18;
          __int16 v38 = 2114;
          uint64_t v39 = v6;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Publishing %lu status items for store: %{public}@",  buf,  0x16u);
        }

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher plugins](self, "plugins"));
        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 statusKeys]);
              id v16 = [v15 mutableCopy];

              [v16 intersectSet:v7];
              if ([v16 count])
              {
                id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher dispatchQueue](self, "dispatchQueue"));
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_1000299EC;
                block[3] = &unk_1000B9A00;
                void block[4] = v14;
                id v25 = v16;
                uint64_t v26 = v6;
                dispatch_async(v17, block);
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }

          while (v11);
        }

        uint64_t v5 = v23 + 1;
      }

      while ((id)(v23 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v21);
  }
}

- (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_100029614;
  __int128 v31 = sub_100029624;
  id v32 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher persistLock](self, "persistLock"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100029C98;
  v21[3] = &unk_1000B9A50;
  id v12 = v8;
  uint64_t v26 = &v27;
  id v22 = v12;
  uint64_t v23 = self;
  id v13 = v9;
  id v24 = v13;
  id v14 = v10;
  id v25 = v14;
  [v11 performBlockUnderLock:v21];

  uint64_t v15 = v28[5];
  if (v15)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002C388();
    }

    if (a5)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a5 = v17;
      }
    }
  }

  else if (-[NSMutableSet count](v14, "count"))
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002C328();
    }

    -[RMExternalStatusPublisher _notifyChangesWithStoreIdentifier:statusKeyPaths:]( self,  "_notifyChangesWithStoreIdentifier:statusKeyPaths:",  v12,  v14);
  }

  else
  {
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10002C2C8();
    }
  }

  _Block_object_dispose(&v27, 8);
  return v15 == 0;
}

- (void)_notifyChangesWithStoreIdentifier:(id)a3 statusKeyPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMSubscribedStatusKeyPathUpdater sharedUpdater]( &OBJC_CLASS___RMSubscribedStatusKeyPathUpdater,  "sharedUpdater"));
  [v8 notifyStatusDidChangeForKeyPaths:v7 managementSourceIdentifier:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher predicateStatusKeysByStoreIdentifier]( self,  "predicateStatusKeysByStoreIdentifier"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v10));

  [v11 intersectSet:v7];
  if ([v11 count])
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002C4C8();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMPredicateStatusUpdater sharedUpdater](&OBJC_CLASS___RMPredicateStatusUpdater, "sharedUpdater"));
    [v13 notifyPredicateStatusDidChangeForManagementSourceIdentifier:v6];
  }
}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v17 = a4;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher plugins](self, "plugins"));
  id v8 = -[dispatch_queue_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      id v14 = [v6 mutableCopy];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 statusKeys]);
      [v14 intersectSet:v15];

      if ([v14 count])
      {
        id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher dispatchQueue](self, "dispatchQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002A128;
        block[3] = &unk_1000B9A00;
        void block[4] = v13;
        id v19 = v14;
        id v20 = v17;
        dispatch_async(v16, block);

        char v10 = 1;
      }
    }

    id v9 = -[dispatch_queue_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  }

  while (v9);

  if ((v10 & 1) != 0)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher dispatchQueue](self, "dispatchQueue"));
    dispatch_sync(v7, &stru_1000B9A70);
LABEL_12:
  }
}

- (id)reportDetails
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher plugins](self, "plugins", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) reportDetails]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_fetchSubscribedStatusKeyPaths
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  __int128 v11 = sub_100029614;
  __int128 v12 = sub_100029624;
  id v13 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher context](self, "context"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002A348;
  v7[3] = &unk_1000B9238;
  v7[4] = &v8;
  [v2 performBlockAndWait:v7];
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    __int128 v4 = v3;
  }
  else {
    __int128 v4 = objc_opt_new(&OBJC_CLASS___NSSet);
  }
  id v5 = v4;

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_buildPredicateStatusKeyPaths
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher context](self, "context"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002A548;
  v6[3] = &unk_1000B9150;
  v6[4] = self;
  [v3 performBlockAndWait:v6];
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusPublisher](&OBJC_CLASS___RMLog, "externalStatusPublisher"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher predicateStatusKeysByStoreIdentifier]( self,  "predicateStatusKeysByStoreIdentifier"));
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "All predicate status key paths: %{public}@",  buf,  0xCu);
  }
}

- (id)_subscribedStatusKeyPathsByStoreForKeyPaths:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMExternalStatusPublisher context](self, "context"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002A840;
  v12[3] = &unk_1000B9A00;
  id v13 = v4;
  __int128 v14 = self;
  uint64_t v7 = v5;
  uint64_t v15 = v7;
  id v8 = v4;
  [v6 performBlockAndWait:v12];
  id v9 = v15;
  uint64_t v10 = v7;

  return v10;
}

- (id)_mergeOldStatus:(id)a3 newStatus:(id)a4 changedStatusKeyPaths:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_100029614;
  __int128 v30 = sub_100029624;
  id v31 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002AED4;
  v20[3] = &unk_1000B9AC0;
  id v14 = v10;
  id v21 = v14;
  id v15 = v13;
  id v22 = v15;
  id v16 = v12;
  __int128 v24 = self;
  id v25 = &v26;
  id v23 = v16;
  [v11 enumerateKeysAndObjectsUsingBlock:v20];
  id v17 = (void *)v27[5];
  if (v17)
  {
    id v18 = 0LL;
    if (a6) {
      *a6 = v17;
    }
  }

  else
  {
    id v18 = v15;
  }

  _Block_object_dispose(&v26, 8);
  return v18;
}

- (void)_mergeOldArrayValue:(id)a3 oldValueMetadata:(id)a4 newValue:(id)a5 completionHandler:(id)a6
{
  id v29 = a3;
  id v27 = a4;
  id v30 = a5;
  uint64_t v28 = (void (**)(id, id, id, void))a6;
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[RMDateFormat stringUTCFractionalSecondsWithDate:]( &OBJC_CLASS___RMDateFormat,  "stringUTCFractionalSecondsWithDate:",  0LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v30 count]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v30 count]));
  if (v29)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher _buildDictionaryFromArrayValue:]( self,  "_buildDictionaryFromArrayValue:"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RMExternalStatusPublisher _buildDictionaryFromArrayValue:]( self,  "_buildDictionaryFromArrayValue:",  v30));
    id v13 = [v27 mutableCopy];
    if ([v11 isEqualToDictionary:v12])
    {
      v28[2](v28, v29, v27, 0LL);
    }

    else
    {
      uint64_t v44 = 0LL;
      __int128 v45 = &v44;
      uint64_t v46 = 0x2020000000LL;
      char v47 = 0;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10002B828;
      v36[3] = &unk_1000B9AE8;
      id v37 = v11;
      id v21 = v10;
      id v38 = v21;
      id v22 = v31;
      id v39 = v22;
      __int128 v43 = &v44;
      id v40 = v27;
      id v23 = v26;
      id v41 = v23;
      id v24 = v13;
      id v42 = v24;
      [v12 enumerateKeysAndObjectsUsingBlock:v36];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10002B96C;
      v32[3] = &unk_1000B9B10;
      id v25 = v21;
      id v33 = v25;
      id v34 = v22;
      __int128 v35 = &v44;
      [v24 enumerateKeysAndObjectsUsingBlock:v32];
      v28[2](v28, v23, v25, *((unsigned __int8 *)v45 + 24));

      _Block_object_dispose(&v44, 8);
    }
  }

  else
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v14 = v30;
    id v15 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          id v52 = @"last-received";
          v53 = v31;
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"identifier"]);
          [v10 setObject:v19 forKeyedSubscript:v20];
        }

        id v15 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }

      while (v15);
    }

    v28[2](v28, v14, v10, 1LL);
  }
}

- (id)_filteredArray:(id)a3 metadata:(id)a4 lastAcknowledgedDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[RMDateFormat stringUTCFractionalSecondsWithDate:]( &OBJC_CLASS___RMDateFormat,  "stringUTCFractionalSecondsWithDate:",  v9));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"identifier"]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v15]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"last-received"]);

        if (!v9 || [v17 compare:v25] == (id)1) {
          [v26 addObject:v14];
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v11);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10002BCD8;
  v27[3] = &unk_1000B9B38;
  id v28 = v9;
  id v29 = v25;
  id v18 = v26;
  id v30 = v18;
  id v19 = v25;
  id v20 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v27];
  id v21 = v30;
  id v22 = v18;

  return v22;
}

- (id)_buildDictionaryFromArrayValue:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", @"identifier", (void)v13));
        [v4 setObject:v10 forKeyedSubscript:v11];
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (NSSet)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (RMSharedLock)persistLock
{
  return self->_persistLock;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_xpc_event_publisher)XPCEventPublisher
{
  return self->_XPCEventPublisher;
}

- (void)setXPCEventPublisher:(id)a3
{
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (NSDictionary)publisherByEventKey
{
  return self->_publisherByEventKey;
}

- (void)setPublisherByEventKey:(id)a3
{
}

- (NSDictionary)eventsByStatusKey
{
  return self->_eventsByStatusKey;
}

- (void)setEventsByStatusKey:(id)a3
{
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void)setStatusKeys:(id)a3
{
}

- (NSDictionary)predicateStatusKeysByStoreIdentifier
{
  return self->_predicateStatusKeysByStoreIdentifier;
}

- (void)setPredicateStatusKeysByStoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end