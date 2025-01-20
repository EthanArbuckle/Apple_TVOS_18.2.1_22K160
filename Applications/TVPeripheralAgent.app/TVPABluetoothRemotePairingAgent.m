@interface TVPABluetoothRemotePairingAgent
+ (id)_pairingModeDescription:(unint64_t)a3;
- (BOOL)_hasPairedRemote;
- (BOOL)isPairing;
- (NSMutableSet)previouslyPairedRemoteIDs;
- (NSTimer)derpDismissTimer;
- (TVPABluetoothRemotePairingDelegate)delegate;
- (unint64_t)pairingMode;
- (void)_handleBluetoothManagerDidUpdateNotification:(id)a3;
- (void)_handlePairingTimeout;
- (void)_handleRemoteDidPair;
- (void)_peripheralStateDidChangeNotification:(id)a3;
- (void)_prepareForPairing;
- (void)_stopFactoryPairing;
- (void)_stopPairing;
- (void)_stopProximityPairing;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDerpDismissTimer:(id)a3;
- (void)setPairingMode:(unint64_t)a3;
- (void)setPreviouslyPairedRemoteIDs:(id)a3;
- (void)startFactoryPairing;
- (void)startProximityPairing;
- (void)stopPairing;
- (void)unpairAllRemotes;
@end

@implementation TVPABluetoothRemotePairingAgent

- (void)dealloc
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v7;
    sub_100009998(v6);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Pairing agent deallocating", v6, 2u);
  }

  objc_storeStrong(location, 0LL);
  v2 = -[TVPABluetoothRemotePairingAgent derpDismissTimer](v9, "derpDismissTimer");
  -[NSTimer invalidate](v2, "invalidate");

  objc_storeStrong((id *)&v9->_derpDismissTimer, 0LL);
  v5.receiver = v9;
  v5.super_class = (Class)&OBJC_CLASS___TVPABluetoothRemotePairingAgent;
  -[TVPABluetoothRemotePairingAgent dealloc](&v5, "dealloc");
}

- (BOOL)isPairing
{
  return -[TVPABluetoothRemotePairingAgent pairingMode](self, "pairingMode", a2, self) != 0;
}

- (void)startFactoryPairing
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t v6 = v8;
    sub_100009998(v7);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Starting factory pairing", v7, 2u);
  }

  objc_storeStrong(location, 0LL);
  -[TVPABluetoothRemotePairingAgent _stopPairing](v10, "_stopPairing");
  -[TVPABluetoothRemotePairingAgent _prepareForPairing](v10, "_prepareForPairing");
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v2,  "addObserver:selector:name:object:",  v10,  "_handleBluetoothManagerDidUpdateNotification:",  TVSBluetoothManagerDidUpdateNotification,  0LL);

  v3 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager setFactoryPairingEnabled:](v3, "setFactoryPairingEnabled:", 1LL);

  v4 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager startScanning](v4, "startScanning");

  -[TVPABluetoothRemotePairingAgent setPairingMode:](v10, "setPairingMode:", 1LL);
}

- (void)startProximityPairing
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t v6 = v8;
    sub_100009998(v7);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Starting proximity pairing", v7, 2u);
  }

  objc_storeStrong(location, 0LL);
  -[TVPABluetoothRemotePairingAgent _stopPairing](v10, "_stopPairing");
  notify_post("com.apple.TVPeripheralAgent.DidStartProximityPairing");
  -[TVPABluetoothRemotePairingAgent _prepareForPairing](v10, "_prepareForPairing");
  v2 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager setAutoConnectWithImmediateProximityPeripheralsEnabled:]( v2,  "setAutoConnectWithImmediateProximityPeripheralsEnabled:",  1LL);

  v3 = v10;
  v4 =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v10,  "_handlePairingTimeout",  0LL,  0LL,  30.0);
  -[TVPABluetoothRemotePairingAgent setDerpDismissTimer:](v3, "setDerpDismissTimer:");

  -[TVPABluetoothRemotePairingAgent setPairingMode:](v10, "setPairingMode:", 2LL);
}

- (void)stopPairing
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  if (-[TVPABluetoothRemotePairingAgent pairingMode](self, "pairingMode"))
  {
    -[TVPABluetoothRemotePairingAgent _stopPairing](v7, "_stopPairing");
  }

  else
  {
    location[0] = sub_10000AD60();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location[0];
      os_log_type_t type = v5;
      sub_100009998(v4);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Can't stop remote pairing as not currently pairing.",  v4,  2u);
    }

    objc_storeStrong(location, 0LL);
  }

- (void)unpairAllRemotes
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v29;
    sub_100009998(v28);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Unpairing all remotes", v28, 2u);
  }

  objc_storeStrong(location, 0LL);
  memset(__b, 0, sizeof(__b));
  v14 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  id obj = -[TVPABluetoothRemotePairingManager pairedPeripherals](v14, "pairedPeripherals");

  id v16 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
  if (v16)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0LL;
    id v13 = v16;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(__b[1] + 8 * v12);
      v2 = objc_alloc(&OBJC_CLASS___TVSBluetoothDevice);
      id v25 = -[TVSBluetoothDevice initWithBTLEPeripheral:](v2, "initWithBTLEPeripheral:", v27);
      os_log_t oslog = (os_log_t)sub_10000AD60();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v7 = oslog;
        os_log_type_t v8 = v23;
        id v9 = [v25 identifier];
        id v22 = v9;
        sub_10000822C((uint64_t)v32, (uint64_t)v22);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Found device: %{public}@", v32, 0xCu);

        objc_storeStrong(&v22, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      if ([v25 type] == (id)1)
      {
        os_log_t v21 = (os_log_t)sub_10000AD60();
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v4 = v21;
          os_log_type_t v5 = v20;
          id v6 = [v25 identifier];
          id v19 = v6;
          sub_10000822C((uint64_t)v31, (uint64_t)v19);
          _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unpairing remote: %{public}@", v31, 0xCu);

          objc_storeStrong(&v19, 0LL);
        }

        objc_storeStrong((id *)&v21, 0LL);
        v3 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
        -[TVSBluetoothManager unpairDevice:](v3, "unpairDevice:", v25);
      }

      objc_storeStrong(&v25, 0LL);
      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }
}

- (void)_prepareForPairing
{
  os_log_type_t v23 = self;
  SEL v22 = a2;
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  previouslyPairedRemoteIDs = v23->_previouslyPairedRemoteIDs;
  v23->_previouslyPairedRemoteIDs = v2;

  memset(__b, 0, sizeof(__b));
  v15 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  id obj = -[TVPABluetoothRemotePairingManager pairedPeripherals](v15, "pairedPeripherals");

  id v17 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
  if (v17)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v17;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(__b[1] + 8 * v13);
      v4 = objc_alloc(&OBJC_CLASS___TVSBluetoothDevice);
      id location = -[TVSBluetoothDevice initWithBTLEPeripheral:](v4, "initWithBTLEPeripheral:", v21);
      if ([location type] == (id)1)
      {
        id v9 = v23->_previouslyPairedRemoteIDs;
        id v10 = [location identifier];
        -[NSMutableSet addObject:](v9, "addObject:");

        int v18 = 2;
      }

      else
      {
        int v18 = 0;
      }

      objc_storeStrong(&location, 0LL);
      if (v18) {
        break;
      }
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  os_log_type_t v8 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  os_log_type_t v5 = v23;
  uint64_t v6 = TVSPeripheralManagerPeripheralStateDidChangeNotification;
  os_log_type_t v7 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[NSNotificationCenter addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  v5,  "_peripheralStateDidChangeNotification:",  v6);
}

- (void)_stopPairing
{
  unint64_t v2 = -[TVPABluetoothRemotePairingAgent pairingMode](self, "pairingMode");
  if (v2 == 1)
  {
    -[TVPABluetoothRemotePairingAgent _stopFactoryPairing](self, "_stopFactoryPairing");
  }

  else if (v2 == 2)
  {
    -[TVPABluetoothRemotePairingAgent _stopProximityPairing](self, "_stopProximityPairing");
  }

- (void)_stopFactoryPairing
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v8 = (os_log_s *)location[0];
    os_log_type_t v9 = v12;
    sub_100009998(v11);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Stopping factory pairing.", v11, 2u);
  }

  objc_storeStrong(location, 0LL);
  id v10 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  v4 = v10;
  unint64_t v2 = v14;
  uint64_t v3 = TVSPeripheralManagerPeripheralStateDidChangeNotification;
  os_log_type_t v5 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[NSNotificationCenter removeObserver:name:object:](v4, "removeObserver:name:object:", v2, v3);

  -[NSNotificationCenter removeObserver:name:object:]( v10,  "removeObserver:name:object:",  v14,  TVSBluetoothManagerDidUpdateNotification,  0LL);
  uint64_t v6 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager stopScanning](v6, "stopScanning");

  os_log_type_t v7 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager setFactoryPairingEnabled:](v7, "setFactoryPairingEnabled:", 0LL);

  -[TVPABluetoothRemotePairingAgent setPairingMode:](v14, "setPairingMode:", 0LL);
  objc_storeStrong((id *)&v10, 0LL);
}

- (void)_stopProximityPairing
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v8 = (os_log_s *)location[0];
    os_log_type_t v9 = v11;
    sub_100009998(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Stopping proximity pairing.", v10, 2u);
  }

  objc_storeStrong(location, 0LL);
  os_log_type_t v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  unint64_t v2 = v13;
  uint64_t v3 = TVSPeripheralManagerPeripheralStateDidChangeNotification;
  v4 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[NSNotificationCenter removeObserver:name:object:](v5, "removeObserver:name:object:", v2, v3);

  uint64_t v6 = -[TVPABluetoothRemotePairingAgent derpDismissTimer](v13, "derpDismissTimer");
  -[NSTimer invalidate](v6, "invalidate");

  -[TVPABluetoothRemotePairingAgent setDerpDismissTimer:](v13, "setDerpDismissTimer:", 0LL);
  os_log_type_t v7 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  -[TVPABluetoothRemotePairingManager setAutoConnectWithImmediateProximityPeripheralsEnabled:]( v7,  "setAutoConnectWithImmediateProximityPeripheralsEnabled:",  0LL);

  notify_post("com.apple.TVPeripheralAgent.DidStopProximityPairing");
  -[TVPABluetoothRemotePairingAgent setPairingMode:](v13, "setPairingMode:", 0LL);
}

- (void)_handlePairingTimeout
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t v6 = v8;
    sub_100009998(v7);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Proximity pairing timed out", v7, 2u);
  }

  objc_storeStrong(location, 0LL);
  uint64_t v3 = -[TVPABluetoothRemotePairingAgent delegate](v10, "delegate");
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    unint64_t v2 = -[TVPABluetoothRemotePairingAgent delegate](v10, "delegate");
    -[TVPABluetoothRemotePairingDelegate pairingAgentDidTimeout:](v2, "pairingAgentDidTimeout:", v10);
  }

- (void)_handleRemoteDidPair
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = sub_10000AD60();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v26;
    sub_100009998(v25);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Bluetooth remote paired", v25, 2u);
  }

  objc_storeStrong(location, 0LL);
  memset(__b, 0, sizeof(__b));
  uint64_t v13 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  id obj = -[TVSBluetoothManager pairedDevices](v13, "pairedDevices");

  id v15 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v15)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    id v12 = v15;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v11);
      char v21 = 0;
      unsigned __int8 v8 = 0;
      if ([v24 type] == (id)1)
      {
        previouslyPairedRemoteIDs = v28->_previouslyPairedRemoteIDs;
        id v22 = [v24 identifier];
        char v21 = 1;
        unsigned __int8 v8 = -[NSMutableSet containsObject:](previouslyPairedRemoteIDs, "containsObject:");
      }

      if ((v21 & 1) != 0) {

      }
      if ((v8 & 1) != 0) {
        [v24 unpairWithCompletion:0];
      }
      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0LL;
        id v12 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  os_log_t oslog = (os_log_t)sub_10000AD60();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v5 = oslog;
    os_log_type_t v6 = v19;
    sub_100009998(v18);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished unpairing all previous remotes", v18, 2u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  uint64_t v3 = -[TVPABluetoothRemotePairingAgent delegate](v28, "delegate");
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    unint64_t v2 = -[TVPABluetoothRemotePairingAgent delegate](v28, "delegate");
    -[TVPABluetoothRemotePairingDelegate pairingAgentDidPairRemote:](v2, "pairingAgentDidPairRemote:", v28);
  }

+ (id)_pairingModeDescription:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      return @"None";
    case 1uLL:
      return @"Factory";
    case 2uLL:
      char v4 = @"Proximity";
      break;
  }

  return v4;
}

- (BOOL)_hasPairedRemote
{
  id v14 = self;
  SEL v13 = a2;
  char v12 = 0;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v7 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  id obj = -[TVSBluetoothManager pairedDevices](v7, "pairedDevices");

  id v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      if ([v11 type] == (id)1) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          goto LABEL_9;
        }
      }
    }

    char v12 = 1;
  }

- (void)_handleBluetoothManagerDidUpdateNotification:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((id)-[TVPABluetoothRemotePairingAgent pairingMode](v9, "pairingMode") == (id)1
    && -[TVPABluetoothRemotePairingAgent _hasPairedRemote](v9, "_hasPairedRemote"))
  {
    id v7 = sub_10000AD60();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      sub_100009998(v5);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Paired remote has been found when in factory pairing mode. Will inform delegate",  v5,  2u);
    }

    objc_storeStrong(&v7, 0LL);
    -[TVPABluetoothRemotePairingAgent _handleRemoteDidPair](v9, "_handleRemoteDidPair");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_peripheralStateDidChangeNotification:(id)a3
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = [location[0] userInfo];
  id v23 = [v10 objectForKey:TVSPeripheralManagerUserInfoKeyPeripheral];

  id v11 = [location[0] userInfo];
  id v22 = [v11 objectForKey:TVSPeripheralManagerUserInfoKeyError];

  id v21 = -[TVSBluetoothDevice initWithBTLEPeripheral:]( objc_alloc(&OBJC_CLASS___TVSBluetoothDevice),  "initWithBTLEPeripheral:",  v23);
  char v19 = 0;
  BOOL v12 = 0;
  if (!v22)
  {
    BOOL v12 = 0;
    if ([v21 type] == (id)1)
    {
      BOOL v12 = 0;
      if ([v21 isConnected])
      {
        BOOL v12 = 0;
        if ([v21 isPaired])
        {
          previouslyPairedRemoteIDs = v25->_previouslyPairedRemoteIDs;
          id v20 = [v21 identifier];
          char v19 = 1;
          BOOL v12 = (-[NSMutableSet containsObject:](previouslyPairedRemoteIDs, "containsObject:") & 1) == 0;
        }
      }
    }
  }

  if ((v19 & 1) != 0) {

  }
  if (v12)
  {
    id v18 = sub_10000AD60();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v18;
      os_log_type_t type = v17;
      id v8 = [v23 identifier];
      id v16 = v8;
      sub_10000C92C((uint64_t)v27, (uint64_t)v16, (uint64_t)v23, (uint64_t)v21);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Connection state did change for peripheral and it is a paired and connected remote. identifier=%{public}@, perip heral=%@, device=%@",  v27,  0x20u);

      objc_storeStrong(&v16, 0LL);
    }

    objc_storeStrong(&v18, 0LL);
    -[TVPABluetoothRemotePairingAgent _handleRemoteDidPair](v25, "_handleRemoteDidPair");
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_10000AD60();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = oslog;
      os_log_type_t v4 = v14;
      id v5 = [v23 identifier];
      id v13 = v5;
      sub_10000C92C((uint64_t)v26, (uint64_t)v13, (uint64_t)v23, (uint64_t)v21);
      _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "Connection state did change for peripheral but it is *NOT* a paired and connected remote. Will ignore. identifie r=%{public}@, peripheral=%@, device=%@",  v26,  0x20u);

      objc_storeStrong(&v13, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVPABluetoothRemotePairingDelegate)delegate
{
  return (TVPABluetoothRemotePairingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)pairingMode
{
  return self->_pairingMode;
}

- (void)setPairingMode:(unint64_t)a3
{
  self->_pairingMode = a3;
}

- (NSTimer)derpDismissTimer
{
  return self->_derpDismissTimer;
}

- (void)setDerpDismissTimer:(id)a3
{
}

- (NSMutableSet)previouslyPairedRemoteIDs
{
  return self->_previouslyPairedRemoteIDs;
}

- (void)setPreviouslyPairedRemoteIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end