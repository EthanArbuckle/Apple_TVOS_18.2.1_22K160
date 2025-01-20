@interface IDSStatusQueryQueue
- (IDSStatusQueryQueue)init;
- (void)_callStateChanged;
- (void)dealloc;
- (void)enqueueQueryBlock:(id)a3 cleanup:(id)a4;
@end

@implementation IDSStatusQueryQueue

- (IDSStatusQueryQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSStatusQueryQueue;
  v2 = -[IDSStatusQueryQueue init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_callStateChanged" name:IMCallMonitorCallStatusChanged object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSStatusQueryQueue;
  -[IDSStatusQueryQueue dealloc](&v4, "dealloc");
}

- (void)_callStateChanged
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMCallMonitor sharedInstance](&OBJC_CLASS___IMCallMonitor, "sharedInstance"));
  unsigned __int8 v4 = [v3 isOnTelephonyCall];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("IDQuery");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = -[NSMutableArray count](self->_queue, "count");
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2048;
      id v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ _callStateChanged - no longer on a call, processing %lu pending queries!",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      id v16 = -[NSMutableArray count](self->_queue, "count");
      MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"%@ _callStateChanged - no longer on a call, processing %lu pending queries!");
      id v17 = -[NSMutableArray count](self->_queue, "count", self, v16);
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"%@ _callStateChanged - no longer on a call, processing %lu pending queries!");
      if ((_IMWillLog(@"IDQuery", v9) & 1) != 0)
      {
        -[NSMutableArray count](self->_queue, "count", self, v17);
        _IMAlwaysLog( 0LL,  @"IDQuery",  @"%@ _callStateChanged - no longer on a call, processing %lu pending queries!");
      }
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v10 = self->_queue;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = (void (**)(void))objc_retainBlock(*(id *)(*((void *)&v18 + 1) + 8LL * (void)i));
          v14[2]();
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v11);
    }

    queue = self->_queue;
    self->_queue = 0LL;
  }

- (void)enqueueQueryBlock:(id)a3 cleanup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10030C66C;
    v40[3] = &unk_100900C00;
    id v41 = v6;
    uint64_t v8 = (void (**)(void))v7;
    id v42 = v8;
    uint64_t v9 = objc_retainBlock(v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
    unsigned int v11 = [v10 isWiFiUsable];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v13 = [v12 supportsSimultaneousVoiceAndDataRightNow];

    if (((v11 | v13) & 1) != 0)
    {
      uint64_t v14 = OSLogHandleForIDSCategory("IDQuery");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = @"NO";
        if (v11) {
          id v16 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v44 = self;
        __int16 v45 = 2112;
        v46 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ - we're not on a call or wifi is usable, processing query immediately (Usable WiFi: %@)",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v17))
      {
        MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"%@ - we're not on a call or wifi is usable, processing query immediately (Usable WiFi: %@)");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"%@ - we're not on a call or wifi is usable, processing query immediately (Usable WiFi: %@)");
        if ((_IMWillLog(@"IDQuery", v18) & 1) != 0) {
          _IMAlwaysLog( 0LL,  @"IDQuery",  @"%@ - we're not on a call or wifi is usable, processing query immediately (Usable WiFi: %@)");
        }
      }
    }

    else
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMCallMonitor sharedInstance](&OBJC_CLASS___IMCallMonitor, "sharedInstance"));
      unsigned int v20 = [v19 isOnTelephonyCall];

      if (v20)
      {
        queue = self->_queue;
        if (!queue)
        {
          v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v23 = self->_queue;
          self->_queue = v22;

          queue = self->_queue;
        }

        if ((unint64_t)-[NSMutableArray count](queue, "count") <= 0xC7)
        {
          uint64_t v24 = OSLogHandleForIDSCategory("IDQuery");
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@ - on a call and wifi isn't usable, enqueuing query to avoid mRAB",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v26))
          {
            MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"%@ - on a call and wifi isn't usable, enqueuing query to avoid mRAB");
            v39 = self;
            IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"%@ - on a call and wifi isn't usable, enqueuing query to avoid mRAB");
            if ((_IMWillLog(@"IDQuery", v27) & 1) != 0)
            {
              v39 = self;
              _IMAlwaysLog( 0LL,  @"IDQuery",  @"%@ - on a call and wifi isn't usable, enqueuing query to avoid mRAB");
            }
          }

          id v28 = objc_msgSend(v9, "copy", v39);

          v29 = self->_queue;
          id v30 = objc_retainBlock(v28);
          -[NSMutableArray addObject:](v29, "addObject:", v30);

          goto LABEL_35;
        }

        uint64_t v35 = OSLogHandleForIDSCategory("IDQuery");
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@ - too many enqueued queries, dropping this one",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v37))
        {
          MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"%@ - too many enqueued queries, dropping this one");
          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"%@ - too many enqueued queries, dropping this one");
          if ((_IMWillLog(@"IDQuery", v38) & 1) != 0) {
            _IMAlwaysLog(0LL, @"IDQuery", @"%@ - too many enqueued queries, dropping this one");
          }
        }

        if (v8) {
          v8[2](v8);
        }
LABEL_34:
        id v28 = v9;
LABEL_35:

        goto LABEL_36;
      }

      uint64_t v31 = OSLogHandleForIDSCategory("IDQuery");
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v44 = self;
        __int16 v45 = 2112;
        v46 = @"NO";
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ - we're on a call but the network is usable, processing query immediately (Usable WiFi: %@)",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v33))
      {
        MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"%@ - we're on a call but the network is usable, processing query immediately (Usable WiFi: %@)");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"%@ - we're on a call but the network is usable, processing query immediately (Usable WiFi: %@)");
        if ((_IMWillLog(@"IDQuery", v34) & 1) != 0) {
          _IMAlwaysLog( 0LL,  @"IDQuery",  @"%@ - we're on a call but the network is usable, processing query immediately (Usable WiFi: %@)");
        }
      }
    }

    ((void (*)(void *))v9[2])(v9);
    goto LABEL_34;
  }

- (void).cxx_destruct
{
}

@end