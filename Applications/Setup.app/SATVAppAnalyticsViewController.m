@interface SATVAppAnalyticsViewController
- (OBPrivacyLinkController)privacyLink;
- (SATVAppAnalyticsViewController)init;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonViewForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_enableAppAnalytics:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVAppAnalyticsViewController

- (SATVAppAnalyticsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVAppAnalyticsViewController;
  v2 = -[SATVAppAnalyticsViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  OBPrivacyAnalyticsAppIdentifier));
    privacyLink = v2->_privacyLink;
    v2->_privacyLink = (OBPrivacyLinkController *)v3;
  }

  return v2;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVAppAnalyticsViewController;
  -[SATVAppAnalyticsViewController viewDidLoad](&v6, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVAppAnalyticsViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAppAnalyticsViewController;
  -[SATVAppAnalyticsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVAppAnalyticsViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  3LL,  3LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAppAnalyticsViewController;
  -[SATVAppAnalyticsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVAppAnalyticsViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"APP_ANALYTICS_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"APP_ANALYTICS_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SHARE_WITH_APP_DEVELOPERS", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DONT_SHARE_WITH_APP_DEVELOPERS", @"Localizable");
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User wants to share app analytics", v6, 2u);
  }

  -[SATVAppAnalyticsViewController _enableAppAnalytics:](self, "_enableAppAnalytics:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User does not want to share app analytics", v6, 2u);
  }

  -[SATVAppAnalyticsViewController _enableAppAnalytics:](self, "_enableAppAnalytics:", 0LL);
}

- (void)_enableAppAnalytics:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVAppAnalyticsViewController completionHandler]( self,  "completionHandler"));
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