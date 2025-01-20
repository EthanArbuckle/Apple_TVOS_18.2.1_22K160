@interface CameraTS
- (CameraTS)initWithFrontCameraSensorIdx:(int)a3 rearCameraSensorIdx:(int)a4;
- (OS_dispatch_queue)cameraQueue;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)frontCameraSensorIdx;
- (int)frontCameraStateToken;
- (int)frontCameraTemperatureToken;
- (int)frontIRCameraSensorIdx;
- (int)frontIRCameraSensorTemperatureToken;
- (int)frontRigelDieSensorIdx;
- (int)frontRigelDieTemperatureActiveToken;
- (int)frontRomeoNTCSensorIdx;
- (int)frontRomeoNTCTemperatureActiveToken;
- (int)numberOfFields;
- (int)rearCameraJasperSensorIdx;
- (int)rearCameraJasperStateToken;
- (int)rearCameraJasperTemperatureToken;
- (int)rearCameraSensorIdx;
- (int)rearCameraStateToken;
- (int)rearCameraSuperWideSensorIdx;
- (int)rearCameraSuperWideStateToken;
- (int)rearCameraSuperWideTemperatureToken;
- (int)rearCameraTeleSensorIdx;
- (int)rearCameraTeleStateToken;
- (int)rearCameraTeleTemperatureToken;
- (int)rearCameraTemperatureToken;
- (int)torchState;
- (int)torchStateToken;
- (void)dealloc;
- (void)enableFrontIRCameraNotifications:(int)a3;
- (void)enableFrontRigelDieNotifications:(int)a3;
- (void)enableFrontRomeoNTCNotifications:(int)a3;
- (void)enableRearCameraJasperNotifications:(int)a3;
- (void)enableRearCameraSuperWideNotifications:(int)a3;
- (void)enableRearCameraTeleNotifications:(int)a3;
- (void)handleStateChangeNotification:(int)a3 temperatureSensorIndex:(int)a4;
- (void)handleTemperatureChangeNotification:(int)a3 temperatureSensorIndex:(int)a4;
- (void)setCameraQueue:(id)a3;
- (void)setFrontCameraSensorIdx:(int)a3;
- (void)setFrontCameraStateToken:(int)a3;
- (void)setFrontCameraTemperatureToken:(int)a3;
- (void)setFrontIRCameraSensorIdx:(int)a3;
- (void)setFrontIRCameraSensorTemperatureToken:(int)a3;
- (void)setFrontRigelDieSensorIdx:(int)a3;
- (void)setFrontRigelDieTemperatureActiveToken:(int)a3;
- (void)setFrontRomeoNTCSensorIdx:(int)a3;
- (void)setFrontRomeoNTCTemperatureActiveToken:(int)a3;
- (void)setRearCameraJasperSensorIdx:(int)a3;
- (void)setRearCameraJasperStateToken:(int)a3;
- (void)setRearCameraJasperTemperatureToken:(int)a3;
- (void)setRearCameraSensorIdx:(int)a3;
- (void)setRearCameraStateToken:(int)a3;
- (void)setRearCameraSuperWideSensorIdx:(int)a3;
- (void)setRearCameraSuperWideStateToken:(int)a3;
- (void)setRearCameraSuperWideTemperatureToken:(int)a3;
- (void)setRearCameraTeleSensorIdx:(int)a3;
- (void)setRearCameraTeleStateToken:(int)a3;
- (void)setRearCameraTeleTemperatureToken:(int)a3;
- (void)setRearCameraTemperatureToken:(int)a3;
- (void)setTorchState:(int)a3;
- (void)setTorchStateToken:(int)a3;
- (void)updateSensor:(int)a3 temperature:(unint64_t)a4;
@end

@implementation CameraTS

- (CameraTS)initWithFrontCameraSensorIdx:(int)a3 rearCameraSensorIdx:(int)a4
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CameraTS;
  v6 = -[CameraTS init](&v26, "init");
  v7 = v6;
  if (v6)
  {
    v6->_torchState = -1;
    v6->_rearCameraSensorIdx = a4;
    v6->_frontCameraSensorIdx = a3;
    v6->_rearCameraTeleSensorIdx = -1;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_cameraQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ThermalMonitor.cameraQueue", v8);
    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  8LL,  @"zETM",  8LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  19LL,  @"zETM",  19LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  20LL,  @"zETM",  20LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  21LL,  @"zETM",  21LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  23LL,  @"zETM",  23LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  22LL,  @"zETM",  22LL);
    }

    objc_initWeak(&location, v7);
    cameraQueue = (dispatch_queue_s *)v7->_cameraQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100004890;
    v23[3] = &unk_100060BB8;
    objc_copyWeak(&v24, &location);
    sub_100022F34("com.apple.isp.backcamerapower", &v7->_rearCameraStateToken, cameraQueue, v23);
    v10 = (dispatch_queue_s *)v7->_cameraQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000048FC;
    v21[3] = &unk_100060BB8;
    objc_copyWeak(&v22, &location);
    sub_100022F34("com.apple.isp.backsensortemperature", &v7->_rearCameraTemperatureToken, v10, v21);
    v11 = (dispatch_queue_s *)v7->_cameraQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100004934;
    v19[3] = &unk_100060BB8;
    objc_copyWeak(&v20, &location);
    sub_100022F34("com.apple.isp.frontcamerapower", &v7->_frontCameraStateToken, v11, v19);
    v12 = (dispatch_queue_s *)v7->_cameraQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000049A0;
    v17[3] = &unk_100060BB8;
    objc_copyWeak(&v18, &location);
    sub_100022F34("com.apple.isp.frontsensortemperature", &v7->_frontCameraTemperatureToken, v12, v17);
    v13 = (dispatch_queue_s *)v7->_cameraQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000049D8;
    v15[3] = &unk_100060BB8;
    objc_copyWeak(&v16, &location);
    sub_100022F34("com.apple.isp.cameratorch", &v7->_torchStateToken, v13, v15);
    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v7);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)enableRearCameraTeleNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004B98;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34("com.apple.isp.backtelecamerapower", &self->_rearCameraTeleStateToken, cameraQueue, v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004C04;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.backtelesensortemperature", &self->_rearCameraTeleTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraSuperWideNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004D74;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34("com.apple.isp.backsuperwidecamerapower", &self->_rearCameraSuperWideStateToken, cameraQueue, v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004DE0;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.backsuperwidetemperature", &self->_rearCameraSuperWideTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraJasperNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004F50;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34("com.apple.isp.backtofsensorpower", &self->_rearCameraJasperStateToken, cameraQueue, v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004FBC;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.backtofsensortemperature", &self->_rearCameraJasperTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontIRCameraNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000512C;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34("com.apple.isp.frontirsensortemperature", &self->_frontIRCameraSensorTemperatureToken, cameraQueue, v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005164;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRomeoNTCNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000052D4;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34( "com.apple.isp.frontirprojector.ntctempactive",  &self->_frontRomeoNTCTemperatureActiveToken,  cameraQueue,  v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000530C;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRigelDieNotifications:(int)a3
{
  cameraQueue = (dispatch_queue_s *)self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000547C;
  v8[3] = &unk_100060BB8;
  objc_copyWeak(&v9, &location);
  sub_100022F34( "com.apple.isp.frontirprojector.dietempactive",  &self->_frontRigelDieTemperatureActiveToken,  cameraQueue,  v8);
  v5 = (dispatch_queue_s *)self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000054B4;
  v6[3] = &unk_100060BB8;
  objc_copyWeak(&v7, &location);
  sub_100022F34("com.apple.isp.frontcamerapower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CameraTS;
  -[CameraTS dealloc](&v3, "dealloc");
}

- (void)updateSensor:(int)a3 temperature:(unint64_t)a4
{
  if (a3 < 0)
  {
    v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038260(a3, v6);
    }
  }

  else
  {
    else {
      uint64_t v5 = (100 * a4);
    }
    sub_100019974(*(uint64_t *)&a3, v5);
  }

- (void)handleStateChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t state64 = 0LL;
  if (!notify_get_state(a3, &state64) && !state64) {
    -[CameraTS updateSensor:temperature:](self, "updateSensor:temperature:", v4, 0LL);
  }
}

- (void)handleTemperatureChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t state64 = 0LL;
  if (!notify_get_state(a3, &state64)) {
    -[CameraTS updateSensor:temperature:](self, "updateSensor:temperature:", v4, (int)state64);
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3) {
    return 0LL;
  }
  else {
    return @"Torch state";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3) {
    return 0LL;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  -[CameraTS torchState](self, "torchState"));
  }
}

- (int)torchState
{
  return self->_torchState;
}

- (void)setTorchState:(int)a3
{
  self->_torchState = a3;
}

- (int)rearCameraSensorIdx
{
  return self->_rearCameraSensorIdx;
}

- (void)setRearCameraSensorIdx:(int)a3
{
  self->_rearCameraSensorIdx = a3;
}

- (int)frontCameraSensorIdx
{
  return self->_frontCameraSensorIdx;
}

- (void)setFrontCameraSensorIdx:(int)a3
{
  self->_frontCameraSensorIdx = a3;
}

- (int)rearCameraTeleSensorIdx
{
  return self->_rearCameraTeleSensorIdx;
}

- (void)setRearCameraTeleSensorIdx:(int)a3
{
  self->_rearCameraTeleSensorIdx = a3;
}

- (int)rearCameraSuperWideSensorIdx
{
  return self->_rearCameraSuperWideSensorIdx;
}

- (void)setRearCameraSuperWideSensorIdx:(int)a3
{
  self->_rearCameraSuperWideSensorIdx = a3;
}

- (int)rearCameraJasperSensorIdx
{
  return self->_rearCameraJasperSensorIdx;
}

- (void)setRearCameraJasperSensorIdx:(int)a3
{
  self->_rearCameraJasperSensorIdx = a3;
}

- (int)frontIRCameraSensorIdx
{
  return self->_frontIRCameraSensorIdx;
}

- (void)setFrontIRCameraSensorIdx:(int)a3
{
  self->_frontIRCameraSensorIdx = a3;
}

- (int)frontRomeoNTCSensorIdx
{
  return self->_frontRomeoNTCSensorIdx;
}

- (void)setFrontRomeoNTCSensorIdx:(int)a3
{
  self->_frontRomeoNTCSensorIdx = a3;
}

- (int)frontRigelDieSensorIdx
{
  return self->_frontRigelDieSensorIdx;
}

- (void)setFrontRigelDieSensorIdx:(int)a3
{
  self->_frontRigelDieSensorIdx = a3;
}

- (int)torchStateToken
{
  return self->_torchStateToken;
}

- (void)setTorchStateToken:(int)a3
{
  self->_torchStateToken = a3;
}

- (int)rearCameraStateToken
{
  return self->_rearCameraStateToken;
}

- (void)setRearCameraStateToken:(int)a3
{
  self->_rearCameraStateToken = a3;
}

- (int)rearCameraTemperatureToken
{
  return self->_rearCameraTemperatureToken;
}

- (void)setRearCameraTemperatureToken:(int)a3
{
  self->_rearCameraTemperatureToken = a3;
}

- (int)frontCameraStateToken
{
  return self->_frontCameraStateToken;
}

- (void)setFrontCameraStateToken:(int)a3
{
  self->_frontCameraStateToken = a3;
}

- (int)frontCameraTemperatureToken
{
  return self->_frontCameraTemperatureToken;
}

- (void)setFrontCameraTemperatureToken:(int)a3
{
  self->_frontCameraTemperatureToken = a3;
}

- (int)rearCameraTeleStateToken
{
  return self->_rearCameraTeleStateToken;
}

- (void)setRearCameraTeleStateToken:(int)a3
{
  self->_rearCameraTeleStateToken = a3;
}

- (int)rearCameraTeleTemperatureToken
{
  return self->_rearCameraTeleTemperatureToken;
}

- (void)setRearCameraTeleTemperatureToken:(int)a3
{
  self->_rearCameraTeleTemperatureToken = a3;
}

- (int)rearCameraSuperWideStateToken
{
  return self->_rearCameraSuperWideStateToken;
}

- (void)setRearCameraSuperWideStateToken:(int)a3
{
  self->_rearCameraSuperWideStateToken = a3;
}

- (int)rearCameraSuperWideTemperatureToken
{
  return self->_rearCameraSuperWideTemperatureToken;
}

- (void)setRearCameraSuperWideTemperatureToken:(int)a3
{
  self->_rearCameraSuperWideTemperatureToken = a3;
}

- (int)rearCameraJasperStateToken
{
  return self->_rearCameraJasperStateToken;
}

- (void)setRearCameraJasperStateToken:(int)a3
{
  self->_rearCameraJasperStateToken = a3;
}

- (int)rearCameraJasperTemperatureToken
{
  return self->_rearCameraJasperTemperatureToken;
}

- (void)setRearCameraJasperTemperatureToken:(int)a3
{
  self->_rearCameraJasperTemperatureToken = a3;
}

- (int)frontIRCameraSensorTemperatureToken
{
  return self->_frontIRCameraSensorTemperatureToken;
}

- (void)setFrontIRCameraSensorTemperatureToken:(int)a3
{
  self->_frontIRCameraSensorTemperatureToken = a3;
}

- (int)frontRomeoNTCTemperatureActiveToken
{
  return self->_frontRomeoNTCTemperatureActiveToken;
}

- (void)setFrontRomeoNTCTemperatureActiveToken:(int)a3
{
  self->_frontRomeoNTCTemperatureActiveToken = a3;
}

- (int)frontRigelDieTemperatureActiveToken
{
  return self->_frontRigelDieTemperatureActiveToken;
}

- (void)setFrontRigelDieTemperatureActiveToken:(int)a3
{
  self->_frontRigelDieTemperatureActiveToken = a3;
}

- (OS_dispatch_queue)cameraQueue
{
  return self->_cameraQueue;
}

- (void)setCameraQueue:(id)a3
{
  self->_cameraQueue = (OS_dispatch_queue *)a3;
}

@end