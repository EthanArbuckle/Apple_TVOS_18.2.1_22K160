@interface PBAirPlayContentPresentingViewController
+ (double)_transitionDuration;
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBAirPlayContentPresentingViewController)initWithChildViewController:(id)a3;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (UIViewController)childViewController;
- (void)_transitionWithAnimations:(id)a3 completion:(id)a4;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
@end

@implementation PBAirPlayContentPresentingViewController

- (PBAirPlayContentPresentingViewController)initWithChildViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAirPlayContentPresentingViewController;
  v6 = -[PBAirPlayContentPresentingViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_childViewController, a3);
  }

  return v7;
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  -[PBAirPlayContentPresentingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PBAirPlayContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 1LL);
  childViewController = self->_childViewController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000288F4;
  v10[3] = &unk_1003D11B0;
  v10[4] = self;
  id v11 = v7;
  BOOL v12 = v5;
  id v9 = v7;
  -[PBAirPlayContentPresentingViewController bs_addChildViewController:animated:transitionBlock:]( self,  "bs_addChildViewController:animated:transitionBlock:",  childViewController,  v5,  v10);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  -[PBAirPlayContentPresentingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PBAirPlayContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
  childViewController = self->_childViewController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100028B70;
  v10[3] = &unk_1003D11D8;
  BOOL v12 = v5;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  -[PBAirPlayContentPresentingViewController bs_removeChildViewController:animated:transitionBlock:]( self,  "bs_removeChildViewController:animated:transitionBlock:",  childViewController,  v5,  v10);
}

+ (double)_transitionDuration
{
  return result;
}

- (void)_transitionWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class(self) _transitionDuration];
  double v9 = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100028DE0;
  v11[3] = &unk_1003CFF30;
  id v12 = v6;
  id v10 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v11,  v9);
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

- (void).cxx_destruct
{
}

@end