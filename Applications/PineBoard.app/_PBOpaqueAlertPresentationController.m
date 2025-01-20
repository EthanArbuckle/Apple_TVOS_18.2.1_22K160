@interface _PBOpaqueAlertPresentationController
- (UIView)opaqueView;
- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4;
- (void)_configureSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation _PBOpaqueAlertPresentationController

- (void)presentationTransitionWillBegin
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBOpaqueAlertPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionCoordinator]);
  -[_PBOpaqueAlertPresentationController _animateWithCoordinator:isPresenting:]( self,  "_animateWithCoordinator:isPresenting:",  v4,  1LL);
}

- (void)dismissalTransitionWillBegin
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBOpaqueAlertPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionCoordinator]);
  -[_PBOpaqueAlertPresentationController _animateWithCoordinator:isPresenting:]( self,  "_animateWithCoordinator:isPresenting:",  v4,  0LL);
}

- (void)_configureSubviews
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[_PBOpaqueAlertPresentationController containerView](self, "containerView"));
  v4 = (void *)v3;
  if (self->_opaqueView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___UIView);
    [v4 bounds];
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    opaqueView = self->_opaqueView;
    self->_opaqueView = v7;

    [v4 addSubview:self->_opaqueView];
  }
}

- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4
{
  if (a4) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  if (a4) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  v7 = self->_opaqueView;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, v5));
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v9);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10020B0AC;
  v15[3] = &unk_1003D05A8;
  v10 = v7;
  v16 = v10;
  double v17 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10020B0F8;
  v13[3] = &unk_1003DD160;
  v11 = objc_retainBlock(v15);
  id v14 = v11;
  unsigned __int8 v12 = [v8 animateAlongsideTransition:v13 completion:0];

  if ((v12 & 1) == 0) {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (UIView)opaqueView
{
  return self->_opaqueView;
}

- (void).cxx_destruct
{
}

@end