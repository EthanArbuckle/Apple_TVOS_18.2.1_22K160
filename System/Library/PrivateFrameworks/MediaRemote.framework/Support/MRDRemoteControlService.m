@interface MRDRemoteControlService
- (BOOL)started;
- (MRDAirPlayRemoteControlService)airPlayService;
- (MRDBonjourRemoteControlService)genericNetworkService;
- (MRDBonjourRemoteControlService)televisionNetworkService;
- (MRDGroupSessionRemoteControlService)groupSessionService;
- (MRDIDSCompanionRemoteControlService)companionService;
- (MRDIDSRemoteControlService)idsService;
- (MRDMRRelayRemoteControlService)mrRelayRemoteControlService;
- (MRDRapportRemoteControlService)rapportService;
- (MRDRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDRemoteControlServiceDelegate)delegate;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)_notifyDelegateWithConnection:(id)a3;
- (id)idsCompanionRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (id)idsRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)_initializeIDSRemoteControlServiceWithRoutingDataSource:(id)a3;
- (void)airPlayRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)bonjourRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)groupSessionRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)mrRelayRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)rapportRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)reevaluateGroupSessionService;
- (void)setAirPlayService:(id)a3;
- (void)setCompanionService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGenericNetworkService:(id)a3;
- (void)setGroupSessionService:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setMrRelayRemoteControlService:(id)a3;
- (void)setRapportService:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTelevisionNetworkService:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDRemoteControlService

- (MRDRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___MRDRemoteControlService;
  v5 = -[MRDRemoteControlService init](&v38, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    if ([v6 shouldInitializeGenericBonjourService])
    {
      v7 = objc_alloc(&OBJC_CLASS___MRDBonjourRemoteControlService);
      v8 = -[MRDBonjourRemoteControlService initWithNetServiceType:]( v7,  "initWithNetServiceType:",  kMRExternalDeviceBonjourTypeGeneric);
      genericNetworkService = v5->_genericNetworkService;
      v5->_genericNetworkService = v8;

      -[MRDBonjourRemoteControlService setDelegate:](v5->_genericNetworkService, "setDelegate:", v5);
    }

    if ([v6 shouldInitializeTelevisionBonjourService])
    {
      v10 = objc_alloc(&OBJC_CLASS___MRDBonjourRemoteControlService);
      v11 = -[MRDBonjourRemoteControlService initWithNetServiceType:]( v10,  "initWithNetServiceType:",  kMRExternalDeviceBonjourTypeTelevision);
      televisionNetworkService = v5->_televisionNetworkService;
      v5->_televisionNetworkService = v11;

      -[MRDBonjourRemoteControlService setDelegate:](v5->_televisionNetworkService, "setDelegate:", v5);
    }

    v13 = objc_alloc_init(&OBJC_CLASS___MRDAirPlayRemoteControlService);
    airPlayService = v5->_airPlayService;
    v5->_airPlayService = v13;

    -[MRDAirPlayRemoteControlService setDelegate:](v5->_airPlayService, "setDelegate:", v5);
    if ([v6 shouldInitializeRapportService])
    {
      v15 = objc_alloc_init(&OBJC_CLASS___MRDRapportRemoteControlService);
      rapportService = v5->_rapportService;
      v5->_rapportService = v15;

      -[MRDRapportRemoteControlService setDelegate:](v5->_rapportService, "setDelegate:", v5);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v18 = [v17 supportNanoLinkAgent];

    if (v18)
    {
      v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472LL;
      v34 = sub_1000F3FA4;
      v35 = &unk_100398E60;
      v36 = v5;
      id v37 = v4;
      dispatch_async(&_dispatch_main_q, &v32);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserSettings currentSettings]( &OBJC_CLASS___MRUserSettings,  "currentSettings",  v32,  v33,  v34,  v35));
    unsigned int v20 = [v19 shouldInitializeIDSService];

    if (v20)
    {
      v21 = -[MRDIDSRemoteControlService initWithRoutingDataSource:]( objc_alloc(&OBJC_CLASS___MRDIDSRemoteControlService),  "initWithRoutingDataSource:",  v4);
      idsService = v5->_idsService;
      v5->_idsService = v21;

      -[MRDIDSRemoteControlService setDelegate:](v5->_idsService, "setDelegate:", v5);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v24 = [v23 shouldInitializeMRRelayService];

    if (v24)
    {
      v25 = objc_alloc_init(&OBJC_CLASS___MRDMRRelayRemoteControlService);
      mrRelayRemoteControlService = v5->_mrRelayRemoteControlService;
      v5->_mrRelayRemoteControlService = v25;

      -[MRDMRRelayRemoteControlService setDelegate:](v5->_mrRelayRemoteControlService, "setDelegate:", v5);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
    unsigned int v28 = [v27 supportGroupSession];

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v29 addObserver:v5 selector:"handleGroupSessionServerDidStartNotification:" name:@"MRDGroupSessionServerDidStartNotification" object:0];

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v30 addObserver:v5 selector:"handleGroupSessionServerDidStopNotification:" name:@"MRDGroupSessionServerDidStopNotification" object:0];

      -[MRDRemoteControlService reevaluateGroupSessionService](v5, "reevaluateGroupSessionService");
    }
  }

  return v5;
}

- (void)_initializeIDSRemoteControlServiceWithRoutingDataSource:(id)a3
{
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1000F4270;
  v30 = sub_1000F4280;
  id v31 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000F4288;
  v23[3] = &unk_100399DF8;
  v23[4] = self;
  id v3 = a3;
  id v24 = v3;
  v25 = &v26;
  id v4 = objc_retainBlock(v23);
  id v5 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  uint64_t v6 = NRPairedDeviceRegistryDeviceDidPairNotification;
  v7 = &_dispatch_main_q;
  id v8 = [v5 initWithTimeout:v6 reason:&_dispatch_main_q queue:0 handler:0.0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000F4318;
  v20[3] = &unk_1003A0790;
  id v10 = v8;
  id v21 = v10;
  v11 = v4;
  id v22 = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 addObserverForName:v6 object:0 queue:0 usingBlock:v20]);
  v13 = (void *)v27[5];
  v27[5] = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getActivePairedDevice]);

  if (v15 && [v10 disarm])
  {
    uint64_t v17 = _MRLogForCategory(0LL, v16);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlService] Found activePairedDevice <%@>, creating IDSRemoteControlService...",  buf,  0xCu);
    }

    v11[2](v11);
  }

  _Block_object_dispose(&v26, 8);
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(self->_airPlayService);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromObject(self->_companionService);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromObject(self->_rapportService);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromObject(self->_idsService);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = MRCreateIndentedDebugDescriptionFromObject(self->_mrRelayRemoteControlService);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@ %p {\n  AirPlayService = %@\n  CompanionService = %@\n  RapportService = %@\n  IDSService = %@\n  MRRelayService = %@\n}>",  v4,  self,  v6,  v8,  v10,  v12,  v14);

  return v15;
}

- (void)bonjourRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (void)airPlayRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (void)rapportRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (id)idsCompanionRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  return -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (id)idsRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  return -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (void)groupSessionRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (void)mrRelayRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = -[MRDRemoteControlService _notifyDelegateWithConnection:](self, "_notifyDelegateWithConnection:", a4);
}

- (void)start
{
  self->_started = 1;
  -[MRDBonjourRemoteControlService start](self->_genericNetworkService, "start");
  -[MRDBonjourRemoteControlService start](self->_televisionNetworkService, "start");
  -[MRDAirPlayRemoteControlService start](self->_airPlayService, "start");
  -[MRDRapportRemoteControlService start](self->_rapportService, "start");
  -[MRDIDSCompanionRemoteControlService start](self->_companionService, "start");
  -[MRDIDSRemoteControlService start](self->_idsService, "start");
  -[MRDMRRelayRemoteControlService start](self->_mrRelayRemoteControlService, "start");
}

- (void)stop
{
  self->_started = 0;
}

- (id)_notifyDelegateWithConnection:(id)a3
{
  uint64_t v4 = qword_1003FDF40;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1003FDF40, &stru_1003A07B0);
  }
  uint64_t v6 = objc_alloc(&OBJC_CLASS___MRDExternalDeviceServerClientConnection);
  uint64_t v7 = -[MRDExternalDeviceServerClientConnection initWithConnection:queue:]( v6,  "initWithConnection:queue:",  v5,  qword_1003FDF38);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);
  -[MRDExternalDeviceServerClientConnection setLabel:](v7, "setLabel:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationOutputDeviceUID]);
  -[MRDExternalDeviceServerClientConnection setDestinationOutputDeviceUID:](v7, "setDestinationOutputDeviceUID:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationGroupUID]);
  -[MRDExternalDeviceServerClientConnection setDestinationGroupUID:](v7, "setDestinationGroupUID:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 connectUserInfo]);
  -[MRDExternalDeviceServerClientConnection setConnectUserInfo:](v7, "setConnectUserInfo:", v11);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteControlService:self didAcceptClientConnection:v7];

  return v7;
}

- (void)reevaluateGroupSessionService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupSessionServer]);
  uint64_t v7 = (MRDGroupSessionRemoteControlService *)objc_claimAutoreleasedReturnValue([v4 sessionManager]);

  id v5 = v7;
  groupSessionService = self->_groupSessionService;
  if (!groupSessionService && v7)
  {
    id v5 = -[MRDGroupSessionRemoteControlService initWithGroupSessionManager:delegate:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionRemoteControlService),  "initWithGroupSessionManager:delegate:",  v7,  self);
    groupSessionService = self->_groupSessionService;
LABEL_6:
    self->_groupSessionService = v5;

    id v5 = v7;
    goto LABEL_7;
  }

  if (groupSessionService && !v7) {
    goto LABEL_6;
  }
LABEL_7:
}

- (MRDAirPlayRemoteControlService)airPlayService
{
  return self->_airPlayService;
}

- (void)setAirPlayService:(id)a3
{
}

- (MRDRemoteControlServiceDelegate)delegate
{
  return (MRDRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDBonjourRemoteControlService)genericNetworkService
{
  return self->_genericNetworkService;
}

- (void)setGenericNetworkService:(id)a3
{
}

- (MRDBonjourRemoteControlService)televisionNetworkService
{
  return self->_televisionNetworkService;
}

- (void)setTelevisionNetworkService:(id)a3
{
}

- (MRDRapportRemoteControlService)rapportService
{
  return self->_rapportService;
}

- (void)setRapportService:(id)a3
{
}

- (MRDIDSCompanionRemoteControlService)companionService
{
  return self->_companionService;
}

- (void)setCompanionService:(id)a3
{
}

- (MRDIDSRemoteControlService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (MRDGroupSessionRemoteControlService)groupSessionService
{
  return self->_groupSessionService;
}

- (void)setGroupSessionService:(id)a3
{
}

- (MRDMRRelayRemoteControlService)mrRelayRemoteControlService
{
  return self->_mrRelayRemoteControlService;
}

- (void)setMrRelayRemoteControlService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
}

@end