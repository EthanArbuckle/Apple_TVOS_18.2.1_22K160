@interface SATVDisplayModeRegionViewController
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVDisplayModeRegionViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVDisplayModeRegionViewController;
  -[SATVDisplayModeRegionViewController viewDidLoad](&v12, "viewDidLoad");
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000613BC;
  v9[3] = &unk_1000C9668;
  objc_copyWeak(&v10, &location);
  v3 = objc_retainBlock(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  id v5 = sub_10003ED38();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [[PBSDisplayAssistantPresentationRequest alloc] initWithDestinationDisplayMode:v6 kind:5 source:0];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006141C;
    v8[3] = &unk_1000C9690;
    v8[4] = v3;
    [v4 presentDisplayAssistantWithRequest:v7 dismissHandler:v8];
  }

  else
  {
    ((void (*)(void *, void))v3[2])(v3, 0LL);
  }

  objc_destroyWeak(&v10);
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