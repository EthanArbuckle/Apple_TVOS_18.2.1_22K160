@interface SATVPrivacyViewController
- (OBPrivacyFlow)privacyFlow;
- (SATVPrivacyViewController)initWithPrivacyBundleIdentifier:(id)a3;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonTextForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_acknowledge;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectFooter:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVPrivacyViewController

- (SATVPrivacyViewController)initWithPrivacyBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewController;
  v5 = -[SATVPrivacyViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  v4));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 flow]);
    privacyFlow = v5->_privacyFlow;
    v5->_privacyFlow = (OBPrivacyFlow *)v7;
  }

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewController;
  -[SATVPrivacyViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = -[SATVConsentViewController initWithChoiceViewStyle:]( objc_alloc(&OBJC_CLASS___SATVConsentViewController),  "initWithChoiceViewStyle:",  1LL);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVPrivacyViewController addChildViewController:](self, "addChildViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPrivacyViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewController;
  -[SATVPrivacyViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVPrivacyViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  5LL,  5LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewController;
  -[SATVPrivacyViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVPrivacyViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (id)titleTextForConsentViewController:(id)a3
{
  return -[OBPrivacyFlow localizedTitle](self->_privacyFlow, "localizedTitle", a3);
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"PRIVACY_DESCRIPTION", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"CONTINUE_BUTTON", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return 0LL;
}

- (id)footerButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"PRIVACY_LEARN_MORE", @"Localizable");
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
}

- (void)consentViewControllerDidSelectFooter:(id)a3
{
  id v5 = [[OBPrivacySplashController alloc] initWithFlow:self->_privacyFlow];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPrivacyViewController navigationController](self, "navigationController"));
  [v4 presentViewController:v5 animated:1 completion:0];
}

- (void)_acknowledge
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPrivacyViewController completionHandler](self, "completionHandler"));

  if (v3)
  {
    objc_super v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVPrivacyViewController completionHandler](self, "completionHandler"));
    v4[2]();
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OBPrivacyFlow)privacyFlow
{
  return self->_privacyFlow;
}

- (void).cxx_destruct
{
}

@end