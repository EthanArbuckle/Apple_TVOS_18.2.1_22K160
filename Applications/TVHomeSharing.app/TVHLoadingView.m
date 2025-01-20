@interface TVHLoadingView
- (BOOL)isShowingActivityIndicator;
- (CGSize)activityIndicatorSize;
- (TVHLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)backgroundImage;
- (UIImageView)backgroundImageView;
- (UIVisualEffectView)activityindicatorEffectView;
- (double)activityIndicatorDelay;
- (double)activityIndicatorFadeInDelay;
- (int64_t)activityIndicatorBlurEffectStyle;
- (void)_showActivityIndicator;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setActivityIndicatorBlurEffectStyle:(int64_t)a3;
- (void)setActivityIndicatorDelay:(double)a3;
- (void)setActivityIndicatorFadeInDelay:(double)a3;
- (void)setActivityIndicatorSize:(CGSize)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setActivityindicatorEffectView:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setShowingActivityIndicator:(BOOL)a3;
@end

@implementation TVHLoadingView

- (TVHLoadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVHLoadingView;
  v5 = -[TVHLoadingView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = (TVHLoadingView *)v5;
  if (v5)
  {
    *((void *)v5 + 2) = 0x3FD999999999999ALL;
    v7 = v5 + 64;
    +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
    void *v7 = v8;
    v6->_activityIndicatorSize.double height = v9;
    v10 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  0.0,  0.0,  width,  height);
    backgroundImageView = v6->_backgroundImageView;
    v6->_backgroundImageView = v10;

    -[UIImageView setAutoresizingMask:](v6->_backgroundImageView, "setAutoresizingMask:", 18LL);
    -[UIImageView setContentMode:](v6->_backgroundImageView, "setContentMode:", 2LL);
    -[TVHLoadingView addSubview:](v6, "addSubview:", v6->_backgroundImageView);
    v6->_activityIndicatorBlurEffectStyle = 5000LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v12));

    v14 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v13);
    activityindicatorEffectView = v6->_activityindicatorEffectView;
    v6->_activityindicatorEffectView = v14;

    v16 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    activityIndicatorView = v6->_activityIndicatorView;
    v6->_activityIndicatorView = v16;

    -[UIActivityIndicatorView setAlpha:](v6->_activityIndicatorView, "setAlpha:", 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView layer](v6->_activityIndicatorView, "layer"));
    [v18 setAllowsGroupOpacity:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v6->_activityindicatorEffectView, "contentView"));
    [v19 addSubview:v6->_activityIndicatorView];

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v6->_activityindicatorEffectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVHLoadingView addSubview:](v6, "addSubview:", v6->_activityindicatorEffectView);
    -[TVHLoadingView setActivityIndicatorDelay:](v6, "setActivityIndicatorDelay:", 0.5);
  }

  return v6;
}

- (void)setActivityIndicatorSize:(CGSize)a3
{
  if (self->_activityIndicatorSize.width != a3.width || self->_activityIndicatorSize.height != a3.height)
  {
    self->_activityIndicatorSize = a3;
    -[TVHLoadingView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setActivityIndicatorDelay:(double)a3
{
  self->_activityIndicatorDelay = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView activityIndicatorView](self, "activityIndicatorView"));
  [v4 alpha];
  double v6 = v5;

  if (v6 < 1.0)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_showActivityIndicator",  0LL);
    -[TVHLoadingView performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_showActivityIndicator",  0LL,  self->_activityIndicatorDelay);
  }

- (void)setActivityIndicatorBlurEffectStyle:(int64_t)a3
{
  if (self->_activityIndicatorBlurEffectStyle != a3)
  {
    self->_activityIndicatorBlurEffectStyle = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:"));
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v4));

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView activityindicatorEffectView](self, "activityindicatorEffectView"));
    [v5 setEffect:v6];
  }

- (void)setBackgroundImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHLoadingView backgroundImageView](self, "backgroundImageView"));
  [v5 setImage:v4];
}

- (UIImage)backgroundImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView backgroundImageView](self, "backgroundImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHLoadingView;
  -[TVHLoadingView layoutSubviews](&v13, "layoutSubviews");
  -[TVHLoadingView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TVHLoadingView activityIndicatorSize](self, "activityIndicatorSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView activityindicatorEffectView](self, "activityindicatorEffectView"));
  [v12 setFrame:UIRectCenteredIntegralRect(v12)];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHLoadingView;
  -[TVHLoadingView didMoveToWindow](&v3, "didMoveToWindow");
  -[TVHLoadingView _showActivityIndicator](self, "_showActivityIndicator");
}

- (void)_showActivityIndicator
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHLoadingView activityIndicatorView](self, "activityIndicatorView"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v10 window]);
  if (v3)
  {
    double v4 = (void *)v3;
    unsigned __int8 v5 = -[TVHLoadingView isShowingActivityIndicator](self, "isShowingActivityIndicator");

    if ((v5 & 1) == 0)
    {
      -[TVHLoadingView setShowingActivityIndicator:](self, "setShowingActivityIndicator:", 1LL);
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingView activityIndicatorView](self, "activityIndicatorView"));
      -[TVHLoadingView activityIndicatorFadeInDelay](self, "activityIndicatorFadeInDelay");
      double v8 = v7;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000854BC;
      v11[3] = &unk_1000FCEA8;
      id v12 = v6;
      id v9 = v6;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v11, v8);
    }
  }

  else
  {
  }

- (CGSize)activityIndicatorSize
{
  double width = self->_activityIndicatorSize.width;
  double height = self->_activityIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)activityIndicatorFadeInDelay
{
  return self->_activityIndicatorFadeInDelay;
}

- (void)setActivityIndicatorFadeInDelay:(double)a3
{
  self->_activityIndicatorFadeInDelay = a3;
}

- (double)activityIndicatorDelay
{
  return self->_activityIndicatorDelay;
}

- (int64_t)activityIndicatorBlurEffectStyle
{
  return self->_activityIndicatorBlurEffectStyle;
}

- (BOOL)isShowingActivityIndicator
{
  return self->_showingActivityIndicator;
}

- (void)setShowingActivityIndicator:(BOOL)a3
{
  self->_showingActivityIndicator = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIVisualEffectView)activityindicatorEffectView
{
  return self->_activityindicatorEffectView;
}

- (void)setActivityindicatorEffectView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end