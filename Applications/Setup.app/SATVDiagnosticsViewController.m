@interface SATVDiagnosticsViewController
- (OBPrivacyLinkController)privacyLink;
- (SATVDiagnosticsViewController)init;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonViewForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_enableDiagnostics:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVDiagnosticsViewController

- (SATVDiagnosticsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVDiagnosticsViewController;
  v2 = -[SATVDiagnosticsViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  OBPrivacyAnalyticsDeviceIdentifier));
    privacyLink = v2->_privacyLink;
    v2->_privacyLink = (OBPrivacyLinkController *)v3;
  }

  return v2;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVDiagnosticsViewController;
  -[SATVDiagnosticsViewController viewDidLoad](&v6, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVDiagnosticsViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVDiagnosticsViewController;
  -[SATVDiagnosticsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVDiagnosticsViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  3LL,  3LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVDiagnosticsViewController;
  -[SATVDiagnosticsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVDiagnosticsViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DIAGNOSTICS_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DIAGNOSTICS_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SHARE_WITH_APPLE", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DONT_SHARE_WITH_APPLE", @"Localizable");
}

- (id)footerButtonViewForConsentViewController:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User wants to share diagnostics", v6, 2u);
  }

  -[SATVDiagnosticsViewController _enableDiagnostics:](self, "_enableDiagnostics:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User does not want to share diagnostics", v6, 2u);
  }

  -[SATVDiagnosticsViewController _enableDiagnostics:](self, "_enableDiagnostics:", 0LL);
}

- (void)_enableDiagnostics:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVDiagnosticsViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, v3);
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
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