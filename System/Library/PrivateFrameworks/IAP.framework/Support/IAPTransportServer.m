@interface IAPTransportServer
+ (BOOL)supportsIAPD;
+ (id)sharedIAPTransportServer;
- (BOOL)bHasConnectionCON;
- (BOOL)bHasConnectionE75;
- (BOOL)bOSInternalBuild;
- (BOOL)createNewClientPort:(id)a3 connection:(id)a4;
- (BOOL)iap2dPortListContainsItems;
- (BOOL)iapdPortListContainsItems;
- (BOOL)isDeviceInLowPowerMode;
- (BOOL)isLowPowerModeSupported;
- (BOOL)isShuttingDown;
- (IAPTransportServer)init;
- (IAPXPCConnection)iap2d_connection;
- (IAPXPCConnection)iapd_connection;
- (IONotificationPort)ioaccessoryNotifyPort;
- (NSMutableDictionary)iapPortManagers;
- (NSString)deviceUUIDStr;
- (OS_dispatch_queue)iaptransportdhighPriorityRootQueue;
- (OS_dispatch_queue)shutdownQ;
- (id)iapPortManagerForDevPort:(IapTransport *)a3;
- (int)iDeviceClass;
- (unsigned)iap9PinUSBConnState;
- (unsigned)ioAccNotification;
- (unsigned)ioAccPortID;
- (void)_detachClientPort:(IapTransport *)a3;
- (void)_listenForAccessoryPortChanges;
- (void)_pollForDeathAfterPromptCompletes;
- (void)_setupiAPInterfaceNotifications;
- (void)_updatePlistWithApplicationUninstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)attachPowerModeNotifications;
- (void)bringdownPlatform;
- (void)bringupPlatform;
- (void)checkXPCConnections;
- (void)cleanupPhysicalConnectorConnections;
- (void)cleanupStaleClientPorts:(int)a3;
- (void)clientPortReceivedData:(id)a3 dataPtr:(char *)a4 length:(unsigned __int16)a5;
- (void)dealloc;
- (void)deleteAllPorts;
- (void)deleteClientPortsUsingConnection:(id)a3;
- (void)deleteWiredPorts;
- (void)detachIOKitPort:(IapTransport *)a3;
- (void)detachPowerModeNotifications;
- (void)enterLowPowerMode;
- (void)exitLowPowerMode;
- (void)handleLowPowerModeStateChange:(BOOL)a3;
- (void)iap2Disconnect;
- (void)iapDisconnect;
- (void)pIapPortAppleIDBusRootCON;
- (void)pIapPortAppleIDBusRootE75;
- (void)preventIdleSleep:(BOOL)a3;
- (void)radioPreferencesChanged:(unsigned int)a3;
- (void)registerClientPortAccessory:(id)a3 connection:(id)a4;
- (void)run;
- (void)sendValidAccResistorIDToIAPD;
- (void)setHasAdaptor:(BOOL)a3;
- (void)setIap2dPortListContainsItems:(BOOL)a3;
- (void)setIap2d_connection:(id)a3;
- (void)setIap9PinUSBConnState:(unsigned __int8)a3;
- (void)setIapdPortListContainsItems:(BOOL)a3;
- (void)setIapd_connection:(id)a3;
- (void)setIoAccNotification:(unsigned int)a3;
- (void)setIoAccPortID:(unsigned __int8)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setUSBMode:(IapTransport *)a3 forMode:(int)a4;
- (void)setWiredPortPacketParsingState:(BOOL)a3;
- (void)setiaptransportdhighPriorityRootQueue:(id)a3;
- (void)startAccPowerTimer:(unsigned int)a3;
- (void)startAccPowerTimer:(unsigned int)a3 ForPortService:(unsigned int)a4;
- (void)startIOAccMgrPortDetectTimer:(unsigned int)a3;
- (void)stopServer:(int)a3;
- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4;
- (void)toggleAccessoryPowerForPortService:(unsigned int)a3;
- (void)unregisterClientPortAccessory:(id)a3;
- (void)updateDeviceUUIDState;
- (void)updatePortManagers;
- (void)updateSleepAssertionState;
@end

@implementation IAPTransportServer

+ (id)sharedIAPTransportServer
{
  if (qword_10002DD10 != -1) {
    dispatch_once(&qword_10002DD10, &stru_100029628);
  }
  return (id)qword_10002DD18;
}

+ (BOOL)supportsIAPD
{
  return 1;
}

- (void)setiaptransportdhighPriorityRootQueue:(id)a3
{
  iaptransportdhighPriorityRootQueue = (dispatch_object_s *)self->_iaptransportdhighPriorityRootQueue;
  if (iaptransportdhighPriorityRootQueue) {
    dispatch_release(iaptransportdhighPriorityRootQueue);
  }
  self->_iaptransportdhighPriorityRootQueue = (OS_dispatch_queue *)a3;
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (void)_listenForAccessoryPortChanges
{
  ioaccessoryNotifyPort = self->_ioaccessoryNotifyPort;
  v4 = IOServiceMatching("IOAccessoryPort");
  uint64_t v5 = IOServiceAddMatchingNotification( ioaccessoryNotifyPort,  "IOServicePublish",  v4,  (IOServiceMatchingCallback)sub_10001423C,  self,  &self->_ioaccessoryPortAddedIterator);
  if ((_DWORD)v5)
  {
    NSLog( @"ERROR - %s:%s - %d IOServiceAddMatchingNotification failed 0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm",  "-[IAPTransportServer _listenForAccessoryPortChanges]",  1688LL,  v5);
  }

  else
  {
    sub_10001423C(self, self->_ioaccessoryPortAddedIterator);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  }

- (void)_setupiAPInterfaceNotifications
{
  v3 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_iapInterfaceNotifyPort = v3;
  if (v3)
  {
    CFMutableDictionaryRef v4 = IOServiceMatching("IOUSBInterface");
    if (v4)
    {
      uint64_t v5 = v4;
      keys = @"SupportsIAP";
      CFDictionaryRef v6 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, @"IOPropertyMatch", v6);
      CFRelease(v6);
      v7 = (const __CFDictionary *)CFRetain(v5);
      uint64_t v8 = IOServiceAddMatchingNotification( self->_iapInterfaceNotifyPort,  "IOServiceFirstMatch",  v7,  (IOServiceMatchingCallback)sub_100014694,  0LL,  &self->_iAPInterfaceDeviceArrivedIterator);
      if ((_DWORD)v8) {
        NSLog( @"_attachiAPInterfaceUSBDevices: could not install kIOFirstMatchNotification notification, error: %08x",  v8);
      }
      sub_100014694(v8, self->_iAPInterfaceDeviceArrivedIterator);
      uint64_t v9 = IOServiceAddMatchingNotification( self->_iapInterfaceNotifyPort,  "IOServiceTerminate",  v7,  (IOServiceMatchingCallback)sub_100014C04,  0LL,  &self->_iAPInterfaceDeviceRemovedIterator);
      if ((_DWORD)v9) {
        NSLog( @"_attachiAPInterfaceUSBDevices: could not install kIOTerminatedNotification notification, error: %08x",  v9);
      }
      sub_100014C04(v9, self->_iAPInterfaceDeviceRemovedIterator);
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(self->_iapInterfaceNotifyPort);
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    }

    else
    {
      NSLog(@"_attachiAPInterfaceUSBDevices: IOServiceMatching() failed");
    }
  }

  else
  {
    NSLog(@"_attachiAPInterfaceUSBDevices: IONotificationPortCreate() failed");
  }

- (void)startAccPowerTimer:(unsigned int)a3
{
  if (!self->_isShuttingDown)
  {
    int64_t initAccPowerTimerOnce = self->_initAccPowerTimerOnce;
    p_int64_t initAccPowerTimerOnce = &self->_initAccPowerTimerOnce;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014D24;
    block[3] = &unk_100029690;
    block[4] = self;
    if (initAccPowerTimerOnce != -1) {
      dispatch_once(p_initAccPowerTimerOnce, block);
    }
    accPowerTimer = self->_accPowerTimer;
    dispatch_time_t v8 = dispatch_time(0LL, 1000000LL * a3);
    dispatch_source_set_timer((dispatch_source_t)accPowerTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

- (void)startAccPowerTimer:(unsigned int)a3 ForPortService:(unsigned int)a4
{
  if (!self->_isShuttingDown)
  {
    int64_t initAccPowerForPortServiceTimerOnce = self->_initAccPowerForPortServiceTimerOnce;
    p_int64_t initAccPowerForPortServiceTimerOnce = &self->_initAccPowerForPortServiceTimerOnce;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100014F7C;
    v10[3] = &unk_1000296B8;
    v10[4] = self;
    unsigned int v11 = a4;
    if (initAccPowerForPortServiceTimerOnce != -1) {
      dispatch_once(p_initAccPowerForPortServiceTimerOnce, v10);
    }
    accPowerForPortServiceTimer = self->_accPowerForPortServiceTimer;
    dispatch_time_t v9 = dispatch_time(0LL, 1000000LL * a3);
    dispatch_source_set_timer((dispatch_source_t)accPowerForPortServiceTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

- (void)startIOAccMgrPortDetectTimer:(unsigned int)a3
{
  if (!self->_isShuttingDown)
  {
    int64_t initIOAccMgrPortDetectTimerOnce = self->_initIOAccMgrPortDetectTimerOnce;
    p_int64_t initIOAccMgrPortDetectTimerOnce = &self->_initIOAccMgrPortDetectTimerOnce;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000151AC;
    v6[3] = &unk_1000296B8;
    v6[4] = self;
    unsigned int v7 = a3;
    if (initIOAccMgrPortDetectTimerOnce != -1) {
      dispatch_once(p_initIOAccMgrPortDetectTimerOnce, v6);
    }
  }

- (void)iapDisconnect
{
  shutdownQ = (dispatch_queue_s *)self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015698;
  block[3] = &unk_100029690;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)iap2Disconnect
{
  shutdownQ = (dispatch_queue_s *)self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000157F4;
  block[3] = &unk_100029690;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)setUSBMode:(IapTransport *)a3 forMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = -[IAPTransportServer iapPortManagerForDevPort:](self, "iapPortManagerForDevPort:", a3);
  if (v5)
  {
    io_service_t v6 = [v5 service];
    io_connect_t connect = 0;
    uint64_t v7 = IOServiceOpen(v6, mach_task_self_, 0, &connect);
    if ((_DWORD)v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = connect == 0;
    }
    if (v8)
    {
      NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm",  "-[IAPTransportServer setUSBMode:forMode:]",  1998LL,  v7);
    }

    else
    {
      uint64_t v9 = IOAccessoryManagerConfigureUSBMode(connect, v4);
      if ((_DWORD)v9)
      {
        if ((_DWORD)v9 == -536870183) {
          NSLog( @"INFO - %s:%s - %d IOAccessoryManagerConfigureUSBMode not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm",  "-[IAPTransportServer setUSBMode:forMode:]",  2006LL,  3758097113LL);
        }
        else {
          NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerConfigureUSBMode failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm",  "-[IAPTransportServer setUSBMode:forMode:]",  2010LL,  v9);
        }
      }

      IOServiceClose(connect);
    }
  }

- (BOOL)isLowPowerModeSupported
{
  return MGGetBoolAnswer(@"Birtx7GxrxCCUzsE1JQO8Q");
}

- (void)setWiredPortPacketParsingState:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100015A64;
  v3[3] = &unk_100029728;
  BOOL v4 = a3;
  pthread_mutex_lock(&stru_10002DA68);
  sub_100015A64((uint64_t)v3);
  pthread_mutex_unlock(&stru_10002DA68);
}

- (void)deleteWiredPorts
{
  shutdownQ = (dispatch_queue_s *)self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015B40;
  block[3] = &unk_100029690;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)enterLowPowerMode
{
  if (byte_10002DD38 == 1) {
    -[IAPTransportServer cleanupStaleClientPorts:](self, "cleanupStaleClientPorts:", 3LL);
  }
  -[IAPTransportServer setWiredPortPacketParsingState:](self, "setWiredPortPacketParsingState:", 0LL);
  -[IAPTransportServer cleanupPhysicalConnectorConnections](self, "cleanupPhysicalConnectorConnections");
  sub_100014E38(1LL, 0);
}

- (void)exitLowPowerMode
{
}

- (BOOL)isDeviceInLowPowerMode
{
  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    SCPreferencesSynchronize(radiosPreferences);
    radiosPreferences = (const __SCPreferences *)SCPreferencesGetValue(self->_radiosPreferences, @"LowPowerMode");
    if (radiosPreferences)
    {
      BOOL v4 = radiosPreferences;
      CFTypeID v5 = CFGetTypeID(radiosPreferences);
      LOBYTE(radiosPreferences) = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) == 1;
    }
  }

  return (char)radiosPreferences;
}

- (void)handleLowPowerModeStateChange:(BOOL)a3
{
  if (a3) {
    -[IAPTransportServer enterLowPowerMode](self, "enterLowPowerMode");
  }
  else {
    -[IAPTransportServer exitLowPowerMode](self, "exitLowPowerMode");
  }
}

- (void)radioPreferencesChanged:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    BOOL v4 = -[IAPTransportServer isDeviceInLowPowerMode](self, "isDeviceInLowPowerMode");
    if (self->_lowPowerModeEnabled != v4)
    {
      self->_lowPowerModeEnabled = v4;
      -[IAPTransportServer handleLowPowerModeStateChange:](self, "handleLowPowerModeStateChange:", v4);
    }
  }

- (void)attachPowerModeNotifications
{
  v3 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.iaptransportd", @"com.apple.radios.plist");
  self->_radiosPreferences = v3;
  if (v3)
  {
    int v4 = SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100015EDC, 0LL);
    radiosPreferences = self->_radiosPreferences;
    if (v4)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      SCPreferencesSetDispatchQueue(radiosPreferences, global_queue);
    }

    else
    {
      CFRelease(self->_radiosPreferences);
      self->_radiosPreferences = 0LL;
    }
  }

- (void)detachPowerModeNotifications
{
  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    SCPreferencesSetDispatchQueue(radiosPreferences, 0LL);
    CFRelease(self->_radiosPreferences);
    self->_radiosPreferences = 0LL;
  }

- (IAPTransportServer)init
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___IAPTransportServer;
  v2 = -[IAPTransportServer init](&v34, "init");
  if (!v2) {
    return (IAPTransportServer *)v2;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100016594,  @"com.apple.iapd.LoggingPreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_10001A46C();
  v2[209] = 0;
  *((void *)v2 + 25) = 0LL;
  if ([v2 isLowPowerModeSupported])
  {
    [v2 attachPowerModeNotifications];
    v2[208] = [v2 isDeviceInLowPowerMode];
  }

  byte_10002DD38 = MGGetBoolAnswer(@"StarkCapability");
  *((_WORD *)v2 + 14) = 0;
  *((void *)v2 + 3sub_100014E38(3LL, 0) = 0LL;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  int v4 = objc_alloc_init(&OBJC_CLASS___IAPWorkspaceObserver);
  *((void *)v2 + 4) = v4;
  -[IAPWorkspaceObserver setDelegate:](v4, "setDelegate:", v2);
  [*((id *)v2 + 4) startObserving];
  *((void *)v2 + 31) = 0LL;
  v2[256] = 0;
  *((void *)v2 + 15) = dispatch_queue_create("IAPTransportServerListenerQueue", 0LL);
  *((void *)v2 + 16) = dispatch_queue_create("IAPTransportServerAccPowerTimerQueue", 0LL);
  *((void *)v2 + 29) = dispatch_queue_create("IAPTransportServerShutdownQueue", 0LL);
  *((void *)v2 + 33) = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3052000000LL;
  v33[3] = sub_10001547C;
  v33[4] = sub_10001548C;
  v33[5] = v2;
  *((void *)v2 + 27) = 0LL;
  if (+[IAPTransportServer supportsIAPD](&OBJC_CLASS___IAPTransportServer, "supportsIAPD"))
  {
    CFTypeID v5 = -[IAPXPCConnection initWithServiceName:queueName:]( objc_alloc(&OBJC_CLASS___IAPXPCConnection),  "initWithServiceName:queueName:",  @"com.apple.iapd.xpc",  @"com.apple.iapd.IAPXPCConnection");
    *((void *)v2 + 27) = v5;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000165B0;
    v32[3] = &unk_100029450;
    v32[4] = v33;
    -[IAPXPCConnection setDisconnectBlock:](v5, "setDisconnectBlock:", v32);
  }

  io_service_t v6 = -[IAPXPCConnection initWithServiceName:queueName:]( objc_alloc(&OBJC_CLASS___IAPXPCConnection),  "initWithServiceName:queueName:",  @"com.apple.iap2d.xpc",  @"com.apple.iap2d.IAPXPCConnection");
  *((void *)v2 + 28) = v6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000165C0;
  v31[3] = &unk_100029450;
  v31[4] = v33;
  -[IAPXPCConnection setDisconnectBlock:](v6, "setDisconnectBlock:", v31);
  dispatch_async(&_dispatch_main_q, &stru_100029888);
  IONotificationPortRef v7 = IONotificationPortCreate(kIOMasterPortDefault);
  *((_DWORD *)v2 + 46) = 0;
  *((void *)v2 + 6) = v7;
  v2[192] = 0;
  *(_DWORD *)(v2 + 187) = 0;
  v2[272] = -1;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue( @"E75ServiceMaxAttempts",  @"com.apple.iaptransportd",  0LL);
  int v9 = AppIntegerValue;
  if (AppIntegerValue) {
    syslog(6, "IAPTransportServer: init: E75ServiceMaxAttempts=%d\n", AppIntegerValue);
  }
  else {
    int v9 = 10;
  }
  int v28 = v9;
  int v29 = 0;
  while (1)
  {
    existing[0] = 0;
    v10 = IOServiceMatching("IOAccessoryManager");
    if (IOServiceGetMatchingServices(kIOMasterPortDefault, v10, existing))
    {
      syslog(4, "IAPTransportServer: init: Error: IOServiceGetMatchingServices failed\n");
    }

    else
    {
      syslog(4, "IAPTransportServer: init: ioPortIter:0x%x\n", existing[0]);
      while (1)
      {
        uint64_t v11 = IOIteratorNext(existing[0]);
        uint64_t v12 = v11;
        if (!(_DWORD)v11) {
          break;
        }
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort(v11);
        int TransportType = IOAccessoryPortGetTransportType(v12);
        int v15 = MGGetBoolAnswer(@"DeviceSupports9Pin");
        syslog( 4,  "IAPTransportServer: init: ioService:0x%x, portID:%d, priPortType:%d, supports9Pin:%d\n",  v12,  PrimaryPort,  TransportType,  v15);
        if (PrimaryPort == 1) {
          int v16 = v15;
        }
        else {
          int v16 = 0;
        }
        if (v16 == 1)
        {
          v2[189] = 1;
          xmmword_10002DDD8 = 0u;
          *(_OWORD *)&dword_10002DDE8 = 0u;
          xmmword_10002DDF8 = 0u;
          unk_10002DE08 = 0u;
          xmmword_10002DE18 = 0u;
          *(_OWORD *)&qword_10002DE28 = 0u;
          qword_10002DE38 = 0LL;
          DWORD2(xmmword_10002DDD8) = 1;
          HIDWORD(xmmword_10002DDD8) = TransportType;
          dword_10002DDE8 = v12;
          IOObjectRetain(v12);
          qword_10002DD20 = sub_100009680((uint64_t)v2, (uint64_t)&xmmword_10002DDD8);
          syslog(4, "IAPTransportServer: init: __pIapAppleIDBusRootE75:0x%x\n", qword_10002DD20);
          if (!qword_10002DD20)
          {
            uint64_t v22 = _os_assert_log(0LL);
            uint64_t v23 = _os_crash(v22);
            sub_10001C1E0(v23);
          }
        }

        else if (PrimaryPort == 256)
        {
          v2[190] = 1;
          xmmword_10002DE40 = 0u;
          *(_OWORD *)&dword_10002DE50 = 0u;
          xmmword_10002DE60 = 0u;
          unk_10002DE70 = 0u;
          xmmword_10002DE80 = 0u;
          unk_10002DE90 = 0u;
          qword_10002DEA0 = 0LL;
          DWORD2(xmmword_10002DE4sub_100014E38(3LL, 0) = 256;
          HIDWORD(xmmword_10002DE4sub_100014E38(3LL, 0) = TransportType;
          dword_10002DE50 = v12;
          IOObjectRetain(v12);
          qword_10002DD30 = sub_100009680((uint64_t)v2, (uint64_t)&xmmword_10002DE40);
          if (!qword_10002DD30)
          {
            uint64_t v24 = _os_assert_log(0LL);
            uint64_t v25 = _os_crash(v24);
            sub_10001C1E0(v25);
          }
        }

        IOObjectRelease(v12);
      }

      IOObjectRelease(existing[0]);
    }

    if (qword_10002DD20) {
      break;
    }
    syslog(4, "IAPTransportServer: init:%d: __pIapAppleIDBusRootE75 == NULL\n", 2373);
    usleep(0x186A0u);
    if (!qword_10002DD20 && v29++ < v28) {
      continue;
    }
    if (!qword_10002DD20) {
      syslog(4, "IAPTransportServer: init:%d: __pIapAppleIDBusRootE75 == NULL\n", 2380);
    }
    break;
  }

  v2[191] = 1;
  xmmword_10002DEA8 = 0u;
  unk_10002DEB8 = 0u;
  xmmword_10002DEC8 = 0u;
  unk_10002DED8 = 0u;
  xmmword_10002DEE8 = 0u;
  unk_10002DEF8 = 0u;
  qword_10002DF08 = 0LL;
  qword_10002DD28 = sub_100009680((uint64_t)v2, (uint64_t)&xmmword_10002DEA8);
  if (!qword_10002DD28)
  {
    uint64_t v26 = _os_assert_log(0LL);
    uint64_t v27 = _os_crash(v26);
    sub_10001C1E0(v27);
  }

  v2[188] = MGGetBoolAnswer(@"InternalBuild");
  v18 = (const void *)MGCopyAnswer(@"DeviceClass", 0LL);
  v19 = v18;
  if (v18)
  {
    if (CFEqual(v18, @"iPhone"))
    {
      int v20 = 1;
    }

    else if (CFEqual(v19, @"iPod"))
    {
      int v20 = 2;
    }

    else
    {
      if (!CFEqual(v19, @"iPad"))
      {
LABEL_38:
        CFRelease(v19);
        goto LABEL_39;
      }

      int v20 = 3;
    }

    *((_DWORD *)v2 + 46) = v20;
    goto LABEL_38;
  }

- (void)dealloc
{
  accPowerTimer = self->_accPowerTimer;
  if (accPowerTimer)
  {
    dispatch_source_cancel((dispatch_source_t)accPowerTimer);
    dispatch_release((dispatch_object_t)self->_accPowerTimer);
    self->_accPowerTimer = 0LL;
  }

  accPowerForPortServiceTimer = self->_accPowerForPortServiceTimer;
  if (accPowerForPortServiceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)accPowerForPortServiceTimer);
    dispatch_release((dispatch_object_t)self->_accPowerForPortServiceTimer);
    self->_accPowerForPortServiceTimer = 0LL;
  }

  internalListenerQueue = (dispatch_queue_s *)self->_internalListenerQueue;
  if (internalListenerQueue)
  {
    dispatch_sync(internalListenerQueue, &stru_100029748);
    dispatch_release((dispatch_object_t)self->_internalListenerQueue);
    self->_internalListenerQueue = 0LL;
  }

  accPowerQueue = (dispatch_object_s *)self->_accPowerQueue;
  if (accPowerQueue) {
    dispatch_release(accPowerQueue);
  }
  self->_accPowerQueue = 0LL;
  shutdownQ = (dispatch_queue_s *)self->_shutdownQ;
  if (shutdownQ)
  {
    dispatch_sync(shutdownQ, &stru_100029768);
    dispatch_release((dispatch_object_t)self->_shutdownQ);
    self->_shutdownQ = 0LL;
  }

  self->_iapPortManagers = 0LL;
  ioAccMgrPortDetectTimer = self->_ioAccMgrPortDetectTimer;
  if (ioAccMgrPortDetectTimer)
  {
    dispatch_source_cancel((dispatch_source_t)ioAccMgrPortDetectTimer);
    dispatch_release((dispatch_object_t)self->_ioAccMgrPortDetectTimer);
    self->_ioAccMgrPortDetectTimer = 0LL;
  }

  io_object_t ioaccessoryPortAddedIterator = self->_ioaccessoryPortAddedIterator;
  if (ioaccessoryPortAddedIterator) {
    IOObjectRelease(ioaccessoryPortAddedIterator);
  }
  io_object_t iAPInterfaceDeviceArrivedIterator = self->_iAPInterfaceDeviceArrivedIterator;
  if (iAPInterfaceDeviceArrivedIterator) {
    IOObjectRelease(iAPInterfaceDeviceArrivedIterator);
  }
  io_object_t iAPInterfaceDeviceRemovedIterator = self->_iAPInterfaceDeviceRemovedIterator;
  if (iAPInterfaceDeviceRemovedIterator) {
    IOObjectRelease(iAPInterfaceDeviceRemovedIterator);
  }
  io_object_t ioAccNotification = self->_ioAccNotification;
  if (ioAccNotification)
  {
    IOObjectRelease(ioAccNotification);
    self->_io_object_t ioAccNotification = 0;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IAPTransportServer;
  -[IAPTransportServer dealloc](&v13, "dealloc");
}

- (void)run
{
  if ((byte_10002DD39 & 1) == 0)
  {
    self->_batteryNotifyPortRef = IONotificationPortCreate(kIOMasterPortDefault);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_batteryNotifyPortRef);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    batteryNotifyPortRef = self->_batteryNotifyPortRef;
    io_service_t v6 = IOServiceMatching("IOPMPowerSource");
    IOServiceAddMatchingNotification( batteryNotifyPortRef,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)sub_100016B38,  &self->_batteryNotifyPortRef,  &self->_battery_iter);
    sub_100016B38(&self->_batteryNotifyPortRef, self->_battery_iter);
    byte_10002DD39 = 1;
  }

  mach_service = xpc_connection_create_mach_service( "com.apple.iaptransportd.xpc",  (dispatch_queue_t)self->_internalListenerQueue,  1uLL);
  self->_listener = mach_service;
  if (mach_service)
  {
    unint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000LL;
    uint64_t v24 = sub_10001547C;
    uint64_t v25 = sub_10001548C;
    internalListenerQueue = self->_internalListenerQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100016BD4;
    handler[3] = &unk_100029790;
    handler[4] = &v21;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->_listener);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    NSLog(@"IAPTransportServer::init _listener is not valid!\n");
  }

  uint64_t v8 = dword_10002DAB4;
  if (dword_10002DAB4 == -1)
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"AccPowerOnDelayOnStart",  @"com.apple.iaptransportd",  0LL);
    dword_10002DAB4 = AppIntegerValue;
    NSLog(@"Loaded AccPowerOnDelayOnStart=%d\n", AppIntegerValue);
    uint64_t v8 = dword_10002DAB4;
  }

  if ((int)v8 < 1)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    NSLog(@"Override delay acc power on boot: %d -> %d\n", 0LL, v8);
    uint64_t v10 = dword_10002DAB4;
  }

  *(void *)uint64_t v27 = 0x1500000001LL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v19 = 16LL;
  if (sysctl(v27, 2u, &v21, &v19, 0LL, 0LL) != -1)
  {
    v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v18.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v18, 0LL);
    if ((uint64_t)(v18.tv_sec - v21) >= 61)
    {
      NSLog(@"Not during boot, override delay acc power on boot: %d -> %d\n", v10, 1250LL);
      uint64_t v10 = 1250LL;
    }
  }

  if (qword_10002DD20)
  {
    sub_10000ED38((void *)qword_10002DD20);
    sub_10000F3FC(qword_10002DD20);
  }

  if (qword_10002DD30)
  {
    sub_10000ED38((void *)qword_10002DD30);
    sub_10000F3FC(qword_10002DD30);
  }

  -[IAPTransportServer startIOAccMgrPortDetectTimer:](self, "startIOAccMgrPortDetectTimer:", v10);
  self->_serverRunLoop = CFRunLoopGetCurrent();
  dword_10002DD3C = IORegisterForSystemPower( 0LL,  &self->_systemPowerNotifyPortRef,  (IOServiceInterestCallback)sub_100016CD4,  &self->_systemPowerIterator);
  if (dword_10002DD3C)
  {
    serverRunLoop = self->_serverRunLoop;
    uint64_t v12 = IONotificationPortGetRunLoopSource(self->_systemPowerNotifyPortRef);
    CFRunLoopAddSource(serverRunLoop, v12, kCFRunLoopCommonModes);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"kIAPTransportServerLaunchedNotification",  0LL,  0LL,  1u);
  CFRunLoopRef v14 = CFRunLoopGetMain();
  while ((*(_BYTE *)&self->serverFlags & 1) == 0)
  {
    int v15 = objc_autoreleasePoolPush();
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 1u) == kCFRunLoopRunFinished) {
      *(_DWORD *)&self->serverFlags |= 1u;
    }
    objc_autoreleasePoolPop(v15);
  }

  self->_isShuttingDown = 1;
  -[IAPTransportServer deleteAllPorts](self, "deleteAllPorts");
  shutdownQ = (dispatch_queue_s *)self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016D78;
  block[3] = &unk_100029690;
  block[4] = self;
  dispatch_sync(shutdownQ, block);

  qword_10002DD18 = 0LL;
}

- (void)_pollForDeathAfterPromptCompletes
{
  *(_DWORD *)&self->serverFlags |= 1u;
  CFRunLoopStop(self->_serverRunLoop);
}

- (void)stopServer:(int)a3
{
}

- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4
{
  __serverFlags serverFlags = self->serverFlags;
  self->__serverFlags serverFlags = (__serverFlags)(*(_DWORD *)&serverFlags | 2);
  if (a4)
  {
    self->__serverFlags serverFlags = (__serverFlags)(*(_DWORD *)&serverFlags | 3);
    CFRunLoopStop(self->_serverRunLoop);
  }

  else
  {
    -[IAPTransportServer performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_pollForDeathAfterPromptCompletes",  0LL,  0LL);
  }

- (id)iapPortManagerForDevPort:(IapTransport *)a3
{
  if (!a3) {
    return 0LL;
  }
  int v4 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", sub_100006CB8((uint64_t)a3));
  if (!v4) {
    return 0LL;
  }
  CFTypeID v5 = v4;
  id v6 = -[NSMutableDictionary objectForKey:](self->_iapPortManagers, "objectForKey:", v4);

  return v6;
}

- (void)updatePortManagers
{
  io_iterator_t existing = -1431655766;
  v3 = IOServiceMatching("IOAccessoryManager");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    NSLog( @"ERROR - %s:%s - %d IOServiceGetMatchingServices failed 0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm",  "-[IAPTransportServer updatePortManagers]",  2685LL,  MatchingServices);
    goto LABEL_34;
  }

  uint64_t v5 = IOIteratorNext(existing);
  if ((_DWORD)v5)
  {
    uint64_t v6 = v5;
    do
    {
      CFTypeRef cf2 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      IONotificationPortRef v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      if (qword_10002DD60)
      {
        if (CFEqual((CFTypeRef)qword_10002DD60, cf2))
        {
          CFRelease(cf2);
          goto LABEL_12;
        }

        CFRelease((CFTypeRef)qword_10002DD60);
        qword_10002DD60 = (uint64_t)cf2;
        NSLog(@"Interface device serial number: %@", cf2);
        CFTypeRef v8 = (CFTypeRef)qword_10002DD60;
      }

      else
      {
        NSLog(@"Interface device serial number: %@", cf2);
        CFTypeRef v8 = cf2;
        qword_10002DD60 = (uint64_t)cf2;
      }

      +[IAPEventLogger AddToStr:WithKey:AndValue:]( &OBJC_CLASS___IAPEventLogger,  "AddToStr:WithKey:AndValue:",  v7,  @"InterfaceDeviceSerialNumber",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
LABEL_12:
      if (qword_10002DD68)
      {
        if (CFEqual((CFTypeRef)qword_10002DD68, cf2))
        {
          CFRelease(cf2);
          goto LABEL_19;
        }

        CFRelease((CFTypeRef)qword_10002DD68);
        qword_10002DD68 = (uint64_t)cf2;
        NSLog(@"Interface module serial number: %@", cf2);
        CFTypeRef v9 = (CFTypeRef)qword_10002DD68;
      }

      else
      {
        NSLog(@"Interface module serial number: %@", cf2);
        CFTypeRef v9 = cf2;
        qword_10002DD68 = (uint64_t)cf2;
      }

      +[IAPEventLogger AddToStr:WithKey:AndValue:]( &OBJC_CLASS___IAPEventLogger,  "AddToStr:WithKey:AndValue:",  v7,  @"InterfaceModuleSerialNumber",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v9));
LABEL_19:
      if (!IOAccessoryManagerCopyDeviceInfo(v6, 3LL, &cf2))
      {
        if (!qword_10002DD70)
        {
          NSLog(@"Accessory serial number: %@", cf2);
          CFTypeRef v10 = cf2;
          qword_10002DD70 = (uint64_t)cf2;
LABEL_25:
          +[IAPEventLogger AddToStr:WithKey:AndValue:]( &OBJC_CLASS___IAPEventLogger,  "AddToStr:WithKey:AndValue:",  v7,  @"AccessorySerialNumber",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v10));
          goto LABEL_26;
        }

        if (!CFEqual((CFTypeRef)qword_10002DD70, cf2))
        {
          CFRelease((CFTypeRef)qword_10002DD70);
          qword_10002DD70 = (uint64_t)cf2;
          NSLog(@"Accessory serial number: %@", cf2);
          CFTypeRef v10 = (CFTypeRef)qword_10002DD70;
          goto LABEL_25;
        }

        CFRelease(cf2);
      }

- (void)detachIOKitPort:(IapTransport *)a3
{
  if (a3)
  {
    id v5 = -[NSMutableDictionary objectForKey:]( self->_iapPortManagers,  "objectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sub_100006CB8((uint64_t)a3)));
    sub_1000117B8((uint64_t)a3, 8LL, 0LL);
    sub_100013F34(a3);
    if (v5)
    {
      if (sub_100006CC4((int)objc_msgSend(objc_msgSend(v5, "portNumber"), "intValue"))) {
        -[NSMutableDictionary removeObjectForKey:]( self->_iapPortManagers,  "removeObjectForKey:",  [v5 portNumber]);
      }
    }
  }

- (void)checkXPCConnections
{
  if (!self->_iapd_connection && +[IAPTransportServer supportsIAPD](&OBJC_CLASS___IAPTransportServer, "supportsIAPD"))
  {
    v3 = -[IAPXPCConnection initWithServiceName:queueName:]( objc_alloc(&OBJC_CLASS___IAPXPCConnection),  "initWithServiceName:queueName:",  @"com.apple.iapd.xpc",  @"com.apple.iapd.IAPXPCConnection");
    self->_iapd_connection = v3;
    -[IAPXPCConnection setDisconnectBlock:](v3, "setDisconnectBlock:", &stru_1000297B0);
  }

  if (!self->_iap2d_connection)
  {
    int v4 = -[IAPXPCConnection initWithServiceName:queueName:]( objc_alloc(&OBJC_CLASS___IAPXPCConnection),  "initWithServiceName:queueName:",  @"com.apple.iap2d.xpc",  @"com.apple.iap2d.IAPXPCConnection");
    self->_iap2d_connection = v4;
    -[IAPXPCConnection setDisconnectBlock:](v4, "setDisconnectBlock:", &stru_1000297D0);
  }

- (void)sendValidAccResistorIDToIAPD
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v18 = 0LL;
  size_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -1;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  CFTypeRef v8 = sub_100017638;
  CFTypeRef v9 = &unk_1000297F8;
  CFTypeRef v10 = self;
  uint64_t v11 = &v14;
  uint64_t v12 = &v22;
  objc_super v13 = &v18;
  pthread_mutex_lock(&stru_10002DA68);
  sub_100017638((id *)&v6);
  pthread_mutex_unlock(&stru_10002DA68);
  if (*((_BYTE *)v23 + 24) && v19[3])
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    int v3 = sub_100006CAC(v19[3]);
    xpc_dictionary_set_uint64(v2, "portNumber", v3);
    int v4 = sub_100006CB8(v19[3]);
    xpc_dictionary_set_uint64(v2, "portManagerNumber", v4);
    unsigned int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v19[3] + 80LL))(v19[3]);
    xpc_dictionary_set_uint64(v2, "portType", v5);
    xpc_dictionary_set_uint64(v2, "portID", v19[3]);
    xpc_dictionary_set_uint64(v2, "resistorID", *((int *)v15 + 6));
    xpc_dictionary_set_string(v2, "requestType", "resistorArrived");
    if (+[IAPTransportServer supportsIAPD]( &OBJC_CLASS___IAPTransportServer,  "supportsIAPD",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13))
    {
      objc_msgSend( objc_msgSend( +[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"),  "iapd_connection"),  "sendMessage:",  v2);
    }

    xpc_release(v2);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)cleanupPhysicalConnectorConnections
{
}

- (void)cleanupStaleClientPorts:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000178C8;
  v3[3] = &unk_1000296B8;
  int v4 = a3;
  void v3[4] = self;
  pthread_mutex_lock(&stru_10002DA68);
  sub_1000178C8(v3);
  pthread_mutex_unlock(&stru_10002DA68);
}

- (void)preventIdleSleep:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_10002DAB8);
  if (v3)
  {
    if (!self->_hasSleepAssertion)
    {
      v5[0] = @"AssertType";
      v5[1] = @"AssertLevel";
      v6[0] = @"NoIdleSleepAssertion";
      v6[1] = &off_10002B708;
      v5[2] = @"AssertName";
      v5[3] = @"AllowsDeviceRestart";
      v6[2] = @"com.apple.iaptransportd.acc-connected";
      v6[3] = kCFBooleanTrue;
      if (!IOPMAssertionCreateWithProperties( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4LL),  &self->_sleepAssertionId))
      {
        self->_hasSleepAssertion = 1;
        sub_10001A420(1, @"IAPTRANSPORTD HAS TAKEN A POWER ASSERTION!!!!!!!");
      }
    }
  }

  else if (self->_hasSleepAssertion)
  {
    IOPMAssertionRelease(self->_sleepAssertionId);
    self->_hasSleepAssertion = 0;
    sub_10001A420(1, @"IAPTRANSPORTD HAS RELEASED A POWER ASSERTION!!!!!!!");
  }

  pthread_mutex_unlock(&stru_10002DAB8);
}

- (void)updateDeviceUUIDState
{
  if (!self->_iapdPortListContainsItems && !self->_iap2dPortListContainsItems)
  {
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v6, 0LL);
    uint64_t v4 = 0LL;
    __darwin_time_t deviceUUIDTimestampMs = 1000 * v6.tv_sec + v6.tv_usec / 1000;
    self->___darwin_time_t deviceUUIDTimestampMs = deviceUUIDTimestampMs;
    self->_previousPortListDidContainItems = 0;
    deviceUUIDStr = self->_deviceUUIDStr;
    goto LABEL_10;
  }

  if (!self->_deviceUUIDStr) {
    goto LABEL_8;
  }
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v6, 0LL);
  if (!self->_previousPortListDidContainItems
    && 1000 * v6.tv_sec - self->_deviceUUIDTimestampMs + v6.tv_usec / 1000 >= 0x493E1)
  {

    self->_deviceUUIDStr = 0LL;
LABEL_8:
    deviceUUIDStr = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
    self->_deviceUUIDStr = deviceUUIDStr;
    goto LABEL_9;
  }

  deviceUUIDStr = self->_deviceUUIDStr;
  if (!deviceUUIDStr) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v4 = 1LL;
  self->_previousPortListDidContainItems = 1;
  __darwin_time_t deviceUUIDTimestampMs = self->_deviceUUIDTimestampMs;
LABEL_10:
  sub_10001A420( 1,  @"updateDeviceUUIDState: _iapdPortListContainsItems: %d, _iap2dPortListContainsItems: %d, _deviceUUIDStr: %@, _device UUIDTimestampMs: %llu, _previousPortListDidContainItems: %d",  self->_iapdPortListContainsItems,  self->_iap2dPortListContainsItems,  deviceUUIDStr,  deviceUUIDTimestampMs,  v4);
}

- (void)updateSleepAssertionState
{
  if (*(_WORD *)&self->_iapdPortListContainsItems && byte_10002DD40) {
    -[IAPTransportServer preventIdleSleep:](self, "preventIdleSleep:", 1LL);
  }
  else {
    -[IAPTransportServer preventIdleSleep:](self, "preventIdleSleep:", 0LL);
  }
}

- (void)pIapPortAppleIDBusRootE75
{
  return (void *)qword_10002DD20;
}

- (void)pIapPortAppleIDBusRootCON
{
  return (void *)qword_10002DD30;
}

- (void)registerClientPortAccessory:(id)a3 connection:(id)a4
{
  if (byte_10002DD38 == 1)
  {
    if (a3)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100017D28;
      v7[3] = &unk_100029820;
      v7[4] = a3;
      v7[5] = self;
      pthread_mutex_lock(&stru_10002DA68);
      sub_100017D28(v7);
      pthread_mutex_unlock(&stru_10002DA68);
      -[IAPTransportServer createNewClientPort:connection:](self, "createNewClientPort:connection:", a3, a4);
    }

    else
    {
      NSLog(@"registerClientPortAccessory bad params", a2, 0LL, a4);
    }
  }

- (void)unregisterClientPortAccessory:(id)a3
{
  if (byte_10002DD38 == 1)
  {
    if (a3)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_100017E4C;
      v3[3] = &unk_100029820;
      void v3[4] = a3;
      void v3[5] = self;
      pthread_mutex_lock(&stru_10002DA68);
      sub_100017E4C(v3);
      pthread_mutex_unlock(&stru_10002DA68);
    }

    else
    {
      NSLog(@"unregisterClientPortAccessory bad params", a2);
    }
  }

- (void)deleteClientPortsUsingConnection:(id)a3
{
  if (byte_10002DD38 == 1)
  {
    if (a3)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = (id)3221225472LL;
      v3[2] = sub_100017F70;
      v3[3] = &unk_100029820;
      void v3[4] = a3;
      void v3[5] = self;
      pthread_mutex_lock(&stru_10002DA68);
      sub_100017F70(v3);
      pthread_mutex_unlock(&stru_10002DA68);
    }

    else
    {
      NSLog(@"deleteClientPortsUsingConnection bad params", a2);
    }
  }

- (void)clientPortReceivedData:(id)a3 dataPtr:(char *)a4 length:(unsigned __int16)a5
{
  if (byte_10002DD38 == 1)
  {
    if (a3 && a4 && a5)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100018094;
      v5[3] = &unk_100029848;
      void v5[4] = a3;
      v5[5] = a4;
      unsigned __int16 v6 = a5;
      pthread_mutex_lock(&stru_10002DA68);
      sub_100018094((uint64_t)v5);
      pthread_mutex_unlock(&stru_10002DA68);
    }

    else
    {
      NSLog(@"clientPortReceivedData bad params", a2);
    }
  }

- (BOOL)createNewClientPort:(id)a3 connection:(id)a4
{
  uint64_t v4 = sub_1000081E4((uint64_t)a3, (uint64_t)a4);
  uint64_t v5 = v4;
  if (v4) {
    sub_100013EC8(v4);
  }
  return v5 != 0;
}

- (void)setHasAdaptor:(BOOL)a3
{
  byte_10002DD08 = 1;
  sub_100007788(1);
  notify_set_state(dword_10002DD0C, byte_10002DD08);
  notify_post("com.apple.iapd.adaptor.AvailableChanged");
}

- (void)deleteAllPorts
{
  if (byte_10002DD38 == 1) {
    -[IAPTransportServer cleanupStaleClientPorts:](self, "cleanupStaleClientPorts:", 3LL);
  }
  sub_100018218();
  -[IAPTransportServer deleteWiredPorts](self, "deleteWiredPorts");
  if (qword_10002DD20)
  {
    sub_10000977C(qword_10002DD20);
    qword_10002DD20 = 0LL;
  }

  if (qword_10002DD30)
  {
    sub_10000977C(qword_10002DD30);
    qword_10002DD30 = 0LL;
  }

- (void)_detachClientPort:(IapTransport *)a3
{
  if (a3)
  {
    nullsub_15(a3, 8LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018308;
    block[3] = &unk_100028A70;
    block[4] = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)bringupPlatform
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_1000183B0,  @"AppleLanguagePreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  dword_10002DD0C = 0;
  if (!notify_register_check("com.apple.iapd.adaptor.AvailableChanged", &dword_10002DD0C))
  {
    uint64_t state64 = 0LL;
    notify_get_state(dword_10002DD0C, &state64);
    if (state64)
    {
      notify_set_state(dword_10002DD0C, 0LL);
      notify_post("com.apple.iapd.adaptor.AvailableChanged");
    }
  }

  notify_post("com.apple.iapd.adaptor.AvailableChanged");
}

- (void)bringdownPlatform
{
  if (self->_listener)
  {
    dispatch_sync((dispatch_queue_t)self->_internalListenerQueue, &stru_100029868);
    xpc_connection_cancel(self->_listener);
    xpc_release(self->_listener);
    self->_listener = 0LL;
  }

  if (+[IAPTransportServer supportsIAPD](&OBJC_CLASS___IAPTransportServer, "supportsIAPD"))
  {
    -[IAPXPCConnection setDisconnectBlock:](self->_iapd_connection, "setDisconnectBlock:", 0LL);

    self->_iapd_connection = 0LL;
  }

  -[IAPXPCConnection setDisconnectBlock:](self->_iap2d_connection, "setDisconnectBlock:", 0LL);

  self->_iap2d_connection = 0LL;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPTransportServerDiedNotification, 0LL, 0LL, 1u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"AppleLanguagePreferencesChangedNotification", 0LL);
  -[IAPWorkspaceObserver stopObserving](self->_workspaceObserver, "stopObserving");
  Main = CFRunLoopGetMain();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
  CFRunLoopRemoveSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_ioaccessoryNotifyPort);
  unsigned __int16 v6 = CFRunLoopGetMain();
  uint64_t v7 = IONotificationPortGetRunLoopSource(self->_iapInterfaceNotifyPort);
  CFRunLoopRemoveSource(v6, v7, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_iapInterfaceNotifyPort);
  if (byte_10002DD39 == 1)
  {
    CFTypeRef v8 = CFRunLoopGetMain();
    CFTypeRef v9 = IONotificationPortGetRunLoopSource(self->_batteryNotifyPortRef);
    CFRunLoopRemoveSource(v8, v9, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(self->_batteryNotifyPortRef);
  }

  if (self->_systemPowerIterator) {
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  }
  if (dword_10002DD3C)
  {
    serverRunLoop = self->_serverRunLoop;
    uint64_t v11 = IONotificationPortGetRunLoopSource(self->_systemPowerNotifyPortRef);
    CFRunLoopRemoveSource(serverRunLoop, v11, kCFRunLoopCommonModes);
    IONotificationPortDestroy(self->_systemPowerNotifyPortRef);
    IOServiceClose(dword_10002DD3C);
  }

  -[IAPTransportServer detachPowerModeNotifications](self, "detachPowerModeNotifications");
  sub_100014E38(1LL, 0);
  if (!notify_register_check("com.apple.iaptransportd.notify.availability", &dword_10002DAB0))
  {
    uint64_t state64 = 0LL;
    notify_get_state(dword_10002DAB0, &state64);
    if (state64 == 1)
    {
      notify_set_state(dword_10002DAB0, 0LL);
      notify_post("com.apple.iaptransportd.notify.availability");
    }
  }

- (void)_updatePlistWithApplicationUninstall:(id)a3
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"OptionalSDKProtocolsShownKey", @"com.apple.iapd");
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    unsigned __int16 v6 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v4);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      id obj = a3;
      char v7 = 0;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v8;
          id v9 = [*(id *)(*((void *)&v26 + 1) + 8 * v8) externalAccessoryProtocols];
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v23;
            do
            {
              for (i = 0LL; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
                int v15 = (uint64_t (*)(void *))sub_100004838( "SBSCopyDisplayIdentifiersForExternalAccessoryProtocol",  (const void *)2);
                uint64_t v16 = (void *)v15(v14);
                int v17 = v16;
                if (v16
                  && ![v16 count]
                  && objc_msgSend(v5, "containsObject:", objc_msgSend(v14, "lowercaseString"))
                  && -[NSMutableArray containsObject:]( v6,  "containsObject:",  [v14 lowercaseString]))
                {
                  -[NSMutableArray removeObject:](v6, "removeObject:", [v14 lowercaseString]);
                  NSLog(@"Removing protocol %@ from protocols list", [v14 lowercaseString]);
                  char v7 = 1;
                }
              }

              id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }

            while (v11);
          }

          uint64_t v8 = v21 + 1;
        }

        while ((id)(v21 + 1) != v20);
        id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v20);
      if ((v7 & (v6 != 0LL)) == 1)
      {
        CFPreferencesSetAppValue(@"OptionalSDKProtocolsShownKey", v6, @"com.apple.iapd");
        CFPreferencesSynchronize(@"com.apple.iapd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      }
    }

    CFRelease(v5);
  }

- (void)applicationsWillUninstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)toggleAccessoryPowerForPortService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  NSLog( @"%s:%d Turning Acc Power off for portService: %u",  a2,  "-[IAPTransportServer toggleAccessoryPowerForPortService:]",  3354LL,  a3);
  sub_100013C84(v3, 1LL);
  -[IAPTransportServer startAccPowerTimer:ForPortService:](self, "startAccPowerTimer:ForPortService:", 1250LL, v3);
}

- (IONotificationPort)ioaccessoryNotifyPort
{
  return self->_ioaccessoryNotifyPort;
}

- (NSMutableDictionary)iapPortManagers
{
  return self->_iapPortManagers;
}

- (IAPXPCConnection)iapd_connection
{
  return self->_iapd_connection;
}

- (void)setIapd_connection:(id)a3
{
  self->_iapd_connection = (IAPXPCConnection *)a3;
}

- (IAPXPCConnection)iap2d_connection
{
  return self->_iap2d_connection;
}

- (void)setIap2d_connection:(id)a3
{
  self->_iap2d_connection = (IAPXPCConnection *)a3;
}

- (BOOL)iapdPortListContainsItems
{
  return self->_iapdPortListContainsItems;
}

- (void)setIapdPortListContainsItems:(BOOL)a3
{
  self->_iapdPortListContainsItems = a3;
}

- (BOOL)iap2dPortListContainsItems
{
  return self->_iap2dPortListContainsItems;
}

- (void)setIap2dPortListContainsItems:(BOOL)a3
{
  self->_iap2dPortListContainsItems = a3;
}

- (int)iDeviceClass
{
  return self->_iDeviceClass;
}

- (BOOL)bOSInternalBuild
{
  return self->_bOSInternalBuild;
}

- (BOOL)bHasConnectionE75
{
  return self->_bHasConnectionE75;
}

- (BOOL)bHasConnectionCON
{
  return self->_bHasConnectionCON;
}

- (unsigned)ioAccPortID
{
  return self->_ioAccPortID;
}

- (void)setIoAccPortID:(unsigned __int8)a3
{
  self->_ioAccPortID = a3;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (NSString)deviceUUIDStr
{
  return self->_deviceUUIDStr;
}

- (OS_dispatch_queue)shutdownQ
{
  return self->_shutdownQ;
}

- (OS_dispatch_queue)iaptransportdhighPriorityRootQueue
{
  return self->_iaptransportdhighPriorityRootQueue;
}

- (unsigned)iap9PinUSBConnState
{
  return self->_iap9PinUSBConnState;
}

- (void)setIap9PinUSBConnState:(unsigned __int8)a3
{
  self->_iap9PinUSBConnState = a3;
}

- (unsigned)ioAccNotification
{
  return self->_ioAccNotification;
}

- (void)setIoAccNotification:(unsigned int)a3
{
  self->_io_object_t ioAccNotification = a3;
}

@end