@interface IDSDXPCDaemonServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSDXPCDaemonServer)initWithServiceName:(id)a3 queue:(id)a4;
- (IDSDXPCOffGridMessenger)offGridMessengerCollaborator;
- (IDSDXPCOffGridStateManager)offGridStateManagerCollaborator;
- (IDSDXPCPairedDeviceManager)pairedDeviceManagerCollaborator;
- (IDSDXPCPairing)pairingCollaborator;
- (NSMutableArray)daemonClients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpcQueue;
- (id)activityMonitorCollaboratorForXPCDaemon:(id)a3;
- (id)baaSignerCollaboratorForTopic:(id)a3 forXPCDaemon:(id)a4;
- (id)eventReportingCollaboratorForXPCDaemon:(id)a3;
- (id)featureTogglerCollaboratorForService:(id)a3 forXPCDaemon:(id)a4;
- (id)firewallCollaboratorForService:(id)a3 forXPCDaemon:(id)a4;
- (id)groupSessionKeyValueDeliveryProviderCollaboratorForXPCDaemon:(id)a3;
- (id)internalTestingCollaboratorForXPCDaemon:(id)a3;
- (id)keyTransparencyCollaboratorForXPCDaemon:(id)a3;
- (id)offGridMessengerCollaboratorForXPCDaemon:(id)a3;
- (id)offGridStateManagerCollaboratorForXPCDaemon:(id)a3;
- (id)opportunisticCollaboratorForXPCDaemon:(id)a3;
- (id)pairedDeviceManagerCollaboratorForXPCDaemon:(id)a3;
- (id)pairingCollaboratorForXPCDaemon:(id)a3;
- (id)pinnedIdentityCollaboratorForXPCDaemon:(id)a3;
- (id)registrationCollaboratorForXPCDaemon:(id)a3;
- (id)reunionSyncCollaboratorWithClientProcessName:(id)a3 forXPCDaemon:(id)a4;
- (id)serverMessagingCollaboratorForXPCDaemon:(id)a3;
- (void)reportDailyMetric;
- (void)setDaemonClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setOffGridMessengerCollaborator:(id)a3;
- (void)setOffGridStateManagerCollaborator:(id)a3;
- (void)setPairedDeviceManagerCollaborator:(id)a3;
- (void)setPairingCollaborator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation IDSDXPCDaemonServer

- (IDSDXPCDaemonServer)initWithServiceName:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  dispatch_assert_queue_V2(v7);
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___IDSDXPCDaemonServer;
  v8 = -[IDSDXPCDaemonServer init](&v44, "init");
  if (v8)
  {
    id obj = a4;
    int v9 = _os_feature_enabled_impl("IDS", "SyncNSXPCSupport");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog xpc](&OBJC_CLASS___IDSFoundationLog, "xpc"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"NO";
      if (v9) {
        v11 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      id v46 = v6;
      __int16 v47 = 2112;
      v48 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Created IDSDXPCDaemonServer {serviceName: %{public}@, syncSupport: %@}",  buf,  0x16u);
    }

    id v43 = v6;

    v12 = objc_alloc(&OBJC_CLASS___IDSDXPCPairing);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSQuickSwitchHelper sharedInstance](&OBJC_CLASS___IDSQuickSwitchHelper, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    int v41 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    v20 = -[IDSDXPCPairing initWithQueue:idsDaemon:serviceController:pairingManager:quickSwitchHelper:accountController:utunController:utunDeliveryController:]( v12,  "initWithQueue:idsDaemon:serviceController:pairingManager:quickSwitchHelper:accountController:utunController: utunDeliveryController:",  v7,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    pairingCollaborator = v8->_pairingCollaborator;
    v8->_pairingCollaborator = v20;

    v22 = objc_alloc(&OBJC_CLASS___IDSDXPCPairedDeviceManager);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    v24 = -[IDSDXPCPairedDeviceManager initWithPairingManager:](v22, "initWithPairingManager:", v23);
    pairedDeviceManagerCollaborator = v8->_pairedDeviceManagerCollaborator;
    v8->_pairedDeviceManagerCollaborator = v24;

    v26 = -[IDSDXPCOffGridMessenger initWithQueue:]( objc_alloc(&OBJC_CLASS___IDSDXPCOffGridMessenger),  "initWithQueue:",  v7);
    offGridMessengerCollaborator = v8->_offGridMessengerCollaborator;
    v8->_offGridMessengerCollaborator = v26;

    v28 = -[IDSDXPCOffGridStateManager initWithQueue:]( objc_alloc(&OBJC_CLASS___IDSDXPCOffGridStateManager),  "initWithQueue:",  v7);
    offGridStateManagerCollaborator = v8->_offGridStateManagerCollaborator;
    v8->_offGridStateManagerCollaborator = v28;

    objc_storeStrong((id *)&v8->_queue, obj);
    if (v41)
    {
      dispatch_queue_attr_t v30 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v31 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v30);
      dispatch_queue_t v32 = dispatch_queue_create("com.apple.identityservicesd-IDSDXPCDaemonServerXPC", v31);
      xpcQueue = v8->_xpcQueue;
      v8->_xpcQueue = (OS_dispatch_queue *)v32;
    }

    else
    {
      v34 = v7;
      v31 = (dispatch_queue_attr_s *)v8->_xpcQueue;
      v8->_xpcQueue = (OS_dispatch_queue *)v34;
    }

    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    daemonClients = v8->_daemonClients;
    v8->_daemonClients = v35;

    id v6 = v43;
    v37 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v43);
    listener = v8->_listener;
    v8->_listener = v37;

    -[NSXPCListener setDelegate:](v8->_listener, "setDelegate:", v8);
    -[NSXPCListener _setQueue:](v8->_listener, "_setQueue:", v8->_xpcQueue);
    -[NSXPCListener resume](v8->_listener, "resume");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v39 addObserver:v8 selector:"reportDailyMetric" name:@"com.apple.ids.daemonDailyMetricNotification" object:0];
  }

  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer xpcQueue](self, "xpcQueue"));
  dispatch_assert_queue_V2(v8);

  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog xpc](&OBJC_CLASS___IDSFoundationLog, "xpc"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Incoming XPC connection {newConnection: %{public}@}",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10016C420;
  v20 = sub_10016C430;
  id v21 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10016C438;
  v16[3] = &unk_1008F7E80;
  v16[4] = self;
  v16[5] = &buf;
  [v7 setInvalidationHandler:v16];
  v10 = objc_alloc(&OBJC_CLASS___IDSDXPCDaemon);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer xpcQueue](self, "xpcQueue"));
  v12 = -[IDSDXPCDaemon initWithQueue:syncOntoMain:collaboratorProvider:takingOverAndResumingConnection:]( v10,  "initWithQueue:syncOntoMain:collaboratorProvider:takingOverAndResumingConnection:",  v11,  _os_feature_enabled_impl("IDS", "SyncNSXPCSupport"),  self,  v7);
  v13 = *(void **)(*((void *)&buf + 1) + 40LL);
  *(void *)(*((void *)&buf + 1) + 40LL) = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer daemonClients](self, "daemonClients"));
  [v14 addObject:*(void *)(*((void *)&buf + 1) + 40)];

  _Block_object_dispose(&buf, 8);
  return 1;
}

- (id)pairingCollaboratorForXPCDaemon:(id)a3
{
  return -[IDSDXPCDaemonServer pairingCollaborator](self, "pairingCollaborator", a3);
}

- (id)pairedDeviceManagerCollaboratorForXPCDaemon:(id)a3
{
  return -[IDSDXPCDaemonServer pairedDeviceManagerCollaborator](self, "pairedDeviceManagerCollaborator", a3);
}

- (id)reunionSyncCollaboratorWithClientProcessName:(id)a3 forXPCDaemon:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___IDSDXPCReunionSync);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientConnection]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDuetInterface sharedInstance](&OBJC_CLASS___IDSDuetInterface, "sharedInstance"));
  v11 = -[IDSDXPCReunionSync initWithConnection:clientProcessName:UTunDeliveryController:duetInterface:]( v7,  "initWithConnection:clientProcessName:UTunDeliveryController:duetInterface:",  v8,  v6,  v9,  v10);

  return v11;
}

- (id)opportunisticCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 opportunisticDeliveryController]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cache]);

  v8 = objc_alloc(&OBJC_CLASS___IDSDXPCOpportunistic);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v11 = -[IDSDXPCOpportunistic initWithQueue:connection:opportunisticCache:]( v8,  "initWithQueue:connection:opportunisticCache:",  v9,  v10,  v7);
  return v11;
}

- (id)registrationCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCRegistration);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = -[IDSDXPCRegistration initWithQueue:connection:](v5, "initWithQueue:connection:", v6, v7);
  return v8;
}

- (id)activityMonitorCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCActivityMonitor);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSActivityMonitorStateManager sharedInstance]( &OBJC_CLASS___IDSActivityMonitorStateManager,  "sharedInstance"));
  int v9 = -[IDSDXPCActivityMonitor initWithQueue:connection:activityMonitorStateManager:]( v5,  "initWithQueue:connection:activityMonitorStateManager:",  v6,  v7,  v8);

  return v9;
}

- (id)serverMessagingCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCServerMessaging);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( +[FTMessageDelivery APNSMessageDeliveryClass]( FTMessageDelivery,  "APNSMessageDeliveryClass"),  "sharedInstance"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
  v10 = -[IDSDXPCServerMessaging initWithQueue:connection:messageDelivery:pushHandler:]( v5,  "initWithQueue:connection:messageDelivery:pushHandler:",  v6,  v7,  v8,  v9);

  return v10;
}

- (id)offGridMessengerCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer offGridMessengerCollaborator](self, "offGridMessengerCollaborator"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  [v5 monitorConnection:v6];
  return -[IDSDXPCDaemonServer offGridMessengerCollaborator](self, "offGridMessengerCollaborator");
}

- (id)offGridStateManagerCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer offGridStateManagerCollaborator](self, "offGridStateManagerCollaborator"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  [v5 monitorConnection:v6];
  return -[IDSDXPCDaemonServer offGridStateManagerCollaborator](self, "offGridStateManagerCollaborator");
}

- (id)keyTransparencyCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCKeyTransparency);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = -[IDSDXPCKeyTransparency initWithQueue:connection:](v5, "initWithQueue:connection:", v6, v7);
  return v8;
}

- (id)pinnedIdentityCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCPinnedIdentity);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = -[IDSDXPCPinnedIdentity initWithQueue:connection:](v5, "initWithQueue:connection:", v6, v7);
  return v8;
}

- (id)firewallCollaboratorForService:(id)a3 forXPCDaemon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___IDSDXPCFirewall);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 clientConnection]);

  v11 = -[IDSDXPCFirewall initWithService:queue:connection:](v8, "initWithService:queue:connection:", v7, v9, v10);
  return v11;
}

- (id)groupSessionKeyValueDeliveryProviderCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCGroupSessionKeyValueDeliveryProvider);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = -[IDSDXPCGroupSessionKeyValueDeliveryProvider initWithQueue:connection:](v5, "initWithQueue:connection:", v6, v7);
  return v8;
}

- (id)featureTogglerCollaboratorForService:(id)a3 forXPCDaemon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___IDSDXPCFeatureToggler);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 clientConnection]);

  v11 = -[IDSDXPCFeatureToggler initWithService:queue:connection:](v8, "initWithService:queue:connection:", v7, v9, v10);
  return v11;
}

- (id)baaSignerCollaboratorForTopic:(id)a3 forXPCDaemon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___IDSDXPCBAASigner);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 clientConnection]);

  v11 = -[IDSDXPCBAASigner initWithTopic:queue:connection:](v8, "initWithTopic:queue:connection:", v7, v9, v10);
  return v11;
}

- (id)eventReportingCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCEventReporting);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);

  v8 = -[IDSDXPCEventReporting initWithQueue:connection:](v5, "initWithQueue:connection:", v6, v7);
  return v8;
}

- (id)internalTestingCollaboratorForXPCDaemon:(id)a3
{
  id v4 = a3;
  if (CUTIsInternalInstall())
  {
    id v5 = objc_alloc(&OBJC_CLASS___IDSDXPCInternalTesting);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer queue](self, "queue"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientConnection]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer offGridStateManagerCollaborator](self, "offGridStateManagerCollaborator"));
    int v9 = -[IDSDXPCInternalTesting initWithQueue:connection:offGridStateManager:]( v5,  "initWithQueue:connection:offGridStateManager:",  v6,  v7,  v8);
  }

  else
  {
    int v9 = 0LL;
  }

  return v9;
}

- (void)reportDailyMetric
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCDaemonServer offGridStateManagerCollaborator](self, "offGridStateManagerCollaborator"));
  [v2 fetchContactsOfType:3 phoneNumbersOnly:0 completion:&stru_1008FBEA8];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (NSMutableArray)daemonClients
{
  return self->_daemonClients;
}

- (void)setDaemonClients:(id)a3
{
}

- (IDSDXPCPairing)pairingCollaborator
{
  return self->_pairingCollaborator;
}

- (void)setPairingCollaborator:(id)a3
{
}

- (IDSDXPCPairedDeviceManager)pairedDeviceManagerCollaborator
{
  return self->_pairedDeviceManagerCollaborator;
}

- (void)setPairedDeviceManagerCollaborator:(id)a3
{
}

- (IDSDXPCOffGridMessenger)offGridMessengerCollaborator
{
  return self->_offGridMessengerCollaborator;
}

- (void)setOffGridMessengerCollaborator:(id)a3
{
}

- (IDSDXPCOffGridStateManager)offGridStateManagerCollaborator
{
  return self->_offGridStateManagerCollaborator;
}

- (void)setOffGridStateManagerCollaborator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end