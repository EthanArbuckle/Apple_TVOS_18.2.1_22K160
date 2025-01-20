@interface TVMAddToPlaylistPresentationController
- (BOOL)shouldRemovePresentersView;
- (UIView)dimmingView;
- (void)containerViewDidLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
@end

@implementation TVMAddToPlaylistPresentationController

- (void)presentationTransitionWillBegin
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMAddToPlaylistPresentationController;
  -[TVMAddToPlaylistPresentationController presentationTransitionWillBegin](&v13, "presentationTransitionWillBegin");
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController containerView](self, "containerView"));
  [v4 bounds];
  v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  -[TVMAddToPlaylistPresentationController setDimmingView:](self, "setDimmingView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController dimmingView](self, "dimmingView"));
  [v6 setAlpha:0.0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.00117647059, 0.3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController dimmingView](self, "dimmingView"));
  [v8 setBackgroundColor:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController containerView](self, "containerView"));
  [v9 addSubview:self->_dimmingView];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController presentingViewController](self, "presentingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transitionCoordinator]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005EEBC;
  v12[3] = &unk_10026B558;
  v12[4] = self;
  [v11 animateAlongsideTransition:v12 completion:&stru_10026B598];
}

- (void)dismissalTransitionWillBegin
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionCoordinator]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005EF9C;
  v6[3] = &unk_10026B558;
  v6[4] = self;
  [v4 animateAlongsideTransition:v6 completion:&stru_10026B5B8];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMAddToPlaylistPresentationController;
  -[TVMAddToPlaylistPresentationController dismissalTransitionWillBegin](&v5, "dismissalTransitionWillBegin");
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController dimmingView](self, "dimmingView"));
    [v5 removeFromSuperview];
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMAddToPlaylistPresentationController;
  -[TVMAddToPlaylistPresentationController dismissalTransitionDidEnd:](&v6, "dismissalTransitionDidEnd:", v3);
}

- (void)containerViewDidLayoutSubviews
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController containerView](self, "containerView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMAddToPlaylistPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMAddToPlaylistPresentationController;
  -[TVMAddToPlaylistPresentationController containerViewDidLayoutSubviews](&v13, "containerViewDidLayoutSubviews");
}

- (BOOL)shouldRemovePresentersView
{
  return 1;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end