@interface PBOpaqueAlertController
- (PBOpaqueAlertController)initWithTitle:(id)a3 text:(id)a4 footers:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation PBOpaqueAlertController

- (PBOpaqueAlertController)initWithTitle:(id)a3 text:(id)a4 footers:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBOpaqueAlertController;
  v5 = -[PBOpaqueAlertController initWithTitle:text:footers:](&v8, "initWithTitle:text:footers:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PBOpaqueAlertController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
    -[PBOpaqueAlertController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6);
  }

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = -[_PBOpaqueAlertPresentationController initWithPresentedViewController:presentingViewController:]( objc_alloc(&OBJC_CLASS____PBOpaqueAlertPresentationController),  "initWithPresentedViewController:presentingViewController:",  v7,  v6);

  return v8;
}

@end