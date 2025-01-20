@interface NIServerAccessoryGATTServiceManager
+ (id)sharedInstance;
- (BOOL)_isListener:(id)a3 backgroundAuthorizedForPeer:(id)a4 useCache:(BOOL)a5;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_cleanupExcessiveDetachedPeers;
- (void)_connectToPeer:(id)a3;
- (void)_peer:(id)a3 didFailWithError:(id)a4;
- (void)addServiceListener:(id)a3 withIdentifier:(id)a4 forBluetoothPeer:(id)a5 withConfiguration:(id)a6;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)probeAuthorizationForServiceListenerWithIdentifier:(id)a3;
- (void)removeServiceListenerWithIdentifier:(id)a3;
@end

@implementation NIServerAccessoryGATTServiceManager

- (id)_initInternal
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NIServerAccessoryGATTServiceManager;
  v2 = -[NIServerAccessoryGATTServiceManager init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.accessory.gatt-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = -[CBCentralManager initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___CBCentralManager),  "initWithDelegate:queue:",  v2,  v2->_queue);
    cbManager = v2->_cbManager;
    v2->_cbManager = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    listeners = v2->_listeners;
    v2->_listeners = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = v11;

    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
          unsigned int v14 = [v13 BOOLForKey:@"EnableStateDump"],
          v13,
          v14))
    {
      v15 = v2->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100167558;
      v17[3] = &unk_1007B1E00;
      v18 = v2;
      os_state_add_handler(v15, v17);
    }
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100167620;
  block[3] = &unk_1007A2398;
  block[4] = a1;
  if (qword_1007F8B58 != -1) {
    dispatch_once(&qword_1007F8B58, block);
  }
  return (id)qword_1007F8B50;
}

- (void)addServiceListener:(id)a3 withIdentifier:(id)a4 forBluetoothPeer:(id)a5 withConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016773C;
  block[3] = &unk_1007B1E28;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync(queue, block);
}

- (void)probeAuthorizationForServiceListenerWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100167C18;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)removeServiceListenerWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001683CC;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)printableState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1001687A0;
  id v10 = sub_1001687B0;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001687B8;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1001687A0;
  objc_super v19 = sub_1001687B0;
  id v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_autoreleasePoolPush();
  double v4 = sub_100023CC4();
  dispatch_queue_t v5 = (void *)v16[5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d listeners",  -[NSMutableDictionary count](self->_listeners, "count")));
  [v5 addObject:v6];

  listeners = self->_listeners;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001689D8;
  v14[3] = &unk_1007B1E78;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](listeners, "enumerateKeysAndObjectsUsingBlock:", v14);
  uint64_t v8 = (void *)v16[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d peers",  -[NSMutableDictionary count](self->_peerDevices, "count")));
  [v8 addObject:v9];

  peerDevices = self->_peerDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100168B90;
  v13[3] = &unk_1007B1EC8;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_autoreleasePoolPop(v3);
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)_connectToPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_t v5 = (char *)-[CBCentralManager state](self->_cbManager, "state");
  if ((unint64_t)(v5 - 2) < 3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100391C60();
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10017LL,  0LL));
    -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v4, v9);
  }

  else if ((unint64_t)v5 >= 2)
  {
    if (v5 != (char *)5) {
      __assert_rtn( "-[NIServerAccessoryGATTServiceManager _connectToPeer:]",  "NIServerAccessoryGATTServiceManager.mm",  413,  "cbState == CBManagerStatePoweredOn");
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    unsigned int v11 = [v10 connectionState];

    if (v11 == 6)
    {
      id v12 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,ConnectToPeer [%@]: already finished",  buf,  0xCu);
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager sharedPairingAgent](self->_cbManager, "sharedPairingAgent"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 retrievePairedPeers]);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1001695C8;
      v33[3] = &unk_1007B1EF0;
      id v15 = v4;
      id v34 = v15;
      if ([v14 indexOfObjectPassingTest:v33] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100391CC0();
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
        -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v15, v16);
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:]( self->_cbManager,  "retrieveConnectedPeripheralsWithServices:allowAll:",  0LL,  1LL));
        v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472LL;
        v30 = sub_100169618;
        v31 = &unk_1007B1F18;
        id v17 = v15;
        id v32 = v17;
        id v18 = [v16 indexOfObjectPassingTest:&v28];
        objc_super v19 = (os_log_s *)qword_1008000A0;
        if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_100391D20();
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL,  v28,  v29,  v30,  v31));
          -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v17, v20);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,ConnectToPeer [%@]: Paired and connected. Establishing a local connection",  buf,  0xCu);
          }

          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18, v28, v29, v30, v31));
          id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v17));
          [v22 setPeripheral:v21];

          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v17));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 peripheral]);
          [v24 setDelegate:self];

          cbManager = self->_cbManager;
          v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v17));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 peripheral]);
          -[CBCentralManager connectPeripheral:options:](cbManager, "connectPeripheral:options:", v27, 0LL);

          id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v17));
          [v20 changeConnectionState:2];
        }
      }
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,ConnectToPeer [%@]: wait for CBManager state update",  buf,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    [v7 changeConnectionState:1];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    [v8 cacheCharacteristics];
  }
}

- (void)_peer:(id)a3 didFailWithError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  [v7 changeConnectionState:0];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  [v8 cacheCharacteristics];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 listeners]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001697AC;
  v13[3] = &unk_1007B1F40;
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  [v10 enumerateObjectsUsingBlock:v13];
}

- (BOOL)_isListener:(id)a3 backgroundAuthorizedForPeer:(id)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_listeners, "objectForKeyedSubscript:", v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 configuration]);

  uint64_t v13 = objc_opt_class(v11, v12);
  if (v13 == objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v14))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 accessoryConfigData]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    if (v5) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cachedConfigCharacteristics]);
    }
    else {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resultConfigCharacteristics]);
    }
    unsigned __int8 v19 = [v18 containsObject:v16];

    BOOL v15 = (v19 & 1) != 0;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_cleanupExcessiveDetachedPeers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"NIAccessoryMaxDetachedPeersOverride"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)) {
    unsigned int v7 = [v4 unsignedIntValue];
  }
  else {
    unsigned int v7 = 2;
  }
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  peerDevices = self->_peerDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100169C5C;
  v13[3] = &unk_1007B1F68;
  id v10 = v8;
  uint64_t v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  if ((unint64_t)-[NSMutableArray count](v10, "count") > v7)
  {
    id v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = -[NSMutableArray count](v10, "count");
      *(_DWORD *)buf = 67109376;
      unsigned int v16 = v12;
      __int16 v17 = 1024;
      unsigned int v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,Cleaning up detached peers. %d found, exceeds max of %d",  buf,  0xEu);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_peerDevices, "removeObjectsForKeys:", v10);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = (unint64_t)[v4 state];
    if (v6 > 0xA) {
      unsigned int v7 = "?";
    }
    else {
      unsigned int v7 = off_1007B2020[v6];
    }
    *(_DWORD *)buf = 136315138;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,centralManagerDidUpdateState: %s",  buf,  0xCu);
  }

  peerDevices = self->_peerDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100169E34;
  v9[3] = &unk_1007B1F68;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v9);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peripheral]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v6));
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 peripheral]);

      if (v11 == v5)
      {
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v6));
        unsigned int v13 = [v12 connectionState];

        uint64_t v14 = (os_log_s *)qword_1008000A0;
        if (v13 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,centralManager:didConnectPeripheral [%@]: Success",  buf,  0xCu);
          }

          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"48fe3e40-0817-4bb2-8633-3073689c2dba"));
          unsigned int v18 = v15;
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v18,  1LL));
          [v5 discoverServices:v16];

          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v6));
          [v17 changeConnectionState:3];
        }

        else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          sub_100391DE0();
        }

        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100391D80();
  }
LABEL_11:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peripheral]);
    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v9));
      id v14 = (id)objc_claimAutoreleasedReturnValue([v13 peripheral]);

      if (v14 == v7)
      {
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v9));
        unsigned int v16 = [v15 connectionState];

        __int16 v17 = (os_log_s *)qword_1008000A0;
        if (v16 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412546;
            id v20 = v9;
            __int16 v21 = 2112;
            id v22 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: Error: %@",  (uint8_t *)&v19,  0x16u);
          }

          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
          -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v9, v18);
        }

        else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          sub_100391EA0();
        }

        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100391E40();
  }
LABEL_11:
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peripheral]);
    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v9));
      id v14 = (id)objc_claimAutoreleasedReturnValue([v13 peripheral]);

      if (v14 == v7)
      {
        BOOL v15 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412546;
          unsigned int v18 = v9;
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,centralManager:didDisconnectPeripheral [%@]: Error: %@",  (uint8_t *)&v17,  0x16u);
        }

        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
        -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v9, v16);

        goto LABEL_10;
      }
    }

    else
    {
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100391F00();
  }
LABEL_10:
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  if (!v9)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100391F60();
    }
    goto LABEL_12;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peripheral]);
  if (!v11)
  {

    goto LABEL_10;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 peripheral]);

  if (v13 != v6) {
    goto LABEL_10;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  unsigned int v15 = [v14 connectionState];

  if (v15 == 3)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100392020();
      }
LABEL_8:
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
      -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v8, v16);

      goto LABEL_12;
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 services]);
    id v18 = [v17 indexOfObjectPassingTest:&stru_1007B1FA8];

    __int16 v19 = (os_log_s *)qword_1008000A0;
    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100391FC0();
      }
      goto LABEL_8;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didDiscoverServices [%@]: Success",  buf,  0xCu);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"95e8d9d5-d8ef-4721-9a4e-807375f53328"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"1176cf7b-bed2-4690-bd69-5f34001e820c",  v20));
    v26[1] = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 services]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:v18]);
    [v6 discoverCharacteristics:v22 forService:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
    [v25 changeConnectionState:4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100392080();
  }

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peripheral]);
    if (v14)
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
      id v16 = (id)objc_claimAutoreleasedReturnValue([v15 peripheral]);

      if (v16 == v8)
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
        unsigned int v18 = [v17 connectionState];

        if (v18 == 4)
        {
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_1003921A0();
            }
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
            -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v19);
          }

          else
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"48fe3e40-0817-4bb2-8633-3073689c2dba"));
            if (([v20 isEqual:v21] & 1) == 0) {
              __assert_rtn( "-[NIServerAccessoryGATTServiceManager peripheral:didDiscoverCharacteristicsForService:error:]",  "NIServerAccessoryGATTServiceManager.mm",  662,  "[service.UUID isEqual:[CBUUID UUIDWithString:kNearbyInteractionServiceUUID]]");
            }

            id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
            [v22 setNumCharacteristicsLeftToRead:0];

            id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
            [v23 setReadingMultiConfigCharacteristics:0];

            v24 = (void *)objc_claimAutoreleasedReturnValue([v9 characteristics]);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_10016B144;
            v45[3] = &unk_1007B1FD0;
            id v25 = v8;
            id v46 = v25;
            v47 = self;
            id v26 = v11;
            id v48 = v26;
            [v24 enumerateObjectsUsingBlock:v45];

            v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v26));
            unsigned __int8 v28 = [v27 readingMultiConfigCharacteristics];

            if ((v28 & 1) == 0)
            {
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v9 characteristics]);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472LL;
              v41[2] = sub_10016B248;
              v41[3] = &unk_1007B1FD0;
              id v42 = v25;
              v43 = self;
              id v44 = v26;
              [v29 enumerateObjectsUsingBlock:v41];
            }

            v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v26));
            unsigned int v31 = [v30 numCharacteristicsLeftToRead];

            if (v31)
            {
              id v32 = (os_log_s *)(id)qword_1008000A0;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue([v9 characteristics]);
                unsigned int v39 = [v40 count];
                v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v26));
                unsigned int v34 = [v33 numCharacteristicsLeftToRead];
                v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v26));
                unsigned int v36 = [v35 readingMultiConfigCharacteristics];
                v37 = "single-config";
                *(_DWORD *)buf = 138413058;
                id v50 = v26;
                __int16 v51 = 1024;
                if (v36) {
                  v37 = "multi-config";
                }
                unsigned int v52 = v39;
                __int16 v53 = 1024;
                unsigned int v54 = v34;
                __int16 v55 = 2080;
                v56 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: %d total characteristics discovered, and tri ggered reads on %d %s characteristics",  buf,  0x22u);
              }

              v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v26));
              [v38 changeConnectionState:5];
            }

            else
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_100392140();
              }
              v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
              -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v26, v38);
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          sub_100392200();
        }

        goto LABEL_12;
      }
    }

    else
    {
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003920E0();
  }
LABEL_12:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  if (!v12)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100392260();
    }
    goto LABEL_12;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peripheral]);
  if (!v14)
  {

    goto LABEL_10;
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v15 peripheral]);

  if (v16 != v8) {
    goto LABEL_10;
  }
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  unsigned int v18 = [v17 connectionState];

  if (v18 != 5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003923E0();
    }
    goto LABEL_12;
  }

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100392380();
    }
LABEL_8:
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5882LL,  0LL));
    -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v19);

    goto LABEL_12;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  objc_msgSend( v20,  "setNumCharacteristicsLeftToRead:",  objc_msgSend(v20, "numCharacteristicsLeftToRead") - 1);

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"1176cf7b-bed2-4690-bd69-5f34001e820c"));
  unsigned int v23 = [v21 isEqual:v22];

  if (!v23)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"95e8d9d5-d8ef-4721-9a4e-807375f53328"));
    unsigned int v28 = [v26 isEqual:v27];

    if (v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 resultConfigCharacteristics]);
      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
      [v30 addObject:v31];

      id v32 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
        unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 resultConfigCharacteristics]);
        unsigned int v35 = [v34 count];
        unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v35;
        __int16 v83 = 1024;
        unsigned int v84 = [v36 numCharacteristicsLeftToRead];
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d single-config characteristics, %d left to go",  buf,  0x18u);
      }
    }

    goto LABEL_58;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
  int v25 = [v24 length];

  if (v25 >= 65282)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003922C0();
    }
    goto LABEL_8;
  }

  buf[0] = 0;
  sub_10016C2CC(&__p, v25, buf);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
  int v73 = v25;
  [v37 getBytes:__p length:v78 - (_BYTE *)__p];

  int v38 = v25;
  if (v25 > 0)
  {
    unsigned int v39 = *(unsigned __int8 *)__p;
    v40 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v80 = v11;
      __int16 v81 = 1024;
      int v82 = 1;
      __int16 v83 = 1024;
      unsigned int v84 = v38;
      __int16 v85 = 1024;
      unsigned int v86 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): R ead config count (%d)",  buf,  0x1Eu);
    }

    v72 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    if (v39)
    {
      unsigned int v71 = v39;
      unsigned __int8 v42 = v39 - 1;
      int v43 = 1;
      *(void *)&__int128 v41 = 138413570LL;
      __int128 v70 = v41;
      while (v43 < v38)
      {
        uint64_t v44 = v43 + 1LL;
        int v45 = *((unsigned __int8 *)__p + v43);
        if (*((_BYTE *)__p + v43))
        {
          if (v43 + v45 >= v38)
          {
            v62 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v70;
              v80 = v11;
              __int16 v81 = 1024;
              int v82 = v43 + 1;
              __int16 v83 = 1024;
              unsigned int v84 = v73;
              __int16 v85 = 1024;
              unsigned int v86 = v71 - v42;
              __int16 v87 = 1024;
              unsigned int v88 = v71;
              __int16 v89 = 1024;
              int v90 = v45;
              _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len : %d): Config %d of %d: Could not read data (len: %d)",  buf,  0x2Au);
            }

            goto LABEL_53;
          }

          id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)__p + v44,  *((unsigned __int8 *)__p + v43)));
          -[NSMutableSet addObject:](v72, "addObject:", v46);

          LODWORD(v44) = v44 + v45;
          uint64_t v47 = qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v70;
            v80 = v11;
            __int16 v81 = 1024;
            int v82 = v44;
            __int16 v83 = 1024;
            unsigned int v84 = v73;
            __int16 v85 = 1024;
            unsigned int v86 = v71 - v42;
            __int16 v87 = 1024;
            unsigned int v88 = v71;
            __int16 v89 = 1024;
            int v90 = v45;
            id v48 = (os_log_s *)v47;
            int v38 = v73;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Read data (len: %d)",  buf,  0x2Au);
          }

          else
          {
            int v38 = v73;
          }
        }

        int v43 = v44;
        if (!v42--) {
          goto LABEL_41;
        }
      }

      v61 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v43;
        __int16 v83 = 1024;
        unsigned int v84 = v73;
        __int16 v85 = 1024;
        unsigned int v86 = v71 - v42;
        __int16 v87 = 1024;
        unsigned int v88 = v71;
        _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Could not read length",  buf,  0x24u);
      }
    }

    else
    {
      LODWORD(v44) = 1;
LABEL_41:
      if ((int)v44 >= v38)
      {
        __int16 v53 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
        unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v53 resultConfigCharacteristics]);
        [v54 unionSet:v72];

        __int16 v55 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v74 = -[NSMutableSet count](v72, "count");
          v56 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 resultConfigCharacteristics]);
          unsigned int v58 = [v57 count];
          v59 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerDevices,  "objectForKeyedSubscript:",  v11));
          unsigned int v60 = [v59 numCharacteristicsLeftToRead];
          *(_DWORD *)buf = 138413058;
          v80 = v11;
          __int16 v81 = 1024;
          int v82 = v74;
          __int16 v83 = 1024;
          unsigned int v84 = v58;
          __int16 v85 = 1024;
          unsigned int v86 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d unique configs from this multi-config characteristic. %d unique configs so far. %d characteristics left to read",  buf,  0x1Eu);
        }

        int v51 = 0;
        goto LABEL_54;
      }

      unsigned int v52 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v44;
        __int16 v83 = 1024;
        unsigned int v84 = v73;
        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Did not consume all bytes",  buf,  0x18u);
      }
    }

- (void).cxx_destruct
{
}

@end