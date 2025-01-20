@interface SATVRecognizeMyVoiceContainerViewController
- (NSString)iCloudAltDSID;
- (SATVRecognizeMyVoiceContainerViewController)initWithiCloudAltDSID:(id)a3;
- (id)completionHandler;
- (id)systemLanguageUnsupportedHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setICloudAltDSID:(id)a3;
- (void)setSystemLanguageUnsupportedHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVRecognizeMyVoiceContainerViewController

- (SATVRecognizeMyVoiceContainerViewController)initWithiCloudAltDSID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVRecognizeMyVoiceContainerViewController;
  v5 = -[SATVRecognizeMyVoiceContainerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    iCloudAltDSID = v5->_iCloudAltDSID;
    v5->_iCloudAltDSID = v6;
  }

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVRecognizeMyVoiceContainerViewController;
  -[SATVRecognizeMyVoiceContainerViewController viewDidLoad](&v4, "viewDidLoad");
  id v3 = [[TVSUIRecognizeMyVoiceViewController alloc] initWithiCloudAltDSID:self->_iCloudAltDSID];
  [v3 setCompletionHandler:self->_completionHandler];
  [v3 setSystemLanguageUnsupportedHandler:self->_systemLanguageUnsupportedHandler];
  -[SATVRecognizeMyVoiceContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)systemLanguageUnsupportedHandler
{
  return self->_systemLanguageUnsupportedHandler;
}

- (void)setSystemLanguageUnsupportedHandler:(id)a3
{
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (void)setICloudAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end