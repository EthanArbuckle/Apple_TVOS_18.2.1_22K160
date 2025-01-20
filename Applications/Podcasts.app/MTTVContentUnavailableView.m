@interface MTTVContentUnavailableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTTVContentUnavailableView)init;
- (NSString)message;
- (NSString)title;
- (UIButton)button;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)configureSubviews;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColors;
@end

@implementation MTTVContentUnavailableView

- (MTTVContentUnavailableView)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVContentUnavailableView;
  v2 = -[MTTVContentUnavailableView init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTTVContentUnavailableView configureSubviews](v2, "configureSubviews");
  }
  return v3;
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  [v5 setText:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  [v6 sizeToFit];

  -[MTTVContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)message
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  [v5 setText:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  [v6 sizeToFit];

  -[MTTVContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [v12 length];
  v10 = 0LL;
  if (a5 && v8 && v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 6LL));
    [v10 addTarget:v8 action:a5 forControlEvents:0x2000];
    [v10 setTitle:v12 forState:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleBody,  2LL));
    [v10 setFont:v11];
  }

  -[MTTVContentUnavailableView setButton:](self, "setButton:", v10);
}

- (void)configureSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  -[MTTVContentUnavailableView addSubview:](self, "addSubview:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  -[MTTVContentUnavailableView addSubview:](self, "addSubview:", v4);

  -[MTTVContentUnavailableView updateColors](self, "updateColors");
}

- (void)updateColors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView traitCollection](self, "traitCollection"));
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v13 = (id)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  v4));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
  [v6 setTitleColor:v13 forState:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
  [v7 setTitleColor:v5 forState:1];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
  [v8 setTitleColor:v5 forState:8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor buttonBackgroundColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "buttonBackgroundColorForDarkBackground:",  v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
  [v10 setBackgroundColor:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  [v11 setTextColor:v13];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  [v12 setTextColor:v13];
}

- (void)setButton:(id)a3
{
  id v5 = a3;
  -[UIButton removeFromSuperview](self->_button, "removeFromSuperview");
  objc_storeStrong((id *)&self->_button, a3);
  if (v5)
  {
    -[MTTVContentUnavailableView addSubview:](self, "addSubview:", v5);
    -[MTTVContentUnavailableView updateColors](self, "updateColors");
  }

  -[MTTVContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  -[MTTVContentUnavailableView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "sizeThatFits:", width + -160.0, 1.79769313e308);
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  objc_msgSend(v8, "sizeThatFits:", width + -160.0, 1.79769313e308);
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 font]);
  objc_msgSend(v12, "mt_offsetFromLastBaselineToBottom");
  double v14 = v7 - v13 + 0.0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 font]);
  objc_msgSend(v16, "mt_offsetFromFirstBaselineToTop");
  double v18 = v17;

  double v19 = v14 + v10 + 60.0 - v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 font]);
    objc_msgSend(v22, "mt_offsetFromLastBaselineToBottom");
    double v24 = 60.0 - v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
    [v25 intrinsicContentSize];
    double v19 = v19 + v24 + v26;
  }

  double v27 = width;
  double v28 = v19;
  result.height = v28;
  result.double width = v27;
  return result;
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v5 = v3 + -160.0;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "sizeThatFits:", v5, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;

  double v11 = IMRoundToPixel((v4 - v8) * 0.5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  objc_msgSend(v12, "setFrame:", v11, 0.0, v8, v10);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  double v42 = v5;
  objc_msgSend(v13, "sizeThatFits:", v5, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;

  double v18 = IMRoundToPixel((v4 - v15) * 0.5);
  v44.origin.y = 0.0;
  v44.origin.x = v11;
  v44.size.double width = v8;
  v44.size.height = v10;
  double MaxY = CGRectGetMaxY(v44);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView titleLabel](self, "titleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 font]);
  objc_msgSend(v21, "mt_offsetFromLastBaselineToBottom");
  double v23 = MaxY - v22;

  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 font]);
  objc_msgSend(v25, "mt_offsetFromFirstBaselineToTop");
  double v27 = v23 + 60.0 - v26;
  CGFloat v28 = v17;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
  objc_msgSend(v29, "setFrame:", v18, v27, v15, v17);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
    objc_msgSend(v31, "sizeThatFits:", v42, 1.79769313e308);
    double v33 = v32;
    double v35 = v34;

    v45.origin.x = v18;
    v45.origin.y = v27;
    v45.size.double width = v15;
    v45.size.height = v28;
    double v36 = CGRectGetMaxY(v45);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView messageLabel](self, "messageLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 font]);
    objc_msgSend(v38, "mt_offsetFromLastBaselineToBottom");
    double v40 = v36 - v39;

    double v41 = IMRoundToPixel((v4 - v33) * 0.5);
    id v43 = (id)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView button](self, "button"));
    objc_msgSend(v43, "setFrame:", v41, v40 + 60.0, v33, v35);
  }

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVContentUnavailableView;
  id v4 = a3;
  -[MTTVContentUnavailableView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableView traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVContentUnavailableView updateColors](self, "updateColors");
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleTitle3,  2LL));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0LL);
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)messageLabel
{
  messageLabel = self->_messageLabel;
  if (!messageLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_messageLabel;
    self->_messageLabel = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](self->_messageLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1LL);
    messageLabel = self->_messageLabel;
  }

  return messageLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setMessageLabel:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
}

@end