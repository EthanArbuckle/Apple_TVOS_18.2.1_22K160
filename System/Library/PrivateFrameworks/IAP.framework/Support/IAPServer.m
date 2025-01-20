@interface IAPServer
+ (id)sharedIAPServer;
+ (void)sendAudioStateChangedNotification;
- (BOOL)isServerStopping;
- (BOOL)isShuttingDown;
- (IAPServer)init;
- (IAPXPCConnection)iaptransportd_connection;
- (NSMutableDictionary)iapPortManagers;
- (NSString)dpFirmwareVersion;
- (__CFString)deviceClass;
- (__CFString)deviceProductType;
- (id)iapPortManagerForDevPort:(void *)a3;
- (void)_pollForDeathAfterPromptCompletes;
- (void)addNewTransport:(void *)a3;
- (void)bringdownPlatform;
- (void)dealloc;
- (void)deleteAllPorts;
- (void)preventIdleSleep:(int)a3;
- (void)removeTransport:(void *)a3;
- (void)run;
- (void)setDpFirmwareVersion:(id)a3;
- (void)setIaptransportd_connection:(id)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)stopServer:(int)a3;
- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4;
- (void)updateTransportListStates;
@end

@implementation IAPServer

+ (id)sharedIAPServer
{
  id result = (id)qword_10011BAE0;
  if (!qword_10011BAE0)
  {
    pthread_mutex_lock(&stru_1001196E8);
    if (!qword_10011BAE0) {
      qword_10011BAE0 = objc_alloc_init(&OBJC_CLASS___IAPServer);
    }
    pthread_mutex_unlock(&stru_1001196E8);
    return (id)qword_10011BAE0;
  }

  return result;
}

+ (void)sendAudioStateChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, IAPAudioDeviceStateChangedNotification, 0LL, 0LL, 0);
}

- (IAPServer)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IAPServer;
  v3 = -[IAPServer init](&v23, "init");
  if (!v3) {
    return v3;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_10000BC84,  @"com.apple.iapd.LoggingPreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_1000CEB44();
  v3->_isShuttingDown = 0;
  if (!notify_register_check((const char *)&kIAPAvailableNotification, &dword_100119728))
  {
    uint64_t state64 = 0LL;
    notify_get_state(dword_100119728, &state64);
    if (state64 != 1)
    {
      notify_set_state(dword_100119728, 1uLL);
      notify_post((const char *)&kIAPAvailableNotification);
    }
  }

  int out_token = 0;
  id result = (IAPServer *)notify_register_check("com.apple.iapd.videoout.SettingsChanged", &out_token);
  if (!(_DWORD)result)
  {
    uint64_t state64 = 0LL;
    notify_get_state(out_token, &state64);
    if (state64)
    {
      notify_set_state(out_token, 0LL);
      notify_post("com.apple.iapd.videoout.SettingsChanged");
    }

    id result = (IAPServer *)notify_cancel(out_token);
  }

  if ((((_BYTE)v3 + 112) & 3) == 0)
  {
    v3->_disableSleepAssertions = -1;
    id result = -[IAPXPCConnection initWithServiceName:queueName:]( objc_alloc(&OBJC_CLASS___IAPXPCConnection),  "initWithServiceName:queueName:",  @"com.apple.iaptransportd.xpc",  @"com.apple.iaptransportd.IAPXPCConnection");
    if ((((int)v3 + 144) & 7LL) == 0)
    {
      v3->_iaptransportd_connection = (IAPXPCConnection *)result;
      -[IAPServer setDisconnectBlock:](result, "setDisconnectBlock:", &stru_100101C28);
      id result = (IAPServer *)dispatch_queue_create("IAPServerListenerQueue", 0LL);
      if (((unint64_t)&v3->_internalListenerQueue & 7) == 0)
      {
        v3->_internalListenerQueue = (OS_dispatch_queue *)result;
        v6 = CFNotificationCenterGetDarwinNotifyCenter();
        pthread_mutex_lock(&stru_100119730);
        id result = (IAPServer *)sub_1000256D8();
        if (result)
        {
          if ((result & 7) == 0)
          {
            ((void (*)(IAPServer *, void))result->super.isa[11].isa)(result, 0LL);
            CFNotificationCenterAddObserver( v6,  0LL,  (CFNotificationCallback)sub_10000BCC0,  @"AppleLanguagePreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver( v6,  0LL,  (CFNotificationCallback)sub_10000BCE0,  @"IAPDTransportListChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver( v6,  0LL,  (CFNotificationCallback)sub_10000BCFC,  @"IAPDTransportListItemAddedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver( v6,  0LL,  (CFNotificationCallback)sub_10000BD38,  @"IAPDEmptyTransportListNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
            id result = (IAPServer *)sub_100015744();
            if ((result & 7) == 0)
            {
              p_accessoryEventHander = &v3->_accessoryEventHander;
              if (((unint64_t)&v3->_accessoryEventHander & 7) == 0)
              {
                void *p_accessoryEventHander = result;
                id result = (IAPServer *)operator new(8uLL);
                if ((result & 7) == 0)
                {
                  v8 = result;
                  id result = (IAPServer *)sub_100014DAC(result);
                  if (((unint64_t)&v3->_accessoryEQEventHandler & 7) == 0)
                  {
                    v3->_accessoryEQEventHandler = (IPodEventSender *)v8;
                    sub_100047224();
                    id result = (IAPServer *)IONotificationPortCreate(kIOMasterPortDefault);
                    p_ioaccessoryNotifyPort = &v3->_ioaccessoryNotifyPort;
                    if (((unint64_t)&v3->_ioaccessoryNotifyPort & 7) == 0)
                    {
                      v3->_ioaccessoryNotifyPort = (IONotificationPort *)result;
                      if ((((_BYTE)v3 + 64) & 3) == 0)
                      {
                        v3->_dpServiceArrivedIterator = 0;
                        if (((unint64_t)&v3->_dpServiceRemovedIterator & 3) == 0)
                        {
                          v3->_dpServiceRemovedIterator = 0;
                          LODWORD(state64) = -1431655766;
                          v10 = IOServiceMatching("IOAccessoryManager");
                          uint64_t MatchingServices = IOServiceGetMatchingServices( kIOMasterPortDefault,  v10,  (io_iterator_t *)&state64);
                          if ((_DWORD)MatchingServices)
                          {
                            NSLog( @"ERROR - %s:%s - %d IOServiceGetMatchingServices failed 0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPServer.mm",  "-[IAPServer init]",  2006LL,  MatchingServices);
                          }

                          else
                          {
                            id result = (IAPServer *)IOIteratorNext(state64);
                            if ((_DWORD)result)
                            {
                              p_iapPortManagers = (id *)&v3->_iapPortManagers;
                              v13 = result;
                              do
                              {
                                if (!*p_iapPortManagers) {
                                  id *p_iapPortManagers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                                }
                                v14 = -[IAPPortManager initWithService:andNotificationPort:]( objc_alloc(&OBJC_CLASS___IAPPortManager),  "initWithService:andNotificationPort:",  v13,  *p_ioaccessoryNotifyPort);
                                objc_msgSend( *p_iapPortManagers,  "setObject:forKey:",  v14,  -[IAPPortManager portNumber](v14, "portNumber"));

                                IOObjectRelease((io_object_t)v13);
                                v13 = (IAPServer *)IOIteratorNext(state64);
                              }

                              while ((_DWORD)v13);
                            }

                            IOObjectRelease(state64);
                          }

                          Main = CFRunLoopGetMain();
                          RunLoopSource = IONotificationPortGetRunLoopSource(*p_ioaccessoryNotifyPort);
                          CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
                          id result = (IAPServer *)sub_1000BE638();
                          if (result)
                          {
                            if ((result & 7) == 0)
                            {
                              ((void (*)(IAPServer *, void))result->super.isa[2].isa)( result,  *p_accessoryEventHander);
                              id result = (IAPServer *)sub_1000C7D20();
                              if (result)
                              {
                                v17 = result;
                                if ((result & 7) == 0)
                                {
                                  id result = (IAPServer *)sub_1000503BC();
                                  if ((result & 7) == 0)
                                  {
                                    ((void (*)(IAPServer *, IAPServer *))v17->super.isa[2].isa)(v17, result);
                                    id result = (IAPServer *)sub_1000BD830();
                                    if (result)
                                    {
                                      if ((result & 7) == 0)
                                      {
                                        ((void (*)(IAPServer *, IPodEventSender *))result->super.isa[2].isa)( result,  v3->_accessoryEQEventHandler);
                                        id result = (IAPServer *)sub_100018664();
                                        if ((result & 7) == 0)
                                        {
                                          p_headsetEventHandler = &v3->_headsetEventHandler;
                                          if (((unint64_t)&v3->_headsetEventHandler & 7) == 0)
                                          {
                                            void *p_headsetEventHandler = result;
                                            id result = (IAPServer *)sub_1000C2140();
                                            if (result)
                                            {
                                              if ((result & 7) == 0
                                                && (*p_headsetEventHandler & 7LL) == 0)
                                              {
                                                ((void (*)(IAPServer *))result->super.isa[2].isa)(result);
                                                id result = (IAPServer *)sub_1000C06AC();
                                                if (result)
                                                {
                                                  v19 = result;
                                                  if ((result & 7) == 0)
                                                  {
                                                    id result = (IAPServer *)sub_100018224();
                                                    if ((result & 7) == 0)
                                                    {
                                                      ((void (*)(IAPServer *, IAPServer *))v19->super.isa[2].isa)( v19,  result);
                                                      id result = (IAPServer *)sub_1000C7788();
                                                      if (result)
                                                      {
                                                        v20 = result;
                                                        if ((result & 7) == 0)
                                                        {
                                                          id result = (IAPServer *)sub_10000B0DC();
                                                          if ((result & 7) == 0)
                                                          {
                                                            ((void (*)(IAPServer *, IAPServer *))v20->super.isa[2].isa)( v20,  result);
                                                            pthread_mutex_unlock(&stru_100119730);
                                                            return v3;
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (void)bringdownPlatform
{
  if (self->_listener)
  {
    p_internalListenerQueue = &self->_internalListenerQueue;
    v4 = (dispatch_queue_s *)*p_internalListenerQueue;
    if (!*p_internalListenerQueue)
    {
LABEL_57:
      __break(0x5510u);
      return;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C19C;
    block[3] = &unk_100101C70;
    block[4] = self;
    dispatch_sync(v4, block);
  }

  v5 = (dispatch_object_t *)&self->_internalListenerQueue;
  if (!*v5) {
    goto LABEL_57;
  }
  dispatch_release(*v5);
  p_iaptransportd_connection = &self->_iaptransportd_connection;
  if (*p_iaptransportd_connection)
  {
    -[IAPXPCConnection setDisconnectBlock:](*p_iaptransportd_connection, "setDisconnectBlock:", 0LL);

    *p_iaptransportd_connection = 0LL;
  }

  CFRunLoopRef Main = CFRunLoopGetMain();
  if ((((_BYTE)self + 56) & 7) != 0) {
    goto LABEL_56;
  }
  v8 = Main;
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
  CFRunLoopRemoveSource(v8, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_ioaccessoryNotifyPort);
  p_systemPowerIterator = &self->_systemPowerIterator;
  if (*p_systemPowerIterator) {
    IODeregisterForSystemPower(p_systemPowerIterator);
  }
  if (dword_10011BAE8)
  {
    p_systemPowerNotifyPortRef = &self->_systemPowerNotifyPortRef;
    serverRunLoop = self->_serverRunLoop;
    v13 = IONotificationPortGetRunLoopSource(*p_systemPowerNotifyPortRef);
    CFRunLoopRemoveSource(serverRunLoop, v13, kCFRunLoopCommonModes);
    IONotificationPortDestroy(*p_systemPowerNotifyPortRef);
    IOServiceClose(dword_10011BAE8);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPServerDiedNotification, 0LL, 0LL, 1u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"AppleLanguagePreferencesChangedNotification", 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"IAPDTransportListChangedNotification", 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"IAPDTransportListItemAddedNotification", 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0LL, @"IAPDEmptyTransportListNotification", 0LL);
  -[NSNotificationCenter removeObserver:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:",  self);
  uint64_t v15 = sub_1000BE638();
  if (!v15) {
    goto LABEL_56;
  }
  if ((v15 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, IPodEventSender *))(*(void *)v15 + 24LL))(v15, self->_accessoryEventHander);
  uint64_t v16 = sub_1000C7D20();
  if (!v16) {
    goto LABEL_56;
  }
  uint64_t v17 = v16;
  if ((v16 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v18 = sub_1000503BC();
  if ((v18 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 24LL))(v17, v18);
  uint64_t v19 = sub_1000BD830();
  if (!v19) {
    goto LABEL_56;
  }
  if ((v19 & 7) != 0) {
    goto LABEL_56;
  }
  p_accessoryEQEventHandler = &self->_accessoryEQEventHandler;
  (*(void (**)(uint64_t, IPodEventSender *))(*(void *)v19 + 24LL))(v19, *p_accessoryEQEventHandler);
  uint64_t v21 = sub_100018664();
  if ((v21 & 7) != 0) {
    goto LABEL_56;
  }
  p_headsetEventHandler = &self->_headsetEventHandler;
  void *p_headsetEventHandler = (IPodEventSender *)v21;
  uint64_t v23 = sub_1000C2140();
  if (!v23) {
    goto LABEL_56;
  }
  if ((v23 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t))(*(void *)v23 + 24LL))(v23);
  uint64_t v24 = sub_1000C06AC();
  if (!v24) {
    goto LABEL_56;
  }
  uint64_t v25 = v24;
  if ((v24 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v26 = sub_100018224();
  if ((v26 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v25 + 24LL))(v25, v26);
  uint64_t v27 = sub_1000C7788();
  if (!v27) {
    goto LABEL_56;
  }
  uint64_t v28 = v27;
  if ((v27 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v29 = sub_10000B0DC();
  if ((v29 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 24LL))(v28, v29);
  nullsub_9(-[IAPServer deleteAllPorts](self, "deleteAllPorts"));
  accessoryEventHander = self->_accessoryEventHander;
  if (accessoryEventHander)
  {
    (*((void (**)(IPodEventSender *))accessoryEventHander->var0 + 1))(accessoryEventHander);
  }

  v31 = *p_accessoryEQEventHandler;
  if (*p_accessoryEQEventHandler)
  {
    (*((void (**)(IPodEventSender *))v31->var0 + 1))(v31);
  }

  v32 = *p_headsetEventHandler;
  if (!*p_headsetEventHandler) {
    goto LABEL_48;
  }
  if ((v32 & 7) != 0)
  {
LABEL_56:
    __break(0x5516u);
    goto LABEL_57;
  }

  (*((void (**)(IPodEventSender *))v32->var0 + 1))(v32);
LABEL_48:
  if (!notify_register_check((const char *)&kIAPAvailableNotification, &dword_100119728))
  {
    uint64_t v34 = 0LL;
    notify_get_state(dword_100119728, &v34);
    if (v34 == 1)
    {
      notify_set_state(dword_100119728, 0LL);
      notify_post((const char *)&kIAPAvailableNotification);
    }

    notify_cancel(dword_100119728);
  }

  p_sleepAssertionTimer = &self->_sleepAssertionTimer;
  if (*p_sleepAssertionTimer)
  {
    CFRunLoopTimerInvalidate(*p_sleepAssertionTimer);
    CFRelease(*p_sleepAssertionTimer);
  }

- (void)dealloc
{
  if ((((_BYTE)self + 120) & 7) != 0) {
    goto LABEL_9;
  }

  self->_iapPortManagers = 0LL;
  p_deviceClass = &self->_deviceClass;
  if (*p_deviceClass) {
    CFRelease(*p_deviceClass);
  }
  p_deviceProductType = &self->_deviceProductType;
  if (((unint64_t)&self->_deviceProductType & 7) != 0)
  {
LABEL_9:
    __break(0x5516u);
  }

  else
  {
    if (*p_deviceProductType) {
      CFRelease(*p_deviceProductType);
    }
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___IAPServer;
    -[IAPServer dealloc](&v5, "dealloc");
  }

- (void)run
{
  Current = CFRunLoopGetCurrent();
  self->_serverRunLoop = Current;
  -[IAPStackshot start](+[IAPStackshot sharedInstance](&OBJC_CLASS___IAPStackshot, "sharedInstance"), "start");
  p_systemPowerNotifyPortRef = &self->_systemPowerNotifyPortRef;
  dword_10011BAE8 = IORegisterForSystemPower( 0LL,  &self->_systemPowerNotifyPortRef,  (IOServiceInterestCallback)sub_10000C4C0,  &self->_systemPowerIterator);
  if (dword_10011BAE8)
  {
    serverRunLoop = self->_serverRunLoop;
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_systemPowerNotifyPortRef);
    CFRunLoopAddSource(serverRunLoop, RunLoopSource, kCFRunLoopCommonModes);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPServerLaunchedNotification, 0LL, 0LL, 1u);
  sub_100047284();
  p_internalListenerQueue = &self->_internalListenerQueue;
  v9 = (dispatch_queue_s *)*p_internalListenerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C5A8;
  block[3] = &unk_100101C70;
  block[4] = self;
  dispatch_async(v9, block);
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v10) {
    goto LABEL_16;
  }
  v11 = v10;
  xpc_dictionary_set_string(v10, "requestType", "ping");
  if ((((int)self + 144) & 7LL) != 0
    || (-[IAPXPCConnection sendMessage:](self->_iaptransportd_connection, "sendMessage:", v11),
        xpc_release(v11),
        p_serverFlags = &self->serverFlags,
        ((unint64_t)&self->serverFlags & 3) != 0))
  {
LABEL_15:
    __break(0x5516u);
LABEL_16:
    __break(0x5510u);
    return;
  }

  while ((*(_BYTE *)p_serverFlags & 1) == 0)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 1u) == kCFRunLoopRunFinished) {
      *(_DWORD *)p_serverFlags |= 1u;
    }
  }

  self->_isShuttingDown = 1;
  -[IAPServer bringdownPlatform](self, "bringdownPlatform");

  qword_10011BAE0 = 0LL;
}

- (void)_pollForDeathAfterPromptCompletes
{
  if ((((_BYTE)self + 16) & 3) != 0
    || (*(_DWORD *)&self->serverFlags |= 1u, ((unint64_t)&self->_serverRunLoop & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    CFRunLoopStop(self->_serverRunLoop);
  }

- (void)stopServer:(int)a3
{
}

- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4
{
  if (((unint64_t)&self->serverFlags & 3) == 0)
  {
    BOOL v4 = a4;
    *(_DWORD *)&self->serverFlags |= 2u;
    if (qword_10011BAF0)
    {

      qword_10011BAF0 = 0LL;
    }

    if (!v4)
    {
      -[IAPServer performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_pollForDeathAfterPromptCompletes",  0LL,  0LL);
      return;
    }

    *(_DWORD *)&self->serverFlags |= 1u;
    if (((unint64_t)&self->_serverRunLoop & 7) == 0)
    {
      CFRunLoopStop(self->_serverRunLoop);
      return;
    }
  }

  __break(0x5516u);
}

- (BOOL)isServerStopping
{
  else {
    LODWORD(self) = (*(_BYTE *)&self->serverFlags >> 1) & 1;
  }
  return (char)self;
}

- (__CFString)deviceClass
{
  p_length = (__CFString **)&self[2].length;
  if (((unint64_t)&self[2].length & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    self = *p_length;
    if (!*p_length)
    {
      self = (__CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
      *p_length = self;
    }

    if (!self) {
      return &stru_10010A828;
    }
  }

  return self;
}

- (__CFString)deviceProductType
{
  v2 = (__CFString **)&self[3];
  if (((unint64_t)&self[3] & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    self = *v2;
    if (!*v2)
    {
      self = (__CFString *)MGCopyAnswer(@"ProductType", 0LL);
      *v2 = self;
    }

    if (!self) {
      return &stru_10010A828;
    }
  }

  return self;
}

- (void)preventIdleSleep:(int)a3
{
  p_disableSleepAssertions = &self->_disableSleepAssertions;
  int v6 = *p_disableSleepAssertions;
  if (*p_disableSleepAssertions == -1)
  {
    int v6 = CFPreferencesGetAppBooleanValue(@"SuppressSleepAssertions", @"com.apple.iapd", 0LL) != 0;
    int *p_disableSleepAssertions = v6;
  }

  if (v6 != 1)
  {
    pthread_mutex_lock(&stru_100119730);
    p_sleepAssertionTimer = &self->_sleepAssertionTimer;
    if (*p_sleepAssertionTimer)
    {
      CFRunLoopTimerInvalidate(*p_sleepAssertionTimer);
      CFRelease(*p_sleepAssertionTimer);
      *p_sleepAssertionTimer = 0LL;
    }

    unsigned int hasSleepAssertion = self->_hasSleepAssertion;
    if (a3 < 1)
    {
      if (hasSleepAssertion > 1) {
        goto LABEL_25;
      }
      if (!self->_hasSleepAssertion) {
        goto LABEL_18;
      }
      IOPMAssertionRelease(self->_sleepAssertionId);
      BOOL v9 = 0;
    }

    else
    {
      if (hasSleepAssertion >= 2) {
        goto LABEL_25;
      }
      if (self->_hasSleepAssertion) {
        goto LABEL_18;
      }
      v12[0] = @"AssertType";
      v12[1] = @"AssertLevel";
      v13[0] = @"NoIdleSleepAssertion";
      v13[1] = &off_100111D88;
      v12[2] = @"AssertName";
      v12[3] = @"AllowsDeviceRestart";
      v13[2] = @"com.apple.iapd.acc-connected";
      v13[3] = kCFBooleanTrue;
      if (IOPMAssertionCreateWithProperties( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  4LL),  &self->_sleepAssertionId))
      {
        goto LABEL_18;
      }

      BOOL v9 = 1;
    }

    self->_unsigned int hasSleepAssertion = v9;
LABEL_18:
    if (!self->_hasSleepAssertion)
    {
LABEL_22:
      pthread_mutex_unlock(&stru_100119730);
      return;
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v11 = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + (double)a3,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_10000CBCC,  0LL);
    self->_sleepAssertionTimer = v11;
    if (((unint64_t)&self->_serverRunLoop & 7) == 0)
    {
      CFRunLoopAddTimer(self->_serverRunLoop, v11, kCFRunLoopCommonModes);
      goto LABEL_22;
    }

- (id)iapPortManagerForDevPort:(void *)a3
{
  if (!a3) {
    return 0LL;
  }
  id result = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", sub_100026784((uint64_t)a3));
  if (!result) {
    return 0LL;
  }
  if (((unint64_t)&self->_iapPortManagers & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v5 = result;
    id v6 = -[NSMutableDictionary objectForKey:](self->_iapPortManagers, "objectForKey:", result);

    return v6;
  }

  return result;
}

- (void)addNewTransport:(void *)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v5 = (*(uint64_t (**)(void *, SEL))(*(void *)a3 + 64LL))(a3, a2);
  uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(v5);
  p_iapPortManagers = (id *)&self->_iapPortManagers;
  uint64_t v8 = ServiceWithPrimaryPort;
  if (!*p_iapPortManagers) {
    id *p_iapPortManagers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v11 = -[NSNumber initWithLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLong:",  (*(int (**)(void *))(*(void *)a3 + 64LL))(a3));
  if (objc_msgSend(*p_iapPortManagers, "objectForKey:")) {
    goto LABEL_9;
  }
  BOOL v9 = objc_alloc(&OBJC_CLASS___IAPPortManager);
  if (((unint64_t)&self->_ioaccessoryNotifyPort & 7) != 0)
  {
LABEL_12:
    __break(0x5516u);
    return;
  }

  xpc_object_t v10 = -[IAPPortManager initWithService:andNotificationPort:]( v9,  "initWithService:andNotificationPort:",  v8,  self->_ioaccessoryNotifyPort);
  objc_msgSend(*p_iapPortManagers, "setObject:forKey:", v10, -[IAPPortManager portNumber](v10, "portNumber"));

LABEL_9:
  if ((_DWORD)v8) {
    IOObjectRelease(v8);
  }
}

- (void)removeTransport:(void *)a3
{
  p_iapPortManagers = (id *)&self->_iapPortManagers;
  if (!*p_iapPortManagers) {
    return;
  }
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSNumber);
  if (!a3 || (a3 & 7) != 0)
  {
LABEL_10:
    __break(0x5516u);
    return;
  }

  id v6 = -[NSNumber initWithLong:](v5, "initWithLong:", (*(int (**)(void *))(*(void *)a3 + 64LL))(a3));
  if (v6)
  {
    v7 = v6;
    [*p_iapPortManagers removeObjectForKey:v6];
  }

- (void)updateTransportListStates
{
  uint64_t v2 = sub_10000CEF8();
  pthread_mutex_lock(&stru_10011B978);
  uint64_t v3 = *(void *)(v2 + 16);
  pthread_mutex_unlock(&stru_10011B978);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_BOOL(v4, "transportListContainsItems", v3 != 0);
    xpc_dictionary_set_string(v5, "requestType", "iapdTransportListStates");
    objc_msgSend( objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer"), "iaptransportd_connection"),  "sendMessage:",  v5);
    xpc_release(v5);
  }

  else
  {
    __break(0x5510u);
  }

- (void)deleteAllPorts
{
  uint64_t v2 = sub_10000CEF8();
  pthread_mutex_lock(&stru_10011B978);
  uint64_t v8 = *(void *)(v2 + 8);
  if (v8 == v2)
  {
LABEL_10:
    pthread_mutex_unlock(&stru_10011B978);
  }

  else
  {
    while (1)
    {
      uint64_t v3 = *sub_10000D014(&v8);
      if (!v3 || (v3 & 7) != 0) {
        break;
      }
      *(_BYTE *)(v3 + 72) = 1;
      uint64_t v5 = sub_1000B6CE0();
      if (!v5) {
        break;
      }
      uint64_t v6 = v5;
      if ((v5 & 7) != 0) {
        break;
      }
      v7 = sub_10000D014(&v8);
      (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v6 + 48LL))(v6, 8LL, 0LL, *v7, 0LL);
      sub_10000D048(&v8);
      if (v8 == v2) {
        goto LABEL_10;
      }
    }

    __break(0x5516u);
  }

- (NSMutableDictionary)iapPortManagers
{
  return self->_iapPortManagers;
}

- (NSString)dpFirmwareVersion
{
  return self->_dpFirmwareVersion;
}

- (void)setDpFirmwareVersion:(id)a3
{
}

- (IAPXPCConnection)iaptransportd_connection
{
  return self->_iaptransportd_connection;
}

- (void)setIaptransportd_connection:(id)a3
{
}

- (BOOL)isShuttingDown
{
  unsigned int isShuttingDown = self->_isShuttingDown;
  if (isShuttingDown >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = isShuttingDown != 0;
  }
  return (char)self;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_unsigned int isShuttingDown = a3;
}

@end