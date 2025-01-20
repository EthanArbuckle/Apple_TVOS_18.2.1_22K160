@interface SATVDictationOnlyViewController
- (OBPrivacyLinkController)privacyLink;
- (SATVDictationOnlyViewController)init;
- (id)attributedSubtitleStringForConsentViewController;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonViewForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_completeWithConsentSelection:(BOOL)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyLink:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVDictationOnlyViewController

- (SATVDictationOnlyViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVDictationOnlyViewController;
  v2 = -[SATVDictationOnlyViewController init](&v6, "init");
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
  v4.super_class = (Class)&OBJC_CLASS___SATVDictationOnlyViewController;
  -[SATVDictationOnlyViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVDictationOnlyViewController;
  -[SATVDictationOnlyViewController viewDidLoad](&v6, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVDictationOnlyViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDictationOnlyViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVDictationOnlyViewController;
  -[SATVDictationOnlyViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVDictationOnlyViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  13LL,  12LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVDictationOnlyViewController;
  -[SATVDictationOnlyViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (-[SATVDictationOnlyViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController")) {
    -[SATVDictationOnlyViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
  }
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DICTATION_ONLY_TITLE", @"Localizable");
}

- (id)attributedSubtitleStringForConsentViewController
{
  id v2 = sub_10000D7CC(@"DICTATION_ONLY_SUBTITLE", @"Localizable");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v3, @"mic.fill"));
  v5 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](&OBJC_CLASS___UIFontMetrics, "defaultMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scaledFontForFont:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v8,  2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"mic.fill",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
  v12 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 imageWithTintColor:v11 renderingMode:2]);
  -[NSTextAttachment setImage:](v12, "setImage:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v12));
  id v15 = [v4 rangeOfString:@"mic.fill"];
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v5,  "replaceCharactersInRange:withAttributedString:",  v15,  v16,  v14);

  return v5;
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"USE_DICTATION_OPTION", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"DONT_USE_DICTATION_OPTION", @"Localizable");
}

- (id)footerButtonViewForConsentViewController:(id)a3
{
  return -[OBPrivacyLinkController view](self->_privacyLink, "view", a3);
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  if (os_log_type_enabled(0LL, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, 0LL, OS_LOG_TYPE_DEFAULT, "User wants to use Dictation", v4, 2u);
  }

  -[SATVDictationOnlyViewController _completeWithConsentSelection:](self, "_completeWithConsentSelection:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  if (os_log_type_enabled(0LL, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, 0LL, OS_LOG_TYPE_INFO, "User does not want to use Dictation", v4, 2u);
  }

  -[SATVDictationOnlyViewController _completeWithConsentSelection:](self, "_completeWithConsentSelection:", 0LL);
}

- (void)_completeWithConsentSelection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDictationOnlyViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVDictationOnlyViewController completionHandler]( self,  "completionHandler"));
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