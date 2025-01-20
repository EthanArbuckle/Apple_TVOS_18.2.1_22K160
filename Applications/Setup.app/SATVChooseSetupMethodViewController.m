@interface SATVChooseSetupMethodViewController
+ (void)initialize;
- (BOOL)_advertisesBluetoothKeyboardSupport;
- (BOOL)_advertisesBluetoothKeyboardSupportAlways;
- (BOOL)_advertisesBluetoothKeyboardSupportOnFocus;
- (BOOL)_supportsBluetoothKeyboards;
- (BOOL)isBluetoothPairing;
- (OBPrivacyLinkController)privacyLink;
- (SATVBluetoothKeyboardManager)bluetoothKeyboardManager;
- (SATVChooseOptionView)chooseOptionView;
- (SATVChooseSetupMethodStepConfiguration)configuration;
- (SATVChooseSetupMethodViewController)initWithConfiguration:(id)a3;
- (TVSKLabel)keyboardPairingPromptLabel;
- (TVSUIDigitEntryViewController)digitEntryViewController;
- (id)completionHandler;
- (id)firstOptionButtonFooterViewForView:(id)a3;
- (id)firstOptionButtonTextForView:(id)a3;
- (id)preferredFocusEnvironments;
- (id)secondOptionButtonFooterViewForView:(id)a3;
- (id)secondOptionButtonTextForView:(id)a3;
- (id)subtitleTextForView:(id)a3;
- (id)titleTextForView:(id)a3;
- (void)_beginBluetoothKeyboardPairing;
- (void)_callCompletionWithUseTapToSetup:(BOOL)a3;
- (void)_configureKeyboardPairingPromptLabel;
- (void)_popDigitEntryController;
- (void)_stopBluetoothKeyboardPairing;
- (void)dealloc;
- (void)didFailToPairBluetoothKeyboardWithName:(id)a3;
- (void)didPairBluetoothKeyboardWithName:(id)a3;
- (void)didSelectFirstOptionForView:(id)a3;
- (void)didSelectSecondOptionForView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)digitEntryViewControllerDidCancel:(id)a3;
- (void)presentPIN:(int64_t)a3 forKeyboardWithName:(id)a4;
- (void)setBluetoothKeyboardManager:(id)a3;
- (void)setBluetoothPairing:(BOOL)a3;
- (void)setChooseOptionView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDigitEntryViewController:(id)a3;
- (void)setKeyboardPairingPromptLabel:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAttemptToPairBluetoothKeyboardWithName:(id)a3;
@end

@implementation SATVChooseSetupMethodViewController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodViewController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVChooseSetupMethodViewController");
    v3 = (void *)qword_100109900;
    qword_100109900 = (uint64_t)v2;
  }

- (SATVChooseSetupMethodViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  v6 = -[SATVChooseSetupMethodViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    if (-[SATVChooseSetupMethodViewController _supportsBluetoothKeyboards](v7, "_supportsBluetoothKeyboards"))
    {
      v8 = objc_alloc_init(&OBJC_CLASS___SATVBluetoothKeyboardManager);
      bluetoothKeyboardManager = v7->_bluetoothKeyboardManager;
      v7->_bluetoothKeyboardManager = v8;

      -[SATVBluetoothKeyboardManager setDelegate:](v7->_bluetoothKeyboardManager, "setDelegate:", v7);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.appleid"));
    privacyLink = v7->_privacyLink;
    v7->_privacyLink = (OBPrivacyLinkController *)v10;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController viewDidLoad](&v7, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setAllowsGroupBlending:0];

  id v5 = -[SATVChooseOptionView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVChooseOptionView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  chooseOptionView = self->_chooseOptionView;
  self->_chooseOptionView = v5;

  -[SATVChooseOptionView setDataSource:](self->_chooseOptionView, "setDataSource:", self);
  -[SATVChooseOptionView setDelegate:](self->_chooseOptionView, "setDelegate:", self);
  [v3 addSubview:self->_chooseOptionView];
  if (-[SATVChooseSetupMethodViewController _advertisesBluetoothKeyboardSupport]( self,  "_advertisesBluetoothKeyboardSupport"))
  {
    -[SATVChooseSetupMethodViewController _configureKeyboardPairingPromptLabel]( self,  "_configureKeyboardPairingPromptLabel");
  }
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController viewDidLayoutSubviews](&v28, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  objc_msgSend(v12, "sizeThatFits:", 835.0, 1.79769313e308);
  double v14 = v13;
  double v16 = v15;

  if (-[SATVChooseSetupMethodViewController tvsk_layoutStyle](self, "tvsk_layoutStyle"))
  {
    v29.origin.x = UIRectCenteredYInRect(0.0, 0.0, v14, v16, v5, v7, v9, v11);
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
    double v20 = floor(CGRectGetWidth(v29) * 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
    unsigned int v22 = [v21 _shouldReverseLayoutDirection];

    if (v22) {
      double v23 = v9 - (v20 + 572.0);
    }
    else {
      double v23 = 572.0 - v20;
    }
  }

  else
  {
    double v23 = UIRectCenteredRect(0.0, 0.0, v14, v16, v5, v7, v9, v11);
    double y = v24;
    double width = v25;
    double height = v26;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  objc_msgSend(v27, "setFrame:", v23, y, width, height);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVChooseSetupMethodViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  12LL,  11LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVChooseSetupMethodViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[SATVChooseSetupMethodViewController _supportsBluetoothKeyboards](self, "_supportsBluetoothKeyboards")) {
    -[SATVChooseSetupMethodViewController _beginBluetoothKeyboardPairing](self, "_beginBluetoothKeyboardPairing");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodViewController;
  -[SATVChooseSetupMethodViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  if (-[SATVChooseSetupMethodViewController _advertisesBluetoothKeyboardSupportOnFocus]( self,  "_advertisesBluetoothKeyboardSupportOnFocus"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedView]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 secondOptionButton]);
    BOOL v9 = v6 != v8;

    double v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodViewController keyboardPairingPromptLabel]( self,  "keyboardPairingPromptLabel"));
    [v10 setHidden:v9];
  }

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  objc_super v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    objc_super v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)titleTextForView:(id)a3
{
  return sub_10000D7CC(@"CHOOSE_SETUP_TITLE", @"Localizable");
}

- (id)subtitleTextForView:(id)a3
{
  uint64_t v3 = SFLocalizableWAPIStringKeyForKey(@"AUTOMATIC_SETUP_DESCRIPTION_WIFI");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_10000D7CC(v4, @"Localizable");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)firstOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"TAP_TO_SET_UP", @"Localizable");
}

- (id)secondOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"SET_UP_MANUALLY", @"Localizable");
}

- (id)firstOptionButtonFooterViewForView:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (id)secondOptionButtonFooterViewForView:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (void)didSelectFirstOptionForView:(id)a3
{
}

- (void)didSelectSecondOptionForView:(id)a3
{
}

- (void)presentPIN:(int64_t)a3 forKeyboardWithName:(id)a4
{
  id v33 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));

  if (!v6)
  {
    id v7 = sub_10000D7CC(@"BT_KEYBOARD_PAIRING_PIN_HEADER", @"Localizable");
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_10000D7CC(@"BT_KEYBOARD_PAIRING_PIN_INSTRUCTIONS", @"Localizable");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v33));

    v12 = -[TVSUIDigitEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___TVSUIDigitEntryViewController),  "initWithNumberOfDigits:",  4LL);
    -[SATVChooseSetupMethodViewController setDigitEntryViewController:](self, "setDigitEntryViewController:", v12);

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    [v13 setEditable:0];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    [v14 setDelegate:self];

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 titleLabel]);
    [v16 setText:v8];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 promptLabel]);
    [v18 setText:v11];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 digitGroupView]);
    [v20 setSecure:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    [v21 setModalPresentationStyle:8];

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    [v22 setOverrideUserInterfaceStyle:2];
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 digitGroupView]);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByPaddingToLength:4 withString:@"0" startingAtIndex:0]);
  [v24 setText:v27];

  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController navigationController](self, "navigationController"));
  CGRect v29 = (void *)objc_claimAutoreleasedReturnValue([v28 presentedViewController]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));

  if (v29 != v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController navigationController](self, "navigationController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
    [v31 presentViewController:v32 animated:1 completion:0];
  }
}

- (void)didPairBluetoothKeyboardWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  id v6 = sub_10000D7CC(@"BT_PAIRED_KEYBOARD", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));

  [v5 setText:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  [v9 reloadData];

  -[SATVChooseSetupMethodViewController _popDigitEntryController](self, "_popDigitEntryController");
  -[SATVChooseSetupMethodViewController _stopBluetoothKeyboardPairing](self, "_stopBluetoothKeyboardPairing");
}

- (void)didFailToPairBluetoothKeyboardWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  id v6 = sub_10000D7CC(@"BT_PAIR_KEYBOARD_ERROR", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));

  [v5 setText:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  [v9 reloadData];

  -[SATVChooseSetupMethodViewController _popDigitEntryController](self, "_popDigitEntryController");
}

- (void)willAttemptToPairBluetoothKeyboardWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  id v6 = sub_10000D7CC(@"BT_PAIRING_KEYBOARD_STATUS", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));

  [v5 setText:v8];
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  [v9 reloadData];
}

- (void)digitEntryViewControllerDidCancel:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodViewController keyboardPairingPromptLabel]( self,  "keyboardPairingPromptLabel",  a3));
  id v5 = sub_10000D7CC(@"BT_PAIR_KEYBOARD_INSTRUCTIONS", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setText:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController chooseOptionView](self, "chooseOptionView"));
  [v7 reloadData];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController bluetoothKeyboardManager](self, "bluetoothKeyboardManager"));
  [v8 cancelPINPairing];

  -[SATVChooseSetupMethodViewController _popDigitEntryController](self, "_popDigitEntryController");
}

- (void)_configureKeyboardPairingPromptLabel
{
  uint64_t v3 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  keyboardPairingPromptLabel = self->_keyboardPairingPromptLabel;
  self->_keyboardPairingPromptLabel = v3;

  id v5 = self->_keyboardPairingPromptLabel;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
  -[TVSKLabel setTextColor:](v5, "setTextColor:", v6);

  id v7 = self->_keyboardPairingPromptLabel;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleFootnote));
  -[TVSKLabel setFont:](v7, "setFont:", v8);

  id v9 = self->_keyboardPairingPromptLabel;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVSKLabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[TVSKLabel setNumberOfLines:](self->_keyboardPairingPromptLabel, "setNumberOfLines:", 0LL);
  -[TVSKLabel setLineBreakMode:](self->_keyboardPairingPromptLabel, "setLineBreakMode:", 4LL);
  -[TVSKLabel setTextAlignment:](self->_keyboardPairingPromptLabel, "setTextAlignment:", 1LL);
  objc_super v11 = self->_keyboardPairingPromptLabel;
  id v12 = sub_10000D7CC(@"BT_PAIR_KEYBOARD_INSTRUCTIONS", @"Localizable");
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[TVSKLabel setText:](v11, "setText:", v13);

  -[TVSKLabel setHidden:]( self->_keyboardPairingPromptLabel,  "setHidden:",  -[SATVChooseSetupMethodViewController _advertisesBluetoothKeyboardSupportAlways]( self,  "_advertisesBluetoothKeyboardSupportAlways") ^ 1);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
  [v14 addSubview:self->_keyboardPairingPromptLabel];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 centerXAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 centerXAnchor]);
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v19]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 widthAnchor]);
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintLessThanOrEqualToConstant:700.0]);

  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController keyboardPairingPromptLabel](self, "keyboardPairingPromptLabel"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bottomAnchor]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bottomAnchor]);
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v27 constant:-55.0]);

  v30[0] = v20;
  v30[1] = v23;
  v30[2] = v28;
  CGRect v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);
}

- (void)_beginBluetoothKeyboardPairing
{
  if (!-[SATVChooseSetupMethodViewController isBluetoothPairing](self, "isBluetoothPairing"))
  {
    -[SATVChooseSetupMethodViewController setBluetoothPairing:](self, "setBluetoothPairing:", 1LL);
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController bluetoothKeyboardManager](self, "bluetoothKeyboardManager"));
    [v3 startPairing];
  }

- (void)_stopBluetoothKeyboardPairing
{
  if (-[SATVChooseSetupMethodViewController isBluetoothPairing](self, "isBluetoothPairing"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController bluetoothKeyboardManager](self, "bluetoothKeyboardManager"));
    [v3 stopPairing];

    -[SATVChooseSetupMethodViewController setBluetoothPairing:](self, "setBluetoothPairing:", 0LL);
  }

- (void)_popDigitEntryController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController digitEntryViewController](self, "digitEntryViewController"));
  [v3 dismissViewControllerAnimated:1 completion:0];

  -[SATVChooseSetupMethodViewController setDigitEntryViewController:](self, "setDigitEntryViewController:", 0LL);
}

- (void)_callCompletionWithUseTapToSetup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    id v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, v3);
  }

- (BOOL)_supportsBluetoothKeyboards
{
  return -[SATVChooseSetupMethodStepConfiguration bluetoothKeyboardSetupMode]( self->_configuration,  "bluetoothKeyboardSetupMode") != 0;
}

- (BOOL)_advertisesBluetoothKeyboardSupport
{
  return (-[SATVChooseSetupMethodStepConfiguration bluetoothKeyboardSetupMode]( self->_configuration,  "bluetoothKeyboardSetupMode") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_advertisesBluetoothKeyboardSupportOnFocus
{
  return (id)-[SATVChooseSetupMethodStepConfiguration bluetoothKeyboardSetupMode]( self->_configuration,  "bluetoothKeyboardSetupMode") == (id)2;
}

- (BOOL)_advertisesBluetoothKeyboardSupportAlways
{
  return (id)-[SATVChooseSetupMethodStepConfiguration bluetoothKeyboardSetupMode]( self->_configuration,  "bluetoothKeyboardSetupMode") == (id)3;
}

- (SATVChooseSetupMethodStepConfiguration)configuration
{
  return self->_configuration;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SATVChooseOptionView)chooseOptionView
{
  return self->_chooseOptionView;
}

- (void)setChooseOptionView:(id)a3
{
}

- (TVSKLabel)keyboardPairingPromptLabel
{
  return self->_keyboardPairingPromptLabel;
}

- (void)setKeyboardPairingPromptLabel:(id)a3
{
}

- (SATVBluetoothKeyboardManager)bluetoothKeyboardManager
{
  return self->_bluetoothKeyboardManager;
}

- (void)setBluetoothKeyboardManager:(id)a3
{
}

- (TVSUIDigitEntryViewController)digitEntryViewController
{
  return self->_digitEntryViewController;
}

- (void)setDigitEntryViewController:(id)a3
{
}

- (BOOL)isBluetoothPairing
{
  return self->_bluetoothPairing;
}

- (void)setBluetoothPairing:(BOOL)a3
{
  self->_bluetoothPairing = a3;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (void)setPrivacyLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end