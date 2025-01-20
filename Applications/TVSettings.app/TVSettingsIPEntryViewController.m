@interface TVSettingsIPEntryViewController
- (BOOL)becomeFirstResponder;
- (NSString)ipAddress;
- (NSString)prompt;
- (TVSettingsIPEntryViewControllerDelegate)delegate;
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

@implementation TVSettingsIPEntryViewController

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v30 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  -[UIView setAutoresizingMask:](v30, "setAutoresizingMask:", 18LL);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v12 = objc_opt_new(&OBJC_CLASS___UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
  v14 = self->_titleLabel;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController title](self, "title"));
  -[UILabel setText:](v14, "setText:", v15);

  v16 = self->_titleLabel;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v16, "setFont:", v17);

  v18 = self->_titleLabel;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 traitCollection]);
  if (qword_1001E1BF8 != -1) {
    dispatch_once(&qword_1001E1BF8, &stru_100194970);
  }
  id v21 = [v20 userInterfaceStyle];
  BOOL v22 = v21 == (id)2 || v21 == (id)1000;
  v23 = &qword_1001E1BF0;
  if (!v22) {
    v23 = &qword_1001E1BE8;
  }
  id v24 = (id)*v23;

  -[UILabel setTextColor:](v18, "setTextColor:", v24);
  -[UIView addSubview:](v30, "addSubview:", self->_titleLabel);
  v25 = objc_alloc_init(&OBJC_CLASS___UILabel);
  promptLabel = self->_promptLabel;
  self->_promptLabel = v25;

  -[UILabel setText:](self->_promptLabel, "setText:", self->_prompt);
  v27 = self->_promptLabel;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v27, "setFont:", v28);

  -[UILabel setTextAlignment:](self->_promptLabel, "setTextAlignment:", 1LL);
  -[UILabel setOpaque:](self->_promptLabel, "setOpaque:", 0LL);
  -[UILabel setBackgroundColor:](self->_promptLabel, "setBackgroundColor:", 0LL);
  -[UIView addSubview:](v30, "addSubview:", self->_promptLabel);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController _ipEntryView](self, "_ipEntryView"));
  -[UIView addSubview:](v30, "addSubview:", v29);

  -[TVSettingsIPEntryViewController setView:](self, "setView:", v30);
}

- (void)viewDidLayoutSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v23), 0.0);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double Width = CGRectGetWidth(v24);
  v25.origin.x = CGRectZero.origin.x;
  v25.origin.y = 50.0;
  v25.size.width = v13;
  v25.size.height = v15;
  v26.origin.x = (Width - CGRectGetWidth(v25)) * 0.5;
  v26.origin.y = 50.0;
  v26.size.width = v13;
  v26.size.height = v15;
  CGRect v27 = CGRectIntegral(v26);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  id v17 = -[TVSettingsIPEntryView sizeThatFits:](self->_ipEntryView, "sizeThatFits:", v9, v11);
  UIRectCenteredIntegralRect(v17, 0.0, 0.0, v18, v19, v5, v7, v9, v11);
  -[TVSettingsIPEntryView setFrame:](self->_ipEntryView, "setFrame:");
  -[UILabel sizeThatFits:](self->_promptLabel, "sizeThatFits:", v9, v11);
  double v21 = v20;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  double MinX = CGRectGetMinX(v28);
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  -[UILabel setFrame:](self->_promptLabel, "setFrame:", MinX, 210.0, CGRectGetWidth(v29), v21);
}

- (BOOL)becomeFirstResponder
{
  return -[TVSettingsIPEntryView becomeFirstResponder](self->_ipEntryView, "becomeFirstResponder");
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
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsIPEntryViewController;
  id v4 = a3;
  -[TVSettingsIPEntryViewController setTitle:](&v6, "setTitle:", v4);
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v6.receiver, v6.super_class);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController view](self, "view"));
  [v5 setNeedsLayout];
}

- (void)setPrompt:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  prompt = self->_prompt;
  self->_prompt = v5;

  -[UILabel setText:](self->_promptLabel, "setText:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController view](self, "view"));
  [v7 setNeedsLayout];
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)ipAddress
{
  return -[TVSettingsIPEntryView IPAddress](self->_ipEntryView, "IPAddress");
}

- (void)ipEntryViewDidFinishEditing:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "ipEntryViewControllerDidFinish:") & 1) != 0) {
    [v4 ipEntryViewControllerDidFinish:self];
  }
}

- (id)_ipEntryView
{
  ipEntryView = self->_ipEntryView;
  if (!ipEntryView)
  {
    id v4 = -[TVSettingsIPEntryView initWithIPAddress:]( objc_alloc(&OBJC_CLASS___TVSettingsIPEntryView),  "initWithIPAddress:",  0LL);
    double v5 = self->_ipEntryView;
    self->_ipEntryView = v4;

    -[TVSettingsIPEntryView setDelegate:](self->_ipEntryView, "setDelegate:", self);
    ipEntryView = self->_ipEntryView;
  }

  return ipEntryView;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (TVSettingsIPEntryViewControllerDelegate)delegate
{
  return (TVSettingsIPEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end