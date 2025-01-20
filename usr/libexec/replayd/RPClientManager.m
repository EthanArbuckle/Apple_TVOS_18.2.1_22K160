@interface RPClientManager
+ (id)sharedInstance;
- (NSMutableDictionary)bundleIDToClientDictionary;
- (RPClientManager)init;
- (id)getClientContainingBundleID:(id)a3;
- (id)getClientForBroadcastWithHostBundleID:(id)a3;
- (id)getClientMatchingBundleID:(id)a3;
- (id)getClientWithBundleID:(id)a3;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)removeClient:(id)a3;
- (void)setBundleIDToClientDictionary:(id)a3;
- (void)stopAllClientsWithHandler:(id)a3;
@end

@implementation RPClientManager

+ (id)sharedInstance
{
  if (qword_100084740 != -1) {
    dispatch_once(&qword_100084740, &stru_100071680);
  }
  return (id)qword_100084738;
}

- (RPClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPClientManager;
  v2 = -[RPClientManager init](&v8, "init");
  if (v2)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPClientManager init]";
      __int16 v11 = 1024;
      int v12 = 34;
      __int16 v13 = 2048;
      v14 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bundleIDToClientDictionary = v2->_bundleIDToClientDictionary;
    v2->_bundleIDToClientDictionary = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mainBundleIDToBundleID = v2->_mainBundleIDToBundleID;
    v2->_mainBundleIDToBundleID = v5;
  }

  return v2;
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPClientManager dealloc]";
    __int16 v6 = 1024;
    int v7 = 44;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPClientManager;
  -[RPClientManager dealloc](&v3, "dealloc");
}

- (void)addClient:(id)a3
{
  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  id v5 = a3;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
  -[NSMutableDictionary setObject:forKey:](bundleIDToClientDictionary, "setObject:forKey:", v5, v6);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientMainBundleID]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](mainBundleIDToBundleID, "setObject:forKeyedSubscript:", v9, v8);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  [v4 stopCurrentActiveSessionWithHandler:&stru_1000716A0];
  [v4 invalidate];
  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientBundleID]);
  -[NSMutableDictionary removeObjectForKey:](bundleIDToClientDictionary, "removeObjectForKey:", v6);

  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 clientMainBundleID]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](mainBundleIDToBundleID, "setObject:forKeyedSubscript:", 0LL, v8);
}

- (id)getClientWithBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4)),  v5,  v5))
  {
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4));
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mainBundleIDToBundleID,  "objectForKeyedSubscript:",  v4));
    if (v7) {
      __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v7));
    }
    else {
      __int16 v6 = 0LL;
    }
  }

  return v6;
}

- (id)getClientForBroadcastWithHostBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4)),  v5,  v5))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4));
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bundleIDToClientDictionary, "allValues", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientBundleID]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByString:@".pid."]);

          if (v14)
          {
            if ([v14 count])
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
              unsigned __int8 v16 = [v4 isEqualToString:v15];

              if ((v16 & 1) != 0)
              {
                id v6 = v12;

                goto LABEL_16;
              }
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = 0LL;
  }

- (id)getClientContainingBundleID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bundleIDToClientDictionary, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientBundleID]);
        unsigned __int8 v11 = [v10 containsString:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)getClientMatchingBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4)),  v5,  v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bundleIDToClientDictionary,  "objectForKeyedSubscript:",  v4));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)stopAllClientsWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPClientManager stopAllClientsWithHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 107;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v5 = dispatch_group_create();
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v31 = 1;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bundleIDToClientDictionary, "allValues"));
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  __int128 v14 = v4;
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 136446466;
          v26 = "-[RPClientManager stopAllClientsWithHandler:]";
          __int16 v27 = 1024;
          int v28 = 115;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d enter stop group",  v25,  0x12u);
        }

        dispatch_group_enter(v5);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1000211A0;
        v18[3] = &unk_1000716C8;
        __int128 v20 = buf;
        __int128 v19 = v5;
        [v10 stopCurrentActiveSessionWithHandler:v18];
      }

      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v7);
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 136446466;
    v26 = "-[RPClientManager stopAllClientsWithHandler:]";
    __int16 v27 = 1024;
    int v28 = 133;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notify stop group",  v25,  0x12u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000212A8;
  block[3] = &unk_1000716F0;
  id v16 = v14;
  v17 = buf;
  id v13 = v14;
  dispatch_group_notify(v5, v12, block);

  _Block_object_dispose(buf, 8);
}

- (NSMutableDictionary)bundleIDToClientDictionary
{
  return self->_bundleIDToClientDictionary;
}

- (void)setBundleIDToClientDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end