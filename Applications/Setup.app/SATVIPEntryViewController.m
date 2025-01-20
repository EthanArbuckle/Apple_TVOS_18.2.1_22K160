@interface SATVIPEntryViewController
- (BOOL)becomeFirstResponder;
- (NSString)ipAddress;
- (NSString)prompt;
- (SATVIPEntryViewControllerDelegate)delegate;
- (id)_ipEntryView;
- (id)preferredFocusEnvironments;
- (void)ipEntryViewDidFinishEditing:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SATVIPEntryViewController

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v27 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  -[UIView setAutoresizingMask:](v27, "setAutoresizingMask:", 18LL);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v12 = objc_alloc_init(&OBJC_CLASS___SATVHeaderView);
  titleView = self->_titleView;
  self->_titleView = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](self->_titleView, "titleLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController title](self, "title"));
  [v14 setText:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](self->_titleView, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleTitle2));
  [v16 setFont:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](self->_titleView, "titleLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityBDarkColor](&OBJC_CLASS___UIColor, "tvsk_opacityBDarkColor"));
  [v18 setTextColor:v19];

  -[UIView addSubview:](v27, "addSubview:", self->_titleView);
  v20 = objc_alloc_init(&OBJC_CLASS___UILabel);
  promptLabel = self->_promptLabel;
  self->_promptLabel = v20;

  -[UILabel setText:](self->_promptLabel, "setText:", self->_prompt);
  v22 = self->_promptLabel;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v22, "setFont:", v23);

  -[UILabel setTextAlignment:](self->_promptLabel, "setTextAlignment:", 1LL);
  -[UILabel setOpaque:](self->_promptLabel, "setOpaque:", 0LL);
  -[UILabel setBackgroundColor:](self->_promptLabel, "setBackgroundColor:", 0LL);
  -[UIView addSubview:](v27, "addSubview:", self->_promptLabel);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController _ipEntryView](self, "_ipEntryView"));
  -[UIView addSubview:](v27, "addSubview:", v24);

  -[SATVIPEntryViewController setView:](self, "setView:", v27);
  v25 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_didSelectMenu");
  -[UITapGestureRecognizer setAllowedPressTypes:](v25, "setAllowedPressTypes:", &off_1000D0FC8);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v25, "setAllowedTouchTypes:", &__NSArray0__struct);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController view](self, "view"));
  [v26 addGestureRecognizer:v25];
}

- (void)viewDidLayoutSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  -[SATVHeaderView sizeThatFits:](self->_titleView, "sizeThatFits:", CGRectGetWidth(v22), 0.0);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double Width = CGRectGetWidth(v23);
  v24.origin.x = CGRectZero.origin.x;
  v24.origin.y = 50.0;
  v24.size.width = v13;
  v24.size.height = v15;
  v25.origin.x = (Width - CGRectGetWidth(v24)) * 0.5;
  v25.origin.y = 50.0;
  v25.size.width = v13;
  v25.size.height = v15;
  CGRect v26 = CGRectIntegral(v25);
  -[SATVHeaderView setFrame:]( self->_titleView,  "setFrame:",  v26.origin.x,  v26.origin.y,  v26.size.width,  v26.size.height);
  -[SATVIPEntryView sizeThatFits:](self->_ipEntryView, "sizeThatFits:", v9, v11);
  -[SATVIPEntryView setFrame:]( self->_ipEntryView,  "setFrame:",  UIRectCenteredIntegralRect(0.0, 0.0, v17, v18, v5, v7, v9, v11));
  -[UILabel sizeThatFits:](self->_promptLabel, "sizeThatFits:", v9, v11);
  double v20 = v19;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  double MinX = CGRectGetMinX(v27);
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  -[UILabel setFrame:](self->_promptLabel, "setFrame:", MinX, 210.0, CGRectGetWidth(v28), v20);
}

- (BOOL)becomeFirstResponder
{
  return -[SATVIPEntryView becomeFirstResponder](self->_ipEntryView, "becomeFirstResponder");
}

- (id)preferredFocusEnvironments
{
  ipEntryView = self->_ipEntryView;
  if (!ipEntryView) {
    return &__NSArray0__struct;
  }
  double v6 = self->_ipEntryView;
  v3 = ipEntryView;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (void)setTitle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVIPEntryViewController;
  id v4 = a3;
  -[SATVIPEntryViewController setTitle:](&v7, "setTitle:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](self->_titleView, "titleLabel", v7.receiver, v7.super_class));
  [v5 setText:v4];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController view](self, "view"));
  [v6 setNeedsLayout];
}

- (void)setPrompt:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  prompt = self->_prompt;
  self->_prompt = v5;

  -[UILabel setText:](self->_promptLabel, "setText:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController view](self, "view"));
  [v7 setNeedsLayout];
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)ipAddress
{
  return -[SATVIPEntryView IPAddress](self->_ipEntryView, "IPAddress");
}

- (void)ipEntryViewDidFinishEditing:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVIPEntryViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "ipEntryViewControllerDidFinish:") & 1) != 0) {
    [v4 ipEntryViewControllerDidFinish:self];
  }
}

- (id)_ipEntryView
{
  ipEntryView = self->_ipEntryView;
  if (!ipEntryView)
  {
    id v4 = -[SATVIPEntryView initWithIPAddress:](objc_alloc(&OBJC_CLASS___SATVIPEntryView), "initWithIPAddress:", 0LL);
    double v5 = self->_ipEntryView;
    self->_ipEntryView = v4;

    -[SATVIPEntryView setDelegate:](self->_ipEntryView, "setDelegate:", self);
    ipEntryView = self->_ipEntryView;
  }

  return ipEntryView;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (SATVIPEntryViewControllerDelegate)delegate
{
  return (SATVIPEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end