@interface TVMusicNoMusicView
- (TVMusicNoMusicView)initWithTitle:(id)a3 message:(id)a4;
- (TVMusicNoMusicView)initWithTitle:(id)a3 message:(id)a4 buttonText:(id)a5 buttonHandler:(id)a6;
- (UIButton)button;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)containerView;
- (void)setButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVMusicNoMusicView

- (TVMusicNoMusicView)initWithTitle:(id)a3 message:(id)a4
{
  return -[TVMusicNoMusicView initWithTitle:message:buttonText:buttonHandler:]( self,  "initWithTitle:message:buttonText:buttonHandler:",  a3,  a4,  0LL,  0LL);
}

- (TVMusicNoMusicView)initWithTitle:(id)a3 message:(id)a4 buttonText:(id)a5 buttonHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v14 bounds];
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___TVMusicNoMusicView;
  v15 = -[TVMusicNoMusicView initWithFrame:](&v42, "initWithFrame:");

  if (v15)
  {
    id v39 = v13;
    v16 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    containerView = v15->_containerView;
    v15->_containerView = v16;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v15->_containerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v15->_containerView, "setAxis:", 1LL);
    -[UIStackView setDistribution:](v15->_containerView, "setDistribution:", 0LL);
    -[UIStackView setSpacing:](v15->_containerView, "setSpacing:", 64.0);
    -[UIStackView setAlignment:](v15->_containerView, "setAlignment:", 3LL);
    -[UIStackView setBaselineRelativeArrangement:](v15->_containerView, "setBaselineRelativeArrangement:", 1LL);
    -[TVMusicNoMusicView addSubview:](v15, "addSubview:", v15->_containerView);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v15->_containerView, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNoMusicView centerYAnchor](v15, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19]);
    [v20 setActive:1];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v15->_containerView, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNoMusicView centerXAnchor](v15, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
    [v23 setActive:1];

    v24 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = v24;

    -[UILabel setText:](v15->_titleLabel, "setText:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle2,  1024LL));
    -[UILabel setFont:](v15->_titleLabel, "setFont:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor"));
    -[UILabel setTextColor:](v15->_titleLabel, "setTextColor:", v27);

    -[UILabel setTextAlignment:](v15->_titleLabel, "setTextAlignment:", 1LL);
    -[UIStackView addArrangedSubview:](v15->_containerView, "addArrangedSubview:", v15->_titleLabel);
    if (v11)
    {
      v28 = objc_alloc_init(&OBJC_CLASS___UILabel);
      messageLabel = v15->_messageLabel;
      v15->_messageLabel = v28;

      -[UILabel setText:](v15->_messageLabel, "setText:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
      -[UILabel setFont:](v15->_messageLabel, "setFont:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
      -[UILabel setTextColor:](v15->_messageLabel, "setTextColor:", v31);

      -[UILabel setTextAlignment:](v15->_messageLabel, "setTextAlignment:", 1LL);
      -[UILabel setNumberOfLines:](v15->_messageLabel, "setNumberOfLines:", 0LL);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v15->_messageLabel, "widthAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToConstant:960.0]);
      [v33 setActive:1];

      -[UIStackView addArrangedSubview:](v15->_containerView, "addArrangedSubview:", v15->_messageLabel);
    }

    id v13 = v39;
    if (v12)
    {
      v34 = v15->_messageLabel;
      if (!v34) {
        v34 = v15->_titleLabel;
      }
      -[UIStackView setCustomSpacing:afterView:](v15->_containerView, "setCustomSpacing:afterView:", v34, 100.0, v39);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1000261D0;
      v40[3] = &unk_100269E18;
      id v41 = v13;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v40));
      [v35 setTitle:v12];
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[UIButton buttonWithType:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithType:primaryAction:",  1LL,  v35));
      button = v15->_button;
      v15->_button = (UIButton *)v36;

      -[UIStackView addArrangedSubview:](v15->_containerView, "addArrangedSubview:", v15->_button);
    }
  }

  return v15;
}

- (UIStackView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end