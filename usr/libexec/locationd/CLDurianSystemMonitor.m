@interface CLDurianSystemMonitor
- (BOOL)valid;
- (CLDurianSystemMonitor)init;
- (CLDurianSystemMonitor)initWithUniverse:(id)a3;
- (CLDurianSystemMonitorDelegate)delegate;
- (CLIntersiloUniverse)universe;
- (id).cxx_construct;
- (id)_onDataProtectionNotification:(int)a3 data:(uint64_t)a4;
- (int)coexImpactState;
- (void)_checkAudioStreamState;
- (void)_onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)_onDaemonStatusNotification:(int)a3 data:(uint64_t)a4;
- (void)_onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)_recomputeCoexImpactedStateAndNotifyClients;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)fetchLOIVisitAtStart;
- (void)onVehicleStateNotification;
- (void)onVisit:(id)a3;
- (void)registerForVehicleStateNotification;
- (void)setDelegate:(id)a3;
- (void)setUniverse:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)unregisterForVehicleStateNotification;
@end

@implementation CLDurianSystemMonitor

- (CLDurianSystemMonitor)init
{
  return 0LL;
}

- (CLDurianSystemMonitor)initWithUniverse:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLDurianSystemMonitor;
  v4 = -[CLDurianSystemMonitor init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    -[CLDurianSystemMonitor setUniverse:](v4, "setUniverse:", a3);
    v5->_vehicleStateProxy = 0LL;
    -[CLDurianSystemMonitor _registerForNotifications](v5, "_registerForNotifications");
    dispatch_time_t v6 = dispatch_time(0LL, 500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10106AAD0;
    block[3] = &unk_10181A288;
    block[4] = v5;
    dispatch_after(v6, &_dispatch_main_q, block);
    -[CLDurianSystemMonitor fetchLOIVisitAtStart](v5, "fetchLOIVisitAtStart");
    -[CLDurianSystemMonitor setValid:](v5, "setValid:", 1LL);
  }

  return v5;
}

- (void)dealloc
{
  -[CLDurianSystemMonitor _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDurianSystemMonitor;
  -[CLDurianSystemMonitor dealloc](&v3, "dealloc");
}

- (int)coexImpactState
{
  return self->_isCoexImpacted;
}

- (void)_recomputeCoexImpactedStateAndNotifyClients
{
  int isCoexImpacted = self->_isCoexImpacted;
  self->_int isCoexImpacted = self->_btStreaming | (2 * self->_wifiNetworkCritical) | (4 * self->_isAssociatedTo2GHzWiFi);
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_1018985B0);
  }
  v4 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = self->_isCoexImpacted;
    BOOL btStreaming = self->_btStreaming;
    BOOL wifiNetworkCritical = self->_wifiNetworkCritical;
    BOOL isAssociatedTo2GHzWiFi = self->_isAssociatedTo2GHzWiFi;
    v9[0] = 68290306;
    v9[1] = 0;
    __int16 v10 = 2082;
    v11 = "";
    __int16 v12 = 1026;
    int v13 = v5;
    __int16 v14 = 1026;
    BOOL v15 = btStreaming;
    __int16 v16 = 1026;
    BOOL v17 = wifiNetworkCritical;
    __int16 v18 = 1026;
    BOOL v19 = isAssociatedTo2GHzWiFi;
    __int16 v20 = 1026;
    int v21 = isCoexImpacted;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system coex, state:%{public}d, btaudio:%{public}d, wifiNetworkCritical :%{public}d, isAssociatedTo2GHzWiFi:%{public}d, prior:%{public}d}",  (uint8_t *)v9,  0x30u);
  }

  if (isCoexImpacted != self->_isCoexImpacted) {
    -[CLDurianSystemMonitorDelegate systemCoexImpact:toState:]( -[CLDurianSystemMonitor delegate](self, "delegate"),  "systemCoexImpact:toState:",  self,  self->_isCoexImpacted);
  }
}

- (void)_checkAudioStreamState
{
  uint64_t state64 = 42LL;
  if (notify_get_state(self->_audioStreamNotificationToken, &state64))
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    objc_super v3 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#durian #system failed to get audio stream state}",  buf,  0x12u);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985B0);
      }
    }

    v4 = (os_log_s *)qword_101934848;
    if (os_signpost_enabled((os_log_t)qword_101934848))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#durian #system failed to get audio stream state",  "{msg%{public}.0s:#durian #system failed to get audio stream state}",  buf,  0x12u);
    }
  }

  else
  {
    if (state64 <= 1) {
      self->_BOOL btStreaming = state64;
    }
    -[CLDurianSystemMonitor _recomputeCoexImpactedStateAndNotifyClients]( self,  "_recomputeCoexImpactedStateAndNotifyClients");
  }

- (void)_registerForNotifications
{
  objc_super v3 = v21;
  int v21 = 0LL;
  value = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    int v5 = v21;
    int v21 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:16 registrationInfo:0];
  sub_10034FF34((uint64_t)sub_10106B1C0, (uint64_t)self, -[CLDurianSystemMonitor universe](self, "universe"), &v21);
  dispatch_time_t v6 = v21;
  int v21 = 0LL;
  int v7 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    __int16 v8 = v21;
    int v21 = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:13 registrationInfo:0];
  [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  sub_100ACD980((uint64_t)sub_10106B2B8, (uint64_t)self, -[CLDurianSystemMonitor universe](self, "universe"), &v21);
  objc_super v9 = v21;
  int v21 = 0LL;
  __int16 v10 = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = v9;
  if (v10)
  {
    (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
    v11 = v21;
    int v21 = 0LL;
    if (v11) {
      (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    }
  }

  [*((id *)self->_dataProtectionClient.__ptr_.__value_ + 2) register:*((void *)self->_dataProtectionClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10106B2CC;
  v20[3] = &unk_10182D2A0;
  v20[4] = self;
  notify_register_dispatch( "com.apple.bluetooth.audio-stream",  &self->_audioStreamNotificationToken,  (dispatch_queue_t)objc_msgSend( -[CLIntersiloUniverse silo](-[CLDurianSystemMonitor universe](self, "universe"), "silo"),  "queue"),  v20);
  __int16 v12 = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  self->_wifiManager = v12;
  if (v12)
  {
    int v13 = (const __CFArray *)WiFiManagerClientCopyDevices(v12);
    ValueAtIndex = CFArrayGetValueAtIndex(v13, 0LL);
    if (ValueAtIndex) {
      WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback(ValueAtIndex, nullsub_1274, 0LL);
    }
    if (v13) {
      CFRelease(v13);
    }
  }

  BOOL v15 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](self->_universe, "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
  self->_routineMonitor = v15;
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v15,  "registerDelegate:inSilo:",  self,  -[CLIntersiloUniverse silo](self->_universe, "silo"));
  -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( self->_routineMonitor,  "setDelegateEntityName:",  "CLDurianSystemMonitor");
  -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:]( self->_routineMonitor,  "startLeechingVisitsForClient:",  self);
  -[CLDurianSystemMonitor registerForVehicleStateNotification](self, "registerForVehicleStateNotification");
  __int16 v16 = self->_bluetoothServiceClient.__ptr_.__value_;
  if (!v16)
  {
    sub_1008F15C8((uint64_t)sub_10106B2D8, (uint64_t)self, -[CLDurianSystemMonitor universe](self, "universe"), &v21);
    BOOL v17 = v21;
    int v21 = 0LL;
    __int16 v18 = self->_bluetoothServiceClient.__ptr_.__value_;
    self->_bluetoothServiceClient.__ptr_.__value_ = v17;
    if (v18)
    {
      (*(void (**)(Client *))(*(void *)v18 + 8LL))(v18);
      BOOL v19 = v21;
      int v21 = 0LL;
      if (v19) {
        (*(void (**)(Client *))(*(void *)v19 + 8LL))(v19);
      }
    }

    __int16 v16 = self->_bluetoothServiceClient.__ptr_.__value_;
  }

  [*((id *)v16 + 2) register:*((void *)v16 + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
  [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:11 registrationInfo:0];
}

- (void)_unregisterForNotifications
{
  self->_wifiManager = 0LL;
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( self->_routineMonitor,  "stopLeechingVisitsForClient:",  self);
  -[CLDurianSystemMonitor unregisterForVehicleStateNotification](self, "unregisterForVehicleStateNotification");
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:5];
    [*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_bluetoothServiceClient.__ptr_.__value_ + 1) forNotification:11];
  }

- (void)_onDaemonStatusNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 > 5)
  {
    if (a3 == 6)
    {
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985B0);
      }
      __int16 v10 = (os_log_s *)qword_101934848;
      if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(a4 + 4);
        int v14 = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        BOOL v17 = "";
        __int16 v18 = 1026;
        int v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system, reach:%{public}d}",  (uint8_t *)&v14,  0x18u);
      }

      objc_msgSend(objc_msgSend(a1, "delegate"), "systemConnectivity:isConnected:", a1, *(_DWORD *)(a4 + 4) != 0);
    }

    else
    {
      if (a3 != 16)
      {
LABEL_26:
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985B0);
        }
        __int16 v12 = (os_log_s *)qword_101934848;
        if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_FAULT))
        {
          int v14 = 68289282;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          __int16 v18 = 1026;
          int v19 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#durian #system unexpected status, notification:%{public}d}",  (uint8_t *)&v14,  0x18u);
          if (qword_101934840 != -1) {
            dispatch_once(&qword_101934840, &stru_1018985B0);
          }
        }

        int v13 = (os_log_s *)qword_101934848;
        if (os_signpost_enabled((os_log_t)qword_101934848))
        {
          int v14 = 68289282;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          __int16 v18 = 1026;
          int v19 = a3;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#durian #system unexpected status",  "{msg%{public}.0s:#durian #system unexpected status, notification:%{public}d}",  (uint8_t *)&v14,  0x18u);
        }

        return;
      }

      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985B0);
      }
      int v7 = (os_log_s *)qword_101934848;
      if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        BOOL v17 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system metricheartbeat}",  (uint8_t *)&v14,  0x12u);
      }

      objc_msgSend(objc_msgSend(a1, "delegate"), "systemMetricHeartbeat");
    }
  }

  else
  {
    if (a3 != 2)
    {
      if (a3 == 3)
      {
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985B0);
        }
        dispatch_time_t v6 = (os_log_s *)qword_101934848;
        if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          BOOL v17 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system waking}",  (uint8_t *)&v14,  0x12u);
        }

        objc_msgSend(objc_msgSend(a1, "delegate"), "systemWaking:atTime:", a1, CFAbsoluteTimeGetCurrent());
        return;
      }

      goto LABEL_26;
    }

    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    __int16 v8 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      BOOL v17 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system will sleep}",  (uint8_t *)&v14,  0x12u);
    }

    objc_msgSend(objc_msgSend(a1, "delegate"), "systemWillSleep:", a1);
  }

- (void)_onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 6)
  {
    v7 = *(_BYTE *)(a4 + 96) && (int v6 = *(_DWORD *)(a4 + 48), v6 >= 1) && sub_10099EDC8(v6);
    a1[56] = v7;
    goto LABEL_17;
  }

  if (a3 == 13)
  {
    a1[49] = *(_BYTE *)(a4 + 139);
LABEL_17:
    [a1 _recomputeCoexImpactedStateAndNotifyClients];
    return;
  }

  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_1018985B0);
  }
  __int16 v8 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_FAULT))
  {
    int v10 = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 1026;
    int v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#durian #system unexpected wifi, notification:%{public}d}",  (uint8_t *)&v10,  0x18u);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
  }

  objc_super v9 = (os_log_s *)qword_101934848;
  if (os_signpost_enabled((os_log_t)qword_101934848))
  {
    int v10 = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 1026;
    int v15 = a3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#durian #system unexpected wifi",  "{msg%{public}.0s:#durian #system unexpected wifi, notification:%{public}d}",  (uint8_t *)&v10,  0x18u);
  }

- (void)_onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 11 || a3 == 5)
  {
    int v11 = (void *)(a4 + 16);
    __int16 v12 = -[NSString stringByReplacingOccurrencesOfString:withString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11),  "stringByReplacingOccurrencesOfString:withString:",  @":",  &stru_1018A4B00);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    int v13 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system received bluetooth disconnect event, deviceAddress:%{public, locati on:escape_only}@}",  buf,  0x1Cu);
    }

    id v8 = [a1 delegate];
    objc_super v9 = v12;
    uint64_t v10 = 2LL;
    goto LABEL_18;
  }

  if (a3 == 4)
  {
    int v5 = (void *)(a4 + 16);
    int v6 = -[NSString stringByReplacingOccurrencesOfString:withString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5),  "stringByReplacingOccurrencesOfString:withString:",  @":",  &stru_1018A4B00);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    BOOL v7 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2114;
      v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system received bluetooth connect event, deviceAddress:%{public, location:escape_only}@}",  buf,  0x1Cu);
    }

    id v8 = [a1 delegate];
    objc_super v9 = v6;
    uint64_t v10 = 1LL;
LABEL_18:
    [v8 updateDeviceConnectionState:v9 state:v10];
    return;
  }

  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_1018985B0);
  }
  __int16 v14 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "#durian #system, received unhandled bluetooth service notification",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    v17[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934848,  16LL,  "#durian #system, received unhandled bluetooth service notification",  v17,  2);
    __int16 v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLDurianSystemMonitor _onBluetoothServiceNotification:data:]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

- (void)onVisit:(id)a3
{
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_1018985B0);
  }
  int v5 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289538;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2050;
    id v10 = objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType");
    __int16 v11 = 1026;
    unsigned int v12 = [a3 hasDepartureDate] ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#durian #system visit, loitype:%{public}ld, entry:%{public}hhd}",  (uint8_t *)v6,  0x22u);
  }

  -[CLDurianSystemMonitorDelegate updateSystemLoiType:isEntry:]( -[CLDurianSystemMonitor delegate](self, "delegate"),  "updateSystemLoiType:isEntry:",  objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType"),  objc_msgSend(a3, "hasDepartureDate") ^ 1);
}

- (void)fetchLOIVisitAtStart
{
  id v3 = objc_alloc(&OBJC_CLASS___RTStoredVisitFetchOptions);
  id v4 = objc_msgSend( v3,  "initWithAscending:confidence:dateInterval:labelVisit:limit:",  0,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh),  0,  1,  &off_1018D51B0);
  routineMonitor = self->_routineMonitor;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10106C00C;
  v6[3] = &unk_10181A2B0;
  v6[4] = self;
  -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:]( routineMonitor,  "fetchStoredVisitsWithOptions:withReply:",  v4,  v6);
}

- (id)_onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 1)
  {
    char v4 = BYTE4(a4);
    int v5 = result;
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985B0);
    }
    int v6 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      int v11 = v4 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "#durian received keybag unlock notification state:%{private}d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985B0);
      }
      v9[0] = 67174657;
      v9[1] = v4 & 1;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934848,  2LL,  "#durian received keybag unlock notification state:%{private}d",  v9,  8);
      id v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDurianSystemMonitor _onDataProtectionNotification:data:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }

    return objc_msgSend(objc_msgSend(v5, "delegate"), "onFirstUnlock");
  }

  return result;
}

- (void)registerForVehicleStateNotification
{
  if (objc_msgSend( -[CLIntersiloUniverse vendor](-[CLDurianSystemMonitor universe](self, "universe"), "vendor"),  "isServiceEnabled:",  @"CLVehicleStateNotifier")
    && !self->_vehicleStateProxy)
  {
    id v3 = (CLVehicleStateNotifierProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor]( -[CLDurianSystemMonitor universe](self, "universe"),  "vendor"),  "proxyForService:",  @"CLVehicleStateNotifier");
    self->_vehicleStateProxy = v3;
    -[CLVehicleStateNotifierProtocol registerDelegate:inSilo:]( v3,  "registerDelegate:inSilo:",  self,  -[CLIntersiloUniverse silo](self->_universe, "silo"));
    -[CLVehicleStateNotifierProtocol setDelegateEntityName:]( self->_vehicleStateProxy,  "setDelegateEntityName:",  "CLDurianSystemMonitor");
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10106C628;
  handler[3] = &unk_10182D2A0;
  handler[4] = self;
  notify_register_dispatch( (const char *)[kCMVehicularStateChangedNotification UTF8String],  &self->_vehicularToken,  (dispatch_queue_t)objc_msgSend( -[CLIntersiloUniverse silo](-[CLDurianSystemMonitor universe](self, "universe"), "silo"),  "queue"),  handler);
}

- (void)unregisterForVehicleStateNotification
{
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }

  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0LL;
  }

- (void)onVehicleStateNotification
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2020000000LL;
  char v5 = 0;
  vehicleStateProxy = self->_vehicleStateProxy;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10106C738;
  v3[3] = &unk_101898590;
  v3[4] = self;
  v3[5] = v4;
  -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsAndOperatorStateWithReply:]( vehicleStateProxy,  "fetchVehicularDndStateAndHintsAndOperatorStateWithReply:",  v3);
  _Block_object_dispose(v4, 8);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLDurianSystemMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianSystemMonitorDelegate *)a3;
}

- (CLIntersiloUniverse)universe
{
  return (CLIntersiloUniverse *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setUniverse:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  char v4 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  char v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  int v6 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end