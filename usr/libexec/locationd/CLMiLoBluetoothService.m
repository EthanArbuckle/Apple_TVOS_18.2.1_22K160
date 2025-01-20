@interface CLMiLoBluetoothService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLMiLoBluetoothService)init;
- (void)beginService;
- (void)endService;
@end

@implementation CLMiLoBluetoothService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019973A0 != -1) {
    dispatch_once(&qword_1019973A0, &stru_101843480);
  }
  return (id)qword_101997398;
}

+ (BOOL)isSupported
{
  if (qword_1019973B0 != -1) {
    dispatch_once(&qword_1019973B0, &stru_1018434A0);
  }
  if (!byte_1019973A8)
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_1018434C0);
    }
    v2 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_INFO))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      v6 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ble, not supported on this platform}",  (uint8_t *)v4,  0x12u);
    }
  }

  return byte_1019973A8;
}

- (CLMiLoBluetoothService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMiLoBluetoothService;
  return -[CLMiLoBluetoothService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMiLoBluetoothServiceProtocol,  &OBJC_PROTOCOL___CLMiLoBluetoothClientProtocol);
}

- (void)beginService
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_1018434C0);
  }
  objc_super v3 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ble, initiating service}",  (uint8_t *)v4,  0x12u);
  }

  self->_bluetoothClient = -[CLMiLoBluetoothClient initWithQueue:]( [CLMiLoBluetoothClient alloc],  "initWithQueue:",  objc_msgSend( objc_msgSend(-[CLMiLoBluetoothService universe](self, "universe"), "silo"),  "queue"));
}

- (void)endService
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_1018434C0);
  }
  objc_super v3 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ble, terminating service}",  (uint8_t *)v4,  0x12u);
  }
}

@end