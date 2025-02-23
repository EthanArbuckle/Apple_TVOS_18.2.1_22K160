@interface PCSIDSSyncing
- (BOOL)havePeers;
- (NSMutableDictionary)peers;
- (NSOperationQueue)queue;
- (OS_dispatch_queue)syncingQueue;
- (PCSIDSSyncing)initWithManager:(id)a3 transport:(id)a4 serialQueue:(id)a5;
- (PCSIDSTransport)transport;
- (PCSKeySyncing)manager;
- (void)checkSyncingForPeer:(id)a3 force:(BOOL)a4;
- (void)connectionForDevice:(id)a3 complete:(id)a4;
- (void)devicesAreNoLongerNearby:(id)a3;
- (void)devicesAreNowNearby:(id)a3;
- (void)incomingMessage:(id)a3 fromDevice:(id)a4;
- (void)newDevices:(id)a3 removedDevices:(id)a4;
- (void)setManager:(id)a3;
- (void)setPeers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSyncingQueue:(id)a3;
- (void)setTransport:(id)a3;
- (void)triggerIDSSyncing:(id)a3;
@end

@implementation PCSIDSSyncing

- (PCSIDSSyncing)initWithManager:(id)a3 transport:(id)a4 serialQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PCSIDSSyncing;
  v12 = -[PCSIDSSyncing init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transport, a4);
    objc_storeStrong((id *)&v13->_manager, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    peers = v13->_peers;
    v13->_peers = (NSMutableDictionary *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("PCSIDSSyncing", 0LL);
    syncingQueue = v13->_syncingQueue;
    v13->_syncingQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PCSDeviceManager sharedManager](&OBJC_CLASS___PCSDeviceManager, "sharedManager"));
    [v18 setDelegate:v13];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing transport](v13, "transport"));
    [v19 setDelegate:v13];

    v20 = v13;
  }

  return v13;
}

- (void)incomingMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PCSDeviceManager sharedManager](&OBJC_CLASS___PCSDeviceManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceForIDSIdentifier:v7]);

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100007B84;
    v11[3] = &unk_100024AE8;
    id v12 = v7;
    id v13 = v6;
    -[PCSIDSSyncing connectionForDevice:complete:](self, "connectionForDevice:complete:", v9, v11);
  }

  else
  {
    id v10 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to get PCSDevice for identifier %@; dropping message.",
        buf,
        0xCu);
    }
  }
}

- (void)connectionForDevice:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing syncingQueue](self, "syncingQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007D4C;
  v11[3] = &unk_100024B38;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)havePeers
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing syncingQueue](self, "syncingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007FCC;
  block[3] = &unk_100024B60;
  block[4] = &v7;
  objc_copyWeak(&v6, &location);
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)v3;
}

- (void)checkSyncingForPeer:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing syncingQueue](self, "syncingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008114;
  block[3] = &unk_100024BB0;
  objc_copyWeak(&v12, &location);
  id v10 = v6;
  id v11 = self;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)triggerIDSSyncing:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"force"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing syncingQueue](self, "syncingQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000082E8;
  v8[3] = &unk_100024BD8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  unsigned __int8 v10 = v6;
  dispatch_async(v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)newDevices:(id)a3 removedDevices:(id)a4
{
  id v32 = a3;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          id v12 = v10;
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceIdentifier]);
          *(_DWORD *)buf = 138412290;
          v45 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device %@ has disappeared", buf, 0xCu);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }

    while (v7);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v33 = v32;
  id v14 = [v33 countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v33);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
        v19 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v18 idsDeviceIdentifier]);
          unsigned int v22 = [v18 isActivePairedDevice];
          unsigned int v23 = [v18 isConnected];
          *(_DWORD *)buf = 138412802;
          v45 = v21;
          __int16 v46 = 1024;
          unsigned int v47 = v22;
          __int16 v48 = 1024;
          unsigned int v49 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Device %@ appeared. isActive:%d, isConnected:%d",  buf,  0x18u);
        }

        if ([v18 isActivePairedDevice])
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing manager](self, "manager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v18 idsDeviceIdentifier]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v24 getClientWithIdentifier:v25]);

          v27 = (void *)objc_claimAutoreleasedReturnValue([v18 model]);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v18 osVersion]);
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@",  v27,  v28));
          [v26 setName:v29];

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing manager](self, "manager"));
          [v30 saveClient:v26];

          if ([v18 supportsNewProtocol])
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSSyncing manager](self, "manager"));
            [v31 updateProtocolVersionIfNeeded:v26];
          }

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_100008940;
          v35[3] = &unk_100024C00;
          v35[4] = v18;
          -[PCSIDSSyncing connectionForDevice:complete:](self, "connectionForDevice:complete:", v18, v35);
        }
      }

      id v15 = [v33 countByEnumeratingWithState:&v36 objects:v50 count:16];
    }

    while (v15);
  }
}

- (void)devicesAreNowNearby:(id)a3
{
  id v3 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v10 = v9;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier]);
          unsigned int v12 = [v8 isActivePairedDevice];
          *(_DWORD *)buf = 138412546;
          v19 = v11;
          __int16 v20 = 1024;
          unsigned int v21 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device %@ is now nearby (isActive:%d)",  buf,  0x12u);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v5);
  }
}

- (void)devicesAreNoLongerNearby:(id)a3
{
  id v3 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          unsigned __int8 v10 = v8;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceIdentifier]);
          unsigned int v12 = [v9 isActivePairedDevice];
          *(_DWORD *)buf = 138412546;
          v18 = v11;
          __int16 v19 = 1024;
          unsigned int v20 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device %@ is no longer nearby (isActive:%d)",  buf,  0x12u);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v5);
  }
}

- (PCSIDSTransport)transport
{
  return (PCSIDSTransport *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTransport:(id)a3
{
}

- (PCSKeySyncing)manager
{
  return (PCSKeySyncing *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setManager:(id)a3
{
}

- (NSMutableDictionary)peers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPeers:(id)a3
{
}

- (OS_dispatch_queue)syncingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSyncingQueue:(id)a3
{
}

- (NSOperationQueue)queue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end