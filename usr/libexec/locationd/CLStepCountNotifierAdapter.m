@interface CLStepCountNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetEnabled;
- (BOOL)syncgetIsStrideCalibrationConvergedMedianForSpeed:(double)a3;
- (CLStepCountNotifierAdapter)init;
- (CLStepDistance)syncgetQueryStartTime:(SEL)a3 andStopTime:(double *)a4;
- (id)syncgetCopyRawSpeedToKValueBins;
- (id)syncgetCopyStepCadenceToStrideLengthBins;
- (id)syncgetDbUUID;
- (id)syncgetRawSpeedToKValueDefaultBins;
- (id)syncgetStepCadenceToStrideLengthDefaultBins;
- (int)syncgetQueryPedometerDataSince:(CLStepCountEntry *)a3 withResponseArray:(void *)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getPedometerBinsAndHistoryWithReply:(id)a3;
- (void)getPedometerCalibrationBins:(int64_t)a3 withReply:(id)a4;
- (void)receiveWorkoutDistanceAnalyticsMessage:(id)a3;
- (void)reset;
- (void)resumeAfterPendingStepCountNotifications;
- (void)setEnabled:(BOOL)a3;
- (void)setRawSpeedToKValueBins:(id)a3;
- (void)setStepCadenceToStrideLengthBins:(id)a3;
- (void)strideCalibratorSetSession:(int64_t)a3;
@end

@implementation CLStepCountNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A0338 != -1) {
    dispatch_once(&qword_1019A0338, &stru_101895270);
  }
  return (id)qword_1019A0330;
}

- (CLStepCountNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStepCountNotifierAdapter;
  return -[CLStepCountNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLStepCountNotifierProtocol,  &OBJC_PROTOCOL___CLStepCountNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101280D7C();
    sub_1010304E0(v3);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)strideCalibratorSetSession:(int64_t)a3
{
}

- (void)receiveWorkoutDistanceAnalyticsMessage:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)syncgetEnabled
{
  uint64_t v2 = sub_1008FA854(0);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v2 + 32) + 24LL))(v2 + 32);
}

- (CLStepDistance)syncgetQueryStartTime:(SEL)a3 andStopTime:(double *)a4
{
  return result;
}

- (void)reset
{
  uint64_t v2 = -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  sub_10102C534(v2[16]);
  sub_100D8BAC8((void *)(v2[16] + 72));
}

- (id)syncgetDbUUID
{
  return objc_autorelease(objc_retain((id)sub_1010294E0(*((void *)-[CLStepCountNotifierAdapter adaptee]( self,  "adaptee")
                                                        + 16))));
}

- (int)syncgetQueryPedometerDataSince:(CLStepCountEntry *)a3 withResponseArray:(void *)a4
{
  return sub_101027FA0( *((uint64_t **)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 16),  (uint64_t)a3,  (char **)a4);
}

- (id)syncgetCopyRawSpeedToKValueBins
{
  return -[CMPedometerTable copyBins]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "copyBins");
}

- (id)syncgetCopyStepCadenceToStrideLengthBins
{
  return -[CMPedometerTable copyBins]( +[CMPedometerTableStepCadenceToStrideLength sharedInstance]( &OBJC_CLASS___CMPedometerTableStepCadenceToStrideLength,  "sharedInstance"),  "copyBins");
}

- (void)setRawSpeedToKValueBins:(id)a3
{
}

- (void)setStepCadenceToStrideLengthBins:(id)a3
{
}

- (id)syncgetRawSpeedToKValueDefaultBins
{
  return  objc_msgSend( -[CMPedometerTable defaultBins]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "defaultBins"),  "copy");
}

- (id)syncgetStepCadenceToStrideLengthDefaultBins
{
  return  objc_msgSend( -[CMPedometerTable defaultBins]( +[CMPedometerTableStepCadenceToStrideLength sharedInstance]( CMPedometerTableStepCadenceToStrideLength,  "sharedInstance"),  "defaultBins"),  "copy");
}

- (BOOL)syncgetIsStrideCalibrationConvergedMedianForSpeed:(double)a3
{
  return _objc_msgSend( *((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25),  "isCalibrationConvergedMedianForSpeed:",  a3);
}

- (void)getPedometerCalibrationBins:(int64_t)a3 withReply:(id)a4
{
  if (a3 == 1)
  {
    -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
    unint64_t v5 = &OBJC_CLASS___CMPedometerTableStepCadenceToStrideLength;
    goto LABEL_5;
  }

  if (!a3)
  {
    -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
    unint64_t v5 = &OBJC_CLASS___CMPedometerTableRawSpeedToKValue;
LABEL_5:
    id v6 = -[__objc2_class copyBins](-[__objc2_class sharedInstance](v5, "sharedInstance"), "copyBins");
    goto LABEL_12;
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_1018955B8);
  }
  v7 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Requested calibration type not recognized",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_1018955B8);
    }
    v10[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  16LL,  "Requested calibration type not recognized",  v10,  2);
    v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLStepCountNotifierAdapter getPedometerCalibrationBins:withReply:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  id v6 = 0LL;
LABEL_12:
  (*((void (**)(id, id))a4 + 2))(a4, v6);
}

- (void)getPedometerBinsAndHistoryWithReply:(id)a3
{
  id v5 = objc_msgSend(*((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25), "copyHistory");
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  id v6 = -[CMPedometerTable copyBins]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "copyBins");
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  id v7 = -[CMPedometerTable copyBins]( +[CMPedometerTableStepCadenceToStrideLength sharedInstance]( &OBJC_CLASS___CMPedometerTableStepCadenceToStrideLength,  "sharedInstance"),  "copyBins");
  id v8 = +[CMPedometerTable convertToCMStrideCalibrationData:]( &OBJC_CLASS___CMPedometerTable,  "convertToCMStrideCalibrationData:",  v6);

  id v9 = +[CMPedometerTable convertToCMStrideCalibrationData:]( &OBJC_CLASS___CMPedometerTable,  "convertToCMStrideCalibrationData:",  v7);
  id v10 =  [[CMStrideCalibrationHistory alloc] initWithCalibrationTracks:v5 rawSpeedToKValueBins:v8 stepCadenceToStrideLengthBins:v9];

  (*((void (**)(id, id))a3 + 2))(a3, v10);
}

- (void)resumeAfterPendingStepCountNotifications
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1010310D0;
  v2[3] = &unk_10181A288;
  v2[4] = self;
  objc_msgSend(-[CLStepCountNotifierAdapter silo](self, "silo"), "async:", v2);
}

+ (BOOL)isSupported
{
  if (qword_1019A0348 != -1) {
    dispatch_once(&qword_1019A0348, &stru_101895290);
  }
  return byte_1019A0340;
}

@end