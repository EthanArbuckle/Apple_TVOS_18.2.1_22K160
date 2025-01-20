@interface TVSSCameraZoomSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isContinuous;
- (BOOL)shouldTrack;
- (CGPoint)lastThumbLocation;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVSSCameraZoomSlider)initWithFrame:(CGRect)a3;
- (TVSSCameraZoomSliderProgressView)progressBarView;
- (UIImage)maximumValueImage;
- (UIImage)minimumValueImage;
- (UIImageView)maxValueIconView;
- (UIImageView)minValueIconView;
- (UIView)thumbView;
- (double)maxBarWidth;
- (float)maximumValue;
- (float)minimumValue;
- (float)value;
- (id)_focusedProgressColor;
- (id)_unfocusedProgressColor;
- (void)_panUpdated:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setContinuous:(BOOL)a3;
- (void)setMaxBarWidth:(double)a3;
- (void)setMaximumValue:(float)a3;
- (void)setMaximumValueImage:(id)a3;
- (void)setMinimumValue:(float)a3;
- (void)setMinimumValueImage:(id)a3;
- (void)setValue:(float)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation TVSSCameraZoomSlider

- (TVSSCameraZoomSlider)initWithFrame:(CGRect)a3
{
  CGRect v56 = a3;
  SEL v54 = a2;
  v55 = 0LL;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomSlider;
  v39 = -[TVSSCameraZoomSlider initWithFrame:]( &v53,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v55 = v39;
  objc_storeStrong((id *)&v55, v39);
  if (v39)
  {
    v55->_maxBarWidth = 1.79769313e308;
    v55->_minimumValue = 0.0;
    v55->_maximumValue = 1.0;
    id v52 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 1LL);
    v51 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v52,  3LL);
    v3 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    minValueIconView = v55->_minValueIconView;
    v55->_minValueIconView = v3;

    -[UIImageView setPreferredSymbolConfiguration:](v55->_minValueIconView, "setPreferredSymbolConfiguration:", v51);
    -[TVSSCameraZoomSlider addSubview:](v55, "addSubview:", v55->_minValueIconView);
    v5 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    maxValueIconView = v55->_maxValueIconView;
    v55->_maxValueIconView = v5;

    -[UIImageView setPreferredSymbolConfiguration:](v55->_maxValueIconView, "setPreferredSymbolConfiguration:", v51);
    -[TVSSCameraZoomSlider addSubview:](v55, "addSubview:", v55->_maxValueIconView);
    v7 = objc_alloc_init(&OBJC_CLASS___TVSSCameraZoomSliderProgressView);
    progressBarView = v55->_progressBarView;
    v55->_progressBarView = v7;

    v26 = v55->_progressBarView;
    -[TVSSCameraZoomSlider bounds](v55, "bounds");
    double v47 = v9;
    double v48 = v10;
    double v49 = v11;
    double v50 = v12;
    -[TVSSCameraZoomSliderProgressView setFrame:](v26, "setFrame:", v9, v10, v11, v12);
    LODWORD(v13) = 1036831949;
    -[TVSSCameraZoomSliderProgressView setProgress:animated:](v55->_progressBarView, "setProgress:animated:", 0LL, v13);
    v27 = v55->_progressBarView;
    id v28 = -[TVSSCameraZoomSlider _focusedProgressColor](v55, "_focusedProgressColor");
    -[TVSSCameraZoomSliderProgressView setTintColor:](v27, "setTintColor:");

    -[TVSSCameraZoomSlider addSubview:](v55, "addSubview:", v55->_progressBarView);
    v29 = objc_alloc(&OBJC_CLASS___UIView);
    sub_1000A03C8();
    double v43 = v14;
    double v44 = v15;
    double v45 = v16;
    double v46 = v17;
    v18 = -[UIView initWithFrame:](v29, "initWithFrame:", v14, v15, v16, v17);
    thumbView = v55->_thumbView;
    v55->_thumbView = v18;

    v30 = v55->_thumbView;
    v31 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UIView setBackgroundColor:](v30, "setBackgroundColor:");

    v32 = -[UIView layer](v55->_thumbView, "layer");
    -[CALayer setCornerRadius:](v32, "setCornerRadius:", 25.0);

    -[UIView bounds](v55->_thumbView, "bounds");
    CGRect v41 = v57;
    CGPathRef v42 = CGPathCreateWithEllipseInRect(v57, 0LL);
    v33 = -[UIView layer](v55->_thumbView, "layer");
    -[CALayer setShadowPath:](v33, "setShadowPath:", v42);

    v35 = -[UIView layer](v55->_thumbView, "layer");
    v34 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
    -[CALayer setShadowColor:](v35, "setShadowColor:", -[UIColor CGColor](v34, "CGColor"));

    v36 = -[UIView layer](v55->_thumbView, "layer");
    sub_1000A0414();
    v40[1] = v20;
    v40[2] = v21;
    -[CALayer setShadowOffset:](v36, "setShadowOffset:", *(double *)&v20, *(double *)&v21);

    v37 = -[UIView layer](v55->_thumbView, "layer");
    LODWORD(v22) = 1045220557;
    -[CALayer setShadowOpacity:](v37, "setShadowOpacity:", v22);

    v38 = -[UIView layer](v55->_thumbView, "layer");
    -[CALayer setShadowRadius:](v38, "setShadowRadius:", 10.0);

    CGPathRelease(v42);
    -[TVSSCameraZoomSlider addSubview:](v55, "addSubview:", v55->_thumbView);
    v23 = objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer);
    v40[0] = -[UIPanGestureRecognizer initWithTarget:action:](v23, "initWithTarget:action:", v55, "_panUpdated:");
    [v40[0] _setHysteresis:200.0];
    -[TVSSCameraZoomSlider addGestureRecognizer:](v55, "addGestureRecognizer:", v40[0]);
    objc_storeStrong(v40, 0LL);
    objc_storeStrong((id *)&v51, 0LL);
    objc_storeStrong(&v52, 0LL);
  }

  v25 = v55;
  objc_storeStrong((id *)&v55, 0LL);
  return v25;
}

  ;
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)layoutSubviews
{
  v32 = self;
  SEL v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomSlider;
  -[TVSSCameraZoomSlider layoutSubviews](&v30, "layoutSubviews");
  -[TVSSCameraZoomSlider bounds](v32, "bounds");
  CGRect v29 = v35;
  double v28 = 0.0;
  double Width = CGRectGetWidth(v35);
  id v26 = -[TVSSCameraZoomSlider minValueIconView](v32, "minValueIconView");
  [v26 sizeToFit];
  id location = -[TVSSCameraZoomSlider maxValueIconView](v32, "maxValueIconView");
  [location sizeToFit];
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVSSCameraZoomSlider semanticContentAttribute](v32, "semanticContentAttribute")) == (id)1)
  {
    v2 = -[TVSSCameraZoomSlider maxValueIconView](v32, "maxValueIconView");
    id v3 = v26;
    id v26 = v2;

    v4 = -[TVSSCameraZoomSlider minValueIconView](v32, "minValueIconView");
    id v5 = location;
    id location = v4;
  }

  if (v32->_minimumValueImage)
  {
    [v26 frame];
    double v28 = v28 + v6 + 30.0;
  }

  if (v32->_maximumValueImage)
  {
    [location frame];
    double Width = Width - (v7 + 30.0);
  }

  [v26 frame];
  double v23 = v8;
  double v24 = v9;
  sub_1000A09CC();
  objc_msgSend(v26, "setFrame:", v10, v11, v23, v24);
  [location frame];
  double v21 = v12;
  double v22 = v13;
  sub_1000A09CC();
  objc_msgSend(location, "setFrame:", v14, v15, v21, v22);
  if (v32->_maxBarWidth >= Width - v28) {
    double maxBarWidth = Width - v28;
  }
  else {
    double maxBarWidth = v32->_maxBarWidth;
  }
  -[TVSSCameraZoomSliderProgressView setFrame:]( v32->_progressBarView,  "setFrame:",  Width - maxBarWidth,  19.0,  maxBarWidth,  12.0);
  -[TVSSCameraZoomSliderProgressView _progressCenter](v32->_progressBarView, "_progressCenter");
  -[TVSSCameraZoomSlider convertPoint:fromView:](v32, "convertPoint:fromView:", v32->_progressBarView, v16, v17);
  double v34 = v18;
  double v33 = v19;
  -[UIView setCenter:](v32->_thumbView, "setCenter:", v18, v19);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v26, 0LL);
}

  ;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setValue:(float)a3
{
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  double v21 = self;
  SEL v20 = a2;
  float v19 = a3;
  BOOL v18 = a4;
  if (a3 != self->_value)
  {
    v21->_value = v19;
    -[TVSSCameraZoomSlider minimumValue](v21, "minimumValue");
    double v17 = v4;
    -[TVSSCameraZoomSlider maximumValue](v21, "maximumValue");
    double v16 = v5;
    sub_1000A0C94((uint64_t)v15, v17, v5);
    v13[0] = v15[0];
    v13[1] = v15[1];
    double v6 = BSIntervalFractionForValue(v13, v19);
    double v14 = v6;
    *(float *)&double v6 = v6;
    -[TVSSCameraZoomSliderProgressView setProgress:](v21->_progressBarView, "setProgress:", v6);
    -[TVSSCameraZoomSlider setNeedsLayout](v21, "setNeedsLayout");
    if (v18)
    {
      double v7 = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      double v10 = sub_1000A0CC8;
      double v11 = &unk_1001B5A60;
      double v12 = v21;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v7, 0.3);
      objc_storeStrong((id *)&v12, 0LL);
    }
  }

- (void)setMinimumValueImage:(id)a3
{
  float v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_minimumValueImage)
  {
    objc_storeStrong((id *)&v4->_minimumValueImage, location[0]);
    -[UIImageView setImage:](v4->_minValueIconView, "setImage:", location[0]);
    -[TVSSCameraZoomSlider setNeedsLayout](v4, "setNeedsLayout");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMaximumValueImage:(id)a3
{
  float v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_maximumValueImage)
  {
    objc_storeStrong((id *)&v4->_maximumValueImage, location[0]);
    -[UIImageView setImage:](v4->_maxValueIconView, "setImage:", location[0]);
    -[TVSSCameraZoomSlider setNeedsLayout](v4, "setNeedsLayout");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMaxBarWidth:(double)a3
{
  if (a3 != self->_maxBarWidth)
  {
    self->_double maxBarWidth = a3;
    -[TVSSCameraZoomSlider setNeedsLayout](self, "setNeedsLayout");
  }

- (double)maxBarWidth
{
  return self->_maxBarWidth;
}

- (BOOL)shouldTrack
{
  return 0;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)_panUpdated:(id)a3
{
  CGRect v29 = (CGPoint *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = [location[0] state];
  if (v27 == (id)1)
  {
    SEL v20 = v29;
    [location[0] locationInView:v29];
    v26.x = v3;
    v26.y = v4;
    v20[5] = v26;
  }

  else if (v27 == (id)2)
  {
    [location[0] locationInView:v29];
    v25.x = v5;
    v25.y = v6;
    double v19 = v6;
    -[CGPoint frame](v29, "frame");
    double v23 = v19 - CGRectGetHeight(v30) / 2.0;
    if (v23 >= 0.0) {
      double v18 = v23;
    }
    else {
      double v18 = -v23;
    }
    if (v18 <= 170.0)
    {
      if (v18 <= 120.0)
      {
        if (v18 <= 50.0) {
          float v24 = 0.25;
        }
        else {
          float v24 = 0.125;
        }
      }

      else
      {
        float v24 = 0.0625;
      }
    }

    else
    {
      float v24 = 0.03125;
    }

    CGFloat v15 = v25.x - v29[5].x;
    -[CGPoint frame](v29, "frame");
    CGFloat v17 = v15 / CGRectGetWidth(v31);
    -[CGPoint maximumValue](v29, "maximumValue");
    float v16 = v7;
    -[CGPoint minimumValue](v29, "minimumValue");
    double v22 = v17 * (float)(v16 - v8) * v24;
    -[CGPoint minimumValue](v29, "minimumValue");
    float v21 = v9;
    -[CGPoint value](v29, "value");
    if (v21 >= v10 + v22) {
      double v14 = v21;
    }
    else {
      double v14 = v10 + v22;
    }
    -[CGPoint maximumValue](v29, "maximumValue");
    if (v14 >= v11) {
      double v13 = v11;
    }
    else {
      double v13 = v14;
    }
    HIDWORD(v12) = HIDWORD(v13);
    *(float *)&double v12 = v13;
    -[CGPoint setValue:](v29, "setValue:", v12, *(void *)&v13);
    v29[5] = v25;
  }

  else
  {
    v29[5] = CGPointZero;
    if (v27 == (id)3) {
      -[CGPoint sendActionsForControlEvents:](v29, "sendActionsForControlEvents:", 4096LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_focusedProgressColor
{
  CGFloat v4 = (dispatch_once_t *)&unk_100221D00;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B9810);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221CF8;
}

- (id)_unfocusedProgressColor
{
  CGFloat v4 = (dispatch_once_t *)&unk_100221D10;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B9830);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221D08;
}

- (float)value
{
  return self->_value;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (UIImage)minimumValueImage
{
  return self->_minimumValueImage;
}

- (UIImage)maximumValueImage
{
  return self->_maximumValueImage;
}

- (TVSSCameraZoomSliderProgressView)progressBarView
{
  return self->_progressBarView;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (UIImageView)minValueIconView
{
  return self->_minValueIconView;
}

- (UIImageView)maxValueIconView
{
  return self->_maxValueIconView;
}

- (UIView)thumbView
{
  return self->_thumbView;
}

- (CGPoint)lastThumbLocation
{
  double y = self->_lastThumbLocation.y;
  double x = self->_lastThumbLocation.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end