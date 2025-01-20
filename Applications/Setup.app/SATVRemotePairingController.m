@interface SATVRemotePairingController
+ (void)initialize;
- (BOOL)_isDisplayAvailable;
- (BOOL)isFactoryPairing;
- (BOOL)isProximityPairing;
- (SATVRemotePairingController)init;
- (__IOHIDEventSystemClient)remoteHIDClient;
- (__IOHIDServiceClient)appleTVIRService;
- (void)_bluetoothRemoteDidConnect:(id)a3;
- (void)_destroyRemoteHIDClient;
- (void)_handlePeripheralStateChange:(id)a3;
- (void)_processHIDEvent:(__IOHIDEvent *)a3;
- (void)_setupRemoteHIDClient;
- (void)_startFactoryPairing;
- (void)_startProximityPairing;
- (void)_stopFactoryPairing;
- (void)_stopProximityPairing;
- (void)setAppleTVIRService:(__IOHIDServiceClient *)a3;
- (void)setIsFactoryPairing:(BOOL)a3;
- (void)setIsProximityPairing:(BOOL)a3;
- (void)setRemoteHIDClient:(__IOHIDEventSystemClient *)a3;
@end

@implementation SATVRemotePairingController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVRemotePairingController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVRemotePairingController");
    v3 = (void *)qword_1001099A0;
    qword_1001099A0 = (uint64_t)v2;
  }

- (SATVRemotePairingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVRemotePairingController;
  os_log_t v2 = -[SATVRemotePairingController init](&v6, "init");
  if (v2)
  {
    +[TVSBluetoothRemoteUtilities startConnectionMonitoring]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "startConnectionMonitoring");
    -[SATVRemotePairingController _startFactoryPairing](v2, "_startFactoryPairing");
    -[SATVRemotePairingController _setupRemoteHIDClient](v2, "_setupRemoteHIDClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_bluetoothRemoteDidConnect:" name:TVSBluetoothRemoteDidConnectNotification object:0];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"_handlePeripheralStateChange:" name:TVSPeripheralManagerPeripheralStateDidChangeNotification object:0];
  }

  return v2;
}

- (BOOL)_isDisplayAvailable
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMode]);

  id v4 = [v3 width];
  id v5 = [v3 height];
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (void)_setupRemoteHIDClient
{
  if (!self->_remoteHIDClient)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(0LL, a2);
    self->_remoteHIDClient = v3;
    if (v3)
    {
      IOHIDEventSystemClientRegisterEventCallback(v3, sub_10004D704, 0LL, self);
      remoteHIDClient = self->_remoteHIDClient;
      CFRunLoopRef Main = CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop(remoteHIDClient, Main, kCFRunLoopDefaultMode);
      IOHIDEventSystemClientSetMatching(self->_remoteHIDClient, &off_1000D1180);
      CFArrayRef v6 = IOHIDEventSystemClientCopyServices(self->_remoteHIDClient);
      if (-[__CFArray count](v6, "count")) {
        self->_appleTVIRService = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndex:](v6, "objectAtIndex:", 0LL));
      }
    }
  }

- (void)_destroyRemoteHIDClient
{
  remoteHIDClient = self->_remoteHIDClient;
  if (remoteHIDClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback(remoteHIDClient, sub_10004D704, 0LL, self);
    id v4 = self->_remoteHIDClient;
    CFRunLoopRef Main = CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop(v4, Main, kCFRunLoopDefaultMode);
    CFRelease(self->_remoteHIDClient);
    self->_remoteHIDClient = 0LL;
  }

  appleTVIRService = self->_appleTVIRService;
  if (appleTVIRService)
  {
    CFRelease(appleTVIRService);
    self->_appleTVIRService = 0LL;
  }

- (void)_processHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 0x10000LL);
  uint64_t v6 = IOHIDEventGetIntegerValue(a3, 65537LL);
  if (IntegerValue == 65294 && v6 == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v8 deactivateScreenSaver];

    unsigned int v9 = -[SATVRemotePairingController _isDisplayAvailable](self, "_isDisplayAvailable");
    v10 = (os_log_s *)qword_1001099A0;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Display detected. Starting proximity pairing.",  buf,  2u);
      }

      -[SATVRemotePairingController _startProximityPairing](self, "_startProximityPairing");
    }

    else if (v11)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No display detected. Unable to start proximity pairing",  v12,  2u);
    }
  }

- (void)_startProximityPairing
{
  if (!self->_isProximityPairing)
  {
    self->_isProximityPairing = 1;
    v3 = (os_log_s *)qword_1001099A0;
    if (os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start proximity pairing", v6, 2u);
    }

    -[SATVRemotePairingController _stopFactoryPairing](self, "_stopFactoryPairing");
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v4 setAutoConnectWithImmediateProximityPeripheralsEnabled:1];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 postNotificationName:@"SATVRemotePairingControllerDidStartProximityPairing" object:0];
  }

- (void)_stopProximityPairing
{
  BOOL isProximityPairing = self->_isProximityPairing;
  id v4 = (os_log_s *)qword_1001099A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT);
  if (isProximityPairing)
  {
    if (v5)
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Stop proximity pairing (DERP)",  (uint8_t *)v9,  2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v6 setAutoConnectWithImmediateProximityPeripheralsEnabled:0];

    self->_BOOL isProximityPairing = 0;
  }

  else if (v5)
  {
    BOOL v7 = self->_isProximityPairing;
    BOOL isFactoryPairing = self->_isFactoryPairing;
    v9[0] = 67109376;
    v9[1] = v7;
    __int16 v10 = 1024;
    BOOL v11 = isFactoryPairing;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unable to stop proximity pairing (DERP). {isProximityPairing=%{BOOL}d, isFactoryPairing=%{BOOL}d}",  (uint8_t *)v9,  0xEu);
  }

- (void)_handlePeripheralStateChange:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVSPeripheralManagerUserInfoKeyPeripheral]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:TVSPeripheralManagerUserInfoKeyError]);

  v8 = (os_log_s *)qword_1001099A0;
  if (os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "handlePeripheralStateChange called. {peripheral=%@, error=%@}",  (uint8_t *)&v13,  0x16u);
  }

  if (v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    __int16 v10 = v9;
    BOOL v11 = @"SATVRemotePairingControllerProximityPairingFailed";
LABEL_7:
    [v9 postNotificationName:v11 object:0];

    goto LABEL_8;
  }

  if ([v5 state] == (id)1)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    __int16 v10 = v9;
    BOOL v11 = @"SATVRemotePairingControllerPeripheralIsConnecting";
    goto LABEL_7;
  }

- (void)_startFactoryPairing
{
  if (!self->_isFactoryPairing)
  {
    id v3 = (os_log_s *)qword_1001099A0;
    if (os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start factory remote pairing", v6, 2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v4 setFactoryPairingEnabled:1];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v5 startScanning];

    self->_BOOL isFactoryPairing = 1;
  }

- (void)_stopFactoryPairing
{
  if (self->_isFactoryPairing)
  {
    id v3 = (os_log_s *)qword_1001099A0;
    if (os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop factory remote pairing", v6, 2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v4 stopScanning];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[SATVBluetoothRemotePairingManager sharedInstance]( &OBJC_CLASS___SATVBluetoothRemotePairingManager,  "sharedInstance"));
    [v5 setFactoryPairingEnabled:0];

    self->_BOOL isFactoryPairing = 0;
  }

- (void)_bluetoothRemoteDidConnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:TVSPeripheralManagerUserInfoKeyRemoteType]);
  id v7 = [v6 integerValue];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ATVPeripheralManagerUserInfoKeyRemoteSupportsTVProvider"]);
  id v10 = [v9 BOOLValue];

  BOOL v11 = (void *)qword_1001099A0;
  if (os_log_type_enabled((os_log_t)qword_1001099A0, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    uint64_t v13 = TVSBluetoothRemoteTypeLogString(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v18 = 138412546;
    v19 = v14;
    __int16 v20 = 1024;
    int v21 = (int)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Bluetooth remote connected. {remoteType=%@, remoteSupportsTVProvider=%{BOOL}d}",  (uint8_t *)&v18,  0x12u);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBluetoothRemoteTypeManager sharedInstance]( &OBJC_CLASS___TVSKBluetoothRemoteTypeManager,  "sharedInstance"));
  [v15 setRemoteSupportsTVProvider:v10];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBluetoothRemoteTypeManager sharedInstance]( &OBJC_CLASS___TVSKBluetoothRemoteTypeManager,  "sharedInstance"));
  [v16 setRemoteType:v7];

  -[SATVRemotePairingController _stopProximityPairing](self, "_stopProximityPairing");
  -[SATVRemotePairingController _stopFactoryPairing](self, "_stopFactoryPairing");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v17 postNotificationName:@"SATVRemotePairingControllerBluetoothRemoteDidConnectNotification" object:0];
}

- (__IOHIDServiceClient)appleTVIRService
{
  return self->_appleTVIRService;
}

- (void)setAppleTVIRService:(__IOHIDServiceClient *)a3
{
  self->_appleTVIRService = a3;
}

- (__IOHIDEventSystemClient)remoteHIDClient
{
  return self->_remoteHIDClient;
}

- (void)setRemoteHIDClient:(__IOHIDEventSystemClient *)a3
{
  self->_remoteHIDClient = a3;
}

- (BOOL)isProximityPairing
{
  return self->_isProximityPairing;
}

- (void)setIsProximityPairing:(BOOL)a3
{
  self->_BOOL isProximityPairing = a3;
}

- (BOOL)isFactoryPairing
{
  return self->_isFactoryPairing;
}

- (void)setIsFactoryPairing:(BOOL)a3
{
  self->_BOOL isFactoryPairing = a3;
}

@end