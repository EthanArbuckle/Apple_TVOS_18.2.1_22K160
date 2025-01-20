@interface SATVWhatsNewViewController
+ (void)initialize;
- (BOOL)didFetchWhatsNewStatus;
- (BOOL)shouldSkipShowingWhatsNew;
- (UIViewController)whatsNewController;
- (id)completionHandler;
- (void)_beginWhatsNewTask;
- (void)_callCompletionHandler;
- (void)_updateDisplayPostFetchWithStatus:(BOOL)a3 viewController:(id)a4 error:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setDidFetchWhatsNewStatus:(BOOL)a3;
- (void)setWhatsNewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVWhatsNewViewController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVWhatsNewViewController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVWhatsNewViewController");
    v3 = (void *)qword_100109948;
    qword_100109948 = (uint64_t)v2;
  }

- (BOOL)shouldSkipShowingWhatsNew
{
  if (!-[SATVWhatsNewViewController didFetchWhatsNewStatus](self, "didFetchWhatsNewStatus")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewViewController whatsNewController](self, "whatsNewController"));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVWhatsNewViewController;
  -[SATVWhatsNewViewController viewDidLoad](&v3, "viewDidLoad");
  -[SATVWhatsNewViewController _beginWhatsNewTask](self, "_beginWhatsNewTask");
}

- (void)_beginWhatsNewTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004241C;
  v4[3] = &unk_1000CA4C8;
  objc_copyWeak(&v5, &location);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100042490;
  v3[3] = &unk_1000CA4F0;
  v3[4] = self;
  +[TVWNService shouldShowWhatsNewWithOptions:reply:dismissHandler:]( &OBJC_CLASS___TVWNService,  "shouldShowWhatsNewWithOptions:reply:dismissHandler:",  &__NSDictionary0__struct,  v4,  v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateDisplayPostFetchWithStatus:(BOOL)a3 viewController:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SATVWhatsNewViewController setDidFetchWhatsNewStatus:](self, "setDidFetchWhatsNewStatus:", 1LL);
  if (!v6)
  {
    v15 = (os_log_s *)qword_100109948;
    if (os_log_type_enabled((os_log_t)qword_100109948, OS_LOG_TYPE_ERROR)) {
      sub_1000775C8(v15);
    }
    goto LABEL_10;
  }

  v10 = (os_log_s *)qword_100109948;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100109948, OS_LOG_TYPE_ERROR)) {
      sub_100077554((uint64_t)v9, v10);
    }
LABEL_10:
    -[SATVWhatsNewViewController _callCompletionHandler](self, "_callCompletionHandler");
    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)qword_100109948, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing What's New", v16, 2u);
  }

  -[SATVWhatsNewViewController setWhatsNewController:](self, "setWhatsNewController:", v8);
  -[SATVWhatsNewViewController addChildViewController:](self, "addChildViewController:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v11 addSubview:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewViewController view](self, "view"));
  [v14 bounds];
  objc_msgSend(v13, "setFrame:");

  [v8 didMoveToParentViewController:self];
LABEL_11:
}

- (void)_callCompletionHandler
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewViewController completionHandler](self, "completionHandler"));

  if (v3)
  {
    BOOL v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVWhatsNewViewController completionHandler](self, "completionHandler"));
    v4[2]();
  }

- (id)completionHandler
{
  return self->completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIViewController)whatsNewController
{
  return self->_whatsNewController;
}

- (void)setWhatsNewController:(id)a3
{
}

- (BOOL)didFetchWhatsNewStatus
{
  return self->_didFetchWhatsNewStatus;
}

- (void)setDidFetchWhatsNewStatus:(BOOL)a3
{
  self->_didFetchWhatsNewStatus = a3;
}

- (void).cxx_destruct
{
}

@end