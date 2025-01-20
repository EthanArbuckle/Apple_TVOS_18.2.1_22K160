@interface SRViewController
- (id)preferredFocusEnvironments;
- (void)_cleanupAllViews;
- (void)didBecomeActiveHandler;
- (void)setUpViews;
- (void)tearDownViews;
- (void)viewDidLoad;
- (void)willEnterForegroundHandler;
- (void)willResignActiveHandler;
@end

@implementation SRViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SRViewController;
  -[SRViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v3 setBackgroundColor:v4];
}

- (id)preferredFocusEnvironments
{
  if (self->_siriVC)
  {
    siriVC = self->_siriVC;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &siriVC, 1LL));
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___SRViewController;
    id v3 = -[SRViewController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return v2;
}

- (void)setUpViews
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100046178;
  v3[3] = &unk_1000BA730;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  SiriUIInvokeOnMainQueue(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_cleanupAllViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000464DC;
  v2[3] = &unk_1000B9F38;
  objc_copyWeak(&v3, &location);
  SiriUIInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)tearDownViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000467BC;
  v2[3] = &unk_1000B9F38;
  objc_copyWeak(&v3, &location);
  SiriUIInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)didBecomeActiveHandler
{
}

- (void)willResignActiveHandler
{
}

- (void)willEnterForegroundHandler
{
}

- (void).cxx_destruct
{
}

@end