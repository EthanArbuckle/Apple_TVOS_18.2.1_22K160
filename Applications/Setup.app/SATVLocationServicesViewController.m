@interface SATVLocationServicesViewController
- (OBPrivacyLinkController)privacyLink;
- (SATVLocationServicesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonViewForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_enableLocationServices:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVLocationServicesViewController

- (SATVLocationServicesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVLocationServicesViewController;
  v4 = -[SATVLocationServicesViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  OBPrivacyLocationServicesIdentifier));
    privacyLink = v4->_privacyLink;
    v4->_privacyLink = (OBPrivacyLinkController *)v5;
  }

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVLocationServicesViewController;
  -[SATVLocationServicesViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVLocationServicesViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLocationServicesViewController view](self, "view"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVLocationServicesViewController;
  -[SATVLocationServicesViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVLocationServicesViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  7LL,  7LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVLocationServicesViewController;
  -[SATVLocationServicesViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  if (-[SATVLocationServicesViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController")) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 8LL;
  }
  -[SATVLocationServicesViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  v4);
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"LOCATION_SERVICES_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"LOCATION_SERVICES_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"LOCATION_SERVICES_ENABLE", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"LOCATION_SERVICES_DISABLE", @"Localizable");
}

- (id)footerButtonViewForConsentViewController:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  id v4 = sub_10002AF94();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User wants to enable location services", v6, 2u);
  }

  -[SATVLocationServicesViewController _enableLocationServices:](self, "_enableLocationServices:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10002AF94();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User does not want to enable location services",  v6,  2u);
  }

  -[SATVLocationServicesViewController _enableLocationServices:](self, "_enableLocationServices:", 0LL);
}

- (void)_enableLocationServices:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLocationServicesViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVLocationServicesViewController completionHandler]( self,  "completionHandler"));
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