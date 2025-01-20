@interface IDSCredentialsDaemon
+ (id)sharedInstance;
- (IDSCredentialsDaemon)init;
- (id)credentialLoaderForUniqueID:(id)a3;
- (void)_pidSuspended:(int)a3;
- (void)_terminate;
- (void)addCredentialLoader:(id)a3;
- (void)dealloc;
- (void)removeCredentialLoaderForUniqueID:(id)a3;
- (void)shutdown;
@end

@implementation IDSCredentialsDaemon

+ (id)sharedInstance
{
  if (qword_1000157F0 != -1) {
    dispatch_once(&qword_1000157F0, &stru_100010678);
  }
  return (id)qword_1000157F8;
}

- (IDSCredentialsDaemon)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned int v4 = [v3 systemIsShuttingDown];

  if (v4)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("Warning", v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"IDSCredentialsDaemon";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ System is shutting down, not creating daemon",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ System is shutting down, not creating daemon");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"%@ System is shutting down, not creating daemon");
      _IDSLogTransport(@"Warning", @"IDS", @"%@ System is shutting down, not creating daemon");
    }

    v9 = 0LL;
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v5);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Building daemon", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Building daemon");
    }

    v37.receiver = self;
    v37.super_class = (Class)&OBJC_CLASS___IDSCredentialsDaemon;
    v13 = -[IDSCredentialsDaemon init](&v37, "init");
    if (v13)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
      id stateMonitor = v13->_stateMonitor;
      v13->_id stateMonitor = v14;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v13);
      id v16 = v13->_stateMonitor;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100008868;
      v35[3] = &unk_1000106A0;
      objc_copyWeak(&v36, (id *)buf);
      [v16 setHandler:v35];
      v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uniqueIDToCredentialLoaderMap = v13->_uniqueIDToCredentialLoaderMap;
      v13->_uniqueIDToCredentialLoaderMap = v17;

      uint64_t v20 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Opening up the grant MIG port", v34, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v22)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Opening up the grant MIG port");
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCredentialsDaemonMIGInterface sharedInstance]( &OBJC_CLASS___IDSCredentialsDaemonMIGInterface,  "sharedInstance"));
      [v23 acceptIncomingGrantRequests];
      uint64_t v25 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Now accepting grants, setup complete",  v34,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v27)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemon",  @"Now accepting grants, setup complete");
      }

      uint64_t v29 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Opening up the IDS interface", v34, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v31)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Opening up the IDS interface");
      }

      id v32 =  +[IDSCredentialsDaemonIDSInterface sharedInstance]( &OBJC_CLASS___IDSCredentialsDaemonIDSInterface,  "sharedInstance");

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }

    self = v13;
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSCredentialsDaemon;
  -[IDSCredentialsDaemon dealloc](&v3, "dealloc");
}

- (void)_terminate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCredentialsDaemonMIGInterface sharedInstance]( &OBJC_CLASS___IDSCredentialsDaemonMIGInterface,  "sharedInstance"));
  [v2 denyIncomingGrantRequests];

  IMSyncronizeAppPreferences();
  exit(0);
}

- (void)shutdown
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", a2);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Shutting down");
  }

  -[IDSCredentialsDaemon _terminate](self, "_terminate");
}

- (void)addCredentialLoader:(id)a3
{
  unsigned int v4 = (NSMutableDictionary *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary uniqueID](v4, "uniqueID"));
    if ([v6 length])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uniqueIDToCredentialLoaderMap, "objectForKey:", v6));

      if (!v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_uniqueIDToCredentialLoaderMap, "allKeys"));
        id v9 = [v8 count];

        if (!v9)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMMobileNetworkManager sharedInstance]( &OBJC_CLASS___IMMobileNetworkManager,  "sharedInstance"));
          [v10 addFastDormancyDisableToken:@"IDSCredentialsDaemon"];
        }

        -[NSMutableDictionary setObject:forKey:](self->_uniqueIDToCredentialLoaderMap, "setObject:forKey:", v5, v6);
        uint64_t v12 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v11);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Adding Loader %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v14)
          && _IDSShouldLog(1LL, @"IDSCredentialsDaemon"))
        {
          _IDSLogV(1LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Adding Loader %@");
        }

        uint64_t v16 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v15);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uniqueIDToCredentialLoaderMap = self->_uniqueIDToCredentialLoaderMap;
          *(_DWORD *)buf = 138412290;
          v21 = uniqueIDToCredentialLoaderMap;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v19)
          && _IDSShouldLog(1LL, @"IDSCredentialsDaemon"))
        {
          _IDSLogV(1LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"New map %@");
        }
      }
    }
  }
}

- (void)removeCredentialLoaderForUniqueID:(id)a3
{
  unsigned int v4 = (NSMutableDictionary *)a3;
  if (-[NSMutableDictionary length](v4, "length"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_uniqueIDToCredentialLoaderMap, "removeObjectForKey:", v4);
    uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Removing Loader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(1LL, @"IDSCredentialsDaemon"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Removing Loader for uniqueID %@");
    }

    uint64_t v10 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uniqueIDToCredentialLoaderMap = self->_uniqueIDToCredentialLoaderMap;
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = uniqueIDToCredentialLoaderMap;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(1LL, @"IDSCredentialsDaemon"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"New map %@");
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000909C;
    v14[3] = &unk_1000106C8;
    v14[4] = self;
    im_dispatch_after_primary_queue(v14, 30.0);
  }
}

- (id)credentialLoaderForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uniqueIDToCredentialLoaderMap, "objectForKey:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_pidSuspended:(int)a3
{
  uint64_t v4 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
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