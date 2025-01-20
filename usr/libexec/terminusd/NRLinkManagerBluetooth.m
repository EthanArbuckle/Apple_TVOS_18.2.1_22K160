@interface NRLinkManagerBluetooth
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4;
- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
@end

@implementation NRLinkManagerBluetooth

- (void)cancel
{
  if (self)
  {
    self->super._state = 1004;
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003LL);
    -[NRLinkManagerBluetooth invalidateManager](self, "invalidateManager");
    links = self->_links;
  }

  else
  {
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0LL;
  }

  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[NSMutableSet copy](links, "copy");
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "cancelWithReason:",  @"Cancelling Bluetooth link manager",  (void)v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  if (self) {
    v9 = self->_links;
  }
  else {
    v9 = 0LL;
  }
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects", (void)v10);
}

- (void)invalidateManager
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NRLinkManagerBluetooth;
  -[NRLinkManager invalidateManager](&v7, "invalidateManager");
  if (self)
  {
    -[CBScalablePipeManager setDelegate:](self->_pipeManager, "setDelegate:", 0LL);
    objc_storeWeak((id *)&self->_bluetoothManagerDelegate, 0LL);
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0LL;

    if (self->_centralManager)
    {
      sub_100028E3C((uint64_t)self);
      -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0LL);
      centralManager = self->_centralManager;
      self->_centralManager = 0LL;
    }

    peripherals = self->_peripherals;
    self->_peripherals = 0LL;

    if (self->_peripheralManager)
    {
      sub_10002C424((id *)&self->super.super.isa);
      -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0LL);
      peripheralManager = self->_peripheralManager;
      self->_peripheralManager = 0LL;
    }

    self->_currentAdvertisementRate = 0;
  }

  else
  {
    [0 setDelegate:0];
  }

- (void)dealloc
{
  if (qword_1001DC728 != -1) {
    dispatch_once(&qword_1001DC728, &stru_1001AE510);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
  {
    if (qword_1001DC728 != -1) {
      dispatch_once(&qword_1001DC728, &stru_1001AE510);
    }
    id v3 = (id)qword_1001DC720;
    id v4 = -[NRLinkManagerBluetooth copyName](self, "copyName");
    _NRLogWithArgs(v3, 1LL, "%s%.30s:%-4d %@", ", "-[NRLinkManagerBluetooth dealloc]"", 348LL, v4);
  }

  -[NRLinkManagerBluetooth invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkManagerBluetooth;
  -[NRLinkManagerBluetooth dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return @"Link Manager - Bluetooth";
}

- (id)copyStatusString
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v4, "appendString:", @"[");
  if (self) {
    pipeRegistrations = self->_pipeRegistrations;
  }
  else {
    pipeRegistrations = 0LL;
  }
  id v6 = pipeRegistrations;
  objc_super v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v6,  "objectForKeyedSubscript:",  &off_1001BC550));

  if (v7)
  {
    int v8 = v7[8];
    if ((v8 - 1) <= 1)
    {
      if (v8 == 1) {
        v9 = "(inprog)";
      }
      else {
        v9 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "M", v9);
    }
  }

  if (self) {
    __int128 v10 = self->_pipeRegistrations;
  }
  else {
    __int128 v10 = 0LL;
  }
  __int128 v11 = v10;
  __int128 v12 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  &off_1001BC568));

  if (v12)
  {
    int v13 = v12[8];
    if ((v13 - 1) <= 1)
    {
      if (v13 == 1) {
        v14 = "(inprog)";
      }
      else {
        v14 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "H", v14);
    }
  }

  if (self) {
    v15 = self->_pipeRegistrations;
  }
  else {
    v15 = 0LL;
  }
  v16 = v15;
  v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v16,  "objectForKeyedSubscript:",  &off_1001BC580));

  if (v17)
  {
    int v18 = v17[8];
    if ((v18 - 1) <= 1)
    {
      if (v18 == 1) {
        v19 = "(inprog)";
      }
      else {
        v19 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "I", v19);
    }
  }

  if (self) {
    p2pPipeRegistrations = self->_p2pPipeRegistrations;
  }
  else {
    p2pPipeRegistrations = 0LL;
  }
  v21 = p2pPipeRegistrations;
  v22 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v21,  "objectForKeyedSubscript:",  &off_1001BC550));

  if (v22)
  {
    int v23 = v22[8];
    if ((v23 - 1) <= 1)
    {
      if (v23 == 1) {
        v24 = "(inprog)";
      }
      else {
        v24 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "M(p2p)", v24);
    }
  }

  if (self) {
    v25 = self->_p2pPipeRegistrations;
  }
  else {
    v25 = 0LL;
  }
  v26 = v25;
  v27 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v26,  "objectForKeyedSubscript:",  &off_1001BC568));

  if (v27)
  {
    int v28 = v27[8];
    if ((v28 - 1) <= 1)
    {
      if (v28 == 1) {
        v29 = "(inprog)";
      }
      else {
        v29 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "H(p2p)", v29);
    }
  }

  if (self) {
    v30 = self->_p2pPipeRegistrations;
  }
  else {
    v30 = 0LL;
  }
  v31 = v30;
  v32 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v31,  "objectForKeyedSubscript:",  &off_1001BC580));

  if (v32)
  {
    int v33 = v32[8];
    if ((v33 - 1) <= 1)
    {
      if (v33 == 1) {
        v34 = "(inprog)";
      }
      else {
        v34 = "";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s%s,", "I(p2p)", v34);
    }
  }

  -[NSMutableString appendString:](v4, "appendString:", @"]");
  id v35 = -[NRLinkManagerBluetooth copyName](self, "copyName");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nName: %@", v35);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nLinkManager type: %@", StringFromNRLinkType);

    uint64_t state = self->super._state;
  }

  else
  {
    v81 = (void *)createStringFromNRLinkType(0LL);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nLinkManager type: %@", v81);

    uint64_t state = 0LL;
  }

  v38 = sub_1000A2B20(state);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nState: %@ %@", v38, v4);

  if (self)
  {
    v39 = self->_links;
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nLinks: %@", v39);

    v40 = self->_pipeRegistrations;
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nLinks: %@", 0LL);
    v40 = 0LL;
  }

  v41 = v40;
  v42 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", &off_1001BC550));

  if (v42)
  {
    id v43 = v42[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nMedium Pipes: %@", v43);
  }

  if (self) {
    v44 = self->_pipeRegistrations;
  }
  else {
    v44 = 0LL;
  }
  v45 = v44;
  v46 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", &off_1001BC568));

  if (v46)
  {
    id v47 = v46[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nHigh Pipes: %@", v47);
  }

  if (self) {
    v48 = self->_pipeRegistrations;
  }
  else {
    v48 = 0LL;
  }
  v49 = v48;
  v50 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", &off_1001BC580));

  if (v50)
  {
    id v51 = v50[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nIsochronous Pipes: %@", v51);
  }

  if (self) {
    v52 = self->_p2pPipeRegistrations;
  }
  else {
    v52 = 0LL;
  }
  v53 = v52;
  v54 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", &off_1001BC550));

  if (v54)
  {
    id v55 = v54[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nMedium P2P Pipes: %@", v55);
  }

  if (self) {
    v56 = self->_p2pPipeRegistrations;
  }
  else {
    v56 = 0LL;
  }
  v57 = v56;
  v58 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v57, "objectForKeyedSubscript:", &off_1001BC568));

  if (v58)
  {
    id v59 = v58[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nHigh P2P Pipes: %@", v59);
  }

  if (self) {
    v60 = self->_p2pPipeRegistrations;
  }
  else {
    v60 = 0LL;
  }
  v61 = v60;
  v62 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v61, "objectForKeyedSubscript:", &off_1001BC580));

  if (v62)
  {
    id v63 = v62[2];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nIsochronous P2P Pipes: %@", v63);
  }

  if (self) {
    peripherals = self->_peripherals;
  }
  else {
    peripherals = 0LL;
  }
  v65 = peripherals;
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nPeripherals: %@", v65);

  v66 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v66, "setDateFormat:", @"YYYY-MM-dd HH:mm:ss z");
  v67 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
  -[NSDateFormatter setLocale:](v66, "setLocale:", v67);

  if (self)
  {
    v68 = self->_peripheralConnectDate;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v66, "stringFromDate:", v68));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nconnectPeripheral invoked: %@", v69);

    centralManager = self->_centralManager;
  }

  else
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v66, "stringFromDate:", 0LL));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nconnectPeripheral invoked: %@", v82);

    centralManager = 0LL;
  }

  v71 = centralManager;
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nCentralMgr: %@", v71);

  if (self)
  {
    v72 = self->_peripheralManager;
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nPeripheralMgr: %@", v72);

    unint64_t currentAdvertisementState = self->_currentAdvertisementState;
    if (currentAdvertisementState >= 5) {
      v74 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"UnknownType(%lld)",  currentAdvertisementState);
    }
    else {
      v74 = (NSString *)*(&off_1001AE548 + currentAdvertisementState);
    }
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\ncurrentAdvertisementState: %@", v74);

    uint64_t currentAdvertisementRate = self->_currentAdvertisementRate;
    if (self->_currentAdvertisementRate)
    {
      if ((_DWORD)currentAdvertisementRate == 1) {
        v76 = @"1 sec";
      }
      else {
        v76 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"UnknownType(%lld)",  currentAdvertisementRate);
      }
    }

    else
    {
      v76 = @"Default";
    }

    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\ncurrentAdvertisementRate: %@", v76);

    pipeStateDictionary = self->_pipeStateDictionary;
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nPeripheralMgr: %@", 0LL);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\ncurrentAdvertisementState: %@", @"Idle");
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"\ncurrentAdvertisementRate: %@", @"Default");
    pipeStateDictionary = 0LL;
  }

  v78 = pipeStateDictionary;
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nBT connection state: %@", v78);

  v79 = v3;
  return v79;
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 nrUUID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 2004LL, @"%@ %@", v7, v9);

    if (self && self->super._state == 1004)
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@",  ",  "-[NRLinkManagerBluetooth linkIsAvailable:]"",  1070LL,  self);
      }
    }

    else
    {
      __int128 v10 = (char *)v4;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v29 = self;
        id v30 = v4;
        if (self) {
          links = self->_links;
        }
        else {
          links = 0LL;
        }
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v13 = -[NSMutableSet copy](links, "copy");
        id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
              if (v18) {
                v19 = *(void **)(v18 + 327);
              }
              else {
                v19 = 0LL;
              }
              id v20 = v19;
              id v21 = *(id *)(v10 + 327);
              unsigned int v22 = [v20 isEqual:v21];

              if (v22)
              {
                id v23 = [v10 copyShortDescription];
                [(id)v18 cancelWithReason:@"Replaced by new link %@", v23];
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }

          while (v15);
        }

        if (v29)
        {
          -[NSMutableSet addObject:](v29->_links, "addObject:", v10);
          v24 = v29->super._queue;
        }

        else
        {
          [0 addObject:v10];
          v24 = 0LL;
        }

        id v4 = v30;
        v25 = v24;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002DEE0;
        block[3] = &unk_1001B0720;
        v32 = v10;
        int v33 = v29;
        dispatch_async(v25, block);
      }

      else
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
        {
          if (qword_1001DC728 != -1) {
            dispatch_once(&qword_1001DC728, &stru_1001AE510);
          }
          _NRLogWithArgs(qword_1001DC720, 17LL, "Got bad link %@", v10);
        }
      }
    }
  }

  else
  {
    id v26 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v26, 17LL);

    if (IsLevelEnabled)
    {
      id v28 = sub_100024E28();
      _NRLogWithArgs(v28, 17LL, "%s called with null link", "-[NRLinkManagerBluetooth linkIsAvailable:]");
    }
  }
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2005LL, v7);

    if (self && self->super._state == 1004)
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@",  ",  "-[NRLinkManagerBluetooth linkIsReady:]"",  1107LL,  self);
      }
    }

    else
    {
      int v8 = (char *)v4;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = *(id *)(v8 + 335);
        BOOL v11 = [v10 type] == (id)2;

        sub_10002A260((uint64_t)self, 3LL, v11);
        sub_10002A260((uint64_t)self, 2LL, v11);
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        id v52 = v4;
        if (self) {
          pipeRegistrations = self->_pipeRegistrations;
        }
        else {
          pipeRegistrations = 0LL;
        }
        id v13 = pipeRegistrations;
        uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", &off_1001BC568));
        id v15 = (void *)v14;
        v53 = self;
        if (v14) {
          uint64_t v16 = *(void **)(v14 + 16);
        }
        else {
          uint64_t v16 = 0LL;
        }
        id v17 = v16;

        id v18 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v62;
LABEL_19:
          uint64_t v21 = 0LL;
          while (1)
          {
            if (*(void *)v62 != v20) {
              objc_enumerationMutation(v17);
            }
            unsigned int v22 = *(void **)(*((void *)&v61 + 1) + 8 * v21);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 peer]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
            id v25 = *(id *)(v8 + 327);
            unsigned __int8 v26 = [v24 isEqual:v25];

            if ((v26 & 1) != 0) {
              break;
            }
            if (v19 == (id)++v21)
            {
              id v19 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
              if (v19) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }

          v27 = v22;

          if (v27) {
            goto LABEL_47;
          }
        }

        else
        {
LABEL_25:
        }

        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        if (v53) {
          p2pPipeRegistrations = v53->_p2pPipeRegistrations;
        }
        else {
          p2pPipeRegistrations = 0LL;
        }
        v29 = p2pPipeRegistrations;
        uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", &off_1001BC568));
        v31 = (void *)v30;
        if (v30) {
          v32 = *(void **)(v30 + 16);
        }
        else {
          v32 = 0LL;
        }
        id v33 = v32;

        id v34 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v58;
LABEL_39:
          uint64_t v37 = 0LL;
          while (1)
          {
            if (*(void *)v58 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v57 + 1) + 8 * v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v38 peer]);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
            id v41 = *(id *)(v8 + 327);
            unsigned __int8 v42 = [v40 isEqual:v41];

            if ((v42 & 1) != 0) {
              break;
            }
            if (v35 == (id)++v37)
            {
              id v35 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
              if (v35) {
                goto LABEL_39;
              }
              goto LABEL_45;
            }
          }

          v27 = v38;

          if (!v27) {
            goto LABEL_48;
          }
LABEL_47:
          sub_100080D40(v8, v27);
        }

        else
        {
LABEL_45:

          v27 = 0LL;
        }

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2006LL, v7);

    if (self && self->super._state == 1004)
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@",  ",  "-[NRLinkManagerBluetooth linkIsSuspended:]"",  1170LL,  self);
      }
    }

    else
    {
      int v8 = (char *)v4;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = *(id *)(v8 + 327);
        sub_10002D2D0((id *)&self->super.super.isa, 0LL, v10);

        if (self) {
          BOOL v11 = self->super._queue;
        }
        else {
          BOOL v11 = 0LL;
        }
        __int128 v12 = v11;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002DCC0;
        block[3] = &unk_1001B0720;
        id v17 = v8;
        id v18 = self;
        dispatch_async(v12, block);
      }

      else
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
        {
          if (qword_1001DC728 != -1) {
            dispatch_once(&qword_1001DC728, &stru_1001AE510);
          }
          _NRLogWithArgs(qword_1001DC720, 17LL, "Got bad link %@", v8);
        }
      }
    }
  }

  else
  {
    id v13 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17LL);

    if (IsLevelEnabled)
    {
      id v15 = sub_100024E28();
      _NRLogWithArgs(v15, 17LL, "%s called with null link", "-[NRLinkManagerBluetooth linkIsSuspended:]");
    }
  }
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2007LL, v7);

    if (self && self->super._state == 1004)
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@",  ",  "-[NRLinkManagerBluetooth linkIsUnavailable:]"",  1202LL,  self);
      }
    }

    else
    {
      int v8 = (char *)v4;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = *(id *)(v8 + 335);
        id v11 = [v10 type];

        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 nrUUID]);
        id v13 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v12);

        if (v13 && v13[9] && *(void *)(v8 + 335) && !v8[233])
        {
          if (self) {
            pipeRegistrations = self->_pipeRegistrations;
          }
          else {
            pipeRegistrations = 0LL;
          }
          v31 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
          if (v31) {
            int v14 = v31[8] == 2;
          }
          else {
            int v14 = 0;
          }

          if (v11 == (id)2)
          {
            if (self) {
              p2pPipeRegistrations = self->_p2pPipeRegistrations;
            }
            else {
              p2pPipeRegistrations = 0LL;
            }
            id v33 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
            if (v33) {
              BOOL v34 = v33[8] == 2;
            }
            else {
              BOOL v34 = 0;
            }

            v14 |= v34;
          }
        }

        else
        {
          int v14 = 0;
        }

        -[NSMutableSet removeObject:](self->_links, "removeObject:", v8);
        id v15 = *(id *)(v8 + 327);
        sub_10002D2D0((id *)&self->super.super.isa, 0LL, v15);

        uint64_t v16 = self->super._queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002D828;
        block[3] = &unk_1001B0720;
        void block[4] = self;
        id v17 = v8;
        v39 = v17;
        dispatch_async((dispatch_queue_t)v16, block);

        if (v14)
        {
          id v18 = self->_pipeStateDictionary;
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 nrUUID]);

            if (v20)
            {
              if (qword_1001DC728 != -1) {
                dispatch_once(&qword_1001DC728, &stru_1001AE510);
              }
              if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
              {
                if (qword_1001DC728 != -1) {
                  dispatch_once(&qword_1001DC728, &stru_1001AE510);
                }
                _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d resetting pipe state",  ",  "-[NRLinkManagerBluetooth linkIsUnavailable:]"",  1239);
              }

              uint64_t v21 = self->_pipeStateDictionary;
              unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v17 nrUUID]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", 0LL, v22);
            }
          }

          id v23 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrations;
          if (v11 == (id)2) {
            id v23 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrations;
          }
          id v24 = *(id *)((char *)&self->super.super.isa + *v23);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
          unsigned __int8 v26 = (_BYTE *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

          if (v26 && (v26[9] & 8) == 0)
          {
            BOOL v27 = v11 == (id)2;
            BOOL v28 = v11 == (id)2;
            if (v27) {
              v29 = @"p2p";
            }
            else {
              v29 = 0LL;
            }
            -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4214LL, v29);
            v26[9] = 8;
            sub_10002C5F0((uint64_t)self, 1LL, v28);
          }
        }
      }

      else
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
        {
          if (qword_1001DC728 != -1) {
            dispatch_once(&qword_1001DC728, &stru_1001AE510);
          }
          _NRLogWithArgs(qword_1001DC720, 17LL, "Got bad link %@", v8);
        }
      }
    }
  }

  else
  {
    id v35 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v35, 17LL);

    if (IsLevelEnabled)
    {
      id v37 = sub_100024E28();
      _NRLogWithArgs(v37, 17LL, "%s called with null link", "-[NRLinkManagerBluetooth linkIsUnavailable:]");
    }
  }
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  uint64_t v9 = queue;
  dispatch_assert_queue_V2(v9);

  if (!v6)
  {
    id v15 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_24;
    }
    id v17 = sub_100024E28();
    _NRLogWithArgs(v17, 17LL, "%s called with null link");
LABEL_29:

    goto LABEL_24;
  }

  if (!v7)
  {
    id v18 = sub_100024E28();
    int v19 = _NRLogIsLevelEnabled(v18, 17LL);

    if (!v19) {
      goto LABEL_24;
    }
    id v17 = sub_100024E28();
    _NRLogWithArgs(v17, 17LL, "%s called with null data");
    goto LABEL_29;
  }

  id v10 = [v6 copyShortDescription];
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2008LL, v10);

  if (self && self->super._state == 1004)
  {
    if (qword_1001DC728 != -1) {
      dispatch_once(&qword_1001DC728, &stru_1001AE510);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC720, 1LL))
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      _NRLogWithArgs( qword_1001DC720,  1LL,  "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@",  ",  "-[NRLinkManagerBluetooth linkDidReceiveData:data:]"",  1254LL,  self);
    }
  }

  else
  {
    id v11 = v6;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NRLinkBluetooth);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      if (self) {
        id v13 = self->super._queue;
      }
      else {
        id v13 = 0LL;
      }
      int v14 = v13;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002D284;
      block[3] = &unk_1001B0748;
      void block[4] = self;
      id v21 = v11;
      id v22 = v7;
      dispatch_async(v14, block);
    }

    else
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
      {
        if (qword_1001DC728 != -1) {
          dispatch_once(&qword_1001DC728, &stru_1001AE510);
        }
        _NRLogWithArgs(qword_1001DC720, 17LL, "Got bad link %@", v11);
      }
    }
  }

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    if (self) {
      self = (NRLinkManagerBluetooth *)objc_loadWeakRetained((id *)&self->super._managerDelegate);
    }
    if ((objc_opt_respondsToSelector(self, "linkPeerIsAsleep:isAsleep:") & 1) != 0) {
      -[NRLinkManagerBluetooth linkPeerIsAsleep:isAsleep:](self, "linkPeerIsAsleep:isAsleep:", v8, v4);
    }
  }

  else
  {
    id v6 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_7;
    }
    self = (NRLinkManagerBluetooth *)sub_100024E28();
    _NRLogWithArgs(self, 17LL, "%s called with null link", "-[NRLinkManagerBluetooth linkPeerIsAsleep:isAsleep:]");
  }

LABEL_7:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v6 = (CBPeripheralManager *)a3;
  if (self)
  {
    BOOL v4 = self->_peripheralManager;
    if (v4)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v6) {
        sub_10002D104(self, (unint64_t)-[CBPeripheralManager state](v6, "state"));
      }
    }
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v13 = (CBPeripheralManager *)a3;
  id v6 = a4;
  if (self)
  {
    id v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v13)
      {
        if (v6)
        {
          uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue([v6 domain]);
          id v10 = v9;
          if (v9 == CBErrorDomain)
          {
            id v11 = [v6 code];

            if (v11 != (id)9)
            {
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
              -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 3503LL, v12);

              self->_unint64_t currentAdvertisementState = 0;
            }
          }

          else
          {
          }
        }

        else
        {
          -[NRLinkManager reportEvent:](self, "reportEvent:", 3502LL);
          self->_unint64_t currentAdvertisementState = 4;
        }
      }
    }
  }
}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  id v11 = (CBPeripheralManager *)a3;
  id v6 = a4;
  if (self)
  {
    id v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v11)
      {
        int currentAdvertisementState = self->_currentAdvertisementState;
        self->_int currentAdvertisementState = 0;
        if (v6)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
          -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 3506LL, v10);
        }

        else
        {
          -[NRLinkManager reportEvent:](self, "reportEvent:", 3505LL);
          if (currentAdvertisementState == 3) {
            sub_100029E6C((uint64_t)self);
          }
        }
      }
    }
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = [a3 state];
  unint64_t v5 = (unint64_t)v4;
  if ((unint64_t)v4 >= 6) {
    id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"UnknownState(%lld)",  v4);
  }
  else {
    id v6 = (NSString *)*(&off_1001AE570 + (void)v4);
  }
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4200LL, v6);

  sub_10002CC88((id *)&self->super.super.isa, v5);
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v33 = a4;
  id v8 = a5;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v10 = queue;
  dispatch_assert_queue_V2(v10);

  if (a3)
  {
    if (!v33)
    {
      id v30 = sub_100024E28();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v30, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_52;
      }
      id v11 = sub_100024E28();
      _NRLogWithArgs(v11, 17LL, "%s called with null identifier");
      goto LABEL_51;
    }

    id v11 = v33;
    id v12 = v8;
    if (!self) {
      goto LABEL_50;
    }
    if ([v11 isEqualToString:@"com.apple.terminusLink"])
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
      int v14 = (void *)v13;
      if (v12)
      {
        if (v13) {
          *(_BYTE *)(v13 + 8) = 0;
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        v32 = v15;
        uint64_t v16 = "pipe";
LABEL_11:
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4204LL,  @"%s %s error %@",  "Medium",  v16,  v32);
LABEL_25:

LABEL_49:
        goto LABEL_50;
      }

      if (v13) {
        *(_BYTE *)(v13 + 8) = 2;
      }
      id v22 = "pipe";
      goto LABEL_29;
    }

    if ([v11 isEqualToString:@"com.apple.terminusLink.urgent"])
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC568));
      int v14 = (void *)v17;
      if (v12)
      {
        if (v17) {
          *(_BYTE *)(v17 + 8) = 0;
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        id v15 = (void *)v18;
        int v19 = "pipe";
LABEL_17:
        uint64_t v20 = "High";
LABEL_24:
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4204LL,  @"%s %s error %@",  v20,  v19,  v18);
        goto LABEL_25;
      }

      if (v17) {
        *(_BYTE *)(v17 + 8) = 2;
      }
      id v24 = "pipe";
LABEL_38:
      id v25 = "High";
LABEL_48:
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4202LL, @"%s %s", v25, v24);
      goto LABEL_49;
    }

    if ([v11 isEqualToString:@"com.apple.terminusLink.datagram"])
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC580));
      int v14 = (void *)v21;
      if (v12)
      {
        if (v21) {
          *(_BYTE *)(v21 + 8) = 0;
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        id v15 = (void *)v18;
        int v19 = "pipe";
LABEL_23:
        uint64_t v20 = "Isochronous";
        goto LABEL_24;
      }

      if (v21) {
        *(_BYTE *)(v21 + 8) = 2;
      }
      id v24 = "pipe";
    }

    else
    {
      if ([v11 isEqualToString:@"com.apple.terminusLink.p2p"])
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
        int v14 = (void *)v23;
        if (v12)
        {
          if (v23) {
            *(_BYTE *)(v23 + 8) = 0;
          }
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
          v32 = v15;
          uint64_t v16 = "p2pPipe";
          goto LABEL_11;
        }

        if (v23) {
          *(_BYTE *)(v23 + 8) = 2;
        }
        id v22 = "p2pPipe";
LABEL_29:
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4202LL,  @"%s %s",  "Medium",  v22);

        sub_1000294D4((uint64_t)self);
LABEL_50:

        goto LABEL_51;
      }

      if ([v11 isEqualToString:@"com.apple.terminusLink.urgent.p2p"])
      {
        uint64_t v26 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC568));
        int v14 = (void *)v26;
        if (v12)
        {
          if (v26) {
            *(_BYTE *)(v26 + 8) = 0;
          }
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
          id v15 = (void *)v18;
          int v19 = "p2pPipe";
          goto LABEL_17;
        }

        if (v26) {
          *(_BYTE *)(v26 + 8) = 2;
        }
        id v24 = "p2pPipe";
        goto LABEL_38;
      }

      if (![v11 isEqualToString:@"com.apple.terminusLink.datagram.p2p"])
      {
        if (!v12)
        {
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4203LL, @"\"%@\"", v11);
          goto LABEL_50;
        }

        int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4205LL,  @"%@ error %@",  v11,  v14);
        goto LABEL_49;
      }

      uint64_t v27 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC580));
      int v14 = (void *)v27;
      if (v12)
      {
        if (v27) {
          *(_BYTE *)(v27 + 8) = 0;
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        id v15 = (void *)v18;
        int v19 = "p2pPipe";
        goto LABEL_23;
      }

      if (v27) {
        *(_BYTE *)(v27 + 8) = 2;
      }
      id v24 = "p2pPipe";
    }

    id v25 = "Isochronous";
    goto LABEL_48;
  }

  id v28 = sub_100024E28();
  int v29 = _NRLogIsLevelEnabled(v28, 17LL);

  if (!v29) {
    goto LABEL_52;
  }
  id v11 = sub_100024E28();
  _NRLogWithArgs(v11, 17LL, "%s called with null pipeManager");
LABEL_51:

LABEL_52:
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v25 = a4;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    if (!v25)
    {
      id v23 = sub_100024E28();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v23, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_21;
      }
      id v9 = sub_100024E28();
      _NRLogWithArgs(v9, 17LL, "%s called with null identifier");
      goto LABEL_20;
    }

    id v8 = v25;
    id v9 = v8;
    if (self)
    {
      if ([v8 isEqualToString:@"com.apple.terminusLink"])
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
        id v11 = (void *)v10;
        if (v10) {
          *(_BYTE *)(v10 + 8) = 0;
        }
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "Medium",  "pipe");
        sub_100029B38((char *)self, 1LL, 0);

        sub_10002C5F0((uint64_t)self, 2LL, 0);
        sub_10002C5F0((uint64_t)self, 3LL, 0);
        goto LABEL_20;
      }

      if ([v9 isEqualToString:@"com.apple.terminusLink.urgent"])
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC568));
        uint64_t v13 = (void *)v12;
        if (v12) {
          *(_BYTE *)(v12 + 8) = 0;
        }
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "High",  "pipe");
        int v14 = (char *)self;
        uint64_t v15 = 2LL;
      }

      else
      {
        if (![v9 isEqualToString:@"com.apple.terminusLink.datagram"])
        {
          if ([v9 isEqualToString:@"com.apple.terminusLink.p2p"])
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC550));
            uint64_t v13 = (void *)v18;
            if (v18) {
              *(_BYTE *)(v18 + 8) = 0;
            }
            -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "Medium",  "p2pPipe");
            int v14 = (char *)self;
            uint64_t v15 = 1LL;
            int v17 = 1;
          }

          else if ([v9 isEqualToString:@"com.apple.terminusLink.urgent.p2p"])
          {
            uint64_t v19 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC568));
            uint64_t v13 = (void *)v19;
            if (v19) {
              *(_BYTE *)(v19 + 8) = 0;
            }
            -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "High",  "p2pPipe");
            int v14 = (char *)self;
            uint64_t v15 = 2LL;
            int v17 = 1;
          }

          else
          {
            if (![v9 isEqualToString:@"com.apple.terminusLink.datagram.p2p"])
            {
              -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4208LL, v9);
              goto LABEL_20;
            }

            uint64_t v20 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_p2pPipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC580));
            uint64_t v13 = (void *)v20;
            if (v20) {
              *(_BYTE *)(v20 + 8) = 0;
            }
            -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "Isochronous",  "p2pPipe");
            int v14 = (char *)self;
            uint64_t v15 = 3LL;
            int v17 = 1;
          }

          goto LABEL_19;
        }

        uint64_t v16 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pipeRegistrations,  "objectForKeyedSubscript:",  &off_1001BC580));
        uint64_t v13 = (void *)v16;
        if (v16) {
          *(_BYTE *)(v16 + 8) = 0;
        }
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4207LL,  @"%s %s",  "Isochronous",  "pipe");
        int v14 = (char *)self;
        uint64_t v15 = 3LL;
      }

      int v17 = 0;
LABEL_19:
      sub_100029B38(v14, v15, v17);
    }
  }

  else
  {
    id v21 = sub_100024E28();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (!v22) {
      goto LABEL_21;
    }
    id v9 = sub_100024E28();
    _NRLogWithArgs(v9, 17LL, "%s called with null pipeManager");
  }

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v20 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v20, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v22 = sub_100024E28();
    _NRLogWithArgs(v22, 17LL, "%s called with null pipeManager");
LABEL_20:

    goto LABEL_15;
  }

  if (!v7)
  {
    id v23 = sub_100024E28();
    int v24 = _NRLogIsLevelEnabled(v23, 17LL);

    if (!v24) {
      goto LABEL_15;
    }
    id v22 = sub_100024E28();
    _NRLogWithArgs(v22, 17LL, "%s called with null pipe");
    goto LABEL_20;
  }

  self->_noBTCallbackSimCrashGenerated = 0;
  id v9 = (char *)[v7 priority];
  id v10 = [v8 type];
  if ((unint64_t)(v9 - 1) >= 3)
  {
    if (qword_1001DC728 != -1) {
      dispatch_once(&qword_1001DC728, &stru_1001AE510);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      _NRLogWithArgs(qword_1001DC720, 17LL, "Pipe of unsupported priority connected: %@", v8);
    }
  }

  else
  {
    uint64_t v11 = dword_100156890[(void)(v9 - 1)];
    uint64_t v12 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrations;
    if (v10 == (id)2) {
      uint64_t v12 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrations;
    }
    id v13 = *(id *)((char *)&self->super.super.isa + *v12);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
    uint64_t v15 = (id *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

    if (v15)
    {
      [v15[2] addObject:v8];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  v11,  @"pipe %@ bluetoothUUID %@",  v8,  v17);

      objc_initWeak(&location, v15);
      dispatch_time_t v18 = dispatch_time(0x8000000000000000LL, 500000000LL);
      uint64_t v19 = self->super._queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002B5C8;
      block[3] = &unk_1001AF3A0;
      objc_copyWeak(&v31, &location);
      id v29 = v8;
      id v30 = self;
      dispatch_after(v18, (dispatch_queue_t)v19, block);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }

    else
    {
      id v25 = sub_100024E28();
      int v26 = _NRLogIsLevelEnabled(v25, 17LL);

      if (v26)
      {
        id v27 = sub_100024E28();
        _NRLogWithArgs(v27, 17LL, "Pipe without registration for priority connected: %@", v8);
      }
    }
  }

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v59 = sub_100024E28();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v59, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_81;
    }
    id v61 = sub_100024E28();
    _NRLogWithArgs(v61, 17LL, "%s called with null pipeManager");
LABEL_86:

    goto LABEL_81;
  }

  if (!v9)
  {
    id v62 = sub_100024E28();
    int v63 = _NRLogIsLevelEnabled(v62, 17LL);

    if (!v63) {
      goto LABEL_81;
    }
    id v61 = sub_100024E28();
    _NRLogWithArgs(v61, 17LL, "%s called with null pipe");
    goto LABEL_86;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 peer]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 identifier]);

  v73 = (void *)v12;
  if (!v12)
  {
    id v64 = sub_100024E28();
    int v65 = _NRLogIsLevelEnabled(v64, 17LL);

    if (!v65) {
      goto LABEL_80;
    }
    id v66 = sub_100024E28();
    _NRLogWithArgs(v66, 17LL, "%s called with null bluetoothUUID");
LABEL_91:

    goto LABEL_80;
  }

  id v13 = (char *)[v9 priority];
  id v14 = [v9 type];
  if ((unint64_t)(v13 - 1) >= 3)
  {
    if (qword_1001DC728 != -1) {
      dispatch_once(&qword_1001DC728, &stru_1001AE510);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC720, 17LL))
    {
      if (qword_1001DC728 != -1) {
        dispatch_once(&qword_1001DC728, &stru_1001AE510);
      }
      _NRLogWithArgs(qword_1001DC720, 17LL, "Pipe of unsupported priority disconnected: %@", v9);
    }

    goto LABEL_80;
  }

  id v70 = v8;
  id v71 = v9;
  if (!self) {
    goto LABEL_89;
  }
  id v15 = v14;
  uint64_t v16 = dword_10015689C[(void)(v13 - 1)];
  int v17 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrations;
  if (v14 == (id)2) {
    int v17 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrations;
  }
  id v18 = *(id *)((char *)&self->super.super.isa + *v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  id v20 = (id *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

  if (!v20)
  {
LABEL_89:
    id v67 = sub_100024E28();
    int v68 = _NRLogIsLevelEnabled(v67, 17LL);

    id v8 = v70;
    id v9 = v71;
    if (!v68) {
      goto LABEL_80;
    }
    id v66 = sub_100024E28();
    _NRLogWithArgs(v66, 17LL, "Pipe without registration for priority disconnected: %@", v71);
    goto LABEL_91;
  }

  id v9 = v71;
  -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  v16,  @"pipe %@ bluetoothUUID %@ error %@",  v71,  v12,  v10);
  [v20[2] removeObject:v71];
  sub_100029B38((char *)self, (uint64_t)v13, v15 == (id)2);
  if (v13 == (char *)3)
  {
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v21 = self->_links;
    id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v82,  v92,  16LL);
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v83;
      do
      {
        BOOL v34 = 0LL;
        do
        {
          if (*(void *)v83 != v33) {
            objc_enumerationMutation(v21);
          }
          uint64_t v35 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)v34);
          if (v35) {
            uint64_t v36 = *(void **)(v35 + 327);
          }
          else {
            uint64_t v36 = 0LL;
          }
          id v37 = v36;
          unsigned int v38 = [v37 isEqual:v73];

          if (v38)
          {
            sub_10007FCF8(v35, 0LL);
            goto LABEL_71;
          }

          BOOL v34 = (char *)v34 + 1;
        }

        while (v32 != v34);
        id v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v82,  v92,  16LL);
        id v32 = v39;
      }

      while (v39);
    }
  }

  else
  {
    if (v13 != (char *)2)
    {
      v69 = v20;
      v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      id v41 = self->_links;
      id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v79;
        do
        {
          for (i = 0LL; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v79 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v78 + 1) + 8LL * (void)i);
            if (v46) {
              id v47 = *(void **)(v46 + 327);
            }
            else {
              id v47 = 0LL;
            }
            id v48 = v47;
            unsigned int v49 = [v48 isEqual:v73];

            if (v49) {
              -[NSMutableArray addObject:](v40, "addObject:", v46);
            }
          }

          id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
        }

        while (v43);
      }

      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      obj = v40;
      id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v74,  v90,  16LL);
      if (v50)
      {
        id v51 = v50;
        uint64_t v52 = *(void *)v75;
        do
        {
          for (j = 0LL; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v75 != v52) {
              objc_enumerationMutation(obj);
            }
            v54 = *(_BYTE **)(*((void *)&v74 + 1) + 8LL * (void)j);
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 nrUUID]);
            if (v54)
            {
              [v54 setNoTransport:1];
              v54[233] = 1;
              [v54 cancelWithReason:@"Bluetooth Pipe Disconnected"];
            }

            id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothManagerDelegate);
            [WeakRetained pipeDidConnectForNRUUID:0 nrUUID:v55];

            sub_100029C38((uint64_t)self, v55);
          }

          id v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v74,  v90,  16LL);
        }

        while (v51);
      }

      id v8 = v70;
      id v9 = v71;
      if (self->_peripheralManager)
      {
        id v57 = v73;
        objc_opt_self(&OBJC_CLASS___NRDLocalDevice);
        __int128 v58 = sub_10012E648((uint64_t)&OBJC_CLASS___NRDLocalDevice, v57);

        if (v58 && v58[8] && v58[9])
        {
          sub_100029E6C((uint64_t)self);
        }

        else
        {
          if (qword_1001DC728 != -1) {
            dispatch_once(&qword_1001DC728, &stru_1001AE510);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC720, 0LL))
          {
            if (qword_1001DC728 != -1) {
              dispatch_once(&qword_1001DC728, &stru_1001AE510);
            }
            _NRLogWithArgs( qword_1001DC720,  0LL,  "%s%.30s:%-4d Not starting BT advertisements for disabled device %@ with pipe %@",  ",  "-[NRLinkManagerBluetooth scalablePipeManager:pipeDidDisconnect:error:]"",  2056LL,  v58,  v71);
          }
        }
      }

      goto LABEL_80;
    }

    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    id v21 = self->_links;
    id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v86,  v93,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v87;
      do
      {
        id v25 = 0LL;
        do
        {
          if (*(void *)v87 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)v25);
          if (v26) {
            id v27 = *(void **)(v26 + 327);
          }
          else {
            id v27 = 0LL;
          }
          id v28 = v27;
          unsigned int v29 = [v28 isEqual:v73];

          if (v29)
          {
            sub_100080D40((char *)v26, 0LL);
            goto LABEL_71;
          }

          id v25 = (char *)v25 + 1;
        }

        while (v23 != v25);
        id v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v86,  v93,  16LL);
        id v23 = v30;
      }

      while (v30);
    }
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  id v6 = (CBCentralManager *)a3;
  if (self)
  {
    id v4 = self->_centralManager;
    if (v4)
    {
      centralManager = self->_centralManager;

      if (centralManager == v6) {
        sub_100029A6C(self, (uint64_t)-[CBCentralManager state](v6, "state"));
      }
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v10 = (CBCentralManager *)a3;
  id v6 = a4;
  if (self)
  {
    id v7 = self->_centralManager;
    if (v7)
    {
      centralManager = self->_centralManager;

      if (centralManager == v10)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4001LL, v9);

        sub_1000294D4((uint64_t)self);
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  int v17 = (CBCentralManager *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    id v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v17)
      {
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4002LL,  @"peripheral %@ error %@",  v8,  v9);
        uint64_t v12 = (NRAnalyticsLinkManagerBluetooth *)v9;
        id v13 = v12;
        if (v12 && -[NRAnalyticsLinkManagerBluetooth code](v12, "code") == (id)14)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRAnalyticsLinkManagerBluetooth domain](v13, "domain"));
          unsigned int v15 = [v14 isEqualToString:CBErrorDomain];

          if (!v15)
          {
LABEL_11:
            sub_100028C2C((id *)&self->super.super.isa);
            goto LABEL_12;
          }

          -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4015LL,  @"peripheral %@",  v8);
          uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NRAnalyticsLinkManagerBluetooth);
          id v13 = v16;
          if (v16) {
            v16->_peerRemovedPairingInformation = 1;
          }
          -[NRAnalyticsLinkManagerBluetooth submit](v16, "submit");
        }

        goto LABEL_11;
      }
    }
  }

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v12 = (CBCentralManager *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    id v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v12)
      {
        -[NRLinkManager reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  4004LL,  @"peripheral %@ error %@",  v8,  v9);
        sub_100028C2C((id *)&self->super.super.isa);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end