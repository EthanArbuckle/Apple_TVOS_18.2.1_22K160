@interface OSDBluetooth
- (BOOL)_setBluetoothPower:(BTLocalDeviceImpl *)a3 enabled:(BOOL)a4 timeout:(double)a5;
- (BOOL)_setupBluetoothSessionAndDevice:(id *)a3;
- (BOOL)setBluetoothPowerOn:(BOOL)a3;
- (BOOL)started;
- (BOOL)stopped;
- (BTSessionImpl)session;
- (NSMutableArray)devices;
- (OSDBluetooth)init;
- (OS_dispatch_semaphore)statusSema;
- (id)performBluetoothScanWithTimeout:(double)a3 foundDevices:(id)a4;
- (int)_bluetoothPower:(BTLocalDeviceImpl *)a3 isEnabled:(BOOL *)a4;
- (void)_teardownBluetoothSessionAndDevice;
- (void)performScanOnQueue:(id)a3 timeout:(double)a4 gracePeriod:(double)a5 completionBlock:(id)a6;
- (void)setDevices:(id)a3;
- (void)setSession:(BTSessionImpl *)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStatusSema:(id)a3;
- (void)setStopped:(BOOL)a3;
@end

@implementation OSDBluetooth

- (OSDBluetooth)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSDBluetooth;
  v2 = -[OSDBluetooth init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create( (const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String],  0);
    btQueue = v2->_btQueue;
    v2->_btQueue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    statusSema = v2->_statusSema;
    v2->_statusSema = (OS_dispatch_semaphore *)v5;

    v2->_attachDetachCallback.sessionEvent = sub_1000036DC;
    v2->_discoveryCallbacks.statusEvent = sub_1000038D0;
    v2->_discoveryCallbacks.discoveryEvent = sub_100003A3C;
    v2->_localDeviceCallbacks.statusEvent = sub_100003CCC;
    v2->_localDeviceCallbacks.leTestStopped = 0LL;
    v2->_localDeviceCallbacks.afhMapChanged = 0LL;
    objc_storeStrong((id *)&qword_10000C820, v2);
  }

  return v2;
}

- (int)_bluetoothPower:(BTLocalDeviceImpl *)a3 isEnabled:(BOOL *)a4
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  int v7 = -5;
  do
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004190;
    block[3] = &unk_100008298;
    objc_copyWeak(v13, &location);
    block[4] = &v15;
    block[5] = &v19;
    v13[1] = a3;
    v13[2] = a4;
    dispatch_sync((dispatch_queue_t)btQueue, block);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
    int v9 = *((_DWORD *)v16 + 6);
    if (v9) {
      break;
    }
  }

  while (*((_DWORD *)v20 + 6) == -889275714 && v7++ != 0);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

- (BOOL)_setBluetoothPower:(BTLocalDeviceImpl *)a3 enabled:(BOOL)a4 timeout:(double)a5
{
  BOOL v5 = a4;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  int v36 = 1;
  char v32 = 0;
  if (!-[OSDBluetooth _bluetoothPower:isEnabled:](self, "_bluetoothPower:isEnabled:", a3, &v32))
  {
    BOOL v12 = v32 != 0;
    if (!v5) {
      BOOL v12 = v32 == 0;
    }
    if (v12)
    {
      uint64_t v13 = DiagnosticLogHandleForCategory(3LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "BT module was already in the correct power state; doing nothing.";
        uint64_t v15 = v10;
        uint32_t v16 = 2;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }

    else
    {
      btQueue = self->_btQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004664;
      block[3] = &unk_1000082C0;
      block[4] = &v33;
      block[5] = a3;
      BOOL v31 = v5;
      dispatch_sync((dispatch_queue_t)btQueue, block);
      statusSema = self->_statusSema;
      dispatch_time_t v19 = dispatch_time(0LL, (uint64_t)(a5 * 1000000000.0));
      dispatch_semaphore_wait((dispatch_semaphore_t)statusSema, v19);
      if (*((_DWORD *)v34 + 6))
      {
        uint64_t v20 = DiagnosticLogHandleForCategory(3LL);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100005F10(v5, v10, v21, v22, v23, v24, v25, v26);
        }
        goto LABEL_4;
      }

      uint64_t v27 = DiagnosticLogHandleForCategory(3LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v28 = @"OFF";
        if (v5) {
          v28 = @"ON";
        }
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        v14 = "Set BT module power: %@";
        uint64_t v15 = v10;
        uint32_t v16 = 12;
        goto LABEL_17;
      }
    }

    BOOL v11 = 1;
    goto LABEL_19;
  }

  uint64_t v9 = DiagnosticLogHandleForCategory(3LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100005F8C();
  }
LABEL_4:
  BOOL v11 = 0;
LABEL_19:

  _Block_object_dispose(&v33, 8);
  return v11;
}

- (BOOL)_setupBluetoothSessionAndDevice:(id *)a3
{
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  if (!self->_session)
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004A14;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v23, &location);
    block[4] = &v25;
    dispatch_sync((dispatch_queue_t)btQueue, block);
    statusSema = self->_statusSema;
    dispatch_time_t v8 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait((dispatch_semaphore_t)statusSema, v8);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  a3,  @"com.apple.Diagnostics.DABluetooth",  2101LL,  @"Error attaching to BTSession.");
      BOOL v3 = 0;
LABEL_18:
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      goto LABEL_19;
    }

    uint64_t v9 = self->_btQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100004AA0;
    v20[3] = &unk_1000082E8;
    objc_copyWeak(&v21, &location);
    v20[4] = &v25;
    dispatch_sync((dispatch_queue_t)v9, v20);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  a3,  @"com.apple.Diagnostics.DABluetooth",  2102LL,  @"Error getting default bluetooth device");
      BOOL v3 = 0;
LABEL_17:
      objc_destroyWeak(&v21);
      goto LABEL_18;
    }

    v10 = self->_btQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100004AF4;
    v18[3] = &unk_1000082E8;
    objc_copyWeak(&v19, &location);
    v18[4] = &v25;
    dispatch_sync((dispatch_queue_t)v10, v18);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  a3,  @"com.apple.Diagnostics.DABluetooth",  2103LL,  @"Error adding bluetooth device callbacks");
      BOOL v3 = 0;
LABEL_16:
      objc_destroyWeak(&v19);
      goto LABEL_17;
    }

    BOOL v11 = self->_btQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004B48;
    v16[3] = &unk_1000082E8;
    objc_copyWeak(&v17, &location);
    v16[4] = &v25;
    dispatch_sync((dispatch_queue_t)v11, v16);
    if (*((_DWORD *)v26 + 6))
    {
      BOOL v12 = @"Error creating bluetooth discovery agent";
      uint64_t v13 = 2104LL;
    }

    else
    {
      session = self->_session;
      BOOL v3 = session != 0LL;
      if (!session) {
        +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  a3,  @"com.apple.Diagnostics.DABluetooth",  2105LL,  @"Error creating a Bluetooth session");
      }
      if (self->_localDevice) {
        goto LABEL_15;
      }
      BOOL v12 = @"Error creating a Bluetooth local device object";
      uint64_t v13 = 2106LL;
    }

    +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  a3,  @"com.apple.Diagnostics.DABluetooth",  v13,  v12);
    BOOL v3 = 0;
LABEL_15:
    objc_destroyWeak(&v17);
    goto LABEL_16;
  }

  BOOL v3 = 1;
LABEL_19:
  _Block_object_dispose(&v25, 8);
  return v3;
}

- (void)_teardownBluetoothSessionAndDevice
{
  btQueue = self->_btQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100004C30;
  v4[3] = &unk_100008310;
  objc_copyWeak(&v5, &location);
  dispatch_sync((dispatch_queue_t)btQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)performBluetoothScanWithTimeout:(double)a3 foundDevices:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100004E1C;
  id v21 = sub_100004E2C;
  uint64_t v22 = &off_100008560;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String], 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004E34;
  id v13[3] = &unk_100008270;
  id v9 = v6;
  id v14 = v9;
  uint32_t v16 = &v17;
  v10 = v7;
  uint64_t v15 = v10;
  -[OSDBluetooth performScanOnQueue:timeout:gracePeriod:completionBlock:]( self,  "performScanOnQueue:timeout:gracePeriod:completionBlock:",  v8,  v13,  a3,  2.0);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)performScanOnQueue:(id)a3 timeout:(double)a4 gracePeriod:(double)a5 completionBlock:(id)a6
{
  id v10 = a6;
  if (a4 <= 0.0) {
    a4 = 8.0;
  }
  if (a5 <= 0.0) {
    a5 = 2.0;
  }
  id v11 = (dispatch_queue_s *)a3;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005180;
  id v13[3] = &unk_100008338;
  void v13[4] = self;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&a4;
  v15[2] = *(id *)&a5;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(v11, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (BOOL)setBluetoothPowerOn:(BOOL)a3
{
  BOOL v3 = a3;
  -[OSDBluetooth _setupBluetoothSessionAndDevice:](self, "_setupBluetoothSessionAndDevice:", 0LL);
  LOBYTE(v3) = -[OSDBluetooth _setBluetoothPower:enabled:timeout:]( self,  "_setBluetoothPower:enabled:timeout:",  self->_localDevice,  v3,  5.0);
  -[OSDBluetooth _teardownBluetoothSessionAndDevice](self, "_teardownBluetoothSessionAndDevice");
  return v3;
}

- (OS_dispatch_semaphore)statusSema
{
  return self->_statusSema;
}

- (void)setStatusSema:(id)a3
{
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (void).cxx_destruct
{
}

@end