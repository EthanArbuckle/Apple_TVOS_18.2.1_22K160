@interface EventServer
- (EventServer)initWithEventStream:(const char *)a3;
- (NSMutableDictionary)clients;
- (OS_os_log)log;
- (OS_xpc_event_publisher)publisher;
- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5;
- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5 toClients:(id)a6;
- (void)activate;
- (void)handlePublisherAddToken:(unint64_t)a3 descriptor:(id)a4;
- (void)handlePublisherError:(int)a3;
- (void)handlePublisherRemoveToken:(unint64_t)a3;
- (void)sendAlreadyInstalledCryptexesToClient:(id)a3;
- (void)withInstalledCryptexList:(id)a3;
@end

@implementation EventServer

- (EventServer)initWithEventStream:(const char *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___EventServer;
  v4 = -[EventServer init](&v21, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.security.cryptexd.event_server", 0LL);
    uint64_t v6 = xpc_event_publisher_create(a3, v5);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    publisher = v4->_publisher;
    v4->_publisher = (OS_xpc_event_publisher *)v7;

    os_log_t v9 = os_log_create("com.apple.libcryptex", "event_server");
    log = v4->_log;
    v4->_log = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clients = v4->_clients;
    v4->_clients = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](v4, "publisher"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100013924;
    v19[3] = &unk_100055C38;
    v14 = v4;
    v20 = v14;
    xpc_event_publisher_set_handler(v13, v19);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](v14, "publisher"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100013A50;
    v17[3] = &unk_100055C60;
    v18 = v14;
    xpc_event_publisher_set_error_handler(v15, v17);
  }

  return v4;
}

- (void)activate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[EventServer publisher](self, "publisher"));
  xpc_event_publisher_activate();
}

- (void)withInstalledCryptexList:(id)a3
{
  id v3 = a3;
  id v5 = sub_100014D14();
  id v4 = [v3 copy];

  sub_100017E68(v5, v4, sub_100013AE0);
}

- (void)sendAlreadyInstalledCryptexesToClient:(id)a3
{
  id v4 = a3;
  if ([v4 eventMask])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100013B90;
    v5[3] = &unk_100055CB0;
    v5[4] = self;
    id v6 = v4;
    -[EventServer withInstalledCryptexList:](self, "withInstalledCryptexList:", v5);
  }
}

- (void)handlePublisherAddToken:(unint64_t)a3 descriptor:(id)a4
{
  id v6 = a4;
  objc_super v21 = 0LL;
  v22 = 0LL;
  int v7 = sub_10003CE10(v6, "CryptexEventClientName", &v22);
  if (v7)
  {
    int v8 = *__error();
    os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "CryptexEventClientName";
      __int16 v25 = 1024;
      LODWORD(v26) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Subscriber missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d",  buf,  0x12u);
    }

    v10 = __error();
LABEL_9:
    int *v10 = v8;
    goto LABEL_10;
  }

  int v11 = sub_10003CDB0(v6, "CryptexEventMask", (uint64_t *)&v21);
  if (v11)
  {
    int v8 = *__error();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = v22;
      __int16 v25 = 2082;
      v26 = "CryptexEventMask";
      __int16 v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Subscriber '%s' missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d",  buf,  0x1Cu);
    }

    v10 = __error();
    goto LABEL_9;
  }

  v13 = objc_alloc(&OBJC_CLASS___EventClient);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
  v15 = -[EventClient initWithToken:name:eventMask:](v13, "initWithToken:name:eventMask:", a3, v14, v21);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v17 setObject:v15 forKeyedSubscript:v18];

  objc_sync_exit(v16);
  int v19 = *__error();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v24 = v22;
    __int16 v25 = 2048;
    v26 = v21;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "'%s' subscribed with event mask 0x%llx, token %llu",  buf,  0x20u);
  }

  *__error() = v19;
  -[EventServer sendAlreadyInstalledCryptexesToClient:](self, "sendAlreadyInstalledCryptexesToClient:", v15);

LABEL_10:
}

- (void)handlePublisherRemoveToken:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v9 removeObjectForKey:v10];

  objc_sync_exit(v5);
  int v11 = *__error();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientName]);
    int v14 = 138412546;
    v15 = v13;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "'%@' unsubscribed with token %llu",  (uint8_t *)&v14,  0x16u);
  }

  *__error() = v11;
}

- (void)handlePublisherError:(int)a3
{
  int v5 = *__error();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "XPC publisher error: %{darwin.errno}d",  (uint8_t *)v7,  8u);
  }

  *__error() = v5;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5
{
  id v19 = a4;
  id v20 = a5;
  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v9);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients", v19));
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[EventServer broadcastEvent:forCryptex:withInfo:toClients:]( self,  "broadcastEvent:forCryptex:withInfo:toClients:",  a3,  v19,  v20,  v8));

  return v17;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5 toClients:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v11;
  id v38 = v12;
  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unint64_t v39 = a3;
  xpc_dictionary_set_uint64(v14, "CRYPTEX_EVENT_TYPE", a3);
  id v40 = v10;
  xpc_object_t xdict = v14;
  xpc_dictionary_set_string(v14, "CRYPTEX_EVENT_CRYPTEX_NAME", (const char *)[v40 UTF8String]);
  v36 = v13;
  if (v13)
  {
    id v46 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  100LL,  0LL,  &v46));
    id v16 = v46;
    if (!v15)
    {
      unint64_t v28 = v16;
      signed int v29 = [v16 code];
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));

      if (v30)
      {
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          uint64_t v32 = 3LL;
        }
        else {
          uint64_t v32 = 2LL;
        }
        *(_WORD *)buf = 0;
        v33 = (char *)_os_log_send_and_compose_impl(v32, 0LL, 0LL, 0LL, &_mh_execute_header, v31, 16LL);
      }

      else
      {
        *(_WORD *)buf = 0;
        v33 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      CFErrorRef v27 = sub_10000A444( "-[EventServer broadcastEvent:forCryptex:withInfo:toClients:]",  "event_server.m",  220,  "com.apple.security.cryptex",  v29,  v28,  v33);
      free(v33);
      goto LABEL_22;
    }

    v35 = v16;
    id v37 = v15;
    xpc_dictionary_set_data(v14, "CRYPTEX_EVENT_INFO", [v37 bytes], (size_t)objc_msgSend(v37, "length"));
  }

  else
  {
    id v37 = 0LL;
    v35 = 0LL;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v17 = v38;
  id v18 = [v17 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v17);
        }
        __int128 v21 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        int v22 = *__error();
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 clientName]);
          *(_DWORD *)buf = 134218498;
          unint64_t v48 = v39;
          __int16 v49 = 2112;
          id v50 = v40;
          __int16 v51 = 2112;
          v52 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "event 0x%llx for cryptex '%@' sent to '%@'",  buf,  0x20u);
        }

        *__error() = v22;
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](self, "publisher"));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v21 token]);
        xpc_event_publisher_fire(v25, [v26 unsignedLongLongValue], xdict);
      }

      id v18 = [v17 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }

    while (v18);
  }

  CFErrorRef v27 = 0LL;
  unint64_t v28 = v37;
LABEL_22:

  return v27;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
}

@end