@interface SDBonjourBrowser
+ (void)updateFriendRPIdentityForAccountID:(id)a3 withAirDropClientInfo:(id)a4;
- (BOOL)checkDiscoveryEntitlement;
- (BOOL)preferVibrantIcons;
- (BOOL)shouldStart;
- (BOOL)startCalled;
- (BOOL)thisIsTheFinder;
- (BOOL)validAirDropInterface:(unsigned int)a3;
- (NSArray)nodes;
- (NSArray)types;
- (NSString)bundleID;
- (NSString)description;
- (NSString)domain;
- (NSString)sessionID;
- (OS_xpc_object)xpcConnection;
- (SDBonjourBrowser)initWithDomain:(id)a3 types:(id)a4;
- (SDBonjourBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)copyNodeForName:(id)a3;
- (__SFNode)copyNodeForService:(id)a3;
- (id)colorArrayFromEcolor:(id)a3 icolor:(id)a4;
- (id)odiskMountPoints:(id)a3;
- (id)queryKey:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6;
- (id)serviceFromServiceName:(id)a3;
- (id)valueForKey:(id)a3 inTXTRecord:(const void *)a4 withLength:(unsigned __int16)a5;
- (int)transfersCompleted;
- (int)transfersInitiated;
- (int64_t)mode;
- (unsigned)getInterface:(unsigned int)a3;
- (void)addObservers;
- (void)addQueryToDictionary:(_DNSServiceRef_t *)a3 name:(id)a4 type:(id)a5 domain:(id)a6 recordType:(unsigned __int16)a7;
- (void)addService:(id)a3 type:(id)a4 domain:(id)a5 interface:(unsigned int)a6;
- (void)advertiseHashes;
- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropPublished:(id)a3;
- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlDidUpdateState:(id)a3;
- (void)cancelAirDropRequests;
- (void)cancelIdentityQueries;
- (void)cleanupAirDropRequest:(id)a3;
- (void)cleanupRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6;
- (void)cleanupRecordQueryForKey:(id)a3;
- (void)cleanupRecordQueryForNetService:(id)a3 recordType:(unsigned __int16)a4;
- (void)clearCache;
- (void)clearCacheAndNotify;
- (void)commentChanged:(id)a3 comment:(id)a4;
- (void)consoleUserChanged:(id)a3;
- (void)contactsChanged:(id)a3;
- (void)dealloc;
- (void)deviceInfoChanged:(id)a3 model:(id)a4 ecolor:(id)a5 icolor:(id)a6 osxvers:(id)a7;
- (void)handleBrowseCallBack:(unsigned int)a3 interface:(unsigned int)a4 error:(int)a5 name:(const char *)a6 type:(const char *)a7 domain:(const char *)a8;
- (void)handleIdentity:(id)a3 withQueryID:(id)a4 emailOrPhone:(id)a5 error:(id)a6;
- (void)handleQueryCallBack:(unsigned int)a3 error:(int)a4 fullname:(const char *)a5 rrtype:(unsigned __int16)a6 rdlen:(unsigned __int16)a7 rdata:(const void *)a8;
- (void)invalidate;
- (void)linkStateChanged:(id)a3;
- (void)lockStatusChanged:(id)a3;
- (void)logAirDropDiscoveryInfoForNode:(__SFNode *)a3;
- (void)logAirDropSessionInfo;
- (void)notifyClient;
- (void)notifyClientIfDone:(unsigned int)a3;
- (void)personInfoChanged:(id)a3 flags:(id)a4 atag:(id)a5 cname:(id)a6 phash:(id)a7 ehash:(id)a8 nhash:(id)a9;
- (void)processTXTRecordUpdate:(const char *)a3 rdlen:(unsigned __int16)a4 rdata:(const void *)a5;
- (void)queryRecordTimerCallBack:(id)a3;
- (void)removeInvalidNodes:(id)a3;
- (void)removeObservers;
- (void)removeService:(id)a3 type:(id)a4 domain:(id)a5;
- (void)restartAfterDelay:(double)a3;
- (void)restartBrowser:(id)a3;
- (void)screenStatusChanged:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setTransfersCompleted:(int)a3;
- (void)setTransfersInitiated:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)startAirDropRequestForNode:(__SFNode *)a3;
- (void)startConnectionlessAdvertisingWithData:(id)a3;
- (void)startIdentityQueryForNode:(__SFNode *)a3;
- (void)startPictureQuery:(id)a3;
- (void)startRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6 interface:(unsigned int)a7;
- (void)stop;
- (void)stopConnectionlessAdvertising;
- (void)systemInfoChanged:(id)a3 diskInfo:(__CFDictionary *)a4;
- (void)updateBrowserState;
- (void)updateSecondaryNameForNodes:(id)a3;
- (void)updateServerCacheIfNeeded;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDBonjourBrowser

- (SDBonjourBrowser)initWithDomain:(id)a3 types:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SDBonjourBrowser;
  v9 = -[SDBonjourBrowser init](&v34, "init");
  v10 = v9;
  if (v9)
  {
    airDropRequests = v9->_airDropRequests;
    v9->_airDropRequests = 0LL;

    v10->_awdlIndex = 0;
    bundleID = v10->_bundleID;
    v10->_bundleID = 0LL;

    v10->_connection = 0LL;
    discoveredPeers = v10->_discoveredPeers;
    v10->_discoveredPeers = 0LL;

    objc_storeStrong((id *)&v10->_domain, a3);
    v10->_firstTime = 0.0;
    iconCache = v10->_iconCache;
    v10->_iconCache = 0LL;

    v10->_identityQueries = 0LL;
    isFinder = v10->_isFinder;
    v10->_isFinder = 0LL;

    v10->_maxServices = 0;
    v10->_mode = 0LL;
    proximity = v10->_proximity;
    v10->_proximity = 0LL;

    sessionID = v10->_sessionID;
    v10->_sessionID = 0LL;

    serverCache = v10->_serverCache;
    v10->_serverCache = 0LL;

    v10->_startTime = 0.0;
    *(void *)&v10->_transfersInitiated = 0LL;
    objc_storeStrong((id *)&v10->_types, a4);
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    servers = v10->_servers;
    v10->_servers = v19;

    v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    dnsQueries = v10->_dnsQueries;
    v10->_dnsQueries = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v10->_monitor;
    v10->_monitor = (SDStatusMonitor *)v23;

    v10->_isNetBIOS = [v8 containsObject:@"_netbios._udp."];
    v10->_isAirDrop = [v8 containsObject:sub_10008E590()];
    v10->_isWorkgroups = [v8 containsObject:@"_workgroups._udp."];
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v10,  "restartBrowser:",  0LL,  1LL,  1.0e30));
    restartTimer = v10->_restartTimer;
    v10->_restartTimer = (NSTimer *)v25;

    if (v10->_isAirDrop)
    {
      v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v28 = v10->_airDropRequests;
      v10->_airDropRequests = v27;

      v29 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      v30 = v10->_discoveredPeers;
      v10->_discoveredPeers = v29;

      v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v32 = v10->_iconCache;
      v10->_iconCache = v31;

      v10->_identityQueries = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }

    -[SDBonjourBrowser addObservers](v10, "addObservers");
  }

  return v10;
}

- (NSString)bundleID
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection && !self->_bundleID)
  {
    id v4 = sub_1001167C0(xpcConnection);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    bundleID = self->_bundleID;
    self->_bundleID = v5;
  }

  return self->_bundleID;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[SDBonjourBrowser stop](self, "stop");
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
    -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState");
  }

- (int64_t)mode
{
  return self->_mode;
}

- (void)restartBrowser:(id)a3
{
  if (self->_startCalled)
  {
    -[SDBonjourBrowser stop](self, "stop", a3);
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
    -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState");
  }

- (void)dealloc
{
  identityQueries = self->_identityQueries;
  if (identityQueries) {
    CFRelease(identityQueries);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDBonjourBrowser;
  -[SDBonjourBrowser dealloc](&v4, "dealloc");
}

- (void)clearCache
{
  serverCache = self->_serverCache;
  self->_serverCache = 0LL;
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if (self->_isAirDrop)
  {
    [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v3 addObserver:self selector:"airDropPublished:" name:@"com.apple.sharingd.AirDropPublished" object:0];
    [v3 addObserver:self selector:"lockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v3 addObserver:self selector:"screenStatusChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v3 addObserver:self selector:"contactsChanged:" name:@"com.apple.sharingd.ContactsChanged" object:0];
    [v3 addObserver:self selector:"consoleUserChanged:" name:@"com.apple.sharingd.ConsoleUserChanged" object:0];
    [v3 addObserver:self selector:"linkStateChanged:" name:@"com.apple.sharingd.AirDropLinkStateChanged" object:0];
    [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
    [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  }

  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.MulticastDNSChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (unsigned)getInterface:(unsigned int)a3
{
  if (self->_isAirDrop)
  {
    if (-[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces", *(void *)&a3))
    {
      LODWORD(v4) = 0;
    }

    else
    {
      LODWORD(v4) = self->_awdlIndex;
      if (!(_DWORD)v4)
      {
        uint64_t v4 = sub_100116A94();
        self->_awdlIndex = v4;
        if (!(_DWORD)v4)
        {
          uint64_t v5 = airdrop_log(v4);
          v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_1000D2494();
          }

          LODWORD(v4) = self->_awdlIndex;
        }
      }
    }
  }

  else if (self->_isWorkgroups)
  {
    LODWORD(v4) = -1;
  }

  else if (self->_isNetBIOS)
  {
    LODWORD(v4) = -1;
  }

  else
  {
    LODWORD(v4) = a3;
  }

  return v4;
}

- (BOOL)thisIsTheFinder
{
  isFinder = self->_isFinder;
  if (!isFinder)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser bundleID](self, "bundleID"));
    uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isEqualToString:@"com.apple.finder"]));
    v6 = self->_isFinder;
    self->_isFinder = v5;

    isFinder = self->_isFinder;
  }

  return -[NSNumber BOOLValue](isFinder, "BOOLValue");
}

- (BOOL)preferVibrantIcons
{
  return 1;
}

- (BOOL)checkDiscoveryEntitlement
{
  return sub_10008E24C(@"GateAirDropDiscovery", 0LL) != 0;
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = airdrop_log(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000D24C0((uint64_t)v6, (uint64_t)v7, v9);
  }
}

- (void)awdlDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  else {
    uint64_t v6 = *((void *)&off_1005CDC00 + (void)v5);
  }
  uint64_t v7 = airdrop_log(v5);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTLE advertiser %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [v4 state];
  if (v9 == (id)3) {
    -[SDBonjourBrowser advertiseHashes](self, "advertiseHashes");
  }
}

- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = airdrop_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000D2530((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)startConnectionlessAdvertisingWithData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = @"com.apple.airdrop";
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager btleAdvertisementDataForStrings:]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "btleAdvertisementDataForStrings:",  v5));
  }

  -[WPAWDL startConnectionlessAWDLServiceAdvertisingWithData:]( self->_proximity,  "startConnectionlessAWDLServiceAdvertisingWithData:",  v4);
}

- (void)stopConnectionlessAdvertising
{
  proximity = self->_proximity;
  self->_proximity = 0LL;
}

- (void)advertiseHashes
{
  proximity = self->_proximity;
  if (proximity && -[WPAWDL state](proximity, "state") == (id)3)
  {
    BOOL v4 = -[SDStatusMonitor enableAirDropAdvertising](self->_monitor, "enableAirDropAdvertising");
    if (v4)
    {
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myShortHashesForAirDrop](self->_monitor, "myShortHashesForAirDrop"));
      if (v5)
      {
        uint64_t v6 = airdrop_log( -[SDBonjourBrowser startConnectionlessAdvertisingWithData:]( self,  "startConnectionlessAdvertisingWithData:",  v5));
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          uint64_t v12 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BTLE advertising hashes %@",  (uint8_t *)&v11,  0xCu);
        }
      }

      else
      {
        uint64_t v9 = airdrop_log(0LL);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No email or phone number hashes to advertise",  (uint8_t *)&v11,  2u);
        }

        -[SDBonjourBrowser startConnectionlessAdvertisingWithData:]( self,  "startConnectionlessAdvertisingWithData:",  0LL);
      }

      sub_10002FA6C( (uint64_t)@"BluetoothAdvertise",  (uint64_t)@"Start",  (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"),  0LL);
    }

    else
    {
      uint64_t v8 = airdrop_log(v4);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "BTLE advertising disabled",  (uint8_t *)&v11,  2u);
      }
    }
  }

- (BOOL)shouldStart
{
  if (self->_startCalled)
  {
    if (self->_isAirDrop)
    {
      BOOL v3 = -[SDStatusMonitor screenOn](self->_monitor, "screenOn");
      if (v3)
      {
        BOOL v3 = -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled");
        if (v3) {
          LOBYTE(v3) = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
        }
      }
    }

    else
    {
      LOBYTE(v3) = 1;
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)updateBrowserState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser domain](self, "domain"));
  unsigned int v4 = -[SDBonjourBrowser shouldStart](self, "shouldStart");
  if (v3
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0LL
    && (!self->_connection ? (unsigned int v6 = v4) : (unsigned int v6 = 0), WeakRetained, v6 == 1))
  {
    uint64_t Connection = DNSServiceCreateConnection(&self->_connection);
    if ((_DWORD)Connection)
    {
      uint64_t v9 = browser_log(Connection, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000D2654();
      }
    }

    else
    {
      p_connection = &self->_connection;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      uint64_t v12 = self->_types;
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v45;
        while (2)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(id *)(*((void *)&v44 + 1) + 8LL * (void)i);
            sdRef[0] = self->_connection;
            int64_t mode = self->_mode;
            if (mode == 1) {
              int v19 = 33570816;
            }
            else {
              int v19 = 0x4000;
            }
            if (mode == 2) {
              DNSServiceFlags v20 = 67125248;
            }
            else {
              DNSServiceFlags v20 = v19;
            }
            if (self->_isAirDrop && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode")) {
              v20 |= 0x100000u;
            }
            uint32_t v21 = -[SDBonjourBrowser getInterface:](self, "getInterface:", 0LL);
            id v22 = v17;
            DNSServiceErrorType v23 = DNSServiceBrowse( sdRef, v20, v21, (const char *)[v22 UTF8String], (const char *)objc_msgSend(v3, "UTF8String"), (DNSServiceBrowseReply)sub_1000CE284, self);

            if (v23)
            {

              uint64_t v30 = browser_log(v28, v29);
              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                sub_1000D25F4();
              }
              goto LABEL_37;
            }
          }

          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
          if (v14) {
            continue;
          }
          break;
        }
      }

      uint64_t v24 = DNSServiceSetDispatchQueue(*p_connection, &_dispatch_main_q);
      if ((_DWORD)v24)
      {
        uint64_t v26 = browser_log(v24, v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1000D2594();
        }
LABEL_37:

        DNSServiceRefDeallocate(*p_connection);
        *p_connection = 0LL;
      }

      else if (self->_isAirDrop)
      {
        uint64_t v31 = airdrop_log(v24);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(sdRef[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Bonjour discovery started",  (uint8_t *)sdRef,  2u);
        }

        sub_10002FA6C( (uint64_t)@"BonjourBrowse",  (uint64_t)@"Start",  (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"),  0LL);
        self->_startTime = CFAbsoluteTimeGetCurrent();
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        objc_super v34 = (void *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);
        v35 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "substringWithRange:", 24, 12));
        browserID = self->_browserID;
        self->_browserID = v35;

        BOOL v37 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode");
        if (!v37)
        {
          if (!self->_proximity)
          {
            uint64_t v38 = airdrop_log(v37);
            v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(sdRef[0]) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "BTLE advertising started",  (uint8_t *)sdRef,  2u);
            }

            v40 = -[WPAWDL initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___WPAWDL),  "initWithDelegate:queue:",  self,  &_dispatch_main_q);
            proximity = self->_proximity;
            self->_proximity = v40;
          }

          -[SDBonjourBrowser advertiseHashes](self, "advertiseHashes");
        }
      }
    }
  }

  else
  {
    if (self->_startTime == 0.0) {
      char v11 = 1;
    }
    else {
      char v11 = v4;
    }
    if ((v11 & 1) == 0)
    {
      -[SDBonjourBrowser stop](self, "stop");
      -[SDBonjourBrowser notifyClient](self, "notifyClient");
    }
  }
}

- (void)start
{
  uint64_t v3 = airdrop_log(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: start requested", buf, 2u);
  }

  self->_startCalled = 1;
  if (dword_100669390)
  {
    dispatch_time_t v5 = sub_100114580(2.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CE3B0;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_after(v5, &_dispatch_main_q, block);
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000CE3B8;
    v6[3] = &unk_1005CB2F8;
    v6[4] = self;
    dispatch_async(&_dispatch_main_q, v6);
  }

- (void)logAirDropSessionInfo
{
  double startTime = self->_startTime;
  double Current = CFAbsoluteTimeGetCurrent();
  double firstTime = self->_firstTime;
  double v6 = self->_startTime;
  uint64_t maxServices = self->_maxServices;
  id v8 = -[NSMutableSet count](self->_discoveredPeers, "count");
  int64_t v9 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
  unsigned int v10 = v9;
  uint64_t v11 = airdrop_log(v9);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Bonjour discovery stopped", buf, 2u);
  }

  if (firstTime == 0.0) {
    double v13 = -1.0;
  }
  else {
    double v13 = firstTime - v6;
  }

  browserID = (__CFString *)self->_browserID;
  sessionID = (__CFString *)self->_sessionID;
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser bundleID](self, "bundleID"));
  sub_10002F674( sessionID,  browserID,  v16,  (unint64_t)(startTime * 1000.0),  maxServices,  (uint64_t)v8,  self->_transfersInitiated,  self->_transfersCompleted,  Current - v6,  v13,  v10);
}

- (void)stop
{
  if (self->_isAirDrop && self->_startTime != 0.0)
  {
    -[SDBonjourBrowser logAirDropSessionInfo](self, "logAirDropSessionInfo");
    -[NSMutableSet removeAllObjects](self->_discoveredPeers, "removeAllObjects");
    browserID = self->_browserID;
    self->_browserID = 0LL;

    self->_uint64_t maxServices = 0;
    self->_double firstTime = 0.0;
    self->_double startTime = 0.0;
  }

  dnsQueries = self->_dnsQueries;
  if (dnsQueries)
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](dnsQueries, "allValues"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) objectForKeyedSubscript:@"QueryTimer"]);
          [v10 invalidate];
        }

        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    -[NSMutableDictionary removeAllObjects](self->_dnsQueries, "removeAllObjects");
  }

  connection = self->_connection;
  if (connection)
  {
    if (self->_isAirDrop)
    {
      sub_10002FA6C( (uint64_t)@"BonjourBrowse",  (uint64_t)@"Stop",  (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"),  0LL);
      connection = self->_connection;
    }

    DNSServiceRefDeallocate(connection);
    self->_connection = 0LL;
  }

  if (self->_proximity)
  {
    uint64_t v12 = airdrop_log(connection);
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BTLE advertising stopped", v14, 2u);
    }

    sub_10002FA6C( (uint64_t)@"BluetoothAdvertise",  (uint64_t)@"Stop",  (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"),  0LL);
    -[SDBonjourBrowser stopConnectionlessAdvertising](self, "stopConnectionlessAdvertising");
  }

- (void)invalidate
{
  uint64_t v3 = airdrop_log(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: invalidate requested", v7, 2u);
  }

  -[SDBonjourBrowser stop](self, "stop");
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    -[NSTimer invalidate](restartTimer, "invalidate");
    id v6 = self->_restartTimer;
    self->_restartTimer = 0LL;
  }

- (void)removeInvalidNodes:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_serverCache, "allKeys"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);

        uint64_t v12 = (const __CFString *)SFNodeCopyDisplayName(v11);
        if (v12)
        {
          double v13 = v12;
          if (!CFStringGetLength(v12)) {
            [v4 removeObjectForKey:v10];
          }
          CFRelease(v13);
        }

        else
        {
          [v4 removeObjectForKey:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (void)updateSecondaryNameForNodes:(id)a3
{
  id v3 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)i);
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)updateServerCacheIfNeeded
{
  if (!self->_serverCache)
  {
    if (self->_isAirDrop)
    {
      if (-[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")
        && -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled"))
      {
        id v3 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
        serverCache = self->_serverCache;
        self->_serverCache = v3;

        if (!-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
        {
          id v5 = sub_100033FB8(0LL, 0);
          if (v5)
          {
            uint64_t v6 = v5;
            -[NSMutableDictionary removeObjectForKey:](self->_serverCache, "removeObjectForKey:", v5);
            CFRelease(v6);
          }
        }

        -[SDBonjourBrowser removeInvalidNodes:](self, "removeInvalidNodes:", self->_serverCache);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_serverCache, "allValues"));
        -[SDBonjourBrowser updateSecondaryNameForNodes:](self, "updateSecondaryNameForNodes:", v7);

        id v8 = -[NSMutableDictionary count](self->_serverCache, "count");
        if ((uint64_t)v8 > self->_maxServices)
        {
          self->_uint64_t maxServices = (int)v8;
          if (self->_firstTime == 0.0) {
            self->_double firstTime = CFAbsoluteTimeGetCurrent();
          }
        }
      }
    }

    else if (self->_isWorkgroups || -[SDStatusMonitor showThisComputer](self->_monitor, "showThisComputer"))
    {
      __int128 v9 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
      __int128 v10 = self->_serverCache;
      self->_serverCache = v9;
    }

    else
    {
      __int128 v11 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
      __int128 v12 = self->_serverCache;
      self->_serverCache = v11;

      monitor = self->_monitor;
      if (self->_isNetBIOS) {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor netbiosName](monitor, "netbiosName"));
      }
      else {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor bonjourName](monitor, "bonjourName"));
      }
      if (v14)
      {
        id v16 = v14;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
        if (v15) {
          -[NSMutableDictionary removeObjectForKey:](self->_serverCache, "removeObjectForKey:", v15);
        }

        __int128 v14 = v16;
      }
    }
  }

- (NSArray)nodes
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_serverCache, "allValues");
}

- (void)addService:(id)a3 type:(id)a4 domain:(id)a5 interface:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  __int128 v11 = (__CFString *)a4;
  __int128 v12 = (__CFString *)a5;
  double v13 = sub_10008EAC8(v11);
  if (v13)
  {
    __int128 v14 = v13;
    __int128 v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v15));

    if (v16)
    {
LABEL_25:
      SFNodeAddBonjourProtocol(v16, v14);

      goto LABEL_26;
    }

    __int128 v17 = sub_100116B8C(v12);
    if (self->_isNetBIOS)
    {
      id v16 = (void *)SFNodeCreate(0LL, v15, v15);
      SFNodeAddKind(v16, kSFNodeKindWindows);
      SFNodeSetNetbiosName(v16, v15);
      SFNodeSetWorkgroup(v16, v17);
      __int128 v18 = sub_10008D8A8(kSFNodeProtocolSMB, 0LL, 0LL, v15, -1, 0LL, 0LL, 0);
      if (v18)
      {
        int v19 = v18;
        SFNodeSetURL(v16, v18);
        CFRelease(v19);
      }

      DNSServiceFlags v20 = self;
      id v21 = v10;
      id v22 = v11;
    }

    else
    {
      if (self->_isWorkgroups)
      {
        id v16 = (void *)SFNodeCreate(0LL, v15, v15);
        SFNodeAddKind(v16, kSFNodeKindWorkgroup);
        SFNodeAddWorkgroup(v16, v15);
        goto LABEL_24;
      }

      id v16 = (void *)SFNodeCreate(0LL, v10, v10);
      SFNodeSetServiceName(v16, v10);
      SFNodeSetDomain(v16, v17);
      SFNodeAddKind(v16, kSFNodeKindBonjour);
      DNSServiceErrorType v23 = sub_10008E590();
      if (CFEqual(v11, v23))
      {
        SFNodeSetDisplayName(v16, &stru_1005E3958);
        SFNodeSetRealName(v16, v15);
        SFNodeAddKind(v16, kSFNodeKindPerson);
        SFNodeAddKind(v16, kSFNodeKindUnknown);
        uint64_t v24 = (__CFString *)sub_100033FB8(0LL, 0);
        if (![v10 isEqual:v24]
          || -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
        {
          uint64_t v38 = v24;
          v40 = objc_opt_new(&OBJC_CLASS___SDAirDropPeerMetric);
          -[SDAirDropPeerMetric setSessionID:](v40, "setSessionID:", self->_browserID);
          objc_setAssociatedObject(v16, @"SDAirDropPeerMetric", v40, (void *)0x301);
          double Current = CFAbsoluteTimeGetCurrent();
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  Current - self->_startTime));
          -[SDAirDropPeerMetric setBonjourPTRDiscovery:](v40, "setBonjourPTRDiscovery:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
          -[SDAirDropPeerMetric setBonjourTXTRecordDiscovery:](v40, "setBonjourTXTRecordDiscovery:", v27);

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourPTRDiscovery](v40, "bonjourPTRDiscovery"));
          [v28 doubleValue];
          double v30 = v29;

          id v31 = sub_10011450C(v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = v32;
          if (v32) {
            id v34 = v32;
          }
          else {
            id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
          }
          v39 = v34;

          uint64_t v36 = airdrop_log(v35);
          BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v42 = v10;
            __int16 v43 = 2112;
            __int128 v44 = v39;
            __int16 v45 = 1024;
            int v46 = (int)(v30 * 1000.0);
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Bonjour discovered %@ PTR over %@ in %d ms",  buf,  0x1Cu);
          }

          -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:]( self,  "startRecordQuery:type:domain:recordType:interface:",  v10,  v11,  v17,  16LL,  v6);
          uint64_t v24 = v38;
        }

        goto LABEL_24;
      }

      if (CFEqual(v11, @"_odisk._tcp."))
      {
        SFNodeAddKind(v16, kSFNodeKindODisk);
        -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:]( self,  "startRecordQuery:type:domain:recordType:interface:",  v10,  v11,  v17,  16LL,  v6);
      }

      if (self->_mode == 1) {
        goto LABEL_24;
      }
      id v22 = @"_device-info._tcp.";
      DNSServiceFlags v20 = self;
      id v21 = v10;
    }

    -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:]( v20,  "startRecordQuery:type:domain:recordType:interface:",  v21,  v22,  v17,  16LL,  v6);
LABEL_24:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_servers, "setObject:forKeyedSubscript:", v16, v15);
    CFRelease(v17);
    CFRelease(v16);
    goto LABEL_25;
  }

- (id)queryKey:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  id v9 = a4;
  id v10 = a3;
  __int128 v11 = sub_100116B8C((const __CFString *)a5);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@%@.%d",  v10,  v9,  v11,  v6));

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
  return v13;
}

- (void)addQueryToDictionary:(_DNSServiceRef_t *)a3 name:(id)a4 type:(id)a5 domain:(id)a6 recordType:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a5;
  id v16 = (id)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser queryKey:type:domain:recordType:]( self,  "queryKey:type:domain:recordType:",  a4,  v12,  a6,  v7));
  double v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", *a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, @"ServiceRef");

  LODWORD(v14) = CFEqual(v12, @"_device-info._tcp.");
  if ((_DWORD)v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "queryRecordTimerCallBack:",  v16,  0LL,  30.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, @"QueryTimer");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dnsQueries, "setObject:forKeyedSubscript:", v13, v16);
}

- (void)startRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6 interface:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int128 v15 = sub_100116C5C(v12, v13, v14, 1);
  __int128 v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
  if (!v17)
  {
    uint64_t v25 = browser_log(0LL, v16);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000D26B4();
    }
    goto LABEL_16;
  }

  bzero(buffer, 0x3F1uLL);
  uint64_t CString = CFStringGetCString(v17, buffer, 1009LL, 0x8000100u);
  if (!(_DWORD)CString)
  {
    uint64_t v27 = browser_log(CString, v19);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000D26E0();
    }
    goto LABEL_16;
  }

  DNSServiceRef sdRef = self->_connection;
  BOOL isAirDrop = self->_isAirDrop;
  uint32_t v21 = -[SDBonjourBrowser getInterface:](self, "getInterface:", v7);
  if (isAirDrop) {
    DNSServiceFlags v22 = 1065216;
  }
  else {
    DNSServiceFlags v22 = 16640;
  }
  uint64_t v23 = DNSServiceQueryRecord(&sdRef, v22, v21, buffer, v8, 1u, (DNSServiceQueryRecordReply)sub_1000CF438, self);
  if ((_DWORD)v23 == -65540)
  {
    uint64_t v23 = -[SDStatusMonitor enableBugs](self->_monitor, "enableBugs");
    if (!(_DWORD)v23) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }

  if ((_DWORD)v23)
  {
LABEL_14:
    uint64_t v28 = browser_log(v23, v24);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000D270C();
    }
LABEL_16:

    goto LABEL_17;
  }

  -[SDBonjourBrowser addQueryToDictionary:name:type:domain:recordType:]( self,  "addQueryToDictionary:name:type:domain:recordType:",  &sdRef,  v12,  v13,  v14,  v8);
LABEL_17:
}

- (void)cleanupRecordQueryForKey:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dnsQueries, "objectForKeyedSubscript:"));
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"QueryTimer"]);
    [v6 invalidate];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ServiceRef"]);
    uint64_t v8 = (_DNSServiceRef_t *)[v7 longValue];

    if (v8) {
      DNSServiceRefDeallocate(v8);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_dnsQueries, "removeObjectForKey:", v9);
  }
}

- (void)cleanupRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser queryKey:type:domain:recordType:]( self,  "queryKey:type:domain:recordType:",  a3,  a4,  a5,  a6));
  if (v7)
  {
    uint64_t v8 = v7;
    -[SDBonjourBrowser cleanupRecordQueryForKey:](self, "cleanupRecordQueryForKey:", v7);
    uint64_t v7 = v8;
  }
}

- (void)cleanupRecordQueryForNetService:(id)a3 recordType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);

  -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:]( self,  "cleanupRecordQuery:type:domain:recordType:",  v9,  v7,  v8,  v4);
}

- (void)removeService:(id)a3 type:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    if (self->_isNetBIOS)
    {
      -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:]( self,  "cleanupRecordQuery:type:domain:recordType:",  v8,  v9,  v10,  16LL);
LABEL_5:
      -[NSMutableDictionary removeObjectForKey:](self->_servers, "removeObjectForKey:", v11);
      goto LABEL_6;
    }

    if (self->_isWorkgroups) {
      goto LABEL_5;
    }
    id v13 = sub_10008EAC8(v9);
    if (v13)
    {
      SFNodeRemoveBonjourProtocol(v12, v13);
      id v14 = (const __CFBag *)SFNodeCopyBonjourProtocols(v12);
      if (!CFBagGetCount(v14))
      {
        if (CFEqual(v9, @"_odisk._tcp."))
        {
          -[SDBonjourBrowser ejectDisksIfNeeded:diskNames:](self, "ejectDisksIfNeeded:diskNames:", v8, 0LL);
          -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:]( self,  "cleanupRecordQuery:type:domain:recordType:",  v8,  v9,  v10,  16LL);
        }

        else
        {
          __int128 v15 = sub_10008E590();
          uint64_t v16 = CFEqual(v9, v15);
          if ((_DWORD)v16)
          {
            uint64_t v17 = airdrop_log(v16);
            __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 138412290;
              id v21 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Bonjour removed %@",  (uint8_t *)&v20,  0xCu);
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropRequests,  "objectForKeyedSubscript:",  v11));
            if (v19) {
              -[SDBonjourBrowser cleanupAirDropRequest:](self, "cleanupAirDropRequest:", v19);
            }
            -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:]( self,  "cleanupRecordQuery:type:domain:recordType:",  v8,  v9,  v10,  16LL);
          }
        }

        -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:]( self,  "cleanupRecordQuery:type:domain:recordType:",  v8,  @"_device-info._tcp.",  v10,  16LL);
        -[NSMutableDictionary removeObjectForKey:](self->_servers, "removeObjectForKey:", v11);
      }

      CFRelease(v14);
    }
  }

- (__SFNode)copyNodeForName:(id)a3
{
  id v4 = a3;
  -[SDBonjourBrowser updateServerCacheIfNeeded](self, "updateServerCacheIfNeeded");
  serverCache = self->_serverCache;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);

  uint64_t v7 = (__SFNode *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](serverCache, "objectForKeyedSubscript:", v6));
  if (v7) {
    CFRetain(v7);
  }
  return v7;
}

- (__SFNode)copyNodeForService:(id)a3
{
  servers = self->_servers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  id v6 = (__SFNode *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](servers, "objectForKeyedSubscript:", v5));

  if (v6) {
    CFRetain(v6);
  }
  return v6;
}

- (void)systemInfoChanged:(id)a3 diskInfo:(__CFDictionary *)a4
{
  id v6 = a3;
  Value = (const __CFString *)CFDictionaryGetValue(a4, @"adVF");
  CFNumberRef v8 = sub_1001146D4(0LL, Value);
  id v9 = (const __CFString *)CFDictionaryGetValue(a4, @"adDT");
  id v10 = sub_1001146D4(0LL, v9);
  __int128 v11 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v6);

  if (v11)
  {
    uint64_t valuePtr = 0LL;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberCFIndexType, &valuePtr))
      {
        uint64_t v12 = valuePtr;
      }

      else
      {
        uint64_t v12 = 0LL;
        uint64_t valuePtr = 0LL;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    SFNodeSetSupportedMedia(v11, v12);
    SFNodeSetFlags(v11, v8);
    CFRelease(v11);
  }

  if (v8) {
    CFRelease(v8);
  }
  if (v10) {
    CFRelease(v10);
  }
}

- (id)colorArrayFromEcolor:(id)a3 icolor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@","]);
    if ([v8 count] == (id)3)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
      id v10 = [v9 intValue];

      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
      id v12 = [v11 intValue];

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
      id v14 = [v13 intValue];

      __int128 v15 = 0LL;
      if (v10 <= 0xFF
        && (v12 & 0x80000000) == 0
        && (int)v12 <= 255
        && (v14 & 0x80000000) == 0
        && (int)v14 <= 255)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
        v21[0] = v16;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
        v21[1] = v17;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
        v21[2] = v18;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
      }
    }

    else
    {
      __int128 v15 = 0LL;
    }
  }

  else
  {
    if (!v6)
    {
      __int128 v15 = 0LL;
      goto LABEL_13;
    }

    CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 integerValue]));
    int v20 = v8;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  }

LABEL_13:
  return v15;
}

- (void)deviceInfoChanged:(id)a3 model:(id)a4 ecolor:(id)a5 icolor:(id)a6 osxvers:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int128 v15 = (__CFString *)a7;
  uint64_t v16 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v19);
  if (v16)
  {
    uint64_t v17 = v16;
    SFNodeSetModel(v16, v12);
    SFNodeSetColor( v17,  -[SDBonjourBrowser colorArrayFromEcolor:icolor:](self, "colorArrayFromEcolor:icolor:", v13, v14));
    CFNumberRef v18 = sub_1001146D4(0LL, v15);
    SFNodeSetFlags(v17, v18);
    if (v18) {
      CFRelease(v18);
    }
    CFRelease(v17);
  }

  -[SDBonjourBrowser cleanupRecordQueryForNetService:recordType:]( self,  "cleanupRecordQueryForNetService:recordType:",  v19,  16LL);
}

- (void)commentChanged:(id)a3 comment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v9);
  if (v7)
  {
    CFNumberRef v8 = v7;
    SFNodeSetSecondaryName(v7, v6);
    CFRelease(v8);
  }

  -[SDBonjourBrowser cleanupRecordQueryForNetService:recordType:]( self,  "cleanupRecordQueryForNetService:recordType:",  v9,  16LL);
}

- (void)startPictureQuery:(id)a3
{
  id v8 = a3;
  if (!-[SDStatusMonitor disablePictureQuery](self->_monitor, "disablePictureQuery"))
  {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 domain]);
    id v5 = sub_100116B8C(v4);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 type]);
    -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:]( self,  "startRecordQuery:type:domain:recordType:interface:",  v6,  v7,  v5,  10LL,  0LL);

    CFRelease(v5);
  }
}

- (void)clearCacheAndNotify
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CFE94;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)cleanupAirDropRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 personID]);
  -[NSMutableDictionary removeObjectForKey:](self->_airDropRequests, "removeObjectForKey:", v5);
  [v4 invalidate];
}

- (void)logAirDropDiscoveryInfoForNode:(__SFNode *)a3
{
  id AssociatedObject = objc_getAssociatedObject(a3, @"SDAirDropPeerMetric");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 modelName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 verifiableIdentity]);
  unsigned int v9 = [v8 BOOLValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourPTRDiscovery]);
  [v10 doubleValue];
  double v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourTXTRecordDiscovery]);
  [v13 doubleValue];
  double v45 = v14;

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourResolveComplete]);
  [v15 doubleValue];
  double v17 = v16;

  CFNumberRef v18 = (void *)objc_claimAutoreleasedReturnValue([v6 tcpConnectionComplete]);
  [v18 doubleValue];
  double v20 = v19;

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 tlsHandshakeComplete]);
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 identityQueryComplete]);
  [v24 doubleValue];
  double v26 = v25;

  double Current = CFAbsoluteTimeGetCurrent();
  double startTime = self->_startTime;
  double v29 = CFAbsoluteTimeGetCurrent() - startTime;
  id v31 = (void *)SFNodeCopyRealName(a3, v30);
  v32 = @"unverifiable";
  unsigned int v46 = v9;
  if (v9) {
    v32 = @"verifiable";
  }
  v33 = v32;
  uint64_t v34 = airdrop_log(v33);
  uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
    *(_DWORD *)buf = 138413315;
    v48 = v33;
    __int16 v49 = 2112;
    v50 = v31;
    __int16 v51 = 2113;
    v52 = v36;
    __int16 v53 = 2113;
    v54 = v7;
    __int16 v55 = 1024;
    int v56 = (int)(v29 * 1000.0);
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Discovered %@ identity of %@ accountID %{private}@ model %{private}@ in %d ms",  buf,  0x30u);
  }

  BOOL v37 = (void *)SFNodeCopyServiceName(a3);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[SDStatusMonitor awdlInfoForPeerWithServiceName:]( self->_monitor,  "awdlInfoForPeerWithServiceName:",  v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"STATION_AWDL_VERSION"]);
  unsigned int v44 = [v39 intValue];

  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"STATION_AWDL_PLATFORM"]);
  unsigned int v41 = [v40 intValue];

  id v42 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"STATION_RSSI"]);
  unsigned int v43 = [v42 intValue];

  sub_10002F2D8( (__CFString *)self->_sessionID,  (__CFString *)self->_browserID,  v7,  v46,  v44,  v41,  v43,  v12,  v45,  v17,  v20,  v23,  v26,  Current - startTime - v12,  v29);
}

+ (void)updateFriendRPIdentityForAccountID:(id)a3 withAirDropClientInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v5 length])
  {
    v58[0] = CNContactEmailAddressesKey;
    v58[1] = CNContactPhoneNumbersKey;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 contactsWithPhoneNumberOrEmail:v5 keys:v8]);
    if ([v9 count])
    {
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v50;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v50 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
            id v15 = [v7 contactIsBlocked:v14];
            if ((_DWORD)v15)
            {
              uint64_t v25 = airdrop_log(v15);
              double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v55 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Skipped RPIdentity update because contact %{private}@ is blocked",  buf,  0xCu);
              }

              goto LABEL_37;
            }
          }

          id v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue([v7 contactWithPreferredIdentifierForContacts:v10]);
      unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSFOperationReceiverDeviceIRKDataKey]);
      if (v44)
      {
        double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSFOperationReceiverEdPKDataKey]);
        if (v16)
        {
          uint64_t v43 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSFOperationReceiverIDSDeviceIDKey]);
          if (v43)
          {
            uint64_t v42 = objc_claimAutoreleasedReturnValue([v10 identifier]);
            if (v42)
            {
              id val = objc_alloc_init(&OBJC_CLASS___RPClient);
              double v17 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
              -[RPIdentity setAccountID:](v17, "setAccountID:", v5);
              -[RPIdentity setContactID:](v17, "setContactID:", v42);
              -[RPIdentity setDeviceIRKData:](v17, "setDeviceIRKData:", v44);
              -[RPIdentity setEdPKData:](v17, "setEdPKData:", v16);
              -[RPIdentity setIdsDeviceID:](v17, "setIdsDeviceID:", v43);
              CFNumberRef v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSFOperationSendersKnownAliasKey]);
              -[RPIdentity setSendersKnownAlias:](v17, "setSendersKnownAlias:", v18);

              -[RPIdentity setType:](v17, "setType:", 6LL);
              id location = 0LL;
              id inited = objc_initWeak(&location, val);
              uint64_t v20 = airdrop_log(inited);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 141558275;
                uint64_t v55 = 1752392040LL;
                __int16 v56 = 2113;
                id v57 = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updating RPIdentity for %{private, mask.hash}@",  buf,  0x16u);
              }

              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472LL;
              v45[2] = sub_1000D08AC;
              v45[3] = &unk_1005CDBB8;
              double v22 = v17;
              unsigned int v46 = v22;
              objc_copyWeak(&v47, &location);
              [val addOrUpdateIdentity:v22 completion:v45];
              objc_destroyWeak(&v47);

              objc_destroyWeak(&location);
              double v23 = (os_log_s *)val;
            }

            else
            {
              uint64_t v33 = airdrop_log(0LL);
              uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              double v23 = v34;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                sub_1000D2798((uint64_t)v10, v34, v35, v36, v37, v38, v39, v40);
                double v23 = v34;
              }
            }

            v32 = (os_log_s *)v42;
          }

          else
          {
            uint64_t v31 = airdrop_log(0LL);
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558275;
              uint64_t v55 = 1752392040LL;
              __int16 v56 = 2113;
              id v57 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Didn't update RPIdentity because idsDeviceID is missing for %{private, mask.hash}@",  buf,  0x16u);
            }
          }

          uint64_t v30 = (os_log_s *)v43;
        }

        else
        {
          uint64_t v29 = airdrop_log(0LL);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558275;
            uint64_t v55 = 1752392040LL;
            __int16 v56 = 2113;
            id v57 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Didn't update RPIdentity because edPKData is missing for %{private, mask.hash}@",  buf,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v28 = airdrop_log(0LL);
        double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558275;
          uint64_t v55 = 1752392040LL;
          __int16 v56 = 2113;
          id v57 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Didn't update RPIdentity because deviceIRKData is missing for %{private, mask.hash}@",  buf,  0x16u);
        }
      }
    }

    else
    {
      uint64_t v27 = airdrop_log(0LL);
      id v10 = (id)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558275;
        uint64_t v55 = 1752392040LL;
        __int16 v56 = 2113;
        id v57 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Failed to update RPIdentity because there are no contacts for %{private, mask.hash}@",  buf,  0x16u);
      }
    }

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 personID]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v11));

  switch(a4)
  {
    case 4LL:
    case 10LL:
      goto LABEL_20;
    case 5LL:
      break;
    case 9LL:
      if (v12)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationReceiverMediaCapabilitiesKey]);
        if (v14) {
          SFNodeSetMediaCapabilities(v12, v14);
        }
        id v15 = (__SecTrust *)[v9 secTrustRef];
        if (v15)
        {
          double v16 = v15;
          uint64_t v36 = v14;
          double v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationReceiverRecordDataKey]);
          id v18 = sub_100035F84(v17, v16, (uint64_t)v12);
          double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationReceiverModelNameKey]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationReceiverComputerNameKey]);
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationReceiverIDSDeviceIDKey]);
          SFNodeSetModel(v12, v20);
          SFNodeSetComputerName(v12, v21);
          uint64_t v34 = (void *)v22;
          uint64_t v23 = SFNodeSetIDSDeviceIdentifier(v12, v22);
          uint64_t v35 = (void *)v20;
          if (v21)
          {
            id AssociatedObject = objc_getAssociatedObject(v12, @"SDAirDropPeerMetric");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
            [v25 setModelName:v20];
            double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19 != 0LL));
            [v25 setVerifiableIdentity:v26];

            [v25 setAccountID:v19];
            -[SDBonjourBrowser logAirDropDiscoveryInfoForNode:](self, "logAirDropDiscoveryInfoForNode:", v12);
            -[NSMutableSet addObject:](self->_discoveredPeers, "addObject:", v11);
          }

          else
          {
            uint64_t v30 = airdrop_log(v23);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "Identity discovery denied for %@",  buf,  0xCu);
            }
          }

          uint64_t v14 = v36;
          if (v19 && (sub_100034824((uint64_t)v12) & 1) == 0) {
            +[SDBonjourBrowser updateFriendRPIdentityForAccountID:withAirDropClientInfo:]( &OBJC_CLASS___SDBonjourBrowser,  "updateFriendRPIdentityForAccountID:withAirDropClientInfo:",  v19,  v10);
          }
          -[SDBonjourBrowser startIdentityQueryForNode:](self, "startIdentityQueryForNode:", v12);
        }

        else
        {
          uint64_t v29 = airdrop_log(0LL);
          double v17 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
            sub_1000D2870();
          }
        }

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_100034C94( (uint64_t)v12,  v31,  self->_iconCache,  -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCache](self, "clearCache");
        -[SDBonjourBrowser notifyClient](self, "notifyClient");
      }

- (void)startAirDropRequestForNode:(__SFNode *)a3
{
  uint64_t v10 = SFNodeCopyEmailHash(a3);
  uint64_t v6 = SFNodeCopyPhoneHash(a3);
  if (!(v10 | v6))
  {
    uint64_t v7 = (void *)SFNodeCopyRealName(a3, v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropRequests,  "objectForKeyedSubscript:",  v7));

    if (!v8)
    {
      id v9 = -[SDAirDropClient initWithPerson:items:forDiscovery:]( objc_alloc(&OBJC_CLASS___SDAirDropClient),  "initWithPerson:items:forDiscovery:",  a3,  0LL,  1LL);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_airDropRequests,  "setObject:forKeyedSubscript:",  v9,  v7);
      -[SDAirDropClient setDelegate:](v9, "setDelegate:", self);
      -[SDAirDropClient activate](v9, "activate");
    }
  }
}

- (void)cancelAirDropRequests
{
  airDropRequests = self->_airDropRequests;
  if (airDropRequests)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](airDropRequests, "allValues"));
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
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
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) invalidate];
          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_airDropRequests, "removeAllObjects");
  }

- (void)personInfoChanged:(id)a3 flags:(id)a4 atag:(id)a5 cname:(id)a6 phash:(id)a7 ehash:(id)a8 nhash:(id)a9
{
  id v12 = a3;
  uint64_t v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v12);
  if (v15)
  {
    double v16 = v15;
    CFNumberRef v17 = sub_1001146D4(0LL, v13);
    if (v17)
    {
      CFNumberRef v18 = v17;
      SFNodeSetFlags(v16, v17);
      CFRelease(v18);
    }

    if (-[SDStatusMonitor enableStrangers](self->_monitor, "enableStrangers")) {
      SFNodeSetUserName(v16, v14);
    }
    id AssociatedObject = objc_getAssociatedObject(v16, @"SDAirDropPeerMetric");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 bonjourTXTRecordDiscovery]);
    [v22 doubleValue];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v23));

    uint64_t v25 = airdrop_log([v20 setBonjourTXTRecordDiscovery:v24]);
    double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
      [v24 doubleValue];
      int v29 = 138412546;
      uint64_t v30 = v27;
      __int16 v31 = 1024;
      int v32 = (int)(v28 * 1000.0);
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Bonjour discovered %@ TXT record in %d ms",  (uint8_t *)&v29,  0x12u);
    }

    -[SDBonjourBrowser startAirDropRequestForNode:](self, "startAirDropRequestForNode:", v16);
    CFRelease(v16);
  }
}

- (void)handleIdentity:(id)a3 withQueryID:(id)a4 emailOrPhone:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = airdrop_log(v13);
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000D289C((uint64_t)v12, (uint64_t)v14, v16);
    }

    CFDictionaryRemoveValue(self->_identityQueries, v11);
  }

  else
  {
    Value = CFDictionaryGetValue(self->_identityQueries, v11);
    if (Value)
    {
      uint64_t v18 = (uint64_t)Value;
      double v19 = (void *)SFNodeCopyAppleID(Value);
      if (v19) {
        id v20 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v19));
      }
      else {
        id v20 = 0LL;
      }
      id v21 = v10;
      if (v20 != v21 && ([v20 isEqual:v21] & 1) == 0)
      {
        if (v21)
        {
          -[SDStatusMonitor cacheIdentity:](self->_monitor, "cacheIdentity:", v21);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 emailOrPhone]);
          SFNodeSetAppleID(v18, v22);
        }

        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_100034C94(v18, v23, self->_iconCache, -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");
      }

      CFDictionaryRemoveValue(self->_identityQueries, v11);
    }
  }
}

- (void)startIdentityQueryForNode:(__SFNode *)a3
{
  uint64_t v5 = SFNodeCopyEmailHash(a3);
  uint64_t v6 = SFNodeCopyPhoneHash(a3);
  if (v5 | v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDStatusMonitor emailOrPhoneForEmailHash:phoneHash:]( self->_monitor,  "emailOrPhoneForEmailHash:phoneHash:",  v5,  v6));
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v7));
      if (v8)
      {
        SFNodeSetAppleID(a3, v7);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_100034C94( (uint64_t)a3,  v9,  self->_iconCache,  -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

        CFDictionarySetValue(self->_identityQueries, v11, a3);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_1000D14FC;
        v14[3] = &unk_1005CDBE0;
        v14[4] = self;
        id v15 = v11;
        id v16 = v7;
        id v13 = v11;
        [v12 verifiedIdentityForEmailOrPhone:v16 completion:v14];
      }
    }

    else
    {
      SFNodeSetAppleID(a3, 0LL);
    }
  }

  else
  {
    SFNodeSetAppleID(a3, 0LL);
  }
}

- (void)cancelIdentityQueries
{
  identityQueries = self->_identityQueries;
  if (identityQueries) {
    CFDictionaryRemoveAllValues(identityQueries);
  }
}

- (void)contactsChanged:(id)a3
{
  if (self->_startTime != 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      -[SDBonjourBrowser cancelIdentityQueries](self, "cancelIdentityQueries");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_servers, "allValues"));
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
            -[SDBonjourBrowser startIdentityQueryForNode:](self, "startIdentityQueryForNode:", v10);
            id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
            sub_100034C94( v10,  v11,  self->_iconCache,  -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));
          }

          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v7);
      }

      -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");
    }
  }

- (void)airDropPublished:(id)a3
{
}

- (void)lockStatusChanged:(id)a3
{
}

- (void)consoleUserChanged:(id)a3
{
}

- (void)screenStatusChanged:(id)a3
{
}

- (void)somethingChanged:(id)a3
{
}

- (void)wirelessPowerChanged:(id)a3
{
}

- (void)linkStateChanged:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AWDL link state changed", v6, 2u);
  }

  -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", 1.0);
}

- (void)notifyClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bonjourNodesDidChange:self];
}

- (void)notifyClientIfDone:(unsigned int)a3
{
  char v3 = a3;
  -[SDBonjourBrowser clearCache](self, "clearCache");
  if ((v3 & 1) == 0 || self->_isAirDrop) {
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
  }
}

- (BOOL)validAirDropInterface:(unsigned int)a3
{
  if (self->_awdlIndex == a3 || -[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces")) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  return -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole");
}

- (void)handleBrowseCallBack:(unsigned int)a3 interface:(unsigned int)a4 error:(int)a5 name:(const char *)a6 type:(const char *)a7 domain:(const char *)a8
{
  if (a5)
  {
    uint64_t v9 = browser_log(self, a2);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D2934();
    }

    -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", 2.0);
  }

  else
  {
    uint64_t v13 = *(void *)&a4;
    uint64_t v14 = *(void *)&a3;
    double v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a6));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a7));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a8));
    if (v19) {
      BOOL v17 = v15 == 0LL;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v18 = v17 || v16 == 0LL;
    if (!v18
      && (!self->_isAirDrop
       || sub_10003601C(v19)
       && -[SDBonjourBrowser validAirDropInterface:](self, "validAirDropInterface:", v13)))
    {
      if ((v14 & 2) != 0) {
        -[SDBonjourBrowser addService:type:domain:interface:]( self,  "addService:type:domain:interface:",  v19,  v15,  v16,  v13);
      }
      else {
        -[SDBonjourBrowser removeService:type:domain:](self, "removeService:type:domain:", v19, v15, v16);
      }
    }

    -[SDBonjourBrowser notifyClientIfDone:](self, "notifyClientIfDone:", v14);
  }

- (id)odiskMountPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor odiskMountPointsForServer:](self->_monitor, "odiskMountPointsForServer:", v4));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = sub_100116428(v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v13);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)serviceFromServiceName:(id)a3
{
  char v3 = (__CFNetService *)_CFNetServiceCreateFromServiceName(0LL, a3);
  if (v3)
  {
    id v4 = v3;
    CFStringRef Name = CFNetServiceGetName(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(Name);
    CFStringRef Type = CFNetServiceGetType(v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Type);
    CFStringRef Domain = CFNetServiceGetDomain(v4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(Domain);
    id v11 = -[NSNetService initWithDomain:type:name:]( objc_alloc(&OBJC_CLASS___NSNetService),  "initWithDomain:type:name:",  v10,  v8,  v6);
    CFRelease(v4);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)valueForKey:(id)a3 inTXTRecord:(const void *)a4 withLength:(unsigned __int16)a5
{
  uint8_t valueLen = 0;
  ValuePtr = (NSString *)TXTRecordGetValuePtr( a5, a4, (const char *)[a3 UTF8String], &valueLen);
  if (ValuePtr)
  {
    id v6 = ValuePtr;
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    ValuePtr = -[NSString initWithBytes:length:encoding:](v7, "initWithBytes:length:encoding:", v6, valueLen, 4LL);
  }

  return ValuePtr;
}

- (void)processTXTRecordUpdate:(const char *)a3 rdlen:(unsigned __int16)a4 rdata:(const void *)a5
{
  uint64_t v6 = a4;
  id v8 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser serviceFromServiceName:](self, "serviceFromServiceName:", v9));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
    if ([v11 isEqualToString:@"_device-info._tcp."])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"model",  a5,  v6));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"osxvers",  a5,  v6));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"ecolor",  a5,  v6));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"icolor",  a5,  v6));
      -[SDBonjourBrowser deviceInfoChanged:model:ecolor:icolor:osxvers:]( self,  "deviceInfoChanged:model:ecolor:icolor:osxvers:",  v10,  v12,  v14,  v15,  v13);
    }

    else
    {
      if ([v11 isEqualToString:@"_netbios._udp."])
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"comment",  a5,  v6));
        -[SDBonjourBrowser commentChanged:comment:](self, "commentChanged:comment:", v10, v16);

        goto LABEL_23;
      }

      if (![v11 isEqualToString:sub_10008E590()])
      {
        double v28 = v11;
        unsigned int Count = TXTRecordGetCount(v6, a5);
        int v29 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        if (Count)
        {
          uint64_t v21 = 0LL;
          uint64_t v22 = Count;
          do
          {
            value = 0LL;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            __int128 v44 = 0u;
            __int128 v45 = 0u;
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            *(_OWORD *)key = 0u;
            __int128 v33 = 0u;
            uint8_t valueLen = 0;
            if (!TXTRecordGetItemAtIndex(v6, a5, v21, 0x100u, key, &valueLen, (const void **)&value))
            {
              double v23 = (void *)objc_claimAutoreleasedReturnValue([v8[230] stringWithUTF8String:key]);
              if (v23)
              {
                uint64_t v24 = sub_100116ED4(valueLen, (const UInt8 *)value);
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                if (v25)
                {
                  if ([v23 isEqual:@"sys"])
                  {
                    -[SDBonjourBrowser systemInfoChanged:diskInfo:](self, "systemInfoChanged:diskInfo:", v10, v25);
                  }

                  else
                  {
                    double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"adVN"]);
                    if (v26) {
                      -[NSMutableSet addObject:](v29, "addObject:", v26);
                    }
                  }
                }

                id v8 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
              }
            }

            ++v21;
          }

          while (v22 != v21);
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        -[SDBonjourBrowser ejectDisksIfNeeded:diskNames:](self, "ejectDisksIfNeeded:diskNames:", v27, v29);

        id v11 = v28;
        goto LABEL_23;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"flags",  a5,  v6));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"atag",  a5,  v6));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"ehash",  a5,  v6));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"nhash",  a5,  v6));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"phash",  a5,  v6));
      double v19 = (void *)objc_claimAutoreleasedReturnValue( -[SDBonjourBrowser valueForKey:inTXTRecord:withLength:]( self,  "valueForKey:inTXTRecord:withLength:",  @"cname",  a5,  v6));
      -[SDBonjourBrowser personInfoChanged:flags:atag:cname:phash:ehash:nhash:]( self,  "personInfoChanged:flags:atag:cname:phash:ehash:nhash:",  v10,  v12,  v13,  v19,  v18,  v14,  v17);
    }

LABEL_23:
  }
}

- (void)handleQueryCallBack:(unsigned int)a3 error:(int)a4 fullname:(const char *)a5 rrtype:(unsigned __int16)a6 rdlen:(unsigned __int16)a7 rdata:(const void *)a8
{
  if (a4)
  {
    uint64_t v8 = browser_log(self, a2);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D29F4();
    }
  }

  else
  {
    uint64_t v10 = *(void *)&a3;
    if ((a3 & 2) != 0)
    {
      if (a6 == 16)
      {
        -[SDBonjourBrowser processTXTRecordUpdate:rdlen:rdata:](self, "processTXTRecordUpdate:rdlen:rdata:", a5, a7, a8);
      }

      else
      {
        uint64_t v12 = browser_log(self, a2);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000D2994();
        }
      }
    }

    -[SDBonjourBrowser notifyClientIfDone:](self, "notifyClientIfDone:", v10);
  }

- (void)queryRecordTimerCallBack:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  -[SDBonjourBrowser cleanupRecordQueryForKey:](self, "cleanupRecordQueryForKey:", v4);
}

- (void)restartAfterDelay:(double)a3
{
  if (self->_startCalled)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
    -[NSTimer setFireDate:](self->_restartTimer, "setFireDate:", v4);
  }

- (NSString)description
{
  id v19 = 0LL;
  NSAppendPrintF(&v19, "BonjourBrowser\n");
  id v3 = v19;
  id v18 = v3;
  NSAppendPrintF(&v18, "--------------\n");
  id v4 = v18;

  id v17 = v4;
  unint64_t mode = self->_mode;
  if (mode > 2) {
    uint64_t v6 = @"?";
  }
  else {
    uint64_t v6 = (const __CFString *)*((void *)&off_1005CDC98 + mode);
  }
  NSAppendPrintF(&v17, "Mode:                                %@\n", v6);
  id v7 = v17;

  id v16 = v7;
  if (self->_proximity) {
    uint64_t v8 = "yes";
  }
  else {
    uint64_t v8 = "no";
  }
  NSAppendPrintF(&v16, "WirelessProx object:                 %s\n", v8);
  id v9 = v16;

  proximity = self->_proximity;
  if (proximity)
  {
    id v15 = v9;
    unint64_t v11 = (unint64_t)-[WPAWDL state](proximity, "state");
    if (v11 > 5) {
      uint64_t v12 = "?";
    }
    else {
      uint64_t v12 = off_1005CDCB0[v11];
    }
    NSAppendPrintF(&v15, "WirelessProx state:                  %s\n", v12);
    id v13 = v15;

    id v9 = v13;
  }

  return (NSString *)v9;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSArray)types
{
  return (NSArray *)objc_getProperty(self, a2, 208LL, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (SDBonjourBrowserDelegate)delegate
{
  return (SDBonjourBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (int)transfersInitiated
{
  return self->_transfersInitiated;
}

- (void)setTransfersInitiated:(int)a3
{
  self->_transfersInitiated = a3;
}

- (int)transfersCompleted
{
  return self->_transfersCompleted;
}

- (void)setTransfersCompleted:(int)a3
{
  self->_transfersCompleted = a3;
}

- (BOOL)startCalled
{
  return self->_startCalled;
}

- (void).cxx_destruct
{
}

@end