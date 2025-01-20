@interface SATVTapToSetupViewController
- (NSString)deviceLanguageCode;
- (NSString)setupDeviceName;
- (NSString)setupNetworkName;
- (SATVDialogueColumnHeaderView)bannerView;
- (SATVTapToSetupViewController)initWithDeviceLanguageCode:(id)a3;
- (void)_removeFooterLabelHint;
- (void)_showFooterLabelHint;
- (void)_updateBannerViewSubtitleLabel:(id)a3;
- (void)addConstraintsForHeaderView;
- (void)setBannerView:(id)a3;
- (void)setDeviceLanguageCode:(id)a3;
- (void)setSetupDeviceName:(id)a3;
- (void)setSetupNetworkName:(id)a3;
- (void)tapToSetupDidBeginConfigurationPhase:(int64_t)a3 withMetadata:(id)a4;
- (void)tapToSetupDidBeginWithDeviceName:(id)a3 isNewFlow:(BOOL)a4;
- (void)tapToSetupDidPromptToBegin;
- (void)tapToSetupWiFiNetworkConnectionStateDidChange:(int64_t)a3;
- (void)tapToSetupWillAttemptAuthentication;
- (void)tapToSetupWillConnectToWiFiNetworkWithName:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVTapToSetupViewController

- (SATVTapToSetupViewController)initWithDeviceLanguageCode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  v6 = -[SATVTapToSetupViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceLanguageCode, a3);
    -[SATVTapToSetupViewController setForceRTLLayout:]( v7,  "setForceRTLLayout:",  (id)+[NSLocale characterDirectionForLanguage:](&OBJC_CLASS___NSLocale, "characterDirectionForLanguage:", v5) == (id)2);
  }

  return v7;
}

- (void)tapToSetupDidPromptToBegin
{
  id v3 = -[SATVTapToSetupViewController view](self, "view");
  -[SATVTapToSetupViewController _removeFooterLabelHint](self, "_removeFooterLabelHint");
}

- (void)tapToSetupDidBeginWithDeviceName:(id)a3 isNewFlow:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  id v6 = -[SATVTapToSetupViewController view](self, "view");
  if ([v20 length])
  {
    -[SATVTapToSetupViewController setSetupDeviceName:](self, "setSetupDeviceName:", v20);
  }

  else
  {
    id v7 = sub_10000D7CC(@"TTS_DEVICE_NAME_GENERIC", @"Localizable");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SATVTapToSetupViewController setSetupDeviceName:](self, "setSetupDeviceName:", v8);
  }

  -[SATVTapToSetupViewController _removeFooterLabelHint](self, "_removeFooterLabelHint");
  -[SATVTapToSetupViewController setSetupNetworkName:](self, "setSetupNetworkName:", 0LL);
  if (v4)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedString:@"TTS_SETTING_UP" forLanguage:self->_deviceLanguageCode]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView titleLabel](self->_bannerView, "titleLabel"));
    [v11 setText:v10];

    -[SATVDialogueColumnHeaderView setIsLoading:](self->_bannerView, "setIsLoading:", 1LL);
    uint64_t v12 = SFLocalizableWAPIStringKeyForKey(@"TTS_CONFIGURING_FROM_DEVICE");
  }

  else
  {
    uint64_t v12 = SFLocalizableWAPIStringKeyForKey(@"TTS_ASKING_FOR_NETWORK_WIFI");
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = sub_10000D7CC(v13, @"Localizable");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController setupDeviceName](self, "setupDeviceName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
  [v18 setText:v17];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  [v19 setNeedsLayout];
}

- (void)tapToSetupDidBeginConfigurationPhase:(int64_t)a3 withMetadata:(id)a4
{
  id v6 = a4;
  -[SATVTapToSetupViewController _removeFooterLabelHint](self, "_removeFooterLabelHint");
  switch(a3)
  {
    case 0LL:
      id v7 = 0LL;
      v8 = @"TTS_CONFIGURATION_PHASE_LANGUAGE";
      break;
    case 1LL:
      id v7 = 0LL;
      v8 = @"TTS_CONFIGURATION_PHASE_REGION";
      break;
    case 2LL:
      id v7 = 0LL;
      v8 = @"TTS_CONFIGURATION_PHASE_NETWORK_CONNECTED";
      break;
    case 3LL:
      id v7 = 0LL;
      v8 = @"TTS_CONFIGURATION_PHASE_NETWORK_FAILED";
      break;
    case 4LL:
      id v7 = v6;
      v8 = @"TTS_CONFIGURATION_AUTHENTICATION_ATTEMPT";
      break;
    case 5LL:
      id v7 = v6;
      v8 = @"TTS_CONFIGURATION_AUTHENTICATION_ITUNES_ATTEMPT";
      break;
    case 6LL:
      id v7 = v6;
      v8 = @"TTS_CONFIGURATION_AUTHENTICATION_ICLOUD_ATTEMPT";
      break;
    case 7LL:
      id v7 = v6;
      v8 = @"TTS_CONFIGURATION_AUTHENTICATION_GAME_CENTER_ATTEMPT";
      break;
    default:
      id v7 = 0LL;
      v8 = 0LL;
      break;
  }

  uint64_t v9 = SFLocalizableWAPIStringKeyForKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_10000D7CC(v10, @"Localizable");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v7));

  id v14 = sub_10002AF94();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SATVTapToSetupViewController tapToSetupDidBeginConfigurationPhase:withMetadata:]";
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
  [v16 setText:v13];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  [v17 setNeedsLayout];
}

- (void)tapToSetupWillConnectToWiFiNetworkWithName:(id)a3
{
  id v4 = a3;
  -[SATVTapToSetupViewController _removeFooterLabelHint](self, "_removeFooterLabelHint");
  -[SATVTapToSetupViewController setSetupNetworkName:](self, "setSetupNetworkName:", v4);
}

- (void)tapToSetupWiFiNetworkConnectionStateDidChange:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController setupNetworkName](self, "setupNetworkName"));
  id v6 = [v5 length];

  if (a3 == 3)
  {
    if (v6)
    {
      id v7 = @"TTS_CONNECTING_TO_NETWORK";
      goto LABEL_7;
    }

    uint64_t v12 = @"TTS_CONNECTING_TO_NETWORK_GENERIC_WIFI";
LABEL_10:
    uint64_t v13 = SFLocalizableWAPIStringKeyForKey(v12);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = sub_10000D7CC(v9, @"Localizable");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_11;
  }

  if (a3 == 1)
  {
    if (v6)
    {
      id v7 = @"TTS_SCANNING_FOR_NETWORK";
LABEL_7:
      id v8 = sub_10000D7CC(v7, @"Localizable");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController setupNetworkName](self, "setupNetworkName"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v10));

LABEL_11:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
      [v15 setText:v11];

      goto LABEL_12;
    }

    uint64_t v12 = @"TTS_SCANNING_FOR_NETWORK_GENERIC_WIFI";
    goto LABEL_10;
  }

- (void)tapToSetupWillAttemptAuthentication
{
  id v3 = sub_10000D7CC(@"TTS_ENTER_YOUR_APPLE_ID_AND_PASSWORD", @"Localizable");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController setupDeviceName](self, "setupDeviceName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
  [v7 setText:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  [v8 setNeedsLayout];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController viewDidLoad](&v23, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setAllowsGroupBlending:0];

  id v5 = -[SATVDialogueColumnHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVDialogueColumnHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  bannerView = self->_bannerView;
  self->_bannerView = v5;

  id v7 = sub_10000D7CC(@"AUTOMATIC_SETUP", @"Localizable");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView titleLabel](self->_bannerView, "titleLabel"));
  [v9 setText:v8];

  id v10 = sub_10000D7CC(@"AUTOMATIC_SETUP_DESCRIPTIONS", @"Localizable");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
  [v12 setText:v11];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
  -[SATVTapToSetupViewController _updateBannerViewSubtitleLabel:](self, "_updateBannerViewSubtitleLabel:", v13);

  id v14 = objc_alloc_init(&OBJC_CLASS___TVSKLabel);
  footerLabel = self->_footerLabel;
  self->_footerLabel = (UILabel *)v14;

  id v16 = self->_footerLabel;
  id v17 = sub_10000D7CC(@"AUTOMATIC_SETUP_FOOTER", @"Localizable");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UILabel setText:](v16, "setText:", v18);

  v19 = self->_footerLabel;
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityBDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityBDynamicColor"));
  -[UILabel setTextColor:](v19, "setTextColor:", v20);

  v21 = self->_footerLabel;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v21, "setFont:", v22);

  -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1LL);
  -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 0LL);
  -[UILabel sizeToFit](self->_footerLabel, "sizeToFit");
  -[UILabel setAlpha:](self->_footerLabel, "setAlpha:", 0.0);
  [v3 addSubview:self->_footerLabel];
  [v3 addSubview:self->_bannerView];
  -[SATVTapToSetupViewController addConstraintsForHeaderView](self, "addConstraintsForHeaderView");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_showFooterLabelHint",  0LL);
  -[SATVTapToSetupViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_showFooterLabelHint",  0LL,  10.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVTapToSetupViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  4LL,  4LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVTapToSetupViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController viewDidLayoutSubviews](&v23, "viewDidLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  double v22 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UILabel frame](self->_footerLabel, "frame");
  double v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double Height = CGRectGetHeight(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  CGFloat v21 = CGRectGetHeight(v25);
  -[UILabel setFrame:]( self->_footerLabel,  "setFrame:",  UIRectCenteredXInRect(v13, Height - v21 + -80.0, v17, v19, v22, v7, v9, v11));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVTapToSetupViewController;
  -[SATVTapToSetupViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v6 && [v4 userInterfaceStyle] != v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView subtitleLabel](self->_bannerView, "subtitleLabel"));
    -[SATVTapToSetupViewController _updateBannerViewSubtitleLabel:](self, "_updateBannerViewSubtitleLabel:", v7);
  }
}

- (void)_showFooterLabelHint
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100022A34;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (void)_removeFooterLabelHint
{
  footerLabel = self->_footerLabel;
  self->_footerLabel = 0LL;
}

- (void)_updateBannerViewSubtitleLabel:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000D7CC(@"AUTOMATIC_SETUP_DESCRIPTIONS", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setText:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 attributedText]);
  id v8 = [v7 mutableCopy];

  uint64_t v26 = 0LL;
  id v27 = [v8 length];
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:&v26]);
  id v10 = [v9 mutableCopy];

  CGRect v25 = v4;
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 font]);
  [v11 lineHeight];
  double v13 = v12;

  [v10 setMinimumLineHeight:v13];
  [v10 setMaximumLineHeight:v13];
  [v10 setLineSpacing:27.0];
  [v10 setAlignment:4];
  id v14 = [v10 copy];
  objc_msgSend(v8, "addAttribute:value:range:", NSParagraphStyleAttributeName, v14, v26, v27);

  CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController traitCollection](self, "traitCollection"));
  if ([v15 userInterfaceStyle] == (id)2) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityBDarkColor](&OBJC_CLASS___UIColor, "tvsk_opacityBDarkColor"));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityBLightColor](&OBJC_CLASS___UIColor, "tvsk_opacityBLightColor"));
  }
  double v17 = (void *)v16;

  for (uint64_t i = 1LL; i != 5; ++i)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu.", i));
    id v21 = [v19 rangeOfString:v20];
    uint64_t v23 = v22;

    objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v17, v21, v23);
  }

  id v24 = [v8 copy];
  [v25 setAttributedText:v24];
}

- (void)addConstraintsForHeaderView
{
  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView widthAnchor](self->_bannerView, "widthAnchor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 constraintEqualToConstant:835.0 + 30.0]);
  -[NSMutableArray addObject:](v21, "addObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  id v6 = -[SATVTapToSetupViewController tvsk_layoutStyle](self, "tvsk_layoutStyle");
  bannerView = self->_bannerView;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView topAnchor](bannerView, "topAnchor"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9 constant:372.0]);
    -[NSMutableArray addObject:](v21, "addObject:", v10);

    unsigned int v11 = -[SATVTapToSetupViewController forceRTLLayout](self, "forceRTLLayout");
    double v12 = self->_bannerView;
    if (v11)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView rightAnchor](v12, "rightAnchor"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 rightAnchor]);
      double v15 = -150.0;
    }

    else
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView leadingAnchor](v12, "leadingAnchor"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 leadingAnchor]);
      double v15 = 150.0;
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14 constant:v15]);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView centerYAnchor](bannerView, "centerYAnchor"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v5 centerYAnchor]);
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
    -[NSMutableArray addObject:](v21, "addObject:", v18);

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView centerXAnchor](self->_bannerView, "centerXAnchor"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 centerXAnchor]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
  }

  __int16 v20 = (void *)v19;
  -[NSMutableArray addObject:](v21, "addObject:", v19);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v21);
}

- (NSString)setupDeviceName
{
  return self->_setupDeviceName;
}

- (void)setSetupDeviceName:(id)a3
{
}

- (NSString)setupNetworkName
{
  return self->_setupNetworkName;
}

- (void)setSetupNetworkName:(id)a3
{
}

- (SATVDialogueColumnHeaderView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (NSString)deviceLanguageCode
{
  return self->_deviceLanguageCode;
}

- (void)setDeviceLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end