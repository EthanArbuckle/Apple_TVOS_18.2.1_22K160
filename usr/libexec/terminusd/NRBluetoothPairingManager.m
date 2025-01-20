@interface NRBluetoothPairingManager
+ (id)copySharedManager;
- (BOOL)busy;
- (BOOL)hasPairerForNRUUID:(id)a3;
- (BOOL)isPairing;
- (BOOL)isPeripheralRole;
- (BOOL)isUnpairing;
- (BOOL)pair;
- (BOOL)unpair;
- (CBCentralManager)centralManager;
- (CBPeripheralManager)peripheralManager;
- (NRBluetoothPairer)activePairer;
- (NRBluetoothPairingManager)init;
- (NSMutableArray)enqueuedPairers;
- (NSMutableSet)peripherals;
- (NSUUID)pairedPeerBluetoothUUID;
- (OS_dispatch_queue)queue;
- (unsigned)peripheralReconnectCounter;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)disconnectFromPeripherals;
- (void)disconnectPeripheral:(id)a3;
- (void)enqueuePairer:(id)a3;
- (void)handlePairingCompletionWithSuccess:(BOOL)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)removePairerForNRUUID:(id)a3;
- (void)reset;
- (void)resumeUnpairing;
- (void)setActivePairer:(id)a3;
- (void)setBusy:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setEnqueuedPairers:(id)a3;
- (void)setIsPairing:(BOOL)a3;
- (void)setIsPeripheralRole:(BOOL)a3;
- (void)setIsUnpairing:(BOOL)a3;
- (void)setPairedPeerBluetoothUUID:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setPeripheralReconnectCounter:(unsigned int)a3;
- (void)setPeripherals:(id)a3;
- (void)setQueue:(id)a3;
- (void)startNextPairer;
@end

@implementation NRBluetoothPairingManager

- (NRBluetoothPairingManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NRBluetoothPairingManager;
  v2 = -[NRBluetoothPairingManager init](&v19, "init");
  if (!v2)
  {
    id v10 = sub_100017EDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 16LL);

    if (IsLevelEnabled)
    {
      id v12 = sub_100017EDC();
      _NRLogWithArgs( v12,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBluetoothPairingManager init]"",  140);
    }

    uint64_t v13 = _os_log_pack_size(12LL);
    v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v15 = __error();
    uint64_t v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[NRBluetoothPairingManager init]";
    id v17 = sub_100017EDC();
    _NRLogAbortWithPack(v17, v14);
  }

  v3 = v2;
  if (_NRIsAppleInternal(v2))
  {
    v4 = sub_100146AFC();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    enqueuedPairers = v3->_enqueuedPairers;
    v3->_enqueuedPairers = v6;

    v8 = v3;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasPairerForNRUUID:(id)a3
{
  id v4 = a3;
  activePairer = self->_activePairer;
  if (activePairer
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairer nrUUID](activePairer, "nrUUID")),
        unsigned __int8 v7 = [v6 isEqual:v4],
        v6,
        (v7 & 1) != 0))
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers", 0LL));
    id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v9);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) nrUUID]);
          unsigned __int8 v13 = [v12 isEqual:v4];

          if ((v13 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_14;
          }
        }

        id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (void)removePairerForNRUUID:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nrUUID]);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)resumeUnpairing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));

  if (v3)
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      id v4 = (id)qword_1001DC6A8;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
      _NRLogWithArgs( v4,  1LL,  "%s%.30s:%-4d checking if device %@ is already paired",  ",  "-[NRBluetoothPairingManager resumeUnpairing]"",  199LL,  v5);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedPairingAgent]);

    [v7 setDelegate:self];
    __int128 v19 = v7;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 retrievePairedPeers]);
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
LABEL_10:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d checking peer %@",  ",  "-[NRBluetoothPairingManager resumeUnpairing]"",  207LL,  v13);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        id v16 = [v14 compare:v15];

        if (!v16) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_10;
          }
          goto LABEL_22;
        }
      }

      id v17 = v13;

      if (!v17) {
        goto LABEL_25;
      }
      __int128 v18 = v19;
      [v19 unpairPeer:v17];
    }

    else
    {
LABEL_22:

LABEL_25:
      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1LL);
      __int128 v18 = v19;
    }
  }

- (BOOL)unpair
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (!v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
    id v6 = -[CBCentralManager initWithDelegate:queue:options:](v4, "initWithDelegate:queue:options:", self, v5, 0LL);
    -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nrUUID]);
  id v9 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v8);

  if (v9) {
    id v10 = (void *)*((void *)v9 + 5);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = v10;
  -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v11);

  if (v3) {
    -[NRBluetoothPairingManager resumeUnpairing](self, "resumeUnpairing");
  }

  return 1;
}

- (BOOL)pair
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nrUUID]);
  v5 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v4);

  if (v5)
  {
    if (v5[10])
    {
      id v6 = *((id *)v5 + 5);
      -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v6);

      BOOL v7 = 1;
      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1LL);
      goto LABEL_44;
    }

    id v8 = (void *)*((void *)v5 + 16);
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;
  if ([v9 bluetoothRole] == (id)1)
  {
    BOOL v10 = 0LL;
LABEL_22:

    goto LABEL_23;
  }

  if (v5) {
    id v11 = (void *)*((void *)v5 + 16);
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;
  id v13 = [v12 proxyCapability];
  BOOL v10 = v13 != (id)1;
  if (v13 == (id)1) {
    goto LABEL_21;
  }
  if (v5) {
    v14 = (void *)*((void *)v5 + 16);
  }
  else {
    v14 = 0LL;
  }
  id v15 = v14;
  id v16 = [v15 bluetoothEndpointType];

  if (v16 == (id)2)
  {
    BOOL v10 = 0LL;
LABEL_23:
    -[NRBluetoothPairingManager setIsPeripheralRole:](self, "setIsPeripheralRole:", v10);
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d starting central manager",  ",  "-[NRBluetoothPairingManager pair]"",  272);
    }

    __int128 v19 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
    __int128 v21 = -[CBCentralManager initWithDelegate:queue:options:](v19, "initWithDelegate:queue:options:", self, v20, 0LL);
    -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", v21);

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedPairingAgent]);

    [v23 setDelegate:self];
    if (v10)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d starting peripheral manager",  ",  "-[NRBluetoothPairingManager pair]"",  281);
      }

      v24 = objc_alloc(&OBJC_CLASS___CBPeripheralManager);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
      v26 = -[CBPeripheralManager initWithDelegate:queue:options:]( v24,  "initWithDelegate:queue:options:",  self,  v25,  0LL);
      -[NRBluetoothPairingManager setPeripheralManager:](self, "setPeripheralManager:", v26);
    }

    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d starting pairer for %@",  ",  "-[NRBluetoothPairingManager pair]"",  287LL,  v5);
    }

    BOOL v7 = 1;
    goto LABEL_44;
  }

  if (v5) {
    id v17 = (void *)*((void *)v5 + 16);
  }
  else {
    id v17 = 0LL;
  }
  id v9 = v17;
  if ([v9 bluetoothRole] == (id)2)
  {
    BOOL v10 = 1LL;
    goto LABEL_22;
  }

  __int128 v18 = v5 ? (void *)*((void *)v5 + 16) : 0LL;
  id v12 = v18;
  if ([v12 proxyCapability] == (id)2)
  {
LABEL_21:

    goto LABEL_22;
  }

  if (v5) {
    v28 = (void *)*((void *)v5 + 16);
  }
  else {
    v28 = 0LL;
  }
  id v29 = v28;
  id v30 = [v29 bluetoothEndpointType];

  if (v30 == (id)1)
  {
    BOOL v10 = 1LL;
    goto LABEL_23;
  }

  if (qword_1001DC6B0 != -1) {
    dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC6A8, 16LL))
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    _NRLogWithArgs( qword_1001DC6A8,  16LL,  "%s%.30s:%-4d not enough information to pair device %@",  ",  "-[NRBluetoothPairingManager pair]"",  265LL,  v5);
  }

  BOOL v7 = 0;
LABEL_44:

  return v7;
}

- (void)reset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 sharedPairingAgent]);

  [v7 setDelegate:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
  [v4 stopAdvertising];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  [v5 stopScan];

  -[NRBluetoothPairingManager setPeripheralManager:](self, "setPeripheralManager:", 0LL);
  -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", 0LL);
  -[NRBluetoothPairingManager setBusy:](self, "setBusy:", 0LL);
  -[NRBluetoothPairingManager setIsPeripheralRole:](self, "setIsPeripheralRole:", 0LL);
  -[NRBluetoothPairingManager setIsUnpairing:](self, "setIsUnpairing:", 0LL);
  -[NRBluetoothPairingManager setIsPairing:](self, "setIsPairing:", 0LL);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NRBluetoothPairingManager setPeripherals:](self, "setPeripherals:", v6);

  -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", 0LL);
  -[NRBluetoothPairingManager setActivePairer:](self, "setActivePairer:", 0LL);
  -[NRBluetoothPairingManager setPeripheralReconnectCounter:](self, "setPeripheralReconnectCounter:", 0LL);
}

- (void)handlePairingCompletionWithSuccess:(BOOL)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 completionBlock]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001A920;
    block[3] = &unk_1001AE300;
    BOOL v14 = a3;
    id v12 = v7;
    id v13 = v6;
    id v10 = v7;
    dispatch_async(v9, block);
  }

  -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
}

- (void)disconnectFromPeripherals
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (v3)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[NRBluetoothPairingManager disconnectPeripheral:]( self,  "disconnectPeripheral:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    -[NRBluetoothPairingManager setPeripherals:](self, "setPeripherals:", 0LL);
  }

- (void)disconnectPeripheral:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    id v4 = v8;
    if (v5)
    {
      if ([v8 state] == (id)1 || (v6 = objc_msgSend(v8, "state") == (id)2, id v4 = v8, v6))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        [v7 cancelPeripheralConnection:v8];

        id v4 = v8;
      }
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v5)
  {
    BOOL v6 = (void *)v5;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v7 == v4
      && (-[NRBluetoothPairingManager isPairing](self, "isPairing")
       || -[NRBluetoothPairingManager isUnpairing](self, "isUnpairing")))
    {
      uint64_t v8 = (uint64_t)[v4 state];
      if (v8 == 5)
      {
        if (-[NRBluetoothPairingManager isUnpairing](self, "isUnpairing"))
        {
          -[NRBluetoothPairingManager resumeUnpairing](self, "resumeUnpairing");
        }

        else
        {
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", @"fd74"));
          if (!-[NRBluetoothPairingManager isPeripheralRole](self, "isPeripheralRole"))
          {
            __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
            __int128 v12 = v9;
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v12,  1LL));
            [v10 scanForPeripheralsWithServices:v11 options:0];

            if (qword_1001DC6B0 != -1) {
              dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
            }
            if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
            {
              if (qword_1001DC6B0 != -1) {
                dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
              }
              _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d started scanning",  ",  "-[NRBluetoothPairingManager centralManagerDidUpdateState:]"",  362);
            }
          }
        }
      }

      else if (v8 <= 3)
      {
        -[NRBluetoothPairingManager disconnectFromPeripherals](self, "disconnectFromPeripherals");
      }
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (qword_1001DC6B0 != -1) {
    dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d discovered peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:]"",  377LL,  v10);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parameters]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bluetoothUUID]);

  if (!v15) {
    goto LABEL_9;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 parameters]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bluetoothUUID]);
  unsigned int v20 = [v16 isEqual:v19];

  if (v20)
  {
LABEL_9:
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
    [v21 addObject:v10];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    [v22 connectPeripheral:v10 options:0];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v8)
  {
    __int128 v9 = (void *)v8;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v10 == v6)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
      [v11 addObject:v7];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      [v12 stopScan];

      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d connected peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]"",  397LL,  v7);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sharedPairingAgent]);

      [v14 setDelegate:self];
      if ([v14 isPeerPaired:v7])
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d already paired with peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]"",  412LL,  v7);
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v15);

        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:]( self,  "handlePairingCompletionWithSuccess:",  1LL);
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
        id v17 = [v16 pairingType];

        if (v17)
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
          {
            if (qword_1001DC6B0 != -1) {
              dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
            }
            _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d ignoring pairing with peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]"",  409LL,  v7);
          }
        }

        else
        {
          [v14 setOOBPairingEnabled:0 forPeer:v7];
          v19[0] = CBPairingOptionsUseMITMAuthentication;
          v19[1] = CBPairingOptionsDistributeIRK;
          v20[0] = &__kCFBooleanFalse;
          v20[1] = &__kCFBooleanTrue;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
          [v14 pairPeer:v7 options:v18];

          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
          {
            if (qword_1001DC6B0 != -1) {
              dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
            }
            _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d initiated pairing with peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]"",  407LL,  v7);
          }
        }
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v12 == v14)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d failed to connect peripheral %@ error %@",  ",  "-[NRBluetoothPairingManager centralManager:didFailToConnectPeripheral:error:]"",  426LL,  v8,  v9);
      }

      if (-[NRBluetoothPairingManager peripheralReconnectCounter](self, "peripheralReconnectCounter") > 4)
      {
        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:]( self,  "handlePairingCompletionWithSuccess:",  0LL);
      }

      else
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        [v13 connectPeripheral:v8 options:0];

        -[NRBluetoothPairingManager setPeripheralReconnectCounter:]( self,  "setPeripheralReconnectCounter:",  -[NRBluetoothPairingManager peripheralReconnectCounter](self, "peripheralReconnectCounter") + 1);
      }
    }
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v10 == v15)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d disconnected peripheral %@",  ",  "-[NRBluetoothPairingManager centralManager:didDisconnectPeripheral:error:]"",  444LL,  v7);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
      [v11 removeObject:v7];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedPairingAgent]);

      if (([v13 isPeerPaired:v7] & 1) == 0)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        [v14 connectPeripheral:v7 options:0];
      }
    }
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));

    if (v7 == v4)
    {
      if (-[NRBluetoothPairingManager isPairing](self, "isPairing"))
      {
        if ([v4 state] == (id)5)
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
          {
            if (qword_1001DC6B0 != -1) {
              dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
            }
            _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d starting advertisement",  ",  "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]"",  465);
          }

          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
          id v13 = CBAdvertisementDataServiceUUIDsKey;
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", @"fd74"));
          id v12 = v9;
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v12,  1LL));
          id v14 = v10;
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
          [v8 startAdvertising:v11];
        }

        else
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
          {
            if (qword_1001DC6B0 != -1) {
              dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
            }
            _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d stopping advertisement",  ",  "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]"",  468);
          }

          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
          [v8 stopAdvertising];
        }
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v11 sharedPairingAgent]);

    if (v12 == v15)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 0LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  0LL,  "%s%.30s:%-4d requested peer pairing with type: %zd",  ",  "-[NRBluetoothPairingManager pairingAgent:peerDidRequestPairing:type:passkey:]"",  485,  a5);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
      id v14 = [v13 pairingType];

      if (!v14) {
        [v15 respondToPairingRequest:v9 type:a5 accept:1 data:0];
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 delegate]);
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activePairer]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v8 == v9)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 0LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  0LL,  "%s%.30s:%-4d peripheral %@ completed pairing successfully\n",  ",  "-[NRBluetoothPairingManager pairingAgent:peerDidCompletePairing:]"",  501LL,  v11);
      }

      if (-[NRBluetoothPairingManager isPairing](self, "isPairing"))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v10);

        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:]( self,  "handlePairingCompletionWithSuccess:",  1LL);
      }

      else
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6A8, 17LL))
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          _NRLogWithArgs(qword_1001DC6A8, 17LL, "unexpected pairing result for peer %@", v11);
        }
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 delegate]);
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 activePairer]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v11 == v12)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 0LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  0LL,  "%s%.30s:%-4d peripheral %@ failed to complete pairing with error %@\n",  ",  "-[NRBluetoothPairingManager pairingAgent:peerDidFailToCompletePairing:error:]"",  516LL,  v15,  v8);
      }

      uint64_t v13 = objc_opt_self(self);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v14 setPairedPeerBluetoothUUID:0];

      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 0LL);
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v12 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 delegate]);
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activePairer]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v8 == v9)
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6A8, 0LL))
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        _NRLogWithArgs( qword_1001DC6A8,  0LL,  "%s%.30s:%-4d peripheral %@ unpaired\n",  ",  "-[NRBluetoothPairingManager pairingAgent:peerDidUnpair:]"",  527LL,  v12);
      }

      if (-[NRBluetoothPairingManager isUnpairing](self, "isUnpairing"))
      {
        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:]( self,  "handlePairingCompletionWithSuccess:",  1LL);
        uint64_t v10 = objc_opt_self(self);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        [v11 setPairedPeerBluetoothUUID:0];
      }

      else
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6A8, 17LL))
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          _NRLogWithArgs(qword_1001DC6A8, 17LL, "unexpected pairing result for peer %@", v12);
        }
      }
    }
  }
}

- (void)startNextPairer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  id v4 = [v3 count];

  if (v4)
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      id v5 = (id)qword_1001DC6A8;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
      _NRLogWithArgs( v5,  1LL,  "%s%.30s:%-4d starting: %@",  ",  "-[NRBluetoothPairingManager startNextPairer]"",  545LL,  v6);
    }

    -[NRBluetoothPairingManager setBusy:](self, "setBusy:", 1LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    -[NRBluetoothPairingManager setActivePairer:](self, "setActivePairer:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
    [v9 removeObjectAtIndex:0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
    LODWORD(v8) = [v10 isUnpairRequest];

    if ((_DWORD)v8)
    {
      if (!-[NRBluetoothPairingManager unpair](self, "unpair")) {
        goto LABEL_19;
      }
    }

    else if (!-[NRBluetoothPairingManager pair](self, "pair"))
    {
LABEL_19:
      -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
    }
  }

  else
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d no more pairer requests",  ",  "-[NRBluetoothPairingManager startNextPairer]"",  541);
    }
  }

- (void)enqueuePairer:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  [v4 addObject:v5];

  if (-[NRBluetoothPairingManager busy](self, "busy"))
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d enqueued: %@",  ",  "-[NRBluetoothPairingManager enqueuePairer:]"",  567LL,  v5);
    }
  }

  else
  {
    -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)isPeripheralRole
{
  return self->_isPeripheralRole;
}

- (void)setIsPeripheralRole:(BOOL)a3
{
  self->_isPeripheralRole = a3;
}

- (BOOL)isUnpairing
{
  return self->_isUnpairing;
}

- (void)setIsUnpairing:(BOOL)a3
{
  self->_isUnpairing = a3;
}

- (BOOL)isPairing
{
  return self->_isPairing;
}

- (void)setIsPairing:(BOOL)a3
{
  self->_isPairing = a3;
}

- (NSMutableSet)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (NSUUID)pairedPeerBluetoothUUID
{
  return self->_pairedPeerBluetoothUUID;
}

- (void)setPairedPeerBluetoothUUID:(id)a3
{
}

- (unsigned)peripheralReconnectCounter
{
  return self->_peripheralReconnectCounter;
}

- (void)setPeripheralReconnectCounter:(unsigned int)a3
{
  self->_peripheralReconnectCounter = a3;
}

- (NSMutableArray)enqueuedPairers
{
  return self->_enqueuedPairers;
}

- (void)setEnqueuedPairers:(id)a3
{
}

- (NRBluetoothPairer)activePairer
{
  return self->_activePairer;
}

- (void)setActivePairer:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)copySharedManager
{
  if (qword_1001DC6A0 != -1) {
    dispatch_once(&qword_1001DC6A0, &stru_1001AE2D8);
  }
  return (id)qword_1001DC698;
}

@end