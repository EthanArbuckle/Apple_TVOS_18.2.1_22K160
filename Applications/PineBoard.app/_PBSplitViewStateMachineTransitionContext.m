@interface _PBSplitViewStateMachineTransitionContext
+ (id)contextWithAnimated:(BOOL)a3 completion:(id)a4 application:(id)a5;
- (BOOL)animated;
- (PBApplication)application;
- (UIViewController)viewController;
- (void)setViewController:(id)a3;
- (void)signalCompletion;
@end

@implementation _PBSplitViewStateMachineTransitionContext

+ (id)contextWithAnimated:(BOOL)a3 completion:(id)a4 application:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = sub_100182FF0(objc_alloc((Class)a1), a3, v9, v8);

  return v10;
}

- (void)signalCompletion
{
}

- (BOOL)animated
{
  return self->_animated;
}

- (PBApplication)application
{
  return self->_application;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end