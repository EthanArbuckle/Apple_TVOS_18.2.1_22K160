@interface PBSiriOptInOfferViewController
- (BOOL)offerDictationOnly;
- (PBSiriOptInOfferViewController)initWithOfferDictationOnly:(BOOL)a3;
- (PBSiriOptInOfferViewControllerDelegate)delegate;
- (void)_didNotCompleteOptIn;
- (void)_handleHomeButton:(id)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_optIn;
- (void)_optOut;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBSiriOptInOfferViewController

- (PBSiriOptInOfferViewController)initWithOfferDictationOnly:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSiriOptInOfferViewController;
  result = -[PBSiriOptInOfferViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0LL, 0LL);
  if (result) {
    result->_offerDictationOnly = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___PBSiriOptInOfferViewController;
  -[PBSiriOptInOfferViewController viewDidLoad](&v49, "viewDidLoad");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInOfferViewController view](self, "view"));
  v40 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v40, "setAllowedPressTypes:", &off_1003FE800);
  [v43 addGestureRecognizer:v40];
  v39 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v39, "setAllowedPressTypes:", &off_1003FE818);
  [v43 addGestureRecognizer:v39];
  id v3 = sub_1001C307C(@"SiriTitle", 0LL);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v4 = sub_1001C307C(@"SiriMessage", 0LL);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v5 = sub_1001C307C(@"SiriOptInButton", 0LL);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v6 = sub_1001C307C(@"SiriOptOutButton", 0LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[PBSiriOptInOfferViewController offerDictationOnly](self, "offerDictationOnly"))
  {
    id v7 = sub_1001C307C(@"DictationTitle", 0LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    id v9 = sub_1001C307C(@"DictationMessage", 0LL);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    id v11 = sub_1001C307C(@"DictationOptInButton", 0LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

    id v13 = sub_1001C307C(@"DictationOptOutButton", 0LL);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    v35 = (void *)v14;
    v36 = (void *)v12;
    v37 = (void *)v10;
    v38 = (void *)v8;
  }

  id v42 = objc_alloc_init(&OBJC_CLASS___TVSUIStackedButtonsViewControllerConfiguration);
  [v42 setTitle:v38];
  [v42 setSubtitle:v37];
  [v42 setPrivacyButtonBundleIdentifier:@"com.apple.onboarding.siri"];
  objc_initWeak(&location, self);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100166CCC;
  v46[3] = &unk_1003D22B0;
  objc_copyWeak(&v47, &location);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v46));
  [v34 setTitle:v36];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100166CF8;
  v44[3] = &unk_1003D22B0;
  objc_copyWeak(&v45, &location);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v44));
  [v33 setTitle:v35];
  v51[0] = v34;
  v51[1] = v33;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  [v42 setButtons:v15];

  id v41 = [[TVSUIStackedButtonsViewController alloc] initWithConfiguration:v42];
  v16 = objc_alloc(&OBJC_CLASS___UIImageView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob-siri-orb"));
  v32 = -[UIImageView initWithImage:](v16, "initWithImage:", v17);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v32,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIImageView setContentMode:](v32, "setContentMode:", 4LL);
  [v41 setSupplementaryView:v32];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v41 view]);
  -[PBSiriOptInOfferViewController addChildViewController:](self, "addChildViewController:", v41);
  [v43 addSubview:v18];
  [v41 didMoveToParentViewController:self];
  v31 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v43 leadingAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v30]);
  v50[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v18 trailingAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v43 trailingAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v19]);
  v50[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v18 topAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v43 topAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
  v50[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v18 bottomAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v43 bottomAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
  v50[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 4LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v27);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10028824C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBSiriOptInOfferViewController _didNotCompleteOptIn](self, "_didNotCompleteOptIn");
}

- (void)_handleHomeButton:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1002882C0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBSiriOptInOfferViewController _didNotCompleteOptIn](self, "_didNotCompleteOptIn");
}

- (void)_optIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInOfferViewController delegate](self, "delegate"));
  [v3 siriOptInOfferViewController:self didCompleteOptIn:1];
}

- (void)_optOut
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInOfferViewController delegate](self, "delegate"));
  [v3 siriOptInOfferViewController:self didCompleteOptIn:0];
}

- (void)_didNotCompleteOptIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInOfferViewController delegate](self, "delegate"));
  [v3 siriOptInOfferViewControllerDidNotCompleteOptIn:self];
}

- (BOOL)offerDictationOnly
{
  return self->_offerDictationOnly;
}

- (PBSiriOptInOfferViewControllerDelegate)delegate
{
  return (PBSiriOptInOfferViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end