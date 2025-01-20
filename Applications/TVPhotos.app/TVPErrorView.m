@interface TVPErrorView
- (NSString)errorMessage;
- (NSString)errorTitle;
- (TVPErrorView)initWithFrame:(CGRect)a3;
- (TVPVibrantLabel)errorMessageLabel;
- (TVPVibrantLabel)errorTitleLabel;
- (void)setErrorMessage:(id)a3;
- (void)setErrorMessageLabel:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setErrorTitleLabel:(id)a3;
@end

@implementation TVPErrorView

- (TVPErrorView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___TVPErrorView;
  v3 = -[TVPErrorView initWithFrame:](&v41, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVPVibrantLabel);
    errorTitleLabel = v3->_errorTitleLabel;
    v3->_errorTitleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
    -[TVPVibrantLabel setFont:](v3->_errorTitleLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager errorMessageTitleColor](&OBJC_CLASS___TVPThemeManager, "errorMessageTitleColor"));
    -[TVPVibrantLabel setTextColor:](v3->_errorTitleLabel, "setTextColor:", v7);

    -[TVPVibrantLabel setNumberOfLines:](v3->_errorTitleLabel, "setNumberOfLines:", 1LL);
    -[TVPVibrantLabel setTextAlignment:](v3->_errorTitleLabel, "setTextAlignment:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVPVibrantLabel setBackgroundColor:](v3->_errorTitleLabel, "setBackgroundColor:", v8);

    v9 = objc_alloc_init(&OBJC_CLASS___TVPVibrantLabel);
    errorMessageLabel = v3->_errorMessageLabel;
    v3->_errorMessageLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
    -[TVPVibrantLabel setFont:](v3->_errorMessageLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVPThemeManager errorMessageSubtitleColor]( &OBJC_CLASS___TVPThemeManager,  "errorMessageSubtitleColor"));
    -[TVPVibrantLabel setTextColor:](v3->_errorMessageLabel, "setTextColor:", v12);

    -[TVPVibrantLabel setNumberOfLines:](v3->_errorMessageLabel, "setNumberOfLines:", 0LL);
    -[TVPVibrantLabel setTextAlignment:](v3->_errorMessageLabel, "setTextAlignment:", 1LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVPVibrantLabel setBackgroundColor:](v3->_errorMessageLabel, "setBackgroundColor:", v13);

    v14 = objc_alloc(&OBJC_CLASS___UIStackView);
    v43[0] = v3->_errorTitleLabel;
    v43[1] = v3->_errorMessageLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
    v16 = -[UIStackView initWithArrangedSubviews:](v14, "initWithArrangedSubviews:", v15);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v16,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v16, "setAxis:", 1LL);
    -[UIStackView setSpacing:](v16, "setSpacing:", 20.0);
    -[UIStackView setDistribution:](v16, "setDistribution:", 0LL);
    -[TVPErrorView addSubview:](v3, "addSubview:", v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v16, "centerXAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 centerXAnchor]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v38]);
    v42[0] = v37;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v16, "centerYAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v36 centerYAnchor]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34]);
    v42[1] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v16, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView topAnchor](v3, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintGreaterThanOrEqualToAnchor:v31]);
    v42[2] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v16, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView bottomAnchor](v3, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintLessThanOrEqualToAnchor:v28]);
    v42[3] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v16, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView leadingAnchor](v3, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintGreaterThanOrEqualToAnchor:v17]);
    v42[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v16, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPErrorView trailingAnchor](v3, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintLessThanOrEqualToAnchor:v20]);
    v42[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v16, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintLessThanOrEqualToConstant:960.0]);
    v42[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 7LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v24);
  }

  return v3;
}

- (void)setErrorTitle:(id)a3
{
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (TVPVibrantLabel)errorTitleLabel
{
  return self->_errorTitleLabel;
}

- (void)setErrorTitleLabel:(id)a3
{
}

- (TVPVibrantLabel)errorMessageLabel
{
  return self->_errorMessageLabel;
}

- (void)setErrorMessageLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end