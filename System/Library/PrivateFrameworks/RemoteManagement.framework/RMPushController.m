@interface RMPushController
+ (RMPushController)sharedController;
+ (id)_connectionWithEnvironmentName:(id)a3 queue:(id)a4;
+ (void)start;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSSet)supportedKeyPaths;
- (OS_dispatch_queue)serialQueue;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (RMPushController)initWithPushTokenByEnvironmentName:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 context:(id)a5;
- (RMPushControllerDelegate)delegate;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater;
- (id)_cachedPushTokenByEnvironment;
- (id)_currentPushTokenByEnvironmentName;
- (id)_environmentNameForConnection:(id)a3;
- (id)_pushEnvironmentNameForManagementChannel:(id)a3 error:(id *)a4;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyPushTokenDidChangeIfNeeded;
- (void)_start;
- (void)_stop;
- (void)_updateConnections;
- (void)_updatePushReceivedWithTopic:(id)a3 enrollmentToken:(id)a4 syncTokens:(id)a5 forEnvironmentName:(id)a6;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSubscribedStatusKeyPathUpdater:(id)a3;
@end

@implementation RMPushController

+ (RMPushController)sharedController
{
  if (qword_1000CF2F8 != -1) {
    dispatch_once(&qword_1000CF2F8, &stru_1000BA690);
  }
  return (RMPushController *)(id)qword_1000CF2F0;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053C20;
  block[3] = &unk_1000B9100;
  block[4] = a1;
  if (qword_1000CF300 != -1) {
    dispatch_once(&qword_1000CF300, block);
  }
}

- (RMPushController)initWithPushTokenByEnvironmentName:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RMPushController;
  v11 = -[RMPushController init](&v28, "init");
  if (v11)
  {
    id v12 = [v8 copy];
    v13 = v12;
    if (v12) {
      v14 = v12;
    }
    else {
      v14 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v11->_pushTokenByEnvironmentName, v14);

    objc_storeStrong((id *)&v11->_subscribedStatusKeyPathUpdater, a4);
    objc_storeStrong((id *)&v11->_context, a5);
    v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    connectionByEnvironmentName = v11->_connectionByEnvironmentName;
    v11->_connectionByEnvironmentName = v15;

    v17 = objc_opt_new(&OBJC_CLASS___NSObject);
    pushTokenByEnvironmentNameLock = v11->_pushTokenByEnvironmentNameLock;
    v11->_pushTokenByEnvironmentNameLock = v17;

    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.remotemanagementd.push", v20);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v21;

    v23 = -[RMPersistentHistoryNotifier initWithContext:]( objc_alloc(&OBJC_CLASS___RMPersistentHistoryNotifier),  "initWithContext:",  v10);
    persistentHistoryNotifier = v11->_persistentHistoryNotifier;
    v11->_persistentHistoryNotifier = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionAuthor]);
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v25));
      -[RMPersistentHistoryNotifier setIgnoredTransactionAuthors:]( v11->_persistentHistoryNotifier,  "setIgnoredTransactionAuthors:",  v26);
    }

    -[RMPersistentHistoryNotifier setDelegate:](v11->_persistentHistoryNotifier, "setDelegate:", v11);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RMPushController;
  -[RMPushController dealloc](&v3, "dealloc");
}

- (void)_stop
{
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  if (connectionByEnvironmentName)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( connectionByEnvironmentName,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1000BA6D0);
    v4 = self->_connectionByEnvironmentName;
    self->_connectionByEnvironmentName = 0LL;
  }

- (void)_start
{
  objc_super v3 = _os_activity_create( (void *)&_mh_execute_header,  "PushController: starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v4);
  -[RMPersistentHistoryNotifier start](self->_persistentHistoryNotifier, "start");
  -[RMPushController _updateConnections](self, "_updateConnections");
  -[RMPushController _notifyPushTokenDidChangeIfNeeded](self, "_notifyPushTokenDidChangeIfNeeded");
  os_activity_scope_leave(&v4);
}

- (void)_updateConnections
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController context](self, "context"));
  v19[0] = APSEnvironmentProduction;
  os_activity_scope_state_s v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v20[0] = v4;
  v19[1] = APSEnvironmentDevelopment;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v20[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100055C4C;
  v17[3] = &unk_1000B9150;
  id v7 = v6;
  id v18 = v7;
  [v3 performBlockAndWait:v17];

  id v8 = self->_connectionByEnvironmentName;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController serialQueue](self, "serialQueue"));
  id v10 = self->_connectionByEnvironmentName;
  objc_sync_enter(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100054124;
  v13[3] = &unk_1000BA6F8;
  v11 = v8;
  v14 = v11;
  id v12 = v9;
  id v15 = v12;
  v16 = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  objc_sync_exit(v10);
}

+ (id)_connectionWithEnvironmentName:(id)a3 queue:(id)a4
{
  uint64_t v5 = qword_1000CF310;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_1000CF310, &stru_1000BA718);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000CF308 objectForKeyedSubscript:v7]);
  id v9 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( objc_alloc(&OBJC_CLASS___APSConnection),  "initWithEnvironmentName:namedDelegatePort:queue:",  v7,  v8,  v6);

  return v9;
}

- (void)_notifyPushTokenDidChangeIfNeeded
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v24 = self->_pushTokenByEnvironmentNameLock;
  objc_sync_enter(v24);
  os_activity_scope_state_s v4 = self->_pushTokenByEnvironmentName;
  v25 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController _currentPushTokenByEnvironmentName](self, "_currentPushTokenByEnvironmentName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v4, "allKeys"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  [v7 addObjectsFromArray:v8];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12, v24));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);
        if (v14) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v13 == 0LL;
        }
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v12);
        }

        else
        {
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v32 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Push token for %{public}@ has been removed, ignoring change...",  buf,  0xCu);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, v12);
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }

    while (v9);
  }

  unsigned int v18 = -[NSMutableDictionary isEqual:](v3, "isEqual:", v4);
  char v19 = v18;
  if (v18)
  {
    pushTokenByEnvironmentName = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
    if (os_log_type_enabled(pushTokenByEnvironmentName, OS_LOG_TYPE_DEBUG)) {
      sub_100055F0C(pushTokenByEnvironmentName);
    }
  }

  else
  {
    dispatch_queue_t v21 = (NSDictionary *)-[NSMutableDictionary copy](v3, "copy");
    pushTokenByEnvironmentName = (os_log_s *)v25->_pushTokenByEnvironmentName;
    v25->_pushTokenByEnvironmentName = v21;
  }

  objc_sync_exit(v24);
  if ((v19 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController subscribedStatusKeyPathUpdater](v25, "subscribedStatusKeyPathUpdater"));
    [v22 notifyStatusDidChangeForKeyPath:RMModelStatusItemManagementPushToken];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController delegate](v25, "delegate"));
    [v23 pushController:v25 didChangePushTokenByEnvironmentName:v3];
  }
}

- (id)_cachedPushTokenByEnvironment
{
  objc_super v3 = self->_pushTokenByEnvironmentNameLock;
  objc_sync_enter(v3);
  id v4 = -[NSDictionary copy](self->_pushTokenByEnvironmentName, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (id)_currentPushTokenByEnvironmentName
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = self->_connectionByEnvironmentName;
  objc_sync_enter(v4);
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000547AC;
  v8[3] = &unk_1000BA740;
  id v6 = v3;
  id v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( connectionByEnvironmentName,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  objc_sync_exit(v4);
  return v6;
}

- (NSSet)supportedKeyPaths
{
  uint64_t v5 = RMModelStatusItemManagementPushToken;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMPushController _pushEnvironmentNameForManagementChannel:error:]( self,  "_pushEnvironmentNameForManagementChannel:error:",  a4,  a5));
  if (v9)
  {
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v11 = RMModelStatusItemManagementPushToken;
    if ([v8 containsObject:RMModelStatusItemManagementPushToken])
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController _currentPushTokenByEnvironmentName](self, "_currentPushTokenByEnvironmentName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController _cachedPushTokenByEnvironment](self, "_cachedPushTokenByEnvironment"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v9]);
      v16 = (void *)v15;
      v17 = v14;
      if (v14 || (v17 = (void *)v15) != 0LL)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, v11);
      }

      else
      {
        char v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, v11);
      }
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return -[RMPushController queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:]( self,  "queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:",  a3,  a5,  a6);
}

- (id)_pushEnvironmentNameForManagementChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100054B6C;
  v26 = sub_100054B7C;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  char v19 = sub_100054B6C;
  v20 = sub_100054B7C;
  id v21 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController context](self, "context"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100054B84;
  v12[3] = &unk_1000B9738;
  id v8 = v6;
  id v13 = v8;
  v14 = &v16;
  uint64_t v15 = &v22;
  [v7 performBlockAndWait:v12];
  id v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = 0LL;
    if (a4) {
      *a4 = v9;
    }
  }

  else
  {
    id v10 = (id)v23[5];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController _environmentNameForConnection:](self, "_environmentNameForConnection:", a3));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Push token received: %{public}@ in environment: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  -[RMPushController _notifyPushTokenDidChangeIfNeeded](self, "_notifyPushTokenDidChangeIfNeeded");
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMPushController _environmentNameForConnection:](self, "_environmentNameForConnection:", a3));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v6;
    __int16 v18 = 2114;
    char v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Push notification received: %{public}@ in environment: %{public}@",  buf,  0x16u);
  }

  if (v7)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    if (v10)
    {
      id v15 = 0LL;
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolPushMessage load:serializationType:error:]( &OBJC_CLASS___RMProtocolPushMessage,  "load:serializationType:error:",  v10,  1LL,  &v15));
      uint64_t v12 = (os_log_s *)v15;
      if (v11)
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 messageEnrollmentToken]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 messageSyncTokens]);
        -[RMPushController _updatePushReceivedWithTopic:enrollmentToken:syncTokens:forEnvironmentName:]( self,  "_updatePushReceivedWithTopic:enrollmentToken:syncTokens:forEnvironmentName:",  v9,  v13,  v14,  v7);
      }

      else
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v17 = v9;
          __int16 v18 = 2114;
          char v19 = v7;
          __int16 v20 = 2114;
          id v21 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unable to parse push message for topic: %{public}@ in environment: %{public}@: %{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100055FF0();
      }
    }
  }
}

- (void)_updatePushReceivedWithTopic:(id)a3 enrollmentToken:(id)a4 syncTokens:(id)a5 forEnvironmentName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog push](&OBJC_CLASS___RMLog, "push"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v13;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Received push for environment: %{public}@ enrollment token: %{public}@ topic: %{public}@",  buf,  0x20u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  void v20[2] = sub_100055270;
  v20[3] = &unk_1000BA768;
  id v21 = v13;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v25 = (id)objc_claimAutoreleasedReturnValue(-[RMPushController context](self, "context"));
  id v15 = v25;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  id v19 = v13;
  [v15 performBlockAndWait:v20];
}

- (id)_environmentNameForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100054B6C;
  id v17 = sub_100054B7C;
  id v18 = 0LL;
  uint64_t v5 = self->_connectionByEnvironmentName;
  objc_sync_enter(v5);
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000557DC;
  v10[3] = &unk_1000BA790;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( connectionByEnvironmentName,  "enumerateKeysAndObjectsUsingBlock:",  v10);

  objc_sync_exit(v5);
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v6 = a4;
  unint64_t v7 = (unint64_t)[v6 changeType];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 changedObjectID]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 entity]);

  id v10 = v9;
  id v11 = v10;
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[RMHTTPConduitState entity](&OBJC_CLASS___RMHTTPConduitState, "entity"));
    if ([v11 isKindOfEntity:v13])
    {
      id v14 = v11;
      goto LABEL_11;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMHTTPConduitConfig entity](&OBJC_CLASS___RMHTTPConduitConfig, "entity"));
    unsigned __int8 v23 = [v11 isKindOfEntity:v22];

    if ((v23 & 1) != 0) {
      goto LABEL_13;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 updatedProperties]);
  id v13 = v11;
  id v14 = v12;
  if (v7 == 1
    && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[RMHTTPConduitState entity](&OBJC_CLASS___RMHTTPConduitState, "entity")),
        unsigned int v16 = [v13 isKindOfEntity:v15],
        v15,
        v16))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 propertiesByName]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"pushEnvironment"]);

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 propertiesByName]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"pushTopic"]);

    if ([v14 containsObject:v18])
    {

LABEL_11:
LABEL_13:

LABEL_14:
      BOOL v21 = 1;
      *a5 = 1;
      goto LABEL_15;
    }

    unsigned __int8 v25 = [v14 containsObject:v20];

    if ((v25 & 1) != 0) {
      goto LABEL_14;
    }
  }

  else
  {
  }

  BOOL v21 = 0;
LABEL_15:

  return v21;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 insertedObjectIDs]);
  if (![v8 count])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedObjectIDs]);
    if (![v9 count])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 deletedObjectIDs]);
      id v12 = [v11 count];

      if (!v12) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

LABEL_5:
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "PushController: refreshing",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &v13);
  -[RMPushController _updateConnections](self, "_updateConnections");
  os_activity_scope_leave(&v13);

LABEL_6:
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater
{
  return self->_subscribedStatusKeyPathUpdater;
}

- (void)setSubscribedStatusKeyPathUpdater:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (RMPushControllerDelegate)delegate
{
  return (RMPushControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end