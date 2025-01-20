@interface MCTVInstallProfileWarningsViewController
- (DMCProfileViewModel)profileViewModel;
- (MCTVInstallProfileWarningsViewController)initWithProfileViewModel:(id)a3 warnings:(id)a4;
- (MCTVInstallProfileWarningsViewControllerDelegate)delegate;
- (NSArray)warnings;
- (UIViewController)currentChildViewController;
- (id)_confirmationViewController;
- (id)_consentViewController;
- (id)_otherWarningsViewController;
- (id)preferredFocusEnvironments;
- (unint64_t)currentWarningState;
- (void)_completeWithResult:(BOOL)a3;
- (void)_showNextWarning:(BOOL)a3;
- (void)_updateWithNextViewController:(id)a3 animated:(BOOL)a4;
- (void)setCurrentChildViewController:(id)a3;
- (void)setCurrentWarningState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCTVInstallProfileWarningsViewController

- (MCTVInstallProfileWarningsViewController)initWithProfileViewModel:(id)a3 warnings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileWarningsViewController;
  v9 = -[MCTVInstallProfileWarningsViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profileViewModel, a3);
    v11 = (NSArray *)[v8 copy];
    warnings = v10->_warnings;
    v10->_warnings = v11;

    v10->_currentWarningState = 0LL;
    -[MCTVInstallProfileWarningsViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 8LL);
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileWarningsViewController;
  -[MCTVInstallProfileWarningsViewController viewDidLoad](&v3, "viewDidLoad");
  -[MCTVInstallProfileWarningsViewController _showNextWarning:](self, "_showNextWarning:", 0LL);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileWarningsViewController currentChildViewController]( self,  "currentChildViewController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  return v3;
}

- (void)_completeWithResult:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_9FD4;
  v3[3] = &unk_28940;
  v3[4] = self;
  BOOL v4 = a3;
  -[MCTVInstallProfileWarningsViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v3);
}

- (void)_showNextWarning:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t currentWarningState = self->_currentWarningState;
  switch(currentWarningState)
  {
    case 2uLL:
      goto LABEL_8;
    case 1uLL:
LABEL_6:
      if (-[NSArray count](self->_warnings, "count"))
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileWarningsViewController _otherWarningsViewController]( self,  "_otherWarningsViewController"));
        -[MCTVInstallProfileWarningsViewController _updateWithNextViewController:animated:]( self,  "_updateWithNextViewController:animated:",  v10,  v3);
        unint64_t v9 = 2LL;
        goto LABEL_9;
      }

- (id)_consentViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController profileViewModel](self, "profileViewModel"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 organization]);
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v4 friendlyName]);
  }
  id v8 = v7;

  id v9 = MCUILocalizedString(@"INSTALL_CONSENT_MESSAGE_FROM_%@");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v8));

  id v12 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedConsentText]);
  id v14 = [v12 initWithTitle:v11 text:v13];

  [v14 setShouldDismissAutomatically:0];
  objc_initWeak(&location, self);
  if (-[NSArray count](self->_warnings, "count")) {
    v15 = @"INSTALL";
  }
  else {
    v15 = @"NEXT";
  }
  id v16 = MCUILocalizedString(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_A3F4;
  v25[3] = &unk_28610;
  objc_copyWeak(&v26, &location);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v17,  0LL,  v25));
  [v14 addButton:v18];

  id v19 = MCUILocalizedString(@"CANCEL");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_A428;
  v23[3] = &unk_28610;
  objc_copyWeak(&v24, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v20,  2LL,  v23));
  [v14 addButton:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
  return v14;
}

- (id)_otherWarningsViewController
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  warnings = self->_warnings;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_A6AC;
  v23[3] = &unk_28968;
  v5 = v3;
  id v24 = v5;
  v25 = self;
  -[NSArray enumerateObjectsUsingBlock:](warnings, "enumerateObjectsUsingBlock:", v23);
  id v6 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v7 = MCUILocalizedString(@"INSTALL_WARNING_TITLE");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[NSMutableString copy](v5, "copy");
  id v10 = [v6 initWithTitle:v8 text:v9];

  [v10 setShouldDismissAutomatically:0];
  objc_initWeak(&location, self);
  id v11 = MCUILocalizedString(@"INSTALL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_A77C;
  v20[3] = &unk_28610;
  objc_copyWeak(&v21, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v12,  0LL,  v20));
  [v10 addButton:v13];

  id v14 = MCUILocalizedString(@"CANCEL");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_A7B0;
  v18[3] = &unk_28610;
  objc_copyWeak(&v19, &location);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v15,  2LL,  v18));
  [v10 addButton:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v10;
}

- (id)_confirmationViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController profileViewModel](self, "profileViewModel"));
  id v4 = [v3 finalInstallationWarningStyle];

  if ((((unint64_t)v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController profileViewModel](self, "profileViewModel"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);

    id v7 = MCUILocalizedString(@"BLOB_INSTALL_TITLE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ([v6 isLocked])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 removalPasscode]);
      if (v9) {
        id v10 = @"BLOB_INSTALL_NOT_REMOVABLE_AUTH";
      }
      else {
        id v10 = @"BLOB_INSTALL_NOT_REMOVABLE";
      }
      id v11 = MCUILocalizedString(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    else
    {
      id v12 = 0LL;
    }

    id v18 = MCUILocalizedString(@"INSTALL");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    else {
      unsigned int v17 = 1;
    }
  }

  else
  {
    id v13 = MCUILocalizedString(@"BLOB_MDM_ENROLL_TITLE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_WARNING");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v15 = MCUILocalizedString(@"TRUST");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    unsigned int v17 = 0;
  }

  id v19 = [[TVSUITextAlertController alloc] initWithTitle:v8 text:v12];
  [v19 setShouldDismissAutomatically:0];
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_AAC4;
  v27[3] = &unk_28610;
  objc_copyWeak(&v28, &location);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v16,  v17,  v27));
  [v19 addButton:v20];

  id v21 = MCUILocalizedString(@"CANCEL");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_AAF8;
  v25[3] = &unk_28610;
  objc_copyWeak(&v26, &location);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v22,  2LL,  v25));
  [v19 addButton:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v19;
}

- (void)_updateWithNextViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    -[MCTVInstallProfileWarningsViewController addChildViewController:](self, "addChildViewController:", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController view](self, "view"));
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v9 setHidden:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController view](self, "view"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v10 addSubview:v11];

    [v6 didMoveToParentViewController:self];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileWarningsViewController currentChildViewController]( self,  "currentChildViewController"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController view](self, "view"));
  if (v4) {
    double v14 = 0.5;
  }
  else {
    double v14 = 0.0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_AD0C;
  v23[3] = &unk_28880;
  id v24 = v6;
  id v25 = v12;
  unsigned int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_AD68;
  v20 = &unk_28990;
  id v21 = v25;
  v22 = self;
  id v15 = v25;
  id v16 = v6;
  +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v13,  5243136LL,  v23,  &v17,  v14);

  -[MCTVInstallProfileWarningsViewController setCurrentChildViewController:]( self,  "setCurrentChildViewController:",  v16,  v17,  v18,  v19,  v20);
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (MCTVInstallProfileWarningsViewControllerDelegate)delegate
{
  return (MCTVInstallProfileWarningsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)currentWarningState
{
  return self->_currentWarningState;
}

- (void)setCurrentWarningState:(unint64_t)a3
{
  self->_unint64_t currentWarningState = a3;
}

- (UIViewController)currentChildViewController
{
  return self->_currentChildViewController;
}

- (void)setCurrentChildViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end