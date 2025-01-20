@interface SDAirDropServer
- (BOOL)discoverableByContactsOnly;
- (BOOL)discoverableByEveryone;
- (BOOL)thisIsTheFinder;
- (NSString)clientBundleID;
- (NSString)description;
- (SDAirDropServer)init;
- (SDAirDropServerDelegate)delegate;
- (id)sslSettings;
- (int)clientPid;
- (void)_createOSTransactionIfNeeded;
- (void)activate;
- (void)addObservers;
- (void)airDropInformation:(id)a3 didChange:(id)a4;
- (void)airDropStatusChanged:(id)a3;
- (void)airDropUnpublished:(id)a3;
- (void)appleIDAccountInfoChanged:(id)a3;
- (void)appleIDChanged:(id)a3;
- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlDidUpdateState:(id)a3;
- (void)awdlTimeoutFired:(id)a3;
- (void)bluetoothChanged:(id)a3;
- (void)bonjourPublisher:(id)a3 propertiesDidChange:(id)a4;
- (void)consoleUserChanged:(id)a3;
- (void)dealloc;
- (void)didCloseConnection:(_CFHTTPServerConnection *)a3;
- (void)didOpenConnection:(_CFHTTPServerConnection *)a3;
- (void)didReceiveError:(__CFError *)a3;
- (void)discoverableModeChanged:(id)a3;
- (void)finderAirDropEnabled:(id)a3;
- (void)foundDevice:(id)a3;
- (void)handleFoundHashes:(id)a3 rssi:(id)a4;
- (void)handleTerminalCallBack;
- (void)invalidate;
- (void)invalidateTimers;
- (void)keyBagFirstUnlock:(id)a3;
- (void)logDiscoveryWithHash:(id)a3 rssi:(id)a4;
- (void)notifyClient:(int64_t)a3 withResults:(id)a4;
- (void)publishedInfoChanged:(id)a3;
- (void)removeObservers;
- (void)screenStateChange:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startHTTPServer:(unsigned __int16)a3;
- (void)startProximityScanner;
- (void)startServer;
- (void)startTimers;
- (void)stop;
- (void)stopProximityScanner;
- (void)stopScanningAndStartServer;
- (void)systemHasPoweredOn:(id)a3;
- (void)systemWillSleep:(id)a3;
- (void)updateServerState;
- (void)wirelessChanged:(id)a3;
@end

@implementation SDAirDropServer

- (SDAirDropServer)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SDAirDropServer;
  v2 = -[SDAirDropServer init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    v2->_identity = 0LL;
    v2->_server = 0LL;
    v2->_startTime = 0.0;
    proximity = v2->_proximity;
    v2->_proximity = 0LL;

    awdlTimer = v3->_awdlTimer;
    v3->_awdlTimer = 0LL;

    publisher = v3->_publisher;
    v3->_publisher = 0LL;

    coalescer = v3->_coalescer;
    v3->_coalescer = 0LL;

    portNumber = v3->_portNumber;
    v3->_portNumber = 0LL;

    information = v3->_information;
    v3->_information = 0LL;

    transaction = v3->_transaction;
    v3->_transaction = 0LL;

    v3->_contactsOnly = 0;
    bluetoothTimer = v3->_bluetoothTimer;
    v3->_bluetoothTimer = 0LL;

    objc_storeStrong((id *)&v3->_queue, &_dispatch_main_q);
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    discoveredHashes = v3->_discoveredHashes;
    v3->_discoveredHashes = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v16;

    v3->_screenOn = -[SDStatusMonitor screenOn](v3->_monitor, "screenOn");
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](v3->_monitor, "discoverableMode"));
    discoverableMode = v3->_discoverableMode;
    v3->_discoverableMode = (NSString *)v18;

    v3->_connections = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    scanningIdentifier = v3->_scanningIdentifier;
    v3->_scanningIdentifier = 0LL;

    uint64_t v22 = airdrop_log(v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "AirDrop server initialized",  (uint8_t *)v25,  2u);
    }
  }

  return v3;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropServer;
  -[SDAirDropServer dealloc](&v4, "dealloc");
}

- (void)handleTerminalCallBack
{
  uint64_t v3 = airdrop_log(self);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AirDrop server invalidation complete", buf, 2u);
  }

  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0LL;
  }

  portNumber = self->_portNumber;
  self->_portNumber = 0LL;

  if (self->_publisher)
  {
    sub_10002FA6C( (uint64_t)@"BonjourAdvertise",  (uint64_t)@"Stop",  (uint64_t)self->_clientBundleID,  self->_clientPid);
    -[SDAirDropPublisher setDelegate:](self->_publisher, "setDelegate:", 0LL);
    -[SDAirDropPublisher invalidate](self->_publisher, "invalidate");
    publisher = self->_publisher;
    self->_publisher = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E8F4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startTimers
{
  if (!CFDictionaryGetCount(self->_connections))
  {
    uint64_t v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "awdlTimeoutFired:",  0LL,  0LL,  20.0));
    awdlTimer = self->_awdlTimer;
    self->_awdlTimer = v3;

    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "bluetoothTimeoutFired:",  0LL,  0LL,  15.0));
    bluetoothTimer = self->_bluetoothTimer;
    self->_bluetoothTimer = v5;
  }

- (void)invalidateTimers
{
  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    -[NSTimer invalidate](awdlTimer, "invalidate");
    objc_super v4 = self->_awdlTimer;
    self->_awdlTimer = 0LL;
  }

  bluetoothTimer = self->_bluetoothTimer;
  if (bluetoothTimer)
  {
    -[NSTimer invalidate](bluetoothTimer, "invalidate");
    v6 = self->_bluetoothTimer;
    self->_bluetoothTimer = 0LL;
  }

- (void)didOpenConnection:(_CFHTTPServerConnection *)a3
{
  uint64_t v5 = airdrop_log(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "New AirDrop connection %p",  (uint8_t *)&v12,  0xCu);
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = (const void *)kSFOperationContactsOnlyKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_contactsOnly));
  CFDictionarySetValue(Mutable, v8, v9);

  CFDictionarySetValue(Mutable, kSFOperationHTTPServerConnectionKey, a3);
  CFDictionarySetValue(self->_connections, a3, a3);
  v10 = (SDAirDropServer *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor finderServer](self->_monitor, "finderServer"));
  v11 = v10;
  if (!v10) {
    v10 = self;
  }
  -[SDAirDropServer notifyClient:withResults:](v10, "notifyClient:withResults:", 1LL, Mutable);
  -[SDAirDropServer invalidateTimers](self, "invalidateTimers");
  CFRelease(Mutable);
}

- (void)didCloseConnection:(_CFHTTPServerConnection *)a3
{
  uint64_t v5 = airdrop_log(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Closed AirDrop connection %p",  (uint8_t *)&v12,  0xCu);
  }

  id v7 = sub_10003459C(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8) {
    [v8 didCloseConnection];
  }
  CFDictionaryRemoveValue(self->_connections, a3);
  if (!-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole")
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser")),
        unsigned __int8 v11 = [v10 isAirDropEnabled],
        v10,
        (v11 & 1) == 0))
  {
    -[SDAirDropServer startTimers](self, "startTimers");
  }
}

- (void)didReceiveError:(__CFError *)a3
{
  uint64_t v5 = airdrop_log(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100081514((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);
  }

  -[SDAirDropServer handleTerminalCallBack](self, "handleTerminalCallBack");
  CFErrorDomain Domain = CFErrorGetDomain(a3);
  int v14 = CFEqual(Domain, _kCFHTTPServerErrorDomain);
  CFIndex Code = CFErrorGetCode(a3);
  if ((v14 && Code == 1002 || CFErrorGetCode(a3) == 48)
    && (id v16 = -[NSNumber isEqual:](self->_portNumber, "isEqual:", &off_1005F7660), (_DWORD)v16))
  {
    uint64_t v17 = airdrop_log(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Trying again with random port number",  v20,  2u);
    }

    -[SDAirDropServer startHTTPServer:](self, "startHTTPServer:", 0LL);
  }

  else
  {
    uint64_t v21 = kSFOperationErrorKey;
    uint64_t v22 = a3;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    -[SDAirDropServer notifyClient:withResults:](self, "notifyClient:withResults:", 10LL, v19);
  }

- (void)publishedInfoChanged:(id)a3
{
  id v4 = a3;
  if (self->_startTime != 0.0)
  {
    id v11 = v4;
    if ([v4 count])
    {
      -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
      -[NSMutableDictionary addEntriesFromDictionary:](self->_properties, "addEntriesFromDictionary:", v11);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSFOperationLegacyDeviceKey);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessCarPlay](self->_monitor, "wirelessCarPlay")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v5,  kSFOperationWirelessCarPlayKey);

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v6,  kSFOperationWirelessEnabledKey);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v7,  kSFOperationBluetoothEnabledKey);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor airplaneModeEnabled](self->_monitor, "airplaneModeEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v8,  kSFOperationAirplaneModeEnabledKey);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor computerToComputer](self->_monitor, "computerToComputer")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v9,  kSFOperationComputerToComputerKey);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDStatusMonitor wirelessAccessPoint](self->_monitor, "wirelessAccessPoint")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v10,  kSFOperationWirelessAccessPointKey);

    -[SDAirDropServer notifyClient:withResults:](self, "notifyClient:withResults:", 12LL, self->_properties);
    id v4 = v11;
  }
}

- (void)awdlTimeoutFired:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AirDrop server idle timeout", v6, 2u);
  }

  -[SDAirDropServer stop](self, "stop");
  -[SDAirDropServer updateServerState](self, "updateServerState");
}

- (void)wirelessChanged:(id)a3
{
}

- (void)bluetoothChanged:(id)a3
{
}

- (void)airDropStatusChanged:(id)a3
{
  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    BOOL v4 = -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole");
    if (v4)
    {
      uint64_t v5 = airdrop_log(v4);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AirDrop status changed", v7, 2u);
      }

      -[CUCoalescer trigger](self->_coalescer, "trigger");
    }
  }

- (void)appleIDAccountInfoChanged:(id)a3
{
  BOOL v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    uint64_t v5 = airdrop_log(v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed", v7, 2u);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }

- (void)appleIDChanged:(id)a3
{
  BOOL v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    uint64_t v5 = airdrop_log(v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apple ID account changed", v7, 2u);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }

- (void)systemWillSleep:(id)a3
{
  BOOL v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4 && self->_startTime != 0.0)
  {
    uint64_t v5 = airdrop_log(v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = getuid();
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Stopping AirDrop server for user %d on sleep",  (uint8_t *)v7,  8u);
    }

    -[SDAirDropServer stop](self, "stop");
  }

- (void)systemHasPoweredOn:(id)a3
{
  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3) && self->_startTime == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      uint64_t v5 = WeakRetained;
      unsigned int v6 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");

      if (v6)
      {
        uint64_t v8 = airdrop_log(v7);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10[0] = 67109120;
          v10[1] = getuid();
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting AirDrop server for user %d on wake",  (uint8_t *)v10,  8u);
        }

        -[SDAirDropServer start](self, "start");
      }
    }
  }

- (void)consoleUserChanged:(id)a3
{
  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    BOOL v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");
    double startTime = self->_startTime;
    if (v4)
    {
      if (startTime == 0.0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

        if (WeakRetained)
        {
          uint64_t v8 = airdrop_log(v7);
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 67109120;
            uid_t v13 = getuid();
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting AirDrop server for user %d on login",  (uint8_t *)&v12,  8u);
          }

          -[SDAirDropServer start](self, "start");
        }
      }
    }

    else if (startTime != 0.0)
    {
      uint64_t v10 = airdrop_log(v4);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109120;
        uid_t v13 = getuid();
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stopping AirDrop server for user %d on logout",  (uint8_t *)&v12,  8u);
      }

      -[SDAirDropServer stop](self, "stop");
    }
  }

- (void)finderAirDropEnabled:(id)a3
{
  BOOL v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    uint64_t v5 = airdrop_log(v4);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = -[SDStatusMonitor finderAirDropEnabled](self->_monitor, "finderAirDropEnabled");
      uint64_t v8 = @"exited";
      if (v7) {
        uint64_t v8 = @"entered";
      }
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finder %@ AirDrop", (uint8_t *)&v9, 0xCu);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }

- (void)discoverableModeChanged:(id)a3
{
  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
    discoverableMode = self->_discoverableMode;
    self->_discoverableMode = v4;

    uint64_t v7 = airdrop_log(v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_discoverableMode;
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Discoverable mode changed to %@",  (uint8_t *)&v10,  0xCu);
    }

    -[SDAirDropServer stop](self, "stop");
    -[SDAirDropServer updateServerState](self, "updateServerState");
  }

- (void)keyBagFirstUnlock:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device first unlock", v6, 2u);
  }

  -[SDAirDropServer updateServerState](self, "updateServerState");
}

- (void)screenStateChange:(id)a3
{
  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    BOOL screenOn = self->_screenOn;
    if (screenOn != -[SDStatusMonitor screenOn](self->_monitor, "screenOn"))
    {
      BOOL v5 = -[SDStatusMonitor screenOn](self->_monitor, "screenOn");
      self->_BOOL screenOn = v5;
      uint64_t v6 = airdrop_log(v5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_screenOn) {
          uint64_t v8 = @"on";
        }
        else {
          uint64_t v8 = @"off";
        }
        int v9 = 138412290;
        int v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screen turned %@", (uint8_t *)&v9, 0xCu);
      }

      -[SDAirDropServer updateServerState](self, "updateServerState");
    }
  }

- (BOOL)discoverableByEveryone
{
  return -[NSString isEqual:]( self->_discoverableMode,  "isEqual:",  kSFOperationDiscoverableModeEveryone);
}

- (BOOL)discoverableByContactsOnly
{
  return -[NSString isEqual:]( self->_discoverableMode,  "isEqual:",  kSFOperationDiscoverableModeContactsOnly);
}

- (void)stopScanningAndStartServer
{
}

- (void)handleFoundHashes:(id)a3 rssi:(id)a4
{
  id v6 = a3;
  -[SDAirDropServer logDiscoveryWithHash:rssi:](self, "logDiscoveryWithHash:rssi:", v6, a4);
  BOOL v7 = -[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone");
  if (v7)
  {
    uint64_t v8 = airdrop_log(v7);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      int v10 = "In Everyone mode, start server";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  if (-[SDAirDropServer discoverableByContactsOnly](self, "discoverableByContactsOnly"))
  {
    BOOL v13 = -[SDStatusMonitor contactsContainsShortHashes:](self->_monitor, "contactsContainsShortHashes:", v6);
    BOOL v14 = v13;
    uint64_t v15 = airdrop_log(v13);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v16 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        int v17 = 138412290;
        id v18 = v6;
        int v10 = "Hashes %@ exist in contacts, start server";
        id v11 = v9;
        uint32_t v12 = 12;
        goto LABEL_8;
      }

- (void)logDiscoveryWithHash:(id)a3 rssi:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableSet containsObject:](self->_discoveredHashes, "containsObject:", v6);
  int v9 = (int)v8;
  uint64_t v10 = airdrop_log(v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint32_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100081578((uint64_t)v6, (uint64_t)v7, v12);
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BTLE discovered hashes %@ rssi %@",  (uint8_t *)&v13,  0x16u);
    }

    -[NSMutableSet addObject:](self->_discoveredHashes, "addObject:", v6);
  }
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "subdataWithRange:", 1, 8));
  -[SDAirDropServer handleFoundHashes:rssi:](self, "handleFoundHashes:rssi:", v8, v7);
}

- (void)awdlDidUpdateState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 state];
  else {
    uint64_t v5 = *((void *)&off_1005CCB38 + (void)v4);
  }
  uint64_t v6 = airdrop_log(v4);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTLE scanner %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v3 state] == (id)3) {
    [v3 startConnectionlessAWDLServiceScanning];
  }
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = airdrop_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000815F8((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)updateServerState
{
  if (-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder")) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    unsigned int v5 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");
    unsigned int v6 = -[SDStatusMonitor deviceWasUnlockedOnce](self->_monitor, "deviceWasUnlockedOnce");
    BOOL v7 = -[SDAirDropServer discoverableByContactsOnly](self, "discoverableByContactsOnly");
    BOOL v8 = v7;
    if (v7)
    {
      int v9 = 1;
    }

    else
    {
      BOOL v7 = -[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone");
      int v9 = v7;
    }

    if ((v5 & v9) == 1 && (self->_screenOn ? (unsigned int v12 = v6) : (unsigned int v12 = 0), v12 == 1))
    {
      -[SDAirDropServer _createOSTransactionIfNeeded](self, "_createOSTransactionIfNeeded");
      self->_contactsOnly = v8;
      uint64_t v13 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode");
      if ((v13 & 1) != 0)
      {
LABEL_15:
        uint64_t v14 = airdrop_log(v13);
        __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Auto-trigger server",  (uint8_t *)&v24,  2u);
        }

        -[SDAirDropServer startServer](self, "startServer");
        return;
      }

      if (-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
        if ([v19 isAirDropEnabled])
        {

          goto LABEL_15;
        }

        char IsVirtualMachine = SFDeviceIsVirtualMachine();

        if ((IsVirtualMachine & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v13 = SFDeviceIsVirtualMachine();
        if ((_DWORD)v13) {
          goto LABEL_15;
        }
      }

      uint64_t v21 = airdrop_log(-[SDAirDropServer startProximityScanner](self, "startProximityScanner"));
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_contactsOnly) {
          v23 = @"Contacts Only";
        }
        else {
          v23 = @"Everyone";
        }
        int v24 = 138412290;
        *(void *)v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scanning mode %@", (uint8_t *)&v24, 0xCu);
      }
    }

    else
    {
      uint64_t v16 = airdrop_log(v7);
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        BOOL screenOn = self->_screenOn;
        int v24 = 67109888;
        *(_DWORD *)v25 = v5;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v9;
        __int16 v26 = 1024;
        BOOL v27 = screenOn;
        __int16 v28 = 1024;
        unsigned int v29 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Scanning mode off: console=%d, discoverable=%d, screenOn=%d, unlockedOnce=%d",  (uint8_t *)&v24,  0x1Au);
      }

      -[SDAirDropServer stop](self, "stop");
    }
  }

  else
  {
    uint64_t v10 = airdrop_log(v4);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008165C();
    }
  }

- (void)airDropUnpublished:(id)a3
{
  uint64_t v4 = (SDAirDropServer *)objc_claimAutoreleasedReturnValue([a3 object]);
  if (v4 == self || self->_server) {
    goto LABEL_9;
  }
  int v9 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v6 = WeakRetained;
  if (!WeakRetained || !self->_screenOn)
  {

    uint64_t v4 = v9;
LABEL_9:

    return;
  }

  unsigned int v7 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");

  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008001C;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(queue, block);
  }

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"keyBagFirstUnlock:" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessCarPlayChanged" object:0];
  [v3 addObserver:self selector:"appleIDAccountInfoChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
  [v3 addObserver:self selector:"appleIDChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"airDropUnpublished:" name:@"com.apple.sharingd.AirDropUnpublished" object:0];
  [v3 addObserver:self selector:"airDropStatusChanged:" name:@"com.apple.sharingd.AirDropStatusChanged" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessModeChanged" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
  [v3 addObserver:self selector:"screenStateChange:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
  [v3 addObserver:self selector:"bluetoothChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  [v3 addObserver:self selector:"discoverableModeChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained airDropServer:self event:a3 withResults:v7];
}

- (void)bonjourPublisher:(id)a3 propertiesDidChange:(id)a4
{
}

- (id)sslSettings
{
  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS")) {
    return 0LL;
  }
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  _kCFStreamSSLShouldSetPeerID);
  id v6 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  _kCFHTTPServerStreamSSLSettings);
  if (self->_identity)
  {
    id v7 = -[SDStatusMonitor copyMyAppleIDIntermediateCertificate](self->_monitor, "copyMyAppleIDIntermediateCertificate");
    if (v7)
    {
      BOOL v8 = v7;
      v15[0] = self->_identity;
      v15[1] = v7;
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v9,  _kCFHTTPServerServerTrustChain);

      CFRelease(v8);
    }

    else
    {
      uint64_t v12 = airdrop_log(0LL);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100081688();
      }
    }
  }

  else
  {
    uint64_t v10 = airdrop_log(v6);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "AirDrop using self-signed certificate",  v14,  2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  _kCFHTTPServerAllowAnonymousServer);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  _kCFHTTPServerRequireClientCertificate);

  return v4;
}

- (void)startHTTPServer:(unsigned __int16)a3
{
  if (!self->_server && self->_startTime != 0.0)
  {
    v23[0] = 0LL;
    v23[1] = self;
    v23[2] = &_CFRetain;
    v23[3] = &_CFRelease;
    v23[4] = 0LL;
    v21[0] = unk_1005CCAE8;
    v21[1] = *(_OWORD *)off_1005CCAF8;
    uint64_t v22 = sub_10008074C;
    Service = (_CFHTTPServer *)_CFHTTPServerCreateService(0LL, v23, v21, 0LL, 0LL, a3);
    self->_server = Service;
    if (Service)
    {
      _CFHTTPServerSetProperty(Service, _kCFHTTPServerSSLSettings, -[SDAirDropServer sslSettings](self, "sslSettings"));
      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerIdleTimeout, &off_1005F7678);
      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerWatchdogTimeout, &off_1005F7690);
      if (!sub_1001164C4() && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode")
        || SFDeviceIsVirtualMachine())
      {
        unsigned int v5 = -[SDStatusMonitor registerAllInterfaces](self->_monitor, "registerAllInterfaces");
        id v6 = (__CFString **)&_kCFHTTPServerAllInterfacesIdentifier;
        if (!v5) {
          id v6 = &off_1005CB6E8;
        }
        _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerBoundInterfaceIdentifier, *v6);
      }

      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerReuseLocalAddress, kCFBooleanTrue);
      server = self->_server;
      CFRunLoopRef Main = CFRunLoopGetMain();
      _CFHTTPServerScheduleWithRunLoopAndMode(server, Main, kCFRunLoopDefaultMode);
      int v9 = (NSNumber *)_CFHTTPServerCopyProperty(self->_server, _kCFHTTPServerServicePort);
      portNumber = self->_portNumber;
      self->_portNumber = v9;

      uint64_t v11 = self->_portNumber;
      uint64_t v13 = airdrop_log(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      __int16 v15 = v14;
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = self->_portNumber;
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AirDrop server scheduled on port %@",  buf,  0xCu);
        }

        sub_10002FA6C( (uint64_t)@"BonjourAdvertise",  (uint64_t)@"Start",  (uint64_t)self->_clientBundleID,  self->_clientPid);
        int v17 = -[SDAirDropPublisher initWithPort:identity:]( objc_alloc(&OBJC_CLASS___SDAirDropPublisher),  "initWithPort:identity:",  self->_portNumber,  self->_identity);
        publisher = self->_publisher;
        self->_publisher = v17;

        -[SDAirDropPublisher setDelegate:](self->_publisher, "setDelegate:", self);
        -[SDAirDropPublisher start](self->_publisher, "start");
      }

      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000816E0();
        }
      }
    }

    else
    {
      uint64_t v19 = airdrop_log(0LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000816B4();
      }
    }
  }

- (void)startProximityScanner
{
  id v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "askToAirdropEnabled");
  int v4 = (int)v3;
  if ((!(_DWORD)v3 || self->_scanningIdentifier) && self->_proximity
    || (id v3 = (id)CFDictionaryGetCount(self->_connections)) != 0LL)
  {
    uint64_t v5 = airdrop_log(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = self->_scanningIdentifier != 0LL;
      CFIndex Count = CFDictionaryGetCount(self->_connections);
      *(_DWORD *)buf = 67109376;
      BOOL v19 = v7;
      __int16 v20 = 2048;
      CFIndex v21 = Count;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "BTLE scanning not starting: scanningIdentifier=%d, count=%ld",  buf,  0x12u);
    }

    goto LABEL_7;
  }

  uint64_t v9 = airdrop_log(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTLE scanning started", buf, 2u);
  }

  sub_10002FA6C( (uint64_t)@"BluetoothScanning",  (uint64_t)@"Start",  (uint64_t)self->_clientBundleID,  self->_clientPid);
  if (v4)
  {
    uint64_t v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    scanningIdentifier = self->_scanningIdentifier;
    self->_scanningIdentifier = v11;

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SDAirDropBLEController shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary22SDAirDropBLEController,  "shared"));
    uint64_t v13 = self->_scanningIdentifier;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008096C;
    v17[3] = &unk_1005CCB18;
    v17[4] = self;
    -[os_log_s startScanningWithIdentifier:deviceUpdatesHandler:]( v6,  "startScanningWithIdentifier:deviceUpdatesHandler:",  v13,  v17);
LABEL_7:

    return;
  }

  uint64_t v14 = -[WPAWDL initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___WPAWDL),  "initWithDelegate:queue:",  self,  self->_queue);
  proximity = self->_proximity;
  self->_proximity = v14;

  uint64_t v16 = self->_proximity;
  if (v16 && -[WPAWDL state](v16, "state") == (id)3) {
    -[WPAWDL startConnectionlessAWDLServiceScanning](self->_proximity, "startConnectionlessAWDLServiceScanning");
  }
}

- (void)stopProximityScanner
{
  id v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "askToAirdropEnabled");
  int v4 = (int)v3;
  if ((_DWORD)v3 && self->_scanningIdentifier || self->_proximity)
  {
    uint64_t v5 = airdrop_log(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTLE scanning stopped", v10, 2u);
    }

    sub_10002FA6C( (uint64_t)@"BluetoothScanning",  (uint64_t)@"Stop",  (uint64_t)self->_clientBundleID,  self->_clientPid);
    if (v4)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropBLEController shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary22SDAirDropBLEController,  "shared"));
      p_scanningIdentifier = (void **)&self->_scanningIdentifier;
      [v7 stopScanningWithIdentifier:self->_scanningIdentifier];
    }

    else
    {
      p_scanningIdentifier = (void **)&self->_proximity;
      -[WPAWDL stopConnectionlessAWDLServiceScanning](self->_proximity, "stopConnectionlessAWDLServiceScanning");
      -[WPAWDL invalidate](self->_proximity, "invalidate");
    }

    uint64_t v9 = *p_scanningIdentifier;
    *p_scanningIdentifier = 0LL;

    -[NSMutableSet removeAllObjects](self->_discoveredHashes, "removeAllObjects");
  }

- (void)foundDevice:(id)a3
{
  id v4 = a3;
  LOBYTE(v8) = (unsigned __int16)[v4 airdropHash1] >> 8;
  BYTE1(v8) = objc_msgSend(v4, "airdropHash1", v8);
  BYTE2(v8) = (unsigned __int16)[v4 airdropHash2] >> 8;
  BYTE3(v8) = [v4 airdropHash2];
  BYTE4(v8) = (unsigned __int16)[v4 airdropHash3] >> 8;
  BYTE5(v8) = [v4 airdropHash3];
  BYTE6(v8) = (unsigned __int16)[v4 airdropHash4] >> 8;
  HIBYTE(v8) = [v4 airdropHash4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v8, 8LL));
  id v6 = [v4 bleRSSI];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  -[SDAirDropServer handleFoundHashes:rssi:](self, "handleFoundHashes:rssi:", v5, v7);
}

- (void)startServer
{
  if (!self->_server && self->_startTime == 0.0)
  {
    if (!-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS"))
    {
      identity = self->_identity;
      if (identity) {
        CFRelease(identity);
      }
      self->_identity = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
    }

    self->_double startTime = CFAbsoluteTimeGetCurrent();
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100080C60;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(queue, block);
  }

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
}

- (BOOL)thisIsTheFinder
{
  return -[NSString isEqualToString:](self->_clientBundleID, "isEqualToString:", @"com.apple.finder");
}

- (void)start
{
  BOOL v3 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder");
  if (v3)
  {
    -[SDAirDropServer _createOSTransactionIfNeeded](self, "_createOSTransactionIfNeeded");
    -[SDStatusMonitor setFinderServer:](self->_monitor, "setFinderServer:", self);
    id v4 = objc_alloc_init(&OBJC_CLASS___SDAirDropInformation);
    information = self->_information;
    self->_information = v4;

    -[SDAirDropInformation setDelegate:](self->_information, "setDelegate:", self);
    -[SDAirDropInformation start](self->_information, "start");
  }

  else
  {
    uint64_t v6 = airdrop_log(v3);
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirDrop server started", buf, 2u);
    }

    if (dword_100669390)
    {
      dispatch_time_t v8 = sub_100114580(2.0);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100080DD4;
      block[3] = &unk_1005CB2F8;
      block[4] = self;
      dispatch_after(v8, queue, block);
    }

    else
    {
      uint64_t v10 = (dispatch_queue_s *)self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100080DDC;
      v11[3] = &unk_1005CB2F8;
      v11[4] = self;
      dispatch_async(v10, v11);
    }
  }

- (void)stop
{
  BOOL v3 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder");
  if (v3)
  {
    -[SDStatusMonitor setFinderServer:](self->_monitor, "setFinderServer:", 0LL);
    -[SDAirDropInformation setDelegate:](self->_information, "setDelegate:", 0LL);
    -[SDAirDropInformation stop](self->_information, "stop");
    information = self->_information;
    self->_information = 0LL;
  }

  else
  {
    if (self->_startTime != 0.0)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      sub_10002F108(Current - self->_startTime);
      self->_double startTime = 0.0;
    }

    if (self->_server)
    {
      uint64_t v6 = airdrop_log(v3);
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalidating AirDrop server", v9, 2u);
      }

      _CFHTTPServerInvalidate(self->_server);
    }

    -[SDAirDropServer stopProximityScanner](self, "stopProximityScanner");
    -[SDAirDropServer invalidateTimers](self, "invalidateTimers");
  }

  transaction = self->_transaction;
  self->_transaction = 0LL;
}

- (void)activate
{
  if (!self->_coalescer)
  {
    BOOL v3 = self;
    id v4 = objc_opt_new(&OBJC_CLASS___CUCoalescer);
    coalescer = self->_coalescer;
    self->_coalescer = v4;

    -[CUCoalescer setDispatchQueue:](self->_coalescer, "setDispatchQueue:", v3->_queue);
    -[CUCoalescer setMaxDelay:](self->_coalescer, "setMaxDelay:", 0.4);
    -[CUCoalescer setMinDelay:](self->_coalescer, "setMinDelay:", 0.3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100080FA4;
    v6[3] = &unk_1005CB2F8;
    v6[4] = v3;
    -[CUCoalescer setActionHandler:](self->_coalescer, "setActionHandler:", v6);
    -[SDAirDropServer addObservers](v3, "addObservers");
    -[SDAirDropServer start](v3, "start");
  }

- (void)invalidate
{
  if (self->_transaction)
  {
    -[SDAirDropServer stop](self, "stop");
    -[SDAirDropServer removeObservers](self, "removeObservers");
    -[CUCoalescer invalidate](self->_coalescer, "invalidate");
    transaction = self->_transaction;
    self->_transaction = 0LL;
  }

- (NSString)description
{
  id v46 = 0LL;
  NSAppendPrintF(&v46, "AirDropServer\n");
  id v3 = v46;
  id v45 = v3;
  NSAppendPrintF(&v45, "--------------\n");
  id v4 = v45;

  id v44 = v4;
  NSAppendPrintF(&v44, "Discoverable mode:                   %@\n", self->_discoverableMode);
  id v5 = v44;

  id v43 = v5;
  if (self->_screenOn) {
    uint64_t v6 = "yes";
  }
  else {
    uint64_t v6 = "no";
  }
  NSAppendPrintF(&v43, "Screen On:                           %s\n", v6);
  id v7 = v43;

  id v42 = v7;
  if (self->_contactsOnly) {
    dispatch_time_t v8 = "yes";
  }
  else {
    dispatch_time_t v8 = "no";
  }
  NSAppendPrintF(&v42, "Discoverable by contacts only:       %s\n", v8);
  id v9 = v42;

  id v41 = v9;
  if (-[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone")) {
    uint64_t v10 = "yes";
  }
  else {
    uint64_t v10 = "no";
  }
  NSAppendPrintF(&v41, "Discoverable by everyone:            %s\n", v10);
  id v11 = v41;

  id v40 = v11;
  if (-[SDStatusMonitor deviceWasUnlockedOnce](self->_monitor, "deviceWasUnlockedOnce")) {
    uint64_t v12 = "yes";
  }
  else {
    uint64_t v12 = "no";
  }
  NSAppendPrintF(&v40, "Unlocked once:                       %s\n", v12);
  id v13 = v40;

  id v39 = v13;
  NSAppendPrintF(&v39, "Port Number:                         %@\n", self->_portNumber);
  id v14 = v39;

  id v38 = v14;
  if (self->_proximity) {
    __int16 v15 = "yes";
  }
  else {
    __int16 v15 = "no";
  }
  NSAppendPrintF(&v38, "WirelessProx object:                 %s\n", v15);
  id v16 = v38;

  proximity = self->_proximity;
  if (proximity)
  {
    id v37 = v16;
    unint64_t v18 = (unint64_t)-[WPAWDL state](proximity, "state");
    BOOL v19 = v18 > 5 ? "?" : off_1005CCB58[v18];
    NSAppendPrintF(&v37, "WirelessProx state:                  %s\n", v19);
    id v20 = v37;

    id v36 = v20;
    NSAppendPrintF( &v36,  "Discovered hashes count:             %d\n",  -[NSMutableSet count](self->_discoveredHashes, "count"));
    id v16 = v36;

    if (-[NSMutableSet count](self->_discoveredHashes, "count"))
    {
      id v35 = v16;
      CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_discoveredHashes, "allObjects"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));
      NSAppendPrintF(&v35, "Discovered hashes:                   %@\n", v22);
      id v23 = v35;

      id v16 = v23;
    }
  }

  id v34 = v16;
  if (self->_server) {
    int v24 = "yes";
  }
  else {
    int v24 = "no";
  }
  NSAppendPrintF(&v34, "HTTP Server:                         %s\n", v24);
  id v25 = v34;

  if (self->_server)
  {
    id v33 = v25;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    NSAppendPrintF( &v33,  "HTTP Server up time:                 %ll{dur}\n",  (unint64_t)(Current - self->_startTime));
    id v27 = v33;

    id v25 = v27;
  }

  connections = self->_connections;
  if (connections && CFDictionaryGetCount(connections))
  {
    id v32 = v25;
    int Count = CFDictionaryGetCount(self->_connections);
    NSAppendPrintF(&v32, "HTTP Server connections:             %d\n", Count);
    id v30 = v32;

    id v25 = v30;
  }

  return (NSString *)v25;
}

- (void)_createOSTransactionIfNeeded
{
  if (!self->_transaction)
  {
    id v3 = (OS_os_transaction *)os_transaction_create("SDAirDropServer");
    transaction = self->_transaction;
    self->_transaction = v3;
  }

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (SDAirDropServerDelegate)delegate
{
  return (SDAirDropServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end