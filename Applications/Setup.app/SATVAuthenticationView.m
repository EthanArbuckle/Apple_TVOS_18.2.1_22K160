@interface SATVAuthenticationView
- (BOOL)continueButtonEnabled;
- (BOOL)touchInputEnabled;
- (NSString)passwordText;
- (NSString)usernameText;
- (SATVAuthenticationView)initWithFrame:(CGRect)a3;
- (UIButton)continueButton;
- (UIButton)skipButton;
- (UIButton)useSeparateIDsButton;
- (UIFocusGuide)gridFocusGuide;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)dialogueColumnStackView;
- (UIStackView)parentStackView;
- (UITextField)passwordTextField;
- (UITextField)usernameTextField;
- (UIView)systemInputContainerView;
- (UIView)systemInputView;
- (id)_buildDialogueColumnStackView;
- (id)_createButtonStackView;
- (void)_formatUsernameIfNeeded;
- (void)_updateContinueButtonForTextChange;
- (void)clearTextFields;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDialogueColumnStackView:(id)a3;
- (void)setGridFocusGuide:(id)a3;
- (void)setParentStackView:(id)a3;
- (void)setPasswordTextField:(id)a3;
- (void)setPreferredFocusedEnvironmentForGridLayoutGuide:(id)a3;
- (void)setSystemInputContainerView:(id)a3;
- (void)setTouchInputEnabled:(BOOL)a3;
- (void)setUsernameText:(id)a3;
- (void)setUsernameTextField:(id)a3;
@end

@implementation SATVAuthenticationView

- (SATVAuthenticationView)initWithFrame:(CGRect)a3
{
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___SATVAuthenticationView;
  v3 = -[SATVAuthenticationView initWithFrame:]( &v56,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVSKLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[TVSKLabel initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0LL);
    v14 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v16);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0LL);
    v18 = -[UITextField initWithFrame:]( objc_alloc(&OBJC_CLASS___UITextField),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    usernameTextField = v4->_usernameTextField;
    v4->_usernameTextField = v18;

    -[UITextField setAutocorrectionType:](v4->_usernameTextField, "setAutocorrectionType:", 1LL);
    -[UITextField setSecureTextEntry:](v4->_usernameTextField, "setSecureTextEntry:", 0LL);
    -[UITextField setKeyboardType:](v4->_usernameTextField, "setKeyboardType:", 7LL);
    id v20 = sub_10000D7CC(@"AUTH_APPLE_ID_PLACEHOLDER", @"Localizable");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UITextField setPlaceholder:](v4->_usernameTextField, "setPlaceholder:", v21);

    -[UITextField _setBlurEnabled:](v4->_usernameTextField, "_setBlurEnabled:", 0LL);
    -[UITextField setUserInteractionEnabled:](v4->_usernameTextField, "setUserInteractionEnabled:", 1LL);
    -[UITextField addTarget:action:forControlEvents:]( v4->_usernameTextField,  "addTarget:action:forControlEvents:",  v4,  "_updateContinueButtonForTextChange",  0x20000LL);
    -[UITextField addTarget:action:forControlEvents:]( v4->_usernameTextField,  "addTarget:action:forControlEvents:",  v4,  "_formatUsernameIfNeeded",  0x40000LL);
    v22 = -[UITextField initWithFrame:]( objc_alloc(&OBJC_CLASS___UITextField),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    passwordTextField = v4->_passwordTextField;
    v4->_passwordTextField = v22;

    -[UITextField setSecureTextEntry:](v4->_passwordTextField, "setSecureTextEntry:", 1LL);
    id v24 = sub_10000D7CC(@"AUTH_PASSWORD_TITLE", @"Localizable");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[UITextField setPlaceholder:](v4->_passwordTextField, "setPlaceholder:", v25);

    -[UITextField setAutocorrectionType:](v4->_passwordTextField, "setAutocorrectionType:", 1LL);
    -[UITextField _setBlurEnabled:](v4->_passwordTextField, "_setBlurEnabled:", 0LL);
    -[UITextField setUserInteractionEnabled:](v4->_passwordTextField, "setUserInteractionEnabled:", 1LL);
    -[UITextField addTarget:action:forControlEvents:]( v4->_passwordTextField,  "addTarget:action:forControlEvents:",  v4,  "_updateContinueButtonForTextChange",  0x20000LL);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    continueButton = v4->_continueButton;
    v4->_continueButton = (UIButton *)v26;

    -[UIButton setEnabled:](v4->_continueButton, "setEnabled:", 0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleTitle3));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_continueButton, "titleLabel"));
    [v29 setFont:v28];

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    useSeparateIDsButton = v4->_useSeparateIDsButton;
    v4->_useSeparateIDsButton = (UIButton *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_useSeparateIDsButton, "titleLabel"));
    [v33 setFont:v32];

    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    skipButton = v4->_skipButton;
    v4->_skipButton = (UIButton *)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_skipButton, "titleLabel"));
    [v37 setFont:v36];

    v38 = objc_alloc_init(&OBJC_CLASS___UIView);
    systemInputView = v4->_systemInputView;
    v4->_systemInputView = v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView _buildDialogueColumnStackView](v4, "_buildDialogueColumnStackView"));
    dialogueColumnStackView = v4->_dialogueColumnStackView;
    v4->_dialogueColumnStackView = (UIStackView *)v40;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_dialogueColumnStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SATVAuthenticationView addSubview:](v4, "addSubview:", v4->_dialogueColumnStackView);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_dialogueColumnStackView, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView leadingAnchor](v4, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
    v57[0] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_dialogueColumnStackView, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView topAnchor](v4, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v42]);
    v57[1] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_dialogueColumnStackView, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView trailingAnchor](v4, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45]);
    v57[2] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_dialogueColumnStackView, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView bottomAnchor](v4, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v48]);
    v57[3] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v50);
  }

  return v4;
}

- (void)setPreferredFocusedEnvironmentForGridLayoutGuide:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView gridFocusGuide](self, "gridFocusGuide"));
  v6 = v5;
  if (v4)
  {
    id v8 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [v6 setPreferredFocusEnvironments:v7];
  }

  else
  {
    [v5 setPreferredFocusEnvironments:&__NSArray0__struct];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if (!-[SATVAuthenticationView touchInputEnabled](self, "touchInputEnabled", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v5 focusedView]);

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView continueButton](self, "continueButton"));
    v7 = v14;
    if (v14 != v6)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView skipButton](self, "skipButton"));
      if (v14 != (id)v8)
      {
        v9 = (void *)v8;
        id v10 = (id)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView useSeparateIDsButton](self, "useSeparateIDsButton"));

        if (v14 != v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView gridFocusGuide](self, "gridFocusGuide"));
          v12 = v11;
          uint64_t v13 = 1LL;
LABEL_9:
          [v11 setEnabled:v13];

          return;
        }

- (NSString)passwordText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_passwordTextField, "text"));
  id v3 = [v2 copy];

  return (NSString *)v3;
}

- (NSString)usernameText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_usernameTextField, "text"));
  id v3 = [v2 copy];

  return (NSString *)v3;
}

- (void)setUsernameText:(id)a3
{
}

- (BOOL)continueButtonEnabled
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView usernameText](self, "usernameText"));
  if ([v3 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView passwordText](self, "passwordText"));
    BOOL v5 = [v4 length] != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)clearTextFields
{
}

- (id)_buildDialogueColumnStackView
{
  id v3 = objc_alloc(&OBJC_CLASS___UIStackView);
  subtitleLabel = self->_subtitleLabel;
  v22[0] = self->_titleLabel;
  v22[1] = subtitleLabel;
  passwordTextField = self->_passwordTextField;
  v22[2] = self->_usernameTextField;
  v22[3] = passwordTextField;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView _createButtonStackView](self, "_createButtonStackView"));
  v22[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL));
  uint64_t v8 = -[UIStackView initWithArrangedSubviews:](v3, "initWithArrangedSubviews:", v7);

  -[UIStackView setAlignment:](v8, "setAlignment:", 3LL);
  -[UIStackView setAxis:](v8, "setAxis:", 1LL);
  -[UIStackView setSpacing:](v8, "setSpacing:", 50.0);
  -[UIStackView setCustomSpacing:afterView:](v8, "setCustomSpacing:afterView:", self->_usernameTextField, 20.0);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintLessThanOrEqualToConstant:1000.0]);
  v21[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField widthAnchor](self->_usernameTextField, "widthAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToConstant:600.0]);
  v21[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField heightAnchor](self->_usernameTextField, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToConstant:70.0]);
  v21[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField widthAnchor](self->_passwordTextField, "widthAnchor"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToConstant:600.0]);
  v21[3] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField heightAnchor](self->_passwordTextField, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToConstant:70.0]);
  v21[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);

  return v8;
}

- (void)_updateContinueButtonForTextChange
{
}

- (void)_formatUsernameIfNeeded
{
  id v5 = (id)objc_opt_new(&OBJC_CLASS___AAFPhoneNumberFormatter, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_usernameTextField, "text"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 displayFormatFor:v3]);
  -[UITextField setText:](self->_usernameTextField, "setText:", v4);
}

- (id)_createButtonStackView
{
  id v3 = objc_alloc(&OBJC_CLASS___UIStackView);
  useSeparateIDsButton = self->_useSeparateIDsButton;
  v8[0] = self->_continueButton;
  v8[1] = useSeparateIDsButton;
  v8[2] = self->_skipButton;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  id v6 = -[UIStackView initWithArrangedSubviews:](v3, "initWithArrangedSubviews:", v5);

  -[UIStackView setAlignment:](v6, "setAlignment:", 3LL);
  -[UIStackView setAxis:](v6, "setAxis:", 1LL);
  -[UIStackView setSpacing:](v6, "setSpacing:", 14.0);
  return v6;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (UIButton)useSeparateIDsButton
{
  return self->_useSeparateIDsButton;
}

- (UIView)systemInputView
{
  return self->_systemInputView;
}

- (BOOL)touchInputEnabled
{
  return self->_touchInputEnabled;
}

- (void)setTouchInputEnabled:(BOOL)a3
{
  self->_touchInputEnabled = a3;
}

- (UIFocusGuide)gridFocusGuide
{
  return self->_gridFocusGuide;
}

- (void)setGridFocusGuide:(id)a3
{
}

- (UIView)systemInputContainerView
{
  return self->_systemInputContainerView;
}

- (void)setSystemInputContainerView:(id)a3
{
}

- (UITextField)passwordTextField
{
  return self->_passwordTextField;
}

- (void)setPasswordTextField:(id)a3
{
}

- (UITextField)usernameTextField
{
  return self->_usernameTextField;
}

- (void)setUsernameTextField:(id)a3
{
}

- (UIStackView)parentStackView
{
  return self->_parentStackView;
}

- (void)setParentStackView:(id)a3
{
}

- (UIStackView)dialogueColumnStackView
{
  return self->_dialogueColumnStackView;
}

- (void)setDialogueColumnStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end