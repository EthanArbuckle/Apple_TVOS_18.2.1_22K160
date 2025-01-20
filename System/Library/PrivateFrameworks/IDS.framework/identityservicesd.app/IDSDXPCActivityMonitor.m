@interface IDSDXPCActivityMonitor
+ (BOOL)isActivityMonitorSupported;
- (BOOL)_entitledForActivity:(id)a3;
- (IDSActivityMonitorStateManager)stateManager;
- (IDSDXPCActivityMonitor)initWithQueue:(id)a3 connection:(id)a4 activityMonitorStateManager:(id)a5;
- (NSArray)activityMonitorEntitlements;
- (NSMutableDictionary)clientRemoteObjectByActivity;
- (OS_dispatch_queue)queue;
- (void)_handleUpdate:(id)a3 forActivity:(id)a4;
- (void)activityMonitorManager:(id)a3 receivedUpdate:(id)a4 forActivity:(id)a5;
- (void)checkIfListeningForActivity:(id)a3 completion:(id)a4;
- (void)currentSubscriptionsForActivity:(id)a3 completion:(id)a4;
- (void)setActivityMonitorEntitlements:(id)a3;
- (void)setClientRemoteObjectByActivity:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldListen:(BOOL)a3 forActivity:(id)a4 completion:(id)a5;
- (void)setStateManager:(id)a3;
- (void)setupActivityMonitorClient:(id)a3 forActivity:(id)a4;
- (void)subscribeInfo:(id)a3 forActivity:(id)a4 withCompletion:(id)a5;
- (void)unsubscribeActivity:(id)a3 andSubActivity:(id)a4 withCompletion:(id)a5;
@end

@implementation IDSDXPCActivityMonitor

- (IDSDXPCActivityMonitor)initWithQueue:(id)a3 connection:(id)a4 activityMonitorStateManager:(id)a5
{
  id v9 = a3;
  v10 = (IDSDXPCActivityMonitor *)a4;
  id v11 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCActivityMonitor valueForEntitlement:]( v10,  "valueForEntitlement:",  kIDSActivityMonitorEntitlement));
  if (!v13)
  {
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v10;
      v27 = "Missing activity monitor entitlement -- failing creation of IDSDXPCActivityMonitor collaborator {connection: %@}";
      v28 = v26;
      uint32_t v29 = 12;
      goto LABEL_21;
    }

- (BOOL)_entitledForActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NSArray containsObject:](self->_activityMonitorEntitlements, "containsObject:", v4);
  if (!v5)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      activityMonitorEntitlements = self->_activityMonitorEntitlements;
      int v9 = 134218498;
      v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = activityMonitorEntitlements;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Not entitled for activity monitor activity! {self: %p, activity: %@, _activityMonitorEntitlements: %@}",  (uint8_t *)&v9,  0x20u);
    }
  }

  return v5;
}

- (void)_handleUpdate:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjectByActivity,  "objectForKeyedSubscript:",  v7));
  if (v8)
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v13 = self;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Posting update {self: %p, activity: %@, update: %@}",  buf,  0x20u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002040A8;
    v10[3] = &unk_1008F5F80;
    v10[4] = self;
    id v11 = v7;
    [v8 handleIncomingUpdate:v6 onActivity:v11 completion:v10];
  }
}

- (void)setupActivityMonitorClient:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v7))
  {
    if (v6)
    {
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxy]);
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint32_t v29 = self;
          __int16 v30 = 2112;
          id v31 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding activity monitor client {self: %p, activity: %@}",  buf,  0x16u);
        }

        clientRemoteObjectByActivity = self->_clientRemoteObjectByActivity;
        if (!clientRemoteObjectByActivity)
        {
          id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int16 v13 = self->_clientRemoteObjectByActivity;
          self->_clientRemoteObjectByActivity = v12;

          clientRemoteObjectByActivity = self->_clientRemoteObjectByActivity;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( clientRemoteObjectByActivity,  "setObject:forKeyedSubscript:",  v8,  v7);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
        [v14 addListener:self forActivity:v7];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 storedUpdatesForActivity:v7]);

        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        v10 = v16;
        id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            v20 = 0LL;
            do
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v10);
              }
              -[IDSDXPCActivityMonitor _handleUpdate:forActivity:]( self,  "_handleUpdate:forActivity:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v20),  v7,  (void)v23);
              v20 = (char *)v20 + 1;
            }

            while (v18 != v20);
            id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
          }

          while (v18);
        }
      }

      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        sub_1006A3CE0((uint64_t)self, (uint64_t)v7, v10);
      }

      goto LABEL_23;
    }

    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint32_t v29 = self;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Removing activity monitor client {self: %p, activity: %@}",  buf,  0x16u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_clientRemoteObjectByActivity,  "setObject:forKeyedSubscript:",  0LL,  v7);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
    [v22 removeListener:self forActivity:v7];

    if (!-[NSMutableDictionary count](self->_clientRemoteObjectByActivity, "count"))
    {
      v8 = self->_clientRemoteObjectByActivity;
      self->_clientRemoteObjectByActivity = 0LL;
LABEL_23:
    }
  }
}

- (void)checkIfListeningForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
    id v9 = [v8 isListeningOnActivity:v6];

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"NO";
      int v13 = 134218498;
      __int16 v14 = self;
      __int16 v15 = 2112;
      if ((_DWORD)v9) {
        id v11 = @"YES";
      }
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Checking if listening for activity monitor activity {self: %p, activity: %@, isListening: %@}",  (uint8_t *)&v13,  0x20u);
    }

    v7[2](v7, v9, 0LL);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -400LL,  0LL));
    ((void (**)(id, id, void *))v7)[2](v7, 0LL, v12);
  }
}

- (void)setShouldListen:(BOOL)a3 forActivity:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v8))
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"NO";
      int v15 = 134218498;
      id v16 = self;
      __int16 v17 = 2112;
      if (v6) {
        id v11 = @"YES";
      }
      id v18 = v8;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting should listen for activity monitor activity {self: %p, activity: %@, shouldListen: %@}",  (uint8_t *)&v15,  0x20u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
    int v13 = v12;
    if (v6) {
      [v12 startListeningOnActivity:v8];
    }
    else {
      [v12 stopListeningOnActivity:v8];
    }

    v9[2](v9, 0LL);
  }

  else
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -400LL,  0LL));
    ((void (**)(id, void *))v9)[2](v9, v14);
  }
}

- (void)currentSubscriptionsForActivity:(id)a3 completion:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void *, void))a4;
  if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v9))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentSubscriptionsForActivity:v9]);

    v6[2](v6, v8, 0LL);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -400LL,  0LL));
    ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v8);
  }
}

+ (BOOL)isActivityMonitorSupported
{
  BOOL v2 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"activity-monitor-min-version"]);

  if (v4)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      signed int v7 = [v4 intValue];
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        uint64_t v11 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Server provided a minimum value for activity monitor which was %ld",  (uint8_t *)&v10,  0xCu);
      }

      BOOL v2 = v7 < 2;
    }

    else
    {
      BOOL v2 = 1;
    }
  }

  return v2;
}

- (void)subscribeInfo:(id)a3 forActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  if (objc_msgSend((id)objc_opt_class(self, v11), "isActivityMonitorSupported"))
  {
    if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v9))
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218498;
        int v15 = self;
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Subscribing for activity monitor session {self: %p, activity: %@, info: %@}",  (uint8_t *)&v14,  0x20u);
      }

      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
      [v13 subscribeForInfo:v8 onActivity:v9 withCompletion:v10];
    }

    else
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -400LL,  0LL));
      v10[2](v10, v13);
    }
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Activity monitor is currently disabled by the server.",  (uint8_t *)&v14,  2u);
    }
  }
}

- (void)unsubscribeActivity:(id)a3 andSubActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  if (-[IDSDXPCActivityMonitor _entitledForActivity:](self, "_entitledForActivity:", v8))
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog activityMonitor](&OBJC_CLASS___IMIDSLog, "activityMonitor"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      int v14 = self;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unsubscribing for activity monitor session {self: %p, activity: %@, subActivity: %@}",  (uint8_t *)&v13,  0x20u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCActivityMonitor stateManager](self, "stateManager"));
    [v12 unsubscribeForActivity:v8 subActivity:v9 withCompletion:v10];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -400LL,  0LL));
    v10[2](v10, v12);
  }
}

- (void)activityMonitorManager:(id)a3 receivedUpdate:(id)a4 forActivity:(id)a5
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)activityMonitorEntitlements
{
  return self->_activityMonitorEntitlements;
}

- (void)setActivityMonitorEntitlements:(id)a3
{
}

- (NSMutableDictionary)clientRemoteObjectByActivity
{
  return self->_clientRemoteObjectByActivity;
}

- (void)setClientRemoteObjectByActivity:(id)a3
{
}

- (IDSActivityMonitorStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end