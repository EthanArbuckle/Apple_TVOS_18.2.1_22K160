@interface PBViewServiceContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (BOOL)allowsInteraction;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBSimpleRemoteViewController)remoteViewController;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (PBViewServiceContentPresentingViewController)initWithRemoteViewController:(id)a3 supportsInterruption:(BOOL)a4;
- (PBViewServiceContentPresentingViewController)initWithRemoteViewController:(id)a3 supportsInterruption:(BOOL)a4 allowsInteraction:(BOOL)a5;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewService:(id)a3 willDismissWithResult:(id)a4;
- (void)viewServiceDidDismiss:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PBViewServiceContentPresentingViewController

- (PBViewServiceContentPresentingViewController)initWithRemoteViewController:(id)a3 supportsInterruption:(BOOL)a4
{
  return -[PBViewServiceContentPresentingViewController initWithRemoteViewController:supportsInterruption:allowsInteraction:]( self,  "initWithRemoteViewController:supportsInterruption:allowsInteraction:",  a3,  a4,  1LL);
}

- (PBViewServiceContentPresentingViewController)initWithRemoteViewController:(id)a3 supportsInterruption:(BOOL)a4 allowsInteraction:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBViewServiceContentPresentingViewController;
  v10 = -[PBViewServiceContentPresentingViewController initWithNibName:bundle:]( &v13,  "initWithNibName:bundle:",  0LL,  0LL);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_remoteViewController, a3);
    -[PBSimpleRemoteViewController setDelegate:](v11->_remoteViewController, "setDelegate:", v11);
    v11->_allowsInteraction = a5;
    v11->_interruptible = a4;
  }

  return v11;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBViewServiceContentPresentingViewController;
  -[PBViewServiceContentPresentingViewController viewDidLoad](&v7, "viewDidLoad");
  -[PBViewServiceContentPresentingViewController addChildViewController:]( self,  "addChildViewController:",  self->_remoteViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController view](self->_remoteViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBViewServiceContentPresentingViewController view](self, "view"));
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBViewServiceContentPresentingViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController view](self->_remoteViewController, "view"));
  [v5 addSubview:v6];

  -[PBSimpleRemoteViewController didMoveToParentViewController:]( self->_remoteViewController,  "didMoveToParentViewController:",  self);
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = -[PBViewServiceContentPresentingViewController view](self, "view");
  -[PBViewServiceContentPresentingViewController setAcceptsEventFocus:]( self,  "setAcceptsEventFocus:",  self->_allowsInteraction);
  remoteViewController = self->_remoteViewController;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011E720;
  v13[3] = &unk_1003D0048;
  id v14 = v8;
  id v12 = v8;
  -[PBSimpleRemoteViewController prepareViewServiceAnimated:withOptions:completion:]( remoteViewController,  "prepareViewServiceAnimated:withOptions:completion:",  v6,  v9,  v13);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[PBViewServiceContentPresentingViewController view](self, "view");
  objc_initWeak(&location, self);
  remoteViewController = self->_remoteViewController;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011E850;
  v13[3] = &unk_1003D8410;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  -[PBSimpleRemoteViewController dismissViewServiceAnimated:withOptions:completion:]( remoteViewController,  "dismissViewServiceAnimated:withOptions:completion:",  v6,  v8,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewService:(id)a3 willDismissWithResult:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBViewServiceContentPresentingViewController contentDelegate](self, "contentDelegate"));
  [v6 contentPresenting:self willDismissContentWithResult:v5 error:0];
}

- (void)viewServiceDidDismiss:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBViewServiceContentPresentingViewController contentDelegate](self, "contentDelegate", a3));
  [v4 contentPresentingDidDismissContent:self];

  -[PBSimpleRemoteViewController willMoveToParentViewController:]( self->_remoteViewController,  "willMoveToParentViewController:",  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController view](self->_remoteViewController, "view"));
  [v5 removeFromSuperview];

  -[PBSimpleRemoteViewController removeFromParentViewController]( self->_remoteViewController,  "removeFromParentViewController");
  -[PBSimpleRemoteViewController didMoveToParentViewController:]( self->_remoteViewController,  "didMoveToParentViewController:",  0LL);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0LL;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBViewServiceContentPresentingViewController contentDelegate](self, "contentDelegate"));
  [v5 contentPresenting:self willDismissContentWithResult:0 error:v4];

  [v5 contentPresentingDidDismissContent:self];
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

- (PBSimpleRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (BOOL)allowsInteraction
{
  return self->_allowsInteraction;
}

- (void).cxx_destruct
{
}

@end