@interface PBPIPContainerViewController
- (NSDate)editingStartDate;
- (PBPIPContainerViewController)initWithCoder:(id)a3;
- (PBPIPContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBPIPContainerViewController)initWithPictureInPictureViewController:(id)a3;
- (PBPIPContainerViewControllerAnimationDelegate)animationDelegate;
- (PBPIPControlsViewController)controlsViewController;
- (PBPIPEditingHintViewController)editingHintViewController;
- (PGPictureInPictureViewController)pictureInPictureViewController;
- (id)preferredFocusEnvironments;
- (id)updateConstraintsForAccessoryState;
- (void)_hideControlsUsingAnimationStyle:(int64_t)a3;
- (void)_hidePagingAccessoryAnimated:(BOOL)a3;
- (void)_showControlsUsingAnimationStyle:(int64_t)a3 inQuadrant:(int64_t)a4;
- (void)dealloc;
- (void)hideControlsHint;
- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4;
- (void)performStartAnimationWithCompletionHandler:(id)a3;
- (void)performStartInIsolationWithCompletionHandler:(id)a3;
- (void)performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)performStopInIsolationWithCompletionHandler:(id)a3;
- (void)pipEditingHintViewControllerDidDismiss:(id)a3;
- (void)preferredContentSizeDidChangeForPictureInPictureViewController;
- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)prepareStopAnimationWithCompletionHandler:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animationStyle:(int64_t)a4 inQuadrant:(int64_t)a5;
- (void)setEditingHintViewController:(id)a3;
- (void)setEditingStartDate:(id)a3;
- (void)setPictureInPictureViewController:(id)a3;
- (void)setUpdateConstraintsForAccessoryState:(id)a3;
- (void)showControlsHint;
- (void)showPagingAccessoryAnimated;
- (void)viewDidLoad;
@end

@implementation PBPIPContainerViewController

- (PBPIPContainerViewController)initWithPictureInPictureViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewController;
  v6 = -[PBPIPContainerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pictureInPictureViewController, a3);
    -[PGPictureInPictureViewController setContentContainer:]( v7->_pictureInPictureViewController,  "setContentContainer:",  v7);
  }

  return v7;
}

- (PBPIPContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ does not support unarchiving from a nib.",  v7);

  return -[PBPIPContainerViewController initWithPictureInPictureViewController:]( self,  "initWithPictureInPictureViewController:",  0LL);
}

- (PBPIPContainerViewController)initWithCoder:(id)a3
{
  v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ does not support unarchiving from a nib.",  v6);

  return -[PBPIPContainerViewController initWithPictureInPictureViewController:]( self,  "initWithPictureInPictureViewController:",  0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController pictureInPictureViewController](self, "pictureInPictureViewController"));
  [v3 setContentContainer:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewController;
  -[PBPIPContainerViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewController;
  -[PBPIPContainerViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController pictureInPictureViewController](self, "pictureInPictureViewController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController pictureInPictureViewController](self, "pictureInPictureViewController"));
  -[PBPIPContainerViewController addChildViewController:](self, "addChildViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  [v6 addSubview:v4];

  [v4 setHidden:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 leadingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToAnchor:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 trailingAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v13]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 topAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17]);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v21]);

  v30[0] = v10;
  v30[1] = v14;
  v30[2] = v18;
  v30[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureViewController contentContainerView]( self->_pictureInPictureViewController,  "contentContainerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);

  id v26 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  objc_msgSend(v25, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  LODWORD(v27) = 0.25;
  [v25 setShadowOpacity:v27];
  [v25 setShadowRadius:30.0];
  objc_msgSend(v25, "setShadowOffset:", 4.0, 4.0);
  [v25 setShadowPathIsBounds:1];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController pictureInPictureViewController](self, "pictureInPictureViewController"));
  [v28 didMoveToParentViewController:self];
}

- (id)preferredFocusEnvironments
{
  if (self->_controlsViewController)
  {
    controlsViewController = self->_controlsViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &controlsViewController,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)setEditing:(BOOL)a3 animationStyle:(int64_t)a4 inQuadrant:(int64_t)a5
{
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewController;
    -[PBPIPContainerViewController setEditing:animated:](&v13, "setEditing:animated:", 1LL, a4 != 0);
    -[PBPIPContainerViewController hideControlsHint](self, "hideControlsHint");
    -[PBPIPContainerViewController _showControlsUsingAnimationStyle:inQuadrant:]( self,  "_showControlsUsingAnimationStyle:inQuadrant:",  a4,  a5);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    editingStartDate = self->_editingStartDate;
    self->_editingStartDate = v8;
  }

  else
  {
    -[PBPIPContainerViewController _hideControlsUsingAnimationStyle:]( self,  "_hideControlsUsingAnimationStyle:",  a4,  a4,  a5);
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewController;
    -[PBPIPContainerViewController setEditing:animated:](&v12, "setEditing:animated:", 0LL, a4 != 0);
    v10 = self->_editingStartDate;
    if (!v10) {
      return;
    }
    -[NSDate timeIntervalSinceNow](v10, "timeIntervalSinceNow");
    sub_1000A2B30(fabs(v11));
    editingStartDate = self->_editingStartDate;
    self->_editingStartDate = 0LL;
  }
}

- (void)_showControlsUsingAnimationStyle:(int64_t)a3 inQuadrant:(int64_t)a4
{
  controlsViewController = self->_controlsViewController;
  if (!controlsViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
    id v8 = [WeakRetained containerViewControllerPreferredControlsLayoutStyle:self];

    objc_super v9 = -[PBPIPControlsViewController initWithQuadrant:mode:]( objc_alloc(&OBJC_CLASS___PBPIPControlsViewController),  "initWithQuadrant:mode:",  a4,  v8);
    v10 = self->_controlsViewController;
    self->_controlsViewController = v9;

    controlsViewController = self->_controlsViewController;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController view](controlsViewController, "view", a3, a4));
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[PBPIPContainerViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_controlsViewController);
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue([v11 heightAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 heightAnchor]);
  double v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
  v32[0] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v11 widthAnchor]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 widthAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v24]);
  v32[1] = v23;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerXAnchor]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 centerXAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v14]);
  v32[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 centerYAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v18]);
  v32[3] = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  [v20 setNeedsLayout];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  [v21 layoutIfNeeded];

  -[PBPIPControlsViewController showControlsAnimated:shrinkingEffect:]( self->_controlsViewController,  "showControlsAnimated:shrinkingEffect:",  1LL,  a3 != 2);
  -[PBPIPContainerViewController showPagingAccessoryAnimated](self, "showPagingAccessoryAnimated");
}

- (void)_hideControlsUsingAnimationStyle:(int64_t)a3
{
  controlsViewController = self->_controlsViewController;
  if (controlsViewController)
  {
    BOOL v5 = a3 == 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000388E4;
    v6[3] = &unk_1003CFF08;
    v6[4] = self;
    -[PBPIPControlsViewController hideControlsAnimated:completion:]( controlsViewController,  "hideControlsAnimated:completion:",  v5,  v6);
    -[PBPIPContainerViewController _hidePagingAccessoryAnimated:](self, "_hidePagingAccessoryAnimated:", v5);
  }

- (void)showPagingAccessoryAnimated
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureViewController pagingAccessoryViewController]( self->_pictureInPictureViewController,  "pagingAccessoryViewController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);

  if (v4)
  {
    updateConstraintsForAccessoryState = (void (**)(id, uint64_t))self->_updateConstraintsForAccessoryState;
    if (updateConstraintsForAccessoryState)
    {
      updateConstraintsForAccessoryState[2](updateConstraintsForAccessoryState, 1LL);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
      [v6 layoutIfNeeded];

      v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      objc_super v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472LL;
      double v11 = sub_100038A24;
      objc_super v12 = &unk_1003CFEB8;
      id v13 = v4;
      v14 = self;
      id v8 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v7,  "initWithDuration:curve:animations:",  0LL,  &v9,  0.4);
      -[UIViewPropertyAnimator startAnimation](v8, "startAnimation", v9, v10, v11, v12);
    }
  }
}

- (void)_hidePagingAccessoryAnimated:(BOOL)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureViewController pagingAccessoryViewController]( self->_pictureInPictureViewController,  "pagingAccessoryViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

  if (v6 && self->_updateConstraintsForAccessoryState)
  {
    v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    objc_super v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    double v11 = sub_100038B58;
    objc_super v12 = &unk_1003CFEB8;
    id v13 = v6;
    v14 = self;
    id v8 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v7,  "initWithDuration:curve:animations:",  0LL,  &v9,  0.4);
    -[UIViewPropertyAnimator startAnimation](v8, "startAnimation", v9, v10, v11, v12);
    if (!a3) {
      -[UIViewPropertyAnimator setFractionComplete:](v8, "setFractionComplete:", 1.0);
    }
  }
}

- (void)showControlsHint
{
  if (!self->_editingHintViewController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([0 parentViewController]);
    objc_msgSend(v3, "bs_removeChildViewController:", self->_editingHintViewController);
  }

  objc_super v4 = -[PBPIPEditingHintViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___PBPIPEditingHintViewController),  "initWithStyle:",  1LL);
  editingHintViewController = self->_editingHintViewController;
  self->_editingHintViewController = v4;

  -[PBPIPEditingHintViewController setDelegate:](self->_editingHintViewController, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPEditingHintViewController view](self->_editingHintViewController, "view"));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  -[PBPIPContainerViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_editingHintViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPEditingHintViewController view](self->_editingHintViewController, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self, "view"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pb_constraintsForPinningToView:", v8));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v9);
  -[PBPIPEditingHintViewController appearAnimated](self->_editingHintViewController, "appearAnimated");
}

- (void)hideControlsHint
{
}

- (void)pipEditingHintViewControllerDidDismiss:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPEditingHintViewController parentViewController]( self->_editingHintViewController,  "parentViewController",  a3));
  objc_msgSend(v4, "bs_removeChildViewController:", self->_editingHintViewController);

  editingHintViewController = self->_editingHintViewController;
  self->_editingHintViewController = 0LL;
}

- (void)preferredContentSizeDidChangeForPictureInPictureViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  [v3 containerViewControllerDidChangePreferredContentSize:self];
}

- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  objc_msgSend( v11,  "containerViewController:prepareStartAnimationWithInitialLayerFrame:completionHandler:",  self,  v10,  x,  y,  width,  height);
}

- (void)performStartAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  [v5 containerViewController:self performStartAnimationWithCompletionHandler:v4];
}

- (void)prepareStopAnimationWithCompletionHandler:(id)a3
{
  pictureInPictureViewController = self->_pictureInPictureViewController;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PGPictureInPictureViewController contentContainerView]( pictureInPictureViewController,  "contentContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);

  id v8 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  LODWORD(v9) = 0;
  [v7 setShadowOpacity:v9];
  [v7 setShadowRadius:3.0];
  objc_msgSend(v7, "setShadowOffset:", 0.0, -3.0);
  [v7 setShadowPathIsBounds:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  [v10 containerViewController:self prepareStopAnimationWithCompletionHandler:v5];
}

- (void)performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  objc_msgSend( v11,  "containerViewController:performStopAnimationWithFinalLayerFrame:completionHandler:",  self,  v10,  x,  y,  width,  height);
}

- (void)performStartInIsolationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  [v5 containerViewController:self performStartInIsolationWithCompletionHandler:v4];
}

- (void)performStopInIsolationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController animationDelegate](self, "animationDelegate"));
  [v5 containerViewController:self performStopInIsolationWithCompletionHandler:v4];
}

- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, SEL, int64_t))a4 + 2))(a4, a2, a3);
  }
}

- (PGPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (void)setPictureInPictureViewController:(id)a3
{
}

- (PBPIPContainerViewControllerAnimationDelegate)animationDelegate
{
  return (PBPIPContainerViewControllerAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
}

- (PBPIPControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (id)updateConstraintsForAccessoryState
{
  return self->_updateConstraintsForAccessoryState;
}

- (void)setUpdateConstraintsForAccessoryState:(id)a3
{
}

- (PBPIPEditingHintViewController)editingHintViewController
{
  return self->_editingHintViewController;
}

- (void)setEditingHintViewController:(id)a3
{
}

- (NSDate)editingStartDate
{
  return self->_editingStartDate;
}

- (void)setEditingStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end