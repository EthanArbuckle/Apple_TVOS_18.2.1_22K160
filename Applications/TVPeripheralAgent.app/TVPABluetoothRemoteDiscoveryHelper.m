@interface TVPABluetoothRemoteDiscoveryHelper
+ (BOOL)_deviceCouldRequireProximityPairingWorkarounds;
- (BOOL)_haveDiscoveredUnpairedBluetoothRemotes;
- (BOOL)hasStarted;
- (BOOL)shouldStart;
- (CBCentralManager)centralManager;
- (TVPABluetoothRemoteDiscoveryHelper)init;
- (id)_dummyProximityPairingPeripheral;
- (void)_connectPeripheral:(id)a3;
- (void)_handleDiscoveredPeripheralsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setCentralManager:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation TVPABluetoothRemoteDiscoveryHelper

- (TVPABluetoothRemoteDiscoveryHelper)init
{
  SEL v10 = a2;
  v11 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPABluetoothRemoteDiscoveryHelper;
  v11 = -[TVPABluetoothRemoteDiscoveryHelper init](&v9, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11
    && ([(id)objc_opt_class(v11) _deviceCouldRequireProximityPairingWorkarounds] & 1) != 0)
  {
    id v8 = sub_100009920();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v8;
      os_log_type_t type = v7;
      sub_100009998(v6);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "We are running on a device which may require Bluetooth remote discovery workarounds.",  v6,  2u);
    }

    objc_storeStrong(&v8, 0LL);
    +[TVSWiFiInterface enableNetworkManagement](&OBJC_CLASS___TVSWiFiInterface, "enableNetworkManagement");
  }

  v3 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  return v3;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVPABluetoothRemoteDiscoveryHelper stop](self, "stop");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVPABluetoothRemoteDiscoveryHelper;
  -[TVPABluetoothRemoteDiscoveryHelper dealloc](&v2, "dealloc");
}

- (BOOL)shouldStart
{
  SEL v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v3);

  char v7 = 0;
  char v5 = 0;
  unsigned __int8 v4 = 0;
  if ([(id)objc_opt_class(self) _deviceCouldRequireProximityPairingWorkarounds])
  {
    id v8 = +[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface");
    char v7 = 1;
    id v6 = [v8 associatedNetwork];
    char v5 = 1;
    unsigned __int8 v4 = objc_msgSend(v6, "is2_4GHzNetwork");
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  return v4 & 1;
  }
}

- (void)start
{
  v19 = self;
  location[1] = (id)a2;
  SEL v10 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v10);

  if ([(id)objc_opt_class(v19) _deviceCouldRequireProximityPairingWorkarounds])
  {
    if (-[TVPABluetoothRemoteDiscoveryHelper hasStarted](v19, "hasStarted"))
    {
      location[0] = sub_100009920();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)location[0];
        os_log_type_t v9 = v17;
        sub_100009998(v16);
        _os_log_impl( (void *)&_mh_execute_header,  log,  v9,  "Bluetooth remote discovery workarounds are already running. Ignoring.",  v16,  2u);
      }

      objc_storeStrong(location, 0LL);
    }

    else if (-[TVPABluetoothRemoteDiscoveryHelper shouldStart](v19, "shouldStart"))
    {
      id v15 = sub_100009920();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (os_log_s *)v15;
        os_log_type_t type = v14;
        sub_100009998(v13);
        _os_log_impl( (void *)&_mh_execute_header,  v6,  type,  "Bluetooth remote discovery workarounds are required. Will disconnect any remotes and start connecting to the dummy peripheral",  v13,  2u);
      }

      objc_storeStrong(&v15, 0LL);
      -[TVPABluetoothRemoteDiscoveryHelper setHasStarted:](v19, "setHasStarted:", 1LL);
      +[TVSBluetoothRemoteUtilities disconnectAllRemotesWithReason:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "disconnectAllRemotesWithReason:",  1LL);
      char v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      objc_super v2 = v19;
      uint64_t v3 = TVSPeripheralManagerDiscoveredPeripheralsDidChangeNotification;
      unsigned __int8 v4 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
      -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  v2,  "_handleDiscoveredPeripheralsDidChangeNotification:",  v3);

      v12 = objc_alloc_init(&OBJC_CLASS___CBCentralManager);
      -[TVPABluetoothRemoteDiscoveryHelper setCentralManager:](v19, "setCentralManager:", v12);
      id v11 =  -[TVPABluetoothRemoteDiscoveryHelper _dummyProximityPairingPeripheral]( v19,  "_dummyProximityPairingPeripheral");
      -[TVPABluetoothRemoteDiscoveryHelper _connectPeripheral:](v19, "_connectPeripheral:", v11);
      objc_storeStrong(&v11, 0LL);
      objc_storeStrong((id *)&v12, 0LL);
    }
  }

- (void)stop
{
  id v15 = self;
  location[1] = (id)a2;
  os_log_type_t v9 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v9);

  if (-[TVPABluetoothRemoteDiscoveryHelper hasStarted](v15, "hasStarted"))
  {
    location[0] = sub_100009920();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location[0];
      os_log_type_t type = v13;
      sub_100009998(v12);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Stopping Bluetooth remote discovery workarounds", v12, 2u);
    }

    objc_storeStrong(location, 0LL);
    -[TVPABluetoothRemoteDiscoveryHelper setHasStarted:](v15, "setHasStarted:", 0LL);
    id v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v3 = v15;
    uint64_t v4 = TVSPeripheralManagerDiscoveredPeripheralsDidChangeNotification;
    char v5 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
    -[NSNotificationCenter removeObserver:name:object:](v6, "removeObserver:name:object:", v3, v4);

    id v11 = -[TVPABluetoothRemoteDiscoveryHelper centralManager](v15, "centralManager");
    id v10 =  -[TVPABluetoothRemoteDiscoveryHelper _dummyProximityPairingPeripheral]( v15,  "_dummyProximityPairingPeripheral");
    if (v10) {
      [v11 cancelPeripheralConnection:v10];
    }
    -[TVPABluetoothRemoteDiscoveryHelper setCentralManager:](v15, "setCentralManager:", 0LL);
    objc_storeStrong(&v10, obj);
    objc_storeStrong(&v11, obj);
  }

- (void)_handleDiscoveredPeripheralsDidChangeNotification:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_type_t v9 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v9);

  id v19 = sub_100009920();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v19;
    os_log_type_t type = v18;
    sub_100009998(v17);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Got TVSPeripheralManagerDiscoveredPeripheralsDidChangeNotification. Looking for a remote to stop workarounds",  v17,  2u);
  }

  objc_storeStrong(&v19, 0LL);
  if (-[TVPABluetoothRemoteDiscoveryHelper _haveDiscoveredUnpairedBluetoothRemotes]( v21,  "_haveDiscoveredUnpairedBluetoothRemotes"))
  {
    id v15 = sub_100009920();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = (os_log_s *)v15;
      os_log_type_t v6 = v14;
      sub_100009998(v13);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Discovered at least one non paired Bluetooth remote. Will stop discovery workarounds",  v13,  2u);
    }

    objc_storeStrong(&v15, 0LL);
    -[TVPABluetoothRemoteDiscoveryHelper stop](v21, "stop");
  }

  else
  {
    id v12 = sub_100009920();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = (os_log_s *)v12;
      os_log_type_t v4 = v11;
      sub_100009998(v10);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unable to find unpaired remote", v10, 2u);
    }

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_connectPeripheral:(id)a3
{
  os_log_type_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] && ![location[0] state])
  {
    uint64_t v7 = CBConnectPeripheralOptionSetConnectScanDutyCycle;
    id v8 = &off_10003B100;
    os_log_type_t v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL);
    uint64_t v3 = -[TVPABluetoothRemoteDiscoveryHelper centralManager](v6, "centralManager");
    -[CBCentralManager connectPeripheral:options:](v3, "connectPeripheral:options:", location[0], v4);

    objc_storeStrong((id *)&v4, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (id)_dummyProximityPairingPeripheral
{
  os_log_type_t v17 = self;
  v16[1] = (id)a2;
  v16[0] = @"Public ";
  id v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@00:11:22:33:44:55",  v16[0]);
  os_log_type_t v11 = -[TVPABluetoothRemoteDiscoveryHelper centralManager](v17, "centralManager");
  id v14 = -[CBCentralManager retrievePeripheralWithAddress:](v11, "retrievePeripheralWithAddress:", v15);

  if (!v14)
  {
    os_log_type_t v13 = (NSString *)objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v16[0], "length"));
    objc_super v2 =  -[NSString stringByReplacingOccurrencesOfString:withString:]( v13,  "stringByReplacingOccurrencesOfString:withString:",  @":",  &stru_100039440);
    uint64_t v3 = v13;
    os_log_type_t v13 = v2;

    os_log_type_t v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"00%@", v13);
    char v5 = v13;
    os_log_type_t v13 = v4;

    id v12 = -[NSString tvs_dataFromHexString](v13, "tvs_dataFromHexString");
    id v10 = -[TVPABluetoothRemoteDiscoveryHelper centralManager](v17, "centralManager");
    id v6 =  -[CBCentralManager createPeripheralWithAddress:andIdentifier:]( v10,  "createPeripheralWithAddress:andIdentifier:",  v12);
    id v7 = v14;
    id v14 = v6;

    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  id v9 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(v16, 0LL);
  return v9;
}

+ (BOOL)_deviceCouldRequireProximityPairingWorkarounds
{
  id v3 = +[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType");
  unsigned __int8 v4 = [v3 hasPrefix:@"AppleTV5,"];

  return v4 & 1;
}

- (BOOL)_haveDiscoveredUnpairedBluetoothRemotes
{
  v32 = self;
  SEL v31 = a2;
  char v30 = 0;
  id v29 =  +[TVPABluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___TVPABluetoothRemotePairingManager,  "sharedInstance");
  memset(__b, 0, sizeof(__b));
  id obj = [v29 discoveredPeripherals];
  id v17 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0LL;
    id v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(id *)(__b[1] + 8 * v14);
      char v26 = objc_msgSend(v28, "tvs_isBluetoothRemote") & 1;
      char v25 = [v29 isPeerPaired:v28] & 1;
      os_log_t oslog = (os_log_t)sub_100009920();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        os_log_type_t v10 = type;
        id v11 = [v28 name];
        id v22 = v11;
        sub_10000A9CC((uint64_t)v34, (uint64_t)v22, v26 & 1, v25 & 1);
        _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v10,  "Checking peripheral: name=%@, isBluetoothRemote=%{BOOL}d, isPeerPaired=%{BOOL}d",  v34,  0x18u);

        objc_storeStrong(&v22, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      if ((v26 & 1) != 0 && (v25 & 1) == 0) {
        break;
      }
      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        uint64_t v14 = 0LL;
        id v15 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v15) {
          goto LABEL_14;
        }
      }
    }

    os_log_t v21 = (os_log_t)sub_100009920();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      char v5 = v21;
      os_log_type_t v6 = v20;
      id v8 = [v28 name];
      id v4 = v8;
      id v19 = v4;
      id v7 = (id)TVSBluetoothRemoteTypeLogString(objc_msgSend(v28, "tvs_bluetoothRemoteType"));
      id v18 = v7;
      sub_10000AA38((uint64_t)v33, (uint64_t)v4, (uint64_t)v18);
      _os_log_debug_impl((void *)&_mh_execute_header, v5, v6, "Found unpaired remote: name=%@, type=%@", v33, 0x16u);

      objc_storeStrong(&v18, 0LL);
      objc_storeStrong(&v19, 0LL);
    }

    objc_storeStrong((id *)&v21, 0LL);
    char v30 = 1;
  }

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end