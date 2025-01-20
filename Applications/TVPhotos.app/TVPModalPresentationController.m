@interface TVPModalPresentationController
- (TVPModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (TVPModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 blurStyle:(int64_t)a5;
- (UIVisualEffectView)visualEffectView;
- (int64_t)blurStyle;
- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4;
- (void)_configureSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation TVPModalPresentationController

- (TVPModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 blurStyle:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPModalPresentationController;
  result = -[TVPModalPresentationController initWithPresentedViewController:presentingViewController:]( &v7,  "initWithPresentedViewController:presentingViewController:",  a3,  a4);
  if (result) {
    result->_blurStyle = a5;
  }
  return result;
}

- (TVPModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  return -[TVPModalPresentationController initWithPresentedViewController:presentingViewController:blurStyle:]( self,  "initWithPresentedViewController:presentingViewController:blurStyle:",  a3,  a4,  4005LL);
}

- (void)presentationTransitionWillBegin
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPModalPresentationController presentedViewController](self, "presentedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 transitionCoordinator]);
  -[TVPModalPresentationController _animateWithCoordinator:isPresenting:]( self,  "_animateWithCoordinator:isPresenting:",  v3,  1LL);
}

- (void)dismissalTransitionWillBegin
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPModalPresentationController presentedViewController](self, "presentedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 transitionCoordinator]);
  -[TVPModalPresentationController _animateWithCoordinator:isPresenting:]( self,  "_animateWithCoordinator:isPresenting:",  v3,  0LL);
}

- (void)_configureSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresentationController containerView](self, "containerView"));
  if (self->_visualEffectView) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0LL;
  }
  if (!v4)
  {
    id v8 = v3;
    v5 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    [v8 bounds];
    v6 = -[UIVisualEffectView initWithFrame:](v5, "initWithFrame:");
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v6;

    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", 0LL);
    [v8 addSubview:self->_visualEffectView];
    v3 = v8;
  }
}

- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresentationController visualEffectView](self, "visualEffectView"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", self->_blurStyle));
  BOOL v9 = !v4;
  if (v4) {
    v10 = (void *)v8;
  }
  else {
    v10 = 0LL;
  }
  if (v4) {
    v11 = 0LL;
  }
  else {
    v11 = (void *)v8;
  }
  if (v9) {
    double v12 = 0.0;
  }
  else {
    double v12 = 0.2;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5));
  [v7 setBackgroundColor:v13];

  [v7 setEffect:v11];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100029AC8;
  v24[3] = &unk_1000CA548;
  id v14 = v7;
  id v25 = v14;
  id v15 = v10;
  id v26 = v15;
  double v27 = v12;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100029B28;
  v22[3] = &unk_1000C9A20;
  v16 = objc_retainBlock(v24);
  id v23 = v16;
  if (([v6 animateAlongsideTransition:v22 completion:0] & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVPModalPresentationAnimator _alphaAnimationFactory]( &OBJC_CLASS___TVPModalPresentationAnimator,  "_alphaAnimationFactory"));
    [v6 transitionDuration];
    double v19 = v18;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100029B34;
    v20[3] = &unk_1000C95F0;
    v21 = v16;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393248LL,  v17,  v20,  0LL,  v19,  0.0);
  }
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void).cxx_destruct
{
}

@end