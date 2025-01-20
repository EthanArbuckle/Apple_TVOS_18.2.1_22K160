@interface W5StatusManager
- (BOOL)__isSnifferSupported;
- (CWFInterface)corewifi;
- (NSArray)bootArgs;
- (NSOperationQueue)concurrentQueue;
- (W5BluetoothController)bluetooth;
- (W5DatabaseManager)databaseManager;
- (W5DiagnosticsModeManager)diagnosticsModeManager;
- (W5IOPowerManagement)pm;
- (W5IOPowerSource)ps;
- (W5StatusManager)init;
- (W5WiFiInterface)awdl;
- (W5WiFiInterface)nan;
- (W5WiFiInterface)wifi;
- (id)__bluetooth;
- (id)__queryAWDLStatus;
- (id)__queryBluetoothStatus;
- (id)__queryDiagnosticsModes;
- (id)__queryLastHourFaultsStatus;
- (id)__queryLastHourLinkTestsStatus;
- (id)__queryLastHourRecoveriesStatus;
- (id)__queryNetworkStatus;
- (id)__queryPowerStatus;
- (id)__queryStatusIncludingWiFiScanCache:(BOOL)a3;
- (id)__queryWiFiStatusIncludingScanCache:(BOOL)a3;
- (id)__wifi;
- (id)awdlStatus;
- (id)bluetoothStatus;
- (id)cachedStatusWithUUID:(id)a3;
- (id)eventHistory;
- (id)lowBatteryCallback;
- (id)networkStatus;
- (id)powerStatus;
- (id)status;
- (id)updatedAWDLStatusCallback;
- (id)updatedBluetoothCallback;
- (id)updatedBluetoothStatusCallback;
- (id)updatedFaultsCallback;
- (id)updatedLinkTestsCallback;
- (id)updatedNetworkStatusCallback;
- (id)updatedPowerManagementCallback;
- (id)updatedPowerSourceCallback;
- (id)updatedPowerStatusCallback;
- (id)updatedRecoveriesCallback;
- (id)updatedWiFiCallback;
- (id)updatedWiFiStatusCallback;
- (id)wifiStatus;
- (int64_t)__airDropDiscoverableMode;
- (void)__addEvent:(id)a3;
- (void)__forceUpdateTrigger;
- (void)__setupCallbacks;
- (void)__updateStatus;
- (void)__updateStatusCoalesce;
- (void)addEvent:(id)a3;
- (void)clearCachedStatusWithUUID:(id)a3;
- (void)dealloc;
- (void)queryStatusAndReply:(id)a3;
- (void)setDiagnosticsModeManager:(id)a3;
- (void)setLowBatteryCallback:(id)a3;
- (void)setUpdatedAWDLStatusCallback:(id)a3;
- (void)setUpdatedBluetoothCallback:(id)a3;
- (void)setUpdatedBluetoothStatusCallback:(id)a3;
- (void)setUpdatedFaultsCallback:(id)a3;
- (void)setUpdatedLinkTestsCallback:(id)a3;
- (void)setUpdatedNetworkStatusCallback:(id)a3;
- (void)setUpdatedPowerManagementCallback:(id)a3;
- (void)setUpdatedPowerSourceCallback:(id)a3;
- (void)setUpdatedPowerStatusCallback:(id)a3;
- (void)setUpdatedRecoveriesCallback:(id)a3;
- (void)setUpdatedWiFiCallback:(id)a3;
- (void)setUpdatedWiFiStatusCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5StatusManager

- (id)__wifi
{
  if (!self->_wifi)
  {
    v3 = -[W5WiFiInterface initWithCoreWiFiInterface:]( objc_alloc(&OBJC_CLASS___W5WiFiInterface),  "initWithCoreWiFiInterface:",  self->_corewifi);
    self->_wifi = v3;
    if (v3)
    {
      -[W5StatusManager __setupCallbacks](self, "__setupCallbacks");
      if (self->_isMonitoringEvents) {
        -[W5StatusManager startEventMonitoring](self, "startEventMonitoring");
      }
    }
  }

  return self->_wifi;
}

- (W5WiFiInterface)wifi
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100047BBC;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5WiFiInterface *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__bluetooth
{
  if (!self->_bluetooth)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___W5BluetoothController);
    self->_bluetooth = v3;
    if (-[W5BluetoothController isAvailable](v3, "isAvailable"))
    {
      -[W5StatusManager __setupCallbacks](self, "__setupCallbacks");
      if (self->_isMonitoringEvents) {
        -[W5StatusManager startEventMonitoring](self, "startEventMonitoring");
      }
    }
  }

  return self->_bluetooth;
}

- (W5BluetoothController)bluetooth
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100047D18;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5BluetoothController *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (W5StatusManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5StatusManager;
  v2 = -[W5StatusManager init](&v12, "init");
  if (!v2) {
    goto LABEL_12;
  }
  v3 = dispatch_queue_create("com.apple.wifivelocity.status", 0LL);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3) {
    goto LABEL_12;
  }
  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0LL);
  v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v2->_concurrentQueue = v4;
  if (!v4) {
    goto LABEL_12;
  }
  -[NSOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", -1LL);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v2->_eventHistory = v5;
  if (!v5) {
    goto LABEL_12;
  }
  +[CWFInterface setLogRedactionDisabled:](&OBJC_CLASS___CWFInterface, "setLogRedactionDisabled:", 1LL);
  uint64_t v6 = -[CWFInterface initWithServiceType:](objc_alloc(&OBJC_CLASS___CWFInterface), "initWithServiceType:", 1LL);
  v2->_corewifi = v6;
  -[CWFInterface resume](v6, "resume");
  v7 = objc_alloc_init(&OBJC_CLASS___W5IOPowerManagement);
  v2->_pm = v7;
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___W5IOPowerSource);
  v2->_ps = v8;
  if (v8
    && (v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary), (v2->_cachedStatusUUIDMap = v9) != 0LL)
    && ((v2->_bootArgs = (NSArray *)[sub_10008C330() copy],
         !+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled"))
     || (v10 = +[W5DatabaseManager sharedObject](&OBJC_CLASS___W5DatabaseManager, "sharedObject"),
         (v2->_databaseManager = v10) != 0LL)))
  {
    v2->_diagnosticsModeManager = 0LL;
    -[W5StatusManager __setupCallbacks](v2, "__setupCallbacks");
  }

  else
  {
LABEL_12:

    return 0LL;
  }

  return v2;
}

- (void)dealloc
{
  forceUpdateTimer = self->_forceUpdateTimer;
  if (forceUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)forceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_forceUpdateTimer);
  }

  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  if (coalesceUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)coalesceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_coalesceUpdateTimer);
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___W5StatusManager;
  -[W5StatusManager dealloc](&v6, "dealloc");
}

- (void)setUpdatedWiFiStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiStatusCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048070;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedAWDLStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedAWDLStatusCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004813C;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedNetworkStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedNetworkStatusCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048208;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedBluetoothStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothStatusCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000482D4;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedPowerStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerStatusCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000483A0;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedWiFiCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004846C;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedPowerManagementCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerManagementCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048538;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048604;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setLowBatteryCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000486D0;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedBluetoothCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004879C;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedFaultsCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedFaultsCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048868;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedLinkTestsCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048934;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedRecoveriesCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100048A00;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)queryStatusAndReply:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100048A9C;
  v4[3] = &unk_1000D1F28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)status
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048BB8;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)wifiStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048CC0;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)awdlStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048DC8;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)bluetoothStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048ECC;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)networkStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048FD0;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)powerStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000490D4;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)cachedStatusWithUUID:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = sub_100047BA0;
  uint64_t v11 = sub_100047BB0;
  uint64_t v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000491DC;
  block[3] = &unk_1000D29D0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedStatusWithUUID:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000492B0;
  v4[3] = &unk_1000D1BA8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)eventHistory
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_100047BA0;
  v10 = sub_100047BB0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000493B0;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049448;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004950C;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__forceUpdateTrigger
{
  if (!self->_forceUpdateTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    self->_forceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100049650;
    handler[3] = &unk_1000D1BF8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    forceUpdateTimer = self->_forceUpdateTimer;
    dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)forceUpdateTimer, v5, 0x2540BE400uLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_forceUpdateTimer);
  }

- (void)__updateStatusCoalesce
{
  if (!self->_coalesceUpdateTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    self->_coalesceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000497F4;
    handler[3] = &unk_1000D1BF8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    coalesceUpdateTimer = self->_coalesceUpdateTimer;
    dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer((dispatch_source_t)coalesceUpdateTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_coalesceUpdateTimer);
  }

- (int64_t)__airDropDiscoverableMode
{
  int64_t result = -[NSFileManager contentsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsAtPath:",  @"/var/mobile/Library/Preferences/com.apple.sharingd.plist");
  if (result)
  {
    id v3 = objc_msgSend( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  result,  0,  0,  0),  "objectForKey:",  @"DiscoverableMode");
    if ([v3 isEqualToString:@"Contacts Only"])
    {
      return 1LL;
    }

    else if ([v3 isEqualToString:@"Everyone"])
    {
      return 2LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)__isSnifferSupported
{
  id v2 = -[W5StatusManager __wifi](self, "__wifi");
  if (v2) {
    LOBYTE(v2) = [v2 isSnifferSupported];
  }
  return (char)v2;
}

- (id)__queryPowerStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5PowerStatus);
  objc_msgSend(v3, "setPowerSourceType:", -[W5IOPowerSource powerSourceType](self->_ps, "powerSourceType"));
  objc_msgSend(v3, "setBatteryWarningLevel:", -[W5IOPowerSource batteryWarningLevel](self->_ps, "batteryWarningLevel"));
  -[W5IOPowerSource internalBatteryLevel](self->_ps, "internalBatteryLevel");
  objc_msgSend(v3, "setInternalBatteryLevel:");
  objc_msgSend(v3, "setPowerStateCaps:", -[W5IOPowerManagement caps](self->_pm, "caps"));
  return v3;
}

- (id)__queryAWDLStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5AWDLStatus);
  id v4 = -[W5StatusManager __wifi](self, "__wifi");
  id v5 = -[CWFInterface AWDL](self->_corewifi, "AWDL");
  objc_msgSend(v3, "setMacAddress:", objc_msgSend(v5, "MACAddress"));
  objc_msgSend(v3, "setHardwareMACAddress:", objc_msgSend(v5, "hardwareMACAddress"));
  objc_msgSend(v3, "setInterfaceName:", objc_msgSend(v5, "interfaceName"));
  objc_msgSend(v3, "setPower:", objc_msgSend(v5, "powerOn"));
  objc_msgSend(v3, "setIpv6Addresses:", objc_msgSend(v5, "IPv6Addresses"));
  objc_msgSend(v3, "setIsAWDLRealTimeMode:", objc_msgSend(v4, "isAWDLRealTimeMode"));
  objc_msgSend(v3, "setAwdlSyncEnabled:", -[CWFInterface AWDLSyncEnabled](self->_corewifi, "AWDLSyncEnabled"));
  objc_msgSend(v3, "setAwdlSyncState:", -[CWFInterface AWDLSyncState](self->_corewifi, "AWDLSyncState"));
  objc_msgSend( v3,  "setAwdlSyncChannelSequence:",  -[CWFInterface AWDLSyncChannelSequence](self->_corewifi, "AWDLSyncChannelSequence"));
  objc_msgSend(v3, "setAwdlStrategy:", -[CWFInterface AWDLStrategy](self->_corewifi, "AWDLStrategy"));
  objc_msgSend( v3,  "setAwdlElectionParameters:",  -[CWFInterface AWDLElectionParameters](self->_corewifi, "AWDLElectionParameters"));
  objc_msgSend(v3, "setAwdlMasterChannel:", -[CWFInterface AWDLMasterChannel](self->_corewifi, "AWDLMasterChannel"));
  objc_msgSend( v3,  "setAwdlSecondaryMasterChannel:",  -[CWFInterface AWDLSecondaryMasterChannel](self->_corewifi, "AWDLSecondaryMasterChannel"));
  objc_msgSend(v3, "setAwdlOpMode:", -[CWFInterface AWDLOpMode](self->_corewifi, "AWDLOpMode"));
  objc_msgSend(v3, "setAwdlSyncParameters:", -[CWFInterface AWDLSyncParameters](self->_corewifi, "AWDLSyncParameters"));
  objc_msgSend( v3,  "setAwdlSidecarDiagnostics:",  -[CWFInterface AWDLSidecarDiagnostics](self->_corewifi, "AWDLSidecarDiagnostics"));
  objc_msgSend( v3,  "setAirDropDiscoverableMode:",  -[W5StatusManager __airDropDiscoverableMode](self, "__airDropDiscoverableMode"));
  return v3;
}

- (id)__queryBluetoothStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5BluetoothStatus);
  id v4 = -[W5StatusManager __bluetooth](self, "__bluetooth");
  objc_msgSend(v3, "setAddress:", objc_msgSend(v4, "address"));
  objc_msgSend(v3, "setPowerOn:", objc_msgSend(v4, "powerOn"));
  objc_msgSend(v3, "setIsDiscoverable:", objc_msgSend(v4, "isDiscoverable"));
  objc_msgSend(v3, "setIsConnectable:", objc_msgSend(v4, "isConnectable"));
  objc_msgSend(v3, "setIsScanning:", objc_msgSend(v4, "isScanning"));
  objc_msgSend(v3, "setDevices:", objc_msgSend(v4, "devices"));
  return v3;
}

- (id)__queryNetworkStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5NetworkStatus);
  objc_msgSend( v3,  "setPrimaryIPv4InterfaceName:",  -[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  objc_msgSend( v3,  "setPrimaryIPv4ServiceName:",  -[CWFInterface globalIPv4NetworkServiceName](self->_corewifi, "globalIPv4NetworkServiceName"));
  objc_msgSend( v3,  "setPrimaryIPv4ServiceID:",  -[CWFInterface globalIPv4NetworkServiceID](self->_corewifi, "globalIPv4NetworkServiceID"));
  objc_msgSend( v3,  "setPrimaryIPv6InterfaceName:",  -[CWFInterface globalIPv6InterfaceName](self->_corewifi, "globalIPv6InterfaceName"));
  objc_msgSend( v3,  "setPrimaryIPv6ServiceName:",  -[CWFInterface globalIPv6NetworkServiceName](self->_corewifi, "globalIPv6NetworkServiceName"));
  objc_msgSend( v3,  "setPrimaryIPv6ServiceID:",  -[CWFInterface globalIPv6NetworkServiceID](self->_corewifi, "globalIPv6NetworkServiceID"));
  objc_msgSend( v3,  "setPrimaryIPv4Addresses:",  -[CWFInterface globalIPv4Addresses](self->_corewifi, "globalIPv4Addresses"));
  objc_msgSend( v3,  "setPrimaryIPv6Addresses:",  -[CWFInterface globalIPv6Addresses](self->_corewifi, "globalIPv6Addresses"));
  objc_msgSend( v3,  "setPrimaryIPv4Router:",  -[CWFInterface globalIPv4RouterAddress](self->_corewifi, "globalIPv4RouterAddress"));
  objc_msgSend( v3,  "setPrimaryIPv4Router:",  -[CWFInterface globalIPv6RouterAddress](self->_corewifi, "globalIPv6RouterAddress"));
  objc_msgSend( v3,  "setPrimaryDNSAddresses:",  -[CWFInterface globalDNSServerAddresses](self->_corewifi, "globalDNSServerAddresses"));
  objc_msgSend(v3, "setIsAppleReachable:", -[CWFInterface reachabilityFlags](self->_corewifi, "reachabilityFlags"));
  return v3;
}

- (id)__queryDiagnosticsModes
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = -[NSArray filteredArrayUsingPredicate:]( -[W5DiagnosticsModeManager allDiagnostics](self->_diagnosticsModeManager, "allDiagnostics"),  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.state >= %d AND SELF.state <= %d",  3LL,  10LL));
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = [v9 timestampFor:3];
        if (v10
          && -[NSDateComponents day]( -[NSCalendar components:fromDate:toDate:options:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "components:fromDate:toDate:options:",  16LL,  v10,  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  0LL),  "day") <= 7)
        {
          [v3 addObject:v9];
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)__queryWiFiStatusIncludingScanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___W5WiFiStatus);
  id v6 = -[W5StatusManager __wifi](self, "__wifi");
  objc_msgSend(v5, "setMacAddress:", -[CWFInterface MACAddress](self->_corewifi, "MACAddress"));
  objc_msgSend(v5, "setHardwareMACAddress:", -[CWFInterface hardwareMACAddress](self->_corewifi, "hardwareMACAddress"));
  objc_msgSend(v5, "setCapabilities:", -[CWFInterface capabilities](self->_corewifi, "capabilities"));
  objc_msgSend(v5, "setInterfaceName:", -[CWFInterface interfaceName](self->_corewifi, "interfaceName"));
  objc_msgSend(v5, "setPowerOn:", -[CWFInterface powerOn](self->_corewifi, "powerOn"));
  objc_msgSend(v5, "setPower:", -[CWFInterface powerState](self->_corewifi, "powerState"));
  objc_msgSend(v5, "setOpMode:", -[CWFInterface opMode](self->_corewifi, "opMode"));
  objc_msgSend(v5, "setSsid:", -[CWFInterface SSID](self->_corewifi, "SSID"));
  objc_msgSend(v5, "setEapolControlMode:", -[CWFInterface EAP8021XControlMode](self->_corewifi, "EAP8021XControlMode"));
  objc_msgSend( v5,  "setEapolSupplicantState:",  -[CWFInterface EAP8021XSupplicantState](self->_corewifi, "EAP8021XSupplicantState"));
  objc_msgSend(v5, "setSsidString:", -[CWFInterface networkName](self->_corewifi, "networkName"));
  objc_msgSend(v5, "setBssid:", -[CWFInterface BSSID](self->_corewifi, "BSSID"));
  objc_msgSend(v5, "setSecurity:", objc_msgSend(v6, "security"));
  -[CWFInterface txRate](self->_corewifi, "txRate");
  objc_msgSend(v5, "setTxRate:");
  objc_msgSend(v5, "setRssi:", -[CWFInterface RSSI](self->_corewifi, "RSSI"));
  objc_msgSend(v5, "setCca:", -[CWFInterface CCA](self->_corewifi, "CCA"));
  objc_msgSend(v5, "setNoise:", -[CWFInterface noise](self->_corewifi, "noise"));
  objc_msgSend(v5, "setPhyMode:", -[CWFInterface PHYMode](self->_corewifi, "PHYMode"));
  objc_msgSend(v5, "setChannel:", objc_msgSend(v6, "channel"));
  objc_msgSend(v5, "setLinkQualityUpdates:", objc_msgSend(v6, "linkQualityUpdates"));
  objc_msgSend(v5, "setSupportedChannels:", objc_msgSend(v6, "supportedChannels"));
  objc_msgSend(v5, "setCountryCode:", -[CWFInterface countryCode](self->_corewifi, "countryCode"));
  objc_msgSend(v5, "setMcsIndex:", -[CWFInterface MCSIndex](self->_corewifi, "MCSIndex"));
  objc_msgSend(v5, "setGuardInterval:", -[CWFInterface guardInterval](self->_corewifi, "guardInterval"));
  objc_msgSend( v5,  "setNumberOfSpacialStreams:",  -[CWFInterface numberOfSpatialStreams](self->_corewifi, "numberOfSpatialStreams"));
  objc_msgSend(v5, "setNetworkServiceID:", -[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  objc_msgSend(v5, "setIpv4ConfigMethod:", objc_msgSend(v6, "ipv4ConfigMethod"));
  objc_msgSend(v5, "setIpv6ConfigMethod:", objc_msgSend(v6, "ipv6ConfigMethod"));
  objc_msgSend(v5, "setIpv4Addresses:", -[CWFInterface IPv4Addresses](self->_corewifi, "IPv4Addresses"));
  objc_msgSend(v5, "setIpv4RouterAddress:", -[CWFInterface IPv4RouterAddress](self->_corewifi, "IPv4RouterAddress"));
  objc_msgSend(v5, "setIpv6Addresses:", -[CWFInterface IPv6Addresses](self->_corewifi, "IPv6Addresses"));
  objc_msgSend(v5, "setIpv6RouterAddress:", -[CWFInterface IPv6RouterAddress](self->_corewifi, "IPv6RouterAddress"));
  objc_msgSend(v5, "setDnsAddresses:", -[CWFInterface DNSServerAddresses](self->_corewifi, "DNSServerAddresses"));
  objc_msgSend(v5, "setLastJoinedScanResult:", objc_msgSend(v6, "currentNetwork"));
  objc_msgSend(v5, "setLastJoinedPreferredNetwork:", objc_msgSend(v6, "currentPreferredNetwork"));
  objc_msgSend(v5, "setSmartCCADesenseSupported:", objc_msgSend(v6, "smartCCADesenseSupported"));
  objc_msgSend(v5, "setSmartCCADesenseUSBPresence:", objc_msgSend(v6, "smartCCADesenseUSBPresence"));
  objc_msgSend(v5, "setIsSnifferSupported:", -[W5StatusManager __isSnifferSupported](self, "__isSnifferSupported"));
  if (v3) {
    objc_msgSend(v5, "setCachedScanResults:", objc_msgSend(v6, "scanCache:", 1));
  }
  return v5;
}

- (id)__queryLastHourFaultsStatus
{
  return  objc_msgSend( [W5SummaryFaults alloc],  "initWithSummaryFaults:",  -[W5DatabaseManager fetchLastHourFaults](self->_databaseManager, "fetchLastHourFaults"));
}

- (id)__queryLastHourLinkTestsStatus
{
  return  objc_msgSend( [W5SummaryLinkTests alloc],  "initWithSummaryLinkTests:",  -[W5DatabaseManager fetchLastHourLinkTests](self->_databaseManager, "fetchLastHourLinkTests"));
}

- (id)__queryLastHourRecoveriesStatus
{
  return  objc_msgSend( [W5SummaryRecoveries alloc],  "initWithSummaryRecoveries:",  -[W5DatabaseManager fetchLastHourRecoveries](self->_databaseManager, "fetchLastHourRecoveries"));
}

- (id)__queryStatusIncludingWiFiScanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___W5Status);
  -[W5Status setWifi:]( v5,  "setWifi:",  -[W5StatusManager __queryWiFiStatusIncludingScanCache:](self, "__queryWiFiStatusIncludingScanCache:", v3));
  -[W5Status setAwdl:](v5, "setAwdl:", -[W5StatusManager __queryAWDLStatus](self, "__queryAWDLStatus"));
  -[W5Status setBluetooth:]( v5,  "setBluetooth:",  -[W5StatusManager __queryBluetoothStatus](self, "__queryBluetoothStatus"));
  -[W5Status setNetwork:](v5, "setNetwork:", -[W5StatusManager __queryNetworkStatus](self, "__queryNetworkStatus"));
  -[W5Status setDiagnosticsModes:]( v5,  "setDiagnosticsModes:",  -[W5StatusManager __queryDiagnosticsModes](self, "__queryDiagnosticsModes"));
  -[W5Status setPower:](v5, "setPower:", -[W5StatusManager __queryPowerStatus](self, "__queryPowerStatus"));
  -[W5Status setLastHrFaults:]( v5,  "setLastHrFaults:",  -[W5StatusManager __queryLastHourFaultsStatus](self, "__queryLastHourFaultsStatus"));
  -[W5Status setLastHrLinkTests:]( v5,  "setLastHrLinkTests:",  -[W5StatusManager __queryLastHourLinkTestsStatus](self, "__queryLastHourLinkTestsStatus"));
  -[W5Status setLastHrRecoveries:]( v5,  "setLastHrRecoveries:",  -[W5StatusManager __queryLastHourRecoveriesStatus](self, "__queryLastHourRecoveriesStatus"));
  return v5;
}

- (void)__updateStatus
{
  id v3 = -[W5StatusManager __queryStatusIncludingWiFiScanCache:](self, "__queryStatusIncludingWiFiScanCache:", 0LL);
  if ((-[W5Status isEqual:](self->_updateStatus, "isEqual:", v3) & 1) == 0)
  {
    if ((objc_msgSend( -[W5Status wifi](self->_updateStatus, "wifi"),  "isEqual:",  objc_msgSend(v3, "wifi")) & 1) == 0 && self->_updatedWiFiStatusCallback)
    {
      id v4 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 856;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) WiFi status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      id v5 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v5, "setEventID:", 1LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v5, "setTimestamp:");
      v35 = @"WiFiStatus";
      id v36 = [v3 wifi];
      -[W5Event setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      (*((void (**)(void))self->_updatedWiFiStatusCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status awdl](self->_updateStatus, "awdl"),  "isEqual:",  objc_msgSend(v3, "awdl")) & 1) == 0 && self->_updatedAWDLStatusCallback)
    {
      id v6 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 868;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) AWDL status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v7, "setEventID:", 2LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v7, "setTimestamp:");
      v33 = @"AWDLStatus";
      id v34 = [v3 awdl];
      -[W5Event setInfo:]( v7,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
      (*((void (**)(void))self->_updatedAWDLStatusCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status network](self->_updateStatus, "network"),  "isEqual:",  objc_msgSend(v3, "network")) & 1) == 0 && self->_updatedNetworkStatusCallback)
    {
      uint64_t v8 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 880;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) Network status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v9, "setEventID:", 4LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v9, "setTimestamp:");
      v31 = @"NetworkStatus";
      id v32 = [v3 network];
      -[W5Event setInfo:]( v9,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      (*((void (**)(void))self->_updatedNetworkStatusCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status bluetooth](self->_updateStatus, "bluetooth"),  "isEqual:",  objc_msgSend(v3, "bluetooth")) & 1) == 0 && self->_updatedBluetoothStatusCallback)
    {
      id v10 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 892;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Bluetooth status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v11, "setEventID:", 3LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v11, "setTimestamp:");
      v29 = @"BluetoothStatus";
      id v30 = [v3 bluetooth];
      -[W5Event setInfo:]( v11,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      (*((void (**)(void))self->_updatedBluetoothStatusCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status power](self->_updateStatus, "power"),  "isEqual:",  objc_msgSend(v3, "power")) & 1) == 0 && self->_updatedPowerStatusCallback)
    {
      __int128 v12 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 904;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Power status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      __int128 v13 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v13, "setEventID:", 5LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v13, "setTimestamp:");
      v27 = @"PowerStatus";
      id v28 = [v3 power];
      -[W5Event setInfo:]( v13,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      (*((void (**)(void))self->_updatedPowerStatusCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status lastHrFaults](self->_updateStatus, "lastHrFaults"),  "isEqual:",  objc_msgSend(v3, "lastHrFaults")) & 1) == 0 && self->_updatedFaultsCallback)
    {
      __int128 v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 916;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Last Hour Faults status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      __int128 v15 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v15, "setEventID:", 39LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v15, "setTimestamp:");
      v25 = @"LastHourFaultsStatus";
      id v26 = [v3 lastHrFaults];
      -[W5Event setInfo:]( v15,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      (*((void (**)(void))self->_updatedFaultsCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status lastHrLinkTests](self->_updateStatus, "lastHrLinkTests"),  "isEqual:",  objc_msgSend(v3, "lastHrLinkTests")) & 1) == 0 && self->_updatedLinkTestsCallback)
    {
      v16 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 928;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Last Hour Link Tests status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      v17 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v17, "setEventID:", 40LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v17, "setTimestamp:");
      v23 = @"LastHourLinkTestsStatus";
      id v24 = [v3 lastHrLinkTests];
      -[W5Event setInfo:]( v17,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      (*((void (**)(void))self->_updatedLinkTestsCallback + 2))();
    }

    if ((objc_msgSend( -[W5Status lastHrRecoveries](self->_updateStatus, "lastHrRecoveries"),  "isEqual:",  objc_msgSend(v3, "lastHrRecoveries")) & 1) == 0 && self->_updatedRecoveriesCallback)
    {
      v18 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        __int16 v39 = 2080;
        v40 = "W5StatusManager.m";
        __int16 v41 = 1024;
        int v42 = 940;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Last Hour Recoveries status has changed, notifying clients",  (const char *)&v37,  v20,  (_DWORD)v21);
      }

      v19 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v19, "setEventID:", 41LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v19, "setTimestamp:");
      v21 = @"LastHourRecoveriesStatus";
      id v22 = [v3 lastHrRecoveries];
      -[W5Event setInfo:]( v19,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      (*((void (**)(void))self->_updatedRecoveriesCallback + 2))();
    }

    self->_updateStatus = (W5Status *)[v3 copy];
  }

- (void)__addEvent:(id)a3
{
}

- (void)addEvent:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004AF28;
  v4[3] = &unk_1000D1BA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)__setupCallbacks
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004B0C4;
  v10[3] = &unk_1000D29F8;
  v10[4] = self;
  -[W5WiFiInterface setUpdatedWiFiCallback:](self->_wifi, "setUpdatedWiFiCallback:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004B16C;
  v9[3] = &unk_1000D29F8;
  v9[4] = self;
  -[W5BluetoothController setUpdatedBluetoothCallback:](self->_bluetooth, "setUpdatedBluetoothCallback:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004B214;
  v8[3] = &unk_1000D29F8;
  v8[4] = self;
  -[W5IOPowerManagement setUpdatedPowerManagementCallback:](self->_pm, "setUpdatedPowerManagementCallback:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004B2BC;
  v7[3] = &unk_1000D29F8;
  v7[4] = self;
  -[W5IOPowerSource setUpdatedPowerSourceCallback:](self->_ps, "setUpdatedPowerSourceCallback:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004B364;
  v6[3] = &unk_1000D29F8;
  v6[4] = self;
  -[W5IOPowerSource setLowBatteryCallback:](self->_ps, "setLowBatteryCallback:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004B40C;
  v5[3] = &unk_1000D29F8;
  v5[4] = self;
  -[W5DatabaseManager setUpdatedFaultsCallback:](self->_databaseManager, "setUpdatedFaultsCallback:", v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B4B4;
  v4[3] = &unk_1000D29F8;
  v4[4] = self;
  -[W5DatabaseManager setUpdatedLinkTestsCallback:](self->_databaseManager, "setUpdatedLinkTestsCallback:", v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004B55C;
  v3[3] = &unk_1000D29F8;
  v3[4] = self;
  -[W5DatabaseManager setUpdatedRecoveriesCallback:](self->_databaseManager, "setUpdatedRecoveriesCallback:", v3);
}

- (CWFInterface)corewifi
{
  return (CWFInterface *)objc_getProperty(self, a2, 80LL, 1);
}

- (W5WiFiInterface)awdl
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 64LL, 1);
}

- (W5WiFiInterface)nan
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 72LL, 1);
}

- (W5IOPowerManagement)pm
{
  return (W5IOPowerManagement *)objc_getProperty(self, a2, 104LL, 1);
}

- (W5IOPowerSource)ps
{
  return (W5IOPowerSource *)objc_getProperty(self, a2, 112LL, 1);
}

- (W5DatabaseManager)databaseManager
{
  return (W5DatabaseManager *)objc_getProperty(self, a2, 120LL, 1);
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return (W5DiagnosticsModeManager *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setDiagnosticsModeManager:(id)a3
{
}

- (id)updatedWiFiStatusCallback
{
  return self->_updatedWiFiStatusCallback;
}

- (id)updatedAWDLStatusCallback
{
  return self->_updatedAWDLStatusCallback;
}

- (id)updatedNetworkStatusCallback
{
  return self->_updatedNetworkStatusCallback;
}

- (id)updatedBluetoothStatusCallback
{
  return self->_updatedBluetoothStatusCallback;
}

- (id)updatedPowerStatusCallback
{
  return self->_updatedPowerStatusCallback;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

- (id)updatedPowerManagementCallback
{
  return self->_updatedPowerManagementCallback;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (NSOperationQueue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

@end