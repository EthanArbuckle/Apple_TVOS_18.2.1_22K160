@interface BKTouchDeliveryStatisticsLoggingObserver
- (BKTouchDeliveryStatisticsLoggingObserver)initWithLabel:(id)a3;
- (void)dealloc;
- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidFinishProcessingTouchCollection;
- (void)touchDidHIDCancel:(unsigned int)a3;
- (void)touchDidSoftCancel:(unsigned int)a3;
- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4;
- (void)touchWillStartProcessingTouchCollection;
@end

@implementation BKTouchDeliveryStatisticsLoggingObserver

- (BKTouchDeliveryStatisticsLoggingObserver)initWithLabel:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = [BKTouchDeliveryStatisticsLoggingObserver class];
  BKTouchDeliveryStatisticsLoggingObserver *v5 = [[BKTouchDeliveryStatisticsLoggingObserver alloc] init];
  if (v5)
  {
    uint64_t v6 = [BKIntegerEventStatistic statisticWithLabel:@"down"];
    touchDownCount = v5->_touchDownCount;
    v5->_touchDownCount = (BKIntegerEventStatistic *)v6;

    uint64_t v8 = [BKIntegerEventStatistic statisticWithLabel:@"up"];
    touchUpCount = v5->_touchUpCount;
    v5->_touchUpCount = (BKIntegerEventStatistic *)v8;

    uint64_t v10 = [BKIntegerEventStatistic statisticWithLabel:@"rangeIn"];
    rangeInCount = v5->_rangeInCount;
    v5->_rangeInCount = (BKIntegerEventStatistic *)v10;

    uint64_t v12 = [BKIntegerEventStatistic statisticWithLabel:@"rangeOut"];
    rangeOutCount = v5->_rangeOutCount;
    v5->_rangeOutCount = (BKIntegerEventStatistic *)v12;

    uint64_t v14 = [BKIntegerEventStatistic statisticWithLabel:@"HID cancel"];
    hardCancelCount = v5->_hardCancelCount;
    v5->_hardCancelCount = (BKIntegerEventStatistic *)v14;

    uint64_t v16 = [BKIntegerEventStatistic statisticWithLabel:@"soft cancel"];
    softCancelCount = v5->_softCancelCount;
    v5->_softCancelCount = (BKIntegerEventStatistic *)v16;

    uint64_t v18 = [BKIntegerEventStatistic statisticWithLabel:@"tapToWake"];
    tapToWakeCount = v5->_tapToWakeCount;
    v5->_tapToWakeCount = (BKIntegerEventStatistic *)v18;

    uint64_t v20 = [BKIntegerEventStatistic statisticWithLabel:@"pencil"];
    stylusTouchCount = v5->_stylusTouchCount;
    v5->_stylusTouchCount = (BKIntegerEventStatistic *)v20;

    uint64_t v22 = [BKIntegerEventStatistic statisticWithLabel:@"detached"];
    detachedTouchCount = v5->_detachedTouchCount;
    v5->_detachedTouchCount = (BKIntegerEventStatistic *)v22;

    uint64_t v24 = [BKIntegerEventStatistic statisticWithLabel:@"transferred"];
    transferredTouchCount = v5->_transferredTouchCount;
    v5->_transferredTouchCount = (BKIntegerEventStatistic *)v24;

    uint64_t v26 = [BKIntegerEventStatistic statisticWithLabel:@"fromEdge"];
    fromEdgeCount = v5->_fromEdgeCount;
    v5->_fromEdgeCount = (BKIntegerEventStatistic *)v26;

    uint64_t v28 = [BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsSeen" hexFormatModifier:1LL];
    pathsSeen = v5->_pathsSeen;
    v5->_pathsSeen = (BKHexadecimalIntegerEventStatistic *)v28;

    uint64_t v30 = [BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsStillTouching" hexFormatModifier:1LL];
    pathsStillTouching = v5->_pathsStillTouching;
    v5->_pathsStillTouching = (BKHexadecimalIntegerEventStatistic *)v30;

    [v5->_pathsStillTouching setAutomaticResetDisabled:YES];
    uint64_t v32 = [BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsStillWithinRange" hexFormatModifier:1LL];
    pathsStillWithinRange = v5->_pathsStillWithinRange;
    v5->_pathsStillWithinRange = (BKHexadecimalIntegerEventStatistic *)v32;

    [v5->_pathsStillWithinRange setAutomaticResetDisabled:YES];
    uint64_t v34 = [BKAverageTimeIntervalEventStatistic statisticWithLabel:@"averageProcessingTime" scale:1000000LL];
    touchProcessingTimeAverage = v5->_touchProcessingTimeAverage;
    v5->_touchProcessingTimeAverage = (BKAverageTimeIntervalEventStatistic *)v34;

    BKTouchDestinationStatistic *v36 = [[BKTouchDestinationStatistic alloc] init];
    destinations = v5->_destinations;
    v5->_destinations = v36;

    v38 = [@"touchstats " stringByAppendingString:v4];
    BKEventStatisticsLoggingController *v39 = [[BKEventStatisticsLoggingController alloc] init];
    uint64_t v41 = BKLogTouchEvents(v39, v40);
    v42 = [v41 autorelease];
    BKEventStatisticsLoggingController *v43 = [[BKEventStatisticsLoggingController alloc] initWithLabel:v38 logCategory:v42];
    loggingController = v5->_loggingController;
    v5->_loggingController = v43;

    v46 = v5->_loggingController;
    v45 = v5->_touchUpCount;
    v47 = v5->_rangeInCount;
    v61[0] = v5->_touchDownCount;
    v61[1] = v45;
    v48 = v5->_rangeOutCount;
    v49 = v5->_hardCancelCount;
    v61[2] = v47;
    v61[3] = v48;
    v50 = v5->_softCancelCount;
    v51 = v5->_stylusTouchCount;
    v52 = v5->_detachedTouchCount;
    v61[4] = v5->_tapToWakeCount;
    v61[5] = v51;
    v61[6] = v49;
    v61[7] = v50;
    v53 = v5->_transferredTouchCount;
    v61[8] = v5->_fromEdgeCount;
    v61[9] = v52;
    v54 = v5->_pathsSeen;
    v55 = v5->_pathsStillTouching;
    v61[10] = v53;
    v61[11] = v54;
    v57 = v5->_touchProcessingTimeAverage;
    v56 = v5->_destinations;
    v61[12] = v55;
    v61[13] = v56;
    v61[14] = v57;
    v58 = [NSArray arrayWithObjects:count:v61, 15LL];
    [v46 setStatistics:v58];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = [BKTouchDeliveryStatisticsLoggingObserver class];
  [v3 dealloc];
}

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v7 = a4;
  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000688A4;
  v10[3] = &unk_1000B80A8;
  unsigned int v12 = a3;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [loggingController updateStatistics:v10];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100068868;
  v10[3] = &unk_1000B7ED8;
  v10[4] = self;
  void v10[5] = a4;
  [loggingController updateStatistics:v10 withAuditToken:a4 withSender:a6 withEventType:a9];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  loggingController = self->_loggingController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006882C;
  v6[3] = &unk_1000B7ED8;
  v6[4] = self;
  v6[5] = a4;
  [loggingController updateStatistics:v6];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  loggingController = self->_loggingController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006879C;
  v8[3] = &unk_1000B7F00;
  v8[4] = self;
  v8[5] = a4;
  unsigned int v9 = a7;
  unsigned int v10 = a6;
  [loggingController updateStatistics:v8];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  loggingController = self->_loggingController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100068760;
  v7[3] = &unk_1000B7ED8;
  v7[4] = self;
  v7[5] = a4;
  [loggingController updateStatistics:v7];
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100068754;
  v5[3] = &unk_1000B8058;
  v5[4] = self;
  [loggingController updateStatistics:v5];
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100068748;
  v5[3] = &unk_1000B8058;
  v5[4] = self;
  [loggingController updateStatistics:v5];
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006873C;
  v4[3] = &unk_1000B8058;
  v4[4] = self;
  [loggingController updateStatistics:v4];
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100068730;
  v4[3] = &unk_1000B8058;
  v4[4] = self;
  [loggingController updateStatistics:v4];
}

- (void)touchWillStartProcessingTouchCollection
{
  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000685B0;
  v3[3] = &unk_1000B7ED8;
  v3[4] = self;
  v3[5] = a2;
  [loggingController updateStatistics:v3];
}

- (void)touchDidFinishProcessingTouchCollection
{
  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100068570;
  v3[3] = &unk_1000B8058;
  v3[4] = self;
  [loggingController updateStatistics:v3];
}

- (void).cxx_destruct
{
}

@end