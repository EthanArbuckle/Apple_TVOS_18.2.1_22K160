@interface ZWLensAutopanner
- (BOOL)isAutomovingLens;
- (CADisplayLink)displayLinkTimer;
- (CGPoint)_lensMovementDeltaForOffset:(CGPoint)a3;
- (ZWLensAutopannerDataSource)dataSource;
- (ZWLensAutopannerDelegate)delegate;
- (void)_beginAutomovingZoomLens;
- (void)_endAutomovingZoomLens;
- (void)_handleDisplayLinkTimerDidFire:(id)a3;
- (void)setAutomovingLens:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLinkTimer:(id)a3;
@end

@implementation ZWLensAutopanner

- (void)_beginAutomovingZoomLens
{
  if (-[ZWLensAutopanner isAutomovingLens](self, "isAutomovingLens")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWLensAutopanner.m",  41LL,  "-[ZWLensAutopanner _beginAutomovingZoomLens]",  @"We are alrady automoving the lens, who is trying to do it again");
  }
  -[ZWLensAutopanner setAutomovingLens:](self, "setAutomovingLens:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner delegate](self, "delegate"));
  [v3 willBeginAutopanningLensWithAutopanner:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner displayLinkTimer](self, "displayLinkTimer"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_handleDisplayLinkTimerDidFire:"));
    -[ZWLensAutopanner setDisplayLinkTimer:](self, "setDisplayLinkTimer:", v5);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner displayLinkTimer](self, "displayLinkTimer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v7 addToRunLoop:v6 forMode:NSRunLoopCommonModes];
}

- (void)_endAutomovingZoomLens
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner displayLinkTimer](self, "displayLinkTimer"));
  [v3 invalidate];

  -[ZWLensAutopanner setDisplayLinkTimer:](self, "setDisplayLinkTimer:", 0LL);
  -[ZWLensAutopanner setAutomovingLens:](self, "setAutomovingLens:", 0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner delegate](self, "delegate"));
  [v4 didFinishAutopanningLensWithAutopanner:self];
}

- (void)_handleDisplayLinkTimerDidFire:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner dataSource](self, "dataSource", a3));
  [v4 offsetForAutopanner:self];
  double v6 = v5;
  double v8 = v7;

  -[ZWLensAutopanner _lensMovementDeltaForOffset:](self, "_lensMovementDeltaForOffset:", v6, v8);
  double v10 = v9;
  double v12 = v11;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner delegate](self, "delegate"));
  objc_msgSend(v13, "autopanner:didAutopanByDelta:", self, v10, v12);
}

- (CGPoint)_lensMovementDeltaForOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_lensMovementDeltaForOffset__onceToken != -1) {
    dispatch_once(&_lensMovementDeltaForOffset__onceToken, &__block_literal_global_4);
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensAutopanner dataSource](self, "dataSource"));
  unsigned int v7 = [v6 offsetValuesAreNormalizedForAutopanner:self];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v9 = [v8 zoomAutopannerShouldPanWithAcceleration];

  if (v7)
  {
    if (!v9)
    {
      double x = x * 600.0;
      double y = y * 600.0;
      goto LABEL_32;
    }

    double v10 = log(fabs(x) + 1.0) * 50.0;
    if (x >= 0.0) {
      double v11 = v10;
    }
    else {
      double v11 = -v10;
    }
    double v12 = log(fabs(y) + 1.0) * 50.0;
    double v13 = -v12;
    if (y >= 0.0) {
      double v13 = v12;
    }
    else {
      double v14 = v11;
    }
    double v15 = -*(double *)&_lensMovementDeltaForOffset__ZWAutomoveMaxSpeed;
    else {
      double x = -*(double *)&_lensMovementDeltaForOffset__ZWAutomoveMaxSpeed;
    }
  }

  else
  {
    if (!v9) {
      goto LABEL_32;
    }
    double v16 = x * fabs(x) / 500.0;
    double v17 = y * fabs(y) / 500.0;
    double v15 = -*(double *)&_lensMovementDeltaForOffset__ZWAutomoveMaxSpeed;
    else {
      double x = -*(double *)&_lensMovementDeltaForOffset__ZWAutomoveMaxSpeed;
    }
    else {
      double v13 = v17;
    }
  }

  if (v13 >= v15) {
    double y = v13;
  }
  else {
    double y = v15;
  }
LABEL_32:
  double v18 = x;
  double v19 = y;
  result.double y = v19;
  result.double x = v18;
  return result;
}

void __48__ZWLensAutopanner__lensMovementDeltaForOffset___block_invoke(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  *(double *)&_lensMovementDeltaForOffset__ZWAutomoveMaxSpeed = 60.0
                                                              / (double)(uint64_t)[v1 maximumFramesPerSecond]
                                                              * 30.0;
}

- (ZWLensAutopannerDataSource)dataSource
{
  return (ZWLensAutopannerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (ZWLensAutopannerDelegate)delegate
{
  return (ZWLensAutopannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAutomovingLens
{
  return self->_automovingLens;
}

- (void)setAutomovingLens:(BOOL)a3
{
  self->_automovingLens = a3;
}

- (CADisplayLink)displayLinkTimer
{
  return self->_displayLinkTimer;
}

- (void)setDisplayLinkTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end