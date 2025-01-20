@interface CLAvengerScanner
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldStartSpecialScan;
- (BOOL)syncgetIsScanning;
- (CLAvengerScanner)init;
- (id).cxx_construct;
- (id)convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:(CLAvengerScannerScanParameters *)a3;
- (id)nameForClient:(id)a3;
- (int64_t)getCLAvengerScannerPolicyPlatformType;
- (void)beginService;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)clearLongAggressiveTimeoutBlockForClient:(id)a3;
- (void)createLongAggressiveTimeoutBlockForClient:(id)a3 seconds:(int64_t)a4 withBlock:(id)a5;
- (void)endService;
- (void)handleFoundDevice:(id)a3;
- (void)initAnalyticsCache;
- (void)initAnalyticsTimer;
- (void)initializeClientRequestsViewsWithZeroValues:(id)a3;
- (void)initializeScanTypeChangeViewsWithZeroValues;
- (void)notifyClientsAggressiveScanEnded;
- (void)notifyClientsAggressiveScanStarted;
- (void)objectDiscovery:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)objectDiscovery:(id)a3 foundDevice:(id)a4;
- (void)objectDiscovery:(id)a3 foundDevices:(id)a4;
- (void)objectDiscoveryStartedScanning:(id)a3;
- (void)objectDiscoveryStoppedScanning:(id)a3;
- (void)objectDiscoveryUpdatedState:(id)a3;
- (void)onAnalyticsTimerFired:(id)a3;
- (void)onObjectDiscoveryUpdatedState:(int64_t)a3;
- (void)performTemporaryAggressiveScan:(id)a3;
- (void)performTemporaryAggressiveScanForFindMyAccessoryManager:(id)a3;
- (void)performTemporaryHawkeyeLowEnergyScan:(id)a3;
- (void)performTemporaryLongAggressiveScan:(id)a3;
- (void)persistAnalyticsCache;
- (void)resetAnalyticsCache;
- (void)scanTypeUpdated:(int64_t)a3;
- (void)start;
- (void)startBTFindingScan:(id)a3;
- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 clientName:(id)a4;
- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 optedIn:(BOOL)a4 clientName:(id)a5;
- (void)startWatchAdvertisementBufferScan:(id)a3;
- (void)startedAggressiveDiscoveryScan;
- (void)stop;
- (void)stopBTFindingScan:(id)a3;
- (void)stopMonitoringAvengerAdvertisementsForClient:(id)a3;
- (void)stopWatchAdvertisementBufferScan:(id)a3;
- (void)stoppedAggressiveDiscoveryScan;
- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5;
- (void)submitScanTypeChangeEvent:(id)a3 type:(id)a4;
- (void)systemCoexImpact:(id)a3 toState:(int)a4;
- (void)terminateTemporaryLongAggressiveScan:(id)a3;
@end

@implementation CLAvengerScanner

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199AB30 != -1) {
    dispatch_once(&qword_10199AB30, &stru_101873168);
  }
  return (id)qword_10199AB28;
}

+ (BOOL)isSupported
{
  return os_variant_is_darwinos("com.apple.locationd", a2) ^ 1;
}

- (CLAvengerScanner)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScanner;
  return -[CLAvengerScanner initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAvengerScannerServiceProtocol,  &OBJC_PROTOCOL___CLAvengerScannerClientProtocol);
}

- (void)beginService
{
  self->_queue = (OS_dispatch_queue *)objc_msgSend( objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"),  "queue");
  self->_objectDiscoveryManager = -[WPObjectDiscovery initWithDelegate:queue:]( [WPObjectDiscovery alloc],  "initWithDelegate:queue:",  self,  objc_msgSend( objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"),  "queue"));
  self->_clients = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  self->_clientToNameMap =  +[NSMapTable weakToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "weakToStrongObjectsMapTable");
  self->_clientToLongAggressiveScanTimeout =  +[NSMapTable weakToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "weakToStrongObjectsMapTable");
  self->_stateContext = objc_alloc_init(&OBJC_CLASS___CLAvengerScannerStateContext);
  self->_policy = -[CLAvengerScannerPolicy initWithDelegate:platformType:supportsPerTypeDuplicateFilter:]( objc_alloc(&OBJC_CLASS___CLAvengerScannerPolicy),  "initWithDelegate:platformType:supportsPerTypeDuplicateFilter:",  self,  -[CLAvengerScanner getCLAvengerScannerPolicyPlatformType]( self,  "getCLAvengerScannerPolicyPlatformType"),  sub_1004FA75C());
  self->_centralManager = -[CBCentralManager initWithDelegate:queue:]( [CBCentralManager alloc],  "initWithDelegate:queue:",  self,  objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"));
  self->_hasQueriedNumberOfBuffers = 0;
  self->_systemMonitor = -[CLDurianSystemMonitor initWithUniverse:]( objc_alloc(&OBJC_CLASS___CLDurianSystemMonitor),  "initWithUniverse:",  -[CLAvengerScanner universe](self, "universe"));
  self->_avengerScannerSettings = -[CLAvengerScannerSettings initWithUniverse:]( objc_alloc(&OBJC_CLASS___CLAvengerScannerSettings),  "initWithUniverse:",  -[CLAvengerScanner universe](self, "universe"));
  -[CLDurianSystemMonitor setDelegate:](self->_systemMonitor, "setDelegate:", self);
  -[CLAvengerScanner initializeScanTypeChangeViewsWithZeroValues](self, "initializeScanTypeChangeViewsWithZeroValues");
  -[CLAvengerScanner initAnalyticsCache](self, "initAnalyticsCache");
  -[CLAvengerScanner initAnalyticsTimer](self, "initAnalyticsTimer");
  self->_reconciler = -[CLAvengerReconciler initWithQueue:]( objc_alloc(&OBJC_CLASS___CLAvengerReconciler),  "initWithQueue:",  self->_queue);
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLAvengerScanner: begin service", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  0LL,  "CLAvengerScanner: begin service",  v8,  2);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAvengerScanner beginService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  v4 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = -[CLAvengerScannerSettings settingsDictionary](self->_avengerScannerSettings, "settingsDictionary");
    *(_DWORD *)buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2113;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: settings, settings:%{private, location:escape_only}@}",  buf,  0x1Cu);
  }

- (void)endService
{
  self->_objectDiscoveryManager = 0LL;
  self->_centralManager = 0LL;
  self->_hasQueriedNumberOfBuffers = 0;

  self->_policy = 0LL;
  self->_clients = 0LL;

  self->_clientToNameMap = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v3 = -[NSMapTable objectEnumerator](self->_clientToLongAggressiveScanTimeout, "objectEnumerator", 0LL);
  id v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_block_cancel(*(dispatch_block_t *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  self->_clientToLongAggressiveScanTimeout = 0LL;
  self->_reconciler = 0LL;
}

- (id)nameForClient:(id)a3
{
  if (-[NSMapTable objectForKey:](self->_clientToNameMap, "objectForKey:")) {
    return -[NSMapTable objectForKey:](self->_clientToNameMap, "objectForKey:", a3);
  }
  else {
    return @"Unknown";
  }
}

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 clientName:(id)a4
{
}

- (void)clearLongAggressiveTimeoutBlockForClient:(id)a3
{
  id v5 = -[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:");
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  uint64_t v6 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int128 v9 = "";
    __int16 v10 = 2114;
    id v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    __int16 v12 = 1026;
    BOOL v13 = v5 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner clearing LongAggressive timeout block, client:%{public, location:esc ape_only}@, block:%{public}hhd}",  (uint8_t *)v7,  0x22u);
  }

  if (v5)
  {
    dispatch_block_cancel(v5);
    -[NSMapTable removeObjectForKey:](self->_clientToLongAggressiveScanTimeout, "removeObjectForKey:", a3);
  }

- (void)createLongAggressiveTimeoutBlockForClient:(id)a3 seconds:(int64_t)a4 withBlock:(id)a5
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  __int128 v9 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2114;
    id v21 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    __int16 v22 = 2050;
    int64_t v23 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner creating LongAggressive timeout block, client:%{public, location:esc ape_only}@, seconds:%{public}lld}",  (uint8_t *)&v16,  0x26u);
  }

  if (-[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    __int16 v10 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      id v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      int v16 = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner a LongAggressive timeout block already exists for client, client:% {public, location:escape_only}@}",  (uint8_t *)&v16,  0x1Cu);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
    }

    __int16 v12 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      id v13 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      int v16 = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      id v21 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner a LongAggressive timeout block already exists for client",  "{msg%{public}.0s:CLAvengerScanner a LongAggressive timeout block already exists for client, client:% {public, location:escape_only}@}",  (uint8_t *)&v16,  0x1Cu);
    }
  }

  else
  {
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a5);
    dispatch_time_t v15 = dispatch_time(0LL, 1000000000 * a4);
    dispatch_after(v15, (dispatch_queue_t)self->_queue, v14);
    -[NSMapTable setObject:forKey:](self->_clientToLongAggressiveScanTimeout, "setObject:forKey:", v14, a3);
    _Block_release(v14);
  }

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 optedIn:(BOOL)a4 clientName:(id)a5
{
  if (a5)
  {
    clients = self->_clients;
    if (clients)
    {
      BOOL v8 = a4;
      -[NSMutableSet addObject:](clients, "addObject:");
      -[NSMapTable setObject:forKey:](self->_clientToNameMap, "setObject:forKey:", a5, a3);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      __int16 v10 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
        unsigned int v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
        int64_t state = self->_state;
        unsigned int v14 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
        unsigned int v15 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
        v16[0] = 68290562;
        v16[1] = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2114;
        id v20 = v11;
        __int16 v21 = 1026;
        BOOL v22 = v8;
        __int16 v23 = 1026;
        unsigned int v24 = v12;
        __int16 v25 = 1026;
        int v26 = state;
        __int16 v27 = 1026;
        unsigned int v28 = v14;
        __int16 v29 = 1026;
        unsigned int v30 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: startMonitoringAvengerAdvertisementsForClient, client:%{public, location:escape_only}@, optedIn:%{public}hhd, _currentWPState:%{public}d, _state:%{public}d, _s tateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v16,  0x3Au);
      }

      if (-[CLAvengerScannerPolicy optedIn](self->_policy, "optedIn") != v8) {
        -[CLAvengerScannerPolicy setOptedIn:](self->_policy, "setOptedIn:", v8);
      }
      if (self->_state <= 1uLL)
      {
        self->_int64_t state = 2LL;
        -[CLAvengerScanner start](self, "start");
      }

      -[CLAvengerScanner initializeClientRequestsViewsWithZeroValues:]( self,  "initializeClientRequestsViewsWithZeroValues:",  a5);
      -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  a5,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartMonitor"));
    }
  }

- (void)stopMonitoringAvengerAdvertisementsForClient:(id)a3
{
  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:"))
  {
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopMonitor"));
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
    -[NSMapTable removeObjectForKey:](self->_clientToNameMap, "removeObjectForKey:", a3);
    if (!-[NSMutableSet count](self->_clients, "count") && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      self->_int64_t state = 1LL;
      -[CLAvengerScanner stop](self, "stop");
    }

    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    id v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      id v7 = -[NSMutableSet count](self->_clients, "count");
      unsigned int v8 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t state = self->_state;
      unsigned int v10 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v11 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      v12[0] = 68290562;
      v12[1] = 0;
      __int16 v13 = 2082;
      unsigned int v14 = "";
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2050;
      id v18 = v7;
      __int16 v19 = 1026;
      unsigned int v20 = v8;
      __int16 v21 = 1026;
      int v22 = state;
      __int16 v23 = 1026;
      unsigned int v24 = v10;
      __int16 v25 = 1026;
      unsigned int v26 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:CLAvengerScanner: stopMonitoringAvengerAdvertisementsForClient, client:%{public, lo cation:escape_only}@, clientCount:%{public}lu, _currentWPState:%{public}d, _state:%{public}d, _sta teContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v12,  0x3Eu);
    }
  }

- (id)convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:(CLAvengerScannerScanParameters *)a3
{
  v5[0] = WPObjectDiscoveryScanKeyAdvBuffer;
  v6[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var5);
  v5[1] = WPObjectDiscoveryScanKeyAdvBufferRate;
  v6[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var4);
  v5[2] = WPObjectDiscoveryScanKeyAllowDuplicates;
  v6[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3->var0);
  v5[3] = WPObjectDiscoveryScanKeyScanWhenLocked;
  v6[3] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3->var1);
  v5[4] = WPObjectDiscoveryScanKeyScreenOffRate;
  v6[4] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var3);
  v5[5] = WPObjectDiscoveryScanKeyScreenOnRate;
  v6[5] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var2);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  6LL);
}

- (void)start
{
  if (self->_state != 3)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    objc_super v3 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t state = self->_state;
      unsigned int v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      *(_DWORD *)buf = 68290050;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 1026;
      *(_DWORD *)unsigned int v20 = v4;
      *(_WORD *)&v20[4] = 1026;
      *(_DWORD *)&v20[6] = state;
      LOWORD(v21) = 1026;
      *(_DWORD *)((char *)&v21 + 2) = v6;
      HIWORD(v21) = 1026;
      unsigned int v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: attempting to start, _currentWPState:%{public}d, _state:%{pub lic}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingRespons e:%{public}hhd}",  buf,  0x2Au);
    }

    if (!-[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse")
      && (id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    {
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:]( self->_stateContext,  "setStartScanningAwaitingResponse:",  1LL);
      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:]( self->_stateContext,  "setStopScanningAwaitingResponse:",  0LL);
      -[CLAvengerScannerStateContext setRequestedScanType:]( self->_stateContext,  "setRequestedScanType:",  -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType"));
      policy = self->_policy;
      if (policy)
      {
        -[CLAvengerScannerPolicy currentScanParameters](policy, "currentScanParameters");
      }

      else
      {
        uint64_t v14 = 0LL;
        __int128 v12 = 0u;
        __int128 v13 = 0u;
      }

      id v9 = -[CLAvengerScanner convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:]( self,  "convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:",  &v12);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      unsigned int v10 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:]( &OBJC_CLASS___CLAvengerScannerPolicy,  "convertCLAvengerScannerPolicyScanTypeToString:",  -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType"));
        *(_DWORD *)buf = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2114;
        *(void *)unsigned int v20 = v11;
        *(_WORD *)&v20[8] = 2113;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: startScanning requested, ScanType:%{public, location:escape_onl y}@, ScanParameters:%{private, location:escape_only}@}",  buf,  0x26u);
      }

      -[WPObjectDiscovery startScanningWithOptions:]( self->_objectDiscoveryManager,  "startScanningWithOptions:",  v9,  v12,  v13,  v14);
    }
  }

- (void)stop
{
  if (self->_state
    && !-[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse"))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    objc_super v3 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t state = self->_state;
      unsigned int v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      int v9 = 68290050;
      int v10 = 0;
      __int16 v11 = 2082;
      __int128 v12 = "";
      __int16 v13 = 1026;
      unsigned int v14 = v4;
      __int16 v15 = 1026;
      int v16 = state;
      __int16 v17 = 1026;
      unsigned int v18 = v6;
      __int16 v19 = 1026;
      unsigned int v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: attempting to stop, _currentWPState:%{public}d, _state:%{publ ic}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse :%{public}hhd}",  (uint8_t *)&v9,  0x2Au);
    }

    if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      unsigned int v8 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
      {
        int v9 = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        __int128 v12 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:CLAvengerScanner: stopScanning requested}",  (uint8_t *)&v9,  0x12u);
      }

      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:]( self->_stateContext,  "setStopScanningAwaitingResponse:",  1LL);
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:]( self->_stateContext,  "setStartScanningAwaitingResponse:",  0LL);
      -[WPObjectDiscovery stopScanning](self->_objectDiscoveryManager, "stopScanning");
    }
  }

- (void)onObjectDiscoveryUpdatedState:(int64_t)a3
{
  if (-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") != a3)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    id v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      unsigned int v6 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t state = self->_state;
      unsigned int v8 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v9 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      v11[0] = 68290306;
      v11[1] = 0;
      __int16 v12 = 2082;
      __int16 v13 = "";
      __int16 v14 = 1026;
      int v15 = a3;
      __int16 v16 = 1026;
      unsigned int v17 = v6;
      __int16 v18 = 1026;
      int v19 = state;
      __int16 v20 = 1026;
      unsigned int v21 = v8;
      __int16 v22 = 1026;
      unsigned int v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:CLAvengerScanner: objectDiscovery state changed, nextWPState:%{public}d, _current WPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _st ateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x30u);
    }

    -[CLAvengerScannerStateContext setCurrentWPState:](self->_stateContext, "setCurrentWPState:", a3);
    if ((unint64_t)(a3 - 1) <= 1)
    {
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:]( self->_stateContext,  "setStartScanningAwaitingResponse:",  0LL);
      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:]( self->_stateContext,  "setStopScanningAwaitingResponse:",  0LL);
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self->_policy, "hasActiveAggressiveScan")) {
        -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
      }
    }

    int64_t v10 = self->_state;
    if (v10 == 3)
    {
      self->_int64_t state = 2LL;
    }

    else if (v10 == 2)
    {
      if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3) {
        -[CLAvengerScanner start](self, "start");
      }
    }

    else if (v10 == 1 {
           && (id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    }
    {
      -[CLAvengerScanner stop](self, "stop");
    }
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [a3 state];
  if ((v4 == (id)10 || v4 == (id)5) && !self->_hasQueriedNumberOfBuffers)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    id v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: requesting num adv buffers}",  buf,  0x12u);
    }

    centralManager = self->_centralManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_100B52B60;
    v7[3] = &unk_101873190;
    v7[4] = self;
    -[CBCentralManager retrieveSupportedResources:subKey:completion:]( centralManager,  "retrieveSupportedResources:subKey:completion:",  CBManagerResourceADVBufferCount,  &stru_1018A4B00,  v7);
  }

- (void)objectDiscoveryUpdatedState:(id)a3
{
}

- (void)objectDiscoveryStartedScanning:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  id v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v8 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v9 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    int v16 = 68290050;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 1026;
    unsigned int v21 = v6;
    __int16 v22 = 1026;
    int v23 = state;
    __int16 v24 = 1026;
    unsigned int v25 = v8;
    __int16 v26 = 1026;
    unsigned int v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: objectDiscoveryStartedScanning, _currentWPState:%{public}d, _stat e:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaiting Response:%{public}hhd}",  (uint8_t *)&v16,  0x2Au);
  }

  -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:]( self->_stateContext,  "setStartScanningAwaitingResponse:",  0LL);
  unint64_t v10 = self->_state;
  if (v10 < 2)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    __int16 v12 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScanne rStopped - this is unexpected}",  (uint8_t *)&v16,  0x12u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
    }

    __int16 v13 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected",  "{msg%{public}.0s:CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScanne rStopped - this is unexpected}",  (uint8_t *)&v16,  0x12u);
    }
  }

  else if (v10 == 2)
  {
    self->_int64_t state = 3LL;
  }

  else if (v10 == 3)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    __int16 v11 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScanne rScanning - overwrite parameters}",  (uint8_t *)&v16,  0x12u);
    }
  }

  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", [a3 state]);
  -[CLAvengerScanner submitScanTypeChangeEvent:type:]( self,  "submitScanTypeChangeEvent:type:",  &off_1018D4100,  +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:]( &OBJC_CLASS___CLAvengerScannerPolicy,  "convertCLAvengerScannerPolicyScanTypeToString:",  -[CLAvengerScannerStateContext requestedScanType](self->_stateContext, "requestedScanType")));
  __int16 v14 = -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType");
  if (v14 != (void *)-[CLAvengerScannerStateContext requestedScanType](self->_stateContext, "requestedScanType"))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    int v15 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: objectDiscoveryStartedScanning achieved scan and current desired scan d ont match, restarting}",  (uint8_t *)&v16,  0x12u);
    }

    self->_int64_t state = 2LL;
    -[CLAvengerScanner start](self, "start");
  }

- (void)objectDiscoveryStoppedScanning:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  id v4 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v7 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v8 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    int v12 = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 1026;
    unsigned int v17 = v5;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v7;
    __int16 v22 = 1026;
    unsigned int v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: objectDiscoveryStoppedScanning, _currentWPState:%{public}d, _stat e:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaiting Response:%{public}hhd}",  (uint8_t *)&v12,  0x2Au);
  }

  -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:]( self->_stateContext,  "setStopScanningAwaitingResponse:",  0LL);
  if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self->_policy, "hasActiveAggressiveScan")) {
    -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
  }
  int64_t v9 = self->_state;
  switch(v9)
  {
    case 3LL:
      self->_int64_t state = 2LL;
      -[CLAvengerScanner start](self, "start");
      break;
    case 1LL:
      self->_int64_t state = 0LL;
      break;
    case 0LL:
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      unint64_t v10 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        int v15 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScan nerStopped - this is unexpected}",  (uint8_t *)&v12,  0x12u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101873200);
        }
      }

      __int16 v11 = (os_log_s *)qword_1019349B8;
      if (os_signpost_enabled((os_log_t)qword_1019349B8))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        int v15 = "";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected",  "{msg%{public}.0s:CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScan nerStopped - this is unexpected}",  (uint8_t *)&v12,  0x12u);
      }

      break;
  }

- (void)objectDiscovery:(id)a3 failedToStartScanningWithError:(id)a4
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v6 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
  {
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290307;
    int v24 = 0;
    __int16 v25 = 2082;
    __int16 v26 = "";
    __int16 v27 = 2113;
    id v28 = a4;
    __int16 v29 = 1026;
    unsigned int v30 = v7;
    __int16 v31 = 1026;
    int v32 = state;
    __int16 v33 = 1026;
    unsigned int v34 = v9;
    __int16 v35 = 1026;
    unsigned int v36 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: failedToStartScanning, error:%{private, location:escape_only}@, _ currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
  }

  __int16 v11 = (os_log_s *)qword_1019349B8;
  if (os_signpost_enabled((os_log_t)qword_1019349B8))
  {
    unsigned int v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t v21 = self->_state;
    unsigned int v13 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v14 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290307;
    int v24 = 0;
    __int16 v25 = 2082;
    __int16 v26 = "";
    __int16 v27 = 2113;
    id v28 = a4;
    __int16 v29 = 1026;
    unsigned int v30 = v12;
    __int16 v31 = 1026;
    int v32 = v21;
    __int16 v33 = 1026;
    unsigned int v34 = v13;
    __int16 v35 = 1026;
    unsigned int v36 = v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: failedToStartScanning",  "{msg%{public}.0s:CLAvengerScanner: failedToStartScanning, error:%{private, location:escape_only}@, _ currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
  }

  -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:]( self->_stateContext,  "setStartScanningAwaitingResponse:",  0LL);
  -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:]( self->_stateContext,  "setStopScanningAwaitingResponse:",  0LL);
  int64_t v15 = self->_state;
  switch(v15)
  {
    case 3LL:
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      __int16 v18 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerScanning state",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101873200);
        }
        v22[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  16LL,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerScanning state",  v22,  2);
        goto LABEL_36;
      }

      break;
    case 1LL:
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      int v19 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopPending state",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101873200);
        }
        v22[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  16LL,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopPending state",  v22,  2);
        goto LABEL_36;
      }

      break;
    case 0LL:
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      __int16 v16 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopped state",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101873200);
        }
        v22[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  16LL,  "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopped state",  v22,  2);
LABEL_36:
        __int16 v20 = (uint8_t *)v17;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLAvengerScanner objectDiscovery:failedToStartScanningWithError:]",  "%s\n",  v17);
        if (v20 != buf) {
          free(v20);
        }
      }

      break;
  }

- (void)objectDiscovery:(id)a3 foundDevice:(id)a4
{
}

- (void)objectDiscovery:(id)a3 foundDevices:(id)a4
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(a4);
        }
        -[CLAvengerScanner handleFoundDevice:]( self,  "handleFoundDevice:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
      }

      id v8 = [a4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v8);
  }

  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  __int16 v11 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026LL;
    __int16 v27 = 2082;
    id v28 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: buffer emptied}",  (uint8_t *)&buf,  0x12u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  clients = self->_clients;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) onAdvertisementBufferEmptied];
      }

      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    }

    while (v14);
  }

  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", [a3 state]);
}

- (void)handleFoundDevice:(id)a3
{
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_101873220);
  }
  id v4 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_FAULT))
  {
    uint64_t buf = 68289283LL;
    __int16 v31 = 2082;
    int v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:CLAvengerScanner Depricated function handleFoundDevice called with data, device:%{pri vate, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_101873220);
    }
  }

  unsigned int v5 = (os_log_s *)qword_101934848;
  if (os_signpost_enabled((os_log_t)qword_101934848))
  {
    uint64_t buf = 68289283LL;
    __int16 v31 = 2082;
    int v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner Depricated function handleFoundDevice called with data",  "{msg%{public}.0s:CLAvengerScanner Depricated function handleFoundDevice called with data, device:%{pri vate, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
  }

  unsigned int v6 = objc_alloc(&OBJC_CLASS___CLAvengerScannerClientObjectDiscoveryData);
  uint64_t v7 = WPObjectDiscoveryKeyAddress;
  id v8 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyAddress];
  uint64_t v9 = WPObjectDiscoveryKeyData;
  id v10 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyData];
  id v11 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyStatus), "unsignedCharValue");
  id v12 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyOptional];
  id v13 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyRSSI), "integerValue");
  id v14 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyTime];
  LOBYTE(v23) = 0;
  uint64_t v15 = -[CLAvengerScannerClientObjectDiscoveryData initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:]( v6,  "initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:",  v8,  v10,  v11,  v12,  v13,  v14,  [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyChannel],  v23,  0);
  reconciler = self->_reconciler;
  if (reconciler) {
    id v17 = -[CLAvengerReconciler attemptReconciliationWithAddress:advertisementData:]( reconciler,  "attemptReconciliationWithAddress:advertisementData:",  [a3 objectForKeyedSubscript:v7],  objc_msgSend(a3, "objectForKeyedSubscript:", v9));
  }
  else {
    id v17 = 0LL;
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  clients = self->_clients;
  id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) onAvengerAdvertisement:v15 reconciledInformation:v17];
      }

      id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    }

    while (v20);
  }

- (void)notifyClientsAggressiveScanStarted
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    uint64_t buf = 68290050LL;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 1026;
    unsigned int v22 = v4;
    __int16 v23 = 1026;
    int v24 = state;
    __int16 v25 = 1026;
    unsigned int v26 = v6;
    __int16 v27 = 1026;
    unsigned int v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: notifyClientsAggressiveScanStarted, _currentWPState:%{public}d, _ state:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwai tingResponse:%{public}hhd}",  (uint8_t *)&buf,  0x2Au);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  clients = self->_clients;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) onAggressiveScanStarted];
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

- (void)notifyClientsAggressiveScanEnded
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    uint64_t buf = 68290050LL;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 1026;
    unsigned int v22 = v4;
    __int16 v23 = 1026;
    int v24 = state;
    __int16 v25 = 1026;
    unsigned int v26 = v6;
    __int16 v27 = 1026;
    unsigned int v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: notifyClientsAggressiveScanEnded, _currentWPState:%{public}d, _st ate:%{public}d, _stateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaiti ngResponse:%{public}hhd}",  (uint8_t *)&buf,  0x2Au);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  clients = self->_clients;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) onAggressiveScanEnded];
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

- (BOOL)syncgetIsScanning
{
  return self->_state == 3;
}

- (BOOL)shouldStartSpecialScan
{
  id v2 = -[NSMutableSet count](self->_clients, "count");
  if (!v2)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    objc_super v3 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      id v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: special scan requested, but currently no clients, not starting}",  (uint8_t *)&v6,  0x12u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
    }

    unsigned int v4 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      id v9 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: special scan requested, but currently no clients, not starting",  "{msg%{public}.0s:CLAvengerScanner: special scan requested, but currently no clients, not starting}",  (uint8_t *)&v6,  0x12u);
    }
  }

  return v2 != 0LL;
}

- (void)performTemporaryAggressiveScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    *(_DWORD *)uint64_t buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v19 = 2082;
    *(void *)&v19[2] = "";
    *(_WORD *)&v19[10] = 2114;
    *(void *)&v19[12] = v6;
    *(_WORD *)&v19[20] = 1026;
    *(_DWORD *)&v19[22] = v7;
    *(_WORD *)&v19[26] = 1026;
    *(_DWORD *)&v19[28] = state;
    LOWORD(v20) = 1026;
    *(_DWORD *)((char *)&v20 + 2) = v9;
    HIWORD(v20) = 1026;
    LODWORD(v21) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: performTemporaryAggressiveScan requested, client:%{public, location :escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingRespon se:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
  }

  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    *(void *)uint64_t buf = 0LL;
    *(void *)__int16 v19 = buf;
    *(void *)&v19[8] = 0x3812000000LL;
    *(void *)&v19[16] = sub_100B54924;
    *(void *)&v19[24] = sub_100B54934;
    uint64_t v20 = 0LL;
    uint64_t v11 = operator new(0x30uLL);
    sub_100AD558C((uint64_t)v11, (uint64_t)"CLAvengerScanner aggressive scan", 9LL, 60.0);
    __int16 v21 = v11;
    uint64_t v12 = *(void *)(*(void *)v19 + 48LL);
    sub_1010DDBC0(__p, "none");
    sub_100AD5668(v12, (uint64_t *)__p);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    -[CLAvengerScannerPolicy startAggressiveScan](self->_policy, "startAggressiveScan");
    dispatch_time_t v13 = dispatch_time(0LL, 6000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100B54954;
    block[3] = &unk_1018429C8;
    block[4] = self;
    block[5] = buf;
    dispatch_after( v13,  (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"),  block);
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Aggressive"));
    _Block_object_dispose(buf, 8);
    __int128 v14 = v21;
    __int16 v21 = 0LL;
    if (v14) {
      (*(void (**)(void *))(*(void *)v14 + 8LL))(v14);
    }
  }

- (void)performTemporaryAggressiveScanForFindMyAccessoryManager:(id)a3
{
  if (-[CLAvengerScannerPolicy hasActiveBTFindingScan](self->_policy, "hasActiveBTFindingScan"))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    unsigned int v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t state = self->_state;
      unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      v11[0] = 68290306;
      v11[1] = 0;
      __int16 v12 = 2082;
      dispatch_time_t v13 = "";
      __int16 v14 = 2114;
      id v15 = v6;
      __int16 v16 = 1026;
      unsigned int v17 = v7;
      __int16 v18 = 1026;
      int v19 = state;
      __int16 v20 = 1026;
      unsigned int v21 = v9;
      __int16 v22 = 1026;
      unsigned int v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: requested AggressiveScan but RSSI Finding scan active, client:%{p ublic, location:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScann ingAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x34u);
    }
  }

  else
  {
    -[CLAvengerScanner performTemporaryAggressiveScan:](self, "performTemporaryAggressiveScan:", a3);
  }

- (void)performTemporaryLongAggressiveScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    *(_DWORD *)uint64_t buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v44 = 2082;
    *(void *)&v44[2] = "";
    *(_WORD *)&v44[10] = 2114;
    *(void *)&v44[12] = v6;
    *(_WORD *)&v44[20] = 1026;
    *(_DWORD *)&v44[22] = v7;
    *(_WORD *)&v44[26] = 1026;
    *(_DWORD *)&v44[28] = state;
    *(_WORD *)&v44[32] = 1026;
    *(_DWORD *)&v44[34] = v9;
    *(_WORD *)&v44[38] = 1026;
    LODWORD(v45) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: performTemporaryLongAggressiveScan requested, client:%{public, loca tion:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingRe sponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
  }

  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    if (-[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3))
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      uint64_t v11 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        id v36 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
        unsigned int v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
        int v13 = self->_state;
        unsigned int v14 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
        unsigned int v15 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
        *(_DWORD *)uint64_t buf = 68290306;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v44 = 2082;
        *(void *)&v44[2] = "";
        *(_WORD *)&v44[10] = 2114;
        *(void *)&v44[12] = v36;
        *(_WORD *)&v44[20] = 1026;
        *(_DWORD *)&v44[22] = v12;
        *(_WORD *)&v44[26] = 1026;
        *(_DWORD *)&v44[28] = v13;
        *(_WORD *)&v44[32] = 1026;
        *(_DWORD *)&v44[34] = v14;
        *(_WORD *)&v44[38] = 1026;
        LODWORD(v45) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already activ e, client:%{public, location:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _st ateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101873200);
        }
      }

      __int16 v16 = (os_log_s *)qword_1019349B8;
      if (os_signpost_enabled((os_log_t)qword_1019349B8))
      {
        id v17 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
        p_stateContext = &self->_stateContext;
        unsigned int v19 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
        int v20 = self->_state;
        unsigned int v21 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
        unsigned int v22 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( *p_stateContext,  "stopScanningAwaitingResponse");
        *(_DWORD *)uint64_t buf = 68290306;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v44 = 2082;
        *(void *)&v44[2] = "";
        *(_WORD *)&v44[10] = 2114;
        *(void *)&v44[12] = v17;
        *(_WORD *)&v44[20] = 1026;
        *(_DWORD *)&v44[22] = v19;
        *(_WORD *)&v44[26] = 1026;
        *(_DWORD *)&v44[28] = v20;
        *(_WORD *)&v44[32] = 1026;
        *(_DWORD *)&v44[34] = v21;
        *(_WORD *)&v44[38] = 1026;
        LODWORD(v45) = v22;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active",  "{msg%{public}.0s:CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already activ e, client:%{public, location:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _st ateContext.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
      }
    }

    else
    {
      if (-[CLAvengerScannerPolicy associatedTo2GHzWiFi](self->_policy, "associatedTo2GHzWiFi")
        && -[CLAvengerScannerPolicy wifi2GHzCriticalState](self->_policy, "wifi2GHzCriticalState")
        || -[CLAvengerScannerPolicy bluetoothAudioActive](self->_policy, "bluetoothAudioActive"))
      {
        -[CLAvengerScannerSettings longAggressiveScanCoexImpactedDuration]( self->_avengerScannerSettings,  "longAggressiveScanCoexImpactedDuration");
        double v24 = v23;
        int v25 = 1;
      }

      else
      {
        -[CLAvengerScannerSettings longAggressiveScanNonCoexImpactedDuration]( self->_avengerScannerSettings,  "longAggressiveScanNonCoexImpactedDuration");
        double v24 = v26;
        int v25 = 0;
      }

      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
      __int16 v27 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v28 = -[CLAvengerScannerPolicy associatedTo2GHzWiFi](self->_policy, "associatedTo2GHzWiFi");
        unsigned int v29 = -[CLAvengerScannerPolicy wifi2GHzCriticalState](self->_policy, "wifi2GHzCriticalState");
        unsigned int v30 = -[CLAvengerScannerPolicy bluetoothAudioActive](self->_policy, "bluetoothAudioActive");
        *(_DWORD *)uint64_t buf = 68290306;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v44 = 2082;
        *(void *)&v44[2] = "";
        *(_WORD *)&v44[10] = 1026;
        *(_DWORD *)&v44[12] = (int)v24;
        *(_WORD *)&v44[16] = 1026;
        *(_DWORD *)&v44[18] = v25;
        *(_WORD *)&v44[22] = 1026;
        *(_DWORD *)&v44[24] = v28;
        *(_WORD *)&v44[28] = 1026;
        *(_DWORD *)&v44[30] = v29;
        *(_WORD *)&v44[34] = 1026;
        *(_DWORD *)&v44[36] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: performTemporaryLongAggressiveScan scanning, duration:%{public} d, coexImpacted:%{public}hhd, associatedTo2GHzWiFi:%{public}hhd, wifi2GHzCriticalState:%{public}hh d, bluetoothAudioActive:%{public}hhd}",  buf,  0x30u);
      }

      if (v25)
      {
        *(void *)uint64_t buf = 0LL;
        *(void *)v44 = buf;
        *(void *)&v44[8] = 0x3812000000LL;
        *(void *)&v44[16] = sub_100B54924;
        *(void *)&v44[24] = sub_100B54934;
        *(void *)&v44[32] = 0LL;
        __int16 v31 = operator new(0x30uLL);
        sub_100AD558C( (uint64_t)v31,  (uint64_t)"CLAvengerScanner long aggressive scan coexImpacted",  (unint64_t)(v24 + 3.0),  60.0);
        v45 = v31;
        uint64_t v32 = *(void *)(*(void *)v44 + 48LL);
        sub_1010DDBC0(__p, "none");
        sub_100AD5668(v32, (uint64_t *)__p);
        if (v42 < 0) {
          operator delete(__p[0]);
        }
        -[CLAvengerScannerPolicy startCoexFriendlyAggressiveScan](self->_policy, "startCoexFriendlyAggressiveScan");
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100B552F8;
        v40[3] = &unk_1018731B8;
        v40[5] = a3;
        v40[6] = buf;
        v40[4] = self;
        -[CLAvengerScanner createLongAggressiveTimeoutBlockForClient:seconds:withBlock:]( self,  "createLongAggressiveTimeoutBlockForClient:seconds:withBlock:",  a3,  (uint64_t)v24,  v40);
      }

      else
      {
        *(void *)uint64_t buf = 0LL;
        *(void *)v44 = buf;
        *(void *)&v44[8] = 0x3812000000LL;
        *(void *)&v44[16] = sub_100B54924;
        *(void *)&v44[24] = sub_100B54934;
        *(void *)&v44[32] = 0LL;
        __int16 v33 = operator new(0x30uLL);
        sub_100AD558C( (uint64_t)v33,  (uint64_t)"CLAvengerScanner long aggressive scan",  (unint64_t)(v24 + 3.0),  60.0);
        v45 = v33;
        uint64_t v34 = *(void *)(*(void *)v44 + 48LL);
        sub_1010DDBC0(v38, "none");
        sub_100AD5668(v34, (uint64_t *)v38);
        if (v39 < 0) {
          operator delete(v38[0]);
        }
        -[CLAvengerScannerPolicy startCoexFriendlyAggressiveScan](self->_policy, "startCoexFriendlyAggressiveScan");
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100B5534C;
        v37[3] = &unk_1018731E0;
        v37[4] = self;
        v37[5] = a3;
        v37[6] = buf;
        -[CLAvengerScanner createLongAggressiveTimeoutBlockForClient:seconds:withBlock:]( self,  "createLongAggressiveTimeoutBlockForClient:seconds:withBlock:",  a3,  (uint64_t)v24,  v37);
      }

      _Block_object_dispose(buf, 8);
      __int16 v35 = v45;
      v45 = 0LL;
      if (v35) {
        (*(void (**)(void *))(*(void *)v35 + 8LL))(v35);
      }
      -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "AggressiveLong"));
    }
  }

- (void)terminateTemporaryLongAggressiveScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    int v24 = 68290306;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2114;
    id v29 = v6;
    __int16 v30 = 1026;
    unsigned int v31 = v7;
    __int16 v32 = 1026;
    int v33 = state;
    __int16 v34 = 1026;
    unsigned int v35 = v9;
    __int16 v36 = 1026;
    unsigned int v37 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: terminateTemporaryLongAggressiveScan requested, client:%{public, lo cation:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaiting Response:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)&v24,  0x34u);
  }

  id v11 = -[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3);
  if (v11)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v11);
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    unsigned int v12 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      unsigned int v14 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t v15 = self->_state;
      unsigned int v16 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v17 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      int v24 = 68290306;
      int v25 = 0;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 1026;
      unsigned int v31 = v14;
      __int16 v32 = 1026;
      int v33 = v15;
      __int16 v34 = 1026;
      unsigned int v35 = v16;
      __int16 v36 = 1026;
      unsigned int v37 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active,  client:%{public, location:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContex t.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)&v24,  0x34u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
    }

    __int16 v18 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      id v19 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      unsigned int v20 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      int64_t v21 = self->_state;
      unsigned int v22 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
      unsigned int v23 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
      int v24 = 68290306;
      int v25 = 0;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v19;
      __int16 v30 = 1026;
      unsigned int v31 = v20;
      __int16 v32 = 1026;
      int v33 = v21;
      __int16 v34 = 1026;
      unsigned int v35 = v22;
      __int16 v36 = 1026;
      unsigned int v37 = v23;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active",  "{msg%{public}.0s:CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active,  client:%{public, location:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContex t.startScanningAwaitingResponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)&v24,  0x34u);
    }
  }

- (void)performTemporaryHawkeyeLowEnergyScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    *(_DWORD *)uint64_t buf = 68290306;
    int v14 = 0;
    __int16 v15 = 2082;
    unsigned int v16 = "";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1026;
    unsigned int v20 = v7;
    __int16 v21 = 1026;
    int v22 = state;
    __int16 v23 = 1026;
    unsigned int v24 = v9;
    __int16 v25 = 1026;
    unsigned int v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: performTemporaryHawkeyeLowEnergyScan requested, client:%{public, lo cation:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaiting Response:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  buf,  0x34u);
  }

  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startHawkeyeLowEnergyScan](self->_policy, "startHawkeyeLowEnergyScan");
    dispatch_time_t v11 = dispatch_time(0LL, 60000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100B55B68;
    block[3] = &unk_10181A288;
    block[4] = self;
    dispatch_after( v11,  (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"),  block);
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "HELE"));
  }

- (void)startBTFindingScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: startBTFindingScan requested, client:%{public, location:escape_only }@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResponse:%{publi c}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x34u);
  }

  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startBTFindingScan](self->_policy, "startBTFindingScan");
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartBTFinding"));
  }

- (void)stopBTFindingScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: stopBTFindingScan requested, client:%{public, location:escape_only} @, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResponse:%{public }hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x34u);
  }

  -[CLAvengerScannerPolicy stopBTFindingScan](self->_policy, "stopBTFindingScan");
  -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopBTFinding"));
}

- (void)startWatchAdvertisementBufferScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: startWatchAdvertisementBufferScan requested, client:%{public, locat ion:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingRes ponse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x34u);
  }

  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startWatchAdvertisementBufferScan](self->_policy, "startWatchAdvertisementBufferScan");
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartWatchADVBuffer"));
  }

- (void)stopWatchAdvertisementBufferScan:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    unsigned int v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    int64_t state = self->_state;
    unsigned int v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse]( self->_stateContext,  "startScanningAwaitingResponse");
    unsigned int v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse]( self->_stateContext,  "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: stopWatchAdvertisementBufferScan requested, client:%{public, locati on:escape_only}@, _currentWPState:%{public}d, _state:%{public}d, _stateContext.startScanningAwaitingResp onse:%{public}hhd, _stateContext.stopScanningAwaitingResponse:%{public}hhd}",  (uint8_t *)v11,  0x34u);
  }

  -[CLAvengerScannerPolicy stopWatchAdvertisementBufferScan](self->_policy, "stopWatchAdvertisementBufferScan");
  -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4100,  -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopWatchADVBuffer"));
}

- (void)submitScanTypeChangeEvent:(id)a3 type:(id)a4
{
  v15[0] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "scanCount");
  v16[0] = a3;
  v15[1] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "scanType");
  v16[1] = a4;
  id v6 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v7 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2114;
    __int16 v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: submitScanTypeChangeEvent, analyticsEvent:%{public, location:escape_only}@}",  buf,  0x1Cu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100B56400;
  v8[3] = &unk_1018486D8;
  v8[4] = v6;
  AnalyticsSendEventLazy( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.avengerscanner.scantypechange"),  v8);
}

- (void)initializeScanTypeChangeViewsWithZeroValues
{
  for (uint64_t i = 0LL; i != 13; ++i)
    -[CLAvengerScanner submitScanTypeChangeEvent:type:]( self,  "submitScanTypeChangeEvent:type:",  &off_1018D4118,  +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:]( &OBJC_CLASS___CLAvengerScannerPolicy,  "convertCLAvengerScannerPolicyScanTypeToString:",  i));
}

- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5
{
  v17[0] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "requestCount");
  v18[0] = a3;
  v17[1] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "client");
  v18[1] = a4;
  v17[2] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "scanType");
  v18[2] = a5;
  __int16 v8 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101873200);
  }
  unsigned int v9 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLAvengerScanner: submitClientRequestsEvent, analyticsEvent:%{public, location:escape_only}@}",  buf,  0x1Cu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100B56624;
  v10[3] = &unk_1018486D8;
  v10[4] = v8;
  AnalyticsSendEventLazy( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.avengerscanner.clientrequests"),  v10);
}

- (void)initializeClientRequestsViewsWithZeroValues:(id)a3
{
  v15[0] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Aggressive");
  v15[1] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartBTFinding");
  void v15[2] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopBTFinding");
  v15[3] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "AggressiveLong");
  v15[4] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "HELE");
  v15[5] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartWatchADVBuffer");
  v15[6] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopWatchADVBuffer");
  v15[7] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StartMonitor");
  v15[8] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "StopMonitor");
  unsigned int v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 9LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned int v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CLAvengerScanner submitClientRequestsEvent:client:scanType:]( self,  "submitClientRequestsEvent:client:scanType:",  &off_1018D4118,  a3,  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        unsigned int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (void)onAnalyticsTimerFired:(id)a3
{
  if (self->fAnalyticsTimer == a3)
  {
    p_fAnalytics = &self->fAnalytics;
    self->fAnalytics.count_submission = 1;
    v6[0] = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "numSwitchToAgressiveScan");
    v7[0] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  p_fAnalytics->numSwitchToAggressiveScan);
    v6[1] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "count_submission");
    v7[1] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  p_fAnalytics->count_submission);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100B56950;
    v5[3] = &unk_1018486D8;
    v5[4] = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
    -[CLAvengerScanner resetAnalyticsCache]( self,  "resetAnalyticsCache",  AnalyticsSendEventLazy( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.avengerscanner.aggressivescan"),  v5).n128_f64[0]);
  }

- (void)initAnalyticsCache
{
  uint64_t v3 = sub_1002F8DDC();
  if (sub_1002A8F8C(v3, "AvengerScannerAnalyticsTimer", v5))
  {
    p_fAnalytics = &self->fAnalytics;
    sub_1002A82BC((uint64_t)v5, "lastRequestTime", &p_fAnalytics->lastRequestTime);
    sub_1002A775C((uint64_t)v5, "numSwitchToAgressiveScan", &p_fAnalytics->numSwitchToAggressiveScan);
    sub_1002A775C((uint64_t)v5, "count_submission", p_fAnalytics);
  }

  else
  {
    -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
  }

  sub_1002A5590(v5);
}

- (void)persistAnalyticsCache
{
  self = (CLAvengerScanner *)((char *)self + 96);
  sub_1002AC7B8((uint64_t)v5, "lastRequestTime", &self->_objectDiscoveryManager);
  sub_1002ABC7C((uint64_t)v5, "count_submission", (unsigned int *)self->CLIntersiloService_opaque);
  sub_1002ABC7C((uint64_t)v5, "numSwitchToAgressiveScan", (unsigned int *)&self->CLIntersiloService_opaque[4]);
  uint64_t v3 = sub_1002F8DDC();
  sub_1002ACE6C(v3, "AvengerScannerAnalyticsTimer", (uint64_t)v5);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  sub_1002A5590(v5);
}

- (void)resetAnalyticsCache
{
  *(void *)&self->fAnalytics.count_submission = 0LL;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();
  -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
}

- (void)initAnalyticsTimer
{
  uint64_t v3 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "newTimer");
  self->fAnalyticsTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100B56BB0;
  v6[3] = &unk_10181A288;
  v6[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v6);
  double v4 = CFAbsoluteTimeGetCurrent() - self->fAnalytics.lastRequestTime;
  if (v4 >= 86400.0) {
    double v5 = 86400.0;
  }
  else {
    double v5 = 86400.0 - v4;
  }
  -[CLTimer setNextFireDelay:interval:](self->fAnalyticsTimer, "setNextFireDelay:interval:", v5);
}

- (void)scanTypeUpdated:(int64_t)a3
{
  if (self->_state == 3)
  {
    self->_int64_t state = 2LL;
    -[CLAvengerScanner start](self, "start", a3);
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101873200);
    }
    uint64_t v3 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#CLAvengerScanner: attempted to update scan but not yet scanning}",  (uint8_t *)&v5,  0x12u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101873200);
      }
    }

    double v4 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLAvengerScanner: attempted to update scan but not yet scanning",  "{msg%{public}.0s:#CLAvengerScanner: attempted to update scan but not yet scanning}",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)startedAggressiveDiscoveryScan
{
  if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
  {
    ++self->fAnalytics.numSwitchToAggressiveScan;
    -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
    -[CLAvengerScanner notifyClientsAggressiveScanStarted](self, "notifyClientsAggressiveScanStarted");
  }

- (void)stoppedAggressiveDiscoveryScan
{
  if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3) {
    -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
  }
}

- (int64_t)getCLAvengerScannerPolicyPlatformType
{
  if ((sub_1004F7000() & 1) != 0 || (sub_1004F75F8() & 1) != 0) {
    return 1LL;
  }
  if ((sub_1001B9A1C() & 1) != 0) {
    return 2LL;
  }
  return 0LL;
}

- (void)systemCoexImpact:(id)a3 toState:(int)a4
{
  uint64_t v5 = (a4 >> 1) & 1;
  uint64_t v6 = a4 & 1;
  -[CLAvengerScannerPolicy setAssociatedTo2GHzWiFi:]( self->_policy,  "setAssociatedTo2GHzWiFi:",  (a4 >> 2) & 1);
  -[CLAvengerScannerPolicy setWifi2GHzCriticalState:](self->_policy, "setWifi2GHzCriticalState:", v5);
  -[CLAvengerScannerPolicy setBluetoothAudioActive:](self->_policy, "setBluetoothAudioActive:", v6);
}

- (id).cxx_construct
{
  *(void *)&self->fAnalytics.count_submission = 0LL;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();
  return self;
}

@end