@interface SDActivityAdvertiser
+ (SDActivityAdvertiser)sharedAdvertiser;
- (BOOL)isAdvertising;
- (BOOL)restart;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)updateAdvertiser;
- (NSString)state;
- (SDActivityAdvertiser)init;
- (id)createAdvertisingInformation;
- (id)encryptedAdvertisingInformation;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6;
- (void)activityServiceDevicesChanged:(id)a3;
- (void)addObservers;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4 withErrorHandler:(id)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)consoleUserChanged:(id)a3;
- (void)continuity:(id)a3 continuityDidStopAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4;
- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4;
- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuityDidUpdateState:(id)a3;
- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5;
- (void)goodbyeTimeoutFired:(id)a3;
- (void)invalidateGoodbyeTimer;
- (void)loginIDWithOptions:(id)a3 completionHandler:(id)a4;
- (void)pairedSFPeerDevicesWithOptions:(id)a3 completionHandler:(id)a4;
- (void)peerForUUID:(id)a3 completionHandler:(id)a4;
- (void)preventIdleSleepAssertion;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)resumeForReason:(id)a3;
- (void)startGoodbyeTimer;
- (void)stop;
- (void)stopForReason:(id)a3;
- (void)systemWillSleep:(id)a3;
@end

@implementation SDActivityAdvertiser

+ (SDActivityAdvertiser)sharedAdvertiser
{
  if (qword_100656E60 != -1) {
    dispatch_once(&qword_100656E60, &stru_1005CC058);
  }
  return (SDActivityAdvertiser *)(id)qword_100656E58;
}

- (SDActivityAdvertiser)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDActivityAdvertiser;
  v2 = -[SDActivityController init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    goodbyeTimer = v2->_goodbyeTimer;
    v2->_goodbyeTimer = 0LL;

    advertisementData = v3->_advertisementData;
    v3->_advertisementData = 0LL;

    v3->_advertisingEnabled = 0;
    v3->_isAdvertising = 0;
    id currentErrorHandler = v3->_currentErrorHandler;
    v3->_id currentErrorHandler = 0LL;

    currentAdvertisementPayload = v3->_currentAdvertisementPayload;
    v3->_currentAdvertisementPayload = 0LL;

    currentAdvertisementOptions = v3->_currentAdvertisementOptions;
    v3->_currentAdvertisementOptions = 0LL;

    v3->_powerAssertionID = 0;
    v3->_powerAssertionClientPID = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    shouldNotAdvertiseRequesters = v3->_shouldNotAdvertiseRequesters;
    v3->_shouldNotAdvertiseRequesters = v11;

    v13 = -[IDSContinuity initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___IDSContinuity),  "initWithDelegate:queue:",  v3,  &_dispatch_main_q);
    continuity = v3->_continuity;
    v3->_continuity = v13;

    v3->_versionByte = sub_10008E3B0(@"BluetoothAdvertiseScanVersionByte", 0LL);
    v3->_goodbyeTimerInterval = (double)sub_10008E3B0(@"BluetoothAdvertiseGoodByeDuration", 2LL);
    -[SDActivityAdvertiser addObservers](v3, "addObservers");
    v16.receiver = v3;
    v16.super_class = (Class)&OBJC_CLASS___SDActivityAdvertiser;
    -[SDXPCDaemon _activate](&v16, "_activate");
  }

  return v3;
}

- (BOOL)restart
{
  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  if (self->_advertisingEnabled
    && -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser")
    && -[IDSContinuity state](self->_continuity, "state") == (id)3
    && !-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count")
    && -[SDActivityController shouldStart](self, "shouldStart"))
  {
    if (!self->_rawAdvertisementData)
    {
      v4 = (NSData *)objc_claimAutoreleasedReturnValue(-[SDActivityAdvertiser encryptedAdvertisingInformation](self, "encryptedAdvertisingInformation"));
      rawAdvertisementData = self->_rawAdvertisementData;
      self->_rawAdvertisementData = v4;
    }

    if (!currentAdvertisementPayload) {
      -[SDActivityAdvertiser startGoodbyeTimer](self, "startGoodbyeTimer");
    }
    v6 = (OS_os_transaction *)os_transaction_create("SDActivityAdvertiser");
    advertisingTransaction = self->_advertisingTransaction;
    self->_advertisingTransaction = v6;

    uint64_t v8 = handoff_log();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = SFAdvertisementDescriptionFromPayloadData(self->_currentAdvertisementPayload);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = SFHexStringForData(self->_rawAdvertisementData);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      currentAdvertisementOptions = self->_currentAdvertisementOptions;
      *(_DWORD *)v29 = 138412802;
      *(void *)&v29[4] = v11;
      __int16 v30 = 2112;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = currentAdvertisementOptions;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Started advertising %@ as %@ with options %@",  v29,  0x20u);
    }

    -[SDActivityAdvertiser preventIdleSleepAssertion](self, "preventIdleSleepAssertion");
    -[IDSContinuity startAdvertisingOfType:withData:withOptions:]( self->_continuity,  "startAdvertisingOfType:withData:withOptions:",  0LL,  self->_rawAdvertisementData,  0LL);
    return 1;
  }

  else
  {
    if (!currentAdvertisementPayload && self->_goodbyeTimer)
    {
      uint64_t v16 = handoff_log();
      objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Goodbye packet advertising interrupted",  v29,  2u);
      }

      -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer");
    }

    if (self->_isAdvertising) {
      v18 = @"Stopped";
    }
    else {
      v18 = @"Skipping request for";
    }
    v19 = v18;
    uint64_t v20 = handoff_log();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_advertisingEnabled) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      if (-[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser")) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      if (((unint64_t)-[IDSContinuity state](self->_continuity, "state") & 0x8000000000000000LL) != 0
        || (uint64_t)-[IDSContinuity state](self->_continuity, "state") > 3)
      {
        v24 = "UnexpectedState";
      }

      else
      {
        v24 = off_1005CC078[(void)-[IDSContinuity state](self->_continuity, "state")];
      }

      id v25 = -[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count");
      unsigned int v26 = -[SDActivityController shouldStart](self, "shouldStart");
      *(_DWORD *)v29 = 138413570;
      if (v26) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      *(void *)&v29[4] = v19;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = (void *)v23;
      __int16 v34 = 2080;
      v35 = v24;
      __int16 v36 = 2048;
      id v37 = v25;
      __int16 v38 = 2112;
      v39 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ advertising: advertisingEnabled %@, currentConsoleUser %@, state %s, shouldNotAdvertiseRequestersCount %lu, shouldStart %@",  v29,  0x3Eu);
    }

    if (self->_isAdvertising) {
      -[IDSContinuity stopAdvertisingOfType:](self->_continuity, "stopAdvertisingOfType:", 0LL);
    }
    -[SDActivityAdvertiser releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion", *(void *)v29);
    v28 = self->_advertisingTransaction;
    self->_advertisingTransaction = 0LL;

    return 0;
  }

- (void)stop
{
  self->_advertisingEnabled = 0;
  -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer");
  -[SDActivityAdvertiser restart](self, "restart");
  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  self->_currentAdvertisementPayload = 0LL;

  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  self->_currentAdvertisementOptions = 0LL;

  id currentErrorHandler = self->_currentErrorHandler;
  self->_id currentErrorHandler = 0LL;
}

- (void)stopForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = handoff_log();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 136315650;
    uint64_t v10 = "-[SDActivityAdvertiser stopForReason:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ + \"%@\"", (uint8_t *)&v9, 0x20u);
  }

  -[NSMutableSet addObject:](self->_shouldNotAdvertiseRequesters, "addObject:", v4);
  if (-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count") == (id)1) {
    -[SDActivityAdvertiser restart](self, "restart");
  }
}

- (void)resumeForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = handoff_log();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 136315650;
    uint64_t v10 = "-[SDActivityAdvertiser resumeForReason:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ - \"%@\"", (uint8_t *)&v9, 0x20u);
  }

  if (-[NSMutableSet containsObject:](self->_shouldNotAdvertiseRequesters, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_shouldNotAdvertiseRequesters, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count")) {
      -[SDActivityAdvertiser restart](self, "restart");
    }
  }
}

- (void)activityServiceDevicesChanged:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = sub_1000854EC(*(void **)(*((void *)&v19 + 1) + 8LL * (void)v9));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 cachedDecryptionKeyForDeviceIdentifier:v13]);

          if (v14)
          {
            objc_msgSend(v11, "setValidKey:", objc_msgSend(v14, "isValidKey"));
            objc_msgSend(v11, "setKeyCounter:", objc_msgSend(v14, "lastUsedCounter"));
          }

          [v4 addObject:v11];
        }

        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000541B0;
  block[3] = &unk_1005CB480;
  block[4] = self;
  id v18 = v4;
  id v15 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.advertising";
}

- (id)exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFActivityAdvertiserProtocol));
  v15[0] = objc_opt_class(&OBJC_CLASS___NSSet, v3);
  v15[1] = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  v15[2] = objc_opt_class(&OBJC_CLASS___SFPeerDevice, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  [v2 setClasses:v7 forSelector:"pairedSFPeerDevicesWithOptions:completionHandler:" argumentIndex:0 ofReply:1];

  v14[0] = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  v14[1] = objc_opt_class(&OBJC_CLASS___NSString, v9);
  v14[2] = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  [v2 setClasses:v12 forSelector:"advertiseAdvertisementPayload:options:withErrorHandler:" argumentIndex:1 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFActivityAdvertiserClient));
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(SFPeerDevice, v3),  "activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:",  2,  0);
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(SFPeerDevice, v4),  "didSendPayloadForActivityIdentifier:toDevice:error:",  1,  0);
  v10[0] = objc_opt_class(&OBJC_CLASS___NSSet, v5);
  v10[1] = objc_opt_class(&OBJC_CLASS___SFPeerDevice, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  [v2 setClasses:v8 forSelector:"pairedDevicesChanged:" argumentIndex:0 ofReply:0];

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  uint64_t v3 = handoff_log(self, a2, a3);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10005671C();
  }
}

- (void)connectionInvalidated:(id)a3
{
  uint64_t v4 = handoff_log(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100056748();
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  id v7 = [v6 count];

  if (!v7) {
    -[SDActivityAdvertiser stop](self, "stop");
  }
}

- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100054674;
  v11[3] = &unk_1005CC0C8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  -[SDActivityAdvertiser _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v11);
}

- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100054770;
  void v14[3] = &unk_1005CC0F0;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  -[SDActivityAdvertiser _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v14);
}

- (NSString)state
{
  id v42 = 0LL;
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v42, "%@\n", v5);
  id v6 = v42;

  id v41 = v6;
  NSAppendPrintF(&v41, "-------------\n");
  id v7 = v41;

  id v40 = v7;
  NSAppendPrintF(&v40, "Version Byte: %u\n", self->_versionByte);
  id v8 = v40;

  id v39 = v8;
  float goodbyeTimerInterval = self->_goodbyeTimerInterval;
  NSAppendPrintF(&v39, "Goodbye Timer Interval: %.2f\n", goodbyeTimerInterval);
  id v10 = v39;

  id v38 = v10;
  if (self->_advertisingEnabled) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  NSAppendPrintF(&v38, "Advertising Enabled: %@\n", v11);
  id v12 = v38;

  id v37 = v12;
  if (-[SDActivityController shouldStart](self, "shouldStart")) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  NSAppendPrintF(&v37, "Should Start: %@\n", v13);
  id v14 = v37;

  id v36 = v14;
  uint64_t v15 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  NSAppendPrintF(&v36, "Should Not Advertise Requesters: %@\n", v16);
  id v17 = v36;

  id v35 = v17;
  if (self->_isAdvertising) {
    id v18 = @"YES";
  }
  else {
    id v18 = @"NO";
  }
  NSAppendPrintF(&v35, "Is Advertising: %@\n", v18);
  id v19 = v35;

  id v34 = v19;
  if (self->_powerAssertionID) {
    __int128 v20 = @"YES";
  }
  else {
    __int128 v20 = @"NO";
  }
  NSAppendPrintF(&v34, "Has Power Assertion:%@\n", v20);
  id v21 = v34;

  int powerAssertionClientPID = self->_powerAssertionClientPID;
  if (powerAssertionClientPID)
  {
    id v33 = v21;
    NSAppendPrintF(&v33, "Power Assertion PID: %d\n", powerAssertionClientPID);
    id v23 = v33;

    id v21 = v23;
  }

  id v32 = v21;
  uint64_t v24 = SFAdvertisementDescriptionFromPayloadData(self->_currentAdvertisementPayload);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  NSAppendPrintF(&v32, "Current Advertisement Payload: %@\n", v25);
  id v26 = v32;

  id v31 = v26;
  uint64_t v27 = SFCompactStringFromCollection(self->_currentAdvertisementOptions);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  NSAppendPrintF(&v31, "Current Advertisement Options: %@\n", v28);
  id v29 = v31;

  return (NSString *)v29;
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)systemWillSleep:(id)a3
{
  uint64_t v4 = handoff_log(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = getuid();
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stopping for user %d on sleep",  (uint8_t *)v6,  8u);
  }

  -[SDActivityAdvertiser stop](self, "stop");
}

- (void)consoleUserChanged:(id)a3
{
  BOOL v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  if (!v4)
  {
    uint64_t v7 = handoff_log(v4, v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = getuid();
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Stopping for user %d on logout",  (uint8_t *)v9,  8u);
    }

    -[SDActivityAdvertiser stop](self, "stop");
  }

- (void)preventIdleSleepAssertion
{
  p_uint64_t powerAssertionID = &self->_powerAssertionID;
  uint64_t powerAssertionID = self->_powerAssertionID;
  if ((_DWORD)powerAssertionID)
  {
    uint64_t v5 = IOPMAssertionCopyProperties(powerAssertionID);
    uint64_t v7 = handoff_log(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000567E4();
    }
  }

  else
  {
    uint64_t v9 = handoff_log(powerAssertionID, a2);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int powerAssertionClientPID = self->_powerAssertionClientPID;
      *(_DWORD *)buf = 67109120;
      int v21 = powerAssertionClientPID;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Grabbing power assertion to keep advertising until told to stop (client PID: %d)",  buf,  8u);
    }

    v18[0] = @"FrameworkBundleID";
    v18[1] = @"AssertType";
    v19[0] = @"com.apple.Sharing";
    v19[1] = @"PreventUserIdleSystemSleep";
    v18[2] = @"AssertName";
    v19[2] = @"Handoff";
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
    uint64_t v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

    uint64_t v13 = IOPMAssertionCreateWithProperties(v5, p_powerAssertionID);
    if ((_DWORD)v13)
    {
      int v15 = v13;
      uint64_t v16 = handoff_log(v13, v14);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100056774(v15, v17);
      }

      unsigned int *p_powerAssertionID = 0;
    }
  }
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    uint64_t v3 = handoff_log();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion", v5, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_uint64_t powerAssertionID = 0;
    self->_int powerAssertionClientPID = 0;
  }

- (void)startGoodbyeTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054F70;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)invalidateGoodbyeTimer
{
  if (self->_goodbyeTimer)
  {
    uint64_t v3 = handoff_log(self, a2);
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000568D4((uint64_t)self, v4);
    }

    -[NSTimer invalidate](self->_goodbyeTimer, "invalidate");
    goodbyeTimer = self->_goodbyeTimer;
    self->_goodbyeTimer = 0LL;
  }

- (void)goodbyeTimeoutFired:(id)a3
{
  id v4 = -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer", a3);
  if (!self->_currentAdvertisementPayload)
  {
    uint64_t v6 = handoff_log(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10005695C((uint64_t)self, v7);
    }

    -[SDActivityAdvertiser stop](self, "stop");
  }

- (BOOL)updateAdvertiser
{
  uint64_t v3 = (NSData *)objc_claimAutoreleasedReturnValue(-[SDActivityAdvertiser createAdvertisingInformation](self, "createAdvertisingInformation"));
  advertisementData = self->_advertisementData;
  self->_advertisementData = v3;

  rawAdvertisementData = self->_rawAdvertisementData;
  self->_rawAdvertisementData = 0LL;

  return -[SDActivityAdvertiser restart](self, "restart");
}

- (id)createAdvertisingInformation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 14LL));
  [v3 setLength:14];
  id v4 = v3;
  uint64_t v5 = (char *)[v4 mutableBytes];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_currentAdvertisementOptions,  "objectForKeyedSubscript:",  SFActivityAdvertiserOptionFlagCopyPasteKey));
  unsigned int v7 = [v6 BOOLValue];

  if (v7) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *uint64_t v5 = v8;
  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  id v10 = off_100641DD8();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](currentAdvertisementOptions, "objectForKeyedSubscript:", v11));
  unsigned __int8 v13 = [v12 BOOLValue];

  v5[4] = v13;
  p_currentAdvertisementPayload = &self->_currentAdvertisementPayload;
  id v16 = -[NSData length](*p_currentAdvertisementPayload, "length");
  id v17 = *p_currentAdvertisementPayload;
  if (v16 == (id)9)
  {
    id v18 = -[NSData bytes](v17, "bytes");
    char v19 = v18[8];
    *(void *)(v5 + 5) = *(void *)v18;
    v5[13] = v19;
  }

  else if (v17)
  {
    uint64_t v20 = handoff_log(v17, v15);
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000569E4((id *)p_currentAdvertisementPayload, v21);
    }
  }

  return v4;
}

- (id)encryptedAdvertisingInformation
{
  id v2 = -[NSData mutableCopy](self->_advertisementData, "mutableCopy");
  uint64_t v3 = (unsigned __int8 *)[v2 mutableBytes];
  id v4 = v3 + 4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v3 + 4, 10LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
  uint64_t v7 = *v3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100055368;
  v10[3] = &unk_1005CC118;
  id v11 = v5;
  id v12 = v3;
  id v8 = v5;
  [v6 getTagAndCounterWhileEncryptingBytesInPlace:v4 forAdvertisementWithVersion:v7 handler:v10];

  return v2;
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityAdvertiser/continuityDidUpdateState",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0LL;
  v19.opaque[1] = 0LL;
  os_activity_scope_enter(v5, &v19);
  uint64_t v8 = handoff_log(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 3)
    {
      id v10 = "UnexpectedState";
    }

    else
    {
      id v10 = off_1005CC078[(void)[v4 state]];
    }

    sub_100056B28((uint64_t)v10, (uint64_t)v20, v9);
  }

  id v11 = [v4 state];
  switch((unint64_t)v11)
  {
    case 0uLL:
      uint64_t v13 = handoff_log(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100056AD0();
      }
      goto LABEL_17;
    case 1uLL:
      uint64_t v18 = handoff_log(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100056AFC();
      }
      goto LABEL_17;
    case 2uLL:
      uint64_t v15 = handoff_log(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100056AA4();
      }
LABEL_17:

      break;
    case 3uLL:
      uint64_t v16 = handoff_log(v11, v12);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100056A78();
      }

      -[SDActivityAdvertiser restart](self, "restart");
      break;
    default:
      break;
  }

  os_activity_scope_leave(&v19);
}

- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityAdvertiser/continuityDidStartAdvertisingOfType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0LL;
  v14.opaque[1] = 0LL;
  os_activity_scope_enter(v7, &v14);
  if (!a4) {
    self->_isAdvertising = 1;
  }
  uint64_t v10 = handoff_log(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100056B64(a4, v11, v12);
  }

  if (self->_isAdvertising)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    [v13 update];
  }

  os_activity_scope_leave(&v14);
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0LL;
  v14.opaque[1] = 0LL;
  os_activity_scope_enter(v7, &v14);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  uint64_t v10 = handoff_log(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100056BEC(a4, v11, v12);
  }

  if (!self->_isAdvertising)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    [v13 update];
  }

  os_activity_scope_leave(&v14);
}

- (void)continuity:(id)a3 continuityDidStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfTypeWithError",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0LL;
  state.opaque[1] = 0LL;
  os_activity_scope_enter(v10, &state);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  uint64_t v13 = handoff_log(v11, v12);
  os_activity_scope_state_s v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100056C74(a4, (uint64_t)v9, v14);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  uint64_t v16 = (void *)WPErrorDomain;
  id v17 = v15;
  id v18 = v16;
  if (v17 == v18)
  {
  }

  else
  {
    os_activity_scope_state_s v19 = v18;
    if ((v17 == 0LL) == (v18 != 0LL))
    {

LABEL_15:
      goto LABEL_16;
    }

    unsigned int v20 = [v17 isEqual:v18];

    if (!v20) {
      goto LABEL_15;
    }
  }

  id v21 = [v9 code];

  if (v21 == (id)28)
  {
    uint64_t v24 = handoff_log(v22, v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Advertising stopped due to address rotation, updating counter and restarting advertising",  v28,  2u);
    }

    rawAdvertisementData = self->_rawAdvertisementData;
    self->_rawAdvertisementData = 0LL;

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
    [v27 bumpEncryptionKeyCounterValue];

    -[SDActivityAdvertiser restart](self, "restart");
  }

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDActivityAdvertiser/continuityDidFailToStartAdvertisingOfType",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0LL;
  v18.opaque[1] = 0LL;
  os_activity_scope_enter(v10, &v18);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  uint64_t v13 = handoff_log(v11, v12);
  os_activity_scope_state_s v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    else {
      uint64_t v15 = off_1005CC138[a4];
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    sub_100056D0C((uint64_t)v15, v16, buf, v14);
  }

  id currentErrorHandler = (void (**)(id, id))self->_currentErrorHandler;
  if (currentErrorHandler) {
    currentErrorHandler[2](currentErrorHandler, v9);
  }
  os_activity_scope_leave(&v18);
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4 withErrorHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100055CCC;
  v11[3] = &unk_1005CC188;
  id v12 = a3;
  id v13 = a4;
  os_activity_scope_state_s v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  dispatch_async(&_dispatch_main_q, v11);
}

- (void)loginIDWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056100;
  v5[3] = &unk_1005CC1B0;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)peerForUUID:(id)a3 completionHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000561F0;
  block[3] = &unk_1005CB858;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)pairedSFPeerDevicesWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056368;
  v5[3] = &unk_1005CB830;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void).cxx_destruct
{
}

@end