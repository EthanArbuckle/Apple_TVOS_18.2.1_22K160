@interface SDActivityScanner
+ (id)sharedScanner;
- (BOOL)restart;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)shouldBoostScan;
- (BOOL)shouldScanForCopyPaste;
- (BOOL)shouldScanForHandoff;
- (SDActivityScanner)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (id)state;
- (os_state_data_s)dumpState;
- (void)_createOSTransactionIfNeeded;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)activityServiceDevicesChanged:(id)a3;
- (void)addObservers;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)consoleUserChanged:(id)a3;
- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6;
- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4;
- (void)continuityDidUpdateState:(id)a3;
- (void)didLosePeer:(id)a3;
- (void)didLosePeerTimer:(id)a3;
- (void)handleNewAdvertisementDevice:(id)a3 data:(id)a4 receivedViaScanning:(BOOL)a5 withSuccessHandler:(id)a6;
- (void)initializeStateCaptureBlock;
- (void)lostAllDevices;
- (void)nearbyServiceDevicesChanged:(id)a3;
- (void)removeObservers;
- (void)scanForTypes:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)systemHasPoweredOn:(id)a3;
- (void)systemWillSleep:(id)a3;
@end

@implementation SDActivityScanner

+ (id)sharedScanner
{
  if (qword_1006571A0 != -1) {
    dispatch_once(&qword_1006571A0, &stru_1005CED70);
  }
  return (id)qword_100657198;
}

- (SDActivityScanner)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDActivityScanner;
  v2 = -[SDActivityController init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v2->_monitor;
    v2->_monitor = (SDStatusMonitor *)v3;

    v2->_versionByte = sub_10008E3B0(@"BluetoothAdvertiseScanVersionByte", 0LL);
    v2->_scanTypes = 0LL;
    v2->_isScanning = 0;
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    deviceIdentifierToDeviceRecord = v2->_deviceIdentifierToDeviceRecord;
    v2->_deviceIdentifierToDeviceRecord = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    deviceIdentifierToLostDeviceTimers = v2->_deviceIdentifierToLostDeviceTimers;
    v2->_deviceIdentifierToLostDeviceTimers = v7;

    v9 = -[IDSContinuity initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___IDSContinuity),  "initWithDelegate:queue:",  v2,  &_dispatch_main_q);
    continuity = v2->_continuity;
    v2->_continuity = v9;

    -[SDActivityScanner initializeStateCaptureBlock](v2, "initializeStateCaptureBlock");
    -[SDActivityScanner addObservers](v2, "addObservers");
    v12.receiver = v2;
    v12.super_class = (Class)&OBJC_CLASS___SDActivityScanner;
    -[SDXPCDaemon _activate](&v12, "_activate");
  }

  return v2;
}

- (BOOL)shouldScanForHandoff
{
  return self->_scanTypes & 1;
}

- (BOOL)shouldScanForCopyPaste
{
  return (LOBYTE(self->_scanTypes) >> 1) & 1;
}

- (BOOL)shouldBoostScan
{
  return (LOBYTE(self->_scanTypes) >> 2) & 1;
}

- (void)start
{
  self->_scannerEnabled = 1;
  -[SDActivityScanner restart](self, "restart");
}

- (void)stop
{
  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0LL;

  self->_scannerEnabled = 0;
  -[SDActivityScanner restart](self, "restart");
}

- (BOOL)restart
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = -[SDActivityController shouldStart](v2, "shouldStart");
  unsigned int v4 = -[SDActivityScanner shouldScanForCopyPaste](v2, "shouldScanForCopyPaste");
  unsigned int v5 = -[SDActivityScanner shouldScanForHandoff](v2, "shouldScanForHandoff");
  if (!v2->_scannerEnabled
    || (-[IDSContinuity state](v2->_continuity, "state") == (id)3 ? (unsigned int v6 = v3) : (unsigned int v6 = 0),
        v6 == 1 ? (BOOL v7 = (v4 | v5) == 0) : (BOOL v7 = 1),
        v7))
  {
    if (v2->_isScanning) {
      v8 = @"Stopped";
    }
    else {
      v8 = @"Skipping request for";
    }
    v9 = v8;
    uint64_t v11 = handoff_log(v9, v10);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v2->_scannerEnabled) {
        objc_super v13 = @"YES";
      }
      else {
        objc_super v13 = @"NO";
      }
      if (((unint64_t)-[IDSContinuity state](v2->_continuity, "state") & 0x8000000000000000LL) != 0
        || (uint64_t)-[IDSContinuity state](v2->_continuity, "state") > 3)
      {
        v14 = "UnexpectedState";
      }

      else
      {
        v14 = off_1005CED90[(void)-[IDSContinuity state](v2->_continuity, "state")];
      }

      if (v3) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      *(_DWORD *)buf = 138413570;
      if (v4) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      if (v5) {
        v18 = @"YES";
      }
      else {
        v18 = @"NO";
      }
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      v56 = (uint64_t (*)(uint64_t, uint64_t))v14;
      *(_WORD *)v57 = 2112;
      *(void *)&v57[2] = v16;
      *(_WORD *)&v57[10] = 2112;
      *(void *)&v57[12] = v17;
      __int16 v58 = 2112;
      v59 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ enabled: %@, state: %s, shouldStart: %@, scanForCopyPaste: %@, scanForHandoff: %@",  buf,  0x3Eu);
    }

    if (v2->_isScanning)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v56 = sub_1001258BC;
      *(void *)v57 = sub_1001258CC;
      *(void *)&v57[8] = 0LL;
      *(void *)&v57[8] = v2->_scanningTransaction;
      -[IDSContinuity stopScanningForType:](v2->_continuity, "stopScanningForType:", 0LL);
      stopScanLostDeviceTimer = (dispatch_source_s *)v2->_stopScanLostDeviceTimer;
      if (!stopScanLostDeviceTimer)
      {
        v20 = &_dispatch_main_q;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_1001258D4;
        v50[3] = &unk_1005CB510;
        v50[4] = v2;
        v50[5] = buf;
        v21 = sub_100114598(0, &_dispatch_main_q, v50);
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
        v23 = v2->_stopScanLostDeviceTimer;
        v2->_stopScanLostDeviceTimer = (OS_dispatch_source *)v22;

        dispatch_resume((dispatch_object_t)v2->_stopScanLostDeviceTimer);
        stopScanLostDeviceTimer = (dispatch_source_s *)v2->_stopScanLostDeviceTimer;
      }

      dispatch_time_t v24 = sub_100114580(10.0);
      sub_100114638(stopScanLostDeviceTimer, v24);
      _Block_object_dispose(buf, 8);
    }

    BOOL v25 = 0;
  }

  else
  {
    -[SDActivityScanner _createOSTransactionIfNeeded](v2, "_createOSTransactionIfNeeded");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDActivityController allPeerBTIdentifiers](v2, "allPeerBTIdentifiers"));
    if (((v4 ^ 1 | v5) & 1) != 0)
    {
      id v15 = 0LL;
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 14LL));
      [v26 setLength:14];
      id v15 = v26;
      *(_BYTE *)[v15 mutableBytes] = 8;
    }

    unint64_t v27 = -[SDActivityScanner shouldBoostScan](v2, "shouldBoostScan");
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_deviceIdentifierToDeviceRecord, "allValues"));
    id v29 = [v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
    unsigned int v49 = v27;
    if (v29)
    {
      uint64_t v30 = *(void *)v52;
      while (2)
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v28);
          }
          if ([*(id *)(*((void *)&v51 + 1) + 8 * (void)i) deviceTracked])
          {
            LODWORD(v29) = 1;
            goto LABEL_49;
          }
        }

        id v29 = [v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v29) {
          continue;
        }
        break;
      }

- (void)_createOSTransactionIfNeeded
{
  if (!self->_scanningTransaction)
  {
    unsigned int v3 = (OS_os_transaction *)os_transaction_create("SDActivityScanner");
    scanningTransaction = self->_scanningTransaction;
    self->_scanningTransaction = v3;
  }

- (void)activityServiceDevicesChanged:(id)a3
{
  id v4 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        deviceIdentifierToDeviceRecord = self->_deviceIdentifierToDeviceRecord;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIDOverride", v19));
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( deviceIdentifierToDeviceRecord,  "objectForKeyedSubscript:",  v11));

        if (v12)
        {
          [v12 setIdsDevice:v9];
          if ([v12 deviceTracked])
          {
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472LL;
            v23[2] = sub_100125BF8;
            v23[3] = &unk_1005CEDB8;
            id v24 = v12;
            -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v23);
          }

          id v13 = sub_1000854EC(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v15 cachedDecryptionKeyForDeviceIdentifier:v16]);

            if (v17)
            {
              objc_msgSend(v14, "setValidKey:", objc_msgSend(v17, "isValidKey"));
              objc_msgSend(v14, "setKeyCounter:", objc_msgSend(v17, "lastUsedCounter"));
            }

            [v19 addObject:v14];
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v6);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100125C48;
  v21[3] = &unk_1005CEDB8;
  id v22 = v19;
  id v18 = v19;
  -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v21);
}

- (void)nearbyServiceDevicesChanged:(id)a3
{
  id v4 = a3;
  uint64_t v6 = handoff_log(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100127DD4(v4, v7);
  }

  if (!-[SDActivityController shouldStart](self, "shouldStart"))
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "isLocallyPaired", (void)v15)
            && ([v13 isNearby] & 1) == 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIDOverride]);
            -[SDActivityScanner didLosePeer:](self, "didLosePeer:", v14);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }
}

- (void)handleNewAdvertisementDevice:(id)a3 data:(id)a4 receivedViaScanning:(BOOL)a5 withSuccessHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
  uint64_t v14 = sub_1000852AC(v11);
  unsigned __int8 v16 = v14;
  if ((v14 & 1) != 0)
  {
    uint64_t v22 = handoff_log(v14, v15);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int versionByte = self->_versionByte;
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v13;
      __int16 v33 = 1024;
      int v34 = v16;
      __int16 v35 = 1024;
      int v36 = versionByte;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Saw IDS device %@ with mismatched version %d, expected %d",  buf,  0x18u);
    }
  }

  else
  {
    if (v7)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToLostDeviceTimers,  "objectForKeyedSubscript:",  v13));
      __int128 v18 = v17;
      if (v17) {
        [v17 invalidate];
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "didLosePeerTimer:",  v13,  0LL,  10.0));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceIdentifierToLostDeviceTimers,  "setObject:forKeyedSubscript:",  v19,  v13);
    }

    v20 = (SDActivityDeviceRecord *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDeviceRecord,  "objectForKeyedSubscript:",  v13));
    if (!v20)
    {
      v20 = -[SDActivityDeviceRecord initWithDevice:]( objc_alloc(&OBJC_CLASS___SDActivityDeviceRecord),  "initWithDevice:",  v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceIdentifierToDeviceRecord,  "setObject:forKeyedSubscript:",  v20,  v13);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100126048;
    v24[3] = &unk_1005CEDE0;
    __int128 v25 = v20;
    __int128 v26 = self;
    id v27 = v10;
    id v30 = v12;
    id v28 = v11;
    id v29 = v13;
    v21 = v20;
    -[os_log_s updateWithRawAdvertisementData:receivedViaScanning:newAdvertisementHandler:]( v21,  "updateWithRawAdvertisementData:receivedViaScanning:newAdvertisementHandler:",  v28,  v7,  v24);
  }
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.scanning";
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFContinuityScannerProtocol);
}

- (id)remoteObjectInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFContinuityScannerClient));
  [v2 setClass:objc_opt_class(SFActivityAdvertisement) forSelector:"receivedAdvertisement:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class(SFPeerDevice) forSelector:"foundDeviceWithDevice:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class(SFPeerDevice) forSelector:"lostDeviceWithDevice:" argumentIndex:0 ofReply:0];
  v6[0] = objc_opt_class(&OBJC_CLASS___NSSet);
  v6[1] = objc_opt_class(&OBJC_CLASS___SFPeerDevice);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  [v2 setClasses:v4 forSelector:"pairedDevicesChanged:" argumentIndex:0 ofReply:0];

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  uint64_t v4 = handoff_log(self, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100127F90();
  }

  if (!self->_scannerEnabled) {
    -[SDActivityScanner start](self, "start");
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIdentifierToDeviceRecord, "allValues"));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v11 deviceTracked])
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_100126618;
          v12[3] = &unk_1005CEDB8;
          v12[4] = v11;
          -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

- (void)connectionInvalidated:(id)a3
{
  uint64_t v4 = handoff_log(self, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100127FBC();
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  id v7 = [v6 count];

  if (!v7) {
    -[SDActivityScanner stop](self, "stop");
  }
}

- (void)initializeStateCaptureBlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10012674C;
  v2[3] = &unk_1005CC510;
  v2[4] = self;
  self->_stateHandle = os_state_add_handler(&_dispatch_main_q, v2);
}

- (os_state_data_s)dumpState
{
  uint64_t v3 = handoff_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  id v29 = 0LL;
  NSAppendPrintF(&v29, "\n");
  id v5 = v29;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDActivityScanner state](self, "state"));
  id v7 = (void *)v6;
  if (v6)
  {
    id v28 = v5;
    NSAppendPrintF(&v28, "%@\n", v6);
    id v8 = v28;

    id v5 = v8;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 state]);

  if (v10)
  {
    id v27 = v5;
    NSAppendPrintF(&v27, "%@\n", v10);
    id v11 = v27;

    id v5 = v11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 state]);

  if (v13)
  {
    id v26 = v5;
    NSAppendPrintF(&v26, "%@\n", v13);
    id v14 = v26;

    id v5 = v14;
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityPayloadManager sharedPayloadManager]( &OBJC_CLASS___SDActivityPayloadManager,  "sharedPayloadManager"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 state]);

  if (v16)
  {
    id v25 = v5;
    NSAppendPrintF(&v25, "%@\n", v16);
    id v17 = v25;

    id v5 = v17;
  }

  id v24 = v5;
  NSAppendPrintF(&v24, "Handoff State End\n");
  id v18 = v24;

  if (v18)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  200LL,  0LL,  0LL));
    id v20 = [v19 length];
    v21 = (os_state_data_s *)calloc(1uLL, (size_t)v20 + 200);
    uint64_t v22 = v21;
    if (v21)
    {
      v21->var0 = 1;
      v21->var1.var1 = v20;
      __strlcpy_chk(v21->var3, "Handoff State", 64LL, 64LL);
      id v19 = v19;
      memcpy(v22->var4, [v19 bytes], (size_t)v20);
    }
  }

  else
  {
    id v19 = 0LL;
    uint64_t v22 = 0LL;
  }

  return v22;
}

- (id)state
{
  id v26 = 0LL;
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v26, "%@\n", v5);
  id v6 = v26;

  id v25 = v6;
  NSAppendPrintF(&v25, "-------------\n");
  id v7 = v25;

  id v24 = v7;
  NSAppendPrintF(&v24, "Version Byte: %u\n", self->_versionByte);
  id v8 = v24;

  id v23 = v8;
  if (-[SDActivityController shouldStart](self, "shouldStart")) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  NSAppendPrintF(&v23, "Should Start: %@\n", v9);
  id v10 = v23;

  id v22 = v10;
  if (self->_isScanning) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  NSAppendPrintF(&v22, "Is Scanning: %@\n", v11);
  id v12 = v22;

  id v21 = v12;
  uint64_t v13 = SFActivityScanTypesToString(self->_scanTypes);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  NSAppendPrintF(&v21, "Scan Types: %@\n", v14);
  id v15 = v21;

  id v20 = v15;
  NSAppendPrintF(&v20, "Device Identifier To Lost Device Timer: %@\n", self->_deviceIdentifierToLostDeviceTimers);
  id v16 = v20;

  id v19 = v16;
  NSAppendPrintF(&v19, "Device Identifier To Device Record: %@\n", self->_deviceIdentifierToDeviceRecord);
  id v17 = v19;

  return v17;
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"systemHasPoweredOn:" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
  [v3 addObserver:self selector:"consoleUserChanged:" name:@"com.apple.sharingd.ConsoleUserChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)systemWillSleep:(id)a3
{
  uint64_t v4 = handoff_log(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = getuid();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopping for user %d on sleep", (uint8_t *)v6, 8u);
  }

  -[SDActivityScanner stop](self, "stop");
}

- (void)systemHasPoweredOn:(id)a3
{
  BOOL v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  if (v4)
  {
    uint64_t v6 = handoff_log(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting for user %d on wake", (uint8_t *)v8, 8u);
    }

    -[SDActivityScanner start](self, "start");
  }

- (void)consoleUserChanged:(id)a3
{
  BOOL v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  BOOL v5 = v4;
  uint64_t v7 = handoff_log(v4, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = 67109120;
      uid_t v11 = getuid();
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Starting for user %d on login",  (uint8_t *)&v10,  8u);
    }

    -[SDActivityScanner start](self, "start");
  }

  else
  {
    if (v9)
    {
      int v10 = 67109120;
      uid_t v11 = getuid();
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Stopping for user %d on logout",  (uint8_t *)&v10,  8u);
    }

    -[SDActivityScanner stop](self, "stop");
  }

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = a3;
  BOOL v5 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityScanner/continuityDidUpdateState",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v20.opaque[0] = 0LL;
  v20.opaque[1] = 0LL;
  os_activity_scope_enter(v5, &v20);
  uint64_t v8 = handoff_log(v6, v7);
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 3)
    {
      int v10 = "UnexpectedState";
    }

    else
    {
      int v10 = off_1005CED90[(void)[v4 state]];
    }

    *(_DWORD *)buf = 136315138;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did update state to %s", buf, 0xCu);
  }

  id v11 = [v4 state];
  switch((unint64_t)v11)
  {
    case 0uLL:
      uint64_t v13 = handoff_log(v11, v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100127FE8();
      }
      goto LABEL_18;
    case 1uLL:
      uint64_t v19 = handoff_log(v11, v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100056AFC();
      }
LABEL_18:

      break;
    case 2uLL:
      uint64_t v15 = handoff_log(v11, v12);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100056AA4();
      }

      -[SDActivityScanner lostAllDevices](self, "lostAllDevices");
      break;
    case 3uLL:
      uint64_t v17 = handoff_log(v11, v12);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100056A78();
      }

      -[SDActivityScanner restart](self, "restart");
      break;
    default:
      break;
  }

  os_activity_scope_leave(&v20);
}

- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityScanner/continuityDidStartScanningForType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0LL;
  v13.opaque[1] = 0LL;
  os_activity_scope_enter(v7, &v13);
  if (!a4) {
    self->_isScanning = 1;
  }
  uint64_t v10 = handoff_log(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100128020(a4, v11, v12);
  }

  os_activity_scope_leave(&v13);
}

- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityScanner/continuityDidStopScanningForType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0LL;
  v14.opaque[1] = 0LL;
  os_activity_scope_enter(v7, &v14);
  if (!a4) {
    self->_isScanning = 0;
  }
  uint64_t v10 = handoff_log(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1001280A8(a4, v11, v12);
  }

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0LL;

  os_activity_scope_leave(&v14);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityScanner/continuityDidFailToStartScanningForType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0LL;
  v18.opaque[1] = 0LL;
  os_activity_scope_enter(v10, &v18);
  if (!a4) {
    self->_isScanning = 0;
  }
  uint64_t v13 = handoff_log(v11, v12);
  os_activity_scope_state_s v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    else {
      uint64_t v15 = off_1005CEE00[a4];
    }
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100128130((uint64_t)v15, v16, buf, v14);
  }

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0LL;

  os_activity_scope_leave(&v18);
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v9 = a5;
  if (!a4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a6 UUIDString]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityController idsDeviceFromBTIdentifier:](self, "idsDeviceFromBTIdentifier:", v10));
    if (v12)
    {
      -[SDActivityScanner handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:]( self,  "handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:",  v12,  v9,  1LL,  0LL);
    }

    else
    {
      uint64_t v13 = handoff_log(0LL, v11);
      os_activity_scope_state_s v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100128194((uint64_t)v10, v14);
      }
    }
  }
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  uint64_t v6 = handoff_log(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lost IDS device %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDeviceRecord,  "objectForKeyedSubscript:",  v4));
  if ([v8 deviceTracked])
  {
    [v8 setDeviceTracked:0];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10012775C;
    v18[3] = &unk_1005CEDB8;
    id v19 = v8;
    -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v18);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIdentifierToDeviceRecord, "allValues", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    while (2)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) deviceTracked])
        {

          goto LABEL_15;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  -[SDActivityScanner restart](self, "restart");
LABEL_15:
}

- (void)lostAllDevices
{
  uint64_t v3 = handoff_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100128204();
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIdentifierToDeviceRecord, "allKeys", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToLostDeviceTimers,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9)));
        [v10 fire];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)didLosePeerTimer:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdentifierToLostDeviceTimers, "removeObjectForKey:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDeviceRecord,  "objectForKeyedSubscript:",  v5));
  [v4 setDisableDuplicateFilterOnce:1];
  -[SDActivityScanner didLosePeer:](self, "didLosePeer:", v5);
}

- (void)scanForTypes:(unint64_t)a3
{
  uint64_t v5 = handoff_log(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = SFActivityScanTypesToString(a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    __int128 v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "requested scanning for %@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100127A80;
  v9[3] = &unk_1005CC330;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(&_dispatch_main_q, v9);
}

- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100127B8C;
  block[3] = &unk_1005CEE28;
  id v19 = v11;
  id v20 = v12;
  id v22 = a7;
  int64_t v23 = a6;
  id v21 = v13;
  id v14 = v22;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
}

@end