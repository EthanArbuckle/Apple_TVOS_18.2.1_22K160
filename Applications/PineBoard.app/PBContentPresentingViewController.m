@interface PBContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (BOOL)definesPresentationContext;
- (BOOL)dismissalTriggeredBySystem;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBContentPresentingViewController)initWithContentViewController:(id)a3 supportsInterruption:(BOOL)a4;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (UIViewController)contentViewController;
- (void)_didDismiss:(id)a3;
- (void)_willDismiss:(id)a3;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
@end

@implementation PBContentPresentingViewController

- (PBContentPresentingViewController)initWithContentViewController:(id)a3 supportsInterruption:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBContentPresentingViewController;
  v8 = -[PBContentPresentingViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    p_contentViewController = &v8->_contentViewController;
    objc_storeStrong((id *)&v8->_contentViewController, a3);
    v9->_interruptible = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v9 selector:"_willDismiss:" name:UIPresentationControllerDismissalTransitionWillBeginNotification object:*p_contentViewController];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v9 selector:"_didDismiss:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:*p_contentViewController];
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIPresentationControllerDismissalTransitionWillBeginNotification object:self->_contentViewController];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:UIPresentationControllerDismissalTransitionDidEndNotification object:self->_contentViewController];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBContentPresentingViewController;
  -[PBContentPresentingViewController dealloc](&v5, "dealloc");
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v8 = -[PBContentPresentingViewController view](self, "view");
  UIModalPresentationStyle v9 = -[UIViewController modalPresentationStyle](self->_contentViewController, "modalPresentationStyle");
  if (v9 == UIModalPresentationCurrentContext || v9 == UIModalPresentationFullScreen)
  {
    id v11 = sub_100084158();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10027A304((uint64_t *)&self->_contentViewController, v12);
    }
  }

  -[PBContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 1LL);
  contentViewController = self->_contentViewController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100136D78;
  v15[3] = &unk_1003D0110;
  id v16 = v7;
  id v14 = v7;
  -[PBContentPresentingViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  contentViewController,  v5,  v15);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[PBContentPresentingViewController view](self, "view");
  self->_dismissalTriggeredBySystem = 1;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100136EA8;
  v12[3] = &unk_1003D0300;
  objc_copyWeak(&v14, &location);
  id v11 = v9;
  id v13 = v11;
  -[PBContentPresentingViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  v6,  v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_willDismiss:(id)a3
{
  if (!self->_dismissalTriggeredBySystem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBContentPresentingViewController contentDelegate](self, "contentDelegate", a3));
    [v4 contentPresenting:self willDismissContentWithResult:0 error:0];
  }

- (void)_didDismiss:(id)a3
{
  if (!self->_dismissalTriggeredBySystem)
  {
    -[PBContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBContentPresentingViewController contentDelegate](self, "contentDelegate"));
    [v4 contentPresentingDidDismissContent:self];
  }

- (BOOL)isInterruptible
{
  return self->_interruptible;
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return (PBSystemOverlayContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)setContentDelegate:(id)a3
{
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)dismissalTriggeredBySystem
{
  return self->_dismissalTriggeredBySystem;
}

- (void).cxx_destruct
{
}

@end