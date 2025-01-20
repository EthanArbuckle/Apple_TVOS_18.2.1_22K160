@interface IDSBTLinkManager
- (BOOL)isPoweredOn;
- (IDSBTLinkManager)initWithDelegate:(id)a3 pairedDevice:(id)a4;
- (IDSNanoRegistryPluginManager)idsNRPluginManager;
- (NSString)pairedDevice;
- (id)nanoRegistryPluginManager;
- (void)_advertiseNow;
- (void)_connectNow;
- (void)_stopAdvertising;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)obliterateConnectionInfo;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)removeLink:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setIdsNRPluginManager:(id)a3;
- (void)setLinkPreferences:(id)a3;
- (void)start;
- (void)startDatagramLink;
- (void)startDatagramLinkWithEndpointIdentifier:(id)a3;
- (void)startDatagramLinkWithName:(id)a3;
- (void)stop;
- (void)stopDatagramLink;
- (void)stopDatagramLinkWithEndpointIdentifier:(id)a3;
- (void)stopDatagramLinkWithName:(id)a3;
- (void)updatePairedDevice:(id)a3;
@end

@implementation IDSBTLinkManager

- (IDSBTLinkManager)initWithDelegate:(id)a3 pairedDevice:(id)a4
{
  id v6 = a3;
  v7 = (IDSBTLinkManager *)a4;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___IDSBTLinkManager;
  v8 = -[IDSBTLinkManager init](&v53, "init");
  if (!v8)
  {
LABEL_27:
    v46 = v8;
    goto LABEL_35;
  }

  uint64_t v9 = OSLogHandleForTransportCategory("BTLinkManager");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "============= New BTLinkManager %@ starting =============",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      v52 = v8;
      _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"============= New BTLinkManager %@ starting =============");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        v52 = v8;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"============= New BTLinkManager %@ starting =============");
      }
    }
  }

  if (v7)
  {
    uint64_t v13 = OSLogHandleForTransportCategory("BTLinkManager");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "using %@ UUID from LinkManager", buf, 0xCu);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        v52 = v7;
        _IDSLogTransport(@"BTLinkManager", @"IDS", @"using %@ UUID from LinkManager");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          v52 = v7;
          _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"using %@ UUID from LinkManager");
        }
      }
    }

    v17 = (NSString *)-[IDSBTLinkManager copy](v7, "copy", v52);
    pipePeripheralUUIDString = v8->_pipePeripheralUUIDString;
    v8->_pipePeripheralUUIDString = v17;

    IMSetDomainValueForKey(@"com.apple.ids", @"PipePeripheralUUID", v7);
  }

  else
  {
    uint64_t v19 = IMGetDomainValueForKey(@"com.apple.ids", @"PipePeripheralUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (NSString *)[v20 copy];
    v22 = v8->_pipePeripheralUUIDString;
    v8->_pipePeripheralUUIDString = v21;

    uint64_t v23 = OSLogHandleForTransportCategory("BTLinkManager");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v8->_pipePeripheralUUIDString;
      *(_DWORD *)buf = 138412290;
      v55 = (IDSBTLinkManager *)v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "read pipe peripheral UUID from default: %@",  buf,  0xCu);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        v52 = (IDSBTLinkManager *)v8->_pipePeripheralUUIDString;
        _IDSLogTransport(@"BTLinkManager", @"IDS", @"read pipe peripheral UUID from default: %@");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          v52 = (IDSBTLinkManager *)v8->_pipePeripheralUUIDString;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"read pipe peripheral UUID from default: %@");
        }
      }
    }
  }

  if (v8->_pipePeripheralUUIDString)
  {
    uint64_t v28 = IMGetDomainValueForKey(@"com.apple.ids", @"UseSkywalkChannelToBTServer");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = IMGetDomainValueForKey(@"com.apple.ids", @"UseSkywayChannelToBTServer");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = v29;
    if (v29 || (v32 = v31) != 0LL) {
      unsigned __int8 v33 = objc_msgSend(v32, "BOOLValue", v52);
    }
    else {
      unsigned __int8 v33 = 1;
    }
    v8->_useSkywalkChannel = v33;
    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->_isPipeConnectingOrConnected = 0;
    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    linkIDToLink = v8->_linkIDToLink;
    v8->_linkIDToLink = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    linkIDToDatagramLink = v8->_linkIDToDatagramLink;
    v8->_linkIDToDatagramLink = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    datagramPipeRegistration = v8->_datagramPipeRegistration;
    v8->_datagramPipeRegistration = v38;

    dispatch_queue_attr_t v40 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v40);
    dispatch_queue_attr_t v42 = dispatch_queue_attr_make_with_qos_class(v41, QOS_CLASS_USER_INITIATED, 0);
    v43 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v42);
    dispatch_queue_t v44 = dispatch_queue_create("IDSBTLinkManager", v43);
    managerQueue = v8->_managerQueue;
    v8->_managerQueue = (OS_dispatch_queue *)v44;

    goto LABEL_27;
  }

  uint64_t v47 = OSLogHandleForTransportCategory("BTLinkManager");
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "pipe peripheral UUID is nil!  Not setting up BTLinkManager",  buf,  2u);
  }

  uint64_t v50 = os_log_shim_legacy_logging_enabled(v49);
  if ((_DWORD)v50)
  {
    if (_IDSShouldLogTransport(v50))
    {
      _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"pipe peripheral UUID is nil!  Not setting up BTLinkManager");
      if (_IDSShouldLog(0LL, @"BTLinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"pipe peripheral UUID is nil!  Not setting up BTLinkManager");
      }
    }
  }

  v46 = 0LL;
LABEL_35:

  return v46;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForTransportCategory("BTLinkManager");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "============= Old BTLinkManager %@ stopping =============",  buf,  0xCu);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      v7 = self;
      _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"============= Old BTLinkManager %@ stopping =============");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        v7 = self;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"============= Old BTLinkManager %@ stopping =============");
      }
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSBTLinkManager;
  -[IDSBTLinkManager dealloc](&v8, "dealloc", v7);
}

- (void)_advertiseNow
{
  if (-[CBPeripheralManager state](self->_peripheralManager, "state") == (id)5 && !self->_isAdvertising)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("BTLinkManager");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      peripheralManager = self->_peripheralManager;
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = peripheralManager;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ start advertising empty now", buf, 0xCu);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7 && _IDSShouldLogTransport(v7))
    {
      v10 = self->_peripheralManager;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ start advertising empty now");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        v10 = self->_peripheralManager;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ start advertising empty now");
      }
    }

    p_peripheralManager = &self->_peripheralManager;
    -[CBPeripheralManager startAdvertising:](self->_peripheralManager, "startAdvertising:", 0LL, v10);
    self->_isAdvertising = 1;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSBTLinkManager nanoRegistryPluginManager](self, "nanoRegistryPluginManager"));
    [v9 notifyWatchDidStartAdvertisingWithPeripheralManager:*p_peripheralManager];
  }

- (void)_stopAdvertising
{
  if (self->_isAdvertising)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("BTLinkManager");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stop advertising", v8, 2u);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6)
    {
      if (_IDSShouldLogTransport(v6))
      {
        _IDSLogTransport(@"BTLinkManager", @"IDS", @"stop advertising");
      }
    }

    self->_isAdvertising = 0;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSBTLinkManager nanoRegistryPluginManager](self, "nanoRegistryPluginManager"));
    [v7 notifyWatchDidStopAdvertisingWithPeripheralManager:self->_peripheralManager];
  }

- (void)_connectNow
{
  if (!self->_isCentral
    && self->_pipeRegistered
    && -[CBCentralManager state](self->_centralManager, "state") == (id)5
    && !self->_isPipeConnectingOrConnected)
  {
    if (self->_pipePeripheral) {
      goto LABEL_24;
    }
    uint64_t v3 = OSLogHandleForTransportCategory("BTLinkManager");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      pipePeripheralUUIDString = self->_pipePeripheralUUIDString;
      *(_DWORD *)buf = 138412290;
      v32 = (CBPeripheral *)pipePeripheralUUIDString;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using pipe peripheral UUID %@", buf, 0xCu);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7)
    {
      if (_IDSShouldLogTransport(v7))
      {
        v29 = (CBPeripheral *)self->_pipePeripheralUUIDString;
        _IDSLogTransport(@"BTLinkManager", @"IDS", @"using pipe peripheral UUID %@");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          v29 = (CBPeripheral *)self->_pipePeripheralUUIDString;
          _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"using pipe peripheral UUID %@");
        }
      }
    }

    objc_super v8 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  self->_pipePeripheralUUIDString);
    uint64_t v9 = v8;
    if (v8)
    {
      centralManager = self->_centralManager;
      uint64_t v30 = v8;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[CBCentralManager retrievePeripheralsWithIdentifiers:]( centralManager,  "retrievePeripheralsWithIdentifiers:",  v11));

      if (v12 && [v12 count])
      {
        uint64_t v13 = (CBPeripheral *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
        pipePeripheral = self->_pipePeripheral;
        self->_pipePeripheral = v13;

        uint64_t v15 = OSLogHandleForTransportCategory("BTLinkManager");
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = self->_pipePeripheral;
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "created pipe peripheral %@", buf, 0xCu);
        }

        uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
        if ((_DWORD)v19)
        {
          if (_IDSShouldLogTransport(v19))
          {
            v29 = self->_pipePeripheral;
            _IDSLogTransport(@"BTLinkManager", @"IDS", @"created pipe peripheral %@");
            if (_IDSShouldLog(0LL, @"BTLinkManager"))
            {
              v29 = self->_pipePeripheral;
              _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"created pipe peripheral %@");
            }
          }
        }
      }
    }

    if (self->_pipePeripheral)
    {
LABEL_24:
      uint64_t v20 = OSLogHandleForTransportCategory("BTLinkManager");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_pipePeripheral;
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "connecting to %@", buf, 0xCu);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24 && _IDSShouldLogTransport(v24))
      {
        v29 = self->_pipePeripheral;
        _IDSLogTransport(@"BTLinkManager", @"IDS", @"connecting to %@");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          v29 = self->_pipePeripheral;
          _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"connecting to %@");
        }
      }

      -[CBCentralManager connectPeripheral:options:]( self->_centralManager,  "connectPeripheral:options:",  self->_pipePeripheral,  0LL,  v29);
      self->_isPipeConnectingOrConnected = 1;
    }

    else
    {
      uint64_t v25 = OSLogHandleForTransportCategory("BTLinkManager");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "pipe peripheral is not set. Not connecting",  buf,  2u);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          _IDSLogTransport(@"BTLinkManager", @"IDS", @"pipe peripheral is not set. Not connecting");
          if (_IDSShouldLog(0LL, @"BTLinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"pipe peripheral is not set. Not connecting");
          }
        }
      }
    }
  }

- (void)start
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A9D0C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)stop
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A9E00;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)connect
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AA078;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)removeLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 linkID]);
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AA128;
  block[3] = &unk_1008F5F58;
  id v10 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(managerQueue, block);
}

- (void)updatePairedDevice:(id)a3
{
  id v4 = a3;
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002AA2F8;
  v7[3] = &unk_1008F5F80;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)obliterateConnectionInfo
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AAE58;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002AB050;
  v7[3] = &unk_1008F5F80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)startDatagramLink
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AB508;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)stopDatagramLink
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002AB5BC;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)startDatagramLinkWithName:(id)a3
{
  id v4 = a3;
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002AB694;
  v7[3] = &unk_1008F5F80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)stopDatagramLinkWithName:(id)a3
{
  id v4 = a3;
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002AB764;
  v7[3] = &unk_1008F5F80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(managerQueue, v7);
}

- (void)startDatagramLinkWithEndpointIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v4));
  id v6 = (char *)[v5 unsignedIntegerValue];

  id v7 = v6 + 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6 + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_datagramPipeRegistration,  "setObject:forKeyedSubscript:",  v8,  v4);

  if (self->_pipeRegistered)
  {
    if (v6)
    {
      uint64_t v9 = OSLogHandleForTransportCategory("BTLinkManager");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v31 = v4;
        *(_WORD *)&v31[8] = 1024;
        *(_DWORD *)&v31[10] = (_DWORD)v6;
        __int16 v32 = 1024;
        int v33 = (_DWORD)v6 + 1;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not registering datagram link endpoint %@ registrationCount %u => %u",  buf,  0x18u);
      }

      uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
      if ((_DWORD)v12)
      {
        if (_IDSShouldLogTransport(v12))
        {
          _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Not registering datagram link endpoint %@ registrationCount %u => %u");
          if (_IDSShouldLog(0LL, @"BTLinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Not registering datagram link endpoint %@ registrationCount %u => %u");
          }
        }
      }
    }

    else
    {
      BOOL isCentral = self->_isCentral;
      BOOL v18 = !self->_isCentral;
      uint64_t v19 = OSLogHandleForTransportCategory("BTLinkManager");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = !isCentral;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v4;
        __int16 v32 = 1024;
        int v33 = (int)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Registering datagram link type %d endpoint %@ registrationCount 0 => %u",  buf,  0x18u);
      }

      uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
      if ((_DWORD)v22)
      {
        if (_IDSShouldLogTransport(v22))
        {
          id v26 = v4;
          uint64_t v27 = v7;
          BOOL v25 = !isCentral;
          _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Registering datagram link type %d endpoint %@ registrationCount 0 => %u");
          if (_IDSShouldLog(0LL, @"BTLinkManager"))
          {
            id v26 = v4;
            uint64_t v27 = v7;
            BOOL v25 = !isCentral;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Registering datagram link type %d endpoint %@ registrationCount 0 => %u");
          }
        }
      }

      pipeManager = self->_pipeManager;
      uint64_t v28 = CBScalablePipeOptionTransport;
      v29 = &off_1009478D8;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL,  v25,  v26,  v27));
      -[CBScalablePipeManager registerEndpoint:type:priority:options:]( pipeManager,  "registerEndpoint:type:priority:options:",  v4,  v18,  3LL,  v24);
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("BTLinkManager");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot start datagram link if regular pipe not registered",  buf,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Cannot start datagram link if regular pipe not registered");
        if (_IDSShouldLog(0LL, @"BTLinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Cannot start datagram link if regular pipe not registered");
        }
      }
    }
  }
}

- (void)stopDatagramLinkWithEndpointIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v4));
  id v6 = (char *)[v5 unsignedIntegerValue];

  if (v6 == (char *)1)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_datagramPipeRegistration,  "setObject:forKeyedSubscript:",  0LL,  v4);
    uint64_t v11 = OSLogHandleForTransportCategory("BTLinkManager");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v4;
      __int16 v25 = 1024;
      int v26 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unregistering datagram link endpoint %@ registrationCount %u => 0",  buf,  0x12u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        id v20 = v4;
        uint64_t v21 = 1LL;
        _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Unregistering datagram link endpoint %@ registrationCount %u => 0");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          id v20 = v4;
          uint64_t v21 = 1LL;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Unregistering datagram link endpoint %@ registrationCount %u => 0");
        }
      }
    }

    -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v4, v20, v21);
  }

  else if (v6)
  {
    uint64_t v15 = OSLogHandleForTransportCategory("BTLinkManager");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v4;
      __int16 v25 = 1024;
      int v26 = (int)v6;
      __int16 v27 = 1024;
      int v28 = (_DWORD)v6 - 1;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not unregistering datagram link endpoint %@ registrationCount %u => %u",  buf,  0x18u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        uint64_t v21 = (uint64_t)v6;
        uint64_t v22 = ((_DWORD)v6 - 1);
        id v20 = v4;
        _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Not unregistering datagram link endpoint %@ registrationCount %u => %u");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          uint64_t v21 = (uint64_t)v6;
          uint64_t v22 = ((_DWORD)v6 - 1);
          id v20 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Not unregistering datagram link endpoint %@ registrationCount %u => %u");
        }
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v6 - 1,  v20,  v21,  v22));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_datagramPipeRegistration,  "setObject:forKeyedSubscript:",  v19,  v4);
  }

  else
  {
    uint64_t v7 = OSLogHandleForTransportCategory("BTLinkManager");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cannot unregister datagram link endpoint %@ - not registered",  buf,  0xCu);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Cannot unregister datagram link endpoint %@ - not registered");
        if (_IDSShouldLog(0LL, @"BTLinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Cannot unregister datagram link endpoint %@ - not registered");
        }
      }
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("BTLinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5)
    {
      uint64_t v7 = "UnexpectedState";
    }

    else
    {
      uint64_t v7 = (&_centralManagerStateStrings)[(void)[v4 state]];
    }

    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2080;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    uint64_t v10 = ((unint64_t)[v4 state] & 0x8000000000000000) != 0
       || (uint64_t)[v4 state] > 5
        ? "UnexpectedState"
        : (&_centralManagerStateStrings)[(void)[v4 state]];
    id v13 = v4;
    uint64_t v14 = v10;
    _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didUpdateState %s");
    if (_IDSShouldLog(0LL, @"BTLinkManager"))
    {
      if (((unint64_t)objc_msgSend(v4, "state", v4, v14) & 0x8000000000000000) != 0
        || (uint64_t)[v4 state] > 5)
      {
        uint64_t v11 = "UnexpectedState";
      }

      else
      {
        uint64_t v11 = (&_centralManagerStateStrings)[(void)[v4 state]];
      }

      id v13 = v4;
      uint64_t v14 = (void *)v11;
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didUpdateState %s");
    }
  }

  if (objc_msgSend(v4, "state", v13, v14) == (id)5)
  {
    -[IDSBTLinkManager _connectNow](self, "_connectNow");
  }

  else if ((uint64_t)[v4 state] <= 4)
  {
    self->_isPipeConnectingOrConnected = 0;
    if ((uint64_t)[v4 state] <= 3)
    {
      pipePeripheral = self->_pipePeripheral;
      self->_pipePeripheral = 0LL;
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForTransportCategory("BTLinkManager");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ didConnectPeripheral %@", buf, 0x16u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didConnectPeripheral %@");
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v8 = (NSMutableDictionary *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("BTLinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ didFailToConnectPeripheral %@ err %@",  buf,  0x20u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v20 = v9;
      id v21 = v10;
      uint64_t v19 = v8;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didFailToConnectPeripheral %@ err %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        id v20 = v9;
        id v21 = v10;
        uint64_t v19 = v8;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didFailToConnectPeripheral %@ err %@");
      }
    }
  }

  self->_isPipeConnectingOrConnected = 0;
  -[IDSBTLinkManager _connectNow](self, "_connectNow", v19, v20, v21);
  uint64_t v15 = OSLogHandleForIDSCategory("BTLinkManager");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v8 = (NSMutableDictionary *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("BTLinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ didDisconnectPeripheral %@ err %@",  buf,  0x20u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v20 = v9;
      id v21 = v10;
      uint64_t v19 = v8;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didDisconnectPeripheral %@ err %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        id v20 = v9;
        id v21 = v10;
        uint64_t v19 = v8;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didDisconnectPeripheral %@ err %@");
      }
    }
  }

  self->_isPipeConnectingOrConnected = 0;
  -[IDSBTLinkManager _connectNow](self, "_connectNow", v19, v20, v21);
  uint64_t v15 = OSLogHandleForIDSCategory("BTLinkManager");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    linkIDToLink = self->_linkIDToLink;
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = linkIDToLink;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("BTLinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 5)
    {
      uint64_t v7 = "UnexpectedState";
    }

    else
    {
      uint64_t v7 = (&_peripheralManagerStateStrings)[(void)[v4 state]];
    }

    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2080;
    __int16 v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    id v10 = ((unint64_t)[v4 state] & 0x8000000000000000) != 0
       || (uint64_t)[v4 state] > 5
        ? "UnexpectedState"
        : (&_peripheralManagerStateStrings)[(void)[v4 state]];
    id v12 = v4;
    uint64_t v13 = v10;
    _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didUpdateState %s");
    if (_IDSShouldLog(0LL, @"BTLinkManager"))
    {
      if (((unint64_t)objc_msgSend(v4, "state", v4, v13) & 0x8000000000000000) != 0
        || (uint64_t)[v4 state] > 5)
      {
        uint64_t v11 = "UnexpectedState";
      }

      else
      {
        uint64_t v11 = (&_peripheralManagerStateStrings)[(void)[v4 state]];
      }

      id v12 = v4;
      uint64_t v13 = (void *)v11;
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didUpdateState %s");
    }
  }

  if (objc_msgSend(v4, "state", v12, v13) == (id)5)
  {
    -[IDSBTLinkManager _advertiseNow](self, "_advertiseNow");
  }

  else if ((uint64_t)[v4 state] <= 4 && (uint64_t)objc_msgSend(v4, "state") <= 3)
  {
    self->_isAdvertising = 0;
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("BTLinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ didStartAdvertising error %@", buf, 0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"BTLinkManager", @"IDS", @"%@ didStartAdvertising error %@");
    }
  }

  if (v7) {
    self->_isAdvertising = 0;
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  v54 = (__CFString *)a3;
  uint64_t v4 = OSLogHandleForTransportCategory("BTLinkManager");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)-[__CFString state](v54, "state") & 0x8000000000000000LL) != 0
      || (uint64_t)-[__CFString state](v54, "state") > 5)
    {
      id v6 = "UnexpectedState";
    }

    else
    {
      id v6 = (&off_1008FF8D8)[(void)-[__CFString state](v54, "state")];
    }

    *(_DWORD *)buf = 136315138;
    v63 = (const __CFString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Pipe did update state: %s", buf, 0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
  {
    uint64_t v9 = ((unint64_t)-[__CFString state](v54, "state") & 0x8000000000000000LL) != 0
      || (uint64_t)-[__CFString state](v54, "state") > 5
       ? "UnexpectedState"
       : (&off_1008FF8D8)[(void)-[__CFString state](v54, "state")];
    uint64_t v49 = (__CFString *)v9;
    _IDSLogTransport(@"BTLinkManager", @"IDS", @" => Pipe did update state: %s");
    if (_IDSShouldLog(0LL, @"BTLinkManager"))
    {
      if (((unint64_t)-[__CFString state](v54, "state", v49) & 0x8000000000000000LL) != 0
        || (uint64_t)-[__CFString state](v54, "state") > 5)
      {
        uint64_t v10 = "UnexpectedState";
      }

      else
      {
        uint64_t v10 = (&off_1008FF8D8)[(void)-[__CFString state](v54, "state")];
      }

      uint64_t v49 = (__CFString *)v10;
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @" => Pipe did update state: %s");
    }
  }

  uint64_t v11 = OSLogHandleForIDSCategory("BTLinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)-[__CFString state](v54, "state") & 0x8000000000000000LL) != 0
      || (uint64_t)-[__CFString state](v54, "state") > 5)
    {
      id v13 = "UnexpectedState";
    }

    else
    {
      id v13 = (&off_1008FF8D8)[(void)-[__CFString state](v54, "state")];
    }

    *(_DWORD *)buf = 138412546;
    v63 = v54;
    __int16 v64 = 2080;
    v65 = (const __CFString *)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ didUpdateState %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"BTLinkManager"))
  {
    if (((unint64_t)-[__CFString state](v54, "state") & 0x8000000000000000LL) != 0
      || (uint64_t)-[__CFString state](v54, "state") > 5)
    {
      id v15 = "UnexpectedState";
    }

    else
    {
      id v15 = (&off_1008FF8D8)[(void)-[__CFString state](v54, "state")];
    }

    v51 = v15;
    uint64_t v49 = v54;
    _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didUpdateState %s");
  }

  if (-[__CFString state](v54, "state", v49, v51) == (id)5)
  {
    if (!self->_pipeRegistered)
    {
      BOOL isCentral = self->_isCentral;
      BOOL v17 = !self->_isCentral;
      uint64_t v18 = OSLogHandleForIDSCategory("BTLinkManager");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = @"Client";
        if (!self->_isCentral) {
          id v20 = @"Server";
        }
        *(_DWORD *)buf = 138412802;
        v63 = v54;
        __int16 v64 = 2112;
        v65 = @"com.apple.ids";
        __int16 v66 = 2112;
        v67 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ registering for service %@ as %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v21)
        && _IDSShouldLog(0LL, @"BTLinkManager"))
      {
        if (self->_isCentral) {
          uint64_t v22 = @"Client";
        }
        else {
          uint64_t v22 = @"Server";
        }
        v52 = @"com.apple.ids";
        objc_super v53 = v22;
        uint64_t v50 = v54;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ registering for service %@ as %@");
      }

      uint64_t v23 = OSLogHandleForTransportCategory("BTLinkManager");
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = @"Client";
        if (!isCentral) {
          id v25 = @"Server";
        }
        BOOL useSkywalkChannel = self->_useSkywalkChannel;
        *(_DWORD *)buf = 138412802;
        v63 = @"com.apple.ids";
        __int16 v64 = 2112;
        v65 = v25;
        if (useSkywalkChannel) {
          id v27 = @"skywalk";
        }
        else {
          id v27 = @"nsstream";
        }
        __int16 v66 = 2112;
        v67 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Register endpoint identifier: %@  type: %@  priority: Medium pipeTransport: %@",  buf,  0x20u);
      }

      uint64_t v29 = os_log_shim_legacy_logging_enabled(v28);
      if ((_DWORD)v29 && _IDSShouldLogTransport(v29))
      {
        uint64_t v30 = isCentral ? @"Client" : @"Server";
        v31 = self->_useSkywalkChannel ? @"skywalk" : @"nsstream";
        v52 = v30;
        objc_super v53 = v31;
        uint64_t v50 = @"com.apple.ids";
        _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Register endpoint identifier: %@  type: %@  priority: Medium pipeTransport: %@");
        if (_IDSShouldLog(0LL, @"BTLinkManager"))
        {
          if (self->_useSkywalkChannel) {
            __int16 v32 = @"skywalk";
          }
          else {
            __int16 v32 = @"nsstream";
          }
          v52 = v30;
          objc_super v53 = v32;
          uint64_t v50 = @"com.apple.ids";
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Register endpoint identifier: %@  type: %@  priority: Medium pipeTransport: %@");
        }
      }

      BOOL v33 = self->_useSkywalkChannel;
      uint64_t v60 = CBScalablePipeOptionTransport;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v33, v50, v52, v53));
      v61 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
      -[__CFString registerEndpoint:type:priority:options:]( v54,  "registerEndpoint:type:priority:options:",  @"com.apple.ids",  v17,  1LL,  v35);
    }

    self->_isPoweredOn = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained manager:self didPowerStateChange:1];
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](self->_linkIDToLink, "removeAllObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_datagramPipeRegistration, "allKeys"));
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id WeakRetained = v37;
    id v38 = [WeakRetained countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v56 != v39) {
            objc_enumerationMutation(WeakRetained);
          }
          v41 = *(const __CFString **)(*((void *)&v55 + 1) + 8LL * (void)i);
          uint64_t v42 = OSLogHandleForTransportCategory("BTLinkManager");
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v44 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v41));
            *(_DWORD *)buf = 138412546;
            v63 = v41;
            __int16 v64 = 2112;
            v65 = v44;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Unregistering datagram link endpoint %@ registrationCount %@",  buf,  0x16u);
          }

          uint64_t v46 = os_log_shim_legacy_logging_enabled(v45);
          if ((_DWORD)v46)
          {
            if (_IDSShouldLogTransport(v46))
            {
              uint64_t v50 = v41;
              v52 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v41));
              _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Unregistering datagram link endpoint %@ registrationCount %@");

              if (_IDSShouldLog(0LL, @"BTLinkManager"))
              {
                uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v41,  v41,  v52));
                uint64_t v50 = v41;
                v52 = v47;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Unregistering datagram link endpoint %@ registrationCount %@");
              }
            }
          }

          -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v41, v50, v52);
        }

        id v38 = [WeakRetained countByEnumeratingWithState:&v55 objects:v59 count:16];
      }

      while (v38);
    }

    self->_isPoweredOn = 0;
    id v48 = objc_loadWeakRetained((id *)&self->_delegate);
    [v48 manager:self didPowerStateChange:0];
  }

LABEL_83:
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("BTLinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  " => Pipe did register endpoint: %@  error: %@",  buf,  0x16u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v18 = v9;
      id v19 = v10;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @" => Pipe did register endpoint: %@  error: %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        id v18 = v9;
        id v19 = v10;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @" => Pipe did register endpoint: %@  error: %@");
      }
    }
  }

  uint64_t v15 = OSLogHandleForIDSCategory("BTLinkManager");
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ didRegisterEndpoint id %@ err %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v17) && _IDSShouldLog(0LL, @"BTLinkManager"))
  {
    id v19 = v9;
    id v20 = v10;
    id v18 = v8;
    _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didRegisterEndpoint id %@ err %@");
  }

  self->_pipeRegistered = 1;
  -[IDSBTLinkManager _connectNow](self, "_connectNow", v18, v19, v20);
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6 = (__CFString *)a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = OSLogHandleForTransportCategory("BTLinkManager");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  " => Pipe did unregister endpoint: %@",  buf,  0xCu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      uint64_t v29 = v7;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @" => Pipe did unregister endpoint: %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        uint64_t v29 = v7;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @" => Pipe did unregister endpoint: %@");
      }
    }
  }

  uint64_t v12 = OSLogHandleForIDSCategory("BTLinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    __int16 v36 = 2112;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ didUnregisterEndpoint id %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"BTLinkManager"))
  {
    uint64_t v29 = v6;
    v31 = v7;
    _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ didUnregisterEndpoint id %@");
  }

  if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"com.apple.ids", v29, v31))
  {
    BOOL isCentral = self->_isCentral;
    BOOL v16 = !self->_isCentral;
    uint64_t v17 = OSLogHandleForIDSCategory("BTLinkManager");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = self->_isCentral;
      *(_DWORD *)buf = 138412802;
      if (v19) {
        id v20 = @"Client";
      }
      else {
        id v20 = @"Server";
      }
      v35 = v6;
      __int16 v36 = 2112;
      v37 = @"com.apple.ids";
      __int16 v38 = 2112;
      uint64_t v39 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ re-registering for service %@ as %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v21)
      && _IDSShouldLog(0LL, @"BTLinkManager"))
    {
      if (self->_isCentral) {
        id v22 = @"Client";
      }
      else {
        id v22 = @"Server";
      }
      __int16 v32 = @"com.apple.ids";
      BOOL v33 = v22;
      uint64_t v30 = v6;
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ re-registering for service %@ as %@");
    }

    uint64_t v23 = OSLogHandleForTransportCategory("BTLinkManager");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = @"Client";
      if (!isCentral) {
        __int16 v25 = @"Server";
      }
      *(_DWORD *)buf = 138412546;
      v35 = @"com.apple.ids";
      __int16 v36 = 2112;
      v37 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Re-register endpoint identifier: %@  type: %@  priority: Medium",  buf,  0x16u);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27 && _IDSShouldLogTransport(v27))
    {
      if (isCentral) {
        uint64_t v28 = @"Client";
      }
      else {
        uint64_t v28 = @"Server";
      }
      uint64_t v30 = @"com.apple.ids";
      __int16 v32 = v28;
      _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Re-register endpoint identifier: %@  type: %@  priority: Medium");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        uint64_t v30 = @"com.apple.ids";
        __int16 v32 = v28;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Re-register endpoint identifier: %@  type: %@  priority: Medium");
      }
    }

    -[__CFString registerEndpoint:type:priority:options:]( v6,  "registerEndpoint:type:priority:options:",  @"com.apple.ids",  v16,  1LL,  0LL,  v30,  v32,  v33);
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v86 = a3;
  id v87 = a4;
  uint64_t v6 = OSLogHandleForTransportCategory("BTLinkManager");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v96 = v87;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " => Pipe did connect: %@", buf, 0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v77 = v87;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @" => Pipe did connect: %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        id v77 = v87;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @" => Pipe did connect: %@");
      }
    }
  }

  uint64_t v10 = OSLogHandleForIDSCategory("BTLinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v96 = v86;
    *(_WORD *)&v96[8] = 2112;
    *(void *)&v96[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ pipeDidConnect %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"BTLinkManager"))
  {
    id v77 = v86;
    id v80 = v87;
    _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ pipeDidConnect %@");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "name", v77, v80));
  unsigned int v14 = [v13 hasPrefix:@"com.apple.ids.datagram"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v87 name]);
  unsigned int v16 = [v15 isEqualToString:@"com.apple.ids"];

  if (v16 | v14)
  {
    uint64_t v17 = OSLogHandleForIDSCategory("BTLinkManager");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v87 name]);
      *(_DWORD *)buf = 138412546;
      *(void *)v96 = v86;
      *(_WORD *)&v96[8] = 2112;
      *(void *)&v96[10] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ got a new pipe for service %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v20)
      && _IDSShouldLog(0LL, @"BTLinkManager"))
    {
      id v78 = v86;
      v81 = (void *)objc_claimAutoreleasedReturnValue([v87 name]);
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ got a new pipe for service %@");
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "peer", v78, v81));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
    v85 = (IDSBTDatagramLink *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);

    if (!v85)
    {
      uint64_t v28 = OSLogHandleForTransportCategory("BTLinkManager");
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "pipe UUID is nil", buf, 2u);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          _IDSLogTransport(@"BTLinkManager", @"IDS", @"pipe UUID is nil");
        }
      }

      goto LABEL_95;
    }

    if (-[NSString isEqualToString:](self->_pipePeripheralUUIDString, "isEqualToString:", @"LOCAL-SETUP-STARTED"))
    {
      uint64_t v23 = OSLogHandleForTransportCategory("BTLinkManager");
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v96 = v85;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "pipe UUID is not set yet - deferring verification for %@ until addPairedDevice",  buf,  0xCu);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          v79 = v85;
          _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"pipe UUID is not set yet - deferring verification for %@ until addPairedDevice");
          if (_IDSShouldLog(0LL, @"BTLinkManager"))
          {
            v79 = v85;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"pipe UUID is not set yet - deferring verification for %@ until addPairedDevice");
          }
        }
      }

      if (v14)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v87 name]);
        -[IDSBTLinkManager stopDatagramLinkWithEndpointIdentifier:]( self,  "stopDatagramLinkWithEndpointIdentifier:",  v27);

LABEL_95:
        goto LABEL_96;
      }

      pendingPipes = self->_pendingPipes;
      if (!pendingPipes)
      {
        uint64_t v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v43 = self->_pendingPipes;
        self->_pendingPipes = v42;

        pendingPipes = self->_pendingPipes;
      }

      -[NSMutableArray addObject:](pendingPipes, "addObject:", v87, v79);
    }

    else
    {
      if (!-[NSString isEqualToString:](self->_pipePeripheralUUIDString, "isEqualToString:", v85))
      {
        uint64_t v36 = OSLogHandleForTransportCategory("BTLinkManager");
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          pipePeripheralUUIDString = self->_pipePeripheralUUIDString;
          *(_DWORD *)buf = 138412546;
          *(void *)v96 = v85;
          *(_WORD *)&v96[8] = 2112;
          *(void *)&v96[10] = pipePeripheralUUIDString;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "new UUID %@ doesn't match to existing UUID %@ - ignoring this new pipe",  buf,  0x16u);
        }

        uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
        if ((_DWORD)v40)
        {
          if (_IDSShouldLogTransport(v40))
          {
            _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"new UUID %@ doesn't match to existing UUID %@ - ignoring this new pipe");
            if (_IDSShouldLog(0LL, @"BTLinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"new UUID %@ doesn't match to existing UUID %@ - ignoring this new pipe");
            }
          }
        }

        goto LABEL_95;
      }

      uint64_t v32 = OSLogHandleForTransportCategory("BTLinkManager");
      BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v96 = v85;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Pipe UUID %@ match", buf, 0xCu);
      }

      uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
      if ((_DWORD)v35)
      {
        if (_IDSShouldLogTransport(v35))
        {
          v79 = v85;
          _IDSLogTransport(@"BTLinkManager", @"IDS", @"Pipe UUID %@ match");
          if (_IDSShouldLog(0LL, @"BTLinkManager"))
          {
            v79 = v85;
            _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"Pipe UUID %@ match");
          }
        }
      }

      if (v14) {
        v84 = -[IDSBTDatagramLink initWithPipe:withDeviceUniqueID:cbuuid:]( objc_alloc(&OBJC_CLASS___IDSBTDatagramLink),  "initWithPipe:withDeviceUniqueID:cbuuid:",  v87,  0LL,  v85);
      }
      else {
        v84 = -[IDSBTLink initWithPipe:useSkywalkChannel:withDeviceUniqueID:cbuuid:]( objc_alloc(&OBJC_CLASS___IDSBTLink),  "initWithPipe:useSkywalkChannel:withDeviceUniqueID:cbuuid:",  v87,  self->_useSkywalkChannel,  0LL,  v85);
      }
      uint64_t v44 = OSLogHandleForIDSCategory("BTLinkManager");
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v96 = v84;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Link %@ created", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v46)
        && _IDSShouldLog(0LL, @"BTLinkManager"))
      {
        v79 = v84;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"Link %@ created");
      }

      if (!v84)
      {
        uint64_t v47 = OSLogHandleForTransportCategory("BTLinkManager");
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v96 = v85;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "could not create a link for %@",  buf,  0xCu);
        }

        uint64_t v50 = os_log_shim_legacy_logging_enabled(v49);
        if ((_DWORD)v50)
        {
          if (_IDSShouldLogTransport(v50))
          {
            _IDSLogTransport(@"BTLinkManager", @"IDS", @"could not create a link for %@");
          }
        }

        goto LABEL_95;
      }

      if (v14)
      {
        -[NSMutableDictionary setObject:forKey:](self->_linkIDToDatagramLink, "setObject:forKey:", v84, v85);
      }

      else
      {
        -[NSMutableDictionary setObject:forKey:](self->_linkIDToLink, "setObject:forKey:", v84, v85);
        -[IDSBTLinkManager setLinkPreferences:](self, "setLinkPreferences:", 0LL);
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_datagramPipeRegistration, "allKeys"));
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        id obj = v51;
        id v52 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v90;
          uint64_t v54 = CBScalablePipeOptionTransport;
          do
          {
            for (i = 0LL; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v90 != v53) {
                objc_enumerationMutation(obj);
              }
              uint64_t v56 = *(void *)(*((void *)&v89 + 1) + 8LL * (void)i);
              BOOL isCentral = self->_isCentral;
              BOOL v58 = !self->_isCentral;
              uint64_t v59 = OSLogHandleForTransportCategory("BTLinkManager");
              uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v56));
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v96 = !isCentral;
                *(_WORD *)&v96[4] = 2112;
                *(void *)&v96[6] = v56;
                *(_WORD *)&v96[14] = 2112;
                *(void *)&v96[16] = v61;
                _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Re-registering datagram link type %d endpoint %@ registrationCount %@",  buf,  0x1Cu);
              }

              uint64_t v63 = os_log_shim_legacy_logging_enabled(v62);
              if ((_DWORD)v63)
              {
                if (_IDSShouldLogTransport(v63))
                {
                  BOOL v64 = !isCentral;
                  uint64_t v82 = v56;
                  v83 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v56));
                  v79 = (IDSBTDatagramLink *)v64;
                  _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Re-registering datagram link type %d endpoint %@ registrationCount %@");

                  if (_IDSShouldLog(0LL, @"BTLinkManager"))
                  {
                    v65 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v56,  v64,  v56,  v83));
                    uint64_t v82 = v56;
                    v83 = v65;
                    v79 = (IDSBTDatagramLink *)v64;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Re-registering datagram link type %d endpoint %@ registrationCount %@");
                  }
                }
              }

              pipeManager = self->_pipeManager;
              uint64_t v93 = v54;
              v94 = &off_1009478D8;
              v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL,  v79,  v82,  v83));
              -[CBScalablePipeManager registerEndpoint:type:priority:options:]( pipeManager,  "registerEndpoint:type:priority:options:",  v56,  v58,  3LL,  v67);
            }

            id v52 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
          }

          while (v52);
        }
      }

      uint64_t v68 = OSLogHandleForTransportCategory("BTLinkManager");
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v96 = v84;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "linkDidConnect:%@", buf, 0xCu);
      }

      uint64_t v71 = os_log_shim_legacy_logging_enabled(v70);
      if ((_DWORD)v71)
      {
        if (_IDSShouldLogTransport(v71))
        {
          _IDSLogTransport(@"BTLinkManager", @"IDS", @"linkDidConnect:%@");
        }
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained manager:self linkDidConnect:v84];
    }

    if (self->_isCentral) {
      -[IDSBTLinkManager _stopAdvertising](self, "_stopAdvertising");
    }
    uint64_t v73 = OSLogHandleForIDSCategory("BTLinkManager");
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      linkIDToLink = self->_linkIDToLink;
      *(_DWORD *)buf = 138412290;
      *(void *)v96 = linkIDToLink;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v76)
      && _IDSShouldLog(0LL, @"BTLinkManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"links = %@");
    }

    goto LABEL_95;
  }

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  __int128 v57 = (NSMutableDictionary *)a3;
  uint64_t v8 = (NSMutableDictionary *)a4;
  BOOL v58 = (NSMutableDictionary *)a5;
  uint64_t v59 = v8;
  uint64_t v9 = OSLogHandleForTransportCategory("BTLinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v66 = v8;
    __int16 v67 = 2112;
    uint64_t v68 = v58;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  " => Pipe did disconnect: %@   error: %@",  buf,  0x16u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      uint64_t v47 = v8;
      uint64_t v50 = v58;
      _IDSLogTransport(@"BTLinkManager", @"IDS", @" => Pipe did disconnect: %@   error: %@");
      if (_IDSShouldLog(0LL, @"BTLinkManager"))
      {
        uint64_t v47 = v8;
        uint64_t v50 = v58;
        _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @" => Pipe did disconnect: %@   error: %@");
      }
    }
  }

  uint64_t v13 = OSLogHandleForIDSCategory("BTLinkManager");
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v66 = v57;
    __int16 v67 = 2112;
    uint64_t v68 = v8;
    __int16 v69 = 2112;
    uint64_t v70 = v58;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ pipeDidDisconnect %@ err %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v15) && _IDSShouldLog(0LL, @"BTLinkManager"))
  {
    uint64_t v50 = v8;
    uint64_t v53 = v58;
    uint64_t v47 = v57;
    _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ pipeDidDisconnect %@ err %@");
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v8, "name", v47, v50, v53));
  unsigned int v17 = [v16 hasPrefix:@"com.apple.ids.datagram"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v59, "name"));
  unsigned int v19 = [v18 isEqualToString:@"com.apple.ids"];

  if (v19 | v17)
  {
    uint64_t v20 = OSLogHandleForIDSCategory("BTLinkManager");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v59, "name"));
      *(_DWORD *)buf = 138412802;
      __int16 v66 = v57;
      __int16 v67 = 2112;
      uint64_t v68 = v59;
      __int16 v69 = 2112;
      uint64_t v70 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ pipe %@ disconnected for service %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v23)
      && _IDSShouldLog(0LL, @"BTLinkManager"))
    {
      v51 = v59;
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v59, "name"));
      id v48 = v57;
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"%@ pipe %@ disconnected for service %@");
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary peer](v59, "peer", v48, v51, v54));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);

    if (v17)
    {
      uint64_t v56 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_linkIDToDatagramLink,  "objectForKey:",  v55));
      -[NSMutableDictionary removeObjectForKey:](self->_linkIDToDatagramLink, "removeObjectForKey:", v55);
    }

    else
    {
      uint64_t v56 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_linkIDToLink, "objectForKey:", v55));
      -[NSMutableDictionary removeObjectForKey:](self->_linkIDToLink, "removeObjectForKey:", v55);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_datagramPipeRegistration, "allKeys"));
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v27 = v26;
      id v28 = [v27 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v61 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(NSMutableDictionary **)(*((void *)&v60 + 1) + 8LL * (void)i);
            uint64_t v32 = OSLogHandleForTransportCategory("BTLinkManager");
            BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v31));
              *(_DWORD *)buf = 138412546;
              __int16 v66 = v31;
              __int16 v67 = 2112;
              uint64_t v68 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Unregistering datagram link endpoint %@ registrationCount %@",  buf,  0x16u);
            }

            uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
            if ((_DWORD)v36)
            {
              if (_IDSShouldLogTransport(v36))
              {
                uint64_t v49 = v31;
                id v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v31));
                _IDSLogTransport( @"BTLinkManager",  @"IDS",  @"Unregistering datagram link endpoint %@ registrationCount %@");

                if (_IDSShouldLog(0LL, @"BTLinkManager"))
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_datagramPipeRegistration,  "objectForKeyedSubscript:",  v31,  v31,  v52));
                  uint64_t v49 = v31;
                  id v52 = v37;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLinkManager",  @"Unregistering datagram link endpoint %@ registrationCount %@");
                }
              }
            }

            -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v31, v49, v52);
          }

          id v28 = [v27 countByEnumeratingWithState:&v60 objects:v64 count:16];
        }

        while (v28);
      }
    }

    if (v56)
    {
      uint64_t v38 = OSLogHandleForTransportCategory("BTLinkManager");
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v66 = v56;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "linkDidDisconnect: %@", buf, 0xCu);
      }

      uint64_t v41 = os_log_shim_legacy_logging_enabled(v40);
      if ((_DWORD)v41)
      {
        if (_IDSShouldLogTransport(v41))
        {
          _IDSLogTransport(@"BTLinkManager", @"IDS", @"linkDidDisconnect: %@");
        }
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained manager:self linkDidDisconnect:v56];
    }

    if (self->_isCentral) {
      -[IDSBTLinkManager _advertiseNow](self, "_advertiseNow");
    }
    uint64_t v43 = OSLogHandleForIDSCategory("BTLinkManager");
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      linkIDToLink = self->_linkIDToLink;
      *(_DWORD *)buf = 138412290;
      __int16 v66 = linkIDToLink;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "links = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v46)
      && _IDSShouldLog(0LL, @"BTLinkManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"BTLinkManager", @"links = %@");
    }
  }
}

- (id)nanoRegistryPluginManager
{
  idsNRPluginManager = self->_idsNRPluginManager;
  if (!idsNRPluginManager)
  {
    uint64_t v4 = (IDSNanoRegistryPluginManager *)objc_claimAutoreleasedReturnValue( +[IDSNanoRegistryPluginManager sharedInstance]( &OBJC_CLASS___IDSNanoRegistryPluginManager,  "sharedInstance"));
    uint64_t v5 = self->_idsNRPluginManager;
    self->_idsNRPluginManager = v4;

    idsNRPluginManager = self->_idsNRPluginManager;
  }

  return idsNRPluginManager;
}

- (NSString)pairedDevice
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)isPoweredOn
{
  return self->_isPoweredOn;
}

- (IDSNanoRegistryPluginManager)idsNRPluginManager
{
  return self->_idsNRPluginManager;
}

- (void)setIdsNRPluginManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end