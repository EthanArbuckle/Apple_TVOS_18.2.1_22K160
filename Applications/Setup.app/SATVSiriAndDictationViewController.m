@interface SATVSiriAndDictationViewController
+ (void)initialize;
- (OBPrivacyLinkController)privacyLink;
- (SATVSiriAndDictationViewController)init;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonViewForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_enableSiriAndDictation:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVSiriAndDictationViewController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationViewController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVSiriAndDictationViewController");
    v3 = (void *)qword_1001097D0;
    qword_1001097D0 = (uint64_t)v2;
  }

- (SATVSiriAndDictationViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVSiriAndDictationViewController;
  os_log_t v2 = -[SATVSiriAndDictationViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  OBPrivacyAskSiriIdentifier));
    privacyLink = v2->_privacyLink;
    v2->_privacyLink = (OBPrivacyLinkController *)v3;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriAndDictationViewController;
  -[SATVSiriAndDictationViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVSiriAndDictationViewController;
  -[SATVSiriAndDictationViewController viewDidLoad](&v6, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVSiriAndDictationViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriAndDictationViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriAndDictationViewController;
  -[SATVSiriAndDictationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVSiriAndDictationViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  13LL,  12LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVSiriAndDictationViewController;
  -[SATVSiriAndDictationViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (-[SATVSiriAndDictationViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController")) {
    -[SATVSiriAndDictationViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
  }
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"SIRI_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"USE_SIRI_OPTION", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DONT_USE_SIRI_OPTION", @"Localizable");
}

- (id)footerButtonViewForConsentViewController:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  objc_super v4 = (os_log_s *)qword_1001097D0;
  if (os_log_type_enabled((os_log_t)qword_1001097D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User wants to use Siri and Dictation", v5, 2u);
  }

  -[SATVSiriAndDictationViewController _enableSiriAndDictation:](self, "_enableSiriAndDictation:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  objc_super v4 = (os_log_s *)qword_1001097D0;
  if (os_log_type_enabled((os_log_t)qword_1001097D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "User does not want to use Siri and Dictation",  v5,  2u);
  }

  -[SATVSiriAndDictationViewController _enableSiriAndDictation:](self, "_enableSiriAndDictation:", 0LL);
}

- (void)_enableSiriAndDictation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriAndDictationViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVSiriAndDictationViewController completionHandler]( self,  "completionHandler"));
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