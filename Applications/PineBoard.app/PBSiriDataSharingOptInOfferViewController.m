@interface PBSiriDataSharingOptInOfferViewController
- (PBSiriDataSharingOptInOfferViewControllerDelegate)delegate;
- (void)_didNotCompleteOptIn;
- (void)_handleHomeButton:(id)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_optIn;
- (void)_optOut;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBSiriDataSharingOptInOfferViewController

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PBSiriDataSharingOptInOfferViewController;
  -[PBSiriDataSharingOptInOfferViewController viewDidLoad](&v41, "viewDidLoad");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriDataSharingOptInOfferViewController view](self, "view"));
  v32 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v32, "setAllowedPressTypes:", &off_1003FE608);
  [v35 addGestureRecognizer:v32];
  v31 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v31, "setAllowedPressTypes:", &off_1003FE620);
  [v35 addGestureRecognizer:v31];
  id v34 = objc_alloc_init(&OBJC_CLASS___TVSUIStackedButtonsViewControllerConfiguration);
  id v3 = sub_1001C307C(@"SiriDataSharingOptInTitle", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v34 setTitle:v4];

  id v5 = sub_1001C307C(@"SiriDataSharingOptInText", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v34 setSubtitle:v6];

  [v34 setPrivacyButtonBundleIdentifier:@"com.apple.onboarding.improvesiridictation"];
  objc_initWeak(&location, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100069594;
  v38[3] = &unk_1003D22B0;
  objc_copyWeak(&v39, &location);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v38));
  id v7 = sub_1001C307C(@"SiriDataSharingOptInButtonTitle", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v30 setTitle:v8];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000695C0;
  v36[3] = &unk_1003D22B0;
  objc_copyWeak(&v37, &location);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v36));
  id v9 = sub_1001C307C(@"SiriDataSharingOptOutButtonTitle", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v29 setTitle:v10];

  v43[0] = v30;
  v43[1] = v29;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  [v34 setButtons:v11];

  id v33 = [[TVSUIStackedButtonsViewController alloc] initWithConfiguration:v34];
  v12 = objc_alloc(&OBJC_CLASS___UIImageView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob-siri-orb"));
  v28 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v28,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIImageView setContentMode:](v28, "setContentMode:", 4LL);
  [v33 setSupplementaryView:v28];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v33 view]);
  -[PBSiriDataSharingOptInOfferViewController addChildViewController:](self, "addChildViewController:", v33);
  [v35 addSubview:v14];
  [v33 didMoveToParentViewController:self];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v14 leadingAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v35 leadingAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26]);
  v42[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v14 trailingAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v35 trailingAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v15]);
  v42[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 topAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v35 topAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
  v42[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 bottomAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v35 bottomAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
  v42[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 4LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100275E6C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBSiriDataSharingOptInOfferViewController _didNotCompleteOptIn](self, "_didNotCompleteOptIn");
}

- (void)_handleHomeButton:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100275EE0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBSiriDataSharingOptInOfferViewController _didNotCompleteOptIn](self, "_didNotCompleteOptIn");
}

- (void)_optIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriDataSharingOptInOfferViewController delegate](self, "delegate"));
  [v3 siriDataSharingOptInOfferViewController:self didCompleteOptIn:1];
}

- (void)_optOut
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriDataSharingOptInOfferViewController delegate](self, "delegate"));
  [v3 siriDataSharingOptInOfferViewController:self didCompleteOptIn:0];
}

- (void)_didNotCompleteOptIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriDataSharingOptInOfferViewController delegate](self, "delegate"));
  [v3 siriDataSharingOptInOfferViewControllerDidNotCompleteOptIn:self];
}

- (PBSiriDataSharingOptInOfferViewControllerDelegate)delegate
{
  return (PBSiriDataSharingOptInOfferViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end