@interface TVSSTimerCountdownView
- (BOOL)isStarted;
- (CALayer)mainLayer;
- (CAShapeLayer)backgroundCircleLayer;
- (CAShapeLayer)countdownCircleLayer;
- (TVSSTimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5;
- (TVSSTimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5 remainingTime:(double)a6 duration:(double)a7;
- (UIColor)backgroundBarColor;
- (UIColor)barColor;
- (double)angleForValue:(double)a3 total:(double)a4;
- (double)barWidth;
- (double)degToRad:(double)a3;
- (double)duration;
- (double)remainingTime;
- (int64_t)state;
- (void)layoutSubviews;
- (void)pause;
- (void)resume;
- (void)setAnimationRemainingTime:(double)a3 totalTime:(double)a4;
- (void)setBackgroundBarColor:(id)a3;
- (void)setBackgroundCircleLayer:(id)a3;
- (void)setBarColor:(id)a3;
- (void)setBarWidth:(double)a3;
- (void)setCountdownCircleLayer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMainLayer:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setupBackgroundCircle;
- (void)start;
- (void)stop;
@end

@implementation TVSSTimerCountdownView

- (TVSSTimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  double v12 = a5;
  v5 = v15;
  v15 = 0LL;
  v11.receiver = v5;
  v11.super_class = (Class)&OBJC_CLASS___TVSSTimerCountdownView;
  v10 = -[TVSSTimerCountdownView init](&v11, "init");
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    -[TVSSTimerCountdownView setBarColor:](v15, "setBarColor:", location[0]);
    -[TVSSTimerCountdownView setBarWidth:](v15, "setBarWidth:", v12);
    -[TVSSTimerCountdownView setBackgroundBarColor:](v15, "setBackgroundBarColor:", v13);
  }

  v7 = v15;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v7;
}

- (TVSSTimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5 remainingTime:(double)a6 duration:(double)a7
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  v7 = v17;
  v17 = 0LL;
  v14 = -[TVSSTimerCountdownView initWithBarColor:backgroundBarColor:barWidth:]( v7,  "initWithBarColor:backgroundBarColor:barWidth:",  location[0],  v15,  a5);
  v17 = v14;
  objc_storeStrong((id *)&v17, v14);
  if (v14)
  {
    -[TVSSTimerCountdownView setRemainingTime:](v17, "setRemainingTime:", a6);
    -[TVSSTimerCountdownView setDuration:](v17, "setDuration:", a7);
  }

  v9 = v17;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  return v9;
}

- (void)layoutSubviews
{
  v35 = self;
  SEL v34 = a2;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___TVSSTimerCountdownView;
  -[TVSSTimerCountdownView layoutSubviews](&v33, "layoutSubviews");
  v23 = -[TVSSTimerCountdownView countdownCircleLayer](v35, "countdownCircleLayer");
  -[CAShapeLayer beginTime](v23, "beginTime");
  BOOL v24 = v2 <= 0.0;

  if (!v24)
  {
    char v31 = 0;
    char v29 = 0;
    if ((id)-[TVSSTimerCountdownView state](v35, "state") == (id)2)
    {
      v32 = -[TVSSTimerCountdownView countdownCircleLayer](v35, "countdownCircleLayer");
      char v31 = 1;
      -[CAShapeLayer timeOffset](v32, "timeOffset");
      double v22 = v3;
    }

    else
    {
      double v21 = CACurrentMediaTime();
      v30 = -[TVSSTimerCountdownView countdownCircleLayer](v35, "countdownCircleLayer");
      char v29 = 1;
      -[CAShapeLayer beginTime](v30, "beginTime");
      double v22 = v21 - v4;
    }

    if ((v29 & 1) != 0) {

    }
    if ((v31 & 1) != 0) {
    -[TVSSTimerCountdownView remainingTime](v35, "remainingTime");
    }
    -[TVSSTimerCountdownView setRemainingTime:](v35, "setRemainingTime:", v5 - v22);
  }

  double v12 = -[TVSSTimerCountdownView mainLayer](v35, "mainLayer");
  -[CALayer removeFromSuperlayer](v12, "removeFromSuperlayer");

  id v13 = objc_alloc_init(&OBJC_CLASS___CALayer);
  -[TVSSTimerCountdownView setMainLayer:](v35, "setMainLayer:");

  id v15 = -[TVSSTimerCountdownView layer](v35, "layer");
  v14 = -[TVSSTimerCountdownView mainLayer](v35, "mainLayer");
  objc_msgSend(v15, "addSublayer:");

  -[TVSSTimerCountdownView frame](v35, "frame");
  -[TVSSTimerCountdownView frame](v35, "frame");
  sub_100023930();
  double v25 = v6;
  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  v16 = -[TVSSTimerCountdownView mainLayer](v35, "mainLayer");
  -[CALayer setFrame:](v16, "setFrame:", v25, v26, v27, v28);

  v17 = -[TVSSTimerCountdownView mainLayer](v35, "mainLayer");
  -[CALayer setAllowsGroupBlending:](v17, "setAllowsGroupBlending:", 0LL);

  id v18 = -[TVSSTimerCountdownView layer](v35, "layer");
  [v18 setAllowsGroupBlending:0];

  -[TVSSTimerCountdownView setupBackgroundCircle](v35, "setupBackgroundCircle");
  v19 = v35;
  -[TVSSTimerCountdownView remainingTime](v35, "remainingTime");
  double v20 = v10;
  -[TVSSTimerCountdownView duration](v35, "duration");
  -[TVSSTimerCountdownView setAnimationRemainingTime:totalTime:](v19, "setAnimationRemainingTime:totalTime:", v20, v11);
  if ((id)-[TVSSTimerCountdownView state](v35, "state") == (id)1) {
    -[TVSSTimerCountdownView start](v35, "start");
  }
}

  ;
}

- (void)setupBackgroundCircle
{
  v61 = self;
  v60[1] = (id)a2;
  v43 = -[TVSSTimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");

  if (v43)
  {
    v42 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
    -[CAShapeLayer removeFromSuperlayer](v42, "removeFromSuperlayer");
  }

  -[TVSSTimerCountdownView frame](v61, "frame");
  uint64_t v54 = v2;
  uint64_t v55 = v3;
  uint64_t v56 = v4;
  uint64_t v57 = v5;
  -[TVSSTimerCountdownView frame](v61, "frame");
  uint64_t v50 = v6;
  uint64_t v51 = v7;
  uint64_t v52 = v8;
  uint64_t v53 = v9;
  sub_100023E14();
  double v58 = v10;
  double v59 = v11;
  -[TVSSTimerCountdownView frame](v61, "frame");
  uint64_t v46 = v12;
  uint64_t v47 = v13;
  double v48 = v14;
  uint64_t v49 = v15;
  double v25 = v14 / 2.0;
  -[TVSSTimerCountdownView barWidth](v61, "barWidth");
  double v26 = v25 - v16 / 2.0;
  -[TVSSTimerCountdownView degToRad:](v61, "degToRad:", -90.0);
  double v27 = v17;
  -[TVSSTimerCountdownView degToRad:](v61, "degToRad:", 270.0);
  v60[0] =  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v58,  v59,  v26,  v27,  v18);
  double v28 = objc_opt_new(&OBJC_CLASS___CAShapeLayer);
  -[TVSSTimerCountdownView setBackgroundCircleLayer:](v61, "setBackgroundCircleLayer:");

  id v29 = [v60[0] CGPath];
  v30 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setPath:](v30, "setPath:", v29);

  id v33 = +[UIColor systemGray5Color](&OBJC_CLASS___UIColor, "systemGray5Color");
  id v31 = [v33 CGColor];
  v32 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setFillColor:](v32, "setFillColor:", v31);

  v36 = -[TVSSTimerCountdownView backgroundBarColor](v61, "backgroundBarColor");
  SEL v34 = -[UIColor CGColor](v36, "CGColor");
  v35 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setStrokeColor:](v35, "setStrokeColor:", v34);

  -[TVSSTimerCountdownView barWidth](v61, "barWidth");
  double v37 = v19;
  v38 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setLineWidth:](v38, "setLineWidth:", v37);

  v39 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setStrokeEnd:](v39, "setStrokeEnd:", 1.0);

  id v40 = -[TVSSTimerCountdownView traitCollection](v61, "traitCollection");
  BOOL v41 = [v40 userInterfaceStyle] == (id)2;

  BOOL v45 = v41;
  if (v41) {
    uint64_t v24 = kCAFilterPlusL;
  }
  else {
    uint64_t v24 = kCAFilterPlusD;
  }
  v44 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v24);
  double v20 = v44;
  double v21 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CAShapeLayer setCompositingFilter:](v21, "setCompositingFilter:", v20);

  v23 = -[TVSSTimerCountdownView mainLayer](v61, "mainLayer");
  double v22 = -[TVSSTimerCountdownView backgroundCircleLayer](v61, "backgroundCircleLayer");
  -[CALayer addSublayer:](v23, "addSublayer:");

  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong(v60, 0LL);
}

  ;
}

- (void)setAnimationRemainingTime:(double)a3 totalTime:(double)a4
{
  v39 = self;
  SEL v38 = a2;
  double v37 = a3;
  double v36 = a4;
  -[TVSSTimerCountdownView setRemainingTime:](self, "setRemainingTime:", a3);
  -[TVSSTimerCountdownView setDuration:](v39, "setDuration:", v36);
  -[TVSSTimerCountdownView angleForValue:total:](v39, "angleForValue:total:", v37, v36);
  double v35 = v4;
  id v31 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");

  if (v31)
  {
    v30 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
    -[CAShapeLayer removeFromSuperlayer](v30, "removeFromSuperlayer");
  }

  -[TVSSTimerCountdownView frame](v39, "frame");
  -[TVSSTimerCountdownView frame](v39, "frame");
  sub_100023E14();
  double v32 = v5;
  double v33 = v6;
  -[TVSSTimerCountdownView frame](v39, "frame");
  double v12 = v7 / 2.0;
  -[TVSSTimerCountdownView barWidth](v39, "barWidth");
  double v13 = v12 - v8 / 2.0;
  -[TVSSTimerCountdownView degToRad:](v39, "degToRad:", -90.0);
  double v14 = v9;
  -[TVSSTimerCountdownView degToRad:](v39, "degToRad:", v35);
  SEL v34 =  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v32,  v33,  v13,  v14,  v10);
  uint64_t v15 = objc_opt_new(&OBJC_CLASS___CAShapeLayer);
  -[TVSSTimerCountdownView setCountdownCircleLayer:](v39, "setCountdownCircleLayer:");

  double v16 = -[UIBezierPath CGPath](v34, "CGPath");
  double v17 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setPath:](v17, "setPath:", v16);

  double v20 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  double v18 = -[UIColor CGColor](v20, "CGColor");
  double v19 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setFillColor:](v19, "setFillColor:", v18);

  v23 = -[TVSSTimerCountdownView barColor](v39, "barColor");
  double v21 = -[UIColor CGColor](v23, "CGColor");
  double v22 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", v21);

  -[TVSSTimerCountdownView barWidth](v39, "barWidth");
  double v24 = v11;
  double v25 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setLineWidth:](v25, "setLineWidth:", v24);

  double v26 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setStrokeEnd:](v26, "setStrokeEnd:", 1.0);

  double v27 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CAShapeLayer setLineCap:](v27, "setLineCap:", kCALineCapRound);

  id v29 = -[TVSSTimerCountdownView mainLayer](v39, "mainLayer");
  double v28 = -[TVSSTimerCountdownView countdownCircleLayer](v39, "countdownCircleLayer");
  -[CALayer addSublayer:](v29, "addSublayer:");

  objc_storeStrong((id *)&v34, 0LL);
}

- (void)start
{
  double v10 = self;
  v9[1] = (id)a2;
  -[TVSSTimerCountdownView setState:](self, "setState:", 1LL);
  v9[0] =  +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd");
  -[TVSSTimerCountdownView remainingTime](v10, "remainingTime");
  objc_msgSend(v9[0], "setDuration:");
  [v9[0] setFromValue:&off_1001C8918];
  [v9[0] setToValue:&off_1001C8930];
  [v9[0] setRemovedOnCompletion:0];
  uint64_t v3 =  +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionLinear);
  objc_msgSend(v9[0], "setTimingFunction:");

  double v6 = -[TVSSTimerCountdownView countdownCircleLayer](v10, "countdownCircleLayer");
  -[CAShapeLayer convertTime:fromLayer:](v6, "convertTime:fromLayer:", CACurrentMediaTime());
  double v4 = v2;
  double v5 = -[TVSSTimerCountdownView countdownCircleLayer](v10, "countdownCircleLayer");
  -[CAShapeLayer setBeginTime:](v5, "setBeginTime:", v4);

  double v7 = -[TVSSTimerCountdownView countdownCircleLayer](v10, "countdownCircleLayer");
  -[CAShapeLayer setStrokeEnd:](v7, "setStrokeEnd:", 0.0);

  double v8 = -[TVSSTimerCountdownView countdownCircleLayer](v10, "countdownCircleLayer");
  -[CAShapeLayer addAnimation:forKey:](v8, "addAnimation:forKey:", v9[0], @"TVSSTimerCountdownViewAnimationKey");

  objc_storeStrong(v9, 0LL);
}

- (double)degToRad:(double)a3
{
  return 3.14159265 * a3 / 180.0;
}

- (double)angleForValue:(double)a3 total:(double)a4
{
  return a3 / a4 * 360.0 + -90.0;
}

- (void)pause
{
  double v4 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  -[CAShapeLayer convertTime:fromLayer:](v4, "convertTime:fromLayer:", 0LL, CACurrentMediaTime());
  double v5 = v2;

  double v6 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  LODWORD(v3) = 0;
  -[CAShapeLayer setSpeed:](v6, "setSpeed:", v3);

  double v7 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  -[CAShapeLayer setTimeOffset:](v7, "setTimeOffset:", v5);
}

- (void)stop
{
  double v2 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  -[CAShapeLayer removeAnimationForKey:](v2, "removeAnimationForKey:", @"TVSSTimerCountdownViewAnimationKey");
}

- (void)resume
{
  double v14 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  id v2 = -[CAShapeLayer animationForKey:](v14, "animationForKey:", @"TVSSTimerCountdownViewAnimationKey");
  BOOL v15 = v2 != 0LL;

  if (v15)
  {
    double v6 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    -[CAShapeLayer timeOffset](v6, "timeOffset");
    double v7 = v3;

    double v8 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    LODWORD(v4) = 1.0;
    -[CAShapeLayer setSpeed:](v8, "setSpeed:", v4);

    double v9 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    -[CAShapeLayer setTimeOffset:](v9, "setTimeOffset:");

    double v10 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    -[CAShapeLayer setBeginTime:](v10, "setBeginTime:", 0.0);

    double v11 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    -[CAShapeLayer convertTime:fromLayer:](v11, "convertTime:fromLayer:", 0LL, CACurrentMediaTime());
    double v12 = v5 - v7;

    double v13 = -[TVSSTimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    -[CAShapeLayer setBeginTime:](v13, "setBeginTime:", v12);
  }

  else
  {
    -[TVSSTimerCountdownView start](self, "start");
  }

- (BOOL)isStarted
{
  BOOL v3 = 1;
  if ((id)-[TVSSTimerCountdownView state](self, "state") != (id)1) {
    return (id)-[TVSSTimerCountdownView state](self, "state") == (id)2;
  }
  return v3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CAShapeLayer)backgroundCircleLayer
{
  return self->_backgroundCircleLayer;
}

- (void)setBackgroundCircleLayer:(id)a3
{
}

- (CAShapeLayer)countdownCircleLayer
{
  return self->_countdownCircleLayer;
}

- (void)setCountdownCircleLayer:(id)a3
{
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
}

- (UIColor)backgroundBarColor
{
  return self->_backgroundBarColor;
}

- (void)setBackgroundBarColor:(id)a3
{
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (CALayer)mainLayer
{
  return self->_mainLayer;
}

- (void)setMainLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end