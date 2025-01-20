@interface TVPContextMenuViewController
- (BOOL)definesPresentationContext;
- (CGAffineTransform)_translation;
- (TVPContextMenuContainerViewController)menuContainerViewController;
- (TVPContextMenuPresenter)contextMenuPresenter;
- (TVPContextMenuViewController)init;
- (TVPContextMenuViewController)initWithCoder:(id)a3;
- (TVPContextMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPContextMenuViewController)initWithViewController:(id)a3 presenter:(id)a4;
- (id)_animationTimingFunction;
- (id)_animator:(BOOL)a3 withCompletion:(id)a4;
- (void)dismissContentAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)presentContentAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVPContextMenuViewController

- (CGAffineTransform)_translation
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController view](self, "view"));
  id v5 = [v4 effectiveUserInterfaceLayoutDirection];

  double v6 = *(double *)&qword_100101B78 + *(double *)&qword_100101B80;
  if (v5 != (id)1) {
    double v6 = -(*(double *)&qword_100101B78 + *(double *)&qword_100101B80);
  }
  return CGAffineTransformMakeTranslation(retstr, v6, 0.0);
}

- (id)_animationTimingFunction
{
  v2 = objc_alloc(&OBJC_CLASS___CAMediaTimingFunction);
  LODWORD(v3) = 1050253722;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0.25;
  LODWORD(v6) = 1.0;
  return -[CAMediaTimingFunction initWithControlPoints::::](v2, "initWithControlPoints::::", v3, v4, v5, v6);
}

- (id)_animator:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    v7 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
    v8 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v7,  "initWithMass:stiffness:damping:initialVelocity:",  *(double *)&qword_100101B88,  *(double *)&qword_100101B90,  *(double *)&qword_100101B98,  0.0,  0.0);
    v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v8,  0.0);
    v10 = v9;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000277C;
    v20[3] = &unk_1000C9528;
    v20[4] = self;
    v11 = v20;
  }

  else
  {
    v12 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController _animationTimingFunction](self, "_animationTimingFunction"));
    v8 = -[UICubicTimingParameters initWithCustomCurve:](v12, "initWithCustomCurve:", v13);

    v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v14,  "initWithDuration:timingParameters:",  v8,  *(double *)&qword_100101BA0);
    v10 = v9;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000027E0;
    v19[3] = &unk_1000C9528;
    v19[4] = self;
    v11 = v19;
  }

  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v11);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100002860;
  v17[3] = &unk_1000C9550;
  id v18 = v6;
  id v15 = v6;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v17);

  return v10;
}

- (TVPContextMenuViewController)initWithViewController:(id)a3 presenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPContextMenuViewController;
  v8 = -[TVPContextMenuViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  if (v8)
  {
    v9 = -[TVPContextMenuContainerViewController initWithViewController:]( objc_alloc(&OBJC_CLASS___TVPContextMenuContainerViewController),  "initWithViewController:",  v6);
    menuContainerViewController = v8->_menuContainerViewController;
    v8->_menuContainerViewController = v9;

    objc_storeWeak((id *)&v8->_contextMenuPresenter, v7);
  }

  return v8;
}

- (TVPContextMenuViewController)init
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuViewController.m",  74,  @"%s is not available as initializer",  "-[TVPContextMenuViewController init]");

  abort();
}

- (TVPContextMenuViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuViewController.m",  78,  @"%s is not available as initializer",  "-[TVPContextMenuViewController initWithCoder:]");

  abort();
}

- (TVPContextMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuViewController.m",  82,  @"%s is not available as initializer",  "-[TVPContextMenuViewController initWithNibName:bundle:]");

  abort();
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVPContextMenuViewController;
  -[TVPContextMenuViewController viewDidLoad](&v22, "viewDidLoad");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController menuContainerViewController](self, "menuContainerViewController"));
  -[TVPContextMenuViewController bs_addChildViewController:](self, "bs_addChildViewController:", v20);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVPContextMenuViewController _translation](self, "_translation");
  *(_OWORD *)v21 = *(_OWORD *)&v21[7];
  *(_OWORD *)&v21[2] = *(_OWORD *)&v21[9];
  *(_OWORD *)&v21[4] = *(_OWORD *)&v21[11];
  [v3 setTransform:v21];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 widthAnchor]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToConstant:*(double *)&qword_100101B78]);
  v23[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v16 constant:*(double *)&qword_100101B80]);
  v23[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v13 constant:*(double *)&qword_100101B80]);
  v23[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7 constant:*(double *)&qword_100101B80]);
  v23[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:-*(double *)&qword_100101B80]);
  v23[4] = v11;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 5LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (void)presentContentAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = objc_autoreleasePoolPush();
  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController _animator:withCompletion:](self, "_animator:withCompletion:", 1LL, v6));
    [v8 startAnimation];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController menuContainerViewController](self, "menuContainerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    __int128 v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v11;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v10 setTransform:v12];

    v6[2](v6);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)dismissContentAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = objc_autoreleasePoolPush();
  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController _animator:withCompletion:](self, "_animator:withCompletion:", 0LL, v6));
    [v8 startAnimation];
  }

  else
  {
    -[TVPContextMenuViewController _translation](self, "_translation");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController menuContainerViewController](self, "menuContainerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    v11[0] = v11[3];
    v11[1] = v11[4];
    v11[2] = v11[5];
    [v10 setTransform:v11];

    v6[2](v6);
  }

  objc_autoreleasePoolPop(v7);
}

- (TVPContextMenuContainerViewController)menuContainerViewController
{
  return self->_menuContainerViewController;
}

- (TVPContextMenuPresenter)contextMenuPresenter
{
  return (TVPContextMenuPresenter *)objc_loadWeakRetained((id *)&self->_contextMenuPresenter);
}

- (void).cxx_destruct
{
}

@end