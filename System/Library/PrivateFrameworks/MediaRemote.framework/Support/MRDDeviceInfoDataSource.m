@interface MRDDeviceInfoDataSource
+ (id)_workerQueue;
- (CUPairingManager)pairingManager;
- (MRDAirPlayLeaderInfoPublisher)airPlayLeaderInfoPublisher;
- (MRDDeviceInfoDataSource)init;
- (MRDDeviceInfoDataSourceDelegate)delegate;
- (MRDeviceInfo)deviceInfo;
- (NSString)deviceName;
- (NSString)deviceUID;
- (id)_currentDeviceInfo;
- (id)_deviceInfoArchiveClasses;
- (id)_deviceInfoFilePath;
- (id)_readDeviceInfo;
- (id)_readLegacyDeviceInfoIdentifier;
- (id)allClusteredDevices;
- (id)clusteredDevices;
- (id)discoverySession;
- (id)networkIdentifier;
- (void)_deviceInfoDidChange;
- (void)_deviceInfoDidChangeWithDeviceInfo:(id)a3;
- (void)_otherDeviceInfoDidChange:(id)a3;
- (void)_writeDeviceInfo:(id)a3 toPath:(id)a4;
- (void)dealloc;
- (void)handleGroupSessionDidStartEligibilityMonitoringNotification:(id)a3;
- (void)handleGroupSessionServerDidStartNotification:(id)a3;
- (void)reloadDeviceInfoImmediately;
- (void)setAirPlayLeaderInfoPublisher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setPairingManager:(id)a3;
@end

@implementation MRDDeviceInfoDataSource

- (MRDDeviceInfoDataSource)init
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___MRDDeviceInfoDataSource;
  v2 = -[MRDDeviceInfoDataSource init](&v55, "init");
  if (v2)
  {
    v3 = (CUPairingManager *)objc_alloc_init((Class)MSVWeakLinkClass(@"CUPairingManager", @"CoreUtils"));
    pairingManager = v2->_pairingManager;
    v2->_pairingManager = v3;

    id v5 = [(id)objc_opt_class(v2) _workerQueue];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[CUPairingManager setDispatchQueue:](v2->_pairingManager, "setDispatchQueue:", v6);

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource _currentDeviceInfo](v2, "_currentDeviceInfo"));
    deviceInfo = v2->_deviceInfo;
    v2->_deviceInfo = (MRDeviceInfo *)v7;

    objc_initWeak(&location, v2);
    v56 = @"UserAssignedDeviceName";
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
    v9 = &_dispatch_main_q;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1000968A0;
    v52[3] = &unk_10039E040;
    v31 = &v53;
    objc_copyWeak(&v53, &location);
    v2->_gestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates(v32, 0LL, &_dispatch_main_q, v52);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v10 addObserver:v2];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
    [v11 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextOutputDevicesDidChangeNotification object:v33];
    [v11 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextOutputDeviceDidChangeNotification object:v33];
    [v11 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidChangeNotification object:0];
    [v11 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidAddOutputDeviceNotification object:0];
    [v11 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidRemoveOutputDeviceNotification object:0];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100096910;
    handler[3] = &unk_10039E068;
    v30 = &v51;
    objc_copyWeak(&v51, &location);
    notify_register_dispatch( "com.apple.airplay.prefsChanged",  &v2->_airplayPerfsNotifyToken,  &_dispatch_main_q,  handler);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10009693C;
    v48[3] = &unk_10039E068;
    v28 = &v49;
    objc_copyWeak(&v49, &location);
    notify_register_dispatch( "com.apple.airplay.advertisingDidChange",  &v2->_airplayAdvertisingNotifyToken,  &_dispatch_main_q,  v48);

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_100096968;
    v46[3] = &unk_10039E068;
    v29 = &v47;
    objc_copyWeak(&v47, &location);
    notify_register_dispatch( "com.apple.airplay.mrInfoDidChange",  &v2->_airplayLeaderInfoNotifyToken,  &_dispatch_main_q,  v46);

    if (+[MRAVClusterController canBeClusterMember]( &OBJC_CLASS___MRAVClusterController,  "canBeClusterMember"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
      [v12 registerObserver:v2];

      [v11 addObserver:v2 selector:"_otherDeviceInfoDidChange:" name:_MRDeviceInfoDidChangeNotification object:0];
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100096994;
    v44[3] = &unk_10039E090;
    v26 = &v45;
    objc_copyWeak(&v45, &location);
    -[CUPairingManager setIdentityCreatedHandler:](v2->_pairingManager, "setIdentityCreatedHandler:", v44);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100096A10;
    v42[3] = &unk_10039E0B8;
    objc_copyWeak(&v43, &location);
    if (MSVDeviceIsAudioAccessory( -[CUPairingManager setIdentityDeletedHandler:]( v2->_pairingManager,  "setIdentityDeletedHandler:",  v42)))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  &v45,  &v49,  &v47,  &v51,  &v53));
      [v13 addObserver:v2 selector:"handleGroupSessionServerDidStartNotification:" name:@"MRDGroupSessionServerDidStartNotification" object:0];

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 addObserver:v2 selector:"handleGroupSessionDidStartEligibilityMonitoringNotification:" name:@"MRDGroupSessionServerDidStartEligibilityMonitoringNotification" object:0];

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v15 addObserver:v2 selector:"handleGroupSessionServerDidStopNotification:" name:@"MRDGroupSessionServerDidStopNotification" object:0];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v26));
    [v16 addObserver:v2 selector:"handleSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100096A80;
    v39[3] = &unk_10039E0E0;
    objc_copyWeak(&v41, &location);
    v18 = v2;
    v40 = v18;
    id v19 =  [v17 addObserverForName:@"MRDRoutingServerAirplayActiveDidChange" object:0 queue:0 usingBlock:v39];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100096B20;
    v36[3] = &unk_10039E0E0;
    objc_copyWeak(&v38, &location);
    v21 = v18;
    v37 = v21;
    id v22 =  [v20 addObserverForName:@"MRDNowPlayingAirplaySessionStarted" object:0 queue:0 usingBlock:v36];

    id v23 = [(id)objc_opt_class(v21) _workerQueue];
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100096BC0;
    block[3] = &unk_100399250;
    v35 = v21;
    dispatch_async(v24, block);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak(v27);
    objc_destroyWeak(v29);
    objc_destroyWeak(v28);
    objc_destroyWeak(v30);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];
  notify_cancel(self->_airplayPerfsNotifyToken);
  notify_cancel(self->_airplayAdvertisingNotifyToken);
  notify_cancel(self->_airplayLeaderInfoNotifyToken);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDDeviceInfoDataSource;
  -[MRDDeviceInfoDataSource dealloc](&v5, "dealloc");
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)reloadDeviceInfoImmediately
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource _currentDeviceInfo](self, "_currentDeviceInfo"));
  v3 = self;
  objc_sync_enter(v3);
  -[MRDDeviceInfoDataSource _deviceInfoDidChangeWithDeviceInfo:](v3, "_deviceInfoDidChangeWithDeviceInfo:", v4);
  objc_sync_exit(v3);
}

+ (id)_workerQueue
{
  if (qword_1003FDDB0 != -1) {
    dispatch_once(&qword_1003FDDB0, &stru_10039E100);
  }
  return (id)qword_1003FDDA8;
}

- (void)_deviceInfoDidChange
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deviceInfoReloadScheduled)
  {
    v2->_deviceInfoReloadScheduled = 1;
    dispatch_time_t v3 = dispatch_time(0LL, 100000000LL);
    id v4 = [(id)objc_opt_class(v2) _workerQueue];
    objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100096F2C;
    block[3] = &unk_100399250;
    void block[4] = v2;
    dispatch_after(v3, v5, block);
  }

  objc_sync_exit(v2);
}

- (void)_deviceInfoDidChangeWithDeviceInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (([v5 isEqual:v6->_deviceInfo] & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_deviceInfo, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "deviceInfoDataSource:deviceInfoDidChange:") & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100097078;
      block[3] = &unk_100398F40;
      id v9 = WeakRetained;
      v10 = v6;
      id v11 = v5;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  objc_sync_exit(v6);
}

- (void)_otherDeviceInfoDidChange:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clusterLeaderUID]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
    id v7 = [v6 clusterStatus];

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMRPairedDeviceUserInfoKey]);

      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceUID]);
      unsigned int v11 = [v10 isEqualToString:v5];

      if (v11)
      {
        v12 = self;
        objc_sync_enter(v12);
        unsigned int v13 = -[MRDeviceInfo isProxyGroupPlayer](v12->_deviceInfo, "isProxyGroupPlayer");
        objc_sync_exit(v12);
      }
    }
  }
}

- (id)_currentDeviceInfo
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  v115 = (void *)v5;
  v6 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"CurrentDeviceInfo",  v5);
  uint64_t v8 = _MRLogForCategory(10LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v127 = (const __CFString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource deviceName](self, "deviceName"));
  -[MRDeviceInfo setName:](v11, "setName:", v12);

  unsigned int v13 = (void *)MSVCopyLocalizedModelName();
  -[MRDeviceInfo setLocalizedModelName:](v11, "setLocalizedModelName:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource networkIdentifier](self, "networkIdentifier"));
  -[MRDeviceInfo setManagedConfigurationDeviceIdentifier:](v11, "setManagedConfigurationDeviceIdentifier:", v14);

  v15 = (void *)MSVCopySystemBuildVersion();
  -[MRDeviceInfo setBuildVersion:](v11, "setBuildVersion:", v15);

  -[MRDeviceInfo setProtocolVersion:]( v11,  "setProtocolVersion:",  +[MRProtocolMessage currentProtocolVersion](&OBJC_CLASS___MRProtocolMessage, "currentProtocolVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v17 = [v16 effectiveBoolValueForSetting:MCFeatureRemoteAppPairingAllowed];

  -[MRDeviceInfo setPairingAllowed:](v11, "setPairingAllowed:", v17 != 2);
  v18 = (void *)MGCopyAnswer(@"ProductType", 0LL);
  -[MRDeviceInfo setModelID:](v11, "setModelID:", v18);

  id v19 = (void *)MGCopyAnswer(@"ComputerName", 0LL);
  -[MRDeviceInfo setComputerName:](v11, "setComputerName:", v19);

  v20 = (void *)MRMediaRemoteCopyLocalAirPlayReceiverTightSyncIdentity( -[MRDeviceInfo setDeviceClass:]( v11,  "setDeviceClass:",  +[MRDeviceInfo deviceClass](&OBJC_CLASS___MRDeviceInfo, "deviceClass")));
  -[MRDeviceInfo setTightSyncUID:](v11, "setTightSyncUID:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  unsigned int v22 = [v21 needsCommandRedirection];

  p_vtable = &OBJC_METACLASS___MRDPauseOutputDevicesRequestReport.vtable;
  v116 = (void *)v3;
  v117 = self;
  if (!v22)
  {
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v25 routingServer]);
    -[MRDeviceInfo setProxyGroupPlayer:](v11, "setProxyGroupPlayer:", [v31 isSilentPrimary]);
    goto LABEL_7;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  id v25 = (id)objc_claimAutoreleasedReturnValue([v24 clusterLeaderUID]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 nowPlayingServer]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 originClients]);
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472LL;
    v124[2] = sub_100097EF4;
    v124[3] = &unk_10039A7D0;
    id v25 = v25;
    id v125 = v25;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "msv_firstWhere:", v124));

    p_vtable = (void **)(&OBJC_METACLASS___MRDPauseOutputDevicesRequestReport + 24);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 deviceInfo]);
    -[MRDeviceInfo setProxyGroupPlayer:](v11, "setProxyGroupPlayer:", [v30 isProxyGroupPlayer]);

    self = v117;
    v31 = v125;
LABEL_7:
  }

  v32 = (void *)MRMediaRemoteCopyLocalAirPlaySenderDefaultGroupIdentity();
  -[MRDeviceInfo setSenderDefaultGroupUID:](v11, "setSenderDefaultGroupUID:", v32);

  v33 = (void *)MRMediaRemoteCopyLocalAirPlayGroupName();
  -[MRDeviceInfo setGroupName:](v11, "setGroupName:", v33);

  -[MRDeviceInfo setGroupLeader:](v11, "setGroupLeader:", MRMediaRemoteAirPlayReceiverGetIsGroupLeader());
  v34 = (void *)objc_claimAutoreleasedReturnValue([p_vtable + 282 server]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 routingServer]);
  -[MRDeviceInfo setAirPlayActive:](v11, "setAirPlayActive:", [v35 airplayActive]);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource deviceUID](self, "deviceUID"));
  -[MRDeviceInfo setDeviceUID:](v11, "setDeviceUID:", v36);

  v37 = (void *)MRMediaRemoteCopyLocalClusterID();
  -[MRDeviceInfo setClusterID:](v11, "setClusterID:", v37);

  id v38 = (void *)MRMediaRemoteCopyLocalClusterLeaderIdentity();
  -[MRDeviceInfo setClusterLeaderID:](v11, "setClusterLeaderID:", v38);

  -[MRDeviceInfo setClusterType:](v11, "setClusterType:", MRMediaRemoteCopyLocalAirPlayReceiverClusterType());
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  -[MRDeviceInfo setClusterAware:](v11, "setClusterAware:", [v39 useClusterDevices]);

  id v40 = -[MRDeviceInfo setConfiguredClusterSize:]( v11,  "setConfiguredClusterSize:",  (int)MRMediaRemoteGetLocalClusterSize());
  -[MRDeviceInfo setClusterLeader:](v11, "setClusterLeader:", MRMediaRemoteIsClusterLeader(v40));
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 contextID]);
  -[MRDeviceInfo setRoutingContextID:](v11, "setRoutingContextID:", v41);

  v114 = v10;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v10 outputDevices]);
  id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v45 = v42;
  id v46 = [v45 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (!v46) {
    goto LABEL_28;
  }
  id v47 = v46;
  uint64_t v48 = *(void *)v121;
  do
  {
    for (i = 0LL; i != v47; i = (char *)i + 1)
    {
      if (*(void *)v121 != v48) {
        objc_enumerationMutation(v45);
      }
      v50 = *(__CFString **)(*((void *)&v120 + 1) + 8LL * (void)i);
      if (-[__CFString isLocalDevice](v50, "isLocalDevice"))
      {
        uint64_t v51 = objc_claimAutoreleasedReturnValue(-[MRDeviceInfo tightSyncUID](v11, "tightSyncUID"));
        v52 = (os_log_s *)v51;
        if (v51) {
          id v53 = (const __CFString *)v51;
        }
        else {
          id v53 = @"LOCAL";
        }
        -[NSMutableSet addObject:](v44, "addObject:", v53);
        goto LABEL_26;
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString logicalDeviceID](v50, "logicalDeviceID"));

      if (v54)
      {
        uint64_t v55 = objc_claimAutoreleasedReturnValue(-[__CFString logicalDeviceID](v50, "logicalDeviceID"));
        goto LABEL_22;
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uid](v50, "uid"));

      if (v57)
      {
        uint64_t v55 = objc_claimAutoreleasedReturnValue(-[__CFString uid](v50, "uid"));
LABEL_22:
        v52 = (os_log_s *)v55;
        if (v55)
        {
          v58 = -[MRDeviceInfo initWithOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDeviceInfo),  "initWithOutputDevice:",  v50);
          -[NSMutableArray addObject:](v43, "addObject:", v58);
          -[NSMutableSet addObject:](v44, "addObject:", v52);

          goto LABEL_26;
        }
      }

      uint64_t v59 = _MRLogForCategory(0LL, v56);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v127 = v50;
        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "unable to get an output device identifier, device will not be added to protobuf's grouped devices: %{public}@",  buf,  0xCu);
      }

- (id)discoverySession
{
  if (qword_1003FDDC0 != -1) {
    dispatch_once(&qword_1003FDDC0, &stru_10039E160);
  }
  return (id)qword_1003FDDB8;
}

- (id)clusteredDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource discoverySession](self, "discoverySession"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 availableOutputDevices]);
  id v4 = (NSMutableArray *)[v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v4; i = (NSMutableArray *)((char *)i + 1))
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v7 isLocalDevice])
        {
          id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clusterCompositionMembers", 0));
          id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v16;
            do
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v16 != v11) {
                  objc_enumerationMutation(v8);
                }
                unsigned int v13 = -[MRDeviceInfo initWithOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDeviceInfo),  "initWithOutputDevice:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)j));
                -[NSMutableArray addObject:](v4, "addObject:", v13);
              }

              id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }

            while (v10);
          }

          goto LABEL_18;
        }
      }

      id v4 = (NSMutableArray *)[v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)allClusteredDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource discoverySession](self, "discoverySession"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 availableOutputDevices]);
  id v4 = (NSMutableArray *)[v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v4; i = (NSMutableArray *)((char *)i + 1))
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v7 isLocalDevice])
        {
          id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allClusterMembersOutputDevices", 0));
          id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v16;
            do
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v16 != v11) {
                  objc_enumerationMutation(v8);
                }
                unsigned int v13 = -[MRDeviceInfo initWithOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDeviceInfo),  "initWithOutputDevice:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)j));
                -[NSMutableArray addObject:](v4, "addObject:", v13);
              }

              id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }

            while (v10);
          }

          goto LABEL_18;
        }
      }

      id v4 = (NSMutableArray *)[v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)networkIdentifier
{
  else {
    v2 = 0LL;
  }
  if (![v2 length])
  {
    id v3 = (void *)MGCopyAnswer(@"WifiAddressData", 0LL);
    if (v3) {
      id v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
    }
    else {
      id v4 = 0LL;
    }

    v2 = v4;
  }

  if (![v2 length])
  {
    uint64_t v5 = MGCopyAnswer(@"WifiAddress", 0LL);

    v2 = (void *)v5;
  }

  if (![v2 length])
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unknown device network ID", v10, 2u);
    }
  }

  return v2;
}

- (NSString)deviceUID
{
  deviceUID = self->_deviceUID;
  if (!deviceUID)
  {
    id v4 = (NSString *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity(0LL, a2);
    uint64_t v5 = self->_deviceUID;
    self->_deviceUID = v4;

    deviceUID = self->_deviceUID;
  }

  return deviceUID;
}

- (NSString)deviceName
{
  deviceName = self->_deviceName;
  if (!deviceName)
  {
    uint64_t v4 = MRCopyDeviceName(0LL, a2);
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = self->_deviceName;
    self->_deviceName = v5;

    deviceName = self->_deviceName;
  }

  return deviceName;
}

- (id)_deviceInfoFilePath
{
  v2 = (void *)MRCopyMediaRemoteLibraryDirectory(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"DeviceInfo.plist"]);

  return v3;
}

- (id)_deviceInfoArchiveClasses
{
  v5[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v5[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)_readLegacyDeviceInfoIdentifier
{
  v2 = (void *)MRCopyDeviceInfoPath(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v2));
  if (v3)
  {
    uint64_t v7 = 0LL;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSString),  v3,  &v7);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_writeDeviceInfo:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v16 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v16));
  id v8 = v16;
  if (v8)
  {
    uint64_t v9 = _MRLogForCategory(0LL, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to archive device info", buf, 2u);
    }
  }

  uint64_t v14 = 0LL;
  [v6 writeToFile:v5 options:268435457 error:&v14];
  if (v14)
  {
    uint64_t v12 = _MRLogForCategory(0LL, v11);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to write device info file", buf, 2u);
    }
  }
}

- (id)_readDeviceInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100098898;
  block[3] = &unk_100399250;
  void block[4] = self;
  if (qword_1003FDDD0 != -1) {
    dispatch_once(&qword_1003FDDD0, block);
  }
  return (id)qword_1003FDDC8;
}

- (void)handleGroupSessionServerDidStartNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 groupSessionServer]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionManager]);
  [v5 addObserver:self];
  -[MRDDeviceInfoDataSource _deviceInfoDidChange](self, "_deviceInfoDidChange");
}

- (void)handleGroupSessionDidStartEligibilityMonitoringNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 groupSessionServer]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 eligibilityMonitor]);
  [v5 addObserver:self];

  -[MRDDeviceInfoDataSource _deviceInfoDidChange](self, "_deviceInfoDidChange");
}

- (MRDDeviceInfoDataSourceDelegate)delegate
{
  return (MRDDeviceInfoDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDAirPlayLeaderInfoPublisher)airPlayLeaderInfoPublisher
{
  return self->_airPlayLeaderInfoPublisher;
}

- (void)setAirPlayLeaderInfoPublisher:(id)a3
{
}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void)setDeviceUID:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end