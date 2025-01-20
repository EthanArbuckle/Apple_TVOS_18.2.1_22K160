@interface TVAirPlayPresentationView
- (BOOL)canBecomeFocused;
- (BOOL)showProgress;
- (TVAirPlayPresentationView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinnerView;
- (UIView)contentView;
- (UIView)coverView;
- (id)presentationLayer;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setCoverView:(id)a3;
- (void)setShowProgress:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
@end

@implementation TVAirPlayPresentationView

- (TVAirPlayPresentationView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationView;
  v3 = -[TVAirPlayPresentationView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVAirPlayPresentationView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVAirPlayPresentationView bounds](v3, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = v6;

    -[TVAirPlayPresentationView addSubview:](v3, "addSubview:", v3->_contentView);
    v8 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVAirPlayPresentationView bounds](v3, "bounds");
    v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    coverView = v3->_coverView;
    v3->_coverView = v9;

    v11 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = v11;
  }

  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationView;
  -[TVAirPlayPresentationView layoutSubviews](&v14, "layoutSubviews");
  -[TVAirPlayPresentationView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView setFrame:](self->_coverView, "setFrame:", v4, v6, v8, v10);
  id v11 = +[UIActivityIndicatorView defaultSizeForStyle:]( &OBJC_CLASS___UIActivityIndicatorView,  "defaultSizeForStyle:",  20LL);
  UIRectCenteredIntegralRect(v11, CGPointZero.x, CGPointZero.y, v12, v13, v4, v6, v8, v10);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)presentationLayer
{
  return -[UIView layer](self->_contentView, "layer");
}

- (void)setShowProgress:(BOOL)a3
{
  if (self->_showProgress != a3)
  {
    contentView = self->_contentView;
    if (a3)
    {
      -[UIView setHidden:](contentView, "setHidden:", 1LL);
      -[TVAirPlayPresentationView addSubview:](self, "addSubview:", self->_coverView);
      -[TVAirPlayPresentationView addSubview:](self, "addSubview:", self->_spinnerView);
      -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
    }

    else
    {
      -[UIView setHidden:](contentView, "setHidden:", 0LL);
      -[UIView removeFromSuperview](self->_coverView, "removeFromSuperview");
      -[UIActivityIndicatorView removeFromSuperview](self->_spinnerView, "removeFromSuperview");
      -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
    }

    self->_showProgress = a3;
  }

- (BOOL)showProgress
{
  return self->_showProgress;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end