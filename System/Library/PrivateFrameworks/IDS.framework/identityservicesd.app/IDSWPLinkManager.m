@interface IDSWPLinkManager
+ (id)sharedInstance;
- (BOOL)isScanningOrAdvertising;
- (IDSWPLinkManager)init;
- (unint64_t)sendData:(id)a3 peerID:(id)a4;
- (void)_checkWPContinuitySetup;
- (void)_cleanup;
- (void)_continuityDidUpdateStateWithStateValue:(int64_t)a3;
- (void)addConnectivityDelegate:(id)a3;
- (void)clientInstanceCreatedWithMessageContext:(id)a3;
- (void)clientInstancesRemoved;
- (void)connectOnMainQueueToPeer:(id)a3;
- (void)connectToPeer:(id)a3;
- (void)continuity:(id)a3 didConnectToPeer:(id)a4 error:(id)a5;
- (void)continuity:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6;
- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)continuity:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)continuity:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)continuityDidStartAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4;
- (void)continuityDidStartScanningForType:(id)a3 scanningType:(int64_t)a4;
- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4;
- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4 withError:(id)a5;
- (void)continuityDidStopScanningForType:(id)a3 scanningType:(int64_t)a4;
- (void)continuityDidUpdateState:(id)a3;
- (void)disconnectFromPeer:(id)a3;
- (void)disconnectOnMainQueueFromPeer:(id)a3;
- (void)removeConnectivityDelegate:(id)a3;
- (void)removeLink:(id)a3;
- (void)sendReset;
- (void)setAlwaysConnectedForCBUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateOnMainQueue:(id)a3;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)systemDidFastUserSwitchIn;
- (void)systemDidFastUserSwitchOut;
@end

@implementation IDSWPLinkManager

+ (id)sharedInstance
{
  if (qword_1009BEBB8 != -1) {
    dispatch_once(&qword_1009BEBB8, &stru_1008FBAD0);
  }
  return (id)qword_1009BEBC0;
}

- (IDSWPLinkManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSWPLinkManager;
  v2 = -[IDSWPLinkManager init](&v15, "init");
  if (v2)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("WPLinkManager");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "============= New WPLinkManager %@ starting =============",  buf,  0xCu);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6)
    {
      if (_IDSShouldLogTransport(v6))
      {
        v14 = v2;
        _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"============= New WPLinkManager %@ starting =============");
        if (_IDSShouldLog(0LL, @"WPLinkManager"))
        {
          v14 = v2;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"============= New WPLinkManager %@ starting =============");
        }
      }
    }

    v2->_state = 0LL;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable", v14));
    connectivityDelegates = v2->_connectivityDelegates;
    v2->_connectivityDelegates = (NSHashTable *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    linkIDToLink = v2->_linkIDToLink;
    v2->_linkIDToLink = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v11 addListener:v2];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    v2->_systemIsFastUserSwitched = [v12 isFastUserSwitched];
  }

  return v2;
}

- (void)_checkWPContinuitySetup
{
  if (self->_systemIsFastUserSwitched
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate), WeakRetained, !WeakRetained))
  {
    if (self->_continuity)
    {
      uint64_t v3 = OSLogHandleForTransportCategory("WPLinkManager");
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        continuity = self->_continuity;
        *(_DWORD *)buf = 138412290;
        v25 = continuity;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating WPContinuity instance %@",  buf,  0xCu);
      }

      uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
      if ((_DWORD)v7 && _IDSShouldLogTransport(v7))
      {
        v23 = self->_continuity;
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"Invalidating WPContinuity instance %@");
        if (_IDSShouldLog(0LL, @"WPLinkManager"))
        {
          v23 = self->_continuity;
          _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"Invalidating WPContinuity instance %@");
        }
      }

      v9 = self->_continuity;
      p_continuity = &self->_continuity;
      -[WPContinuity invalidate](v9, "invalidate", v23);
      v10 = *p_continuity;
      *p_continuity = 0LL;
    }
  }

  else if (!self->_continuity)
  {
    v12 = objc_alloc(&OBJC_CLASS___WPContinuity);
    uint64_t v14 = im_primary_queue(v12, v13);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = -[WPContinuity initWithDelegate:queue:](v12, "initWithDelegate:queue:", self, v15);
    v17 = self->_continuity;
    self->_continuity = v16;

    uint64_t v18 = OSLogHandleForTransportCategory("WPLinkManager");
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_continuity;
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Created a new WPContinuity instance %@",  buf,  0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"Created a new WPContinuity instance %@");
      }
    }
  }

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100157558;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)setDelegateOnMainQueue:(id)a3
{
}

- (BOOL)isScanningOrAdvertising
{
  uint64_t v3 = (char *)-[NSMutableSet count](self->_linkIDsAlwaysConnected, "count");
  id v4 = &v3[(void)-[NSMutableSet count](self->_scanningTypes, "count")];
  return (char *)-[NSMutableSet count](self->_advertisingTypes, "count") + (void)v4 != 0LL;
}

- (void)addConnectivityDelegate:(id)a3
{
  id v4 = a3;
  -[NSHashTable addObject:](self->_connectivityDelegates, "addObject:", v4);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  obj = self->_linkIDsAlwaysConnected;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v19;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v9);
        uint64_t v11 = im_primary_queue(v5, v6);
        v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10015774C;
        block[3] = &unk_1008F5F58;
        id v15 = v4;
        v16 = self;
        uint64_t v17 = v10;
        dispatch_async(v12, block);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      id v7 = v5;
    }

    while (v5);
  }
}

- (void)removeConnectivityDelegate:(id)a3
{
}

- (void)setAlwaysConnectedForCBUUID:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001577FC;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)clientInstanceCreatedWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "client instance created", buf, 2u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"client instance created");
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:v4]);

  uint64_t v11 = OSLogHandleForTransportCategory("WPLinkManager");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 3) {
      uint64_t v14 = "UnexpectedState";
    }
    else {
      uint64_t v14 = (&off_1008FBAF0)[state];
    }
    *(_DWORD *)buf = 136315138;
    v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidUpdateStateToState:%s",  buf,  0xCu);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
  {
    unint64_t v17 = self->_state;
    __int128 v18 = v17 > 3 ? "UnexpectedState" : (&off_1008FBAF0)[v17];
    __int128 v21 = v18;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"calling continuityDidUpdateStateToState:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      unint64_t v19 = self->_state;
      if (v19 > 3) {
        __int128 v20 = "UnexpectedState";
      }
      else {
        __int128 v20 = (&off_1008FBAF0)[v19];
      }
      __int128 v21 = (void *)v20;
      _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"calling continuityDidUpdateStateToState:%s");
    }
  }

  objc_msgSend(v10, "continuityDidUpdateStateToState:", self->_state, v21);
}

- (void)clientInstancesRemoved
{
  uint64_t v3 = OSLogHandleForTransportCategory("WPLinkManager");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    advertisingTypes = self->_advertisingTypes;
    scanningTypes = self->_scanningTypes;
    *(_DWORD *)buf = 138412546;
    v47 = scanningTypes;
    __int16 v48 = 2112;
    v49 = advertisingTypes;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "all client instances removed, currently scanning: %@   currently advertising: %@",  buf,  0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      v33 = self->_scanningTypes;
      v35 = self->_advertisingTypes;
      _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"all client instances removed, currently scanning: %@   currently advertising: %@");
      if (_IDSShouldLog(0LL, @"WPLinkManager"))
      {
        v33 = self->_scanningTypes;
        v35 = self->_advertisingTypes;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"all client instances removed, currently scanning: %@   currently advertising: %@");
      }
    }
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v9 = -[NSMutableSet copy](self->_advertisingTypes, "copy", v33, v35);
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (unint64_t)[*(id *)(*((void *)&v40 + 1) + 8 * (void)i) integerValue];
        uint64_t v14 = OSLogHandleForTransportCategory("WPLinkManager");
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = "UnexpectedType";
          if (v13 <= 2) {
            uint64_t v16 = (&off_1008FBB10)[v13];
          }
          *(_DWORD *)buf = 136315138;
          v47 = (void *)v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "  => Stopping advertisement for type: %s",  buf,  0xCu);
        }

        uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
        if ((_DWORD)v18 && _IDSShouldLogTransport(v18))
        {
          unint64_t v19 = "UnexpectedType";
          if (v13 <= 2) {
            unint64_t v19 = (&off_1008FBB10)[v13];
          }
          v34 = v19;
          _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Stopping advertisement for type: %s");
          if (_IDSShouldLog(0LL, @"WPLinkManager"))
          {
            __int128 v20 = "UnexpectedType";
            if (v13 <= 2) {
              __int128 v20 = (&off_1008FBB10)[v13];
            }
            v34 = v20;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"  => Stopping advertisement for type: %s");
          }
        }

        -[IDSWPLinkManager stopAdvertisingOfType:](self, "stopAdvertisingOfType:", v13, v34);
      }

      id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v10);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v21 = -[NSMutableSet copy](self->_scanningTypes, "copy");
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v21);
        }
        unint64_t v25 = (unint64_t)[*(id *)(*((void *)&v36 + 1) + 8 * (void)j) integerValue];
        uint64_t v26 = OSLogHandleForTransportCategory("WPLinkManager");
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = "UnexpectedType";
          if (v25 <= 2) {
            v28 = (&off_1008FBB10)[v25];
          }
          *(_DWORD *)buf = 136315138;
          v47 = (void *)v28;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "  => Stopping scanning for type: %s",  buf,  0xCu);
        }

        uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
        if ((_DWORD)v30 && _IDSShouldLogTransport(v30))
        {
          v31 = "UnexpectedType";
          if (v25 <= 2) {
            v31 = (&off_1008FBB10)[v25];
          }
          v34 = v31;
          _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Stopping scanning for type: %s");
          if (_IDSShouldLog(0LL, @"WPLinkManager"))
          {
            v32 = "UnexpectedType";
            if (v25 <= 2) {
              v32 = (&off_1008FBB10)[v25];
            }
            v34 = v32;
            _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"  => Stopping scanning for type: %s");
          }
        }

        -[IDSWPLinkManager stopScanningForType:](self, "stopScanningForType:", v25, v34);
      }

      id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v22);
  }
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    else {
      v12 = (&off_1008FBB10)[a3];
    }
    *(_DWORD *)buf = 136315650;
    v33 = v12;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "startAdvertisingOfType:%s withData:%@ withOptions:%@",  buf,  0x20u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14 && _IDSShouldLogTransport(v14))
  {
    uint64_t v15 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    id v30 = v8;
    id v31 = v9;
    uint64_t v29 = v15;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"startAdvertisingOfType:%s withData:%@ withOptions:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v16 = (&off_1008FBB10)[a3];
      }
      id v30 = v8;
      id v31 = v9;
      uint64_t v29 = (void *)v16;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"startAdvertisingOfType:%s withData:%@ withOptions:%@");
    }
  }

  if (self->_state != 3)
  {
    uint64_t v17 = OSLogHandleForTransportCategory("WPLinkManager");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }
  }

  else {
    int64_t v21 = a3;
  }
  -[WPContinuity startAdvertisingOfType:withData:]( self->_continuity,  "startAdvertisingOfType:withData:",  v21,  v8,  v29,  v30,  v31);
  advertisingTypes = self->_advertisingTypes;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LOBYTE(advertisingTypes) = -[NSMutableSet containsObject:](advertisingTypes, "containsObject:", v23);

  if ((advertisingTypes & 1) == 0)
  {
    v24 = self->_advertisingTypes;
    if (!v24)
    {
      unint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v27 = self->_advertisingTypes;
      p_advertisingTypes = &self->_advertisingTypes;
      *p_advertisingTypes = v25;

      v24 = *p_advertisingTypes;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet addObject:](v24, "addObject:", v28);
  }
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v7 = (&off_1008FBB10)[a3];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stopAdvertisingOfType:%s", buf, 0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    uint64_t v10 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    uint64_t v18 = v10;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"stopAdvertisingOfType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v11 = (&off_1008FBB10)[a3];
      }
      uint64_t v18 = (void *)v11;
      _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"stopAdvertisingOfType:%s");
    }
  }

  else {
    int64_t v12 = a3;
  }
  -[WPContinuity stopAdvertisingOfType:](self->_continuity, "stopAdvertisingOfType:", v12, v18);
  advertisingTypes = self->_advertisingTypes;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LODWORD(advertisingTypes) = -[NSMutableSet containsObject:](advertisingTypes, "containsObject:", v14);

  if ((_DWORD)advertisingTypes)
  {
    uint64_t v15 = self->_advertisingTypes;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet removeObject:](v15, "removeObject:", v16);

    if (!-[NSMutableSet count](self->_advertisingTypes, "count"))
    {
      uint64_t v17 = self->_advertisingTypes;
      self->_advertisingTypes = 0LL;
    }
  }

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v15 = (&off_1008FBB10)[a3];
    }
    uint64_t v16 = IMLoggingStringForArray(v12);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 136315906;
    __int128 v43 = v15;
    __int16 v44 = 2112;
    id v45 = v10;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    v49 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "startScanningForType:%s withData:%@ mask:%@ peers: %@",  buf,  0x2Au);
  }

  uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
  if ((_DWORD)v19 && _IDSShouldLogTransport(v19))
  {
    uint64_t v20 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    uint64_t v21 = IMLoggingStringForArray(v12);
    id v40 = v11;
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v21);
    __int128 v38 = v20;
    id v39 = v10;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"startScanningForType:%s withData:%@ mask:%@ peers: %@");

    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v22 = (&off_1008FBB10)[a3];
      }
      uint64_t v23 = IMLoggingStringForArray(v12);
      id v40 = v11;
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v23);
      __int128 v38 = (void *)v22;
      id v39 = v10;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"startScanningForType:%s withData:%@ mask:%@ peers: %@");
    }
  }

  if (self->_state != 3)
  {
    uint64_t v24 = OSLogHandleForTransportCategory("WPLinkManager");
    unint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__imArrayByApplyingBlock:", &stru_1008FBB28, v38, v39, v40, v41));

  continuity = self->_continuity;
  else {
    int64_t v30 = a3;
  }
  if (v11) {
    -[WPContinuity startScanningForType:withData:mask:peers:]( continuity,  "startScanningForType:withData:mask:peers:",  v30,  v10,  v11,  v28);
  }
  else {
    -[WPContinuity startScanningForType:withData:peers:]( continuity,  "startScanningForType:withData:peers:",  v30,  v10,  v28);
  }
  scanningTypes = self->_scanningTypes;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LOBYTE(scanningTypes) = -[NSMutableSet containsObject:](scanningTypes, "containsObject:", v32);

  if ((scanningTypes & 1) == 0)
  {
    v33 = self->_scanningTypes;
    if (!v33)
    {
      __int16 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v36 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v34;

      v33 = *p_scanningTypes;
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet addObject:](v33, "addObject:", v37);
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForTransportCategory("WPLinkManager");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    else {
      id v12 = (&off_1008FBB10)[a3];
    }
    *(_DWORD *)buf = 136315650;
    __int16 v34 = v12;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "startScanningForType:%s withData:%@ mask:%@",  buf,  0x20u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14 && _IDSShouldLogTransport(v14))
  {
    uint64_t v15 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    id v31 = v8;
    id v32 = v9;
    int64_t v30 = v15;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"startScanningForType:%s withData:%@ mask:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v16 = (&off_1008FBB10)[a3];
      }
      id v31 = v8;
      id v32 = v9;
      int64_t v30 = (void *)v16;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"startScanningForType:%s withData:%@ mask:%@");
    }
  }

  if (self->_state != 3)
  {
    uint64_t v17 = OSLogHandleForTransportCategory("WPLinkManager");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }
  }

  continuity = self->_continuity;
  else {
    int64_t v22 = a3;
  }
  if (v9) {
    -[WPContinuity startScanningForType:withData:mask:peers:]( continuity,  "startScanningForType:withData:mask:peers:",  v22,  v8,  v9,  0LL);
  }
  else {
    -[WPContinuity startScanningForType:withData:peers:]( continuity,  "startScanningForType:withData:peers:",  v22,  v8,  0LL);
  }
  scanningTypes = self->_scanningTypes;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3, v30, v31, v32));
  LOBYTE(scanningTypes) = -[NSMutableSet containsObject:](scanningTypes, "containsObject:", v24);

  if ((scanningTypes & 1) == 0)
  {
    unint64_t v25 = self->_scanningTypes;
    if (!v25)
    {
      uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v28 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v26;

      unint64_t v25 = *p_scanningTypes;
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet addObject:](v25, "addObject:", v29);
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  BOOL v53 = a8;
  BOOL v8 = a7;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v18 = (&off_1008FBB10)[a3];
    }
    uint64_t v19 = IMLoggingStringForArray(v15);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = (void *)v20;
    int64_t v22 = @"NO";
    *(_DWORD *)buf = 136316418;
    v55 = v18;
    __int16 v56 = 2112;
    if (v8) {
      uint64_t v23 = @"YES";
    }
    else {
      uint64_t v23 = @"NO";
    }
    id v57 = v13;
    if (v53) {
      int64_t v22 = @"YES";
    }
    __int16 v58 = 2112;
    id v59 = v14;
    __int16 v60 = 2112;
    uint64_t v61 = v20;
    __int16 v62 = 2112;
    v63 = v23;
    __int16 v64 = 2112;
    v65 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "startScanningForType:%s withData:%@ mask:%@ peers:%@ boostedScan:%@ duplicates:%@",  buf,  0x3Eu);
  }

  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
  if ((_DWORD)v25 && _IDSShouldLogTransport(v25))
  {
    uint64_t v26 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    uint64_t v27 = IMLoggingStringForArray(v15);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = (void *)v28;
    int64_t v30 = v8 ? @"YES" : @"NO";
    id v31 = v53 ? @"YES" : @"NO";
    v51 = v30;
    v52 = v31;
    id v49 = v14;
    v50 = (void *)v28;
    id v47 = v26;
    id v48 = v13;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"startScanningForType:%s withData:%@ mask:%@ peers:%@ boostedScan:%@ duplicates:%@");

    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v32 = (&off_1008FBB10)[a3];
      }
      uint64_t v33 = IMLoggingStringForArray(v15);
      v51 = v30;
      v52 = v31;
      id v49 = v14;
      v50 = (void *)objc_claimAutoreleasedReturnValue(v33);
      id v47 = (void *)v32;
      id v48 = v13;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"startScanningForType:%s withData:%@ mask:%@ peers:%@ boostedScan:%@ duplicates:%@");
    }
  }

  if (self->_state != 3)
  {
    uint64_t v34 = OSLogHandleForTransportCategory("WPLinkManager");
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
    if ((_DWORD)v37)
    {
      if (_IDSShouldLogTransport(v37))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "__imArrayByApplyingBlock:", &stru_1008FBB28, v47, v48, v49, v50, v51, v52));

  else {
    int64_t v39 = a3;
  }
  -[WPContinuity startScanningForType:withData:mask:peers:boostedScan:duplicates:]( self->_continuity,  "startScanningForType:withData:mask:peers:boostedScan:duplicates:",  v39,  v13,  v14,  v38,  v8,  v53);
  scanningTypes = self->_scanningTypes;
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LOBYTE(scanningTypes) = -[NSMutableSet containsObject:](scanningTypes, "containsObject:", v41);

  if ((scanningTypes & 1) == 0)
  {
    __int128 v42 = self->_scanningTypes;
    if (!v42)
    {
      __int128 v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v45 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v43;

      __int128 v42 = *p_scanningTypes;
    }

    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet addObject:](v42, "addObject:", v46);
  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = OSLogHandleForTransportCategory("WPLinkManager");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v16 = (&off_1008FBB10)[a3];
    }
    uint64_t v17 = @"NO";
    *(_DWORD *)buf = 136316162;
    __int128 v43 = v16;
    __int16 v44 = 2112;
    if (v8) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    id v45 = v12;
    if (v7) {
      uint64_t v17 = @"YES";
    }
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v18;
    __int16 v50 = 2112;
    v51 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "startScanningForType:%s withData:%@ mask:%@ boostedScan:%@ duplicates:%@",  buf,  0x34u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20 && _IDSShouldLogTransport(v20))
  {
    uint64_t v21 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    int64_t v22 = v8 ? @"YES" : @"NO";
    uint64_t v23 = v7 ? @"YES" : @"NO";
    id v40 = v22;
    __int128 v41 = v23;
    id v38 = v12;
    id v39 = v13;
    uint64_t v37 = v21;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"startScanningForType:%s withData:%@ mask:%@ boostedScan:%@ duplicates:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v24 = (&off_1008FBB10)[a3];
      }
      id v40 = v22;
      __int128 v41 = v23;
      id v38 = v12;
      id v39 = v13;
      uint64_t v37 = (void *)v24;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"startScanningForType:%s withData:%@ mask:%@ boostedScan:%@ duplicates:%@");
    }
  }

  if (self->_state != 3)
  {
    uint64_t v25 = OSLogHandleForTransportCategory("WPLinkManager");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }
  }

  else {
    int64_t v29 = a3;
  }
  -[WPContinuity startScanningForType:withData:mask:peers:boostedScan:duplicates:]( self->_continuity,  "startScanningForType:withData:mask:peers:boostedScan:duplicates:",  v29,  v12,  v13,  0LL,  v8,  v7,  v37,  v38,  v39,  v40,  v41);
  scanningTypes = self->_scanningTypes;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LOBYTE(scanningTypes) = -[NSMutableSet containsObject:](scanningTypes, "containsObject:", v31);

  if ((scanningTypes & 1) == 0)
  {
    id v32 = self->_scanningTypes;
    if (!v32)
    {
      uint64_t v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v35 = self->_scanningTypes;
      p_scanningTypes = &self->_scanningTypes;
      *p_scanningTypes = v33;

      id v32 = *p_scanningTypes;
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet addObject:](v32, "addObject:", v36);
  }
}

- (void)stopScanningForType:(int64_t)a3
{
  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    else {
      BOOL v7 = (&off_1008FBB10)[a3];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stopScanningForType:%s", buf, 0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    uint64_t v10 = (unint64_t)a3 > 2 ? "UnexpectedType" : (&off_1008FBB10)[a3];
    uint64_t v18 = v10;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"stopScanningForType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v11 = (&off_1008FBB10)[a3];
      }
      uint64_t v18 = (void *)v11;
      _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"stopScanningForType:%s");
    }
  }

  else {
    int64_t v12 = a3;
  }
  -[WPContinuity stopScanningForType:](self->_continuity, "stopScanningForType:", v12, v18);
  scanningTypes = self->_scanningTypes;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  LODWORD(scanningTypes) = -[NSMutableSet containsObject:](scanningTypes, "containsObject:", v14);

  if ((_DWORD)scanningTypes)
  {
    id v15 = self->_scanningTypes;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableSet removeObject:](v15, "removeObject:", v16);

    if (!-[NSMutableSet count](self->_scanningTypes, "count"))
    {
      uint64_t v17 = self->_scanningTypes;
      self->_scanningTypes = 0LL;
    }
  }

- (void)connectOnMainQueueToPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    continuity = self->_continuity;
    *(_DWORD *)buf = 138543618;
    id v56 = v4;
    __int16 v57 = 2112;
    __int16 v58 = continuity;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "connectToPeer %{public}@, continuity %@",  buf,  0x16u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v46 = v4;
      __int16 v48 = self->_continuity;
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"connectToPeer %{public}@, continuity %@");
      if (_IDSShouldLog(0LL, @"WPLinkManager"))
      {
        id v46 = v4;
        __int16 v48 = self->_continuity;
        _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"connectToPeer %{public}@, continuity %@");
      }
    }
  }

  if (v4)
  {
    if (self->_continuity)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePolicyController sharedInstance]( &OBJC_CLASS___IDSDevicePolicyController,  "sharedInstance"));
      unsigned __int8 v11 = [v10 shouldBlackOutDeviceWithCbuuid:v4];

      if ((v11 & 1) == 0)
      {
        if (self->_state == 3)
        {
          int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v4));

          if (v12)
          {
            uint64_t v13 = OSLogHandleForTransportCategory("WPLinkManager");
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v56 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "already connected to %{public}@.",  buf,  0xCu);
            }

            uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
            if ((_DWORD)v16)
            {
              if (_IDSShouldLogTransport(v16))
              {
                _IDSLogTransport(@"WPLinkManager", @"IDS", @"already connected to %{public}@.");
                if (_IDSShouldLog(0LL, @"WPLinkManager")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"already connected to %{public}@.");
                }
              }
            }

            goto LABEL_51;
          }

          linkIDsConnecting = self->_linkIDsConnecting;
          if (!linkIDsConnecting)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            uint64_t v27 = self->_linkIDsConnecting;
            self->_linkIDsConnecting = Mutable;

            linkIDsConnecting = self->_linkIDsConnecting;
          }

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](linkIDsConnecting, "objectForKey:", v4, v46, v48));
          int64_t v29 = v28;
          if (v28 && ([v28 timeIntervalSinceNow], fabs(v30) < 10.0))
          {
            uint64_t v31 = OSLogHandleForTransportCategory("WPLinkManager");
            id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsConnecting, "objectForKey:", v4));
              [v33 timeIntervalSinceNow];
              *(_DWORD *)buf = 138543618;
              id v56 = v4;
              __int16 v57 = 2048;
              __int16 v58 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "already connecting to %{public}@  (Time: %f)",  buf,  0x16u);
            }

            uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
            if (!(_DWORD)v36) {
              goto LABEL_50;
            }
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsConnecting, "objectForKey:", v4));
            [v37 timeIntervalSinceNow];
            uint64_t v49 = v38;
            _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"already connecting to %{public}@  (Time: %f)");

            id v39 = (NSUUID *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_linkIDsConnecting,  "objectForKey:",  v4,  v4,  v49));
            -[NSUUID timeIntervalSinceNow](v39, "timeIntervalSinceNow");
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"already connecting to %{public}@  (Time: %f)");
          }

          else
          {
            uint64_t v40 = OSLogHandleForTransportCategory("WPLinkManager");
            __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v56 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "*** starting connection to %{public}@",  buf,  0xCu);
            }

            uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
            if ((_DWORD)v43)
            {
              if (_IDSShouldLogTransport(v43))
              {
                id v47 = v4;
                _IDSLogTransport(@"WPLinkManager", @"IDS", @"*** starting connection to %{public}@");
                if (_IDSShouldLog(0LL, @"WPLinkManager"))
                {
                  id v47 = v4;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"*** starting connection to %{public}@");
                }
              }
            }

            __int16 v44 = self->_linkIDsConnecting;
            id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v47));
            -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v45, v4);

            id v39 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
            kdebug_trace(722010300LL, 0LL, 0LL, 0LL, 0LL);
            -[WPContinuity connectToPeer:](self->_continuity, "connectToPeer:", v39);
          }

LABEL_50:
          goto LABEL_51;
        }

        uint64_t v17 = OSLogHandleForTransportCategory("WPLinkManager");
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
        }

        uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
        if ((_DWORD)v20)
        {
          if (_IDSShouldLogTransport(v20))
          {
            _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
          }
        }

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        uint64_t v21 = self->_connectivityDelegates;
        id v22 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v50,  v54,  16LL);
        if (v22)
        {
          uint64_t v23 = *(void *)v51;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend( *(id *)(*((void *)&v50 + 1) + 8 * (void)i),  "manager:cbuuidDidFailToConnect:withReason:",  self,  v4,  0,  v46,  v48,  (void)v50);
            }

            id v22 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v50,  v54,  16LL);
          }

          while (v22);
        }
      }
    }
  }

- (void)connectToPeer:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100159EE8;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)disconnectOnMainQueueFromPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    continuity = self->_continuity;
    *(_DWORD *)buf = 138543618;
    id v36 = v4;
    __int16 v37 = 2114;
    uint64_t v38 = continuity;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "disconnectFromPeer %{public}@, continuity %{public}@",  buf,  0x16u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v31 = v4;
      uint64_t v33 = self->_continuity;
      _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"disconnectFromPeer %{public}@, continuity %{public}@");
      if (_IDSShouldLog(0LL, @"WPLinkManager"))
      {
        id v31 = v4;
        uint64_t v33 = self->_continuity;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"disconnectFromPeer %{public}@, continuity %{public}@");
      }
    }
  }

  if (v4 && self->_continuity)
  {
    linkIDsDisconnecting = self->_linkIDsDisconnecting;
    if (!linkIDsDisconnecting)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      int64_t v12 = self->_linkIDsDisconnecting;
      self->_linkIDsDisconnecting = Mutable;

      linkIDsDisconnecting = self->_linkIDsDisconnecting;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](linkIDsDisconnecting, "objectForKey:", v4, v31, v33));
    uint64_t v14 = v13;
    if (v13 && ([v13 timeIntervalSinceNow], fabs(v15) < 10.0))
    {
      uint64_t v16 = OSLogHandleForTransportCategory("WPLinkManager");
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v4));
        [v18 timeIntervalSinceNow];
        *(_DWORD *)buf = 138543618;
        id v36 = v4;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "already disconnecting from %{public}@  (Time: %f)",  buf,  0x16u);
      }

      uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
      if (!(_DWORD)v21) {
        goto LABEL_27;
      }
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v4));
      [v22 timeIntervalSinceNow];
      uint64_t v34 = v23;
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"already disconnecting from %{public}@  (Time: %f)");

      uint64_t v24 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v4, v4, v34));
      -[NSUUID timeIntervalSinceNow](v24, "timeIntervalSinceNow");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"already disconnecting from %{public}@  (Time: %f)");
    }

    else
    {
      uint64_t v25 = OSLogHandleForTransportCategory("WPLinkManager");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "*** starting disconnected from %{public}@",  buf,  0xCu);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          id v32 = v4;
          _IDSLogTransport(@"WPLinkManager", @"IDS", @"*** starting disconnected from %{public}@");
          if (_IDSShouldLog(0LL, @"WPLinkManager"))
          {
            id v32 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"*** starting disconnected from %{public}@");
          }
        }
      }

      int64_t v29 = self->_linkIDsDisconnecting;
      double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v32));
      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, v4);

      uint64_t v24 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
      -[WPContinuity disconnectFromPeer:](self->_continuity, "disconnectFromPeer:", v24);
    }

LABEL_27:
  }
}

- (void)disconnectFromPeer:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015A3BC;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)removeLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 linkID]);
  uint64_t v7 = im_primary_queue(v5, v6);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015A480;
  block[3] = &unk_1008F5F58;
  id v12 = v4;
  id v13 = v5;
  uint64_t v14 = self;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v8, block);
}

- (unint64_t)sendData:(id)a3 peerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("WPLinkManager");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v18 = [v6 length];
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sendData %luB peerID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"WPLinkManager"))
  {
    [v6 length];
    _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"sendData %luB peerID %@");
  }

  if (self->_state == 3)
  {
    -[WPContinuity sendData:toPeer:](self->_continuity, "sendData:toPeer:", v6, v7);
    unint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v12 = OSLogHandleForTransportCategory("WPLinkManager");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Device not powered on", buf, 2u);
    }

    uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
    if ((_DWORD)v15)
    {
      if (_IDSShouldLogTransport(v15))
      {
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"  => Device not powered on");
      }
    }

    unint64_t v11 = 6LL;
  }

  return v11;
}

- (void)_cleanup
{
  linkIDToLink = self->_linkIDToLink;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015A8A4;
  v6[3] = &unk_1008F8418;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](linkIDToLink, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[NSMutableDictionary removeAllObjects](self->_linkIDToLink, "removeAllObjects");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manager:self didPowerStateChange:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v5 unlockAllContinuityPeers];
}

- (void)systemDidFastUserSwitchOut
{
  self->_systemIsFastUserSwitched = 1;
  -[IDSWPLinkManager _continuityDidUpdateStateWithStateValue:](self, "_continuityDidUpdateStateWithStateValue:", 1LL);
  -[IDSWPLinkManager _checkWPContinuitySetup](self, "_checkWPContinuitySetup");
}

- (void)systemDidFastUserSwitchIn
{
  self->_systemIsFastUserSwitched = 0;
  -[IDSWPLinkManager _checkWPContinuitySetup](self, "_checkWPContinuitySetup");
}

- (void)continuityDidUpdateState:(id)a3
{
}

- (void)_continuityDidUpdateStateWithStateValue:(int64_t)a3
{
  id v4 = self;
  self->_int64_t state = a3;
  int64_t state = a3;
  if (a3 < 2)
  {
    -[NSMutableDictionary removeAllObjects](self->_linkIDsConnecting, "removeAllObjects");
    linkIDsConnecting = v4->_linkIDsConnecting;
    v4->_linkIDsConnecting = 0LL;

    -[NSMutableDictionary removeAllObjects](v4->_linkIDsDisconnecting, "removeAllObjects");
    linkIDsDisconnecting = v4->_linkIDsDisconnecting;
    v4->_linkIDsDisconnecting = 0LL;

    int64_t state = v4->_state;
  }

  if (state <= 2) {
    self = (IDSWPLinkManager *)-[IDSWPLinkManager _cleanup](v4, "_cleanup");
  }
  uint64_t v8 = im_primary_queue(self, a2);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015AAD0;
  block[3] = &unk_1008F6558;
  void block[4] = a3;
  dispatch_async(v9, block);
}

- (void)continuityDidStartAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v8 = 3LL;
  }
  uint64_t v9 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    else {
      unint64_t v11 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidStartAdvertisingOfType:%s",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
  {
    uint64_t v14 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v8] : "UnexpectedType";
    uint64_t v16 = v14;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"calling continuityDidStartAdvertisingOfType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v15 = "UnexpectedType";
      }
      uint64_t v16 = (void *)v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidStartAdvertisingOfType:%s");
    }
  }

  objc_msgSend(v7, "continuityDidStartAdvertisingOfType:", v8, v16);
}

- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v8 = 3LL;
  }
  uint64_t v9 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    else {
      unint64_t v11 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidStopAdvertisingOfType:%s",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
  {
    uint64_t v14 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v8] : "UnexpectedType";
    uint64_t v16 = v14;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"calling continuityDidStopAdvertisingOfType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v15 = "UnexpectedType";
      }
      uint64_t v16 = (void *)v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidStopAdvertisingOfType:%s");
    }
  }

  objc_msgSend(v7, "continuityDidStopAdvertisingOfType:", v8, v16);
}

- (void)continuityDidStopAdvertisingOfType:(id)a3 advertisingType:(int64_t)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v11 = 3LL;
  }
  uint64_t v12 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v14 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidStopAdvertisingOfType:%s withError:%@",  buf,  0x16u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
  {
    uint64_t v17 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v11] : "UnexpectedType";
    __int16 v19 = v17;
    id v20 = v8;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"calling continuityDidStopAdvertisingOfType:%s withError:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v18 = "UnexpectedType";
      }
      __int16 v19 = (void *)v18;
      id v20 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidStopAdvertisingOfType:%s withError:%@");
    }
  }

  objc_msgSend(v10, "continuityDidStopAdvertisingOfType:withError:", v11, v8, v19, v20);
}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v11 = 3LL;
  }
  uint64_t v12 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v14 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidFailToStartAdvertisingOfType:%s withError:%@",  buf,  0x16u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
  {
    uint64_t v17 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v11] : "UnexpectedType";
    __int16 v19 = v17;
    id v20 = v8;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"calling continuityDidFailToStartAdvertisingOfType:%s withError:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v18 = "UnexpectedType";
      }
      __int16 v19 = (void *)v18;
      id v20 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidFailToStartAdvertisingOfType:%s withError:%@");
    }
  }

  objc_msgSend(v10, "continuityDidFailToStartAdvertisingOfType:withError:", v11, v8, v19, v20);
}

- (void)continuityDidStartScanningForType:(id)a3 scanningType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v8 = 3LL;
  }
  uint64_t v9 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    else {
      int64_t v11 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidStartScanningForType:%s",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
  {
    uint64_t v14 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v8] : "UnexpectedType";
    uint64_t v16 = v14;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"calling continuityDidStartScanningForType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v15 = "UnexpectedType";
      }
      uint64_t v16 = (void *)v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidStartScanningForType:%s");
    }
  }

  objc_msgSend(v7, "continuityDidStartScanningForType:", v8, v16);
}

- (void)continuityDidStopScanningForType:(id)a3 scanningType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v8 = 3LL;
  }
  uint64_t v9 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    else {
      int64_t v11 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315138;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidStopScanningForType:%s",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
  {
    uint64_t v14 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v8] : "UnexpectedType";
    uint64_t v16 = v14;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"calling continuityDidStopScanningForType:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v15 = "UnexpectedType";
      }
      uint64_t v16 = (void *)v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidStopScanningForType:%s");
    }
  }

  objc_msgSend(v7, "continuityDidStopScanningForType:", v8, v16);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v11 = 3LL;
  }
  uint64_t v12 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v14 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315394;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidFailToStartScanningForType:%s withError:%@",  buf,  0x16u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
  {
    uint64_t v17 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v11] : "UnexpectedType";
    __int16 v19 = v17;
    id v20 = v8;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"calling continuityDidFailToStartScanningForType:%s withError:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        id v18 = "UnexpectedType";
      }
      __int16 v19 = (void *)v18;
      id v20 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidFailToStartScanningForType:%s withError:%@");
    }
  }

  objc_msgSend(v10, "continuityDidFailToStartScanningForType:withError:", v11, v8, v19, v20);
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v14 = self->_connectivityDelegates;
  id v15 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
LABEL_3:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(v14);
      }
      if ([*(id *)(*((void *)&v32 + 1) + 8 * v17) manager:self cbuuidDidDiscover:v13]) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  else {
    int64_t v20 = 3LL;
  }
  uint64_t v21 = OSLogHandleForTransportCategory("WPLinkManager");
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    else {
      __int16 v23 = "UnexpectedType";
    }
    *(_DWORD *)buf = 136315650;
    __int16 v37 = v23;
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "calling continuityDidDiscoverType:%s withData:%@ fromPeer:%@",  buf,  0x20u);
  }

  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
  if ((_DWORD)v25 && _IDSShouldLogTransport(v25))
  {
    uint64_t v26 = (unint64_t)a4 <= 2 ? (&off_1008FBB10)[v20] : "UnexpectedType";
    id v30 = v11;
    id v31 = v12;
    int64_t v29 = v26;
    _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"calling continuityDidDiscoverType:%s withData:%@ fromPeer:%@");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      else {
        uint64_t v27 = "UnexpectedType";
      }
      id v30 = v11;
      id v31 = v12;
      int64_t v29 = (void *)v27;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"calling continuityDidDiscoverType:%s withData:%@ fromPeer:%@");
    }
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString", v29, v30, v31));
  [v19 continuityDidDiscoverType:v20 withData:v11 fromPeer:v28];
}

- (void)continuity:(id)a3 didConnectToPeer:(id)a4 error:(id)a5
{
  id v73 = a3;
  id v8 = (NSHashTable *)a4;
  id v9 = a5;
  v74 = v8;
  id v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue(-[NSHashTable UUIDString](v8, "UUIDString"));
  if (v10)
  {
    kdebug_trace(722010304LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v11 = OSLogHandleForTransportCategory("WPLinkManager");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v86 = v10;
      __int16 v87 = 2114;
      double v88 = *(double *)&v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "didConnectToPeer:%{public}@ error:%{public}@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        v71 = v10;
        double v72 = *(double *)&v9;
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"didConnectToPeer:%{public}@ error:%{public}@");
        if (_IDSShouldLog(0LL, @"WPLinkManager"))
        {
          v71 = v10;
          double v72 = *(double *)&v9;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"didConnectToPeer:%{public}@ error:%{public}@");
        }
      }
    }

    if (v9)
    {
      uint64_t v15 = OSLogHandleForTransportCategory("WPLinkManager");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v86 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "linkDidFailToConnect for peer %{public}@",  buf,  0xCu);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          v71 = v10;
          _IDSLogTransport(@"WPLinkManager", @"IDS", @"linkDidFailToConnect for peer %{public}@");
          if (_IDSShouldLog(0LL, @"WPLinkManager"))
          {
            v71 = v10;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"linkDidFailToConnect for peer %{public}@");
          }
        }
      }

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance",  v71,  *(void *)&v72,  v73));
      unsigned int v20 = [v19 isPeerForPhoneContinuityLocalMessage:v10];

      if (v20)
      {
        uint64_t v21 = OSLogHandleForTransportCategory("UTunPeer");
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skip unlockContinuityPeer for peer %@",  buf,  0xCu);
        }

        uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
        if ((_DWORD)v24)
        {
          if (_IDSShouldLogTransport(v24))
          {
            v71 = v10;
            _IDSLogTransport(@"UTunPeer", @"IDS", @"Skip unlockContinuityPeer for peer %@");
            if (_IDSShouldLog(0LL, @"UTunPeer"))
            {
              v71 = v10;
              _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"Skip unlockContinuityPeer for peer %@");
            }
          }
        }
      }

      else
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
        [v43 unlockContinuityPeer:v10];
      }

      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      int64_t v29 = self->_connectivityDelegates;
      id v44 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v75,  v83,  16LL);
      if (v44)
      {
        uint64_t v45 = *(void *)v76;
        do
        {
          for (i = 0LL; i != v44; i = (char *)i + 1)
          {
            if (*(void *)v76 != v45) {
              objc_enumerationMutation(v29);
            }
            objc_msgSend( *(id *)(*((void *)&v75 + 1) + 8 * (void)i),  "manager:cbuuidDidFailToConnect:withReason:",  self,  v10,  v9,  v71);
          }

          id v44 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v75,  v83,  16LL);
        }

        while (v44);
      }
    }

    else
    {
      int64_t v29 = (NSHashTable *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v10));
      if (!v29)
      {
        int64_t v29 = -[IDSBTLELink initWithWPLinkManager:withIdentifier:]( objc_alloc(&OBJC_CLASS___IDSBTLELink),  "initWithWPLinkManager:withIdentifier:",  self,  v10);
        uint64_t v30 = OSLogHandleForTransportCategory("WPLinkManager");
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v86 = v29;
          __int16 v87 = 2114;
          double v88 = *(double *)&v10;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "BTLELink %{public}@ created with BTID: %{public}@",  buf,  0x16u);
        }

        uint64_t v33 = os_log_shim_legacy_logging_enabled(v32);
        if ((_DWORD)v33)
        {
          if (_IDSShouldLogTransport(v33))
          {
            v71 = v29;
            double v72 = *(double *)&v10;
            _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"BTLELink %{public}@ created with BTID: %{public}@");
            if (_IDSShouldLog(0LL, @"WPLinkManager"))
            {
              v71 = v29;
              double v72 = *(double *)&v10;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"BTLELink %{public}@ created with BTID: %{public}@");
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:]( self->_linkIDToLink,  "setObject:forKey:",  v29,  v10,  v71,  *(void *)&v72,  v73);
        kdebug_trace(722010308LL, 0LL, 0LL, 0LL, 0LL);
        uint64_t v34 = OSLogHandleForTransportCategory("WPLinkManager");
        __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v86 = v29;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "linkDidConnect %{public}@", buf, 0xCu);
        }

        uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
        if ((_DWORD)v37)
        {
          if (_IDSShouldLogTransport(v37))
          {
            v71 = v29;
            _IDSLogTransport(@"WPLinkManager", @"IDS", @"linkDidConnect %{public}@");
            if (_IDSShouldLog(0LL, @"WPLinkManager"))
            {
              v71 = v29;
              _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"linkDidConnect %{public}@");
            }
          }
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained manager:self linkDidConnect:v29];

        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id v39 = self->_connectivityDelegates;
        id v40 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v79,  v84,  16LL);
        if (v40)
        {
          uint64_t v41 = *(void *)v80;
          do
          {
            for (j = 0LL; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v80 != v41) {
                objc_enumerationMutation(v39);
              }
              objc_msgSend( *(id *)(*((void *)&v79 + 1) + 8 * (void)j),  "manager:cbuuidDidConnect:isAlwaysConnected:",  self,  v10,  0,  v71);
            }

            id v40 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v79,  v84,  16LL);
          }

          while (v40);
        }
      }
    }

    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsConnecting, "objectForKey:", v10));
    uint64_t v48 = OSLogHandleForTransportCategory("WPLinkManager");
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      [v47 timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      v86 = v74;
      __int16 v87 = 2048;
      double v88 = fabs(v50);
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "   * Connect for %@ time was: %f",  buf,  0x16u);
    }

    uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
    if ((_DWORD)v52)
    {
      if (_IDSShouldLogTransport(v52))
      {
        [v47 timeIntervalSinceNow];
        double v72 = fabs(v53);
        v71 = v74;
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"   * Connect for %@ time was: %f");
        if (_IDSShouldLog(0LL, @"WPLinkManager"))
        {
          objc_msgSend(v47, "timeIntervalSinceNow", v74, *(void *)&v72);
          double v72 = fabs(v54);
          v71 = v74;
          _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"   * Connect for %@ time was: %f");
        }
      }
    }

    -[NSMutableDictionary removeObjectForKey:]( self->_linkIDsConnecting,  "removeObjectForKey:",  v10,  v71,  *(void *)&v72);
    if (!-[NSMutableDictionary count](self->_linkIDsConnecting, "count"))
    {
      linkIDsConnecting = self->_linkIDsConnecting;
      self->_linkIDsConnecting = 0LL;
    }

    [v47 timeIntervalSinceNow];
    double v57 = ceil(fabs(v56) * 1000.0);
    if (v9)
    {
      id v58 = [[IDSWiProxConnectionFailedMetric alloc] initWithDuration:(unint64_t)v57];
      id v59 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v59 logMetric:v58];

      IMSubmitSimpleAWDMetric(2555906LL, (uint64_t)v57);
      __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  kIDSCoreAnalyticsIDSDomain,  kIDSWiProxConnectionFailureMetricName));
      IMSubmitSimpleCoreAnalyticsMetric(v60, (uint64_t)v57);
      id v61 = objc_msgSend( [IDSWiProxDidConnectToPeerMetric alloc],  "initWithDuration:resultCode:",  (unint64_t)v57,  objc_msgSend(v9, "code"));
      __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v62 logMetric:v61];

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
      objc_msgSend(v63, "IDSWiProxDidConnectToPeer:resultCode:", (uint64_t)v57, objc_msgSend(v9, "code"));
    }

    else
    {
      if (v57 == 0.0)
      {
LABEL_70:
        uint64_t v66 = OSLogHandleForTransportCategory("WPLinkManager");
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          linkIDToLink = self->_linkIDToLink;
          *(_DWORD *)buf = 138412290;
          v86 = linkIDToLink;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
        }

        uint64_t v70 = os_log_shim_legacy_logging_enabled(v69);
        if ((_DWORD)v70)
        {
          if (_IDSShouldLogTransport(v70))
          {
            _IDSLogTransport(@"WPLinkManager", @"IDS", @"links = %@");
          }
        }

        goto LABEL_77;
      }

      id v58 = [[IDSWiProxConnectionSuccessMetric alloc] initWithDuration:(unint64_t)v57];
      __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v64 logMetric:v58];

      IMSubmitSimpleAWDMetric(2555907LL, (uint64_t)v57);
      __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  kIDSCoreAnalyticsIDSDomain,  kIDSWiProxConnectionSuccessMetricName));
      IMSubmitSimpleCoreAnalyticsMetric(v60, (uint64_t)v57);
      id v61 = [[IDSWiProxDidConnectToPeerMetric alloc] initWithDuration:(unint64_t)v57 resultCode:0];
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v65 logMetric:v61];

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
      [v63 IDSWiProxDidConnectToPeer:(uint64_t)v57 resultCode:0];
    }

    goto LABEL_70;
  }

  uint64_t v25 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v86 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "didConnectToPeer was called with an invalid linkID: %@",  buf,  0xCu);
  }

  uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
  if ((_DWORD)v28)
  {
    if (_IDSShouldLogTransport(v28))
    {
      _IDSLogTransport( @"WPLinkManager",  @"IDS",  @"didConnectToPeer was called with an invalid linkID: %@");
      if (_IDSShouldLog(0LL, @"WPLinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"didConnectToPeer was called with an invalid linkID: %@");
      }
    }
  }

- (void)continuity:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary UUIDString](v9, "UUIDString"));
  id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v11));
  if (v12)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_linkIDToLink, "removeObjectForKey:", v11);
    uint64_t v13 = OSLogHandleForTransportCategory("WPLinkManager");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v52 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "linkDidDisconnect %{public}@", buf, 0xCu);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        id v44 = v12;
        _IDSLogTransport(@"WPLinkManager", @"IDS", @"linkDidDisconnect %{public}@");
        if (_IDSShouldLog(0LL, @"WPLinkManager"))
        {
          id v44 = v12;
          _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"linkDidDisconnect %{public}@");
        }
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained manager:self linkDidDisconnect:v12];

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    uint64_t v18 = self->_connectivityDelegates;
    id v19 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
    if (v19)
    {
      uint64_t v20 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * (void)i), "manager:cbuuidDidDisconnect:", self, v11, v44);
        }

        id v19 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
      }

      while (v19);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    [v22 unlockContinuityPeer:v11];
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDsDisconnecting, "objectForKey:", v11, v44));
  uint64_t v24 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    [v23 timeIntervalSinceNow];
    *(_DWORD *)buf = 138412546;
    uint64_t v52 = v9;
    __int16 v53 = 2048;
    double v54 = fabs(v26);
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "   * Disconnect for %@ time was: %f",  buf,  0x16u);
  }

  uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
  if ((_DWORD)v28)
  {
    if (_IDSShouldLogTransport(v28))
    {
      [v23 timeIntervalSinceNow];
      double v46 = fabs(v29);
      uint64_t v45 = v9;
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"   * Disconnect for %@ time was: %f");
      if (_IDSShouldLog(0LL, @"WPLinkManager"))
      {
        objc_msgSend(v23, "timeIntervalSinceNow", v9, *(void *)&v46);
        double v46 = fabs(v30);
        uint64_t v45 = v9;
        _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"   * Disconnect for %@ time was: %f");
      }
    }
  }

  -[NSMutableDictionary removeObjectForKey:]( self->_linkIDsConnecting,  "removeObjectForKey:",  v11,  v45,  *(void *)&v46,  (void)v47);
  -[NSMutableDictionary removeObjectForKey:](self->_linkIDsDisconnecting, "removeObjectForKey:", v11);
  if (!-[NSMutableDictionary count](self->_linkIDsDisconnecting, "count"))
  {
    linkIDsDisconnecting = self->_linkIDsDisconnecting;
    self->_linkIDsDisconnecting = 0LL;
  }

  if (!-[NSMutableDictionary count](self->_linkIDsConnecting, "count"))
  {
    linkIDsConnecting = self->_linkIDsConnecting;
    self->_linkIDsConnecting = 0LL;
  }

  [v23 timeIntervalSinceNow];
  double v34 = ceil(fabs(v33) * 1000.0);
  if (v10)
  {
    id v35 = objc_msgSend( [IDSWiProxDidDisconnectFromPeerMetric alloc],  "initWithDuration:resultCode:",  (unint64_t)v34,  objc_msgSend(v10, "code"));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v36 logMetric:v35];

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    objc_msgSend(v37, "IDSWiProxDidDisconnectFromPeer:resultCode:", (uint64_t)v34, objc_msgSend(v10, "code"));
  }

  else
  {
    if (v34 == 0.0) {
      goto LABEL_31;
    }
    id v35 = [[IDSWiProxDidDisconnectFromPeerMetric alloc] initWithDuration:(unint64_t)v34 resultCode:0];
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v38 logMetric:v35];

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v37 IDSWiProxDidDisconnectFromPeer:(uint64_t)v34 resultCode:0];
  }

LABEL_31:
  uint64_t v39 = OSLogHandleForTransportCategory("WPLinkManager");
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }

  uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
  if ((_DWORD)v43)
  {
    if (_IDSShouldLogTransport(v43))
    {
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"links = %@");
    }
  }
}

- (void)continuity:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = OSLogHandleForIDSCategory("WPLinkManager-oversize");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "didSendData to:%{public}@ error:%{public}@ data:%{public}@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v16)
    && _IDSShouldLog(0LL, @"WPLinkManager-oversize"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager-oversize",  @"didSendData to:%{public}@ error:%{public}@ data:%{public}@");
  }

  id v17 = objc_msgSend( [IDSWiProxDidSendDataMetric alloc],  "initWithResultCode:",  objc_msgSend(v13, "code"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v18 logMetric:v17];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
  objc_msgSend(v19, "IDSWiProxDidSendData:", objc_msgSend(v13, "code"));

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v20));
  [v21 setHasSpaceAvailable:1];
}

- (void)continuity:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  uint64_t v12 = OSLogHandleForIDSCategory("WPLinkManager-oversize");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v24 = v11;
    __int16 v25 = 2114;
    __int16 v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "didReceiveData from:%{public}@ data:%{public}@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14)
    && _IDSShouldLog(0LL, @"WPLinkManager-oversize"))
  {
    uint64_t v21 = v11;
    id v22 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager-oversize",  @"didReceiveData from:%{public}@ data:%{public}@");
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v11, v21, v22));
  uint64_t v16 = v15;
  if (v15)
  {
    [v15 didReceiveData:v9];
  }

  else
  {
    uint64_t v17 = OSLogHandleForIDSCategory("WPLinkManager");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      linkIDToLink = self->_linkIDToLink;
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v11;
      __int16 v25 = 2112;
      __int16 v26 = linkIDToLink;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "missing peer:%@ links:%@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v20)
      && _IDSShouldLog(0LL, @"WPLinkManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"WPLinkManager", @"missing peer:%@ links:%@");
    }
  }
}

- (void)sendReset
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 broadcasterForEntitlement:kIDSContinuityEntitlement messageContext:0]);

  uint64_t v5 = OSLogHandleForTransportCategory("WPLinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reseting client states", buf, 2u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"Reseting client states");
    }
  }

  uint64_t v9 = OSLogHandleForTransportCategory("WPLinkManager");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "Resetting";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "   calling continuityDidUpdateStateToState:%s",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      id v23 = "Resetting";
      _IDSLogTransport(@"WPLinkManager", @"IDS", @"   calling continuityDidUpdateStateToState:%s");
      if (_IDSShouldLog(0LL, @"WPLinkManager"))
      {
        id v23 = "Resetting";
        _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"   calling continuityDidUpdateStateToState:%s");
      }
    }
  }

  objc_msgSend(v4, "continuityDidUpdateStateToState:", 1, v23);
  uint64_t v13 = OSLogHandleForTransportCategory("WPLinkManager");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 3) {
      uint64_t v16 = "UnexpectedState";
    }
    else {
      uint64_t v16 = (&off_1008FBAF0)[state];
    }
    *(_DWORD *)buf = 136315138;
    __int16 v26 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "   calling continuityDidUpdateStateToState:%s",  buf,  0xCu);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18 && _IDSShouldLogTransport(v18))
  {
    unint64_t v19 = self->_state;
    uint64_t v20 = v19 > 3 ? "UnexpectedState" : (&off_1008FBAF0)[v19];
    __int16 v24 = v20;
    _IDSLogTransport(@"WPLinkManager", @"IDS", @"   calling continuityDidUpdateStateToState:%s");
    if (_IDSShouldLog(0LL, @"WPLinkManager"))
    {
      unint64_t v21 = self->_state;
      if (v21 > 3) {
        id v22 = "UnexpectedState";
      }
      else {
        id v22 = (&off_1008FBAF0)[v21];
      }
      __int16 v24 = (void *)v22;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"WPLinkManager",  @"   calling continuityDidUpdateStateToState:%s");
    }
  }

  objc_msgSend(v4, "continuityDidUpdateStateToState:", self->_state, v24);
}

- (void).cxx_destruct
{
}

@end