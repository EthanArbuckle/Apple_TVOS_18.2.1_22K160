@interface PBContentPresentingContainmentViewController
- (BOOL)acceptsEventFocus;
- (BOOL)allowsInteraction;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBContentPresentingContainmentViewController)initWithChildViewController:(id)a3 allowsInteraction:(BOOL)a4 expectsEventForwarding:(BOOL)a5;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (UIViewController)childViewController;
- (id)preferredFocusEnvironments;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
@end

@implementation PBContentPresentingContainmentViewController

- (PBContentPresentingContainmentViewController)initWithChildViewController:(id)a3 allowsInteraction:(BOOL)a4 expectsEventForwarding:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBContentPresentingContainmentViewController;
  v10 = -[PBContentPresentingContainmentViewController init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_childViewController, a3);
    v11->_allowsInteraction = a4;
    v11->_expectsEventForwarding = a5;
  }

  return v11;
}

- (BOOL)expectsEventForwarding
{
  return self->_expectsEventForwarding;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  if (self->_childViewController)
  {
    childViewController = self->_childViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &childViewController,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  v6 = (void (**)(void))a5;
  id v7 = -[PBContentPresentingContainmentViewController view](self, "view");
  -[PBContentPresentingContainmentViewController addChildViewController:]( self,  "addChildViewController:",  self->_childViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childViewController, "view"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBContentPresentingContainmentViewController view](self, "view"));
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBContentPresentingContainmentViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childViewController, "view"));
  [v10 addSubview:v11];

  -[UIViewController didMoveToParentViewController:](self->_childViewController, "didMoveToParentViewController:", self);
  -[PBContentPresentingContainmentViewController setAcceptsEventFocus:]( self,  "setAcceptsEventFocus:",  self->_allowsInteraction);
  if (v6) {
    v6[2](v6);
  }
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  v6 = (void (**)(void))a5;
  id v7 = -[PBContentPresentingContainmentViewController view](self, "view");
  -[PBContentPresentingContainmentViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
  -[PBContentPresentingContainmentViewController willMoveToParentViewController:]( self,  "willMoveToParentViewController:",  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childViewController, "view"));
  [v8 removeFromSuperview];

  -[UIViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  if (v6) {
    v6[2](v6);
  }
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

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (BOOL)allowsInteraction
{
  return self->_allowsInteraction;
}

- (void).cxx_destruct
{
}

@end