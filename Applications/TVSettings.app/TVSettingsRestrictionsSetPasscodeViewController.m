@interface TVSettingsRestrictionsSetPasscodeViewController
- (NSString)passcodeToConfirm;
- (TVDigitEntryViewController)passcodeEntryViewController;
- (TVSettingsRestrictionsSetPasscodeViewController)initWithTitle:(id)a3 prompt:(id)a4 completion:(id)a5;
- (id)completion;
- (id)preferredFocusEnvironments;
- (void)_callCompletionHandlerWithPasscode:(id)a3;
- (void)_promptForConfirmationOfPasscode:(id)a3;
- (void)_userDidCancel;
- (void)_verifyPasscode:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPasscodeEntryViewController:(id)a3;
- (void)setPasscodeToConfirm:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TVSettingsRestrictionsSetPasscodeViewController

- (TVSettingsRestrictionsSetPasscodeViewController)initWithTitle:(id)a3 prompt:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsSetPasscodeViewController;
  v11 = -[TVSettingsRestrictionsSetPasscodeViewController init](&v23, "init");
  if (v11)
  {
    id v12 = [v10 copy];
    id completion = v11->_completion;
    v11->_id completion = v12;

    if (v8)
    {
      id v14 = v8;
    }

    else
    {
      uint64_t v15 = TSKLocString(@"RestrictionsPasscodeSetTitle");
      id v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    }

    v16 = v14;
    if (v9)
    {
      id v17 = v9;
    }

    else
    {
      uint64_t v18 = TSKLocString(@"RestrictionsPasscodeSetPrompt");
      id v17 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    v19 = v17;
    v20 = objc_alloc_init(&OBJC_CLASS___TVDigitEntryViewController);
    passcodeEntryViewController = v11->_passcodeEntryViewController;
    v11->_passcodeEntryViewController = v20;

    -[TVDigitEntryViewController setNumberOfDigits:](v11->_passcodeEntryViewController, "setNumberOfDigits:", 4LL);
    -[TVDigitEntryViewController setSecureDigitEntry:](v11->_passcodeEntryViewController, "setSecureDigitEntry:", 1LL);
    -[TVDigitEntryViewController setTitleText:](v11->_passcodeEntryViewController, "setTitleText:", v16);
    -[TVDigitEntryViewController setPromptText:](v11->_passcodeEntryViewController, "setPromptText:", v19);
  }

  return v11;
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsSetPasscodeViewController passcodeEntryViewController]( self,  "passcodeEntryViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  return v3;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsSetPasscodeViewController;
  -[TVSettingsRestrictionsSetPasscodeViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsSetPasscodeViewController passcodeEntryViewController]( self,  "passcodeEntryViewController"));
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E6F8C;
  v6[3] = &unk_100191F40;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v3 setEntryCompletionHandler:v6];
  -[TVSettingsRestrictionsSetPasscodeViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsSetPasscodeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 addSubview:v5];

  [v3 didMoveToParentViewController:self];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsSetPasscodeViewController;
  -[TVSettingsRestrictionsSetPasscodeViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsSetPasscodeViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsSetPasscodeViewController passcodeEntryViewController]( self,  "passcodeEntryViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)_userDidCancel
{
}

- (void)_promptForConfirmationOfPasscode:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsSetPasscodeViewController passcodeEntryViewController]( self,  "passcodeEntryViewController"));
  uint64_t v4 = TSKLocString(@"RestrictionsPasscodeSetConfirmTitle");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v8 setTitleText:v5];

  uint64_t v6 = TSKLocString(@"RestrictionsPasscodeSetConfirmPrompt");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v8 setPromptText:v7];

  [v8 clearEntryAnimated:0];
}

- (void)_verifyPasscode:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsSetPasscodeViewController passcodeToConfirm](self, "passcodeToConfirm"));
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = TSKLocString(@"RestrictionsPasscodeSetConfirmedTitle");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = TSKLocString(@"RestrictionsPasscodeSetConfirmedPrompt");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v10,  1LL));

    uint64_t v12 = TSKLocString(@"SettingsOK");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000E7390;
    v20[3] = &unk_10018F4C0;
    objc_copyWeak(&v22, &location);
    id v21 = v4;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  v20));

    [v11 addAction:v14];
    -[TVSettingsRestrictionsSetPasscodeViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVSettingsRestrictionsSetPasscodeViewController setPasscodeToConfirm:](self, "setPasscodeToConfirm:", 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsSetPasscodeViewController passcodeEntryViewController]( self,  "passcodeEntryViewController"));
    uint64_t v16 = TSKLocString(@"RestrictionsPasscodeSetMismatchTitle");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v15 setTitleText:v17];

    uint64_t v18 = TSKLocString(@"RestrictionsPasscodeSetMismatchPrompt");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v15 setPromptText:v19];

    [v15 clearEntryAnimated:1];
  }
}

- (void)_callCompletionHandlerWithPasscode:(id)a3
{
  id v6 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsSetPasscodeViewController completion](self, "completion"));
  double v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (TVDigitEntryViewController)passcodeEntryViewController
{
  return self->_passcodeEntryViewController;
}

- (void)setPasscodeEntryViewController:(id)a3
{
}

- (NSString)passcodeToConfirm
{
  return self->_passcodeToConfirm;
}

- (void)setPasscodeToConfirm:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end