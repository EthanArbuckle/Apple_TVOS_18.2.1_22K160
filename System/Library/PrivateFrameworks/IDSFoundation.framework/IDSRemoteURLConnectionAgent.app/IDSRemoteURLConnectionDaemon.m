@interface IDSRemoteURLConnectionDaemon
+ (id)sharedInstance;
- (IDSRemoteURLConnectionDaemon)init;
- (id)urlLoaderForUniqueID:(id)a3;
- (void)_pidSuspended:(int)a3;
- (void)_terminate;
- (void)_terminateAfterDelayIfIdle;
- (void)addURLLoader:(id)a3;
- (void)dealloc;
- (void)removeURLLoaderForUniqueID:(id)a3;
- (void)removeURLLoadersForUniqueIDs:(id)a3;
- (void)shutdown;
@end

@implementation IDSRemoteURLConnectionDaemon

+ (id)sharedInstance
{
  if (qword_100015960 != -1) {
    dispatch_once(&qword_100015960, &stru_1000105E8);
  }
  return (id)qword_100015968;
}

- (IDSRemoteURLConnectionDaemon)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned int v4 = [v3 systemIsShuttingDown];

  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Warning");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"IDSRemoteURLConnectionDaemon";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@ System is shutting down, not creating daemon",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV(@"IDSFoundation", @"%@ System is shutting down, not creating daemon");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"%@ System is shutting down, not creating daemon");
      _IDSLogTransport(@"Warning", @"IDS", @"%@ System is shutting down, not creating daemon");
    }

    v7 = 0LL;
  }

  else
  {
    uint64_t v8 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Building daemon", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled()
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @"Building daemon");
    }

    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___IDSRemoteURLConnectionDaemon;
    v10 = -[IDSRemoteURLConnectionDaemon init](&v28, "init");
    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
      id stateMonitor = v10->_stateMonitor;
      v10->_id stateMonitor = v11;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v10);
      id v13 = v10->_stateMonitor;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100004EC4;
      v26[3] = &unk_100010610;
      objc_copyWeak(&v27, (id *)buf);
      [v13 setHandler:v26];
      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uniqueIDToURLLoaderMap = v10->_uniqueIDToURLLoaderMap;
      v10->_uniqueIDToURLLoaderMap = v14;

      uint64_t v16 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Opening up the grant MIG port", v25, 2u);
      }

      if (os_log_shim_legacy_logging_enabled()
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Opening up the grant MIG port");
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemonMIGInterface sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemonMIGInterface,  "sharedInstance"));
      [v18 acceptIncomingGrantRequests];
      uint64_t v19 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Now accepting grants, setup complete",  v25,  2u);
      }

      if (os_log_shim_legacy_logging_enabled()
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Now accepting grants, setup complete");
      }

      uint64_t v21 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Opening up the IDS interface", v25, 2u);
      }

      if (os_log_shim_legacy_logging_enabled()
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Opening up the IDS interface");
      }

      id v23 =  +[IDSRemoteURLConnectionDaemonIDSInterface sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemonIDSInterface,  "sharedInstance");

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }

    self = v10;
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
  [v3 removeFastDormancyDisableToken:@"IDSRemoteURLConnectionDaemon"];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_terminate",  0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSRemoteURLConnectionDaemon;
  -[IDSRemoteURLConnectionDaemon dealloc](&v4, "dealloc");
}

- (void)_terminate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemonMIGInterface sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemonMIGInterface,  "sharedInstance"));
  [v2 denyIncomingGrantRequests];

  IMSyncronizeAppPreferences();
  exit(0);
}

- (void)shutdown
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @"Shutting down");
  }

  -[IDSRemoteURLConnectionDaemon _terminate](self, "_terminate");
}

- (void)addURLLoader:(id)a3
{
  objc_super v4 = (NSMutableDictionary *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary uniqueID](v4, "uniqueID"));
    if ([v6 length])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uniqueIDToURLLoaderMap, "objectForKey:", v6));

      if (!v7)
      {
        -[NSMutableDictionary setObject:forKey:](self->_uniqueIDToURLLoaderMap, "setObject:forKey:", v5, v6);
        uint64_t v8 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding Loader %@", buf, 0xCu);
        }

        if (((uint64_t (*)(void))os_log_shim_legacy_logging_enabled)()
          && _IDSShouldLog(1LL, @"IDSRemoteURLConnectionDaemon"))
        {
          v15 = v5;
          _IDSLogV(1LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @"Adding Loader %@");
        }

        uint64_t v10 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uniqueIDToURLLoaderMap = self->_uniqueIDToURLLoaderMap;
          *(_DWORD *)buf = 138412290;
          v17 = uniqueIDToURLLoaderMap;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v13)
          && _IDSShouldLog(1LL, @"IDSRemoteURLConnectionDaemon"))
        {
          v15 = self->_uniqueIDToURLLoaderMap;
          _IDSLogV(1LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @"New map %@");
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMMobileNetworkManager sharedInstance]( &OBJC_CLASS___IMMobileNetworkManager,  "sharedInstance",  v15));
        [v14 addFastDormancyDisableToken:@"IDSRemoteURLConnectionDaemon"];
      }
    }
  }
}

- (void)removeURLLoaderForUniqueID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
    -[IDSRemoteURLConnectionDaemon removeURLLoadersForUniqueIDs:](self, "removeURLLoadersForUniqueIDs:", v4);
  }
}

- (void)removeURLLoadersForUniqueIDs:(id)a3
{
  objc_super v4 = (NSMutableDictionary *)a3;
  if (-[NSMutableDictionary count](v4, "count"))
  {
    uniqueIDToURLLoaderMap = self->_uniqueIDToURLLoaderMap;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allObjects](v4, "allObjects"));
    -[NSMutableDictionary removeObjectsForKeys:](uniqueIDToURLLoaderMap, "removeObjectsForKeys:", v6);

    uint64_t v7 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Removing Loaders for uniqueIDs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(1LL, @"IDSRemoteURLConnectionDaemon"))
    {
      v17 = v4;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Removing Loaders for uniqueIDs %@");
    }

    uint64_t v10 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = self->_uniqueIDToURLLoaderMap;
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(1LL, @"IDSRemoteURLConnectionDaemon"))
    {
      v17 = self->_uniqueIDToURLLoaderMap;
      _IDSLogV(1LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @"New map %@");
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_uniqueIDToURLLoaderMap, "allKeys", v17));
    BOOL v15 = [v14 count] == 0;

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
      [v16 removeFastDormancyDisableToken:@"IDSRemoteURLConnectionDaemon"];
    }

    -[IDSRemoteURLConnectionDaemon _terminateAfterDelayIfIdle](self, "_terminateAfterDelayIfIdle");
  }
}

- (void)_terminateAfterDelayIfIdle
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000057D4;
  v2[3] = &unk_100010638;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, a2, 30.0);
}

- (id)urlLoaderForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uniqueIDToURLLoaderMap, "objectForKey:", v4));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)_pidSuspended:(int)a3
{
  uint64_t v4 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon", a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PID: %d was suspended", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
  }

- (void).cxx_destruct
{
}

@end