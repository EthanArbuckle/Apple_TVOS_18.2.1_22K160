@interface _PBSystemUIDismissalTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (UIViewController)parentViewController;
- (UIViewController)viewController;
- (_PBSystemUIDismissalTransaction)initWithViewController:(id)a3 parentViewController:(id)a4 animated:(BOOL)a5 transitionBlock:(id)a6;
- (id)transitionBlock;
- (void)_begin;
@end

@implementation _PBSystemUIDismissalTransaction

- (_PBSystemUIDismissalTransaction)initWithViewController:(id)a3 parentViewController:(id)a4 animated:(BOOL)a5 transitionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____PBSystemUIDismissalTransaction;
  v14 = -[_PBSystemUIDismissalTransaction init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewController, a3);
    objc_storeStrong((id *)&v15->_parentViewController, a4);
    v15->_animated = a5;
    id v16 = [v13 copy];
    id transitionBlock = v15->_transitionBlock;
    v15->_id transitionBlock = v16;
  }

  return v15;
}

- (void)_begin
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBSystemUIDismissalTransaction;
  -[_PBSystemUIDismissalTransaction _begin](&v7, "_begin");
  -[_PBSystemUIDismissalTransaction addMilestone:](self, "addMilestone:", @"Dismissal Animation Finished");
  -[_PBSystemUIDismissalTransaction addMilestone:](self, "addMilestone:", @"ViewController Removed");
  parentViewController = self->_parentViewController;
  viewController = self->_viewController;
  BOOL animated = self->_animated;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006FD54;
  v6[3] = &unk_1003D2CD8;
  v6[4] = self;
  -[UIViewController bs_removeChildViewController:animated:transitionBlock:]( parentViewController,  "bs_removeChildViewController:animated:transitionBlock:",  viewController,  animated,  v6);
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (BOOL)animated
{
  return self->_animated;
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (void).cxx_destruct
{
}

@end