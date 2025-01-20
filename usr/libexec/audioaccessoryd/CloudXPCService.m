@interface CloudXPCService
+ (id)sharedInstance;
- (BOOL)accountAvailable;
- (BOOL)manateeZoneUpgraded;
- (BTNetworkMonitor)networkMonitor;
- (BTXPCConnection)serverConnection;
- (CloudXPCService)init;
- (NSHashTable)clients;
- (NSMutableDictionary)activeTransactions;
- (NSUserDefaults)bluetoothDefaults;
- (OS_dispatch_queue)transactionQueue;
- (OS_dispatch_queue)xpcQueue;
- (OS_xpc_object)cloudKitConnection;
- (OS_xpc_object)xpcServer;
- (_TtC15audioaccessoryd13DeviceManager)deviceManager;
- (_TtC15audioaccessoryd16DefaultsObserver)bluetoothDefaultsObserver;
- (id)_legacyNicknameMessage:(id)a3 withNewFormatDevices:(id)a4;
- (id)bundleIdentifierForConnection:(id)a3;
- (id)readUserPreference:(id)a3;
- (id)transactionIdentifierForActionIdentifier:(id)a3;
- (void)_sigTermReceived;
- (void)accountStatusAvailable:(BOOL)a3 force:(BOOL)a4;
- (void)accountStatusUpdateWithAvailable:(BOOL)a3 forced:(BOOL)a4;
- (void)activate;
- (void)allDeviceSupportInformationRecordsRemovedWithRecords:(id)a3;
- (void)allDevicesRemovedWithRecords:(id)a3;
- (void)allLegacyMagicPairingRecordsWithRecordsData:(id)a3;
- (void)allMagicPairingRecordsRemovedWithRecords:(id)a3;
- (void)beginTransaction:(id)a3;
- (void)dealloc;
- (void)deviceSupportInformationRecordsRemovedWithRecords:(id)a3;
- (void)deviceSupportInformationRecordsUpdatedWithRecords:(id)a3;
- (void)devicesRemovedWithRecords:(id)a3;
- (void)devicesUpdatedWithRecords:(id)a3;
- (void)endTransaction:(id)a3;
- (void)establishBluetoothdXPCWithCompletion:(id)a3;
- (void)handleConnection:(id)a3;
- (void)handleConnection:(id)a3 XPCMessage:(id)a4 userID:(unsigned int)a5 processID:(int)a6;
- (void)handleEvent:(id)a3;
- (void)hmDeviceCloudRecordsRemovedWithRecords:(id)a3;
- (void)hmDeviceCloudRecordsUpdatedWithRecords:(id)a3;
- (void)magicPairingRecordsRemovedWithRecords:(id)a3;
- (void)magicPairingRecordsUpdatedWithRecords:(id)a3;
- (void)removeConnection:(id)a3;
- (void)sendCloudKitMsg:(id)a3 args:(id)a4;
- (void)sendCloudKitMsg:(id)a3 args:(id)a4 withReply:(id)a5;
- (void)sendCloudKitMsg:(id)a3 argsObject:(id)a4;
- (void)sendCloudKitMsgSync:(id)a3 args:(id)a4 withReply:(id)a5;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setAccountAvailable:(BOOL)a3;
- (void)setActiveTransactions:(id)a3;
- (void)setBluetoothDefaults:(id)a3;
- (void)setBluetoothDefaultsObserver:(id)a3;
- (void)setClients:(id)a3;
- (void)setCloudKitConnection:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)setXpcQueue:(id)a3;
- (void)setXpcServer:(id)a3;
@end

@implementation CloudXPCService

+ (id)sharedInstance
{
  if (qword_100237278 != -1) {
    dispatch_once(&qword_100237278, &stru_100208A18);
  }
  return (id)qword_100237270;
}

- (CloudXPCService)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CloudXPCService;
  id v2 = -[CloudXPCService init](&v30, "init");
  if (!v2) {
    return (CloudXPCService *)v2;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 environment]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"XPC_SERVICE_NAME"]);

  os_log_t v6 = sub_100060178("XPC");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      v9 = "Cloudpaird is launched by (%@)";
      v10 = v7;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }

  else if (v8)
  {
    *(_WORD *)buf = 0;
    v9 = "Cloudpaird is launched";
    v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_7;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 0LL));
  v13 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v12;

  dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.cloudpaird.xpcservice", v15);
  v17 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = v16;

  dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
  dispatch_queue_t v20 = dispatch_queue_create("com.apple.cloudpaird.xpcservice.transactions", v19);
  v21 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v20;

  uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v23 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v22;

  *((_DWORD *)v2 + 2) = -1;
  if (!*((void *)v2 + 2))
  {
    dispatch_source_t v24 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  *((dispatch_queue_t *)v2 + 4));
    v25 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v24;

    v26 = (dispatch_source_s *)*((void *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000742F0;
    handler[3] = &unk_100206058;
    id v29 = v2;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
  }

  return (CloudXPCService *)v2;
}

- (void)activate
{
  os_log_t v3 = sub_100060178("XPC");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activate Bluetooth Cloud User Daemon", buf, 2u);
  }

  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBPreferencesManager readUserPreference:]( &OBJC_CLASS___CBPreferencesManager,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

  if (v5)
  {
    +[CBPreferencesManager removeuserPreference:sync:]( &OBJC_CLASS___CBPreferencesManager,  "removeuserPreference:sync:",  @"MagicCloudPairingManateeUpgradedAccount",  1LL);
    os_log_t v6 = sub_100060178("MagicPairing");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "This platform needs to remove kMagicCloudPairingManateeUpgraded key",  buf,  2u);
    }
  }

  if (+[CBPreferencesManager isDeviceClass:]( &OBJC_CLASS___CBPreferencesManager,  "isDeviceClass:",  @"AudioAccessory"))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[DarwinNotificationManager shared]( &OBJC_CLASS____TtC15audioaccessoryd25DarwinNotificationManager,  "shared"));
    [v8 setUp];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceManager singleton](&OBJC_CLASS____TtC15audioaccessoryd13DeviceManager, "singleton"));
    -[CloudXPCService setDeviceManager:](self, "setDeviceManager:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
    uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    [v11 setClientQueue:v10];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    [v12 setDeviceDelegate:self];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    [v13 setHmDeviceDelegate:self];

    id v14 = +[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance");
    id v15 = +[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](&OBJC_CLASS____TtC15audioaccessoryd16CloudPushService, "shared"));
    [v8 start];
  }

  id v16 = +[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance");
  os_log_t v17 = sub_100060178("XPC");
  dispatch_queue_attr_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Create the XPC server", buf, 2u);
  }

  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
  mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v19, 1uLL);
  xpcServer = self->_xpcServer;
  self->_xpcServer = mach_service;

  uint64_t v22 = self->_xpcServer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000746D0;
  handler[3] = &unk_100208A40;
  objc_copyWeak(&v28, &location);
  xpc_connection_set_event_handler(v22, handler);
  xpc_connection_resume(self->_xpcServer);
  v23 = objc_alloc_init(&OBJC_CLASS___BTNetworkMonitor);
  -[CloudXPCService setNetworkMonitor:](self, "setNetworkMonitor:", v23);

  dispatch_source_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService networkMonitor](self, "networkMonitor"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100074718;
  v25[3] = &unk_100208A68;
  objc_copyWeak(&v26, &location);
  [v24 startMonitoringWithCallback:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_sigTermReceived
{
  os_log_t v3 = sub_100060178("XPC");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SIGTERM received", buf, 2u);
  }

  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000748A4;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_sync(v5, block);

  xpc_transaction_exit_clean(v6);
}

- (id)bundleIdentifierForConnection:(id)a3
{
  audit_token_t cf = v15;
  os_log_t v3 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (v3)
  {
    v4 = v3;
    *(void *)cf.val = 0LL;
    CFStringRef v5 = SecTaskCopySigningIdentifier(v3, (CFErrorRef *)&cf);
    uint64_t v6 = (__CFString *)v5;
    if (*(void *)cf.val)
    {
      os_log_t v7 = sub_100060178("XPC");
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10019021C();
      }

      CFRelease(*(CFTypeRef *)cf.val);
      if (!v6) {
        goto LABEL_15;
      }
      CFRelease(v6);
    }

    else
    {
      if (v5)
      {
LABEL_15:
        CFRelease(v4);
        return v6;
      }

      os_log_t v12 = sub_100060178("XPC");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001901F0();
      }
    }

    uint64_t v6 = 0LL;
    goto LABEL_15;
  }

  os_log_t v9 = sub_100060178("XPC");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001901C4();
  }

  return 0LL;
}

- (void)dealloc
{
  os_log_t v3 = sub_100060178("XPC");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc called", buf, 2u);
  }

  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    self->_xpcServer = 0LL;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

  if (v6) {
    -[CloudXPCService setServerConnection:](self, "setServerConnection:", 0LL);
  }
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService networkMonitor](self, "networkMonitor"));
  [v7 stopMonitoring];

  -[CloudXPCService setNetworkMonitor:](self, "setNetworkMonitor:", 0LL);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CloudXPCService;
  -[CloudXPCService dealloc](&v8, "dealloc");
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

  if (v8)
  {
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));
    [v9 sendMsg:v6 args:v7];

    sigTermSource = self->_sigTermSource;
    if (sigTermSource)
    {
      uint32_t v11 = sigTermSource;
      dispatch_source_cancel(v11);
      os_log_t v12 = self->_sigTermSource;
      self->_sigTermSource = 0LL;
    }
  }

  else
  {
    os_log_t v13 = sub_100060178("XPC");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to Send message: %@, args: %@",  (uint8_t *)&v15,  0x16u);
    }
  }
}

- (void)establishBluetoothdXPCWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100074C98;
  v4[3] = &unk_100205F68;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)sendCloudKitMsg:(id)a3 argsObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100074FD8;
  v10[3] = &unk_100208AD0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100075258;
  v10[3] = &unk_100208AF8;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  id v13 = self;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000755B8;
  v14[3] = &unk_100208B48;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsgSync:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100075C38;
  v14[3] = &unk_100208B48;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    -[CloudXPCService handleConnection:](self, "handleConnection:", v4);
  }

  else
  {
    xpc_type_t v6 = type;
    os_log_t v7 = sub_100060178("XPC");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v9) {
        sub_1001905EC();
      }
    }

    else if (v9)
    {
      sub_10019064C();
    }
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  id v5 = -[BTXPCConnection initWithConnection:](objc_alloc(&OBJC_CLASS___BTXPCConnection), "initWithConnection:", v4);
  xpc_type_t v6 = (BTXPCConnection *)xpc_connection_copy_entitlement_value(v4, "com.apple.bluetooth.internal");
  os_log_t v7 = (void *)xpc_connection_copy_entitlement_value(v4, "com.apple.bluetooth.user.services");

  os_log_t v8 = sub_100060178("XPC");
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    v19 = v6;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Check entitlement: %@:%@:[%@]",  (uint8_t *)&v18,  0x20u);
  }

  if (v6
    && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL
    && v6 == (BTXPCConnection *)&_xpc_BOOL_true
    && v7
    && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL
    && v7 == &_xpc_BOOL_true
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection")),
        v10,
        !v10))
  {
    os_log_t v16 = sub_100060178("XPC");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Connected to bluetoothd: %@",  (uint8_t *)&v18,  0xCu);
    }

    -[CloudXPCService setServerConnection:](self, "setServerConnection:", v5);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

    if (v11)
    {
      os_log_t v12 = sub_100060178("XPC");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (BTXPCConnection *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));
        int v18 = 138412290;
        v19 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Already connected to bluetoothd: %@",  (uint8_t *)&v18,  0xCu);
      }
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService clients](self, "clients"));
  [v15 addObject:v5];
}

- (void)devicesRemovedWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "devicesRemovedWithDevices: %@", buf, 0xCu);
  }

  id v12 = 0LL;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v12));
  id v9 = v12;
  if (v9)
  {
    os_log_t v10 = sub_100060178("XPC");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001906AC();
    }
  }

  else
  {
    id v13 = @"devices";
    id v14 = v8;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"DevicesRemovedWithRecords", v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)devicesUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "devicesUpdatedWithDevices: %@", buf, 0xCu);
  }

  id v12 = 0LL;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v12));
  id v9 = v12;
  if (v9)
  {
    os_log_t v10 = sub_100060178("XPC");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10019070C();
    }
  }

  else
  {
    id v13 = @"devices";
    id v14 = v8;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"DevicesUpdatedWithRecords", v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)allDevicesRemovedWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allDevicesRemoved: %@", buf, 0xCu);
  }

  id v12 = 0LL;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v12));
  id v9 = v12;
  if (v9)
  {
    os_log_t v10 = sub_100060178("XPC");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10019076C();
    }
  }

  else
  {
    id v13 = @"devices";
    id v14 = v8;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"AllDevicesRemovedWithRecords", v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)_legacyNicknameMessage:(id)a3 withNewFormatDevices:(id)a4
{
  v21 = self;
  id v22 = a3;
  id v5 = a4;
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        v31[0] = @"bluetoothAddress";
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress", v21));
        v31[1] = @"nickname";
        v32[0] = v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 nickname]);
        v32[1] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
        [v6 addObject:v14];
      }

      id v8 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v8);
  }

  id v24 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v6,  0LL,  &v24));
  id v16 = v24;
  if (v16)
  {
    os_log_t v17 = sub_100060178("XPC");
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v22;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001907CC();
    }
  }

  else
  {
    id v29 = @"devices";
    objc_super v30 = v15;
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v19 = v22;
    -[CloudXPCService sendCloudKitMsg:args:](v21, "sendCloudKitMsg:args:", v22, v18);
  }

  return v15;
}

- (void)accountStatusUpdateWithAvailable:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  os_log_t v7 = sub_100060178("XPC");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Force(%d) Account status changed: %d",  (uint8_t *)v9,  0xEu);
  }

  -[CloudXPCService accountStatusAvailable:force:](self, "accountStatusAvailable:force:", v5, v4);
}

- (void)allDeviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "allDeviceSupportInformationRecordsRemovedWithRecords: %{private}@",  buf,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    BOOL v11 = @"records";
    uint64_t v12 = v8;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:]( self,  "sendCloudKitMsg:args:",  @"AllDeviceSupportInformationRecordsRemoved",  v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)allMagicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "allMagicPairingRecordsRemovedWithRecords: %{private}@",  buf,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    BOOL v11 = @"records";
    uint64_t v12 = v8;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"AllMagicPairingRecordsRemoved", v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)deviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "deviceSupportInformationRecordsRemovedWithRecords: %{private}@",  buf,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    BOOL v11 = @"records";
    uint64_t v12 = v8;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:]( self,  "sendCloudKitMsg:args:",  @"DeviceSupportInformationRecordsRemoved",  v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)deviceSupportInformationRecordsUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "deviceSupportInformationRecordsUpdatedWithRecords: %{private}@",  buf,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    BOOL v11 = @"records";
    uint64_t v12 = v8;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:]( self,  "sendCloudKitMsg:args:",  @"DeviceSupportInformationRecordsUpdated",  v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)magicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_autoreleasePoolPush();
  os_log_t v6 = sub_100060178("XPC");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "magicPairingRecordsRemovedWithRecords: %{private}@",  buf,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    BOOL v11 = @"records";
    uint64_t v12 = v8;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"MagicPairingRecordsRemoved", v10);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)magicPairingRecordsUpdatedWithRecords:(id)a3
{
  id v9 = a3;
  v55 = objc_autoreleasePoolPush();
  unsigned __int8 v10 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  if ((v10 & 1) != 0)
  {
    int v54 = 0;
  }

  else
  {
    id v3 = &OBJC_CLASS___AADeviceManagerDaemon;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v49 pauseErrorReason]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v4 isEqualToString:CKErrorDomain])
    {
      os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
      os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseErrorReason]);
      if ([v7 code] == (id)26)
      {

        BOOL v11 = 1;
LABEL_42:

        goto LABEL_43;
      }

      int v54 = 1;
    }

    else
    {
      int v54 = 0;
    }
  }

  unsigned __int8 v53 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  if ((v53 & 1) != 0)
  {
    v52 = v7;
    int v12 = 0;
  }

  else
  {
    id v3 = &OBJC_CLASS___AADeviceManagerDaemon;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v51 pauseErrorReason]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v48 domain]);
    if ([v47 isEqualToString:CKErrorDomain])
    {
      id v3 = (__objc2_class *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class pauseErrorReason](v3, "pauseErrorReason"));
      if ([v13 code] == (id)11)
      {

        BOOL v11 = 1;
        goto LABEL_39;
      }

      v39 = v13;
      v52 = v7;
      int v12 = 1;
    }

    else
    {
      v52 = v7;
      int v12 = 0;
    }
  }

  unsigned int v14 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  v50 = v3;
  if (v14
    && (v46 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance")),
        v45 = (void *)objc_claimAutoreleasedReturnValue([v46 pauseErrorReason]),
        v44 = (void *)objc_claimAutoreleasedReturnValue([v45 domain]),
        [v44 isEqualToString:CKErrorDomain]))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pauseErrorReason]);
    if ([v16 code] == (id)11)
    {

      BOOL v11 = 1;
      os_log_t v17 = v51;
      if ((v12 & 1) == 0) {
        goto LABEL_35;
      }
LABEL_34:

      goto LABEL_35;
    }

    if (!-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
    {

      BOOL v11 = 0;
      os_log_t v17 = v51;
      goto LABEL_33;
    }

    v36 = v16;
    v37 = v15;
    int v19 = 1;
  }

  else
  {
    unsigned __int8 v18 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
    int v19 = 0;
    BOOL v11 = 0;
    if ((v18 & 1) == 0) {
      goto LABEL_23;
    }
  }

  int v40 = v19;
  v41 = v6;
  v42 = v4;
  unsigned __int8 v43 = v10;
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pauseErrorReason]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
  if (![v22 isEqualToString:CKErrorDomain])
  {

    BOOL v11 = 0;
    if (!v40) {
      goto LABEL_22;
    }
LABEL_26:

    unsigned __int8 v10 = v43;
    os_log_t v6 = v41;
    id v4 = v42;
    os_log_t v17 = v51;
    if ((v14 & 1) != 0) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }

  id v38 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
  id v24 = v5;
  __int128 v25 = self;
  int v26 = v12;
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 pauseErrorReason]);
  BOOL v11 = [v27 code] == (id)26;

  int v12 = v26;
  self = v25;
  BOOL v5 = v24;

  id v9 = v38;
  if ((v40 & 1) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  unsigned __int8 v10 = v43;
  os_log_t v6 = v41;
  id v4 = v42;
LABEL_23:
  os_log_t v17 = v51;
  if (v14)
  {
LABEL_33:

    if ((v12 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

- (void)allLegacyMagicPairingRecordsWithRecordsData:(id)a3
{
  id v3 = a3;
  os_log_t v4 = sub_100060178("MagicPairing");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Inform bluetoothd with cloud data: %@",  buf,  0xCu);
  }

  if (v3)
  {
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  @"kDeviceInfoBlob",  0LL));
    [v6 sendCloudKitMsg:@"DeviceInfoAvailable" args:v7];
  }
}

- (void)accountStatusAvailable:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  os_log_t v7 = sub_100060178("XPC");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v28[0]) = v5;
    WORD2(v28[0]) = 1024;
    *(_DWORD *)((char *)v28 + 6) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Account status changed: %d, Forced: %d",  buf,  0xEu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100077C1C;
  v21[3] = &unk_100208B88;
  BOOL v22 = v5;
  [v9 fetchAccountMagicKeysBlobWithCompletion:v21];

  BOOL v10 = -[CloudXPCService accountAvailable](self, "accountAvailable") ^ v5;
  if (v4 || v10)
  {
    -[CloudXPCService setAccountAvailable:](self, "setAccountAvailable:", v5);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudAccountInfo]);

    if (v12)
    {
      os_log_t v13 = sub_100060178("XPC");
      unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v28[0] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cloud Account Info: %{private}@",  buf,  0xCu);
      }

      v25[0] = @"kSignInStatus";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CloudXPCService accountAvailable](self, "accountAvailable")));
      v25[1] = @"kSignInAppleID";
      v26[0] = v15;
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 loginID]);
      os_log_t v17 = (void *)v16;
      unsigned __int8 v18 = &stru_100212678;
      if (v16) {
        unsigned __int8 v18 = (const __CFString *)v16;
      }
      v26[1] = v18;
      int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
      -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"SignInStatusChanged", v19);
    }

    else
    {
      v23 = @"kSignInStatus";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CloudXPCService accountAvailable](self, "accountAvailable")));
      id v24 = v15;
      os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", @"SignInStatusChanged", v17);
    }

    if (v10 && v5)
    {
      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
        [v20 markLegacyNonManateeContainerMigrated];
      }
    }
  }

- (void)hmDeviceCloudRecordsRemovedWithRecords:(id)a3
{
  id v3 = a3;
  os_log_t v4 = sub_100060178("XPC");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "hmDeviceCloudRecordsRemovedWithRecords: %@",  buf,  0xCu);
  }

  os_log_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v11),  "hmDeviceCloudRecordInfo",  (void)v14));
        -[NSMutableArray addObject:](v6, "addObject:", v12);

        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[BTUserCloudServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTUserCloudServicesDaemon,  "sharedBTServicesDaemon"));
  [v13 reportHMDeviceCloudRecordInfosRemoved:v6];
}

- (void)hmDeviceCloudRecordsUpdatedWithRecords:(id)a3
{
  id v3 = a3;
  os_log_t v4 = sub_100060178("XPC");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "hmDeviceCloudRecordsUpdatedWithRecords: %@",  buf,  0xCu);
  }

  os_log_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v11),  "hmDeviceCloudRecordInfo",  (void)v14));
        -[NSMutableArray addObject:](v6, "addObject:", v12);

        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[BTUserCloudServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTUserCloudServicesDaemon,  "sharedBTServicesDaemon"));
  [v13 reportHMDeviceCloudRecordInfosUpdated:v6];
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("XPC");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove connection: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService clients](self, "clients"));
  [v7 removeObject:v4];
}

- (BOOL)manateeZoneUpgraded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CloudXPCService readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

  if (v2)
  {
    os_log_t v3 = sub_100060178("MagicPairing");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee: Master zone has been upgraded. Dont generate keys",  v6,  2u);
    }
  }

  return v2 != 0LL;
}

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue( (CFStringRef)a3,  kCFPreferencesCurrentApplication,  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
}

- (void)handleConnection:(id)a3 XPCMessage:(id)a4 userID:(unsigned int)a5 processID:(int)a6
{
  id v8 = a3;
  id v9 = a4;
  xpc_type_t type = xpc_get_type(v9);
  os_log_t v11 = sub_100060178("XPC");
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received _handleXPCMessage", buf, 2u);
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v9, "kMsgId");
    os_log_t v14 = sub_100060178("XPC");
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    __int128 v16 = v15;
    if (!string)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100190838();
      }
      goto LABEL_55;
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v182 = (uint64_t)string;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "received msg: %s", buf, 0xCu);
    }

    xpc_object_t value = xpc_dictionary_get_value(v9, "kMsgArgs");
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(value);
    __int128 v16 = v18;
    if (v18) {
      xpc_get_type(v18);
    }
    if (!strcmp(string, "MasterKeysAvailable")) {
      goto LABEL_55;
    }
    if (!strcmp(string, "Start"))
    {
      os_log_t v33 = sub_100060178("XPC");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received Start", buf, 2u);
      }

      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded")) {
        uint64_t v35 = &OBJC_CLASS___MPCloudKit_Manatee;
      }
      else {
        uint64_t v35 = &OBJC_CLASS___MPCloudKit;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v35, "sharedInstance"));
      [v36 getAccountStatus];
      goto LABEL_48;
    }

    if (!strcmp(string, "DeviceInfoAvailable") || !strcmp(string, "OnlineStatusChanged")) {
      goto LABEL_55;
    }
    if (!strcmp(string, "SignInStatusChanged"))
    {
      -[CloudXPCService beginTransaction:](self, "beginTransaction:", @"SignInStatusChanged");
      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
        id v38 = v37;
        v173[0] = _NSConcreteStackBlock;
        v173[1] = 3221225472LL;
        v173[2] = sub_100079AD4;
        v173[3] = &unk_100208BB0;
        v173[4] = self;
        v39 = v173;
      }

      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
        id v38 = v37;
        v174[0] = _NSConcreteStackBlock;
        v174[1] = 3221225472LL;
        v174[2] = sub_100079A44;
        v174[3] = &unk_100208BB0;
        v174[4] = self;
        v39 = v174;
      }

      [v37 fetchAccountStatusWithCompletion:v39];
      goto LABEL_54;
    }

    if (!strcmp(string, "getMasterKey"))
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472LL;
      v172[2] = sub_100079B7C;
      v172[3] = &unk_100208BD8;
      v172[4] = self;
      [v38 fetchAccountMagicKeysBlobWithCompletion:v172];
      goto LABEL_54;
    }

    if (!strcmp(string, "getAccessoryKey"))
    {
      unsigned __int8 v40 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
      os_log_t v41 = sub_100060178("XPC");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      if ((v40 & 1) != 0)
      {
        if (v43)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Manatee getAccessoryKey", buf, 2u);
        }

        v44 = &off_100205368;
      }

      else
      {
        if (v43)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "getAccessoryKey", buf, 2u);
        }

        v44 = off_100205360;
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v44, "sharedInstance"));
      [v50 fetchAccessoryKeyBlob:0];
    }

    else
    {
      if (strcmp(string, "getSignInStatus"))
      {
        if (strcmp(string, "getOnlineStatus"))
        {
          if (strcmp(string, "writeMasterKey"))
          {
            if (strcmp(string, "writeAccessoryKey"))
            {
              if (!strcmp(string, "deleteAllAccessories"))
              {
                unsigned __int8 v70 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
                os_log_t v71 = sub_100060178("XPC");
                v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
                BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
                if ((v70 & 1) != 0)
                {
                  if (v73)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Manatee deleteAllAccessories",  buf,  2u);
                  }

                  v74 = &OBJC_CLASS___MPCloudKit_Manatee;
                }

                else
                {
                  if (v73)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "deleteAllAccessories", buf, 2u);
                  }

                  v74 = &OBJC_CLASS___MPCloudKit;
                }

                v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v74, "sharedInstance"));
                [v36 updateCloudKitAccessoryZone:0 delete:1];
                goto LABEL_48;
              }

              if (!strcmp(string, "checkIn"))
              {
                if (!v16) {
                  goto LABEL_55;
                }
                v36 = (void *)_CFXPCCreateCFObjectFromXPCMessage(v16);
                v55 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"kCheckInVersion"]);
                os_log_t v79 = sub_100060178("XPC");
                v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v182 = (uint64_t)v55;
                  _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "received checkIn message version: %@",  buf,  0xCu);
                }
              }

              else
              {
                if (!strcmp(string, "manateeZoneAvailabe"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue( +[MPCloudKit_Manatee sharedInstance]( &OBJC_CLASS___MPCloudKit_Manatee,  "sharedInstance"));
                  [v36 manateeZoneAvailable];
                  goto LABEL_48;
                }

                if (!strcmp(string, "deleteOldContainer"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
                  [v36 markLegacyNonManateeContainerMigrated];
                  goto LABEL_48;
                }

                uint64_t v19 = strcmp(string, "nukeOldContainer");
                if (!(_DWORD)v19 && IsAppleInternalBuild(v19) || !strcmp(string, "resetOldContainer"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
                  [v36 resetOldZones];
                  goto LABEL_48;
                }

                if (!strcmp(string, "upgradeToManatee"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
                  [v36 upgradeLegacyNonManateeContainerToManatee];
                  goto LABEL_48;
                }

                if (!strcmp(string, "CachedLocalIDSIdentifiers"))
                {
                  if (v16)
                  {
                    v84 = objc_autoreleasePoolPush();
                    v85 = (void *)_CFXPCCreateCFObjectFromXPCMessage(v16);
                    v86 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKey:@"kIDSIdentifiers"]);
                    if (v85
                      && (uint64_t v87 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v85, v87) & 1) != 0)
                      && v86
                      && (uint64_t v88 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v86, v88) & 1) != 0))
                    {
                      os_log_t v89 = sub_100060178("XPC");
                      v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
                      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v182 = (uint64_t)v85;
                        _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "Update CachedLocalIDSIdentifiers: %@",  buf,  0xCu);
                      }

                      v91 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
                      [v91 xpcUpdateCloudPairings:v86];
                    }

                    else
                    {
                      os_log_t v94 = sub_100060178("XPC");
                      v91 = (void *)objc_claimAutoreleasedReturnValue(v94);
                      if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_ERROR)) {
                        sub_100190870();
                      }
                    }

                    objc_autoreleasePoolPop(v84);
                  }

                  goto LABEL_55;
                }

                if (strcmp(string, "cloudpairingRetry"))
                {
                  if (!strcmp(string, "sendCloudKitPush"))
                  {
                    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
                    [v36 sendCloudKitPush];
                    goto LABEL_48;
                  }

                  if (!strcmp(string, "printDebug"))
                  {
                    v95 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue([v95 deviceManager]);
                    v97 = (void *)objc_claimAutoreleasedReturnValue([v96 printDebug]);
                    v98 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 statedumpAndRecordDailyMetric]);
                    uint64_t v159 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v97,  v99));

                    os_log_t v100 = sub_100060178("XPC");
                    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v182 = v159;
                      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Statedump:\n%@", buf, 0xCu);
                    }

                    if (v159)
                    {
                      v175 = @"printDebug";
                      uint64_t v176 = v159;
                      v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v176,  &v175,  1LL));
                      sub_100079D4C(v9, v102);
                    }

                    else
                    {
                      sub_100079D4C(v9, &off_100218DF0);
                    }

                    v116 = (void *)v159;
                    goto LABEL_155;
                  }

                  if (!strcmp(string, "nukeCloud"))
                  {
                    os_log_t v103 = sub_100060178("XPC");
                    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "nuking cloud", buf, 2u);
                    }

                    id v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                    uint64_t v105 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                    if ((objc_opt_isKindOfClass(v38, v105) & 1) != 0)
                    {
                      v106 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"nuke"]);
                      unsigned int v107 = [v106 isEqualToString:@"nukeMe"];

                      if (v107)
                      {
                        v108 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](&OBJC_CLASS___MPCloudKit, "sharedInstance"));
                        [v108 resetOldZones];

                        v109 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
                        v170[0] = _NSConcreteStackBlock;
                        v170[1] = 3221225472LL;
                        v170[2] = sub_100079DE8;
                        v170[3] = &unk_100206080;
                        id v171 = v9;
                        [v109 resetCloudDataWithCompletion:v170];
                      }
                    }

                    goto LABEL_54;
                  }

                  id v20 = objc_claimAutoreleasedReturnValue( +[XPCMessages fetchDeviceList]( &OBJC_CLASS____TtC15audioaccessoryd11XPCMessages, "fetchDeviceList"));
                  int v21 = strcmp(string, (const char *)[v20 UTF8String]);

                  if (!v21)
                  {
                    v114 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
                    v115 = (void *)objc_claimAutoreleasedReturnValue([v114 deviceManager]);
                    v168[0] = _NSConcreteStackBlock;
                    v168[1] = 3221225472LL;
                    v168[2] = sub_100079EF0;
                    v168[3] = &unk_100208C00;
                    id v169 = v9;
                    [v115 fetchDeviceRecordsWithCompletion:v168];

                    v116 = v169;
                    goto LABEL_155;
                  }

                  id v22 = objc_claimAutoreleasedReturnValue( +[XPCMessages nicknameDevice]( &OBJC_CLASS____TtC15audioaccessoryd11XPCMessages, "nicknameDevice"));
                  int v23 = strcmp(string, (const char *)[v22 UTF8String]);

                  if (v23)
                  {
                    id v24 = objc_claimAutoreleasedReturnValue( +[XPCMessages removeDeviceNickname]( &OBJC_CLASS____TtC15audioaccessoryd11XPCMessages, "removeDeviceNickname"));
                    int v25 = strcmp(string, (const char *)[v24 UTF8String]);

                    if (v25)
                    {
                      id v26 = objc_claimAutoreleasedReturnValue( +[XPCMessages resetCachedData]( &OBJC_CLASS____TtC15audioaccessoryd11XPCMessages, "resetCachedData"));
                      int v27 = strcmp(string, (const char *)[v26 UTF8String]);

                      if (v27)
                      {
                        id v28 = objc_claimAutoreleasedReturnValue( +[XPCMessages fetchNicknameDevice]( &OBJC_CLASS____TtC15audioaccessoryd11XPCMessages, "fetchNicknameDevice"));
                        int v29 = strcmp(string, (const char *)[v28 UTF8String]);

                        if (v29)
                        {
                          objc_super v30 = xpc_copy_description(v9);
                          os_log_t v31 = sub_100060178("XPC");
                          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 136315138;
                            uint64_t v182 = (uint64_t)v30;
                            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Ignoring unhandled incoming XPC message: %s",  buf,  0xCu);
                          }

                          free(v30);
                          goto LABEL_55;
                        }

                        v36 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                        if (v36)
                        {
                          uint64_t v144 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                          if ((objc_opt_isKindOfClass(v36, v144) & 1) != 0)
                          {
                            v145 = (void *)objc_claimAutoreleasedReturnValue( +[XPCArguments CloudDeviceAddress]( &OBJC_CLASS____TtC15audioaccessoryd12XPCArguments,  "CloudDeviceAddress"));
                            uint64_t v146 = objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v145]);
                            if (v146)
                            {
                              v147 = (void *)v146;
                              v148 = (void *)objc_claimAutoreleasedReturnValue( +[XPCArguments CloudDeviceAddress]( &OBJC_CLASS____TtC15audioaccessoryd12XPCArguments,  "CloudDeviceAddress"));
                              v149 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v148]);
                              uint64_t v150 = objc_opt_class(&OBJC_CLASS___NSString);
                              LODWORD(v159) = objc_opt_isKindOfClass(v149, v150);

                              if ((v159 & 1) != 0)
                              {
                                v151 = (void *)objc_claimAutoreleasedReturnValue( +[XPCArguments CloudDeviceAddress]( &OBJC_CLASS____TtC15audioaccessoryd12XPCArguments,  "CloudDeviceAddress"));
                                v55 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v151]);

                                os_log_t v152 = sub_100060178("XPC");
                                v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
                                if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  uint64_t v182 = (uint64_t)v55;
                                  _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_DEFAULT,  "Fetch Cloud Data for device: %@",  buf,  0xCu);
                                }

                                v154 = (void *)objc_claimAutoreleasedReturnValue( +[CloudXPCService sharedInstance]( &OBJC_CLASS___CloudXPCService,  "sharedInstance"));
                                v155 = (void *)objc_claimAutoreleasedReturnValue([v154 deviceManager]);
                                v160[0] = _NSConcreteStackBlock;
                                v160[1] = 3221225472LL;
                                v160[2] = sub_10007A25C;
                                v160[3] = &unk_100208C28;
                                id v161 = v9;
                                [v155 fetchDeviceWithAddress:v55 completion:v160];

                                goto LABEL_102;
                              }
                            }

                            else
                            {
                            }
                          }
                        }

                        os_log_t v157 = sub_100060178("XPC");
                        v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
                        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG)) {
                          sub_1001909E4();
                        }

                        sub_100079D4C(v9, &__NSDictionary0__struct);
                        goto LABEL_48;
                      }

                      os_log_t v140 = sub_100060178("XPC");
                      v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
                      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "Reset Cached Data XPC message",  buf,  2u);
                      }

                      v142 = (void *)objc_claimAutoreleasedReturnValue( +[CloudXPCService sharedInstance]( &OBJC_CLASS___CloudXPCService,  "sharedInstance"));
                      v143 = (void *)objc_claimAutoreleasedReturnValue([v142 deviceManager]);
                      v162[0] = _NSConcreteStackBlock;
                      v162[1] = 3221225472LL;
                      v162[2] = sub_10007A180;
                      v162[3] = &unk_100206080;
                      id v163 = v9;
                      [v143 resetCachedDataWithCompletion:v162];

                      v116 = v163;
LABEL_155:

                      goto LABEL_55;
                    }

                    id v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                    os_log_t v131 = sub_100060178("XPC");
                    v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
                    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138477827;
                      uint64_t v182 = (uint64_t)v38;
                      _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "Remove nickname device incoming XPC message: %{private}@",  buf,  0xCu);
                    }

                    if (-[CloudXPCService accountAvailable](self, "accountAvailable"))
                    {
                      if (v38)
                      {
                        uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                        if ((objc_opt_isKindOfClass(v38, v133) & 1) != 0)
                        {
                          v120 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"bluetoothAddress"]);
                          v121 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"nickname"]);
                          if (v120)
                          {
                            uint64_t v134 = objc_opt_class(&OBJC_CLASS___NSString);
                            if ((objc_opt_isKindOfClass(v120, v134) & 1) != 0)
                            {
                              if (v121)
                              {
                                uint64_t v135 = objc_opt_class(&OBJC_CLASS___NSString);
                                if ((objc_opt_isKindOfClass(v121, v135) & 1) != 0)
                                {
                                  id v124 = [[BTCloudDevice alloc] initWithBluetoothAddress:v120];
                                  [v124 setNickname:v121];
                                  v136 = (void *)objc_claimAutoreleasedReturnValue( +[CloudXPCService sharedInstance]( &OBJC_CLASS___CloudXPCService,  "sharedInstance"));
                                  v137 = (void *)objc_claimAutoreleasedReturnValue([v136 deviceManager]);
                                  v164[0] = _NSConcreteStackBlock;
                                  v164[1] = 3221225472LL;
                                  v164[2] = sub_10007A0A4;
                                  v164[3] = &unk_100206080;
                                  id v165 = v9;
                                  [v137 removeDeviceWithRecord:v124 completion:v164];

                                  v127 = v165;
                                  goto LABEL_179;
                                }
                              }
                            }
                          }

                          v156 = &off_100218F58;
                          goto LABEL_196;
                        }
                      }
                    }

                    os_log_t v138 = sub_100060178("XPC");
                    v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
                    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
                      sub_100190970(self);
                    }

                    v130 = &off_100218F80;
                  }

                  else
                  {
                    id v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                    os_log_t v117 = sub_100060178("XPC");
                    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138477827;
                      uint64_t v182 = (uint64_t)v38;
                      _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "Nickname device incoming XPC message: %{private}@",  buf,  0xCu);
                    }

                    if (-[CloudXPCService accountAvailable](self, "accountAvailable"))
                    {
                      if (v38)
                      {
                        uint64_t v119 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                        if ((objc_opt_isKindOfClass(v38, v119) & 1) != 0)
                        {
                          v120 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"bluetoothAddress"]);
                          v121 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"nickname"]);
                          if (v120)
                          {
                            uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSString);
                            if ((objc_opt_isKindOfClass(v120, v122) & 1) != 0)
                            {
                              if (v121)
                              {
                                uint64_t v123 = objc_opt_class(&OBJC_CLASS___NSString);
                                if ((objc_opt_isKindOfClass(v121, v123) & 1) != 0)
                                {
                                  id v124 = [[BTCloudDevice alloc] initWithBluetoothAddress:v120];
                                  [v124 setNickname:v121];
                                  v125 = (void *)objc_claimAutoreleasedReturnValue( +[CloudXPCService sharedInstance]( &OBJC_CLASS___CloudXPCService,  "sharedInstance"));
                                  v126 = (void *)objc_claimAutoreleasedReturnValue([v125 deviceManager]);
                                  v166[0] = _NSConcreteStackBlock;
                                  v166[1] = 3221225472LL;
                                  v166[2] = sub_100079FC8;
                                  v166[3] = &unk_100206080;
                                  id v167 = v9;
                                  [v126 addDeviceWithRecord:v124 completion:v166];

                                  v127 = v167;
LABEL_179:

LABEL_197:
                                  goto LABEL_54;
                                }
                              }
                            }
                          }

                          v156 = &off_100218EB8;
LABEL_196:
                          sub_100079D4C(v9, v156);
                          goto LABEL_197;
                        }
                      }
                    }

                    os_log_t v128 = sub_100060178("XPC");
                    v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
                    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
                      sub_1001908FC(self);
                    }

                    v130 = &off_100218EE0;
                  }

                  sub_100079D4C(v9, v130);
LABEL_54:

                  goto LABEL_55;
                }

                if (!v16) {
                  goto LABEL_55;
                }
                xpc_connection_get_audit_token(v8, buf);
                uint64_t v92 = xpc_copy_code_signing_identity_for_token(buf);
                if (v92)
                {
                  v93 = (void *)v92;
                  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v92));
                  free(v93);
                }

                else
                {
                  v36 = 0LL;
                }

                v55 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                os_log_t v110 = sub_100060178("XPC");
                v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
                if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v177 = 138412546;
                  v178 = v36;
                  __int16 v179 = 2112;
                  v180 = v55;
                  _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "cloudpairingRetry incoming (%@) XPC message: %@",  v177,  0x16u);
                }

                if (v55 && (uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v55, v112) & 1) != 0))
                {
                  v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
                  -[os_log_s sendRePairRequest:forBundleID:](v78, "sendRePairRequest:forBundleID:", v55, v36);
                }

                else
                {
                  os_log_t v113 = sub_100060178("XPC");
                  v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
                    sub_1001908D0();
                  }
                }
              }

- (id)transactionIdentifierForActionIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.bluetooth.user.transaction",  a3);
}

- (void)beginTransaction:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007A4C4;
  block[3] = &unk_100206358;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007A740;
  block[3] = &unk_100206358;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (OS_xpc_object)xpcServer
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setXpcServer:(id)a3
{
}

- (BTXPCConnection)serverConnection
{
  return (BTXPCConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setServerConnection:(id)a3
{
}

- (OS_xpc_object)cloudKitConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCloudKitConnection:(id)a3
{
}

- (_TtC15audioaccessoryd13DeviceManager)deviceManager
{
  return (_TtC15audioaccessoryd13DeviceManager *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDeviceManager:(id)a3
{
}

- (BTNetworkMonitor)networkMonitor
{
  return (BTNetworkMonitor *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (NSMutableDictionary)activeTransactions
{
  return self->_activeTransactions;
}

- (void)setActiveTransactions:(id)a3
{
}

- (NSUserDefaults)bluetoothDefaults
{
  return self->_bluetoothDefaults;
}

- (void)setBluetoothDefaults:(id)a3
{
}

- (_TtC15audioaccessoryd16DefaultsObserver)bluetoothDefaultsObserver
{
  return self->_bluetoothDefaultsObserver;
}

- (void)setBluetoothDefaultsObserver:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (BOOL)accountAvailable
{
  return self->_accountAvailable;
}

- (void)setAccountAvailable:(BOOL)a3
{
  self->_accountAvailable = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end