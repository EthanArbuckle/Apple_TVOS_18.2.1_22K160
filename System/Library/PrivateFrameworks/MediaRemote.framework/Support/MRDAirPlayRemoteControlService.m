@interface MRDAirPlayRemoteControlService
- (MRDAirPlayRemoteControlService)init;
- (MRDAirPlayRemoteControlServiceDelegate)delegate;
- (NSString)debugDescription;
- (void)_didCloseCommunicationChannel:(id)a3 error:(id)a4;
- (void)_didReceiveData:(id)a3 fromCommunicationChannel:(id)a4 connectionFactory:(id)a5;
- (void)_handleNewConnection:(id)a3 forServiceType:(int64_t)a4;
- (void)dealloc;
- (void)didCloseCommunicationChannel:(id)a3;
- (void)didReceiveData:(id)a3 fromCommunicationChannel:(id)a4;
- (void)outputContext:(id)a3 didCloseCommunicationChannel:(id)a4;
- (void)outputContext:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startContext:(id)a3;
- (void)stop;
@end

@implementation MRDAirPlayRemoteControlService

- (MRDAirPlayRemoteControlService)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDAirPlayRemoteControlService;
  v2 = -[MRDAirPlayRemoteControlService init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToWeakObjectsMapTable"));
    connections = v2->_connections;
    v2->_connections = (NSMapTable *)v3;

    v2->_started = 0;
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRDAirPlayRemoteControlService.workerQueue", v6);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[MRDMRRelayConnectionManager sharedManager](&OBJC_CLASS___MRDMRRelayConnectionManager, "sharedManager"));
    mrRelayConnectionManager = v2->_mrRelayConnectionManager;
    v2->_mrRelayConnectionManager = (MRDMRRelayConnectionManager *)v9;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDAirPlayRemoteControlService;
  -[MRDAirPlayRemoteControlService dealloc](&v3, "dealloc");
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v2->_connections, "objectEnumerator"));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      dispatch_queue_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableArray addObject:](v3, "addObject:", *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7));
        dispatch_queue_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  v8 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v9 = objc_opt_class(v2);
  if (v2->_started) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromArray(v3);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = MRCreateIndentedDebugDescriptionFromObject(v2->_mrRelayConnectionManager);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%@:%p {\n  started = %@\n  connections = %@\n  relayConnectionManager = %@\n}>",  v9,  v2,  v10,  v12,  v14);

  objc_sync_exit(v2);
  return v15;
}

- (void)start
{
  if (MRSupportsMediaControlReceiver(self, a2))
  {
    if (qword_1003FDF00 != -1) {
      dispatch_once(&qword_1003FDF00, &stru_1003A06B8);
    }
    if (qword_1003FDF08)
    {
      objc_super v3 = dlsym((void *)qword_1003FDF08, "APReceiverMediaRemoteXPCClient_SetDelegate");
      if (v3)
      {
        uint64_t v4 = MRLogCategoryConnections(v3);
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[AirPlayRemoteControlService] Starting AirPlay remote control service",  v10,  2u);
        }

        off_1003F7210(self);
      }
    }
  }

  if (!self->_systemMusicContext)
  {
    id v6 = -[objc_class sharedAudioPresentationOutputContext](off_1003F7148(), "sharedAudioPresentationOutputContext");
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v7 setCommunicationChannelDelegate:self];
    systemMusicContext = self->_systemMusicContext;
    self->_systemMusicContext = (AVOutputContext *)v7;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  [v9 registerCommunicationsChannels];

  self->_started = 1;
}

- (void)stop
{
  if (MRSupportsMediaControlReceiver(self, a2))
  {
    if (qword_1003FDF00 != -1) {
      dispatch_once(&qword_1003FDF00, &stru_1003A06B8);
    }
    if (qword_1003FDF08)
    {
      objc_super v3 = dlsym((void *)qword_1003FDF08, "APReceiverMediaRemoteXPCClient_SetDelegate");
      if (v3)
      {
        uint64_t v4 = MRLogCategoryConnections(v3);
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v6 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[AirPlayRemoteControlService] Stopping AirPlay remote control service",  v6,  2u);
        }

        off_1003F7210(0LL);
      }
    }
  }

  -[AVOutputContext setCommunicationChannelDelegate:]( self->_systemMusicContext,  "setCommunicationChannelDelegate:",  0LL);
  self->_started = 0;
}

- (void)startContext:(id)a3
{
}

- (void)outputContext:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EF8E4;
  v15[3] = &unk_100399880;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(workerQueue, v15);
}

- (void)outputContext:(id)a3 didCloseCommunicationChannel:(id)a4
{
  id v5 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EFA2C;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workerQueue, v8);
}

- (void)didReceiveData:(id)a3 fromCommunicationChannel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EFB28;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, block);
}

- (void)didCloseCommunicationChannel:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EFC4C;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

- (void)_didReceiveData:(id)a3 fromCommunicationChannel:(id)a4 connectionFactory:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  id v9 = (uint64_t (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  if (self->_started)
  {
    id v10 = self;
    objc_sync_enter(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v10->_connections, "objectForKey:", v8));
    if (v11 || (v13 = v9[2](v9), (id v12 = (void *)objc_claimAutoreleasedReturnValue(v13)) == 0LL))
    {
      objc_sync_exit(v10);
      id v12 = v11;
    }

    else
    {
      -[NSMapTable setObject:forKey:](v10->_connections, "setObject:forKey:", v12, v8);
      objc_sync_exit(v10);

      id v14 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRProtocolMessage protocolMessageWithProtobufData:error:]( &OBJC_CLASS___MRProtocolMessage,  "protocolMessageWithProtobufData:error:",  v35,  0LL));
      id v16 = v15;
      if (v15 && [v15 type] == (id)133)
      {
        id v17 = v16;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceType]);
        v34 = v18;
        if ([v18 isEqualToString:@"RemoteControl"])
        {
          unsigned int v19 = 0;
          uint64_t v20 = 0LL;
        }

        else
        {
          unsigned int v19 = [v18 isEqualToString:@"MRRelay"];
          uint64_t v20 = v19;
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue([v17 destinationGroupUID]);
        [v12 setDestinationGroupUID:v22];

        v23 = (void *)objc_claimAutoreleasedReturnValue([v17 destinationOutputDeviceUID]);
        [v12 setDestinationOutputDeviceUID:v23];

        v24 = (void *)objc_claimAutoreleasedReturnValue([v17 sourceOutputDeviceUID]);
        -[MRDeviceInfo setDeviceUID:](v14, "setDeviceUID:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue([v17 sourceOutputDeviceName]);
        -[MRDeviceInfo setName:](v14, "setName:", v25);

        uint64_t v33 = v20;
        if (v20) {
          v26 = @"MRRelay";
        }
        else {
          v26 = @"RemoteControl";
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRProtocolMessageLogger sharedLogger](&OBJC_CLASS___MRProtocolMessageLogger, "sharedLogger"));
        [v27 logMessage:@"Message Received:" label:v26 deviceInfo:v14 protocolMessage:v17];

        if (v19)
        {
          id v28 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessage);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v17 replyIdentifier]);
          [v28 setReplyIdentifier:v29];

          v30 = (void *)objc_claimAutoreleasedReturnValue([v28 protobufData]);
          [v12 sendTransportData:v30 options:0];

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MRProtocolMessageLogger sharedLogger](&OBJC_CLASS___MRProtocolMessageLogger, "sharedLogger"));
          [v31 logMessage:@"Message Sent:" label:v26 deviceInfo:v14 protocolMessage:v28];
        }

        v32 = -[MRExternalDeviceTransportConnectionHandle initWithConnection:deviceInfo:]( objc_alloc(&OBJC_CLASS___MRExternalDeviceTransportConnectionHandle),  "initWithConnection:deviceInfo:",  v12,  v14);
        -[MRDAirPlayRemoteControlService _handleNewConnection:forServiceType:]( v10,  "_handleNewConnection:forServiceType:",  v32,  v33);

        goto LABEL_5;
      }

      v21 = -[MRExternalDeviceTransportConnectionHandle initWithConnection:deviceInfo:]( objc_alloc(&OBJC_CLASS___MRExternalDeviceTransportConnectionHandle),  "initWithConnection:deviceInfo:",  v12,  v14);
      -[MRDAirPlayRemoteControlService _handleNewConnection:forServiceType:]( v10,  "_handleNewConnection:forServiceType:",  v21,  0LL);

      id v10 = (MRDAirPlayRemoteControlService *)v14;
      uint64_t v11 = v12;
    }

    [v11 ingestData:v35];
LABEL_5:
  }
}

- (void)_didCloseCommunicationChannel:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v7->_connections, "objectForKey:", v9));
  objc_sync_exit(v7);

  [v8 closeWithError:v6];
}

- (void)_handleNewConnection:(id)a3 forServiceType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v9 = v6;
    -[MRDMRRelayConnectionManager ingestConnection:](self->_mrRelayConnectionManager, "ingestConnection:", v6);
    goto LABEL_5;
  }

  if (!a4)
  {
    id v9 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 connection]);
    [WeakRetained airPlayRemoteControlService:self didAcceptConnection:v8];

LABEL_5:
    id v6 = v9;
  }
}

- (MRDAirPlayRemoteControlServiceDelegate)delegate
{
  return (MRDAirPlayRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end