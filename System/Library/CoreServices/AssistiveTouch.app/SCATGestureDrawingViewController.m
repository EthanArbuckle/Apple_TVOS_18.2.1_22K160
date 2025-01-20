@interface SCATGestureDrawingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPerformingMove;
- (BOOL)allowsDwellSelection;
- (BOOL)areFingersPressed;
- (BOOL)isCurving;
- (BOOL)isRotating;
- (BOOL)liftsOnMoveEnd;
- (BOOL)pressesOnMoveStart;
- (CGPoint)_fingerCenter;
- (NSArray)fingerPositions;
- (NSTimer)generalTimer;
- (NSTimer)moveTimer;
- (SCATGestureDrawingViewController)init;
- (SCATGestureDrawingViewController)initWithElementManager:(id)a3 startingFingerPositions:(id)a4 menu:(id)a5;
- (SCATGestureDrawingViewDelegate)delegate;
- (double)_previewDistance;
- (double)angle;
- (double)curvature;
- (double)velocity;
- (id)_currentElementProvider;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (void)_adjustCurvatureWithDirection:(double)a3;
- (void)_cancelMoveTimerAndEndMove:(BOOL)a3;
- (void)_cleanUp;
- (void)_curveOnLeft:(BOOL)a3 withCurveRadius:(double)a4;
- (void)_decreaseCurvature;
- (void)_endGeneralTimer;
- (void)_endMovementAndForceLift:(BOOL)a3;
- (void)_increaseCurvature;
- (void)_installStopButtonForActionName:(id)a3;
- (void)_move;
- (void)_moveStraight;
- (void)_pushFreehandSheetOfClass:(Class)a3;
- (void)_rotateClockwise;
- (void)_rotateCounterclockwise;
- (void)_startGeneralTimerWithSelector:(SEL)a3 actionName:(id)a4;
- (void)_uninstallStopButton;
- (void)_updateMainViewToolbarFrame;
- (void)autoLiftToggledForFreehandSheet:(id)a3;
- (void)autoPressToggledForFreehandSheet:(id)a3;
- (void)bendForFreehandSheet:(id)a3;
- (void)bendLeftForFreehandSheet:(id)a3;
- (void)bendRightForFreehandSheet:(id)a3;
- (void)dealloc;
- (void)decreaseVelocityForFreehandSheet:(id)a3;
- (void)didPopFreehandSheet:(id)a3;
- (void)freehandSheet:(id)a3 didHighlightBend:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightBendLeft:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightBendRight:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightMove:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotate:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCCW90:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCCW:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCW90:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCW:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightStraighten:(BOOL)a4;
- (void)increaseVelocityForFreehandSheet:(id)a3;
- (void)loadView;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)moveForFreehandSheet:(id)a3;
- (void)moveToolbarForFreehandSheet:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)rotate90ClockwiseForFreehandSheet:(id)a3;
- (void)rotate90CounterclockwiseForFreehandSheet:(id)a3;
- (void)rotateClockwiseForFreehandSheet:(id)a3;
- (void)rotateCounterclockwiseForFreehandSheet:(id)a3;
- (void)rotateForFreehandSheet:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setAngle:(double)a3;
- (void)setAreFingersPressed:(BOOL)a3;
- (void)setCurvature:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerPositions:(id)a3;
- (void)setGeneralTimer:(id)a3;
- (void)setIsCurving:(BOOL)a3;
- (void)setIsRotating:(BOOL)a3;
- (void)setLiftsOnMoveEnd:(BOOL)a3;
- (void)setMoveTimer:(id)a3;
- (void)setPressesOnMoveStart:(BOOL)a3;
- (void)setVelocity:(double)a3;
- (void)stopForFreehandSheet:(id)a3;
- (void)straightenForFreehandSheet:(id)a3;
- (void)toggleTouchForFreehandSheet:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATGestureDrawingViewController

- (SCATGestureDrawingViewController)init
{
  return 0LL;
}

- (SCATGestureDrawingViewController)initWithElementManager:(id)a3 startingFingerPositions:(id)a4 menu:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingViewController;
  v10 = -[SCATElementManagerViewController initWithElementManager:](&v24, "initWithElementManager:", a3);
  v11 = v10;
  if (v10)
  {
    -[SCATGestureDrawingViewController setFingerPositions:](v10, "setFingerPositions:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 preferenceForKey:@"DrawingAngle"]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 preferenceForKey:@"DrawingVelocity"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 preferenceForKey:@"DrawingCurvature"]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 preferenceForKey:@"DrawingPressOnMove"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 preferenceForKey:@"DrawingLiftOnMove"]);
    if (v13) {
      [v13 doubleValue];
    }
    else {
      double v18 = -0.785398163;
    }
    -[SCATGestureDrawingViewController setAngle:](v11, "setAngle:", v18);
    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v19 = 1.0;
    }
    -[SCATGestureDrawingViewController setVelocity:](v11, "setVelocity:", v19);
    if (v15) {
      [v15 doubleValue];
    }
    else {
      double v20 = 0.0;
    }
    -[SCATGestureDrawingViewController setCurvature:](v11, "setCurvature:", v20);
    if (v16) {
      uint64_t v21 = (uint64_t)[v16 BOOLValue];
    }
    else {
      uint64_t v21 = 1LL;
    }
    -[SCATGestureDrawingViewController setPressesOnMoveStart:](v11, "setPressesOnMoveStart:", v21);
    if (v17) {
      uint64_t v22 = (uint64_t)[v17 BOOLValue];
    }
    else {
      uint64_t v22 = 1LL;
    }
    -[SCATGestureDrawingViewController setLiftsOnMoveEnd:](v11, "setLiftsOnMoveEnd:", v22);
    objc_storeStrong((id *)&v11->_menu, a5);
    -[SCATMenu registerMenuObserver:](v11->_menu, "registerMenuObserver:", v11);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingViewController;
  -[SCATGestureDrawingViewController dealloc](&v3, "dealloc");
}

- (void)_updateMainViewToolbarFrame
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self->_menu, "menuVisualProvider"));
  [v12 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  objc_msgSend(v11, "setFrameForToolbar:", v4, v6, v8, v10);
}

- (void)orientationDidChange:(id)a3
{
}

- (void)loadView
{
  double v3 = objc_alloc_init(&OBJC_CLASS___SCATGestureDrawingView);
  -[SCATGestureDrawingViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingViewController;
  -[SCATElementManagerViewController viewDidLoad](&v5, "viewDidLoad");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions"));
  [v3 setFingerPositions:v4];

  -[SCATGestureDrawingViewController angle](self, "angle");
  objc_msgSend(v3, "setAngle:");
  -[SCATGestureDrawingViewController curvature](self, "curvature");
  objc_msgSend(v3, "setCurvature:");
  -[SCATGestureDrawingViewController _previewDistance](self, "_previewDistance");
  objc_msgSend(v3, "setPreviewDistance:");
}

- (void)_pushFreehandSheetOfClass:(Class)a3
{
  id v4 = [[a3 alloc] initWithMenu:self->_menu];
  [v4 setDelegate:self];
  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v4);
}

- (double)_previewDistance
{
  double v4 = v3;
  -[HNDHandManager screenFrame:]_0(v5, v6);
  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  double v9 = v8 * 0.5;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  [v10 arrowHeadTipOffset];
  double v12 = v9 - v11 + -5.0;

  -[SCATGestureDrawingViewController velocity](self, "velocity");
  return (log(v13) + 2.30258509) / 4.60517019 * (v12 + -50.0) + 50.0;
}

- (void)setVelocity:(double)a3
{
  if (self->_velocity != a3)
  {
    self->_velocity = a3;
    if (-[SCATGestureDrawingViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SCATGestureDrawingViewController _previewDistance](self, "_previewDistance");
      double v6 = v5;
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
      [v7 setPreviewDistance:v6];
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v9 setPreference:v8 forKey:@"DrawingVelocity"];
  }

- (void)setFingerPositions:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_fingerPositions != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_fingerPositions, a3);
    unsigned int v6 = -[SCATGestureDrawingViewController isViewLoaded](self, "isViewLoaded");
    double v5 = v8;
    if (v6)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", v8));
      [v7 setFingerPositions:v8];

      double v5 = v8;
    }
  }
}

- (void)setAngle:(double)a3
{
  if (self->_angle != a3)
  {
    self->_angle = a3;
    if (-[SCATGestureDrawingViewController isViewLoaded](self, "isViewLoaded"))
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
      [v5 setAngle:a3];
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v7 setPreference:v6 forKey:@"DrawingAngle"];
  }

- (void)setCurvature:(double)a3
{
  if (self->_curvature != a3)
  {
    self->_curvature = a3;
    if (-[SCATGestureDrawingViewController isViewLoaded](self, "isViewLoaded"))
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
      [v5 setCurvature:a3];
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v7 setPreference:v6 forKey:@"DrawingCurvature"];
  }

- (void)setPressesOnMoveStart:(BOOL)a3
{
  if (self->_pressesOnMoveStart != a3)
  {
    BOOL v3 = a3;
    self->_pressesOnMoveStart = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v5 setPreference:v4 forKey:@"DrawingPressOnMove"];
  }

- (void)setLiftsOnMoveEnd:(BOOL)a3
{
  if (self->_liftsOnMoveEnd != a3)
  {
    BOOL v3 = a3;
    self->_liftsOnMoveEnd = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v5 setPreference:v4 forKey:@"DrawingLiftOnMove"];
  }

- (void)_installStopButtonForActionName:(id)a3
{
  id v4 = a3;
  double v8 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuGestureFreehandStopSheet),  "initWithMenu:",  self->_menu);
  -[SCATModernMenuGestureFreehandSheetBase setDelegate:](v8, "setDelegate:", self);
  -[SCATModernMenuGestureFreehandStopSheet setActionToStop:](v8, "setActionToStop:", v4);

  -[SCATMenu pushSheet:](self->_menu, "pushSheet:", v8);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v5 setShowsRotationControls:0];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v6 setShowsRotation90Controls:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v7 setShowsCurvatureControls:0];
}

- (void)_uninstallStopButton
{
  BOOL v3 = -[SCATGestureDrawingViewController isRotating](self, "isRotating");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v4 setShowsRotationControls:v3];

  BOOL v5 = -[SCATGestureDrawingViewController isRotating](self, "isRotating");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v6 setShowsRotation90Controls:v5];

  BOOL v7 = -[SCATGestureDrawingViewController isCurving](self, "isCurving");
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v8 setShowsCurvatureControls:v7];
}

- (void)_startGeneralTimerWithSelector:(SEL)a3 actionName:(id)a4
{
  id v9 = a4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v7 = dbl_100118030[[v6 switchControlScanningStyle] == 0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  a3,  0LL,  1LL,  v7));
  -[SCATGestureDrawingViewController setGeneralTimer:](self, "setGeneralTimer:", v8);

  -[SCATGestureDrawingViewController _installStopButtonForActionName:](self, "_installStopButtonForActionName:", v9);
}

- (void)_endGeneralTimer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController generalTimer](self, "generalTimer"));
  [v3 invalidate];

  -[SCATGestureDrawingViewController setGeneralTimer:](self, "setGeneralTimer:", 0LL);
  -[SCATGestureDrawingViewController _uninstallStopButton](self, "_uninstallStopButton");
}

- (void)setAreFingersPressed:(BOOL)a3
{
  if (self->_areFingersPressed != a3)
  {
    BOOL v3 = a3;
    self->_areFingersPressed = a3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
    [v5 setFingersPressed:v3];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = WeakRetained;
    if (v3) {
      [WeakRetained touchDownForDrawingViewController:self];
    }
    else {
      [WeakRetained touchUpForDrawingViewController:self];
    }
  }

- (void)_rotateClockwise
{
}

- (void)_rotateCounterclockwise
{
}

- (void)_adjustCurvatureWithDirection:(double)a3
{
  double v6 = fabs(v5) * 0.01;
  if (v6 < 0.0001) {
    double v6 = 0.0001;
  }
  double v7 = v6 * a3;
  -[SCATGestureDrawingViewController curvature](self, "curvature");
  -[SCATGestureDrawingViewController setCurvature:](self, "setCurvature:", v8 + v7);
  -[SCATGestureDrawingViewController curvature](self, "curvature");
  if (v9 <= 0.0) {
    double v10 = -1.0;
  }
  else {
    double v10 = 1.0;
  }
  -[SCATGestureDrawingViewController curvature](self, "curvature");
  if (v11 * v10 > 0.2) {
    -[SCATGestureDrawingViewController setCurvature:](self, "setCurvature:", v10 * 0.2);
  }
}

- (void)_increaseCurvature
{
}

- (void)_decreaseCurvature
{
}

- (BOOL)_isPerformingMove
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController moveTimer](self, "moveTimer"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_cancelMoveTimerAndEndMove:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController moveTimer](self, "moveTimer"));
  [v5 invalidate];

  if (v3)
  {
    -[SCATGestureDrawingViewController setMoveTimer:](self, "setMoveTimer:", 0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
    [v6 setFingersHighlighted:0];
  }

- (void)_endMovementAndForceLift:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATGestureDrawingViewController _cancelMoveTimerAndEndMove:](self, "_cancelMoveTimerAndEndMove:", 1LL);
  if (-[SCATGestureDrawingViewController liftsOnMoveEnd](self, "liftsOnMoveEnd") || v3)
  {
    if (-[SCATGestureDrawingViewController areFingersPressed](self, "areFingersPressed")) {
      -[SCATGestureDrawingViewController setAreFingersPressed:](self, "setAreFingersPressed:", 0LL);
    }
  }

  -[SCATGestureDrawingViewController _uninstallStopButton](self, "_uninstallStopButton");
}

- (CGPoint)_fingerCenter
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    CGFloat v10 = CGSizeZero.height;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        CGPoint v12 = CGPointFromString((NSString *)*(void *)(*((void *)&v16 + 1) + 8LL * (void)v11));
        v24.origin.CGFloat x = v12.x;
        v24.origin.CGFloat y = v12.y;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        v24.size.CGFloat width = CGSizeZero.width;
        v24.size.CGFloat height = v10;
        CGRect v23 = CGRectUnion(v22, v24);
        CGFloat x = v23.origin.x;
        CGFloat y = v23.origin.y;
        CGFloat width = v23.size.width;
        CGFloat height = v23.size.height;
        double v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  double Center = AX_CGRectGetCenter(v13);
  result.CGFloat y = v15;
  result.CGFloat x = Center;
  return result;
}

- (void)_moveStraight
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  -[SCATGestureDrawingViewController velocity](self, "velocity");
  double v6 = v5;
  -[SCATGestureDrawingViewController angle](self, "angle");
  double v8 = cos(v7);
  -[SCATGestureDrawingViewController velocity](self, "velocity");
  double v10 = v9;
  -[SCATGestureDrawingViewController angle](self, "angle");
  double v12 = sin(v11);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions", 0LL));
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    double v16 = v6 * v8;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v13);
        }
        CGPoint v19 = CGPointFromString((NSString *)*(void *)(*((void *)&v24 + 1) + 8LL * (void)i));
        v29.CGFloat x = v16 + v19.x;
        v29.CGFloat y = v10 * v12 + v19.y;
        double v20 = NSStringFromCGPoint(v29);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        [v4 addObject:v21];
      }

      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v15);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v23 = [WeakRetained drawingViewController:self moveFingersToPoints:v4];

  if (v23) {
    -[SCATGestureDrawingViewController setFingerPositions:](self, "setFingerPositions:", v4);
  }
  else {
    -[SCATGestureDrawingViewController _cancelMoveTimerAndEndMove:](self, "_cancelMoveTimerAndEndMove:", 0LL);
  }
}

- (void)_curveOnLeft:(BOOL)a3 withCurveRadius:(double)a4
{
  BOOL v5 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  -[SCATGestureDrawingViewController _fingerCenter](self, "_fingerCenter");
  double v10 = v9;
  double v12 = v11;
  double v34 = 0.0;
  CGPoint v33 = CGPointZero;
  -[SCATGestureDrawingViewController angle](self, "angle");
  double v14 = v13;
  -[SCATGestureDrawingViewController velocity](self, "velocity");
  +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:]( &OBJC_CLASS___SCATGestureArrowView,  "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadiu s:distanceToMove:onLeft:",  0LL,  0LL,  0LL,  &v34,  &v33,  v5,  v14,  v10,  v12,  a4,  v15);
  CGPoint v16 = v33;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController fingerPositions](self, "fingerPositions", 0LL));
  id v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    double v20 = v16.x - v10;
    double v21 = v16.y - v12;
    uint64_t v22 = *(void *)v30;
    do
    {
      unsigned int v23 = 0LL;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v17);
        }
        CGPoint v24 = CGPointFromString((NSString *)*(void *)(*((void *)&v29 + 1) + 8LL * (void)v23));
        v36.CGFloat x = v20 + v24.x;
        v36.CGFloat y = v21 + v24.y;
        __int128 v25 = NSStringFromCGPoint(v36);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        [v8 addObject:v26];

        unsigned int v23 = (char *)v23 + 1;
      }

      while (v19 != v23);
      id v19 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v19);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v28 = [WeakRetained drawingViewController:self moveFingersToPoints:v8];

  if (v28)
  {
    -[SCATGestureDrawingViewController setFingerPositions:](self, "setFingerPositions:", v8);
    -[SCATGestureDrawingViewController setAngle:](self, "setAngle:", v34);
  }

  else
  {
    -[SCATGestureDrawingViewController _cancelMoveTimerAndEndMove:](self, "_cancelMoveTimerAndEndMove:", 0LL);
  }
}

- (void)_move
{
  if (v4 == 0.0)
  {
    -[SCATGestureDrawingViewController _moveStraight](self, "_moveStraight", v3, v4);
  }

  else
  {
    -[SCATGestureDrawingViewController curvature](self, "curvature");
    BOOL v6 = v5 < 0.0;
    -[SCATGestureDrawingViewController curvature](self, "curvature");
    -[SCATGestureDrawingViewController _curveOnLeft:withCurveRadius:]( self,  "_curveOnLeft:withCurveRadius:",  v6,  fabs(1.0 / v7));
  }

- (void)_cleanUp
{
  if (-[SCATGestureDrawingViewController _isPerformingMove](self, "_isPerformingMove"))
  {
    -[SCATGestureDrawingViewController _endMovementAndForceLift:](self, "_endMovementAndForceLift:", 1LL);
  }

  else
  {
    -[SCATGestureDrawingViewController _endGeneralTimer](self, "_endGeneralTimer");
    if (-[SCATGestureDrawingViewController areFingersPressed](self, "areFingersPressed")) {
      -[SCATGestureDrawingViewController setAreFingersPressed:](self, "setAreFingersPressed:", 0LL);
    }
  }

- (void)didPopFreehandSheet:(id)a3
{
  if (-[SCATGestureDrawingViewController isRotating](self, "isRotating", a3))
  {
    -[SCATGestureDrawingViewController setIsRotating:](self, "setIsRotating:", 0LL);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
    [v4 setShowsRotationControls:0];

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
    [v5 setShowsRotation90Controls:0];
  }

  else
  {
    if (!-[SCATGestureDrawingViewController isCurving](self, "isCurving")) {
      return;
    }
    -[SCATGestureDrawingViewController setIsCurving:](self, "setIsCurving:", 0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
    [v5 setShowsCurvatureControls:0];
  }
}

- (void)freehandSheet:(id)a3 didHighlightMove:(BOOL)a4
{
  BOOL v5 = a4 || -[SCATGestureDrawingViewController _isPerformingMove](self, "_isPerformingMove", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  [v6 setFingersHighlighted:v5];
}

- (void)freehandSheet:(id)a3 didHighlightRotate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a4 || -[SCATGestureDrawingViewController isRotating](self, "isRotating", a3);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  [v7 setShowsRotationControls:v6];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rotateClockwiseControl]);
  [v9 setHighlighted:v4];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v11 rotateCounterclockwiseControl]);
  [v10 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBend:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a4 || -[SCATGestureDrawingViewController isCurving](self, "isCurving", a3);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  [v7 setShowsCurvatureControls:v6];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 decreaseCurveControl]);
  [v9 setHighlighted:v4];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 increaseCurveControl]);
  [v11 setHighlighted:v4];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v13 straightenCurveControl]);
  [v12 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCCW:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 rotateCounterclockwiseControl]);
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCW:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 rotateClockwiseControl]);
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCCW90:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rotateCounterclockwiseControl]);
  [v7 setHighlighted:v4];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v9 rotate90CounterclockwiseButton]);
  [v8 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCW90:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rotateClockwiseControl]);
  [v7 setHighlighted:v4];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v9 rotate90ClockwiseButton]);
  [v8 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBendRight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 increaseCurveControl]);
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBendLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 decreaseCurveControl]);
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightStraighten:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 straightenCurveControl]);
  [v5 setHighlighted:v4];
}

- (void)moveToolbarForFreehandSheet:(id)a3
{
  -[SCATMenu slideDockToPosition:]( self->_menu,  "slideDockToPosition:",  -[SCATMenu dockPosition](self->_menu, "dockPosition", a3) == 0);
  -[SCATGestureDrawingViewController _updateMainViewToolbarFrame](self, "_updateMainViewToolbarFrame");
}

- (void)moveForFreehandSheet:(id)a3
{
  if (-[SCATGestureDrawingViewController pressesOnMoveStart](self, "pressesOnMoveStart", a3)
    && !-[SCATGestureDrawingViewController areFingersPressed](self, "areFingersPressed"))
  {
    -[SCATGestureDrawingViewController setAreFingersPressed:](self, "setAreFingersPressed:", 1LL);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v5 = dbl_100118030[[v4 switchControlScanningStyle] == 0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_move",  0LL,  1LL,  v5));
  -[SCATGestureDrawingViewController setMoveTimer:](self, "setMoveTimer:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v7 setFingersHighlighted:1];

  id v8 = sub_10002B014(@"FREEHAND_MOVING");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[SCATGestureDrawingViewController _installStopButtonForActionName:](self, "_installStopButtonForActionName:", v9);
}

- (void)autoPressToggledForFreehandSheet:(id)a3
{
}

- (void)autoLiftToggledForFreehandSheet:(id)a3
{
}

- (void)stopForFreehandSheet:(id)a3
{
  if (-[SCATGestureDrawingViewController _isPerformingMove](self, "_isPerformingMove", a3)) {
    -[SCATGestureDrawingViewController _endMovementAndForceLift:](self, "_endMovementAndForceLift:", 0LL);
  }
  else {
    -[SCATGestureDrawingViewController _endGeneralTimer](self, "_endGeneralTimer");
  }
  -[SCATMenu popSheet](self->_menu, "popSheet");
}

- (void)rotateForFreehandSheet:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v4 setShowsRotationControls:1];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v5 setShowsRotation90Controls:1];

  *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandRotateSheet, v6).n128_u64[0];
  -[SCATGestureDrawingViewController _pushFreehandSheetOfClass:](self, "_pushFreehandSheetOfClass:", v8, v7);
}

- (void)bendForFreehandSheet:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController mainView](self, "mainView"));
  [v4 setShowsCurvatureControls:1];

  *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandBendSheet, v5).n128_u64[0];
  -[SCATGestureDrawingViewController _pushFreehandSheetOfClass:](self, "_pushFreehandSheetOfClass:", v7, v6);
}

- (void)rotateCounterclockwiseForFreehandSheet:(id)a3
{
  id v4 = sub_10002B014(@"FREEHAND_ROTATING");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SCATGestureDrawingViewController _startGeneralTimerWithSelector:actionName:]( self,  "_startGeneralTimerWithSelector:actionName:",  "_rotateCounterclockwise",  v5);
}

- (void)rotateClockwiseForFreehandSheet:(id)a3
{
  id v4 = sub_10002B014(@"FREEHAND_ROTATING");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SCATGestureDrawingViewController _startGeneralTimerWithSelector:actionName:]( self,  "_startGeneralTimerWithSelector:actionName:",  "_rotateClockwise",  v5);
}

- (void)rotate90CounterclockwiseForFreehandSheet:(id)a3
{
}

- (void)rotate90ClockwiseForFreehandSheet:(id)a3
{
}

- (void)straightenForFreehandSheet:(id)a3
{
}

- (void)bendRightForFreehandSheet:(id)a3
{
  id v4 = sub_10002B014(@"FREEHAND_BENDING");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SCATGestureDrawingViewController _startGeneralTimerWithSelector:actionName:]( self,  "_startGeneralTimerWithSelector:actionName:",  "_increaseCurvature",  v5);
}

- (void)bendLeftForFreehandSheet:(id)a3
{
  id v4 = sub_10002B014(@"FREEHAND_BENDING");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SCATGestureDrawingViewController _startGeneralTimerWithSelector:actionName:]( self,  "_startGeneralTimerWithSelector:actionName:",  "_decreaseCurvature",  v5);
}

- (void)increaseVelocityForFreehandSheet:(id)a3
{
  double v5 = v4 * 1.1;
  if (v5 > 10.0) {
    double v5 = 10.0;
  }
  -[SCATGestureDrawingViewController setVelocity:](self, "setVelocity:", v5);
}

- (void)decreaseVelocityForFreehandSheet:(id)a3
{
  double v5 = v4 / 1.1;
  if (v5 < 0.1) {
    double v5 = 0.1;
  }
  -[SCATGestureDrawingViewController setVelocity:](self, "setVelocity:", v5);
}

- (void)toggleTouchForFreehandSheet:(id)a3
{
}

- (void)menuWillDisappear:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController delegate](self, "delegate", a3));
  [v4 exitDrawingViewController:self];
}

- (void)menuDidFinishTransition:(id)a3
{
}

- (id)_currentElementProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self->_menu, "currentSheet"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elementProvider]);

  return v3;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController _currentElementProvider](self, "_currentElementProvider"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstElementWithOptions:a3]);

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController _currentElementProvider](self, "_currentElementProvider"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElementWithOptions:a3]);

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController _currentElementProvider](self, "_currentElementProvider"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementAfter:v8 didWrap:a4 options:a5]);

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController _currentElementProvider](self, "_currentElementProvider"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementBefore:v8 didWrap:a4 options:a5]);

  return v10;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  id v17 = (id)objc_claimAutoreleasedReturnValue([a3 scatUIContext]);
  [v17 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController view](self, "view"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController view](self, "view"));
  [v17 insertSubview:v13 atIndex:0];

  *(void *)&double v15 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandMainSheet, v14).n128_u64[0];
  -[SCATGestureDrawingViewController _pushFreehandSheetOfClass:](self, "_pushFreehandSheetOfClass:", v16, v15);
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  id v18 = (id)objc_claimAutoreleasedReturnValue([a3 scatUIContextForDisplayID:*(void *)&a4]);
  [v18 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController view](self, "view"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController view](self, "view"));
  [v18 insertSubview:v14 atIndex:0];

  *(void *)&double v16 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandMainSheet, v15).n128_u64[0];
  -[SCATGestureDrawingViewController _pushFreehandSheetOfClass:](self, "_pushFreehandSheetOfClass:", v17, v16);
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingViewController view](self, "view", a3, a4));
  [v5 removeFromSuperview];

  -[SCATGestureDrawingViewController _cleanUp](self, "_cleanUp");
}

- (BOOL)allowsDwellSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self->_menu, "currentSheet"));
  unsigned __int8 v3 = [v2 shouldAllowDwellSelection];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATGestureDrawingViewDelegate)delegate
{
  return (SCATGestureDrawingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pressesOnMoveStart
{
  return self->_pressesOnMoveStart;
}

- (BOOL)liftsOnMoveEnd
{
  return self->_liftsOnMoveEnd;
}

- (BOOL)areFingersPressed
{
  return self->_areFingersPressed;
}

- (double)angle
{
  return self->_angle;
}

- (double)velocity
{
  return self->_velocity;
}

- (double)curvature
{
  return self->_curvature;
}

- (NSArray)fingerPositions
{
  return self->_fingerPositions;
}

- (NSTimer)moveTimer
{
  return self->_moveTimer;
}

- (void)setMoveTimer:(id)a3
{
}

- (NSTimer)generalTimer
{
  return self->_generalTimer;
}

- (void)setGeneralTimer:(id)a3
{
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (void)setIsRotating:(BOOL)a3
{
  self->_isRotating = a3;
}

- (BOOL)isCurving
{
  return self->_isCurving;
}

- (void)setIsCurving:(BOOL)a3
{
  self->_isCurving = a3;
}

- (void).cxx_destruct
{
}

@end