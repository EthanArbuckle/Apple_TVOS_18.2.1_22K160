@interface PBPictureInPictureContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBPIPRootViewController)pipRootViewController;
- (PBSplitViewControlsViewController)splitViewControlsViewController;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (id)preferredFocusEnvironments;
- (void)_createSplitViewStashHintOverlayIfNeeded;
- (void)_destroySplitViewStashOverlayHint;
- (void)_hostPiPRootViewController:(id)a3 removing:(id)a4;
- (void)_hostSplitViewControlsViewController:(id)a3 removing:(id)a4;
- (void)_observeSplitViewGeometry:(id)a3 removing:(id)a4;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
- (void)setPipRootViewController:(id)a3;
- (void)setSplitViewControlsViewController:(id)a3;
- (void)setSplitViewStashOverlayHintState:(int64_t)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PBPictureInPictureContentPresentingViewController

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController geometry](self->_splitViewControlsViewController, "geometry"));
  -[PBPictureInPictureContentPresentingViewController _observeSplitViewGeometry:removing:]( self,  "_observeSplitViewGeometry:removing:",  0LL,  v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBPictureInPictureContentPresentingViewController;
  -[PBPictureInPictureContentPresentingViewController dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (&off_1003D3178 == a6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController viewIfLoaded](self, "viewIfLoaded", a3, a4, a5));
    [v6 setNeedsLayout];
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PBPictureInPictureContentPresentingViewController;
    -[PBPictureInPictureContentPresentingViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBPictureInPictureContentPresentingViewController;
  -[PBPictureInPictureContentPresentingViewController viewWillLayoutSubviews](&v16, "viewWillLayoutSubviews");
  splitViewControlsViewController = self->_splitViewControlsViewController;
  if (splitViewControlsViewController)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController geometry](splitViewControlsViewController, "geometry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 coordinateSpace]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
    [v4 frame];
    objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController view](self->_splitViewControlsViewController, "view"));
    objc_msgSend(v15, "setFrame:", v8, v10 + v14 * 0.5, v12, v14 - v14 * 0.5);
  }

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  objc_super v4 = v3;
  if (self->_acceptsEventFocus)
  {
    objc_msgSend(v3, "bs_safeAddObject:", self->_splitViewControlsViewController);
    objc_msgSend(v4, "bs_safeAddObject:", self->_pipRootViewController);
  }

  return v4;
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
  v6 = (void (**)(void))a5;
  -[PBPictureInPictureContentPresentingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PBPictureInPictureContentPresentingViewController _hostSplitViewControlsViewController:removing:]( self,  "_hostSplitViewControlsViewController:removing:",  self->_splitViewControlsViewController,  0LL);
  -[PBPictureInPictureContentPresentingViewController _hostPiPRootViewController:removing:]( self,  "_hostPiPRootViewController:removing:",  self->_pipRootViewController,  0LL);
  v6[2](v6);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  splitViewControlsViewController = self->_splitViewControlsViewController;
  double v7 = (void (**)(void))a5;
  -[PBPictureInPictureContentPresentingViewController _hostSplitViewControlsViewController:removing:]( self,  "_hostSplitViewControlsViewController:removing:",  0LL,  splitViewControlsViewController);
  -[PBPictureInPictureContentPresentingViewController _hostPiPRootViewController:removing:]( self,  "_hostPiPRootViewController:removing:",  0LL,  self->_pipRootViewController);
  v7[2](v7);
}

- (void)setSplitViewStashOverlayHintState:(int64_t)a3
{
  if (self->_currentSplitViewStashOverlayHintState != a3)
  {
    if (a3 == 2)
    {
      splitViewStashHintOverlayViewController = self->_splitViewStashHintOverlayViewController;
      uint64_t v6 = 1LL;
    }

    else
    {
      if (a3 != 1)
      {
        if (!a3) {
          -[PBPictureInPictureContentPresentingViewController _destroySplitViewStashOverlayHint]( self,  "_destroySplitViewStashOverlayHint");
        }
        goto LABEL_9;
      }

      -[PBPictureInPictureContentPresentingViewController _createSplitViewStashHintOverlayIfNeeded]( self,  "_createSplitViewStashHintOverlayIfNeeded");
      splitViewStashHintOverlayViewController = self->_splitViewStashHintOverlayViewController;
      uint64_t v6 = 0LL;
    }

    -[PBPIPStashHintOverlayViewController setHidden:animated:]( splitViewStashHintOverlayViewController,  "setHidden:animated:",  v6,  1LL);
LABEL_9:
    self->_currentSplitViewStashOverlayHintState = a3;
  }

- (void)setPipRootViewController:(id)a3
{
  v5 = (PBPIPRootViewController *)a3;
  p_pipRootViewController = &self->_pipRootViewController;
  pipRootViewController = self->_pipRootViewController;
  if (pipRootViewController != v5)
  {
    double v8 = pipRootViewController;
    objc_storeStrong((id *)&self->_pipRootViewController, a3);
    else {
      BOOL v9 = -[PBPIPRootViewController shouldShowControlsHintOnActivation]( *p_pipRootViewController,  "shouldShowControlsHintOnActivation");
    }
    -[PBPIPRootViewController setShouldShowControlsHintOnActivation:]( *p_pipRootViewController,  "setShouldShowControlsHintOnActivation:",  v9);
    -[PBPictureInPictureContentPresentingViewController _hostPiPRootViewController:removing:]( self,  "_hostPiPRootViewController:removing:",  *p_pipRootViewController,  v8);
  }
}

- (void)setSplitViewControlsViewController:(id)a3
{
  objc_super v4 = (PBSplitViewControlsViewController *)a3;
  v5 = v4;
  splitViewControlsViewController = self->_splitViewControlsViewController;
  if (splitViewControlsViewController != v4)
  {
    double v7 = v4;
    double v8 = self->_splitViewControlsViewController;
    self->_splitViewControlsViewController = v7;
    BOOL v9 = splitViewControlsViewController;

    -[PBPictureInPictureContentPresentingViewController _hostSplitViewControlsViewController:removing:]( self,  "_hostSplitViewControlsViewController:removing:",  self->_splitViewControlsViewController,  v9);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController geometry](self->_splitViewControlsViewController, "geometry"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController geometry](v9, "geometry"));

    -[PBPictureInPictureContentPresentingViewController _observeSplitViewGeometry:removing:]( self,  "_observeSplitViewGeometry:removing:",  v10,  v11);
  }
}

- (void)_hostPiPRootViewController:(id)a3 removing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBPictureInPictureContentPresentingViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (v7) {
      -[PBPictureInPictureContentPresentingViewController bs_removeChildViewController:]( self,  "bs_removeChildViewController:",  v7);
    }
    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100104694;
      v10[3] = &unk_1003D7798;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v6 view]);
      id v8 = v12;
      id v9 = v11;
      -[PBPictureInPictureContentPresentingViewController bs_addChildViewController:animated:transitionBlock:]( self,  "bs_addChildViewController:animated:transitionBlock:",  v6,  0LL,  v10);
    }
  }
}

- (void)_hostSplitViewControlsViewController:(id)a3 removing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBPictureInPictureContentPresentingViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (v7) {
      -[PBPictureInPictureContentPresentingViewController bs_removeChildViewController:]( self,  "bs_removeChildViewController:",  v7);
    }
    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001047D4;
      v10[3] = &unk_1003D7798;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v6 view]);
      id v8 = v12;
      id v9 = v11;
      -[PBPictureInPictureContentPresentingViewController bs_addChildViewController:animated:transitionBlock:]( self,  "bs_addChildViewController:animated:transitionBlock:",  v6,  0LL,  v10);
    }
  }
}

- (void)_observeSplitViewGeometry:(id)a3 removing:(id)a4
{
  id v6 = a4;
  [a3 addObserverForFrame:self];
  [v6 removeObserverForFrame:self];
}

- (void)_createSplitViewStashHintOverlayIfNeeded
{
  if (!self->_splitViewStashHintOverlayViewController)
  {
    UIUserInterfaceLayoutDirection v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  0LL);
    if (v3) {
      uint64_t v4 = 2LL;
    }
    else {
      uint64_t v4 = 3LL;
    }
    v5 = -[PBPIPStashHintOverlayViewController initWithQuadrant:]( objc_alloc(&OBJC_CLASS___PBPIPStashHintOverlayViewController),  "initWithQuadrant:",  v4);
    splitViewStashHintOverlayViewController = self->_splitViewStashHintOverlayViewController;
    self->_splitViewStashHintOverlayViewController = v5;

    -[PBPIPStashHintOverlayViewController setHidden:](self->_splitViewStashHintOverlayViewController, "setHidden:", 1LL);
    -[PBPictureInPictureContentPresentingViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_splitViewStashHintOverlayViewController);
    -[PBPIPStashHintOverlayViewController visualEffectViewBorderWidth]( self->_splitViewStashHintOverlayViewController,  "visualEffectViewBorderWidth");
    double v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self->_splitViewStashHintOverlayViewController, "view"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 centerYAnchor]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 centerYAnchor]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v13]);
    [v10 addObject:v14];

    if (v3)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 leftAnchor]);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 leftAnchor]);
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 rightAnchor]);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureContentPresentingViewController view](self, "view"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 rightAnchor]);
    }

    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17 constant:v8]);
    [v10 addObject:v19];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v10);
  }

- (void)_destroySplitViewStashOverlayHint
{
  if (self->_splitViewStashHintOverlayViewController)
  {
    -[PBPictureInPictureContentPresentingViewController bs_removeChildViewController:]( self,  "bs_removeChildViewController:");
    splitViewStashHintOverlayViewController = self->_splitViewStashHintOverlayViewController;
    self->_splitViewStashHintOverlayViewController = 0LL;
  }

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return (PBSystemOverlayContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)setContentDelegate:(id)a3
{
}

- (PBPIPRootViewController)pipRootViewController
{
  return self->_pipRootViewController;
}

- (PBSplitViewControlsViewController)splitViewControlsViewController
{
  return self->_splitViewControlsViewController;
}

- (void).cxx_destruct
{
}

@end