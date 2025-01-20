@interface MRDRapportRemoteControlService
+ (NSUserDefaults)userDefaults;
+ (id)_readConnectionRecordsFromDisk;
+ (void)_writeConnectionRecordsToDisk:(id)a3;
- (MRCompanionLinkClient)client;
- (MRDRapportRemoteControlService)init;
- (MRDRapportRemoteControlServiceDelegate)delegate;
- (NSMutableArray)connections;
- (id)_connectionForSource:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_onWorkerQueue_connectRemoteControlChannelForSource:(id)a3 destination:(id)a4 destinationGroupUID:(id)a5 session:(id)a6 name:(id)a7;
- (void)_onWorkerQueue_disconnectAllRemoteControlChannels;
- (void)_onWorkerQueue_disconnectRemoteControlChannelForSource:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_onWorkerQueue_disconnectRemoteControlChannelsWithError:(id)a3 predicate:(id)a4;
- (void)_persistConnectionRecordsToDisk;
- (void)_resetPersistedConnections;
- (void)setClient:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDRapportRemoteControlService

- (MRDRapportRemoteControlService)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MRDRapportRemoteControlService;
  v2 = -[MRDRapportRemoteControlService init](&v28, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRDRapportRemoteControlService.workerQueue", v4);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    connections = v2->_connections;
    v2->_connections = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
    client = v2->_client;
    v2->_client = (MRCompanionLinkClient *)v9;

    objc_initWeak(&location, v2);
    v11 = v2->_client;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10003ECDC;
    v25[3] = &unk_10039B070;
    objc_copyWeak(&v26, &location);
    id v12 =  -[MRCompanionLinkClient registerRequest:callback:]( v11,  "registerRequest:callback:",  @"com.apple.mediaremote.remotecontrol.connect",  v25);
    v13 = v2->_client;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10003EEC0;
    v23[3] = &unk_10039B0C0;
    objc_copyWeak(&v24, &location);
    id v14 =  -[MRCompanionLinkClient registerEvent:callback:]( v13,  "registerEvent:callback:",  @"com.apple.mediaremote.remotecontrol.disconnect",  v23);
    v15 = v2->_client;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_10003F214;
    v21 = &unk_10039B0C0;
    objc_copyWeak(&v22, &location);
    id v16 =  -[MRCompanionLinkClient registerEvent:callback:]( v15,  "registerEvent:callback:",  @"com.apple.mediaremote.remotecontrol.reset",  &v18);
    -[MRDRapportRemoteControlService _resetPersistedConnections](v2, "_resetPersistedConnections", v18, v19, v20, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v2;
}

+ (NSUserDefaults)userDefaults
{
  if (qword_1003FDC90 != -1) {
    dispatch_once(&qword_1003FDC90, &stru_10039B108);
  }
  return (NSUserDefaults *)(id)qword_1003FDC88;
}

- (id)_connectionForSource:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  connections = self->_connections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003F58C;
  v17[3] = &unk_10039B130;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray mr_first:](connections, "mr_first:", v17));

  return v15;
}

- (void)_onWorkerQueue_connectRemoteControlChannelForSource:(id)a3 destination:(id)a4 destinationGroupUID:(id)a5 session:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v37 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRapportRemoteControlService _connectionForSource:destination:session:]( self,  "_connectionForSource:destination:session:",  v12,  v13,  v15));
  uint64_t v17 = MRLogCategoryConnections();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v12;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDRapportRemoteControlServiceConnection] Connecting remoteControlChannel to <%@->%@/%@>...",  buf,  0x20u);
  }

  id v19 = objc_alloc_init(&OBJC_CLASS___MRDRapportRemoteControlServiceConnection);
  -[MRDRapportRemoteControlServiceConnection setSourceUID:](v19, "setSourceUID:", v12);
  -[MRDRapportRemoteControlServiceConnection setDestinationOutputDeviceUID:](v19, "setDestinationOutputDeviceUID:", v13);
  -[MRDRapportRemoteControlServiceConnection setDestinationGroupUID:](v19, "setDestinationGroupUID:", v14);
  -[MRDRapportRemoteControlServiceConnection setSessionUID:](v19, "setSessionUID:", v15);
  -[MRDRapportRemoteControlServiceConnection setName:](v19, "setName:", v37);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MRDRapportRemoteControlServiceConnection setConnectionAttemptDate:](v19, "setConnectionAttemptDate:", v20);

  v21 = -[MRRapportTransportConnection initWithDeviceUID:sessionUID:targetDevice:error:]( objc_alloc(&OBJC_CLASS___MRRapportTransportConnection),  "initWithDeviceUID:sessionUID:targetDevice:error:",  v12,  v15,  0LL,  0LL);
  id v22 = objc_alloc(&OBJC_CLASS___NSString);
  if (v14) {
    id v23 = v14;
  }
  else {
    id v23 = v13;
  }
  id v24 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"RapportRemoteControlChannel-<%@->%@/%@>",  v12,  v23,  v15);
  -[MRRapportTransportConnection setLabel:](v21, "setLabel:", v24);

  -[MRRapportTransportConnection setDestinationOutputDeviceUID:](v21, "setDestinationOutputDeviceUID:", v13);
  -[MRRapportTransportConnection setDestinationGroupUID:](v21, "setDestinationGroupUID:", v14);
  -[MRDRapportRemoteControlServiceConnection setConnection:](v19, "setConnection:", v21);
  objc_initWeak((id *)buf, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRapportRemoteControlServiceConnection connection](v19, "connection"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10003FA94;
  v38[3] = &unk_10039B158;
  objc_copyWeak(&v43, (id *)buf);
  id v36 = v12;
  id v39 = v36;
  id v27 = v13;
  id v40 = v27;
  id v28 = v15;
  id v41 = v28;
  id v29 = v14;
  id v42 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue( [v25 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v26 queue:0 usingBlock:v38]);
  -[MRDRapportRemoteControlServiceConnection setNotificationToken:](v19, "setNotificationToken:", v30);

  connections = self->_connections;
  if (!connections)
  {
    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v33 = self->_connections;
    self->_connections = v32;

    connections = self->_connections;
  }

  -[NSMutableArray addObject:](connections, "addObject:", v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRapportRemoteControlService delegate](self, "delegate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRapportRemoteControlServiceConnection connection](v19, "connection"));
  [v34 rapportRemoteControlService:self didAcceptConnection:v35];

  -[MRDRapportRemoteControlService _persistConnectionRecordsToDisk](self, "_persistConnectionRecordsToDisk");
  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);
}

- (void)_onWorkerQueue_disconnectAllRemoteControlChannels
{
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelForSource:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003FD38;
  v14[3] = &unk_10039B130;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[MRDRapportRemoteControlService _onWorkerQueue_disconnectRemoteControlChannelsWithError:predicate:]( self,  "_onWorkerQueue_disconnectRemoteControlChannelsWithError:predicate:",  0LL,  v14);
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelsWithError:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = -[NSMutableArray mutableCopy](self->_connections, "mutableCopy");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    v25 = v7;
    do
    {
      id v13 = 0LL;
      id v26 = v11;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
        if (v7[2](v7, v14))
        {
          uint64_t v15 = MRLogCategoryConnections();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 sourceUID]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 destinationOutputDeviceUID]);
            uint64_t v19 = v12;
            id v20 = v9;
            v21 = self;
            id v22 = v6;
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionUID]);
            *(_DWORD *)buf = 138412802;
            v32 = v17;
            __int16 v33 = 2112;
            v34 = v18;
            __int16 v35 = 2112;
            id v36 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[MRDRapportRemoteControlServiceConnection] Disconnecting remoteControlChannel from <%@->%@/%@>...",  buf,  0x20u);

            id v6 = v22;
            self = v21;
            id v9 = v20;
            uint64_t v12 = v19;
            v7 = v25;

            id v11 = v26;
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 connection]);
          [v24 closeWithError:v6];

          -[NSMutableArray removeObject:](self->_connections, "removeObject:", v14);
          -[MRDRapportRemoteControlService _persistConnectionRecordsToDisk](self, "_persistConnectionRecordsToDisk");
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }

    while (v11);
  }
}

- (void)_persistConnectionRecordsToDisk
{
  id v3 = [(id)objc_opt_class(self) userDefaults];
  id obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  [(id)objc_opt_class(self) _writeConnectionRecordsToDisk:self->_connections];
  objc_sync_exit(obj);
}

- (void)_resetPersistedConnections
{
  id v3 = [(id)objc_opt_class(self) userDefaults];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(v4);
  id v5 = [(id)objc_opt_class(self) _readConnectionRecordsFromDisk];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) sourceUID]);
        -[NSMutableSet addObject:](v7, "addObject:", v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v13 = v7;
  id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        -[MRCompanionLinkClient sendEvent:destination:userInfo:]( self->_client,  "sendEvent:destination:userInfo:",  @"com.apple.mediaremote.remotecontrol.reset",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v16),  0LL,  (void)v17);
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    }

    while (v14);
  }

  [(id)objc_opt_class(self) _writeConnectionRecordsToDisk:0];
  objc_sync_exit(v4);
}

+ (id)_readConnectionRecordsFromDisk
{
  id v2 = [(id)objc_opt_class(a1) userDefaults];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"incomingRapportConnections"]);
  id v5 = objc_alloc(&OBJC_CLASS___NSSet);
  v11[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v11[1] = objc_opt_class(&OBJC_CLASS___MRDRapportRemoteControlServiceConnection);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v7 = -[NSSet initWithArray:](v5, "initWithArray:", v6);
  uint64_t v8 = MRCreateFromData(v4, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

+ (void)_writeConnectionRecordsToDisk:(id)a3
{
  id v16 = a3;
  id v4 = [v16 count];
  id v5 = [(id)objc_opt_class(a1) userDefaults];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    uint64_t v8 = MRCreateDataFromObject(v16);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 setObject:v9 forKey:@"incomingRapportConnections"];

    if (MSVDeviceOSIsInternalInstall())
    {
      id v10 = [(id)objc_opt_class(a1) userDefaults];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
      [v11 setObject:v12 forKey:@"incomingRapportConnectionsDescription"];

LABEL_6:
    }
  }

  else
  {
    [v6 removeObjectForKey:@"incomingRapportConnections"];

    if (MSVDeviceOSIsInternalInstall())
    {
      id v13 = [(id)objc_opt_class(a1) userDefaults];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v11 removeObjectForKey:@"incomingRapportConnectionsDescription"];
      goto LABEL_6;
    }
  }

  id v14 = [(id)objc_opt_class(a1) userDefaults];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v15 synchronize];
}

- (MRDRapportRemoteControlServiceDelegate)delegate
{
  return (MRDRapportRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end