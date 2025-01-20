@interface SATVDisplayAssistantViewController
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVDisplayAssistantViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVDisplayAssistantViewController;
  -[SATVDisplayAssistantViewController viewDidLoad](&v10, "viewDidLoad");
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000D9DC;
  v7[3] = &unk_1000C9668;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayAssistantPresentationRequest upgradeAttemptRequestFromSource:]( &OBJC_CLASS___PBSDisplayAssistantPresentationRequest,  "upgradeAttemptRequestFromSource:",  0LL));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000DAE4;
    v6[3] = &unk_1000C9690;
    v6[4] = v3;
    [v5 presentDisplayAssistantWithRequest:v4 dismissHandler:v6];
  }

  else
  {
    ((void (*)(void *, void))v3[2])(v3, 0LL);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end