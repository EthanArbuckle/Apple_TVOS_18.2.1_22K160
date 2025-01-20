@interface PBPIPRootViewController
+ (id)_defaultTransitionContext;
- (BOOL)isEditing;
- (BOOL)isEditingControlsVisible;
- (BOOL)isHidden;
- (BOOL)isPictureInPictureActive;
- (BOOL)isStashed;
- (BOOL)isSwapping;
- (BOOL)isVisibleAndSplitViewNested;
- (BOOL)shouldShowControlsHintOnActivation;
- (BSInvalidatable)editingAvoidancePausedAssertion;
- (CGRect)currentContainerFrame;
- (CGRect)preferredContainerFrame;
- (NSArray)containerViewControllers;
- (NSLayoutConstraint)pipInsetLayoutGuideBottomConstraint;
- (NSLayoutConstraint)pipInsetLayoutGuideLeadingConstraint;
- (NSLayoutConstraint)pipInsetLayoutGuideTopConstraint;
- (NSLayoutConstraint)pipInsetLayoutGuideTrailingConstraint;
- (NSLayoutConstraint)stashHintViewLeftConstraint;
- (NSLayoutConstraint)stashHintViewRightConstraint;
- (NSMutableSet)containerViewControllerLayouts;
- (PBDisplayLayoutElementHandle)displayLayoutElementHandle;
- (PBPIPAvoidanceController)avoidanceController;
- (PBPIPRootViewController)initWithInitialQuadrant:(int64_t)a3;
- (PBPIPRootViewControllerDelegate)delegate;
- (PBPIPStashHintOverlayViewController)stashHintOverlayViewController;
- (PBPictureInPictureControlsDelegate)controlsDelegate;
- (PBSplitViewInwardSizing)splitViewGeometry;
- (TVSStateMachine)stateMachine;
- (UIEdgeInsets)cumulativePIPInsets;
- (UILayoutGuide)pipInsetLayoutGuide;
- (_PBPIPSwapContext)swapContext;
- (id)_activePictureInPictureBundleID;
- (id)_createStateMachine;
- (id)_layoutForContainerViewController:(id)a3;
- (id)_layoutForContainerViewControllerState:(int64_t)a3;
- (id)fullscreenLayout;
- (id)pictureInPictureLayout;
- (id)preferredFocusEnvironments;
- (int64_t)appearanceStyle;
- (int64_t)controlsDidSelectMovePictureInPictureToNextQuadrant:(id)a3;
- (int64_t)currentQuadrant;
- (int64_t)moveToNextQuadrant;
- (unint64_t)containerViewControllerPreferredControlsLayoutStyle:(id)a3;
- (unint64_t)presentationState;
- (void)_containerViewController:(id)a3 performStartAnimationInIsolation:(BOOL)a4 completionHandler:(id)a5;
- (void)_createStashHintOverlayIfNeeded;
- (void)_destroyStashHintOverlay;
- (void)_handleBackgroundViewWhenEditing:(BOOL)a3 animationStyle:(int64_t)a4;
- (void)_handlePrepareStartRequestWithLayout:(id)a3 userInfo:(id)a4;
- (void)_handlePrepareStopRequestWithUserInfo:(id)a3;
- (void)_moveStashedContainerWithLayout:(id)a3 toQuadrant:(int64_t)a4 animated:(BOOL)a5;
- (void)_performMoveContainerToQuadrant:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateDisplayLayoutElementBundleIDWithReason:(id)a3;
- (void)_updateLayoutForAppearanceStyle:(id)a3 animated:(BOOL)a4;
- (void)_updateStashHintViewPositionalConstraintsForQuadrant:(int64_t)a3;
- (void)addContainerViewController:(id)a3;
- (void)adjustPositionForFocusedFrame:(CGRect)a3;
- (void)cancelPictureInPicture;
- (void)containerViewController:(id)a3 performStartAnimationWithCompletionHandler:(id)a4;
- (void)containerViewController:(id)a3 performStartInIsolationWithCompletionHandler:(id)a4;
- (void)containerViewController:(id)a3 performStopAnimationWithFinalLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)containerViewController:(id)a3 performStopInIsolationWithCompletionHandler:(id)a4;
- (void)containerViewController:(id)a3 playbackSourceDidUpdateRoutingVideoToHostedWindow:(BOOL)a4;
- (void)containerViewController:(id)a3 prepareStartAnimationWithInitialLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)containerViewController:(id)a3 prepareStopAnimationWithCompletionHandler:(id)a4;
- (void)containerViewControllerDidChangePreferredContentSize:(id)a3;
- (void)containerViewControllerLayoutDidUpdateConstraints:(id)a3;
- (void)controls:(id)a3 requestPagingSkipByNumberOfPages:(int64_t)a4;
- (void)controlsDidSelectCancelPictureInPicture:(id)a3;
- (void)controlsDidSelectDismissControls:(id)a3;
- (void)controlsDidSelectEnterSplitView:(id)a3;
- (void)controlsDidSelectStopPictureInPicture:(id)a3;
- (void)controlsDidSelectTogglePictureInPictureStashing:(id)a3;
- (void)controlsDidSelectTogglePlayPause:(id)a3;
- (void)dealloc;
- (void)hideControlsHint;
- (void)moveContainerWithLayout:(id)a3 toQuadrant:(int64_t)a4 animated:(BOOL)a5;
- (void)movePictureInPicture;
- (void)nestContainerIntoSplitView;
- (void)pictureInPictureAvoidanceController:(id)a3 didReceiveHint:(id)a4 withTransitionContext:(id)a5;
- (void)removeContainerViewController:(id)a3;
- (void)setControlsDelegate:(id)a3;
- (void)setCurrentQuadrant:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutElementHandle:(id)a3;
- (void)setEditing:(BOOL)a3 animationStyle:(int64_t)a4;
- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setOverlayInsets:(UIEdgeInsets)a3;
- (void)setPipInsetLayoutGuide:(id)a3;
- (void)setPipInsetLayoutGuideBottomConstraint:(id)a3;
- (void)setPipInsetLayoutGuideLeadingConstraint:(id)a3;
- (void)setPipInsetLayoutGuideTopConstraint:(id)a3;
- (void)setPipInsetLayoutGuideTrailingConstraint:(id)a3;
- (void)setPresentationState:(unint64_t)a3;
- (void)setShouldShowControlsHintOnActivation:(BOOL)a3;
- (void)setSplitViewGeometry:(id)a3;
- (void)setStashed:(BOOL)a3 animated:(BOOL)a4;
- (void)setSwapContext:(id)a3;
- (void)stopPictureInPicture;
- (void)updateInsetLayoutGuide;
- (void)viewDidLoad;
@end

@implementation PBPIPRootViewController

- (PBPIPRootViewController)initWithInitialQuadrant:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBPIPRootViewController;
  v4 = -[PBPIPRootViewController init](&v14, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    containerViewControllerLayouts = v4->_containerViewControllerLayouts;
    v4->_containerViewControllerLayouts = v5;

    v4->_currentQuadrant = a3;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController _createStateMachine](v4, "_createStateMachine"));
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = (TVSStateMachine *)v7;

    v4->_presentationState = 0LL;
    v9 = objc_alloc_init(&OBJC_CLASS___PBPIPAvoidanceController);
    avoidanceController = v4->_avoidanceController;
    v4->_avoidanceController = v9;

    -[PBPIPAvoidanceController setDelegate:](v4->_avoidanceController, "setDelegate:", v4);
    v11 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    pipInsetLayoutGuide = v4->_pipInsetLayoutGuide;
    v4->_pipInsetLayoutGuide = v11;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBPIPRootViewController;
  -[PBPIPRootViewController dealloc](&v3, "dealloc");
}

- (BOOL)isPictureInPictureActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)pictureInPictureLayout
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewControllerState:]( self,  "_layoutForContainerViewControllerState:",  0LL));
}

- (id)fullscreenLayout
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewControllerState:]( self,  "_layoutForContainerViewControllerState:",  1LL));
}

- (BOOL)isSwapping
{
  return self->_swapContext != 0LL;
}

- (void)setSwapContext:(id)a3
{
  v5 = (_PBPIPSwapContext *)a3;
  if (self->_swapContext != v5)
  {
    objc_storeStrong((id *)&self->_swapContext, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = WeakRetained;
    if (v5) {
      [WeakRetained rootViewControllerDidStartSwapAnimation:self];
    }
    else {
      [WeakRetained rootViewControllerDidEndSwapAnimation:self];
    }
  }
}

- (int64_t)appearanceStyle
{
  return self->_splitViewGeometry != 0LL;
}

- (void)setSplitViewGeometry:(id)a3
{
  v5 = (PBSplitViewInwardSizing *)a3;
  if (self->_splitViewGeometry != v5)
  {
    objc_storeStrong((id *)&self->_splitViewGeometry, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 setSplitViewGeometry:self->_splitViewGeometry];
      -[PBPIPRootViewController updateInsetLayoutGuide](self, "updateInsetLayoutGuide");
      -[PBPIPRootViewController _updateLayoutForAppearanceStyle:animated:]( self,  "_updateLayoutForAppearanceStyle:animated:",  v7,  1LL);
    }
  }
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBPIPRootViewController;
  -[PBPIPRootViewController viewDidLoad](&v27, "viewDidLoad");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  [v3 addLayoutGuide:self->_pipInsetLayoutGuide];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_pipInsetLayoutGuide, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
  uint64_t v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v6]);
  pipInsetLayoutGuideTopConstraint = self->_pipInsetLayoutGuideTopConstraint;
  self->_pipInsetLayoutGuideTopConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_pipInsetLayoutGuide, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11]);
  pipInsetLayoutGuideBottomConstraint = self->_pipInsetLayoutGuideBottomConstraint;
  self->_pipInsetLayoutGuideBottomConstraint = v12;

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_pipInsetLayoutGuide, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
  pipInsetLayoutGuideLeadingConstraint = self->_pipInsetLayoutGuideLeadingConstraint;
  self->_pipInsetLayoutGuideLeadingConstraint = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_pipInsetLayoutGuide, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 trailingAnchor]);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v21]);
  pipInsetLayoutGuideTrailingConstraint = self->_pipInsetLayoutGuideTrailingConstraint;
  self->_pipInsetLayoutGuideTrailingConstraint = v22;

  v24 = self->_pipInsetLayoutGuideBottomConstraint;
  v28[0] = self->_pipInsetLayoutGuideTopConstraint;
  v28[1] = v24;
  v25 = self->_pipInsetLayoutGuideTrailingConstraint;
  v28[2] = self->_pipInsetLayoutGuideLeadingConstraint;
  v28[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v26);

  -[PBPIPRootViewController updateInsetLayoutGuide](self, "updateInsetLayoutGuide");
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerViewController]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerViewController]);
    v9 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    uint64_t v7 = &__NSArray0__struct;
  }

  return v7;
}

- (NSArray)containerViewControllers
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController containerViewControllerLayouts](self, "containerViewControllerLayouts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) containerViewController]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addContainerViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v4));

  if (!v5)
  {
    -[PBPIPRootViewController bs_addChildViewController:](self, "bs_addChildViewController:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pictureInPictureViewController]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pagingAccessoryViewController]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

      -[PBPIPRootViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
      [v9 setAlpha:0.0];
    }

    v10 = -[PBPIPContainerViewControllerLayout initWithContainerViewController:]( objc_alloc(&OBJC_CLASS___PBPIPContainerViewControllerLayout),  "initWithContainerViewController:",  v4);
    -[PBPIPContainerViewControllerLayout setDelegate:](v10, "setDelegate:", self);
    -[PBPIPContainerViewControllerLayout setSplitViewGeometry:](v10, "setSplitViewGeometry:", self->_splitViewGeometry);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
    unsigned int v13 = [v12 isEqual:@"Presented"];

    if (v13)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
      [v14 sendSubviewToBack:v11];
    }

    else
    {
      -[PBPIPRootViewController _updateLayoutForAppearanceStyle:animated:]( self,  "_updateLayoutForAppearanceStyle:animated:",  v10,  0LL);
    }

    [v4 setAnimationDelegate:self];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController containerViewControllerLayouts](self, "containerViewControllerLayouts"));
    [v15 addObject:v10];

    objc_initWeak(&location, v10);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100179674;
    v16[3] = &unk_1003D8808;
    objc_copyWeak(&v17, &location);
    [v4 setUpdateConstraintsForAccessoryState:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)removeContainerViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v4));
  if (v5)
  {
    -[PBPIPRootViewController setEditing:animationStyle:](self, "setEditing:animationStyle:", 0LL, 2LL);
    -[PBPIPRootViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v4);
    [v4 setAnimationDelegate:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController containerViewControllerLayouts](self, "containerViewControllerLayouts"));
    [v6 removeObject:v5];

    [v5 setSplitViewGeometry:0];
  }

  -[TVSStateMachine postEvent:withContext:]( self->_stateMachine,  "postEvent:withContext:",  @"Deactivating Layout",  v5);
}

- (CGRect)currentContainerFrame
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  if (v3
    || (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController fullscreenLayout](self, "fullscreenLayout"))) != 0LL)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerViewController]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    [v5 frame];
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
  }

  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)preferredContainerFrame
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  if (v3
    || (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController fullscreenLayout](self, "fullscreenLayout"))) != 0LL)
  {
    objc_msgSend( v3,  "preferredPictureInPictureFrameForQuadrant:pipInsets:",  self->_currentQuadrant,  60.0,  80.0,  60.0,  80.0);
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }

  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)isEditing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerViewController]);
  unsigned __int8 v4 = [v3 isEditing];

  return v4;
}

- (void)setEditing:(BOOL)a3 animationStyle:(int64_t)a4
{
  BOOL v5 = a3;
  if (-[PBPIPRootViewController isEditing](self, "isEditing") != a3)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containerViewController]);

    if (v8)
    {
      [v8 setEditing:v5 animationStyle:a4 inQuadrant:self->_currentQuadrant];
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 controlsViewController]);
      [v9 setDelegate:self];

      -[PBPIPRootViewController _handleBackgroundViewWhenEditing:animationStyle:]( self,  "_handleBackgroundViewWhenEditing:animationStyle:",  v5,  a4);
      if (v5)
      {
        if (-[PBPIPRootViewController isStashed](self, "isStashed")) {
          -[PBPIPRootViewController setStashed:animated:](self, "setStashed:animated:", 0LL, 1LL);
        }
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
        objc_msgSend( v10,  "updateConstraintsForFocusedFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);

        goto LABEL_8;
      }
    }

    else if (v5)
    {
LABEL_8:
      avoidanceController = self->_avoidanceController;
      double v12 = self->_editingAvoidancePausedAssertion;
      double v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[PBPIPAvoidanceController pauseUpdatesForReason:]( avoidanceController,  "pauseUpdatesForReason:",  @"Editing"));
      editingAvoidancePausedAssertion = self->_editingAvoidancePausedAssertion;
      self->_editingAvoidancePausedAssertion = v13;

      -[BSInvalidatable invalidate](v12, "invalidate");
LABEL_10:

      return;
    }

    -[BSInvalidatable invalidate](self->_editingAvoidancePausedAssertion, "invalidate");
    double v12 = self->_editingAvoidancePausedAssertion;
    self->_editingAvoidancePausedAssertion = 0LL;
    goto LABEL_10;
  }

- (void)_handleBackgroundViewWhenEditing:(BOOL)a3 animationStyle:(int64_t)a4
{
  if (!a3)
  {
    if (a4)
    {
      BOOL v5 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      double v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      double v12 = sub_100179C14;
      double v13 = &unk_1003CFF08;
      double v14 = self;
      double v6 = &v10;
      goto LABEL_6;
    }

    uint64_t v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
LABEL_9:
    v9 = (void *)v8;
    -[UIViewPropertyAnimator setBackgroundColor:](v7, "setBackgroundColor:", v8);

    goto LABEL_10;
  }

  if (!a4)
  {
    uint64_t v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    goto LABEL_9;
  }

  BOOL v5 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  double v17 = sub_100179BBC;
  v18 = &unk_1003CFF08;
  v19 = self;
  double v6 = &v15;
LABEL_6:
  uint64_t v7 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v5,  "initWithDuration:curve:animations:",  0LL,  v6,  0.4,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
  -[UIViewPropertyAnimator startAnimation](v7, "startAnimation");
LABEL_10:
}

- (void)moveContainerWithLayout:(id)a3 toQuadrant:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  -[PBPIPRootViewController setCurrentQuadrant:](self, "setCurrentQuadrant:", a4);
  if (self->_stashed)
  {
    -[PBPIPRootViewController _moveStashedContainerWithLayout:toQuadrant:animated:]( self,  "_moveStashedContainerWithLayout:toQuadrant:animated:",  v8,  a4,  v5);
  }

  else
  {
    [v8 updateConstraintsForPictureInPictureQuadrant:a4];

    -[PBPIPRootViewController _performMoveContainerToQuadrant:animated:completion:]( self,  "_performMoveContainerToQuadrant:animated:completion:",  a4,  v5,  0LL);
  }

- (void)_moveStashedContainerWithLayout:(id)a3 toQuadrant:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (-[PBPIPStashHintOverlayViewController isHidden](self->_stashHintOverlayViewController, "isHidden"))
  {
    [v8 updateConstraintsForPictureInPictureQuadrant:a4];
    [v8 updateConstraintsForStashedState];
    -[PBPIPStashHintOverlayViewController setQuadrant:](self->_stashHintOverlayViewController, "setQuadrant:", a4);
    -[PBPIPRootViewController _updateStashHintViewPositionalConstraintsForQuadrant:]( self,  "_updateStashHintViewPositionalConstraintsForQuadrant:",  a4);
    -[PBPIPRootViewController _performMoveContainerToQuadrant:animated:completion:]( self,  "_performMoveContainerToQuadrant:animated:completion:",  a4,  0LL,  0LL);
  }

  else
  {
    objc_initWeak(&location, self);
    stashHintOverlayViewController = self->_stashHintOverlayViewController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100179E3C;
    v10[3] = &unk_1003D98B0;
    objc_copyWeak(v12, &location);
    id v11 = v8;
    v12[1] = (id)a4;
    BOOL v13 = v5;
    -[PBPIPStashHintOverlayViewController setHidden:animated:completion:]( stashHintOverlayViewController,  "setHidden:animated:completion:",  1LL,  v5,  v10);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)_performMoveContainerToQuadrant:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  if (v5)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___UISpringTimingParameters);
    double v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v9,  0.75);
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10017A14C;
    v16[3] = &unk_1003D0890;
    objc_copyWeak(&v17, &location);
    -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", v16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10017A188;
    v13[3] = &unk_1003D8648;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    double v14 = v8;
    -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v13);
    -[UIViewPropertyAnimator startAnimation](v10, "startAnimation");

    objc_destroyWeak(v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    [v11 layoutIfNeeded];

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController delegate](self, "delegate"));
    [v12 rootViewController:self didMovePictureInPictureToQuadrant:a3];

    if (v8) {
      v8[2](v8);
    }
  }
}

- (UIEdgeInsets)cumulativePIPInsets
{
  if (self->_splitViewGeometry
    && (-[PBPIPRootViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    -[PBSplitViewInwardSizing insetFrameForEdges:](self->_splitViewGeometry, "insetFrameForEdges:", 14LL);
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewInwardSizing coordinateSpace](self->_splitViewGeometry, "coordinateSpace"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11, v4, v6, v8, v10);
    CGFloat v14 = v13;
    CGFloat v52 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v12 bounds];
    CGFloat v22 = v21;
    CGFloat v47 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v51 = v27;
    v53.origin.CGFloat x = v14;
    v53.origin.CGFloat y = v16;
    v53.size.CGFloat width = v18;
    v53.size.CGFloat height = v20;
    double MinY = CGRectGetMinY(v53);
    v54.origin.CGFloat x = v22;
    v54.origin.CGFloat y = v24;
    v54.size.CGFloat width = v26;
    CGFloat v29 = v26;
    v54.size.CGFloat height = v51;
    double v50 = vabdd_f64(MinY, CGRectGetMinY(v54));
    v55.origin.CGFloat x = v52;
    v55.origin.CGFloat y = v16;
    v55.size.CGFloat width = v18;
    CGFloat rect = v18;
    v55.size.CGFloat height = v20;
    double MaxY = CGRectGetMaxY(v55);
    v56.origin.CGFloat x = v47;
    v56.origin.CGFloat y = v24;
    v56.size.CGFloat width = v26;
    v56.size.CGFloat height = v51;
    double v31 = vabdd_f64(MaxY, CGRectGetMaxY(v56));
    v57.origin.CGFloat x = v52;
    v57.origin.CGFloat y = v16;
    v57.size.CGFloat width = v18;
    v57.size.CGFloat height = v20;
    double MinX = CGRectGetMinX(v57);
    v58.origin.CGFloat x = v47;
    v58.origin.CGFloat y = v24;
    v58.size.CGFloat width = v26;
    v58.size.CGFloat height = v51;
    double v49 = vabdd_f64(MinX, CGRectGetMinX(v58));
    v59.origin.CGFloat x = v52;
    v59.origin.CGFloat y = v16;
    v59.size.CGFloat width = rect;
    v59.size.CGFloat height = v20;
    double MaxX = CGRectGetMaxX(v59);
    v60.origin.CGFloat x = v47;
    v60.origin.CGFloat y = v24;
    v60.size.CGFloat width = v29;
    v60.size.CGFloat height = v51;
    double v34 = vabdd_f64(MaxX, CGRectGetMaxX(v60));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v36 = [v35 userInterfaceLayoutDirection];

    if (v36 == (id)1) {
      double v37 = v49;
    }
    else {
      double v37 = v34;
    }
    if (v36 == (id)1) {
      double v38 = v34;
    }
    else {
      double v38 = v49;
    }
    double v39 = v50;
  }

  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPAvoidanceController pictureInPictureHint](self->_avoidanceController, "pictureInPictureHint"));
    id v11 = v40;
    if (v40)
    {
      [v40 offset];
      if (v41 <= 0.0) {
        double v37 = 80.0 - v41;
      }
      else {
        double v37 = 80.0;
      }
      if (v41 <= 0.0) {
        double v38 = 80.0;
      }
      else {
        double v38 = v41 + 80.0;
      }
      if (v42 <= 0.0)
      {
        double v39 = 60.0;
        double v31 = 60.0 - v42;
      }

      else
      {
        double v31 = 60.0;
        double v39 = v42 + 60.0;
      }
    }

    else
    {
      double v31 = 60.0;
      double v37 = 80.0;
      double v38 = 80.0;
      double v39 = 60.0;
    }
  }

  double v43 = v39;
  double v44 = v38;
  double v45 = v31;
  double v46 = v37;
  result.right = v46;
  result.bottom = v45;
  result.left = v44;
  result.top = v43;
  return result;
}

- (void)updateInsetLayoutGuide
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[NSLayoutConstraint setConstant:](self->_pipInsetLayoutGuideTopConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_pipInsetLayoutGuideBottomConstraint, "setConstant:", -v6);
  -[NSLayoutConstraint setConstant:](self->_pipInsetLayoutGuideLeadingConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_pipInsetLayoutGuideTrailingConstraint, "setConstant:", -v8);
}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPAvoidanceController overlayInsetsReporter](self->_avoidanceController, "overlayInsetsReporter"));
  objc_msgSend(v7, "setOverlayInsets:withTransitionContext:", 0, top, left, bottom, right);
}

- (void)adjustPositionForFocusedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!-[PBPIPRootViewController isEditing](self, "isEditing")
    && !-[PBPIPRootViewController isStashed](self, "isStashed"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    objc_msgSend(v8, "updateConstraintsForFocusedFrame:", x, y, width, height);
  }

- (int64_t)moveToNextQuadrant
{
  uint64_t v3 = sub_1001356C8(self->_currentQuadrant);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  -[PBPIPRootViewController moveContainerWithLayout:toQuadrant:animated:]( self,  "moveContainerWithLayout:toQuadrant:animated:",  v4,  v3,  1LL);
  sub_1000A2678(v3);

  return v3;
}

- (void)nestContainerIntoSplitView
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  [v3 updateConstraintsForNestedSplitView];

  double v4 = objc_alloc_init(&OBJC_CLASS___UISpringTimingParameters);
  double v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v4,  0.75);
  objc_initWeak(&location, self);
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  double v8 = sub_10017A770;
  double v9 = &unk_1003D0890;
  objc_copyWeak(&v10, &location);
  -[UIViewPropertyAnimator addAnimations:](v5, "addAnimations:", &v6);
  -[UIViewPropertyAnimator startAnimation](v5, "startAnimation", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)isHidden
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerViewController]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  unsigned __int8 v5 = [v4 isHidden];

  return v5;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerViewController]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
  double v12 = v11;
  if (v5)
  {
    if (!v6 && [v11 isHidden])
    {
      [v12 setAlpha:0.0];
      [v12 setHidden:0];
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10017A99C;
    v17[3] = &unk_1003D2008;
    id v18 = v12;
    BOOL v19 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10017A9CC;
    v13[3] = &unk_1003DA330;
    id v14 = v18;
    BOOL v16 = v6;
    id v15 = v8;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  v17,  v13);
  }

  else
  {
    [v11 setHidden:v6];
  }
}

- (void)hideControlsHint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerViewController]);
  [v3 hideControlsHint];
}

- (void)setStashed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_stashed != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    id v7 = sub_100083780();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL stashed = self->_stashed;
      *(_DWORD *)buf = 67109376;
      BOOL v26 = stashed;
      __int16 v27 = 1024;
      BOOL v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PiP stash state changed: %d -> %d", buf, 0xEu);
    }

    self->_BOOL stashed = v5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    id v11 = v10;
    if (v5)
    {
      [v10 updateConstraintsForStashedState];

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10017AD08;
      v24[3] = &unk_1003CFF08;
      v24[4] = self;
      double v12 = objc_retainBlock(v24);
    }

    else
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 containerViewController]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
      [v14 setHidden:0];

      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
      [v15 updateConstraintsForStashedState];

      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
      [v16 layoutIfNeeded];

      -[PBPIPRootViewController _destroyStashHintOverlay](self, "_destroyStashHintOverlay");
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
      [v17 updateConstraintsForUnstashedState];

      double v12 = 0LL;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    [v18 setNeedsLayout];

    if (v4)
    {
      BOOL v19 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  35.0,  0.0,  0.0);
      CGFloat v20 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v19,  0.0);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10017AD8C;
      v23[3] = &unk_1003CFF08;
      v23[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v20, "addAnimations:", v23);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10017ADBC;
      v21[3] = &unk_1003D3F80;
      CGFloat v22 = v12;
      -[UIViewPropertyAnimator addCompletion:](v20, "addCompletion:", v21);
      -[UIViewPropertyAnimator startAnimation](v20, "startAnimation");
    }

    else
    {
      BOOL v19 = (UISpringTimingParameters *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
      -[UISpringTimingParameters layoutIfNeeded](v19, "layoutIfNeeded");
    }
  }

- (void)_createStashHintOverlayIfNeeded
{
  if (!self->_stashHintOverlayViewController)
  {
    int64_t v3 = -[PBPIPRootViewController currentQuadrant](self, "currentQuadrant");
    BOOL v4 = -[PBPIPStashHintOverlayViewController initWithQuadrant:]( objc_alloc(&OBJC_CLASS___PBPIPStashHintOverlayViewController),  "initWithQuadrant:",  v3);
    stashHintOverlayViewController = self->_stashHintOverlayViewController;
    self->_stashHintOverlayViewController = v4;

    -[PBPIPStashHintOverlayViewController setHidden:](self->_stashHintOverlayViewController, "setHidden:", 1LL);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self->_stashHintOverlayViewController, "view"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    [v7 addSubview:v6];

    -[PBPIPStashHintOverlayViewController visualEffectViewBorderWidth]( self->_stashHintOverlayViewController,  "visualEffectViewBorderWidth");
    double v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 leftAnchor]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 leftAnchor]);
    double v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12 constant:-v9]);
    stashHintViewLeftConstraint = self->_stashHintViewLeftConstraint;
    self->_stashHintViewLeftConstraint = v13;

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 rightAnchor]);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 rightAnchor]);
    id v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17 constant:v9]);
    stashHintViewRightConstraint = self->_stashHintViewRightConstraint;
    self->_stashHintViewRightConstraint = v18;

    CGFloat v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 containerViewController]);
    CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue([v21 view]);

    double v23 = (void *)objc_claimAutoreleasedReturnValue([v6 centerYAnchor]);
    CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue([v22 centerYAnchor]);
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
    [v25 setActive:1];

    -[PBPIPRootViewController _updateStashHintViewPositionalConstraintsForQuadrant:]( self,  "_updateStashHintViewPositionalConstraintsForQuadrant:",  v3);
  }

- (void)_updateStashHintViewPositionalConstraintsForQuadrant:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    BOOL v4 = (&off_1003DA3F8)[a3];
    [*(id *)((char *)&self->super.super.super.isa + *(&off_1003DA3D8)[a3]) setActive:1];
    [*(id *)((char *)&self->super.super.super.isa + *v4) setActive:0];
  }

- (void)_destroyStashHintOverlay
{
  stashHintOverlayViewController = self->_stashHintOverlayViewController;
  if (stashHintOverlayViewController)
  {
    -[PBPIPStashHintOverlayViewController setHidden:](stashHintOverlayViewController, "setHidden:", 1LL);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self->_stashHintOverlayViewController, "view"));
    [v4 removeFromSuperview];

    BOOL v5 = self->_stashHintOverlayViewController;
    self->_stashHintOverlayViewController = 0LL;
  }

  stashHintViewLeftConstraint = self->_stashHintViewLeftConstraint;
  self->_stashHintViewLeftConstraint = 0LL;

  stashHintViewRightConstraint = self->_stashHintViewRightConstraint;
  self->_stashHintViewRightConstraint = 0LL;
}

- (id)_createStateMachine
{
  int64_t v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  BOOL v4 = (objc_class *)objc_opt_class(self);
  BOOL v5 = NSStringFromClass(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Idle",  0LL,  0LL);

  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10017B594;
  v29[3] = &unk_1003D0990;
  objc_copyWeak(&v30, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare Start",  @"Idle",  v29);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10017B60C;
  v27[3] = &unk_1003D0990;
  objc_copyWeak(&v28, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Perform Start",  @"Preparing Start",  v27);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v7,  "registerDefaultHandlerForEvent:withBlock:",  @"Prepare Stop",  &stru_1003DA350);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10017B8B8;
  v25[3] = &unk_1003D0990;
  objc_copyWeak(&v26, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare Stop",  @"Presented",  v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10017B900;
  v23[3] = &unk_1003D0990;
  objc_copyWeak(&v24, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Perform Stop",  @"Idle",  v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10017BCCC;
  v21[3] = &unk_1003D0990;
  objc_copyWeak(&v22, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare Start",  @"Presented",  v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10017BD98;
  v19[3] = &unk_1003D0990;
  objc_copyWeak(&v20, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Perform Start",  @"Preparing Swap",  v19);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10017BE68;
  v17[3] = &unk_1003D0990;
  objc_copyWeak(&v18, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare Stop",  @"Preparing Swap",  v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  id v15[2] = sub_10017C00C;
  v15[3] = &unk_1003D0990;
  objc_copyWeak(&v16, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Perform Swap",  @"Preparing Swap",  v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10017C270;
  v13[3] = &unk_1003D0990;
  objc_copyWeak(&v14, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Perform Stop",  @"Performing Swap",  v13);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v7,  "registerDefaultHandlerForEvent:withBlock:",  @"Deactivating Layout",  &stru_1003DA370);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017C494;
  v11[3] = &unk_1003D0990;
  objc_copyWeak(&v12, location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Deactivating Layout",  @"Performing Swap",  v11);
  id v8 = sub_100083780();
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[TVSStateMachine setLogObject:](v7, "setLogObject:", v9);

  -[TVSStateMachine setShouldAcceptEvents:](v7, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
  return v7;
}

- (void)_handlePrepareStartRequestWithLayout:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containerViewController]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pictureInPictureViewController]);

  unsigned int v10 = objc_msgSend(v6, "bs_BOOLForKey:", @"Isolated");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  unsigned int v12 = [v11 isEqual:@"Presented"];

  if (v12)
  {
    [v7 updateConstraintsFittingParentView];
    [v7 preferredIntrinsicSize];
  }

  else
  {
    if (v10)
    {
      [v7 updateConstraintsForPictureInPictureQuadrant:self->_currentQuadrant];
      [v7 preferredIntrinsicSize];
      objc_msgSend(v9, "updateHostedWindowSize:");
      [v9 showChrome:1 animated:0];
      goto LABEL_7;
    }

    [v7 updateConstraintsFillingWorkspaceApplicationHostingView];
    [v7 preferredFullscreenSize];
  }

  objc_msgSend(v9, "updateHostedWindowSize:");
LABEL_7:
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v7 containerViewController]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parentViewController]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 view]);

  [v15 layoutIfNeeded];
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Completion Handler"]);
  double v17 = (void *)v16;
  if (v16) {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

- (void)_handlePrepareStopRequestWithUserInfo:(id)a3
{
  id v4 = a3;
  -[PBPIPRootViewController setPresentationState:](self, "setPresentationState:", 3LL);
  objc_initWeak(&location, self);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController stateMachine](self, "stateMachine"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017C874;
  v8[3] = &unk_1003D9D78;
  id v6 = v4;
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  [v5 executeBlockAfterCurrentStateTransition:v8];

  if (-[PBPIPRootViewController isEditing](self, "isEditing"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsDelegate);
    [WeakRetained controlsProvider:self didRequestEditingControlsDismissalWithAnimationStyle:2];
  }

  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)setPresentationState:(unint64_t)a3
{
  if (self->_presentationState != a3)
  {
    self->_presentationState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rootViewController:self didUpdatePresentationState:a3];
  }

- (BOOL)isVisibleAndSplitViewNested
{
  return !-[PBPIPRootViewController isHidden](self, "isHidden")
      && !self->_stashed
      && (id)-[PBPIPRootViewController appearanceStyle](self, "appearanceStyle") == (id)1
      && self->_presentationState == 2;
}

- (unint64_t)containerViewControllerPreferredControlsLayoutStyle:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pictureInPictureViewController]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationForBundleIdentifier:v8]);

  unsigned int v10 = [v9 isFaceTime];
  if ((id)-[PBPIPRootViewController appearanceStyle](self, "appearanceStyle") == (id)1) {
    unint64_t v11 = 2LL;
  }
  else {
    unint64_t v11 = v10;
  }

  return v11;
}

- (void)containerViewController:(id)a3 prepareStartAnimationWithInitialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = sub_100083780();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[PBPIPRootViewController containerViewController:prepareStartAnimationWithInitialLayerFrame:completionHandler:]";
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", x, y, width, height));
  id v16 = objc_retainBlock(v12);

  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  double v17 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  CGRectIsNull(v27),  @"Layer Frame Value",  @"Completion Handler",  @"Isolated",  v15,  v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v22[2] = v18;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  &v21,  3LL));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v11));
  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Prepare Start",  v20,  v19);
}

- (void)containerViewController:(id)a3 performStartAnimationWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100083780();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[PBPIPRootViewController containerViewController:performStartAnimationWithCompletionHandler:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s, containerViewController: %@",  (uint8_t *)&v10,  0x16u);
  }

  -[PBPIPRootViewController _containerViewController:performStartAnimationInIsolation:completionHandler:]( self,  "_containerViewController:performStartAnimationInIsolation:completionHandler:",  v6,  0LL,  v7);
}

- (void)_containerViewController:(id)a3 performStartAnimationInIsolation:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v13[0] = @"Completion Handler";
  id v8 = a3;
  id v9 = objc_retainBlock(a5);
  v13[1] = @"Isolated";
  v14[0] = v9;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v8));
  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Perform Start",  v12,  v11);
}

- (void)containerViewController:(id)a3 prepareStopAnimationWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100083780();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[PBPIPRootViewController containerViewController:prepareStopAnimationWithCompletionHandler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  id v13 = @"Completion Handler";
  id v10 = objc_retainBlock(v7);

  id v14 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v6,  v13));
  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Prepare Stop",  v12,  v11);
}

- (void)containerViewController:(id)a3 performStopAnimationWithFinalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = sub_100083780();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[PBPIPRootViewController containerViewController:performStopAnimationWithFinalLayerFrame:completionHandler:]";
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", x, y, width, height));
  id v16 = objc_retainBlock(v12);

  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  __int16 v17 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  CGRectIsNull(v27),  @"Layer Frame Value",  @"Completion Handler",  @"Isolated",  v15,  v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v22[2] = v18;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  &v21,  3LL));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v11));
  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Perform Stop",  v20,  v19);
}

- (void)containerViewController:(id)a3 performStartInIsolationWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100083780();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v19 = "-[PBPIPRootViewController containerViewController:performStartInIsolationWithCompletionHandler:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  id v15[2] = sub_10017D310;
  v15[3] = &unk_1003D2F08;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  id v13 = v7;
  id v14 = v6;
  -[PBPIPRootViewController containerViewController:prepareStartAnimationWithInitialLayerFrame:completionHandler:]( self,  "containerViewController:prepareStartAnimationWithInitialLayerFrame:completionHandler:",  v14,  v15,  CGRectNull.origin.x,  y,  width,  height);
}

- (void)containerViewController:(id)a3 performStopInIsolationWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100083780();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[PBPIPRootViewController containerViewController:performStopInIsolationWithCompletionHandler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  id v12[2] = sub_10017D50C;
  v12[3] = &unk_1003D2F08;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  -[PBPIPRootViewController containerViewController:prepareStopAnimationWithCompletionHandler:]( self,  "containerViewController:prepareStopAnimationWithCompletionHandler:",  v11,  v12);
}

- (void)containerViewController:(id)a3 playbackSourceDidUpdateRoutingVideoToHostedWindow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100083780();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    id v13 = "-[PBPIPRootViewController containerViewController:playbackSourceDidUpdateRoutingVideoToHostedWindow:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s, containerViewController: %@, isRouting: %d",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPIPSwapContext startingRequest](self->_swapContext, "startingRequest"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layout]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 containerViewController]);

  if (v11 == v6) {
    -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Starting Content Routed To Host Window",  0LL,  0LL);
  }
}

- (void)containerViewControllerDidChangePreferredContentSize:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083780();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[PBPIPRootViewController containerViewControllerDidChangePreferredContentSize:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, containerViewController: %@", buf, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
  [v7 layoutIfNeeded];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPRootViewController _layoutForContainerViewController:]( self,  "_layoutForContainerViewController:",  v4));
  [v8 updateConstraintsForPreferredPictureInPictureSize];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containerViewController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pictureInPictureViewController]);
  [v8 preferredPictureInPictureSize];
  objc_msgSend(v10, "updateHostedWindowSize:");

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[BSAnimationSettings settingsWithDuration:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:",  0.25));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  id v12[2] = sub_10017D8A4;
  v12[3] = &unk_1003CFF08;
  v12[4] = self;
  +[BSUIAnimationFactory animateWithSettings:actions:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:",  v11,  v12);
}

- (void)containerViewControllerLayoutDidUpdateConstraints:(id)a3
{
  id v4 = a3;
  if (![v4 state])
  {
    int64_t currentQuadrant = self->_currentQuadrant;
    objc_msgSend(v4, "preferredPictureInPictureFrameForQuadrant:pipInsets:", currentQuadrant, 60.0, 80.0, 60.0, 80.0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPAvoidanceController setPictureInPictureFrame:]( self->_avoidanceController,  "setPictureInPictureFrame:"));
    id v15 = sub_100083780();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100288E18(v14, currentQuadrant, v16);
    }

    -[PBPIPRootViewController updateInsetLayoutGuide](self, "updateInsetLayoutGuide");
    splitViewGeometrdouble y = self->_splitViewGeometry;
    if (splitViewGeometry)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewInwardSizing coordinateSpace](splitViewGeometry, "coordinateSpace"));
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController view](self, "view"));
      objc_msgSend(v19, "convertRect:toCoordinateSpace:", v18, v7, v9, v11, v13);
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;

      v29.origin.double x = v21;
      v29.origin.double y = v23;
      v29.size.double width = v25;
      v29.size.double height = v27;
      double Height = CGRectGetHeight(v29);
      if (Height > 0.0) {
        double Height = Height + 20.0;
      }
      -[PBSplitViewInwardSizing setSafeAreaInsetTop:](self->_splitViewGeometry, "setSafeAreaInsetTop:", Height);
    }
  }
}

- (void)pictureInPictureAvoidanceController:(id)a3 didReceiveHint:(id)a4 withTransitionContext:(id)a5
{
  id v6 = a5;
  -[PBPIPRootViewController updateInsetLayoutGuide](self, "updateInsetLayoutGuide");
  if (!v6)
  {
    id v7 = [(id)objc_opt_class(self) _defaultTransitionContext];
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController viewIfLoaded](self, "viewIfLoaded"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 windowScene]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  id v12[2] = sub_10017DB2C;
  v12[3] = &unk_1003CFEE0;
  id v13 = v8;
  id v11 = v8;
  +[PBSOverlayLayoutTransitionContext tryAnimatingWithContext:scene:actions:completion:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "tryAnimatingWithContext:scene:actions:completion:",  v6,  v10,  v12,  0LL);
}

- (int64_t)controlsDidSelectMovePictureInPictureToNextQuadrant:(id)a3
{
  return -[PBPIPRootViewController moveToNextQuadrant](self, "moveToNextQuadrant", a3);
}

- (void)controlsDidSelectStopPictureInPicture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
  [WeakRetained rootViewController:self didStopPictureInPictureForApplication:v6];
}

- (void)controlsDidSelectCancelPictureInPicture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
  [WeakRetained rootViewController:self didCancelPictureInPictureForApplication:v6];

  sub_1000A2590(@"SystemControls");
}

- (void)controlsDidSelectTogglePictureInPictureStashing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rootViewControllerDidToggleStashing:self];
}

- (void)controlsDidSelectEnterSplitView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
  [WeakRetained rootViewControllerDidRequestEnterSplitView:self forApplication:v6];
}

- (void)controlsDidSelectDismissControls:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsDelegate);
  [WeakRetained controlsProvider:self didRequestEditingControlsDismissalWithAnimationStyle:1];
}

- (void)controlsDidSelectTogglePlayPause:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rootViewControllerDidRequestTogglePlayPause:self];
}

- (void)controls:(id)a3 requestPagingSkipByNumberOfPages:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 containerViewController]);
  [v7 showPagingAccessoryAnimated];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rootViewControllerDidRequestPagingSkipByNumberOfPages:a4 forApplication:v9];
}

- (BOOL)isEditingControlsVisible
{
  return -[PBPIPRootViewController isEditing](self, "isEditing");
}

- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4
{
}

- (void)stopPictureInPicture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
  [WeakRetained rootViewController:self didStopPictureInPictureForApplication:v5];
}

- (void)cancelPictureInPicture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
  [WeakRetained rootViewController:self didCancelPictureInPictureForApplication:v5];
}

- (void)movePictureInPicture
{
}

- (void)_updateLayoutForAppearanceStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = -[PBPIPRootViewController appearanceStyle](self, "appearanceStyle");
  if (v7 == 1)
  {
    -[PBPIPRootViewController nestContainerIntoSplitView](self, "nestContainerIntoSplitView");
  }

  else if (!v7)
  {
    -[PBPIPRootViewController moveContainerWithLayout:toQuadrant:animated:]( self,  "moveContainerWithLayout:toQuadrant:animated:",  v6,  -[PBPIPRootViewController currentQuadrant](self, "currentQuadrant"),  v4);
  }
}

- (id)_layoutForContainerViewController:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController containerViewControllerLayouts](self, "containerViewControllerLayouts", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerViewController]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_layoutForContainerViewControllerState:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController containerViewControllerLayouts](self, "containerViewControllerLayouts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 state] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)_activePictureInPictureBundleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController pictureInPictureLayout](self, "pictureInPictureLayout"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 application]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  return v4;
}

- (void)_updateDisplayLayoutElementBundleIDWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPRootViewController _activePictureInPictureBundleID](self, "_activePictureInPictureBundleID"));
  displayLayoutElementHandle = self->_displayLayoutElementHandle;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017E2D8;
  v8[3] = &unk_1003DA398;
  id v9 = v5;
  id v7 = v5;
  -[PBDisplayLayoutElementHandle update:withReason:](displayLayoutElementHandle, "update:withReason:", v8, v4);
}

+ (id)_defaultTransitionContext
{
  if (qword_1004711C0 != -1) {
    dispatch_once(&qword_1004711C0, &stru_1003DA3B8);
  }
  id v2 = [(id)qword_1004711B8 copy];
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  v2,  0LL));

  return v3;
}

- (PBPictureInPictureControlsDelegate)controlsDelegate
{
  return (PBPictureInPictureControlsDelegate *)objc_loadWeakRetained((id *)&self->_controlsDelegate);
}

- (void)setControlsDelegate:(id)a3
{
}

- (PBPIPRootViewControllerDelegate)delegate
{
  return (PBPIPRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentQuadrant
{
  return self->_currentQuadrant;
}

- (void)setCurrentQuadrant:(int64_t)a3
{
  self->_int64_t currentQuadrant = a3;
}

- (BOOL)shouldShowControlsHintOnActivation
{
  return self->_shouldShowControlsHintOnActivation;
}

- (void)setShouldShowControlsHintOnActivation:(BOOL)a3
{
  self->_shouldShowControlsHintOnActivation = a3;
}

- (PBDisplayLayoutElementHandle)displayLayoutElementHandle
{
  return self->_displayLayoutElementHandle;
}

- (void)setDisplayLayoutElementHandle:(id)a3
{
}

- (UILayoutGuide)pipInsetLayoutGuide
{
  return self->_pipInsetLayoutGuide;
}

- (void)setPipInsetLayoutGuide:(id)a3
{
}

- (PBSplitViewInwardSizing)splitViewGeometry
{
  return self->_splitViewGeometry;
}

- (BOOL)isStashed
{
  return self->_stashed;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (NSMutableSet)containerViewControllerLayouts
{
  return self->_containerViewControllerLayouts;
}

- (PBPIPAvoidanceController)avoidanceController
{
  return self->_avoidanceController;
}

- (BSInvalidatable)editingAvoidancePausedAssertion
{
  return self->_editingAvoidancePausedAssertion;
}

- (PBPIPStashHintOverlayViewController)stashHintOverlayViewController
{
  return self->_stashHintOverlayViewController;
}

- (NSLayoutConstraint)stashHintViewLeftConstraint
{
  return self->_stashHintViewLeftConstraint;
}

- (NSLayoutConstraint)stashHintViewRightConstraint
{
  return self->_stashHintViewRightConstraint;
}

- (NSLayoutConstraint)pipInsetLayoutGuideTopConstraint
{
  return self->_pipInsetLayoutGuideTopConstraint;
}

- (void)setPipInsetLayoutGuideTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)pipInsetLayoutGuideBottomConstraint
{
  return self->_pipInsetLayoutGuideBottomConstraint;
}

- (void)setPipInsetLayoutGuideBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)pipInsetLayoutGuideLeadingConstraint
{
  return self->_pipInsetLayoutGuideLeadingConstraint;
}

- (void)setPipInsetLayoutGuideLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pipInsetLayoutGuideTrailingConstraint
{
  return self->_pipInsetLayoutGuideTrailingConstraint;
}

- (void)setPipInsetLayoutGuideTrailingConstraint:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (_PBPIPSwapContext)swapContext
{
  return self->_swapContext;
}

- (void).cxx_destruct
{
}

@end