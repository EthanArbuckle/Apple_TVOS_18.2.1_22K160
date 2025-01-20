@interface IMPopoverAction
- (void)dealloc;
- (void)dismissPopover;
- (void)showViewController:(id)a3 inPopoverFromButton:(id)a4;
- (void)updatePopover;
@end

@implementation IMPopoverAction

- (void)showViewController:(id)a3 inPopoverFromButton:(id)a4
{
  v6 = (UIViewController *)a3;
  -[IMPopoverPresentationAction setPresentingButton:](self, "setPresentingButton:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v7 delegate]);

  -[UIViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 7LL);
  [v11 presentViewController:v6 animated:1 completion:0];
  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  self->_viewControllerPresentedInPopover = v6;
  v9 = v6;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](v9, "popoverPresentationController"));
  [v10 setPermittedArrowDirections:3];
  [v10 setDelegate:self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IMPopoverAction;
  -[IMPopoverAction dealloc](&v3, "dealloc");
}

- (void)dismissPopover
{
  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  if (viewControllerPresentedInPopover)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100033174;
    block[3] = &unk_10023FF98;
    v7 = viewControllerPresentedInPopover;
    v4 = v7;
    dispatch_async(&_dispatch_main_q, block);
    v5 = self->_viewControllerPresentedInPopover;
    self->_viewControllerPresentedInPopover = 0LL;
  }

- (void)updatePopover
{
  objc_super v3 = self->_viewControllerPresentedInPopover;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 traitCollection]);
    id v8 = [v7 horizontalSizeClass];

    if (v8 != (id)1)
    {
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100033360;
      v13[3] = &unk_1002412B0;
      id v12 = v10;
      id v14 = v12;
      v15 = v3;
      objc_copyWeak(&v16, &location);
      [v11 dismissViewControllerAnimated:0 completion:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void).cxx_destruct
{
}

@end