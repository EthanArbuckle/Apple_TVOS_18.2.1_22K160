@interface CLHomeKitDelegate
- (BOOL)power;
- (CLHomeKitDelegate)initWithProvider:(void *)a3;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4 forType:(int64_t)a5;
- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7;
- (void)homeKitDidUpdateState:(id)a3;
- (void)homeKitStartedScanning:(id)a3 forType:(int64_t)a4;
- (void)homeKitStoppedScanning:(id)a3 forType:(int64_t)a4;
@end

@implementation CLHomeKitDelegate

- (CLHomeKitDelegate)initWithProvider:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLHomeKitDelegate;
  result = -[CLHomeKitDelegate init](&v5, "init");
  if (result)
  {
    result->_homekitProvider = a3;
    *(_WORD *)&result->_homekitPower = 0;
  }

  return result;
}

- (BOOL)power
{
  return self->_cbPower || self->_homekitPower;
}

- (void)homeKitDidUpdateState:(id)a3
{
  self->_homekitPower = [a3 state] == (id)3;
  sub_10030BDB8((uint64_t)self->_homekitProvider, -[CLHomeKitDelegate power](self, "power"));
}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7
{
  id v11 = [a5 objectForKeyedSubscript:CBAdvertisementDataManufacturerDataKey];
  if (a6) {
    LODWORD(a6) = [a6 intValue];
  }
  int v12 = sub_10030BED0(a7);
  homekitProvider = self->_homekitProvider;
  double Current_1 = j__CFAbsoluteTimeGetCurrent_1();
  sub_10030C0A0((uint64_t)homekitProvider, a4, 2, v11, (int)a6, v12, Current_1);
}

- (void)homeKitStartedScanning:(id)a3 forType:(int64_t)a4
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101832368);
  }
  objc_super v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    int64_t v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Started scanning for HomeKit 2.0 devices for type %{public}ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101832368);
    }
    int v7 = 134349056;
    int64_t v8 = a4;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Started scanning for HomeKit 2.0 devices for type %{public}ld",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHomeKitDelegate homeKitStartedScanning:forType:]", "%s\n", v6);
  }

- (void)homeKitStoppedScanning:(id)a3 forType:(int64_t)a4
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101832368);
  }
  objc_super v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    int64_t v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Stopped scanning for HomeKit 2.0 devices for type %{public}ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101832368);
    }
    int v7 = 134349056;
    int64_t v8 = a4;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Stopped scanning for HomeKit 2.0 devices for type %{public}ld",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHomeKitDelegate homeKitStoppedScanning:forType:]", "%s\n", v6);
  }

- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4 forType:(int64_t)a5
{
  uint64_t v6 = sub_10030BED0(a5);
  sub_10030CF80(v6, a4, v6);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  self->_cbPower = [a3 state] != (id)4;
  sub_10030BDB8((uint64_t)self->_homekitProvider, -[CLHomeKitDelegate power](self, "power"));
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v9 = [a5 objectForKey:CBAdvertisementDataServiceDataKey];
  if (v9)
  {
    id v10 = objc_msgSend( v9,  "objectForKeyedSubscript:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"FED4"));
    if (a6) {
      LODWORD(a6) = [a6 intValue];
    }
    homekitProvider = self->_homekitProvider;
    id v12 = [a4 identifier];
    double Current_1 = j__CFAbsoluteTimeGetCurrent_1();
    sub_10030C0A0((uint64_t)homekitProvider, v12, 1, v10, (int)a6, 0, Current_1);
  }

@end