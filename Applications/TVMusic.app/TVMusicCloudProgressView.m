@interface TVMusicCloudProgressView
- (TVMusicCloudProgressView)initWithMessage:(id)a3;
- (float)progressPercent;
- (void)_setColorsForUserInterfaceStyle:(int64_t)a3;
- (void)setProgressPercent:(float)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicCloudProgressView

- (TVMusicCloudProgressView)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 bounds];
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVMusicCloudProgressView;
  v6 = -[TVMusicCloudProgressView initWithFrame:](&v31, "initWithFrame:");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMusicCloudProgressView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[TVMusicCloudProgressView bounds](v6, "bounds");
    if (v4)
    {
      uint64_t v9 = 0x4082D00000000000LL;
      uint64_t v10 = 0LL;
      double v11 = 1.0;
      CGRect v32 = CGRectInset(*(CGRect *)(&v8 - 2), 300.0, 0.0);
      double x = v32.origin.x;
      double y = v32.origin.y;
      double width = v32.size.width;
      double height = v32.size.height;
      v16 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  v32.origin.x,  v32.origin.y,  v32.size.width,  v32.size.height);
      messageLabel = v6->_messageLabel;
      v6->_messageLabel = v16;

      -[UILabel setText:](v6->_messageLabel, "setText:", v4);
      v18 = v6->_messageLabel;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

      -[UILabel setTextAlignment:](v6->_messageLabel, "setTextAlignment:", 1LL);
      v20 = v6->_messageLabel;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager subtitle1Font](&OBJC_CLASS___TVThemeManager, "subtitle1Font"));
      -[UILabel setFont:](v20, "setFont:", v21);

      -[UILabel setAutoresizingMask:](v6->_messageLabel, "setAutoresizingMask:", 34LL);
      -[UILabel sizeThatFits:](v6->_messageLabel, "sizeThatFits:", width, height);
      -[UILabel setFrame:](v6->_messageLabel, "setFrame:", x, y, width, v22);
      -[TVMusicCloudProgressView addSubview:](v6, "addSubview:", v6->_messageLabel);
    }

    -[TVMusicCloudProgressView bounds](v6, "bounds");
    v33.origin.double y = 540.0;
    v33.origin.double x = 0.0;
    v33.size.double height = 22.0;
    CGRect v34 = CGRectInset(v33, 604.0, 0.0);
    v23 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  v34.origin.x,  v34.origin.y,  v34.size.width,  v34.size.height);
    progressView = v6->_progressView;
    v6->_progressView = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6->_progressView, "layer"));
    [v25 setCornerRadius:11.0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6->_progressView, "layer"));
    [v26 setMasksToBounds:1];

    -[UIView setClipsToBounds:](v6->_progressView, "setClipsToBounds:", 1LL);
    -[UIView setAutoresizingMask:](v6->_progressView, "setAutoresizingMask:", 10LL);
    -[TVMusicCloudProgressView addSubview:](v6, "addSubview:", v6->_progressView);
    v27 = objc_opt_new(&OBJC_CLASS___UIView);
    progressCompleteView = v6->_progressCompleteView;
    v6->_progressCompleteView = v27;

    -[UIView addSubview:](v6->_progressView, "addSubview:", v6->_progressCompleteView);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudProgressView traitCollection](v6, "traitCollection"));
    -[TVMusicCloudProgressView _setColorsForUserInterfaceStyle:]( v6,  "_setColorsForUserInterfaceStyle:",  [v29 userInterfaceStyle]);
  }

  return v6;
}

- (void)setProgressPercent:(float)a3
{
  if (self->_progressPercent <= a3)
  {
    self->_progressPercent = a3;
    -[UIView bounds](self->_progressView, "bounds");
    -[UIView setFrame:](self->_progressCompleteView, "setFrame:");
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudProgressView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicCloudProgressView traitCollection](self, "traitCollection"));
    -[TVMusicCloudProgressView _setColorsForUserInterfaceStyle:]( self,  "_setColorsForUserInterfaceStyle:",  [v7 userInterfaceStyle]);
  }

- (void)_setColorsForUserInterfaceStyle:(int64_t)a3
{
  messageLabel = self->_messageLabel;
  if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v5);

    progressView = self->_progressView;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.15));
    -[UIView setBackgroundColor:](progressView, "setBackgroundColor:", v7);

    progressCompleteView = self->_progressCompleteView;
    double v9 = 1.0;
    double v10 = 0.5;
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v11);

    v12 = self->_progressView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    progressCompleteView = self->_progressCompleteView;
    double v10 = 0.6;
    double v9 = 0.0;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v9, v10));
  -[UIView setBackgroundColor:](progressCompleteView, "setBackgroundColor:");
}

- (float)progressPercent
{
  return self->_progressPercent;
}

- (void).cxx_destruct
{
}

@end