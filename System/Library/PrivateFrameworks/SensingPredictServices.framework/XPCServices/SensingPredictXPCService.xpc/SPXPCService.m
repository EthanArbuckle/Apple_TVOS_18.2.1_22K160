@interface SPXPCService
+ (id)sharedInstance;
- (BOOL)_contextEngineShouldRun;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SPXPCService)init;
- (void)_contextEngineEnsureStarted;
- (void)_contextEngineEnsureStopped;
- (void)_prefsChanged;
- (void)_update;
- (void)_updateContextEventSignal;
- (void)_updateLocationCategory;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)contextEventUpdated:(unsigned __int8)a3 fusedState:(unsigned int)a4;
- (void)locationCategoryChanged:(unsigned __int8)a3;
- (void)scheduleLocationCategoryUpdate;
@end

@implementation SPXPCService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006570;
  block[3] = &unk_10000C2B8;
  block[4] = a1;
  if (qword_100011F48 != -1) {
    dispatch_once(&qword_100011F48, block);
  }
  return (id)qword_100011F50;
}

- (SPXPCService)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SPXPCService;
  v2 = -[SPXPCService init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SPXPCService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_prefsChangedNotifyToken = -1;
    v7 = (dispatch_queue_s *)v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006688;
    handler[3] = &unk_10000C4B8;
    v8 = v2;
    v12 = v8;
    notify_register_dispatch("com.apple.SensingPredict.prefsChanged", &v2->_prefsChangedNotifyToken, v7, handler);
    v9 = v8;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(&OBJC_CLASS___SPServicesXPCConnection);
  -[SPServicesXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[SPServicesXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  -[SPServicesXPCConnection setXpcService:](v6, "setXpcService:", self);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SPXPCClientInterface));
  [v5 _setQueue:self->_dispatchQueue];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SPXPCServiceInterface));
  [v5 setExportedInterface:v11];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000068A8;
  v13[3] = &unk_10000C348;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  [v5 setRemoteObjectInterface:v10];
  [v5 resume];
  if (dword_100011DA0 <= 30 && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL))) {
    LogPrintF( &dword_100011DA0,  "-[SPXPCService listener:shouldAcceptNewConnection:]",  30,  "XPC connection started: %#{pid}",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_prefsChanged
{
  int v3 = CFPrefs_GetInt64(@"com.apple.SensingPredict", @"overrideLocationCategory", &v13) != 0;
  int v4 = v13;
  if (v13)
  {
    if (dword_100011DA0 <= 10)
    {
      if (dword_100011DA0 == -1)
      {
        int v4 = v13;
      }

      LogPrintF(&dword_100011DA0, "-[SPXPCService _prefsChanged]", 10LL, "error in read %d", v4);
    }

- (void)_update
{
  if (-[SPXPCService _contextEngineShouldRun](self, "_contextEngineShouldRun")) {
    -[SPXPCService _contextEngineEnsureStarted](self, "_contextEngineEnsureStarted");
  }
  else {
    -[SPXPCService _contextEngineEnsureStopped](self, "_contextEngineEnsureStopped");
  }
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100011DA0 <= 20)
  {
    if (dword_100011DA0 != -1 || (v6 = _LogCategory_Initialize(&dword_100011DA0, 20LL), id v4 = v7, v6))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcCnx]);
      LogPrintF( &dword_100011DA0,  "-[SPXPCService _xpcConnectionInvalidated:]",  20,  "XPC connection ended: %#{pid}",  [v5 processIdentifier]);

      id v4 = v7;
    }
  }

  [v4 xpcConnectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[SPXPCService _update](self, "_update");
}

- (BOOL)_contextEngineShouldRun
{
  id v2 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v2)
  {
    if ((_os_feature_enabled_impl("AudioAccessoryFeatures", "ContextAwareAdaptive") & 1) != 0)
    {
      LOBYTE(v2) = 1;
      return (char)v2;
    }

    if (dword_100011DA0 > 30)
    {
LABEL_7:
      LOBYTE(v2) = 0;
      return (char)v2;
    }

    if (dword_100011DA0 != -1 || (LODWORD(v2) = _LogCategory_Initialize(&dword_100011DA0, 30LL), (_DWORD)v2))
    {
      LogPrintF( &dword_100011DA0,  "-[SPXPCService _contextEngineShouldRun]",  30LL,  "ContextAwareAdaptive feature flag is disabled");
      goto LABEL_7;
    }
  }

  return (char)v2;
}

- (void)_contextEngineEnsureStarted
{
  contextEngine = self->_contextEngine;
  if (!contextEngine)
  {
    id v4 = -[SPContextEngine initWithQueue:]( objc_alloc(&OBJC_CLASS___SPContextEngine),  "initWithQueue:",  self->_dispatchQueue);
    id v5 = self->_contextEngine;
    self->_contextEngine = v4;

    -[SPContextEngine activate](self->_contextEngine, "activate");
    contextEngine = self->_contextEngine;
  }

  -[SPContextEngine processContextChangeFlags:]( contextEngine,  "processContextChangeFlags:",  -[SPContextMonitor contextChangeFlags](self->_contextMonitor, "contextChangeFlags"));
}

- (void)_contextEngineEnsureStopped
{
  contextEngine = self->_contextEngine;
  self->_contextEngine = 0LL;
}

- (void)locationCategoryChanged:(unsigned __int8)a3
{
  self->_locationCategory = a3;
  -[SPXPCService scheduleLocationCategoryUpdate](self, "scheduleLocationCategoryUpdate");
}

- (void)_updateContextEventSignal
{
  self->_conextEventSignalPending = 0;
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SPContext);
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }

  uint64_t v6 = 57LL;
  if (!self->_prefsOverrideLocationCategory) {
    uint64_t v6 = 48LL;
  }
  LODWORD(v7) = *((unsigned __int8 *)&self->super.isa + v6);
  if ((_DWORD)v7 != -[SPContext locationCategory](currentContext, "locationCategory")
    && self->_spFusedState)
  {
    if (dword_100011DA0 <= 30
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
    {
      uint64_t v7 = (char)v7;
      unsigned int v8 = -[SPContext locationCategory](self->_currentContext, "locationCategory");
      if (v8 > 9) {
        uint64_t v9 = @"?";
      }
      else {
        uint64_t v9 = off_10000C540[(char)v8];
      }
      else {
        v10 = off_10000C540[v7];
      }
      uint64_t spFusedState = (int)self->_spFusedState;
      else {
        v12 = off_10000C528[spFusedState];
      }
      LogPrintF( &dword_100011DA0,  "-[SPXPCService _updateContextEventSignal]",  30LL,  "LocationContextChanged %@ --> %@ fused state:fusedState ",  v9,  v10,  v12);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v13 = self->_xpcConnections;
    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) contextMonitorReportContextSignalUpdated:self->_currentContext contextFusedState:self->_spFusedState];
        }

        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v15);
    }
  }

- (void)contextEventUpdated:(unsigned __int8)a3 fusedState:(unsigned int)a4
{
  if (!self->_conextEventSignalPending)
  {
    self->_conextEventSignalPending = 1;
    self->_locationCategory = a3;
    self->_uint64_t spFusedState = a4;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006FCC;
    block[3] = &unk_10000C2E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }

- (void)scheduleLocationCategoryUpdate
{
  if (!self->_locationUpdatePending)
  {
    self->_locationUpdatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000703C;
    block[3] = &unk_10000C2E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }

- (void)_updateLocationCategory
{
  self->_locationUpdatePending = 0;
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SPContext);
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }

  uint64_t v6 = 57LL;
  if (!self->_prefsOverrideLocationCategory) {
    uint64_t v6 = 48LL;
  }
  LODWORD(v7) = *((unsigned __int8 *)&self->super.isa + v6);
  if ((_DWORD)v7 != -[SPContext locationCategory](currentContext, "locationCategory"))
  {
    uint64_t v7 = (char)v7;
    if (dword_100011DA0 <= 30
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
    {
      unsigned int v8 = -[SPContext locationCategory](self->_currentContext, "locationCategory");
      if (v8 > 9) {
        uint64_t v9 = @"?";
      }
      else {
        uint64_t v9 = off_10000C540[(char)v8];
      }
      else {
        v10 = off_10000C540[v7];
      }
      LogPrintF( &dword_100011DA0,  "-[SPXPCService _updateLocationCategory]",  30LL,  "LocationContextChanged %@ --> %@ ",  v9,  v10);
    }

    -[SPContext setLocationCategory:](self->_currentContext, "setLocationCategory:", v7);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v11 = self->_xpcConnections;
    id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) contextMonitorReportLocationChanged:self->_currentContext];
        }

        id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v13);
    }
  }

- (void).cxx_destruct
{
}

@end