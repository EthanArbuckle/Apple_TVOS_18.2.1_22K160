@interface SATVSiriDiagnosticsViewController
- (OBPrivacyLinkController)privacyLink;
- (SATVSiriDiagnosticsViewController)init;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonTextForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_enableSiriDiagnostics:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)consentViewControllerDidSelectFooter:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVSiriDiagnosticsViewController

- (SATVSiriDiagnosticsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVSiriDiagnosticsViewController;
  v2 = -[SATVSiriDiagnosticsViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  OBPrivacyImproveSiriIdentifier));
    privacyLink = v2->_privacyLink;
    v2->_privacyLink = (OBPrivacyLinkController *)v3;
  }

  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriDiagnosticsViewController;
  -[SATVSiriDiagnosticsViewController viewDidLoad](&v4, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVConsentViewController setUseStackedConsentButtonLayout:](v3, "setUseStackedConsentButtonLayout:", 1LL);
  -[SATVSiriDiagnosticsViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriDiagnosticsViewController;
  -[SATVSiriDiagnosticsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVSiriDiagnosticsViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  13LL,  12LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriDiagnosticsViewController;
  -[SATVSiriDiagnosticsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if ((-[SATVSiriDiagnosticsViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController") & 1) == 0) {
    -[SATVSiriDiagnosticsViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
  }
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_OPTIN_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_OPTIN_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_OPTIN_ALLOW", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_OPTIN_NOTALLOW", @"Localizable");
}

- (id)footerButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_OPTIN_ABOUT", @"Localizable");
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
}

- (void)consentViewControllerDidSelectFooter:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___OBPrivacySplashController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController flow](self->_privacyLink, "flow"));
  id v7 = [v4 initWithFlow:v5];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsViewController navigationController](self, "navigationController"));
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)_enableSiriDiagnostics:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVSiriDiagnosticsViewController completionHandler]( self,  "completionHandler"));
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