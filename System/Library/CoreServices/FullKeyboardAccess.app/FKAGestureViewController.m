@interface FKAGestureViewController
- (AXPIFingerController)fingerController;
- (BOOL)_canShowWhileLocked;
- (BOOL)isPerformingGesture;
- (CGPoint)_convertedPointToGestureView:(CGPoint)a3;
- (FKAGestureViewController)initWithDisplayUUID:(id)a3;
- (FKAIncrementalGestureState)incrementalGestureState;
- (id)_fingerModelsForFingerControllerPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)_beginPinchOrRotateFromPoint:(CGPoint)a3 type:(int64_t)a4 pinchGestureSpeed:(double)a5 angleUpdateMultiplier:(double)a6;
- (void)_cancelGestureIfNecessary;
- (void)_cleanUpExistingIncrementalGesture;
- (void)begin3DTouchAtPoint:(CGPoint)a3;
- (void)beginPinchInFromPoint:(CGPoint)a3;
- (void)beginPinchOutFromPoint:(CGPoint)a3;
- (void)beginRotateLeftFromPoint:(CGPoint)a3;
- (void)beginRotateRightFromPoint:(CGPoint)a3;
- (void)beginSwipeFromPoint:(CGPoint)a3 inDirection:(int64_t)a4 numberOfFingers:(unint64_t)a5;
- (void)endIncrementalGesture;
- (void)lift;
- (void)loadView;
- (void)pressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)setFingerController:(id)a3;
- (void)setIncrementalGestureState:(id)a3;
- (void)tapAtPoint:(CGPoint)a3;
@end

@implementation FKAGestureViewController

- (FKAGestureViewController)initWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FKAGestureViewController;
  v5 = -[FKAGestureViewController init](&v9, "init");
  if (v5)
  {
    v6 = -[AXPIFingerController initWithDisplayUUID:]( objc_alloc(&OBJC_CLASS___AXPIFingerController),  "initWithDisplayUUID:",  v4);
    fingerController = v5->_fingerController;
    v5->_fingerController = v6;
  }

  return v5;
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerContainerView]);
  -[FKAGestureViewController setView:](self, "setView:", v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
  [v5 setAlpha:0.0];
}

- (BOOL)isPerformingGesture
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerModels]);
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerModels]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    unsigned __int8 v8 = [v7 isPressed];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_fingerModelsForFingerControllerPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
  [v7 bounds];
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:",  a4,  x,  y,  v8,  v9,  v10,  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities fingerModelsForPointStrings:]( &OBJC_CLASS___AXPIFingerUtilities,  "fingerModelsForPointStrings:",  v12));

  return v13;
}

- (void)_cancelGestureIfNecessary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
  unsigned int v4 = [v3 isPerformingGesture];

  if (v4)
  {
    uint64_t v5 = FKALogCommon();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cancel current gesture", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    [v7 cancelGesture];
  }

  -[FKAGestureViewController _cleanUpExistingIncrementalGesture](self, "_cleanUpExistingIncrementalGesture");
}

- (void)pressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double y = CGPointZero.y;
  if (a3.x != CGPointZero.x || a3.y != y)
  {
    double v7 = a3.y;
    double x = a3.x;
    uint64_t v10 = FKALogCommon(-[FKAGestureViewController _cancelGestureIfNecessary](self, "_cancelGestureIfNecessary"));
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v26.double x = x;
      v26.double y = v7;
      v12 = NSStringFromCGPoint(v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v22 = 138412546;
      v23 = v13;
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Press at %@ with %lu finger(s)",  (uint8_t *)&v22,  0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
    [v14 setAlpha:1.0];

    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, v7);
    double v16 = v15;
    double v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[FKAGestureViewController _fingerModelsForFingerControllerPoint:numberOfFingers:]( self,  "_fingerModelsForFingerControllerPoint:numberOfFingers:",  a4,  v16,  v18));
    objc_msgSend(v19, "showFingerModels:animated:startPointForAnimation:", v20, 0, CGPointZero.x, y);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    [v21 pressFingersDownAnimated:0];
  }

- (void)lift
{
  uint64_t v3 = FKALogCommon(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Lift fingers", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
  [v5 liftFingersUpAnimated:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
  objc_msgSend(v6, "clearAllFingersAnimated:endPointForAnimation:", 1, CGPointZero.x, CGPointZero.y);
}

- (void)tapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    uint64_t v7 = FKALogCommon(-[FKAGestureViewController _cancelGestureIfNecessary](self, "_cancelGestureIfNecessary"));
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v20.double x = x;
      v20.double y = y;
      double v9 = NSStringFromCGPoint(v20);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v18 = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Tap at %@", (uint8_t *)&v18, 0xCu);
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
    [v11 setAlpha:0.0];

    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    double v13 = v12;
    double v15 = v14;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:",  v13,  v15));
    [v16 performGesture:v17];
  }

- (void)_cleanUpExistingIncrementalGesture
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[FKAGestureViewController incrementalGestureState](self, "incrementalGestureState"));
  unsigned int v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = FKALogCommon(v3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Clean up existing incremental gesture", v15, 2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    [v7 liftFingersUpAnimated:0];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    objc_msgSend(v8, "clearAllFingersAnimated:endPointForAnimation:", 1, CGPointZero.x, CGPointZero.y);

    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 startGestureTimer]);
    unsigned int v10 = [v9 isValid];

    if (v10)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 startGestureTimer]);
      [v11 invalidate];
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 gestureUpdateTimer]);
    unsigned int v13 = [v12 isValid];

    if (v13)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 gestureUpdateTimer]);
      [v14 invalidate];
    }

    -[FKAGestureViewController setIncrementalGestureState:](self, "setIncrementalGestureState:", 0LL);
  }
}

- (void)beginSwipeFromPoint:(CGPoint)a3 inDirection:(int64_t)a4 numberOfFingers:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    uint64_t v11 = FKALogCommon(-[FKAGestureViewController _cancelGestureIfNecessary](self, "_cancelGestureIfNecessary"));
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v41.double x = x;
      v41.double y = y;
      unsigned int v13 = NSStringFromCGPoint(v41);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      double v15 = (void *)v14;
      else {
        double v16 = off_1000206C0[a4 - 1];
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = v14;
      __int16 v37 = 2112;
      v38 = v16;
      __int16 v39 = 2048;
      unint64_t v40 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Begin swipe from %@ %@ with %lu finger(s)",  buf,  0x20u);
    }

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
    [v17 setAlpha:1.0];

    int v18 = objc_opt_new(&OBJC_CLASS___FKASwipeState);
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    -[FKAIncrementalGestureState setStartFingerControllerPoint:](v18, "setStartFingerControllerPoint:");
    -[FKASwipeState setDirection:](v18, "setDirection:", a4);
    -[FKASwipeState setNumberOfFingers:](v18, "setNumberOfFingers:", a5);
    unint64_t v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_100002CC0;
    v28 = &unk_100020630;
    v29 = v18;
    v30 = self;
    uint64_t v31 = v20;
    uint64_t v32 = v22;
    unint64_t v33 = a5;
    int64_t v34 = a4;
    v23 = v18;
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v25,  0.3));
    -[FKAIncrementalGestureState setStartGestureTimer:](v23, "setStartGestureTimer:", v24, v25, v26, v27, v28);

    -[FKAGestureViewController setIncrementalGestureState:](self, "setIncrementalGestureState:", v23);
  }

- (void)beginPinchOutFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = FKALogCommon(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12.double x = x;
    v12.double y = y;
    double v8 = NSStringFromCGPoint(v12);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Begin pinch out from %@", (uint8_t *)&v10, 0xCu);
  }

  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:]( self,  "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:",  0LL,  x,  y,  30.0,  0.0);
}

- (void)beginPinchInFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = FKALogCommon(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12.double x = x;
    v12.double y = y;
    double v8 = NSStringFromCGPoint(v12);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Begin pinch in from %@", (uint8_t *)&v10, 0xCu);
  }

  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:]( self,  "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:",  1LL,  x,  y,  -20.0,  0.0);
}

- (void)beginRotateLeftFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = FKALogCommon(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12.double x = x;
    v12.double y = y;
    double v8 = NSStringFromCGPoint(v12);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Begin rotate left from %@", (uint8_t *)&v10, 0xCu);
  }

  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:]( self,  "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:",  2LL,  x,  y,  0.0,  -1.0);
}

- (void)beginRotateRightFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = FKALogCommon(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12.double x = x;
    v12.double y = y;
    double v8 = NSStringFromCGPoint(v12);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Begin rotate right from %@", (uint8_t *)&v10, 0xCu);
  }

  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:]( self,  "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:",  3LL,  x,  y,  0.0,  1.0);
}

- (void)_beginPinchOrRotateFromPoint:(CGPoint)a3 type:(int64_t)a4 pinchGestureSpeed:(double)a5 angleUpdateMultiplier:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    uint64_t v13 = FKALogCommon(-[FKAGestureViewController _cancelGestureIfNecessary](self, "_cancelGestureIfNecessary"));
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Begin pinch/rotate", buf, 2u);
    }

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
    [v15 setAlpha:1.0];

    double v16 = objc_opt_new(&OBJC_CLASS___FKAPinchRotateState);
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    -[FKAIncrementalGestureState setStartFingerControllerPoint:](v16, "setStartFingerControllerPoint:");
    -[FKAPinchRotateState setType:](v16, "setType:", a4);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    unint64_t v25 = sub_100003634;
    uint64_t v26 = &unk_100020630;
    uint64_t v29 = v18;
    uint64_t v30 = v20;
    v27 = v16;
    v28 = self;
    double v31 = a5;
    double v32 = a6;
    uint64_t v21 = v16;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v23,  0.3));
    -[FKAIncrementalGestureState setStartGestureTimer:](v21, "setStartGestureTimer:", v22, v23, v24, v25, v26);

    -[FKAGestureViewController setIncrementalGestureState:](self, "setIncrementalGestureState:", v21);
  }

- (void)begin3DTouchAtPoint:(CGPoint)a3
{
  double y = CGPointZero.y;
  if (a3.x != CGPointZero.x || a3.y != y)
  {
    double v5 = a3.y;
    double x = a3.x;
    uint64_t v8 = FKALogCommon(-[FKAGestureViewController _cancelGestureIfNecessary](self, "_cancelGestureIfNecessary"));
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v32.double x = x;
      v32.double y = v5;
      int v10 = NSStringFromCGPoint(v32);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      double v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Begin 3D Touch from %@", buf, 0xCu);
    }

    CGPoint v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
    [v12 setAlpha:1.0];

    uint64_t v13 = objc_opt_new(&OBJC_CLASS___FKAIncrementalGestureState);
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, v5);
    double v15 = v14;
    double v17 = v16;
    -[FKAIncrementalGestureState setStartFingerControllerPoint:](v13, "setStartFingerControllerPoint:");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[FKAIncrementalGestureState setGestureStartTime:](v13, "setGestureStartTime:", v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[FKAGestureViewController _fingerModelsForFingerControllerPoint:numberOfFingers:]( self,  "_fingerModelsForFingerControllerPoint:numberOfFingers:",  1LL,  v15,  v17));
    objc_msgSend(v19, "showFingerModels:animated:startPointForAnimation:", v20, 0, CGPointZero.x, y);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
    [v21 pressFingersDownAnimated:0];

    double v22 = AXForceTouchThreshold();
    double v23 = AXForceTouchUpdateInterval;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100003C40;
    v26[3] = &unk_1000206A0;
    v27 = v13;
    v28 = self;
    double v29 = v22;
    uint64_t v24 = v13;
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v26,  v23));
    -[FKAIncrementalGestureState setGestureUpdateTimer:](v24, "setGestureUpdateTimer:", v25);

    -[FKAGestureViewController setIncrementalGestureState:](self, "setIncrementalGestureState:", v24);
  }

- (void)endIncrementalGesture
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController incrementalGestureState](self, "incrementalGestureState"));
  uint64_t v4 = FKALogCommon(v3);
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "End incremental gesture", (uint8_t *)&v27, 2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 gestureStartTime]);
    if (v7)
    {

      -[FKAGestureViewController _cleanUpExistingIncrementalGesture](self, "_cleanUpExistingIncrementalGesture");
    }

    else
    {
      if ([v3 isSwipe])
      {
        id v8 = -[FKAGestureViewController _cleanUpExistingIncrementalGesture](self, "_cleanUpExistingIncrementalGesture");
      }

      else
      {
        unsigned __int8 v9 = [v3 isPinchOrRotate];
        id v8 = -[FKAGestureViewController _cleanUpExistingIncrementalGesture](self, "_cleanUpExistingIncrementalGesture");
        if ((v9 & 1) == 0) {
          goto LABEL_29;
        }
      }

      uint64_t v10 = FKALogCommon(v8);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        unsigned int v12 = [v3 isSwipe];
        uint64_t v13 = @"pinch/rotate";
        if (v12) {
          uint64_t v13 = @"swipe";
        }
        int v27 = 138412290;
        v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Performing a fast %@ because the incremental version never started.",  (uint8_t *)&v27,  0xCu);
      }

      if ([v3 isSwipe])
      {
        id v14 = v3;
        [v14 startFingerControllerPoint];
        double v16 = v15;
        double v18 = v17;
        unint64_t v19 = (unint64_t)[v14 direction] - 1;
        if (v19 > 2) {
          double v20 = -3.14159265;
        }
        else {
          double v20 = dbl_10001E488[v19];
        }
        id v24 = [v14 numberOfFingers];

        unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture flickGestureAtPoint:angle:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "flickGestureAtPoint:angle:numberOfFingers:",  v24,  v16,  v18,  v20));
      }

      else
      {
        id v21 = v3;
        double v22 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
        [v22 bounds];

        switch((unint64_t)[v21 type])
        {
          case 0uLL:
            [v21 startFingerControllerPoint];
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture pinchOutGestureWithPoint:bounds:]( &OBJC_CLASS___AXNamedReplayableGesture,  "pinchOutGestureWithPoint:bounds:"));
            goto LABEL_26;
          case 1uLL:
            [v21 startFingerControllerPoint];
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture pinchInGestureWithPoint:bounds:]( &OBJC_CLASS___AXNamedReplayableGesture,  "pinchInGestureWithPoint:bounds:"));
            goto LABEL_26;
          case 2uLL:
            [v21 startFingerControllerPoint];
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture rotateLeftGestureWithPoint:bounds:]( &OBJC_CLASS___AXNamedReplayableGesture,  "rotateLeftGestureWithPoint:bounds:"));
            goto LABEL_26;
          case 3uLL:
            [v21 startFingerControllerPoint];
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture rotateRightGestureWithPoint:bounds:]( &OBJC_CLASS___AXNamedReplayableGesture,  "rotateRightGestureWithPoint:bounds:"));
LABEL_26:
            unint64_t v25 = (void *)v23;
            break;
          default:
            unint64_t v25 = 0LL;
            break;
        }
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController fingerController](self, "fingerController"));
      [v26 performGesture:v25];
    }
  }

  else
  {
    if (v6)
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Attempted to end incremental gesture, but none in progress",  (uint8_t *)&v27,  2u);
    }
  }

- (CGPoint)_convertedPointToGestureView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fixedCoordinateSpace]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGestureViewController view](self, "view"));
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (FKAIncrementalGestureState)incrementalGestureState
{
  return self->_incrementalGestureState;
}

- (void)setIncrementalGestureState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end