@interface PBExternalLinkingViewController
- (CGColor)_secondaryLabelCGColor;
- (PBCFUserNotification)notification;
- (PBExternalLinkingViewController)init;
- (PBUserNotificationViewControllerDelegate)delegate;
- (UIButton)alternateButton;
- (UIButton)defaultButton;
- (UIButton)otherButton;
- (UIImageView)QRCodeImageView;
- (UILabel)QRCodeCaptionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)buttonsStackView;
- (UIStackView)textAndButtonsStackView;
- (UIView)QRCodeContainerView;
- (id)_QRCodeImageForURLString:(id)a3;
- (id)_attributedStringForCaptionString:(id)a3;
- (int64_t)_buttonRoleForActionStyle:(int64_t)a3;
- (void)_updateContent;
- (void)alternateButtonPressed;
- (void)defaultButtonPressed;
- (void)otherButtonPressed;
- (void)setDelegate:(id)a3;
- (void)setNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBExternalLinkingViewController

- (PBExternalLinkingViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBExternalLinkingViewController;
  v2 = -[PBExternalLinkingViewController init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    -[PBExternalLinkingViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 8LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    BOOL v5 = [v4 userInterfaceLayoutDirection] == (id)1;

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithLayoutDirection:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithLayoutDirection:",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL));
    v13[0] = v7;
    v13[1] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithTraitsFromCollections:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithTraitsFromCollections:",  v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalLinkingViewController presentationController](v3, "presentationController"));
    [v10 setOverrideTraitCollection:v9];
  }

  return v3;
}

- (void)viewDidLoad
{
  v112.receiver = self;
  v112.super_class = (Class)&OBJC_CLASS___PBExternalLinkingViewController;
  -[PBExternalLinkingViewController viewDidLoad](&v112, "viewDidLoad");
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalLinkingViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v104 layer]);
  [v3 setAllowsGroupBlending:0];

  v103 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
  v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = self->_titleLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle3,  1024LL));
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = self->_titleLabel;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_titleLabel, "layer"));
  [v10 setCompositingFilter:v103];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v11;

  v13 = self->_subtitleLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v13, "setFont:", v14);

  v15 = self->_subtitleLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor"));
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_subtitleLabel, "layer"));
  [v17 setCompositingFilter:v103];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  objc_initWeak(&location, self);
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_10016C78C;
  v109[3] = &unk_1003D22B0;
  objc_copyWeak(&v110, &location);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v109));
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue( +[UIButton systemButtonWithPrimaryAction:]( &OBJC_CLASS___UIButton,  "systemButtonWithPrimaryAction:",  v18));
  defaultButton = self->_defaultButton;
  self->_defaultButton = v19;

  -[UIButton _setBlurEnabled:](self->_defaultButton, "_setBlurEnabled:", 0LL);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( self->_defaultButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIButton setHidden:](self->_defaultButton, "setHidden:", 1LL);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_10016C7B8;
  v107[3] = &unk_1003D22B0;
  objc_copyWeak(&v108, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v107));
  v22 = (UIButton *)objc_claimAutoreleasedReturnValue( +[UIButton systemButtonWithPrimaryAction:]( &OBJC_CLASS___UIButton,  "systemButtonWithPrimaryAction:",  v21));
  alternateButton = self->_alternateButton;
  self->_alternateButton = v22;

  -[UIButton _setBlurEnabled:](self->_alternateButton, "_setBlurEnabled:", 0LL);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( self->_alternateButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIButton setHidden:](self->_alternateButton, "setHidden:", 1LL);
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_10016C7E4;
  v105[3] = &unk_1003D22B0;
  objc_copyWeak(&v106, &location);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v105));
  v25 = (UIButton *)objc_claimAutoreleasedReturnValue( +[UIButton systemButtonWithPrimaryAction:]( &OBJC_CLASS___UIButton,  "systemButtonWithPrimaryAction:",  v24));
  otherButton = self->_otherButton;
  self->_otherButton = v25;

  -[UIButton _setBlurEnabled:](self->_otherButton, "_setBlurEnabled:", 0LL);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( self->_otherButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIButton setHidden:](self->_otherButton, "setHidden:", 1LL);
  v27 = objc_alloc(&OBJC_CLASS___UIStackView);
  v28 = self->_alternateButton;
  v115[0] = self->_defaultButton;
  v115[1] = v28;
  v115[2] = self->_otherButton;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v115, 3LL));
  v30 = -[UIStackView initWithArrangedSubviews:](v27, "initWithArrangedSubviews:", v29);
  buttonsStackView = self->_buttonsStackView;
  self->_buttonsStackView = v30;

  -[UIStackView setAxis:](self->_buttonsStackView, "setAxis:", 1LL);
  -[UIStackView setSpacing:](self->_buttonsStackView, "setSpacing:", 14.0);
  -[UIStackView setDistribution:](self->_buttonsStackView, "setDistribution:", 3LL);
  -[UIStackView setAlignment:](self->_buttonsStackView, "setAlignment:", 3LL);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( self->_buttonsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v32 = objc_alloc(&OBJC_CLASS___UIStackView);
  v33 = self->_subtitleLabel;
  v114[0] = self->_titleLabel;
  v114[1] = v33;
  v114[2] = self->_buttonsStackView;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v114, 3LL));
  v35 = -[UIStackView initWithArrangedSubviews:](v32, "initWithArrangedSubviews:", v34);
  textAndButtonsStackView = self->_textAndButtonsStackView;
  self->_textAndButtonsStackView = v35;

  -[UIStackView setAxis:](self->_textAndButtonsStackView, "setAxis:", 1LL);
  -[UIStackView setSpacing:](self->_textAndButtonsStackView, "setSpacing:", 40.0);
  -[UIStackView setDistribution:](self->_buttonsStackView, "setDistribution:", 2LL);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layer](self->_textAndButtonsStackView, "layer"));
  [v37 setAllowsGroupBlending:0];

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( self->_textAndButtonsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v104 addSubview:self->_textAndButtonsStackView];
  v38 = objc_alloc_init(&OBJC_CLASS___UIView);
  QRCodeContainerView = self->_QRCodeContainerView;
  self->_QRCodeContainerView = v38;

  v40 = self->_QRCodeContainerView;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
  -[UIView setBackgroundColor:](v40, "setBackgroundColor:", v41);

  -[UIView _setContinuousCornerRadius:](self->_QRCodeContainerView, "_setContinuousCornerRadius:", 50.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_QRCodeContainerView, "layer"));
  [v42 setAllowsGroupBlending:0];

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v104 addSubview:self->_QRCodeContainerView];
  v43 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  QRCodeImageView = self->_QRCodeImageView;
  self->_QRCodeImageView = v43;

  -[UIImageView setContentMode:](self->_QRCodeImageView, "setContentMode:", 4LL);
  -[UIImageView _setContinuousCornerRadius:](self->_QRCodeImageView, "_setContinuousCornerRadius:", 35.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_QRCodeImageView, "layer"));
  [v45 setBorderWidth:7.0];

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_QRCodeImageView, "layer"));
  objc_msgSend( v46,  "setBorderColor:",  -[PBExternalLinkingViewController _secondaryLabelCGColor](self, "_secondaryLabelCGColor"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_QRCodeImageView, "layer"));
  [v47 setCompositingFilter:v103];

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView addSubview:](self->_QRCodeContainerView, "addSubview:", self->_QRCodeImageView);
  v48 = objc_alloc_init(&OBJC_CLASS___UILabel);
  QRCodeCaptionLabel = self->_QRCodeCaptionLabel;
  self->_QRCodeCaptionLabel = v48;

  v50 = self->_QRCodeCaptionLabel;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCaption2,  256LL));
  -[UILabel setFont:](v50, "setFont:", v51);

  v52 = self->_QRCodeCaptionLabel;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v52, "setTextColor:", v53);

  -[UILabel setNumberOfLines:](self->_QRCodeCaptionLabel, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](self->_QRCodeCaptionLabel, "setTextAlignment:", 1LL);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_QRCodeCaptionLabel, "layer"));
  [v54 setCompositingFilter:v103];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeCaptionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView addSubview:](self->_QRCodeContainerView, "addSubview:", self->_QRCodeCaptionLabel);
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_textAndButtonsStackView, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue([v104 leadingAnchor]);
  v100 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToAnchor:v101 constant:190.0]);
  v113[0] = v100;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_textAndButtonsStackView, "centerYAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue([v104 centerYAnchor]);
  v97 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintEqualToAnchor:v98]);
  v113[1] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_textAndButtonsStackView, "widthAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToConstant:760.0]);
  v113[2] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_defaultButton, "widthAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_otherButton, "widthAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v94 constraintEqualToAnchor:v93]);
  v113[3] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_defaultButton, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_alternateButton, "widthAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v91 constraintEqualToAnchor:v90]);
  v113[4] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_QRCodeContainerView, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v104 trailingAnchor]);
  v86 = (void *)objc_claimAutoreleasedReturnValue([v88 constraintEqualToAnchor:v87 constant:-215.0]);
  v113[5] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_QRCodeContainerView, "centerYAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v104 centerYAnchor]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintEqualToAnchor:v84]);
  v113[6] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_QRCodeContainerView, "widthAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v82 constraintEqualToConstant:520.0]);
  v113[7] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_QRCodeImageView, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_QRCodeContainerView, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79 constant:50.0]);
  v113[8] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_QRCodeImageView, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_QRCodeContainerView, "bottomAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintLessThanOrEqualToAnchor:v76 constant:-51.0]);
  v113[9] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_QRCodeImageView, "centerXAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_QRCodeContainerView, "centerXAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v73]);
  v113[10] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_QRCodeImageView, "widthAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v71 constraintEqualToConstant:414.0]);
  v113[11] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_QRCodeImageView, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintEqualToConstant:414.0]);
  v113[12] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_QRCodeCaptionLabel, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_QRCodeImageView, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66 constant:30.0]);
  v113[13] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_QRCodeCaptionLabel, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_QRCodeContainerView, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v55 constant:-51.0]);
  v113[14] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_QRCodeCaptionLabel, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_QRCodeContainerView, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v58 constant:40.0]);
  v113[15] = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_QRCodeCaptionLabel, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_QRCodeContainerView, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v61 constant:-40.0]);
  v113[16] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v113, 17LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v63);

  -[PBExternalLinkingViewController _updateContent](self, "_updateContent");
  objc_destroyWeak(&v106);
  objc_destroyWeak(&v108);
  objc_destroyWeak(&v110);
  objc_destroyWeak(&location);
}

- (void)setNotification:(id)a3
{
  id v5 = a3;
  if ([v5 notificationType] == (id)7)
  {
    objc_storeStrong((id *)&self->_notification, a3);
    -[PBExternalLinkingViewController _updateContent](self, "_updateContent");
  }

  else
  {
    id v6 = sub_10016C89C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100288808(v5, v7);
    }
  }
}

- (void)defaultButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend( WeakRetained,  "userNotificationViewController:didSelectButtonIndex:",  self,  -[PBCFUserNotification defaultButtonIndex](self->_notification, "defaultButtonIndex"));
}

- (void)alternateButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend( WeakRetained,  "userNotificationViewController:didSelectButtonIndex:",  self,  -[PBCFUserNotification alternateButtonIndex](self->_notification, "alternateButtonIndex"));
}

- (void)otherButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend( WeakRetained,  "userNotificationViewController:didSelectButtonIndex:",  self,  -[PBCFUserNotification otherButtonIndex](self->_notification, "otherButtonIndex"));
}

- (void)_updateContent
{
  titleLabel = self->_titleLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertHeader](self->_notification, "alertHeader"));
  -[UILabel setText:](titleLabel, "setText:", v4);

  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  subtitleLabel = self->_subtitleLabel;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertMessage](self->_notification, "alertMessage"));
  -[UILabel setText:](subtitleLabel, "setText:", v6);

  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](self->_notification, "defaultButtonTitle"));
  id v8 = [v7 length];

  defaultButton = self->_defaultButton;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](self->_notification, "defaultButtonTitle"));
    -[UIButton setTitle:forState:](defaultButton, "setTitle:forState:", v10, 0LL);

    -[UIButton setRole:]( self->_defaultButton,  "setRole:",  -[PBExternalLinkingViewController _buttonRoleForActionStyle:]( self,  "_buttonRoleForActionStyle:",  -[PBCFUserNotification defaultButtonStyle](self->_notification, "defaultButtonStyle")));
    v11 = self->_defaultButton;
    uint64_t v12 = 0LL;
  }

  else
  {
    v11 = self->_defaultButton;
    uint64_t v12 = 1LL;
  }

  -[UIButton setHidden:](v11, "setHidden:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](self->_notification, "alternateButtonTitle"));
  id v14 = [v13 length];

  alternateButton = self->_alternateButton;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](self->_notification, "alternateButtonTitle"));
    -[UIButton setTitle:forState:](alternateButton, "setTitle:forState:", v16, 0LL);

    -[UIButton setRole:]( self->_alternateButton,  "setRole:",  -[PBExternalLinkingViewController _buttonRoleForActionStyle:]( self,  "_buttonRoleForActionStyle:",  -[PBCFUserNotification alternateButtonStyle](self->_notification, "alternateButtonStyle")));
    v17 = self->_alternateButton;
    uint64_t v18 = 0LL;
  }

  else
  {
    v17 = self->_alternateButton;
    uint64_t v18 = 1LL;
  }

  -[UIButton setHidden:](v17, "setHidden:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](self->_notification, "otherButtonTitle"));
  id v20 = [v19 length];

  otherButton = self->_otherButton;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](self->_notification, "otherButtonTitle"));
    -[UIButton setTitle:forState:](otherButton, "setTitle:forState:", v22, 0LL);

    -[UIButton setRole:]( self->_otherButton,  "setRole:",  -[PBExternalLinkingViewController _buttonRoleForActionStyle:]( self,  "_buttonRoleForActionStyle:",  -[PBCFUserNotification otherButtonStyle](self->_notification, "otherButtonStyle")));
    v23 = self->_otherButton;
    uint64_t v24 = 0LL;
  }

  else
  {
    v23 = self->_otherButton;
    uint64_t v24 = 1LL;
  }

  -[UIButton setHidden:](v23, "setHidden:", v24);
  QRCodeCaptionLabel = self->_QRCodeCaptionLabel;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification QRCodeSubtitle](self->_notification, "QRCodeSubtitle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( -[PBExternalLinkingViewController _attributedStringForCaptionString:]( self,  "_attributedStringForCaptionString:",  v26));
  -[UILabel setAttributedText:](QRCodeCaptionLabel, "setAttributedText:", v27);

  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  QRCodeImageView = self->_QRCodeImageView;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification QRCodeURL](self->_notification, "QRCodeURL"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalLinkingViewController _QRCodeImageForURLString:](self, "_QRCodeImageForURLString:", v29));
  -[UIImageView setImage:](QRCodeImageView, "setImage:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalLinkingViewController view](self, "view"));
  [v31 setNeedsLayout];
}

- (CGColor)_secondaryLabelCGColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL));
  id v4 = objc_claimAutoreleasedReturnValue([v2 resolvedColorWithTraitCollection:v3]);
  id v5 = (CGColor *)[v4 CGColor];

  return v5;
}

- (int64_t)_buttonRoleForActionStyle:(int64_t)a3
{
  int64_t v3 = 3LL;
  if (a3 != 2) {
    int64_t v3 = 0LL;
  }
  if (a3 == 1) {
    return 2LL;
  }
  else {
    return v3;
  }
}

- (id)_attributedStringForCaptionString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v3);
    id v24 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDataDetector dataDetectorWithTypes:error:]( &OBJC_CLASS___NSDataDetector,  "dataDetectorWithTypes:error:",  32LL,  &v24));
    id v17 = v24;
    id v18 = v3;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
    id v6 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) range];
          uint64_t v12 = v11;
          NSAttributedStringKey v25 = NSForegroundColorAttributeName;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
          v26 = v13;
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));

          -[NSMutableAttributedString setAttributes:range:](v4, "setAttributes:range:", v14, v10, v12);
        }

        id v7 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
      }

      while (v7);
    }

    id v15 = -[NSMutableAttributedString copy](v4, "copy");

    id v3 = v18;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_QRCodeImageForURLString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:5]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter QRCodeGenerator](&OBJC_CLASS___CIFilter, "QRCodeGenerator"));
    [v7 setMessage:v6];
    [v7 setCorrectionLevel:@"H"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outputImage]);
    [v8 extent];
    CGAffineTransformMakeScale(&v23, 390.0 / v9, 390.0 / v10);
    CGAffineTransform v22 = v23;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 imageByApplyingTransform:&v22]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](&OBJC_CLASS___CIFilter, "filterWithName:", @"CIFalseColor"));
    [v12 setValue:v11 forKey:@"inputImage"];
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CIColor colorWithCGColor:]( &OBJC_CLASS___CIColor,  "colorWithCGColor:",  -[PBExternalLinkingViewController _secondaryLabelCGColor](self, "_secondaryLabelCGColor")));
    [v12 setValue:v13 forKey:@"inputColor0"];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CIColor clearColor](&OBJC_CLASS___CIColor, "clearColor"));
    [v12 setValue:v14 forKey:@"inputColor1"];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 outputImage]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v16 scale];
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCIImage:scale:orientation:]( &OBJC_CLASS___UIImage,  "imageWithCIImage:scale:orientation:",  v15,  0LL));

    if (!v17)
    {
      id v18 = sub_10016C89C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100288920((uint64_t)self, (uint64_t)v5, v19);
      }
    }
  }

  else
  {
    id v20 = sub_10016C89C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002888A0((uint64_t)self, v6);
    }
    id v17 = 0LL;
  }

  return v17;
}

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBCFUserNotification)notification
{
  return self->_notification;
}

- (UIStackView)textAndButtonsStackView
{
  return self->_textAndButtonsStackView;
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIView)QRCodeContainerView
{
  return self->_QRCodeContainerView;
}

- (UIImageView)QRCodeImageView
{
  return self->_QRCodeImageView;
}

- (UILabel)QRCodeCaptionLabel
{
  return self->_QRCodeCaptionLabel;
}

- (UIButton)defaultButton
{
  return self->_defaultButton;
}

- (UIButton)alternateButton
{
  return self->_alternateButton;
}

- (UIButton)otherButton
{
  return self->_otherButton;
}

- (void).cxx_destruct
{
}

@end