@interface TVHErrorView
- (TVHErrorView)initWithFrame:(CGRect)a3;
- (UILabel)messageLabel;
- (void)layoutSubviews;
- (void)setMessageLabel:(id)a3;
@end

@implementation TVHErrorView

- (TVHErrorView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHErrorView;
  v3 = -[TVHErrorView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_messageLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v6 = v3->_messageLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_messageLabel, "setNumberOfLines:", 0LL);
    -[UILabel setLineBreakMode:](v3->_messageLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_messageLabel, "setTextAlignment:", 1LL);
    v8 = v3->_messageLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_90PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_90PercentWhiteColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));
    -[UILabel setTextColor:](v8, "setTextColor:", v11);

    -[TVHErrorView addSubview:](v3, "addSubview:", v3->_messageLabel);
  }

  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHErrorView;
  -[TVHErrorView layoutSubviews](&v16, "layoutSubviews");
  -[TVHErrorView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -256.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHErrorView messageLabel](self, "messageLabel"));
  objc_msgSend(v8, "sizeThatFits:", v7, v6);
  double v10 = v9;
  double v12 = v11;
  sub_10002EE50(v4 - v9);
  double v14 = v13 * 0.5;
  sub_10002EE50(v6 - v12);
  objc_msgSend(v8, "setFrame:", v14, v15 * 0.5, v10, v12);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end