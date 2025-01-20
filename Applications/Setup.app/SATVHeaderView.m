@interface SATVHeaderView
- (BOOL)leftAlignSubtitleWithTitle;
- (CGSize)_subtitleSizeForSize:(CGSize)a3;
- (CGSize)_titleSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SATVHeaderView)initWithFrame:(CGRect)a3;
- (SATVHeaderView)initWithFrame:(CGRect)a3 leftAlignSubtitleWithTitle:(BOOL)a4;
- (UIActivityIndicatorView)activitiyIndicatorView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)activityIndicatorContainerView;
- (void)hideActivityIndicator;
- (void)layoutSubviews;
- (void)setActivitiyIndicatorView:(id)a3;
- (void)setActivityIndicatorContainerView:(id)a3;
- (void)setLeftAlignSubtitleWithTitle:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showActivityIndicator;
@end

@implementation SATVHeaderView

- (SATVHeaderView)initWithFrame:(CGRect)a3 leftAlignSubtitleWithTitle:(BOOL)a4
{
  result = -[SATVHeaderView initWithFrame:]( self,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result) {
    result->_leftAlignSubtitleWithTitle = a4;
  }
  return result;
}

- (SATVHeaderView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___SATVHeaderView;
  v3 = -[SATVHeaderView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVSKLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[TVSKLabel initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    v12 = v4->_titleLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    -[UILabel setFont:](v12, "setFont:", v13);

    v14 = v4->_titleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v16 = v4->_titleLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0LL);
    -[SATVHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v18 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v18;

    v20 = v4->_subtitleLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    -[UILabel setFont:](v20, "setFont:", v21);

    v22 = v4->_subtitleLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    v24 = v4->_subtitleLabel;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0LL);
    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 0LL);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1LL);
    -[SATVHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v26 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    activitiyIndicatorView = v4->_activitiyIndicatorView;
    v4->_activitiyIndicatorView = v26;

    -[UIActivityIndicatorView setActivityIndicatorViewStyle:]( v4->_activitiyIndicatorView,  "setActivityIndicatorViewStyle:",  101LL);
    -[UIActivityIndicatorView setHidden:](v4->_activitiyIndicatorView, "setHidden:", 1LL);
    double v28 = CGPointZero.y;
    +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
    double v30 = v29;
    double v32 = v31;
    -[UIActivityIndicatorView setFrame:](v4->_activitiyIndicatorView, "setFrame:", CGPointZero.x, v28, v29, v31);
    -[UIActivityIndicatorView setAutoresizingMask:](v4->_activitiyIndicatorView, "setAutoresizingMask:", 18LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v34 = [v33 _graphicsQuality];

    if (v34 == (id)100)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v35));

      v37 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v36);
      activityIndicatorContainerView = v4->_activityIndicatorContainerView;
      v4->_activityIndicatorContainerView = &v37->super;

      -[UIView setFrame:](v4->_activityIndicatorContainerView, "setFrame:", CGPointZero.x, v28, v30, v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contentView](v4->_activityIndicatorContainerView, "contentView"));
      [v39 addSubview:v4->_activitiyIndicatorView];
    }

    else
    {
      v40 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", CGPointZero.x, v28, v30, v32);
      v41 = v4->_activityIndicatorContainerView;
      v4->_activityIndicatorContainerView = v40;

      v42 = v4->_activityIndicatorContainerView;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UIView setBackgroundColor:](v42, "setBackgroundColor:", v43);

      -[UIView addSubview:](v4->_activityIndicatorContainerView, "addSubview:", v4->_activitiyIndicatorView);
    }

    -[SATVHeaderView addSubview:](v4, "addSubview:", v4->_activityIndicatorContainerView);
  }

  return v4;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SATVHeaderView;
  -[SATVHeaderView layoutSubviews](&v34, "layoutSubviews");
  -[SATVHeaderView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double y = CGPointZero.y;
  -[SATVHeaderView _titleSizeForSize:](self, "_titleSizeForSize:", v3, v5);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = floor((v4 - v8) * 0.5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, y, v8, v10);
  -[SATVHeaderView _subtitleSizeForSize:](self, "_subtitleSizeForSize:", v4, v6);
  double v32 = v13;
  double v33 = v14;
  v35.origin.x = v12;
  v35.origin.double y = y;
  v35.size.double width = v9;
  v35.size.double height = v11;
  double Height = CGRectGetHeight(v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  [v15 descender];
  double v30 = v16;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
  [v17 ascender];
  double v19 = v18;
  [v17 capHeight];
  double v21 = v20;
  v36.origin.x = v12;
  v36.origin.double y = y;
  v36.size.double width = v9;
  v36.size.double height = v11;
  double MinY = CGRectGetMinY(v36);
  if (self->_leftAlignSubtitleWithTitle)
  {
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 0LL, *(void *)&v30);
    double v23 = v12;
    double v24 = v32;
  }

  else
  {
    double v24 = v32;
    double v23 = floor((v4 - v32) * 0.5);
  }

  -[UILabel setFrame:]( self->_subtitleLabel,  "setFrame:",  v23,  ceil(Height + v30) + MinY - ceil(v19 - v21) + 50.0,  v24,  v33,  *(void *)&v30);
  +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
  double v26 = v25;
  double v28 = v27;
  double v29 = floor(v4 * 0.5 - v25 * 0.5);
  v37.origin.x = v12;
  v37.origin.double y = y;
  v37.size.double width = v9;
  v37.size.double height = v11;
  -[UIView setFrame:](self->_activityIndicatorContainerView, "setFrame:", v29, CGRectGetMaxY(v37) + 25.0, v26, v28);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[SATVHeaderView _titleSizeForSize:](self, "_titleSizeForSize:");
  double v7 = v6;
  -[SATVHeaderView _subtitleSizeForSize:](self, "_subtitleSizeForSize:", width, height);
  double v9 = v7 + v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  id v11 = [v10 length];

  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
    [v12 ascender];
    double v15 = v14;
    [v12 capHeight];
    double v17 = 50.0 - ceil(v15 - v16);
    [v13 descender];
    double v9 = v9 + v18 + v17;
  }

  double v19 = width;
  double v20 = v9;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (CGSize)_titleSizeForSize:(CGSize)a3
{
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)_subtitleSizeForSize:(CGSize)a3
{
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)showActivityIndicator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DB28;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)hideActivityIndicator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DBDC;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIActivityIndicatorView)activitiyIndicatorView
{
  return self->_activitiyIndicatorView;
}

- (void)setActivitiyIndicatorView:(id)a3
{
}

- (UIView)activityIndicatorContainerView
{
  return self->_activityIndicatorContainerView;
}

- (void)setActivityIndicatorContainerView:(id)a3
{
}

- (BOOL)leftAlignSubtitleWithTitle
{
  return self->_leftAlignSubtitleWithTitle;
}

- (void)setLeftAlignSubtitleWithTitle:(BOOL)a3
{
  self->_leftAlignSubtitleWithTitle = a3;
}

- (void).cxx_destruct
{
}

@end