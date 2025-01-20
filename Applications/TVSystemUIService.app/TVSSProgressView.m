@interface TVSSProgressView
- (CAShapeLayer)outlineLayer;
- (CAShapeLayer)progressLayer;
- (NSObservation)progressObservation;
- (TVSSProgressView)initWithFrame:(CGRect)a3;
- (double)indeterminateMaxProgress;
- (double)outlineLineWidth;
- (double)progress;
- (double)progressLineWidth;
- (void)_beginObservingProgress:(id)a3;
- (void)_fadeIn;
- (void)_fadeOut;
- (void)_setDefaults;
- (void)_updateLayerPaths;
- (void)_updateWithProgressFractionCompleted:(double)a3;
- (void)layoutSubviews;
- (void)resetProgress;
- (void)setIndeterminateMaxProgress:(double)a3;
- (void)setOutlineLineWidth:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgressLineWidth:(double)a3;
- (void)setTintColor:(id)a3;
- (void)startWithFuture:(id)a3;
- (void)startWithProgess:(id)a3;
@end

@implementation TVSSProgressView

- (TVSSProgressView)initWithFrame:(CGRect)a3
{
  CGRect v25 = a3;
  SEL v23 = a2;
  v24 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSSProgressView;
  v24 = -[TVSSProgressView initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v24, v24);
  if (v24)
  {
    v3 = (CAShapeLayer *)+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer");
    outlineLayer = v24->_outlineLayer;
    v24->_outlineLayer = v3;

    v9 = v24->_outlineLayer;
    v10 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    -[CAShapeLayer setFillColor:](v9, "setFillColor:", -[UIColor CGColor](v10, "CGColor"));

    v11 = v24->_outlineLayer;
    id v13 = -[TVSSProgressView tintColor](v24, "tintColor");
    id v12 = [v13 colorWithAlphaComponent:0.3];
    -[CAShapeLayer setStrokeColor:](v11, "setStrokeColor:", [v12 CGColor]);

    id v15 = -[TVSSProgressView layer](v24, "layer");
    v14 = -[TVSSProgressView outlineLayer](v24, "outlineLayer");
    objc_msgSend(v15, "addSublayer:");

    v5 = (CAShapeLayer *)+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer");
    progressLayer = v24->_progressLayer;
    v24->_progressLayer = v5;

    v16 = v24->_progressLayer;
    v17 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    -[CAShapeLayer setFillColor:](v16, "setFillColor:", -[UIColor CGColor](v17, "CGColor"));

    v18 = v24->_progressLayer;
    id v19 = -[TVSSProgressView tintColor](v24, "tintColor");
    -[CAShapeLayer setStrokeColor:](v18, "setStrokeColor:", [v19 CGColor]);

    -[CAShapeLayer setLineCap:](v24->_progressLayer, "setLineCap:", kCALineCapRound);
    id v21 = -[TVSSProgressView layer](v24, "layer");
    v20 = -[TVSSProgressView progressLayer](v24, "progressLayer");
    objc_msgSend(v21, "addSublayer:");

    -[TVSSProgressView _setDefaults](v24, "_setDefaults");
    -[TVSSProgressView _updateLayerPaths](v24, "_updateLayerPaths");
  }

  v8 = v24;
  objc_storeStrong((id *)&v24, 0LL);
  return v8;
}

- (void)layoutSubviews
{
  id v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSSProgressView;
  -[TVSSProgressView layoutSubviews](&v13, "layoutSubviews");
  id v6 = -[TVSSProgressView layer](v15, "layer");
  [v6 bounds];
  double v9 = v2;
  double v10 = v3;
  double v11 = v4;
  double v12 = v5;

  v7 = -[TVSSProgressView outlineLayer](v15, "outlineLayer");
  -[CAShapeLayer setFrame:](v7, "setFrame:", v9, v10, v11, v12);

  v8 = -[TVSSProgressView progressLayer](v15, "progressLayer");
  -[CAShapeLayer setFrame:](v8, "setFrame:", v9, v10, v11, v12);

  -[TVSSProgressView _updateLayerPaths](v15, "_updateLayerPaths");
}

- (void)startWithFuture:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v9 = -[TVSSProgressView progressLayer](v30, "progressLayer");
  -[CAShapeLayer removeAllAnimations](v9, "removeAllAnimations");

  -[TVSSProgressView _fadeIn](v30, "_fadeIn");
  -[TVSSProgressView setProgress:](v30, "setProgress:", 0.8);
  v28 =  +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd");
  -[CABasicAnimation setDuration:](v28, "setDuration:", 2.0);
  -[CABasicAnimation setFromValue:](v28, "setFromValue:", &off_1001C8FD0);
  double v10 = v28;
  -[TVSSProgressView progress](v30, "progress");
  double v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  -[CABasicAnimation setToValue:](v10, "setToValue:");

  double v12 = v28;
  LODWORD(v3) = 1036831949;
  LODWORD(v4) = 0.5;
  LODWORD(v5) = 0.25;
  LODWORD(v6) = 1.0;
  objc_super v13 =  +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v3,  v4,  v5,  v6);
  -[CABasicAnimation setTimingFunction:](v12, "setTimingFunction:");

  SEL v14 = -[TVSSProgressView progressLayer](v30, "progressLayer");
  -[CAShapeLayer addAnimation:forKey:](v14, "addAnimation:forKey:", v28, @"TVSSProgressViewStartingAnimation");

  id v15 = location[0];
  v22[1] = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  CGRect v25 = sub_1001168F0;
  v26 = &unk_1001BB5C8;
  v27 = v30;
  id v7 = objc_msgSend(v15, "addSuccessBlock:");
  id v16 = location[0];
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_100116C44;
  id v21 = &unk_1001B6270;
  v22[0] = v30;
  id v8 = objc_msgSend(v16, "addFailureBlock:");
  objc_storeStrong(v22, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)startWithProgess:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSProgressView _beginObservingProgress:](v5, "_beginObservingProgress:", location[0]);
  double v3 = -[TVSSProgressView progressLayer](v5, "progressLayer");
  -[CAShapeLayer removeAllAnimations](v3, "removeAllAnimations");

  -[TVSSProgressView _fadeIn](v5, "_fadeIn");
  objc_storeStrong(location, 0LL);
}

- (void)resetProgress
{
}

- (double)outlineLineWidth
{
  double v4 = -[TVSSProgressView outlineLayer](self, "outlineLayer");
  -[CAShapeLayer lineWidth](v4, "lineWidth");
  double v5 = v2;

  return v5;
}

- (void)setOutlineLineWidth:(double)a3
{
  double v3 = -[TVSSProgressView outlineLayer](self, "outlineLayer");
  -[CAShapeLayer setLineWidth:](v3, "setLineWidth:", a3);
}

- (void)setProgressLineWidth:(double)a3
{
  self->_progressLineWidth = a3;
  double v3 = -[TVSSProgressView progressLayer](self, "progressLayer");
  -[CAShapeLayer setLineWidth:](v3, "setLineWidth:", a3);

  -[TVSSProgressView _updateLayerPaths](self, "_updateLayerPaths");
}

- (void)setTintColor:(id)a3
{
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)&OBJC_CLASS___TVSSProgressView;
  -[TVSSProgressView setTintColor:](&v8, "setTintColor:", location[0]);
  outlineLayer = v10->_outlineLayer;
  id v5 = -[TVSSProgressView tintColor](v10, "tintColor");
  id v4 = [v5 colorWithAlphaComponent:0.3];
  -[CAShapeLayer setStrokeColor:](outlineLayer, "setStrokeColor:", [v4 CGColor]);

  progressLayer = v10->_progressLayer;
  id v7 = -[TVSSProgressView tintColor](v10, "tintColor");
  -[CAShapeLayer setStrokeColor:](progressLayer, "setStrokeColor:", [v7 CGColor]);

  objc_storeStrong(location, 0LL);
}

- (void)_setDefaults
{
}

- (void)_updateLayerPaths
{
  id v13 = -[TVSSProgressView layer](self, "layer");
  [v13 bounds];
  v19.origin.x = v2;
  v19.origin.y = v3;
  v19.size.width = v4;
  v19.size.height = v5;

  CGRect v18 = CGRectInset(v19, 4.0 / 2.0, 4.0 / 2.0);
  CGRectGetMidX(v18);
  CGRectGetMidY(v18);
  sub_100117324();
  double v16 = v6;
  double v17 = v7;
  double Width = CGRectGetWidth(v18);
  double Height = CGRectGetHeight(v18);
  if (Width >= Height) {
    double v12 = Height;
  }
  else {
    double v12 = Width;
  }
  double v9 = -[TVSSProgressView outlineLayer](self, "outlineLayer");
  objc_super v8 =  +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithOvalInRect:",  v18.origin.x,  v18.origin.y,  v18.size.width,  v18.size.height);
  -[CAShapeLayer setPath:](v9, "setPath:", -[UIBezierPath CGPath](v8, "CGPath"));

  double v11 = -[TVSSProgressView progressLayer](self, "progressLayer");
  double v10 =  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v16,  v17,  v12 / 2.0,  -1.57079633,  -1.57079633 + 6.28318531);
  -[CAShapeLayer setPath:](v11, "setPath:", -[UIBezierPath CGPath](v10, "CGPath"));
}

  ;
}

- (void)_fadeIn
{
  objc_super v8 = self;
  v7[1] = (id)a2;
  -[TVSSProgressView setHidden:](self, "setHidden:", 0LL);
  CGFloat v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  CGFloat v5 = sub_100117408;
  double v6 = &unk_1001B5A60;
  v7[0] = v8;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", 0.3);
  objc_storeStrong(v7, 0LL);
}

- (void)_fadeOut
{
  SEL v14 = self;
  v13[1] = (id)a2;
  objc_super v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  double v11 = sub_10011754C;
  double v12 = &unk_1001B5A60;
  v13[0] = self;
  CGFloat v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  CGFloat v5 = sub_100117580;
  double v6 = &unk_1001BB5F0;
  double v7 = v14;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v8,  0.3);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(v13, 0LL);
}

- (void)_updateWithProgressFractionCompleted:(double)a3
{
  objc_super v22 = self;
  SEL v21 = a2;
  double v20 = a3;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  SEL v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  double v17 = sub_100117814;
  CGRect v18 = &unk_1001B5A60;
  CGRect v19 = v22;
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:");
  CGFloat v5 = -[TVSSProgressView progressLayer](v22, "progressLayer");
  id v4 = -[CAShapeLayer presentationLayer](v5, "presentationLayer");
  [v4 strokeEnd];
  double v6 = v3;

  double v13 = v6;
  -[TVSSProgressView setProgress:](v22, "setProgress:", v20);
  double v12 =  +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd");
  -[CABasicAnimation setDuration:](v12, "setDuration:", 0.2);
  double v7 = v12;
  objc_super v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13);
  -[CABasicAnimation setFromValue:](v7, "setFromValue:");

  int v9 = v12;
  -[TVSSProgressView progress](v22, "progress");
  int v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  -[CABasicAnimation setToValue:](v9, "setToValue:");

  double v11 = -[TVSSProgressView progressLayer](v22, "progressLayer");
  -[CAShapeLayer addAnimation:forKey:](v11, "addAnimation:forKey:", v12, @"TVSSProgressViewNSProgressAnimation");

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
}

- (void)_beginObservingProgress:(id)a3
{
  SEL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  CGFloat v5 =  +[NSObservableKeyPath keyPathWithRootObject:path:]( &OBJC_CLASS___NSObservableKeyPath,  "keyPathWithRootObject:path:",  location[0],  "fractionCompleted");
  double v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1001179D8;
  int v10 = &unk_1001BB618;
  objc_copyWeak(v11, &from);
  double v3 = (NSObservation *)-[NSObservableKeyPath addObserverBlock:](v5, "addObserverBlock:", &v6);
  progressObservation = v14->_progressObservation;
  v14->_progressObservation = v3;

  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (double)indeterminateMaxProgress
{
  return self->_indeterminateMaxProgress;
}

- (void)setIndeterminateMaxProgress:(double)a3
{
  self->_indeterminateMaxProgress = a3;
}

- (CAShapeLayer)outlineLayer
{
  return self->_outlineLayer;
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSObservation)progressObservation
{
  return self->_progressObservation;
}

- (void).cxx_destruct
{
}

@end