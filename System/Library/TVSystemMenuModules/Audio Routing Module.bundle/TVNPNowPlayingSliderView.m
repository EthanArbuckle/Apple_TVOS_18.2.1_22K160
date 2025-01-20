@interface TVNPNowPlayingSliderView
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isContinuous;
- (BOOL)shouldTrack;
- (CGPoint)lastThumbLocation;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVNPNowPlayingProgressView)progressBarView;
- (TVNPNowPlayingSliderView)initWithFrame:(CGRect)a3;
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
- (void)_leftPressed:(id)a3;
- (void)_panUpdated:(id)a3;
- (void)_rightPressed:(id)a3;
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

@implementation TVNPNowPlayingSliderView

- (TVNPNowPlayingSliderView)initWithFrame:(CGRect)a3
{
  CGRect v60 = a3;
  SEL v58 = a2;
  v59 = 0LL;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___TVNPNowPlayingSliderView;
  v42 = -[TVNPNowPlayingSliderView initWithFrame:]( &v57,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v59 = v42;
  objc_storeStrong((id *)&v59, v42);
  if (v42)
  {
    v59->_maxBarWidth = 1.79769313e308;
    v59->_minimumValue = 0.0;
    v59->_maximumValue = 1.0;
    v28 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v56 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

    v3 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    minValueIconView = v59->_minValueIconView;
    v59->_minValueIconView = v3;

    -[UIImageView setPreferredSymbolConfiguration:](v59->_minValueIconView, "setPreferredSymbolConfiguration:", v56);
    -[TVNPNowPlayingSliderView addSubview:](v59, "addSubview:", v59->_minValueIconView);
    v5 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    maxValueIconView = v59->_maxValueIconView;
    v59->_maxValueIconView = v5;

    -[UIImageView setPreferredSymbolConfiguration:](v59->_maxValueIconView, "setPreferredSymbolConfiguration:", v56);
    -[TVNPNowPlayingSliderView addSubview:](v59, "addSubview:", v59->_maxValueIconView);
    v7 = objc_alloc_init(&OBJC_CLASS___TVNPNowPlayingProgressView);
    progressBarView = v59->_progressBarView;
    v59->_progressBarView = v7;

    v29 = v59->_progressBarView;
    -[TVNPNowPlayingSliderView bounds](v59, "bounds");
    double v52 = v9;
    double v53 = v10;
    double v54 = v11;
    double v55 = v12;
    -[TVNPNowPlayingProgressView setFrame:](v29, "setFrame:", v9, v10, v11, v12);
    LODWORD(v13) = 1036831949;
    -[TVNPNowPlayingProgressView setProgress:animated:](v59->_progressBarView, "setProgress:animated:", 0LL, v13);
    v30 = v59->_progressBarView;
    id v31 = -[TVNPNowPlayingSliderView _focusedProgressColor](v59, "_focusedProgressColor");
    -[TVNPNowPlayingProgressView setTintColor:](v30, "setTintColor:");

    -[TVNPNowPlayingSliderView addSubview:](v59, "addSubview:", v59->_progressBarView);
    v32 = objc_alloc(&OBJC_CLASS___UIView);
    sub_382C0();
    double v48 = v14;
    double v49 = v15;
    double v50 = v16;
    double v51 = v17;
    v18 = -[UIView initWithFrame:](v32, "initWithFrame:", v14, v15, v16, v17);
    thumbView = v59->_thumbView;
    v59->_thumbView = v18;

    v33 = v59->_thumbView;
    v34 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UIView setBackgroundColor:](v33, "setBackgroundColor:");

    v35 = -[UIView layer](v59->_thumbView, "layer");
    -[CALayer setCornerRadius:](v35, "setCornerRadius:", 25.0);

    -[UIView bounds](v59->_thumbView, "bounds");
    CGRect v46 = v61;
    CGPathRef v47 = CGPathCreateWithEllipseInRect(v61, 0LL);
    v36 = -[UIView layer](v59->_thumbView, "layer");
    -[CALayer setShadowPath:](v36, "setShadowPath:", v47);

    v38 = -[UIView layer](v59->_thumbView, "layer");
    v37 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
    -[CALayer setShadowColor:](v38, "setShadowColor:", -[UIColor CGColor](v37, "CGColor"));

    v39 = -[UIView layer](v59->_thumbView, "layer");
    sub_3830C();
    v45[1] = v20;
    v45[2] = v21;
    -[CALayer setShadowOffset:](v39, "setShadowOffset:", *(double *)&v20, *(double *)&v21);

    v40 = -[UIView layer](v59->_thumbView, "layer");
    LODWORD(v22) = 1045220557;
    -[CALayer setShadowOpacity:](v40, "setShadowOpacity:", v22);

    v41 = -[UIView layer](v59->_thumbView, "layer");
    -[CALayer setShadowRadius:](v41, "setShadowRadius:", 10.0);

    CGPathRelease(v47);
    -[TVNPNowPlayingSliderView addSubview:](v59, "addSubview:", v59->_thumbView);
    v23 = objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer);
    v45[0] = -[UIPanGestureRecognizer initWithTarget:action:](v23, "initWithTarget:action:", v59, "_panUpdated:");
    [v45[0] _setHysteresis:200.0];
    -[TVNPNowPlayingSliderView addGestureRecognizer:](v59, "addGestureRecognizer:", v45[0]);
    v24 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v44 = -[UITapGestureRecognizer initWithTarget:action:](v24, "initWithTarget:action:", v59, "_leftPressed:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v44, "setAllowedPressTypes:", &off_52F80);
    -[TVNPNowPlayingSliderView addGestureRecognizer:](v59, "addGestureRecognizer:", v44);
    v25 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v43 = -[UITapGestureRecognizer initWithTarget:action:](v25, "initWithTarget:action:", v59, "_rightPressed:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v43, "setAllowedPressTypes:", &off_52F98);
    -[TVNPNowPlayingSliderView addGestureRecognizer:](v59, "addGestureRecognizer:", v43);
    objc_storeStrong((id *)&v43, 0LL);
    objc_storeStrong((id *)&v44, 0LL);
    objc_storeStrong(v45, 0LL);
    objc_storeStrong((id *)&v56, 0LL);
  }

  v27 = v59;
  objc_storeStrong((id *)&v59, 0LL);
  return v27;
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
  v30.super_class = (Class)&OBJC_CLASS___TVNPNowPlayingSliderView;
  -[TVNPNowPlayingSliderView layoutSubviews](&v30, "layoutSubviews");
  -[TVNPNowPlayingSliderView bounds](v32, "bounds");
  CGRect v29 = v33;
  double v28 = 0.0;
  double Width = CGRectGetWidth(v33);
  id v26 = -[TVNPNowPlayingSliderView minValueIconView](v32, "minValueIconView");
  [v26 sizeToFit];
  id location = -[TVNPNowPlayingSliderView maxValueIconView](v32, "maxValueIconView");
  [location sizeToFit];
  if ((char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVNPNowPlayingSliderView semanticContentAttribute](v32, "semanticContentAttribute")) == (char *)&dword_0 + 1)
  {
    v2 = -[TVNPNowPlayingSliderView maxValueIconView](v32, "maxValueIconView");
    id v3 = v26;
    id v26 = v2;

    v4 = -[TVNPNowPlayingSliderView minValueIconView](v32, "minValueIconView");
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
  sub_38798();
  objc_msgSend(v26, "setFrame:", v10, v11, v23, v24);
  [location frame];
  double v21 = v12;
  double v22 = v13;
  sub_38798();
  objc_msgSend(location, "setFrame:", v14, v15, v21, v22);
  if (v32->_maxBarWidth >= Width - v28) {
    double maxBarWidth = Width - v28;
  }
  else {
    double maxBarWidth = v32->_maxBarWidth;
  }
  -[TVNPNowPlayingProgressView setFrame:]( v32->_progressBarView,  "setFrame:",  Width - maxBarWidth,  19.0,  maxBarWidth,  12.0);
  -[TVNPNowPlayingProgressView _progressCenter](v32->_progressBarView, "_progressCenter");
  -[TVNPNowPlayingSliderView convertPoint:fromView:](v32, "convertPoint:fromView:", v32->_progressBarView, v16, v17);
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
  double v19 = self;
  SEL v18 = a2;
  float v17 = a3;
  BOOL v16 = a4;
  if (a3 != self->_value)
  {
    v19->_value = v17;
    -[TVNPNowPlayingSliderView minimumValue](v19, "minimumValue");
    double v15 = v4;
    -[TVNPNowPlayingSliderView maximumValue](v19, "maximumValue");
    double v14 = v5;
    double v13 = (v17 - v15) / (v5 - v15);
    double v6 = v13;
    *(float *)&double v6 = v13;
    -[TVNPNowPlayingProgressView setProgress:](v19->_progressBarView, "setProgress:", v6);
    -[TVNPNowPlayingSliderView setNeedsLayout](v19, "setNeedsLayout");
    if (v16)
    {
      double v7 = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      double v10 = sub_38A50;
      double v11 = &unk_50B50;
      double v12 = v19;
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
    -[TVNPNowPlayingSliderView setNeedsLayout](v4, "setNeedsLayout");
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
    -[TVNPNowPlayingSliderView setNeedsLayout](v4, "setNeedsLayout");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMaxBarWidth:(double)a3
{
  if (a3 != self->_maxBarWidth)
  {
    self->_double maxBarWidth = a3;
    -[TVNPNowPlayingSliderView setNeedsLayout](self, "setNeedsLayout");
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
  v27 = (char *)[location[0] state];
  if (v27 == (_BYTE *)&dword_0 + 1)
  {
    v20 = v29;
    [location[0] locationInView:v29];
    v26.x = v3;
    v26.y = v4;
    v20[5] = v26;
  }

  else if (v27 == (_BYTE *)&dword_0 + 2)
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
    if (v27 == (_BYTE *)&dword_0 + 3) {
      -[CGPoint sendActionsForControlEvents:](v29, "sendActionsForControlEvents:", 4096LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_leftPressed:(id)a3
{
  float v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPNowPlayingSliderView value](v7, "value");
  if (v3 - 0.0625 >= 0.0) {
    double v5 = v3 - 0.0625;
  }
  else {
    double v5 = 0.0;
  }
  HIDWORD(v4) = HIDWORD(v5);
  *(float *)&double v4 = v5;
  -[TVNPNowPlayingSliderView setValue:](v7, "setValue:", v4);
  -[TVNPNowPlayingSliderView sendActionsForControlEvents:](v7, "sendActionsForControlEvents:", 4096LL);
  objc_storeStrong(location, 0LL);
}

- (void)_rightPressed:(id)a3
{
  float v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPNowPlayingSliderView value](v7, "value");
  if (v3 + 0.0625 >= 1.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = v3 + 0.0625;
  }
  HIDWORD(v4) = HIDWORD(v5);
  *(float *)&double v4 = v5;
  -[TVNPNowPlayingSliderView setValue:](v7, "setValue:", v4);
  -[TVNPNowPlayingSliderView sendActionsForControlEvents:](v7, "sendActionsForControlEvents:", 4096LL);
  objc_storeStrong(location, 0LL);
}

- (id)_focusedProgressColor
{
  double v4 = (dispatch_once_t *)&unk_5EE90;
  id location = 0LL;
  objc_storeStrong(&location, &stru_51220);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_5EE88;
}

- (id)_unfocusedProgressColor
{
  double v4 = (dispatch_once_t *)&unk_5EEA0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_51240);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_5EE98;
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

- (TVNPNowPlayingProgressView)progressBarView
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