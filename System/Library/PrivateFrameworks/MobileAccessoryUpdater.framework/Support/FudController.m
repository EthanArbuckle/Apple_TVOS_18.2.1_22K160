@interface FudController
- (BOOL)initializeFud;
- (BOOL)isWorkPending;
- (BOOL)processEvent:(id)a3;
- (BOOL)setupXPCStreamsWithPolicies:(id)a3 shouldRegister:(BOOL)a4;
- (BOOL)startDefaultClients;
- (FudController)initWithIdleTimeout:(int64_t)a3;
- (id)loadPolicyForAllPlugins;
- (id)loadPolicyForAllServices;
- (void)beginIdleTimer;
- (void)cancelIdleTimer;
- (void)doDeviceIdleCheck;
- (void)doInstallerCheck;
- (void)doMayRebootCheck;
- (void)doPeriodicCheck;
- (void)doSimulateIdleCheck;
- (void)handleBrokenConnection:(id)a3;
- (void)handleEAOverHIDXPCStreamEvent:(id)a3 forFilterName:(id)a4;
- (void)handleIdleTimeout;
- (void)handleInternalAPIEvent:(id)a3;
- (void)handleInternalClientMessage:(id)a3;
- (void)handleXPCAPIEvent:(id)a3;
- (void)handleXPCStreamEvent:(id)a3;
- (void)idleExit;
- (void)initIdleTimer;
- (void)initSignals;
- (void)initUARP:(BOOL)a3;
- (void)notifyClientsOfInstallerUpdate:(BOOL)a3;
- (void)processAPIDict:(id)a3;
- (void)registerForEAMatchingNotifications;
- (void)registerForNotifydNotification:(id)a3 filterName:(id)a4;
- (void)setActivityForDeviceIdleLaunch:(BOOL)a3;
- (void)setActivityForMayRebootLaunch:(BOOL)a3;
- (void)setActivityForPeriodicLaunch:(BOOL)a3;
- (void)setActivityForUARPPeriodicLaunch:(BOOL)a3;
- (void)watchSharedGroup;
@end

@implementation FudController

- (FudController)initWithIdleTimeout:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FudController;
  id v4 = -[FudController init](&v13, "init");
  *((_BYTE *)v4 + 31) = 0;
  *((void *)v4 + 11) = 0LL;
  *((_DWORD *)v4 + 6) = 0;
  *((_WORD *)v4 + 14) = 0;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)v4 + 9) = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  *((void *)v4 + 2) = a3;
  if (![v4 initializeFud])
  {
    v10 = @"Failed to initialize fud, exiting";
LABEL_9:
    FudLog(3LL, v10);
    id v11 = v4;
    return 0LL;
  }

  v6 = -[FudIpcDispatch initWithStorage:]( objc_alloc(&OBJC_CLASS___FudIpcDispatch),  "initWithStorage:",  *((void *)v4 + 12));
  *((void *)v4 + 10) = v6;
  if (!v6)
  {
    v10 = @"Failed to create FudIpcDispatch instance from fud storage";
    goto LABEL_9;
  }

  mach_service = xpc_connection_create_mach_service( "com.apple.MobileAccessoryUpdater",  *((dispatch_queue_t *)v4 + 6),  1uLL);
  *((void *)v4 + 1) = mach_service;
  if (!mach_service)
  {
    v10 = @"Failed to create fud xpc listener";
    goto LABEL_9;
  }

  xpc_connection_set_context(mach_service, 0LL);
  v8 = (_xpc_connection_s *)*((void *)v4 + 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008C04;
  handler[3] = &unk_1000754D0;
  handler[4] = v4;
  xpc_connection_set_event_handler(v8, handler);
  dispatch_resume(*((dispatch_object_t *)v4 + 6));
  xpc_connection_resume(*((xpc_connection_t *)v4 + 1));
  FudLog(7LL, @"Created XPC Listener = %p");
  return (FudController *)v4;
}

- (void)initUARP:(BOOL)a3
{
  BOOL v3 = a3;
  if (dlopen("/System/Library/PrivateFrameworks/CoreUARP.framework/CoreUARP", 16))
  {
    self->_uarpQueue = (OS_dispatch_queue *)dispatch_queue_create("UARP Manager", 0LL);
    v5 = -[UARPManagerAUD initWithQueue:](objc_alloc(&OBJC_CLASS___UARPManagerAUD), "initWithQueue:", self->_uarpQueue);
    self->_uarpManager = v5;
    -[UARPManagerAUD start:](v5, "start:", v3);
    -[FudController setActivityForUARPPeriodicLaunch:](self, "setActivityForUARPPeriodicLaunch:", v3);
  }

- (void)initSignals
{
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1EuLL,  0LL,  &_dispatch_main_q);
  self->_usr1SignalSource = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008DCC;
  handler[3] = &unk_100074F50;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  dispatch_resume((dispatch_object_t)self->_usr1SignalSource);
}

- (void)setActivityForUARPPeriodicLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"uarpPeriodicFirmwareCheckInterval",  @"com.apple.mobileaccessoryupdater",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppIntegerValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    int64_t v7 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  else
  {
    int64_t v7 = AppIntegerValue;
    FudLog(7LL, @"Defaults read for UARP periodic firmware check interval found = %lld");
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008F60;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  if (v3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v8)
    {
      v9 = v8;
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, v7);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      FudLog(5LL, @"Registering First Launch XPC activity %s with criteria = %@");
      xpc_activity_register("com.apple.AccessoryUpdater.UARP.periodicFirmwareCheck", v9, handler);
      xpc_release(v9);
    }
  }

  else
  {
    FudLog(5LL, @"Registering XPC activity %s with XPC_ACTIVITY_CHECK_IN");
    xpc_activity_register("com.apple.AccessoryUpdater.UARP.periodicFirmwareCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }

- (void)handleInternalClientMessage:(id)a3
{
  if (a3)
  {
    id v5 = [a3 userInfo];
    if (v5)
    {
      if ([v5 objectForKey:@"InternalMessage"])
      {
        uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject();
        if (v6)
        {
          processingQueue = (dispatch_queue_s *)self->_processingQueue;
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472LL;
          v9[2] = sub_100009198;
          v9[3] = &unk_1000754A8;
          v9[4] = self;
          v9[5] = v6;
          dispatch_group_async((dispatch_group_t)qword_10008F5A0, processingQueue, v9);
          return;
        }

        xpc_object_t v8 = @"Failed to convert msg to xpc dict";
      }

      else
      {
        xpc_object_t v8 = @"Can't handle NULL internal message";
      }
    }

    else
    {
      xpc_object_t v8 = @"Can't handle internal message without user info";
    }
  }

  else
  {
    xpc_object_t v8 = @"Can't handle nil internal message";
  }

  FudLog(3LL, v8);
}

- (void)idleExit
{
  self->_isIdleExiting = 1;
  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
    self->_listener = 0LL;
  }

  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"MAUInternalMessageFudNotification",  0LL);
  fudIpcDispatch = self->_fudIpcDispatch;
  if (fudIpcDispatch)
  {
    self->_fudIpcDispatch = 0LL;
  }

  idleTimer = (dispatch_object_s *)self->_idleTimer;
  if (idleTimer) {
    dispatch_release(idleTimer);
  }
  timeoutQueue = (dispatch_object_s *)self->_timeoutQueue;
  if (timeoutQueue) {
    dispatch_release(timeoutQueue);
  }
  eaOverHID = self->_eaOverHID;
  if (eaOverHID)
  {

    self->_eaOverHID = 0LL;
  }

  eaOverHIDQueue = (dispatch_object_s *)self->_eaOverHIDQueue;
  if (eaOverHIDQueue) {
    dispatch_release(eaOverHIDQueue);
  }
  fudStorage = self->_fudStorage;
  if (fudStorage)
  {
    unsigned int v11 = -[FudStorage save](self->_fudStorage, "save");
    if (v11) {
      v12 = @"Successfully serialized to disk";
    }
    else {
      v12 = @"Failed to serialize to disk";
    }
    if (v11) {
      uint64_t v13 = 5LL;
    }
    else {
      uint64_t v13 = 3LL;
    }
    int v10 = v11 ^ 1;
    FudLog(v13, v12);
    self->_fudStorage = 0LL;
  }

  else
  {
    int v10 = 0;
  }

  -[NSMutableArray removeAllObjects](self->_defaultClients, "removeAllObjects");
  exit(v10);
}

- (BOOL)isWorkPending
{
  uint64_t v3 = dispatch_group_wait((dispatch_group_t)qword_10008F5A0, 0LL);
  if (v3)
  {
    FudLog(5LL, @"Some work landed in our groups queue during countdown, canceling timeout and watching group.");
    -[FudController cancelIdleTimer](self, "cancelIdleTimer");
    -[FudController watchSharedGroup](self, "watchSharedGroup");
  }

  return v3 != 0;
}

- (void)handleIdleTimeout
{
  fudStorage = self->_fudStorage;
  if (fudStorage && -[FudStorage isAnyStateMachineActive](fudStorage, "isAnyStateMachineActive"))
  {
    id v4 = @"Statemachine(s) still active during countdown, canceling timeout and watching group.";
LABEL_7:
    FudLog(5LL, v4);
    -[FudController cancelIdleTimer](self, "cancelIdleTimer");
    -[FudController watchSharedGroup](self, "watchSharedGroup");
    return;
  }

  if (-[FudController isWorkPending](self, "isWorkPending")) {
    return;
  }
  if (-[UARPManagerAUD isBusy](self->_uarpManager, "isBusy"))
  {
    id v4 = @"UARPManager still active during countdown, canceling timeout and watching group.";
    goto LABEL_7;
  }

  if (!-[FudController isWorkPending](self, "isWorkPending"))
  {
    FudLog(5LL, @"Nothing left to do, exiting.");
    -[FudController idleExit](self, "idleExit");
  }

- (void)beginIdleTimer
{
  timeoutQueue = (dispatch_queue_s *)self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009420;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (void)cancelIdleTimer
{
  timeoutQueue = (dispatch_queue_s *)self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009570;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (void)initIdleTimer
{
  qword_10008F5A0 = (uint64_t)dispatch_group_create();
  uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.MobileAccessoryUpdater.fud.timeoutQueue",  (dispatch_queue_attr_t)self->_attr);
  self->_timeoutQueue = v3;
  id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3);
  self->_idleTimer = v4;
  dispatch_source_set_timer((dispatch_source_t)v4, 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  idleTimer = self->_idleTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000096B8;
  handler[3] = &unk_100074F50;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)idleTimer, handler);
  dispatch_activate((dispatch_object_t)self->_idleTimer);
  timeoutQueue = (dispatch_queue_s *)self->_timeoutQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000096C0;
  v7[3] = &unk_100074F50;
  v7[4] = self;
  dispatch_async(timeoutQueue, v7);
}

- (void)watchSharedGroup
{
  timeoutQueue = (dispatch_queue_s *)self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009744;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (BOOL)processEvent:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    processingQueue = (dispatch_queue_s *)self->_processingQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000098B0;
    v8[3] = &unk_1000754A8;
    v8[4] = self;
    v8[5] = a3;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, processingQueue, v8);
  }

  return a3 != 0LL;
}

- (void)handleBrokenConnection:(id)a3
{
  if (a3)
  {
    context = xpc_connection_get_context((xpc_connection_t)a3);
    FudLog(7LL, @"Processing disconnection for connection: %X");
    FudLog(5LL, @"Client disconnected: %@");
    if (context)
    {
      id v5 = -[FudStorage getClientWithName:](self->_fudStorage, "getClientWithName:", context, context);
      if (v5)
      {
        [v5 setConnection:0];
        -[FudStorage unregisterClientFromAllPlugins:](self->_fudStorage, "unregisterClientFromAllPlugins:", context);
        return;
      }

      uint64_t v6 = @"Disconnected client currently isn't registered for any plugins, can't unregister them.";
    }

    else
    {
      uint64_t v6 = @"Got disconnection from unmanaged connection";
    }
  }

  else
  {
    uint64_t v6 = @"Can't handle NULL broken connection";
  }

  FudLog(3LL, v6);
}

- (void)handleEAOverHIDXPCStreamEvent:(id)a3 forFilterName:(id)a4
{
  eaOverHIDQueue = (dispatch_queue_s *)self->_eaOverHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009A04;
  block[3] = &unk_1000754F8;
  block[4] = a3;
  void block[5] = a4;
  block[6] = self;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, eaOverHIDQueue, block);
}

- (void)handleXPCStreamEvent:(id)a3
{
  if (self->_isIdleExiting)
  {
    FudLog(7LL, @"Idle Exiting, dropping event");
  }

  else
  {
    processingQueue = (dispatch_queue_s *)self->_processingQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100009BB8;
    v4[3] = &unk_1000754A8;
    v4[4] = a3;
    v4[5] = self;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, processingQueue, v4);
  }

- (void)handleInternalAPIEvent:(id)a3
{
  if (!a3)
  {
    unsigned int v11 = @"Can't handle NULL internal xpc api event";
    goto LABEL_11;
  }

  if (xpc_dictionary_get_int64(a3, "Command") == 116)
  {
    string = xpc_dictionary_get_string(a3, "FilterIdentifier");
    if (string)
    {
      uint64_t v6 = string;
      data = xpc_dictionary_get_data(a3, "Options", &length);
      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_string(v8, _xpc_event_key_name, v6);
        xpc_dictionary_set_data(v9, "Options", data, length);
        FudLog(7LL, @"Synthesizing stream event for: %s");
        -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v9, v6);
        xpc_release(v9);
        return;
      }

      int v10 = @"Can't create stream event dictionary";
      goto LABEL_7;
    }

    unsigned int v11 = @"Can't create event with filter identifier";
LABEL_11:
    FudLog(3LL, v11);
    return;
  }

  int v10 = @"Unknown internal API event received: %d";
LABEL_7:
  FudLog(3LL, v10);
}

- (void)processAPIDict:(id)a3
{
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000A1D8;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, processingQueue, v4);
}

- (void)handleXPCAPIEvent:(id)a3
{
  if (a3)
  {
    id v5 = xpc_copy_description(a3);
    FudLog(7LL, @"Debugging inbound connection number %llu: %s");
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_context((xpc_connection_t)a3, 0LL);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)self->_processingQueue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000A574;
      handler[3] = &unk_100075520;
      handler[4] = self;
      void handler[5] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_resume((xpc_connection_t)a3);
    }

    if (v5) {
      free(v5);
    }
  }

  else
  {
    FudLog(3LL, @"Can't handle NULL xpc connection");
  }

- (id)loadPolicyForAllServices
{
  v2 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL);
  if (!v2)
  {
    v16 = @"Failed to allocate policies";
LABEL_19:
    FudLog(3LL, v16);
    return 0LL;
  }

  uint64_t v3 = v2;
  id v4 = +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/",  1LL);
  if (!v4)
  {
    v16 = @"Failed to find XPC Services directory";
    goto LABEL_19;
  }

  id v5 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v4,  0LL,  1LL,  0LL);
  uint64_t v6 = (NSBundle *)-[NSDirectoryEnumerator nextObject](v5, "nextObject");
  if (v6)
  {
    int64_t v7 = v6;
    while (1)
    {
      xpc_object_t v8 = +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v7);
      v18 = v8;
      FudLog(7LL, @"Trying to load service: %@");
      if (!v8) {
        break;
      }
      v9 = -[NSBundle infoDictionary](v8, "infoDictionary", v8);
      if (!v9)
      {
        uint64_t v14 = 3LL;
        v15 = @"Failed to fetch service info dictionary";
        goto LABEL_15;
      }

      int v10 = v9;
      if ((objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( v9,  "objectForKeyedSubscript:",  @"UARP Updater"),  "BOOLValue") & 1) == 0)
      {
        unsigned int v11 = -[PluginPolicy initWithPolicyDictionary:pluginName:]( objc_alloc(&OBJC_CLASS___PluginPolicy),  "initWithPolicyDictionary:pluginName:",  v10,  -[NSBundle bundleIdentifier](v8, "bundleIdentifier"));
        if (v11)
        {
          v12 = v11;
          uint64_t v13 = v11;
          if (-[PluginPolicy isValid](v12, "isValid"))
          {
            -[NSMutableArray addObject:](v3, "addObject:", v12);
            v18 = -[NSBundle bundleIdentifier](v8, "bundleIdentifier");
            uint64_t v14 = 7LL;
            v15 = @"Successfully loaded service policy for: %@";
          }

          else
          {
            v18 = v7;
            uint64_t v14 = 3LL;
            v15 = @"Plugin policy is invalid, can't load it. service:%@";
          }
        }

        else
        {
          uint64_t v14 = 3LL;
          v15 = @"Failed to allocate service policy";
        }

        goto LABEL_15;
      }

- (id)loadPolicyForAllPlugins
{
  v2 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL);
  if (!v2)
  {
    v15 = @"Failed to allocate policies";
LABEL_18:
    FudLog(3LL, v15);
    return 0LL;
  }

  uint64_t v3 = v2;
  id v4 = +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/System/Library/AccessoryUpdaterBundles",  1LL);
  if (!v4)
  {
    v15 = @"Failed to create plugin directory URL";
    goto LABEL_18;
  }

  id v5 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v4,  0LL,  1LL,  0LL);
  uint64_t v6 = (NSBundle *)-[NSDirectoryEnumerator nextObject](v5, "nextObject");
  if (v6)
  {
    int64_t v7 = v6;
    do
    {
      xpc_object_t v8 = +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v7, v17);
      v17 = v8;
      FudLog(7LL, @"Trying to load plugin: %@");
      if (v8)
      {
        v9 = -[NSBundle infoDictionary](v8, "infoDictionary", v8);
        if (v9)
        {
          int v10 = -[PluginPolicy initWithPolicyDictionary:pluginName:]( objc_alloc(&OBJC_CLASS___PluginPolicy),  "initWithPolicyDictionary:pluginName:",  v9,  -[NSBundle bundleIdentifier](v8, "bundleIdentifier"));
          if (v10)
          {
            unsigned int v11 = v10;
            v12 = v10;
            if (-[PluginPolicy isValid](v11, "isValid"))
            {
              -[NSMutableArray addObject:](v3, "addObject:", v11);
              v17 = -[NSBundle bundleIdentifier](v8, "bundleIdentifier");
              uint64_t v13 = 7LL;
              uint64_t v14 = @"Successfully loaded plugin policy for: %@";
            }

            else
            {
              v17 = v7;
              uint64_t v13 = 3LL;
              uint64_t v14 = @"Plugin policy is invalid, can't load it. bundle:%@";
            }
          }

          else
          {
            uint64_t v13 = 3LL;
            uint64_t v14 = @"Failed to allocate plugin policy";
          }
        }

        else
        {
          uint64_t v13 = 3LL;
          uint64_t v14 = @"Failed to fetch plugin info dictionary";
        }
      }

      else
      {
        uint64_t v13 = 3LL;
        uint64_t v14 = @"Failed to load plugin bundle";
      }

      FudLog(v13, v14);
      int64_t v7 = (NSBundle *)-[NSDirectoryEnumerator nextObject](v5, "nextObject");
    }

    while (v7);
  }

  return v3;
}

- (void)registerForEAMatchingNotifications
{
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000ABD8;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.ExternalAccessory.matching", processingQueue, handler);
}

- (void)registerForNotifydNotification:(id)a3 filterName:(id)a4
{
  v9 = @"Notification";
  id v10 = a3;
  uint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  FudLog(7LL, @"Registering filter with XPC stream: %@");
  xpc_set_event("com.apple.notifyd.matching", objc_msgSend(a4, "cStringUsingEncoding:", 4, a4), v6);
  processingQueue = (dispatch_queue_s *)self->_processingQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000ACF4;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", processingQueue, handler);
  if (v6) {
    xpc_release(v6);
  }
}

- (BOOL)setupXPCStreamsWithPolicies:(id)a3 shouldRegister:(BOOL)a4
{
  BOOL v4 = a4;
  -[FudController registerForEAMatchingNotifications](self, "registerForEAMatchingNotifications");
  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:](&OBJC_CLASS___NSMutableDictionary, "dictionaryWithCapacity:", 5LL);
  if (v6)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v37;
      id v25 = a3;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(a3);
          }
          uint64_t v27 = v7;
          xpc_object_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          v29 = v8;
          id v9 = [v8 matchingFilters];
          id v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v33;
            do
            {
              uint64_t v13 = 0LL;
              id v30 = v11;
              do
              {
                if (*(void *)v33 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v13);
                uint64_t v15 = _CFXPCCreateXPCObjectFromCFObject([v14 filter]);
                if (v15)
                {
                  v16 = (void *)v15;
                  v17 = (const char *)objc_msgSend(objc_msgSend(v14, "filterType"), "cStringUsingEncoding:", 4);
                  if (v17)
                  {
                    v18 = v17;
                    if (v4)
                    {
                      id v21 = [v14 filterName];
                      FudLog(7LL, @"Registering filter with XPC stream: %@");
                      xpc_set_event( v18,  objc_msgSend(objc_msgSend(v14, "filterName", v21), "cStringUsingEncoding:", 4),  v16);
                    }

                    if (!-[NSMutableDictionary objectForKey:](v6, "objectForKey:", [v14 filterType]))
                    {
                      id v22 = [v29 pluginName];
                      id v23 = [v14 filterName];
                      id v11 = v30;
                      FudLog(7LL, @"Setting event handler for Plugin:%@ Filter:%@");
                      processingQueue = (dispatch_queue_s *)self->_processingQueue;
                      handler[0] = _NSConcreteStackBlock;
                      handler[1] = 3221225472LL;
                      handler[2] = sub_10000B054;
                      handler[3] = &unk_1000754D0;
                      handler[4] = self;
                      xpc_set_event_stream_handler(v18, processingQueue, handler);
                      -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v22, v23),  [v14 filterType]);
                    }
                  }

                  else
                  {
                    FudLog(3LL, @"Failed to get filter type cstring");
                  }

                  xpc_release(v16);
                }

                else
                {
                  FudLog(3LL, @"Failed to convert dictionary to xpc dictionary");
                }

                uint64_t v13 = (char *)v13 + 1;
              }

              while (v11 != v13);
              id v11 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v11);
          }

          uint64_t v7 = v27 + 1;
          a3 = v25;
        }

        while ((id)(v27 + 1) != v26);
        id v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v26);
    }
  }

  else
  {
    FudLog(3LL, @"Failed to allocate dictionary for event types");
  }

  return v6 != 0LL;
}

- (BOOL)startDefaultClients
{
  uint64_t v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  self->_defaultClients = v3;
  if (v3)
  {
    BOOL v4 = -[DefaultModalClient initWithGroup:]( objc_alloc(&OBJC_CLASS___DefaultModalClient),  "initWithGroup:",  @"Modal UI");
    if (v4)
    {
      id v5 = v4;
      -[DefaultModalClient setInstallerUpdateActive:](v4, "setInstallerUpdateActive:", self->_isInstallerUpdate);
      -[NSMutableArray addObject:](self->_defaultClients, "addObject:", v5);

      return 1;
    }

    uint64_t v7 = @"Failed to create default modal client";
  }

  else
  {
    uint64_t v7 = @"Failed to allocate room for default clients";
  }

  FudLog(3LL, v7);
  return 0;
}

- (void)notifyClientsOfInstallerUpdate:(BOOL)a3
{
  self->_isInstallerUpdate = a3;
  defaultClients = self->_defaultClients;
  if (defaultClients && (BOOL v5 = a3, -[NSMutableArray count](defaultClients, "count")))
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = self->_defaultClients;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (!v7) {
      goto LABEL_13;
    }
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___DefaultModalClient);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          [v12 setInstallerUpdateActive:v5];
          char v9 = 1;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
    if ((v9 & 1) == 0) {
LABEL_13:
    }
      FudLog(4LL, @"No valid client to notify installer update is active");
  }

  else
  {
    FudLog(4LL, @"No clients to notify installer update is active");
  }

- (BOOL)initializeFud
{
  BOOL v3 = +[FudUtilities isFirstLaunchSinceBoot](&OBJC_CLASS___FudUtilities, "isFirstLaunchSinceBoot");
  uint64_t v27 = 0LL;
  BOOL v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.processing.queue", (dispatch_queue_attr_t)self->_attr);
  self->_processingQueue = v4;
  if (!v4)
  {
    id v21 = @"Failed to create inbound processing queue";
LABEL_33:
    FudLog(3LL, v21);
    return 0;
  }

  dispatch_suspend((dispatch_object_t)v4);
  BOOL v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.eaOverHID.queue", (dispatch_queue_attr_t)self->_attr);
  self->_eaOverHIDQueue = v5;
  if (!v5)
  {
    id v21 = @"Failed to create inbound eaOverHID queue";
    goto LABEL_33;
  }

  uint64_t v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!v6)
  {
    id v21 = @"Failed to get file manager";
    goto LABEL_33;
  }

  id v7 = v6;
  if (!-[NSFileManager fileExistsAtPath:](v6, "fileExistsAtPath:", @"/var/db/accessoryupdater")
    && !-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v7,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/db/accessoryupdater",  1LL,  0LL,  &v27))
  {
    id v21 = @"Failed to create storage directory at path:%@ error:%@";
    goto LABEL_33;
  }

  id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/accessoryupdater",  @"remoteCheckLedger.plist");
  if (!v8)
  {
    id v21 = @"Failed to allocate fud state path";
    goto LABEL_33;
  }

  char v9 = +[FudStorage storageWithFile:](&OBJC_CLASS___FudStorage, "storageWithFile:", v8);
  self->_fudStorage = v9;
  if (!v9)
  {
    id v21 = @"Failed to get storage object";
    goto LABEL_33;
  }

  uint64_t v10 = v9;
  -[FudController initIdleTimer](self, "initIdleTimer");
  -[FudController initUARP:](self, "initUARP:", v3);
  -[FudController initSignals](self, "initSignals");
  if (v3) {
    id v11 = @"Initializing fud...";
  }
  else {
    id v11 = @"Resuming fud...";
  }
  FudLog(5LL, v11);
  id v12 = -[FudController loadPolicyForAllServices](self, "loadPolicyForAllServices");
  objc_msgSend(v12, "addObjectsFromArray:", -[FudController loadPolicyForAllPlugins](self, "loadPolicyForAllPlugins"));
  if (!v12)
  {
    id v21 = @"Failed to load policies from plugin bundles";
    goto LABEL_33;
  }

  -[FudStorage setPoliciesWithArray:](self->_fudStorage, "setPoliciesWithArray:", v12);
  if (!-[FudController setupXPCStreamsWithPolicies:shouldRegister:]( self,  "setupXPCStreamsWithPolicies:shouldRegister:",  v12,  v3))
  {
    id v21 = @"Failed to register for xpc event streams";
    goto LABEL_33;
  }

  if (v3)
  {
    uint64_t v13 = -[NSFileManager contentsOfDirectoryAtPath:error:]( v7,  "contentsOfDirectoryAtPath:error:",  @"/var/db/fud",  0LL);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        __int128 v17 = 0LL;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          -[NSFileManager removeItemAtPath:error:]( v7,  "removeItemAtPath:error:",  [@"/var/db/fud" stringByAppendingPathComponent:*(void *)(*((void *)&v23 + 1) + 8 * (void)v17)],  0);
          __int128 v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      }

      while (v15);
    }
  }

  -[FudController setActivityForPeriodicLaunch:](self, "setActivityForPeriodicLaunch:", v3);
  -[FudController setActivityForDeviceIdleLaunch:](self, "setActivityForDeviceIdleLaunch:", v3);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "handleInternalClientMessage:",  @"MAUInternalMessageFudNotification",  0LL);
  if (+[FudUtilities shouldDefaultModalClientBeEnabled]( &OBJC_CLASS___FudUtilities,  "shouldDefaultModalClientBeEnabled"))
  {
    v18 = (dispatch_group_s *)qword_10008F5A0;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B618;
    block[3] = &unk_100074F50;
    block[4] = self;
    dispatch_group_async(v18, global_queue, block);
  }

  return 1;
}

- (void)setActivityForMayRebootLaunch:(BOOL)a3
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000B790;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  if (a3)
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v3)
    {
      BOOL v4 = v3;
      xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_MAY_REBOOT_DEVICE, 1);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      FudLog(5LL, @"Registering First Launch XPC activity %s with criteria = %@");
      xpc_activity_register("com.apple.MobileAccessoryUpdater.mayRebootCheck", v4, handler);
      xpc_release(v4);
    }
  }

  else
  {
    FudLog(5LL, @"Registering XPC activity %s with XPC_ACTIVITY_CHECK_IN");
    xpc_activity_register("com.apple.MobileAccessoryUpdater.mayRebootCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }

- (void)setActivityForDeviceIdleLaunch:(BOOL)a3
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000BA78;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  if (a3)
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v3)
    {
      BOOL v4 = v3;
      xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      FudLog(5LL, @"Registering First Launch XPC activity %s with criteria = %@");
      xpc_activity_register("com.apple.MobileAccessoryUpdater.deviceIdleCheck", v4, handler);
      xpc_release(v4);
    }
  }

  else
  {
    FudLog(5LL, @"Registering XPC activity %s with XPC_ACTIVITY_CHECK_IN");
    xpc_activity_register("com.apple.MobileAccessoryUpdater.deviceIdleCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }

- (void)setActivityForPeriodicLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"periodicFirmwareCheckInterval",  @"com.apple.MobileAccessoryUpdater",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppIntegerValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    int64_t v7 = 3 * XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  else
  {
    int64_t v7 = AppIntegerValue;
    FudLog(7LL, @"Defaults read for periodic firmware check interval found = %lld");
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000BD9C;
  handler[3] = &unk_1000754D0;
  handler[4] = self;
  if (v3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v8)
    {
      char v9 = v8;
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, v7);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      FudLog(5LL, @"Registering First Launch XPC activity %s with criteria = %@");
      xpc_activity_register("com.apple.MobileAccessoryUpdater.periodicFirmwareCheck", v9, handler);
      xpc_release(v9);
    }
  }

  else
  {
    FudLog(5LL, @"Registering XPC activity %s with XPC_ACTIVITY_CHECK_IN");
    xpc_activity_register("com.apple.MobileAccessoryUpdater.periodicFirmwareCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }

- (void)doMayRebootCheck
{
  id v3 = -[NSMutableDictionary allValues](-[FudStorage pluginToPolicy](self->_fudStorage, "pluginToPolicy"), "allValues");
  if (!v3)
  {
    FudLog(7LL, @"policies = NULL");
    return;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v24 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        BOOL v5 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v6 = [v5 matchingFilters];
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v27;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
              if ([v11 needsMayRebootCheck])
              {
                id v19 = [v11 filterName];
                FudLog(7LL, @"Filter %@ needs MayReboot check");
                id v12 = objc_msgSend(objc_msgSend(v11, "filterType", v19), "cStringUsingEncoding:", 4);
                if (!v12)
                {
                  __int128 v17 = @"Failed to get filter type cstring";
LABEL_24:
                  FudLog(3LL, v17);
                  goto LABEL_20;
                }

                id v13 = v12;
                id v14 = (void *)xpc_copy_event( v12,  objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4));
                if (!v14)
                {
                  id v20 = [v11 filterName];
                  FudLog(7LL, @"Filter %@ is not registered with XPC, creating xpcFilter");
                  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v11, "filter", v20));
                  if (!v14)
                  {
                    __int128 v17 = @"Failed to convert dictionary to xpc dictionary";
                    goto LABEL_24;
                  }
                }

                id v15 = objc_msgSend( objc_msgSend(v11, "filterName"),  "rangeOfString:options:",  @"com.apple.MobileAccessoryUpdater.EA.",  1);
                uint64_t v16 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  xpc_set_event(v13, v16, 0LL);
                  xpc_set_event(v13, objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4), v14);
                }

                else
                {
                  xpc_dictionary_set_string(v14, _xpc_event_key_name, v16);
                  id v21 = [v11 filterName];
                  FudLog(7LL, @"Kicking off may reboot event for %@, xpcFilter=%@");
                  -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v14, v21, v14);
                }

                -[FudController watchSharedGroup](self, "watchSharedGroup");
                xpc_release(v14);
              }

- (void)doSimulateIdleCheck
{
  uint64_t state64 = 0LL;
  int out_token = 0;
  int check = 0;
  FudLog(7LL, @"%s");
  if (!notify_register_check( (const char *)objc_msgSend( @"com.apple.MobileAccessoryUpdater.auSimulateIdleLaunch",  "UTF8String",  "-[FudController doSimulateIdleCheck]"),  &out_token)
    && !notify_check(out_token, &check))
  {
    uint64_t v3 = check;
    if (check)
    {
      notify_get_state(out_token, &state64);
      uint64_t v3 = check;
      uint64_t v4 = state64;
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    uint64_t v5 = v3;
    uint64_t v6 = v4;
    FudLog(7LL, @"%s: shouldCheck = %d, useDropboxPath = %llu");
    self->_simulateIdleUseFilepath = state64 == 1;
    self->_isSimulatedDeviceIdleLaunch = 1;
    -[FudController doDeviceIdleCheck](self, "doDeviceIdleCheck", "-[FudController doSimulateIdleCheck]", v5, v6);
  }

- (void)doDeviceIdleCheck
{
  self->_isDeviceIdleLaunch = 1;
  id v3 = -[NSMutableDictionary allValues](-[FudStorage pluginToPolicy](self->_fudStorage, "pluginToPolicy"), "allValues");
  if (!v3)
  {
    FudLog(7LL, @"policies = NULL");
    return;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v24 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        uint64_t v5 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v6 = [v5 matchingFilters];
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v27;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
              if ([v11 needsDeviceIdleCheck])
              {
                id v19 = [v11 filterName];
                FudLog(7LL, @"Filter %@ needs device idle check");
                id v12 = objc_msgSend(objc_msgSend(v11, "filterType", v19), "cStringUsingEncoding:", 4);
                if (!v12)
                {
                  __int128 v17 = @"Failed to get filter type cstring";
LABEL_24:
                  FudLog(3LL, v17);
                  goto LABEL_20;
                }

                id v13 = v12;
                id v14 = (void *)xpc_copy_event( v12,  objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4));
                if (!v14)
                {
                  id v20 = [v11 filterName];
                  FudLog(7LL, @"Filter %@ is not registered with XPC, creating xpcFilter");
                  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v11, "filter", v20));
                  if (!v14)
                  {
                    __int128 v17 = @"Failed to convert dictionary to xpc dictionary";
                    goto LABEL_24;
                  }
                }

                id v15 = objc_msgSend( objc_msgSend(v11, "filterName"),  "rangeOfString:options:",  @"com.apple.MobileAccessoryUpdater.EA.",  1);
                uint64_t v16 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  xpc_set_event(v13, v16, 0LL);
                  xpc_set_event(v13, objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4), v14);
                }

                else
                {
                  xpc_dictionary_set_string(v14, _xpc_event_key_name, v16);
                  id v21 = [v11 filterName];
                  FudLog(7LL, @"Kicking off device idle firmware check event for %@, xpcFilter=%@");
                  -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v14, v21, v14);
                }

                -[FudController watchSharedGroup](self, "watchSharedGroup");
                xpc_release(v14);
              }

- (void)doInstallerCheck
{
  id v3 = -[NSMutableDictionary allValues](-[FudStorage pluginToPolicy](self->_fudStorage, "pluginToPolicy"), "allValues");
  if (!v3)
  {
    FudLog(7LL, @"policies = NULL");
    return;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v24 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        uint64_t v5 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v6 = [v5 matchingFilters];
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v27;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
              if ([v11 needsInstallerCheck])
              {
                id v19 = [v11 filterName];
                FudLog(7LL, @"Filter %@ needs installer check");
                id v12 = objc_msgSend(objc_msgSend(v11, "filterType", v19), "cStringUsingEncoding:", 4);
                if (!v12)
                {
                  __int128 v17 = @"Failed to get filter type cstring";
LABEL_24:
                  FudLog(3LL, v17);
                  goto LABEL_20;
                }

                id v13 = v12;
                id v14 = (void *)xpc_copy_event( v12,  objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4));
                if (!v14)
                {
                  id v20 = [v11 filterName];
                  FudLog(7LL, @"Filter %@ is not registered with XPC, creating xpcFilter");
                  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v11, "filter", v20));
                  if (!v14)
                  {
                    __int128 v17 = @"Failed to convert dictionary to xpc dictionary";
                    goto LABEL_24;
                  }
                }

                -[FudController notifyClientsOfInstallerUpdate:](self, "notifyClientsOfInstallerUpdate:", 1LL);
                id v15 = objc_msgSend( objc_msgSend(v11, "filterName"),  "rangeOfString:options:",  @"com.apple.MobileAccessoryUpdater.EA.",  1);
                uint64_t v16 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  xpc_set_event(v13, v16, 0LL);
                  xpc_set_event(v13, objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4), v14);
                }

                else
                {
                  xpc_dictionary_set_string(v14, _xpc_event_key_name, v16);
                  id v21 = [v11 filterName];
                  FudLog(7LL, @"Kicking off installer check event for %@, xpcFilter=%@");
                  -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v14, v21, v14);
                }

                -[FudController watchSharedGroup](self, "watchSharedGroup");
                xpc_release(v14);
              }

- (void)doPeriodicCheck
{
  id v3 = -[NSMutableDictionary allValues](-[FudStorage pluginToPolicy](self->_fudStorage, "pluginToPolicy"), "allValues");
  if (!v3)
  {
    FudLog(7LL, @"policies = NULL");
    return;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v24 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        uint64_t v5 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v6 = [v5 matchingFilters];
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v27;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
              if ([v11 needsPeriodicFirmwareCheck])
              {
                id v19 = [v11 filterName];
                FudLog(7LL, @"Filter %@ needs periodic check");
                id v12 = objc_msgSend(objc_msgSend(v11, "filterType", v19), "cStringUsingEncoding:", 4);
                if (!v12)
                {
                  __int128 v17 = @"Failed to get filter type cstring";
LABEL_24:
                  FudLog(3LL, v17);
                  goto LABEL_20;
                }

                id v13 = v12;
                id v14 = (void *)xpc_copy_event( v12,  objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4));
                if (!v14)
                {
                  id v20 = [v11 filterName];
                  FudLog(7LL, @"Filter %@ is not registered with XPC, creating xpcFilter");
                  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v11, "filter", v20));
                  if (!v14)
                  {
                    __int128 v17 = @"Failed to convert dictionary to xpc dictionary";
                    goto LABEL_24;
                  }
                }

                id v15 = objc_msgSend( objc_msgSend(v11, "filterName"),  "rangeOfString:options:",  @"com.apple.MobileAccessoryUpdater.EA.",  1);
                uint64_t v16 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  xpc_set_event(v13, v16, 0LL);
                  xpc_set_event(v13, objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4), v14);
                }

                else
                {
                  xpc_dictionary_set_string(v14, _xpc_event_key_name, v16);
                  id v21 = [v11 filterName];
                  FudLog(7LL, @"Kicking off periodic check event for %@, xpcFilter=%@");
                  -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v14, v21, v14);
                }

                -[FudController watchSharedGroup](self, "watchSharedGroup");
                xpc_release(v14);
              }

@end