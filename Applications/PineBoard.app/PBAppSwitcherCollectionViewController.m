@interface PBAppSwitcherCollectionViewController
- (BOOL)_activateItem:(id)a3;
- (BOOL)_servicePendingUpdatesWithAnimation:(BOOL)a3;
- (BOOL)_shouldScrollToItem:(id)a3 scrollIfNeeded:(BOOL)a4 forced:(BOOL)a5;
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)isPanningHorizontally;
- (BOOL)isPanningVertically;
- (BOOL)isScrolling;
- (BOOL)peekEffectEnabled;
- (CGPoint)_preferredContentOffsetForIndexPath:(id)a3;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)initialDragLocation;
- (NSIndexPath)preferredIndexPath;
- (PBAppSwitcherCollectionViewController)initWithCoder:(id)a3;
- (PBAppSwitcherCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBAppSwitcherCollectionViewController)initWithWorkspaceGeometry:(id)a3 dataSource:(id)a4;
- (PBAppSwitcherDataSource)appSwitcherDataSource;
- (PBAppSwitcherItem)focusedItem;
- (PBAppSwitcherItem)killedItem;
- (PBAppSwitcherItem)pendingLaunchItem;
- (PBAppSwitcherTitleView)titleView;
- (PBWorkspaceGeometry)workspaceGeometry;
- (TVSStateMachine)stateMachine;
- (UIInterpolatingMotionEffect)peekEffect;
- (UIPanGestureRecognizer)panRecognizer;
- (UITapGestureRecognizer)upRecognizer;
- (UIViewPropertyAnimator)switcherAnimator;
- (_PBAppSwitcherCollectionView)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dismissalCompletion;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)launchCompletionHandler;
- (id)preferredFocusEnvironments;
- (id)presentationCompletion;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)__applyPendingUpdatesToCollectionView;
- (void)_activatePendingLaunchItem;
- (void)_cancelKillSwipeWithVelocity:(double)a3 completion:(id)a4;
- (void)_finishKillSwipeWithVelocity:(double)a3 completion:(id)a4;
- (void)_handleCollectionViewUpdatesWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)_initializeStateMachine;
- (void)_invalidateSceneViewForCell:(id)a3;
- (void)_launchItem:(id)a3 shouldAnimateLayoutSwitch:(BOOL)a4;
- (void)_prepareToLaunchItemImmediately:(id)a3;
- (void)_setKillGestureRecognizersEnabled:(BOOL)a3;
- (void)_showAppSwitcher;
- (void)_updateKillSwipeWithOffset:(double)a3;
- (void)_userInterfaceStyleDidChange;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dataSource:(id)a3 didReceiveLaunchRequestForItem:(id)a4 completion:(id)a5;
- (void)dataSourceDidEnqueuePendingUpdates:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)invalidateSceneLayoutElements;
- (void)panGestureRecognizerMoved:(id)a3;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDismissalCompletion:(id)a3;
- (void)setFocusedItem:(id)a3;
- (void)setInitialDragLocation:(CGPoint)a3;
- (void)setKilledItem:(id)a3;
- (void)setLaunchCompletionHandler:(id)a3;
- (void)setPanningHorizontally:(BOOL)a3;
- (void)setPanningVertically:(BOOL)a3;
- (void)setPeekEffectEnabled:(BOOL)a3;
- (void)setPendingLaunchItem:(id)a3;
- (void)setPreferredIndexPath:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setSwitcherAnimator:(id)a3;
- (void)setTitleView:(id)a3;
- (void)transitionToSwitcherWithCompletion:(id)a3;
- (void)upDoubleTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PBAppSwitcherCollectionViewController

- (PBAppSwitcherCollectionViewController)initWithCoder:(id)a3
{
  return 0LL;
}

- (PBAppSwitcherCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0LL;
}

- (PBAppSwitcherCollectionViewController)initWithWorkspaceGeometry:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewController;
  v9 = -[PBAppSwitcherCollectionViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workspaceGeometry, a3);
    objc_storeStrong((id *)&v10->_appSwitcherDataSource, a4);
    -[PBAppSwitcherDataSource setDelegate:](v10->_appSwitcherDataSource, "setDelegate:", v10);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    id v12 =  -[PBAppSwitcherCollectionViewController registerForTraitChanges:withAction:]( v10,  "registerForTraitChanges:withAction:",  v11,  "_userInterfaceStyleDidChange");

    -[PBAppSwitcherCollectionViewController _initializeStateMachine](v10, "_initializeStateMachine");
  }

  return v10;
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewController;
  -[PBAppSwitcherCollectionViewController viewDidLoad](&v54, "viewDidLoad");
  v3 = -[PBAppSwitcherFullFocusLayout initWithWorkspaceGeometry:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherFullFocusLayout),  "initWithWorkspaceGeometry:",  self->_workspaceGeometry);
  v4 = objc_alloc(&OBJC_CLASS____PBAppSwitcherCollectionView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v5 bounds];
  CGRect v60 = CGRectInset(v59, -1920.0, 0.0);
  v6 = -[_PBAppSwitcherCollectionView initWithFrame:collectionViewLayout:]( v4,  "initWithFrame:collectionViewLayout:",  v3,  v60.origin.x,  v60.origin.y,  v60.size.width,  v60.size.height);
  collectionView = self->_collectionView;
  self->_collectionView = v6;

  -[_PBAppSwitcherCollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18LL);
  -[_PBAppSwitcherCollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 2400.0, 0.0, 2400.0);
  -[_PBAppSwitcherCollectionView setContentInsetAdjustmentBehavior:]( self->_collectionView,  "setContentInsetAdjustmentBehavior:",  2LL);
  -[_PBAppSwitcherCollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0LL);
  -[_PBAppSwitcherCollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[_PBAppSwitcherCollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  id v8 = self->_collectionView;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherCollectionViewCell);
  v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBAppSwitcherCollectionViewCell);
  v11 = NSStringFromClass(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[_PBAppSwitcherCollectionView registerClass:forCellWithReuseIdentifier:]( v8,  "registerClass:forCellWithReuseIdentifier:",  v9,  v12);

  id v13 = sub_100082664();
  objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    id v16 = [v15 count];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    *(_DWORD *)buf = 134218242;
    id v56 = v16;
    __int16 v57 = 2112;
    v58 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initial items(%lu) %@", buf, 0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource focusedProcessItem](self->_appSwitcherDataSource, "focusedProcessItem"));
  id v20 = [v18 indexOfObject:v19];

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v20,  0LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  v23 = (PBAppSwitcherItem *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:v20]);
  focusedItem = self->_focusedItem;
  self->_focusedItem = v23;

  objc_storeStrong((id *)&self->_preferredIndexPath, v21);
  -[PBAppSwitcherFullFocusLayout setOriginIndexPath:](v3, "setOriginIndexPath:", v21);
  v25 = self->_collectionView;
  -[PBAppSwitcherCollectionViewController _preferredContentOffsetForIndexPath:]( self,  "_preferredContentOffsetForIndexPath:",  v21);
  -[_PBAppSwitcherCollectionView setContentOffset:animated:](v25, "setContentOffset:animated:", 0LL);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v26 addSubview:self->_collectionView];

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v28 = [v27 userInterfaceLayoutDirection];

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v29 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherTitleView);
    titleView = self->_titleView;
    self->_titleView = v29;

    v31 = self->_titleView;
    double v32 = 0.75;
    if (v28 == (id)1) {
      double v32 = -0.75;
    }
    CGAffineTransformMakeScale(&v53, v32, 0.75);
    -[PBAppSwitcherTitleView setTransform:](v31, "setTransform:", &v53);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v33 addSubview:self->_titleView];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v34 sendSubviewToBack:self->_titleView];
  }

  v35 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "upDoubleTapped:");
  upRecognizer = self->_upRecognizer;
  self->_upRecognizer = v35;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_upRecognizer, "setAllowedPressTypes:", &off_1003FE7E8);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_upRecognizer, "setNumberOfTapsRequired:", 2LL);
  -[UITapGestureRecognizer setEnabled:](self->_upRecognizer, "setEnabled:", 0LL);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v37 addGestureRecognizer:self->_upRecognizer];

  v38 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  self,  "panGestureRecognizerMoved:");
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v38;

  -[UIPanGestureRecognizer setEnabled:](self->_panRecognizer, "setEnabled:", 0LL);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v40 addGestureRecognizer:self->_panRecognizer];

  v41 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionX",  0LL);
  peekEffect = self->_peekEffect;
  self->_peekEffect = v41;

  if (v28 == (id)1)
  {
    v43 = self->_collectionView;
    CGAffineTransformMakeScale(&v52, -1.0, 1.0);
    -[_PBAppSwitcherCollectionView setTransform:](v43, "setTransform:", &v52);
    double v44 = 1.2;
    double v45 = -1.2;
  }

  else
  {
    double v44 = -1.2;
    double v45 = 1.2;
  }

  v46 = self->_peekEffect;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v45));
  -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v46, "setMinimumRelativeValue:", v47);

  v48 = self->_peekEffect;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44));
  -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v48, "setMaximumRelativeValue:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 focusCoordinator]);
  [v51 addObserver:self];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusCoordinator]);
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewController;
  -[PBAppSwitcherCollectionViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewController;
  -[PBAppSwitcherCollectionViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  if (self->_titleView)
  {
    -[PBWorkspaceGeometry bounds](self->_workspaceGeometry, "bounds");
    CGFloat x = v11.origin.x;
    CGFloat y = v11.origin.y;
    double width = v11.size.width;
    double height = v11.size.height;
    double v7 = CGRectZero.origin.y;
    CGFloat v8 = CGRectGetWidth(v11) + -60.0;
    -[PBAppSwitcherTitleView sizeThatFits:](self->_titleView, "sizeThatFits:", width, height);
    -[PBAppSwitcherTitleView setBounds:](self->_titleView, "setBounds:", CGRectZero.origin.x, v7, v8, v9);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    -[PBAppSwitcherTitleView setCenter:](self->_titleView, "setCenter:", CGRectGetWidth(v12) * 0.5, 87.0);
  }

- (id)preferredFocusEnvironments
{
  if (self->_collectionView)
  {
    collectionView = self->_collectionView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &collectionView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)_userInterfaceStyleDidChange
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionViewLayout]);
  [v3 invalidateLayout];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewController;
  id v6 = a3;
  -[PBAppSwitcherCollectionViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v14,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedView", v14.receiver, v14.super_class));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  unsigned __int8 v9 = [v7 isDescendantOfView:v8];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  CGRect v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  unsigned int v12 = [v10 isDescendantOfView:v11];

  if ((v9 & 1) == 0)
  {
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController stateMachine](self, "stateMachine"));
      [v13 postEvent:@"Collection View Did Accept Focus"];
    }
  }

- (void)transitionToSwitcherWithCompletion:(id)a3
{
  if (a3)
  {
    id v6 = @"Completion Handler";
    id v4 = [a3 copy];
    id v7 = v4;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    objc_super v5 = 0LL;
  }

  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Show Switcher",  0LL,  v5);
}

- (void)invalidateSceneLayoutElements
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 visibleCells]);

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      CGFloat v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[PBAppSwitcherCollectionViewController _invalidateSceneViewForCell:]( self,  "_invalidateSceneViewForCell:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        CGFloat v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGFloat v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBAppSwitcherCollectionViewCell);
  __int128 v9 = NSStringFromClass(v8);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6]);

  if (v11)
  {
    id v12 = [v6 item];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v12]);

    [v11 setAppSwitcherItem:v14];
  }

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appSwitcherItem]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v7)
  {
    CGFloat v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v7,  @"default"));
    __int128 v9 = -[PBSceneHandle initWithSceneIdentity:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___PBSceneHandle),  "initWithSceneIdentity:bundleIdentifier:",  v8,  v7);
    __int128 v10 = -[PBApplicationSceneView initWithSceneHandle:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBApplicationSceneView),  "initWithSceneHandle:layoutLevel:",  v9,  2LL);
    else {
      uint64_t v11 = 1LL;
    }
    -[PBApplicationSceneView setPresentationMode:](v10, "setPresentationMode:", v11);
    -[PBApplicationSceneView setWallpaperEnabled:](v10, "setWallpaperEnabled:", 1LL);
    -[PBApplicationSceneView setEligibleForFocus:](v10, "setEligibleForFocus:", 0LL);
    -[PBApplicationSceneView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0LL);
    [v5 setSceneView:v10];
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherCollectionViewCell);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v12);

    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v15 = sub_100082664();
    CGFloat v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v16[0] = 67109632;
      v16[1] = isKindOfClass & 1;
      __int16 v17 = 1024;
      BOOL v18 = v6 != 0LL;
      __int16 v19 = 1024;
      BOOL v20 = v14 == 0LL;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "App Switcher displaying cell with no bundle id - isCorrectCellClass: %d, hasAppSwitcherItem: %d, hasBundleID: %d",  (uint8_t *)v16,  0x14u);
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  killedItem = self->_killedItem;
  self->_killedItem = 0LL;
  id v7 = a4;

  -[PBAppSwitcherCollectionViewController _invalidateSceneViewForCell:](self, "_invalidateSceneViewForCell:", v7);
  [v7 setSceneView:0];
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  return self->_preferredIndexPath;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5 = a4;
  if (-[PBAppSwitcherCollectionViewController isScrolling](self, "isScrolling")
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState")),
        unsigned __int8 v7 = [v6 isEqual:@"Showing Switcher"],
        v6,
        (v7 & 1) != 0))
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 nextFocusedIndexPath]);
    unsigned __int8 v8 = [v9 isEqual:self->_preferredIndexPath];
  }

  return v8;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  unsigned __int8 v7 = v6;
  if (v6)
  {
    unsigned __int8 v8 = (NSIndexPath *)[v6 copy];
    preferredIndexPath = self->_preferredIndexPath;
    self->_preferredIndexPath = v8;

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    uint64_t v11 = (PBAppSwitcherItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item")));
    focusedItem = self->_focusedItem;
    self->_focusedItem = v11;

    titleView = self->_titleView;
    if (titleView)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10014DB64;
      v14[3] = &unk_1003CFF08;
      v14[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  titleView,  5242885LL,  v14,  0LL,  0.5);
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "item", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v5]);

  __int128 v9 = @"AppSwitcherItem";
  __int128 v10 = v7;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Activate Item",  0LL,  v8);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  focusedItem = self->_focusedItem;
  if (focusedItem)
  {
    id v6 = @"AppSwitcherItem";
    unsigned __int8 v7 = focusedItem;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v5 = 0LL;
  }

  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Scroll Animation Complete",  0LL,  v5);
}

- (void)upDoubleTapped:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[PBAppSwitcherCollectionViewController upDoubleTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v7 = [v4 state];
  if (v7 == (id)3
    && -[PBAppSwitcherDataSource canKillItem:](self->_appSwitcherDataSource, "canKillItem:", self->_focusedItem))
  {
    id v8 = sub_100082664();
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      focusedItem = self->_focusedItem;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)focusedItem;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Up double tapped, kill %@", buf, 0xCu);
    }

    v12[0] = @"Swipe Offset";
    v12[1] = @"Swipe Velocity";
    v13[0] = &off_1003FEB40;
    v13[1] = &off_1003FEB50;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Kill Gesture Succeeded",  0LL,  v11);
  }

- (void)panGestureRecognizerMoved:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[PBAppSwitcherCollectionViewController panGestureRecognizerMoved:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v4 velocityInView:v7];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
  [v4 translationInView:v12];
  double v14 = v13;
  double v16 = v15;

  id v17 = [v4 state];
  switch((unint64_t)v17)
  {
    case 1uLL:
      self->_initialDragLocation.CGFloat x = v14;
      self->_initialDragLocation.CGFloat y = v16;
      return;
    case 2uLL:
      if (self->_panningVertically) {
        goto LABEL_12;
      }
      if (self->_panningHorizontally) {
        goto LABEL_27;
      }
      p_initialDragLocation = &self->_initialDragLocation;
      double v47 = vabdd_f64(v16, self->_initialDragLocation.y);
      double v48 = fabs(v11);
      double v49 = fabs(v9);
      double v50 = vabdd_f64(v14, self->_initialDragLocation.x);
      BOOL v51 = v47 <= 125.0 || v48 <= v49;
      BOOL v52 = !v51 && v50 < v47;
      if (v52
        && -[PBAppSwitcherDataSource canKillItem:]( self->_appSwitcherDataSource,  "canKillItem:",  self->_focusedItem,  v48))
      {
        BOOL v53 = 0;
        BOOL v54 = 1;
        CGFloat x = v16;
LABEL_54:
        self->_initialDragLocation.CGFloat y = x;
        goto LABEL_55;
      }

      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      BOOL v53 = 0;
      if (IsReduceMotionEnabled)
      {
        BOOL v57 = v50 <= 30.0 || v50 <= v47;
        BOOL v54 = 0;
        if (!v57)
        {
          BOOL v54 = 0;
          CGFloat x = p_initialDragLocation->x;
          p_initialDragLocation->CGFloat x = v14;
          BOOL v53 = 1;
          goto LABEL_54;
        }
      }

      else
      {
        BOOL v54 = 0;
      }

- (void)setPeekEffectEnabled:(BOOL)a3
{
  if (self->_peekEffectEnabled != a3)
  {
    BOOL v3 = a3;
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      collectionView = self->_collectionView;
      peekEffect = self->_peekEffect;
      if (v3) {
        -[_PBAppSwitcherCollectionView addMotionEffect:](collectionView, "addMotionEffect:", peekEffect);
      }
      else {
        -[_PBAppSwitcherCollectionView removeMotionEffect:](collectionView, "removeMotionEffect:", peekEffect);
      }
    }

    self->_peekEffectEnabled = v3;
  }

- (void)dataSourceDidEnqueuePendingUpdates:(id)a3 animated:(BOOL)a4
{
  id v7 = @"Should Animate Updates";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a4));
  double v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Collection View Update",  0LL,  v6);
}

- (void)dataSource:(id)a3 didReceiveLaunchRequestForItem:(id)a4 completion:(id)a5
{
  v10[0] = @"AppSwitcherItem";
  v10[1] = @"Completion Handler";
  v11[0] = a4;
  id v7 = a4;
  id v8 = [a5 copy];
  v11[1] = v8;
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  @"Launch App",  0LL,  v9);
}

- (void)_initializeStateMachine
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Initial",  0LL,  0LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  double v9 = self->_stateMachine;
  id v10 = sub_100082664();
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVSStateMachine setLogObject:](v9, "setLogObject:", v11);

  objc_initWeak(&location, self);
  uint64_t v12 = self->_stateMachine;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_10014F40C;
  v89[3] = &unk_1003D0990;
  objc_copyWeak(&v90, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Show Switcher",  @"Initial",  v89);
  double v13 = self->_stateMachine;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_10014F4B0;
  v87[3] = &unk_1003D0990;
  objc_copyWeak(&v88, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"Transition Switcher Complete",  @"Transitioning To Switcher",  v87);
  double v14 = self->_stateMachine;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_10014F5A8;
  v85[3] = &unk_1003D0990;
  objc_copyWeak(&v86, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v14,  "registerHandlerForEvent:onState:withBlock:",  @"Transition Switcher Complete",  @"Reverting Switcher To App State",  v85);
  double v15 = self->_stateMachine;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_10014F604;
  v83[3] = &unk_1003D0990;
  objc_copyWeak(&v84, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Transition To Fullscreen Complete",  @"Transitioning To Fullscreen",  v83);
  double v16 = self->_workspaceGeometry;
  id v17 = self->_stateMachine;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10014F848;
  v80[3] = &unk_1003D1740;
  objc_copyWeak(&v82, &location);
  double v43 = v16;
  v81 = v43;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v17,  "registerDefaultHandlerForEvent:withBlock:",  @"Revert Switcher To App Event",  v80);
  double v18 = self->_stateMachine;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10014F9F4;
  v78[3] = &unk_1003D0990;
  objc_copyWeak(&v79, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v18,  "registerDefaultHandlerForEvent:withBlock:",  @"Begin Scrolling",  v78);
  __int16 v19 = self->_stateMachine;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_10014FA6C;
  v76[3] = &unk_1003D0990;
  objc_copyWeak(&v77, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v19,  "registerDefaultHandlerForEvent:withBlock:",  @"End Scrolling",  v76);
  BOOL v20 = self->_stateMachine;
  v98[0] = @"Showing Switcher";
  v98[1] = @"Waiting for Launch";
  CGPoint v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 2LL));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_10014FAD8;
  v74[3] = &unk_1003D0990;
  objc_copyWeak(&v75, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v20,  "registerHandlerForEvent:onStates:withBlock:",  @"End Scrolling",  v21,  v74);

  double v22 = self->_stateMachine;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_10014FB74;
  v72[3] = &unk_1003D0990;
  objc_copyWeak(&v73, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v22,  "registerHandlerForEvent:onState:withBlock:",  @"Activate Item",  @"Showing Switcher",  v72);
  v23 = self->_stateMachine;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10014FC38;
  v70[3] = &unk_1003D0990;
  objc_copyWeak(&v71, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v23,  "registerHandlerForEvent:onState:withBlock:",  @"Activate Item Failed",  @"Waiting for Launch",  v70);
  v24 = self->_stateMachine;
  v97 = @"Transitioning To Switcher";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v97, 1LL));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10014FC70;
  v68[3] = &unk_1003D0990;
  objc_copyWeak(&v69, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v24,  "registerHandlerForEvent:onStates:withBlock:",  @"Launch App",  v25,  v68);

  double v26 = self->_stateMachine;
  v96[0] = @"Showing Switcher";
  v96[1] = @"Waiting for Launch";
  v96[2] = @"Reverting Switcher To App State";
  double v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 3LL));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10014FE00;
  v66[3] = &unk_1003D0990;
  objc_copyWeak(&v67, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v26,  "registerHandlerForEvent:onStates:withBlock:",  @"Launch App",  v27,  v66);

  double v28 = self->_stateMachine;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10015003C;
  v64[3] = &unk_1003D0990;
  objc_copyWeak(&v65, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v28,  "registerHandlerForEvent:onState:withBlock:",  @"Collection View Did Accept Focus",  @"Waiting for Focus Launch",  v64);
  double v29 = self->_stateMachine;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10015021C;
  v62[3] = &unk_1003D0990;
  objc_copyWeak(&v63, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v29,  "registerDefaultHandlerForEvent:withBlock:",  @"Launch App",  v62);
  double v30 = self->_stateMachine;
  v95[0] = @"Scrolling to Item";
  v95[1] = @"Interrupting Scroll To Launch Item";
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 2LL));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1001502D4;
  v60[3] = &unk_1003D0990;
  objc_copyWeak(&v61, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v30,  "registerHandlerForEvent:onStates:withBlock:",  @"Scroll Animation Complete",  v31,  v60);

  double v32 = self->_stateMachine;
  v94[0] = @"Showing Switcher";
  v94[1] = @"Delete Gesture";
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 2LL));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100150324;
  v58[3] = &unk_1003D0990;
  objc_copyWeak(&v59, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v32,  "registerHandlerForEvent:onStates:withBlock:",  @"Kill Gesture Update",  v33,  v58);

  v34 = self->_stateMachine;
  v93[0] = @"Showing Switcher";
  v93[1] = @"Delete Gesture";
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 2LL));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1001503B4;
  v56[3] = &unk_1003D0990;
  objc_copyWeak(&v57, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v34,  "registerHandlerForEvent:onStates:withBlock:",  @"Kill Gesture Succeeded",  v35,  v56);

  v36 = self->_stateMachine;
  v92[0] = @"Showing Switcher";
  v92[1] = @"Delete Gesture";
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 2LL));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1001504C4;
  v54[3] = &unk_1003D0990;
  objc_copyWeak(&v55, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v36,  "registerHandlerForEvent:onStates:withBlock:",  @"Kill Gesture Cancel",  v37,  v54);

  double v38 = self->_stateMachine;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1001505D4;
  v52[3] = &unk_1003D0990;
  objc_copyWeak(&v53, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v38,  "registerHandlerForEvent:onState:withBlock:",  @"Kill Gesture Cancelled or Succeeded",  @"Delete Gesture Completing",  v52);
  v39 = self->_stateMachine;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10015063C;
  v50[3] = &unk_1003D0990;
  objc_copyWeak(&v51, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v39,  "registerHandlerForEvent:onState:withBlock:",  @"Collection View Update",  @"Showing Switcher",  v50);
  id v40 = self->_stateMachine;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100150768;
  v48[3] = &unk_1003D0990;
  objc_copyWeak(&v49, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v40,  "registerHandlerForEvent:onState:withBlock:",  @"Collection View Update Complete",  @"Updating Collection View",  v48);
  v41 = self->_stateMachine;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1001507C4;
  v46[3] = &unk_1003D0990;
  objc_copyWeak(&v47, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v41,  "registerHandlerForEvent:onState:withBlock:",  @"Switcher Layout Level Inactive",  @"Showing Switcher",  v46);
  double v42 = self->_stateMachine;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100150824;
  v44[3] = &unk_1003D0990;
  objc_copyWeak(&v45, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v42,  "registerHandlerForEvent:onState:withBlock:",  @"Switcher Layout Leve Active",  @"Showing Switcher",  v44);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&location);
}

- (void)_showAppSwitcher
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  id v4 = off_1003CD9F0;
  if (!IsReduceMotionEnabled) {
    id v4 = off_1003CD9E8;
  }
  id v5 = [objc_alloc(*v4) initWithWorkspaceGeometry:self->_workspaceGeometry];
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100150C1C;
  v30[3] = &unk_1003D1228;
  objc_copyWeak(&v31, &location);
  id v6 = objc_retainBlock(v30);
  if (IsReduceMotionEnabled)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshotViewAfterScreenUpdates:0]);

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v9 addSubview:v8];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v10 bringSubviewToFront:v8];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    [v11 setCollectionViewLayout:v5 animated:0];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100150C60;
    v28[3] = &unk_1003CFF08;
    id v29 = v8;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100150C7C;
    v25[3] = &unk_1003D1610;
    id v12 = v29;
    id v26 = v12;
    double v27 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327776LL,  v28,  v25,  0.5,  0.0);
  }

  else
  {
    double v13 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    double v14 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherTimingCurveProvider);
    double v15 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v13,  "initWithDuration:timingParameters:",  v14,  0.0);
    -[PBAppSwitcherCollectionViewController setSwitcherAnimator:](self, "setSwitcherAnimator:", v15);

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController switcherAnimator](self, "switcherAnimator"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100150CB4;
    v22[3] = &unk_1003D0418;
    objc_copyWeak(&v24, &location);
    id v23 = v5;
    [v16 addAnimations:v22];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController switcherAnimator](self, "switcherAnimator"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100150D04;
    v19[3] = &unk_1003D1860;
    objc_copyWeak(&v21, &location);
    BOOL v20 = v6;
    [v17 addCompletion:v19];

    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController switcherAnimator](self, "switcherAnimator"));
    [v18 startAnimation];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)_activatePendingLaunchItem
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController pendingLaunchItem](self, "pendingLaunchItem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController appSwitcherDataSource](self, "appSwitcherDataSource"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  id v6 = [v5 indexOfObject:v3];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v6,  0LL));
  id v8 = [v7 copy];
  -[PBAppSwitcherCollectionViewController setPreferredIndexPath:](self, "setPreferredIndexPath:", v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController stateMachine](self, "stateMachine"));
  v12[0] = @"AppSwitcherItem";
  v12[1] = @"Completion Handler";
  v13[0] = v3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController launchCompletionHandler](self, "launchCompletionHandler"));
  v13[1] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  [v9 postEvent:@"Launch App" withContext:0 userInfo:v11];
}

- (BOOL)_activateItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PBAppSwitcherDataSource canSwitchToItem:](self->_appSwitcherDataSource, "canSwitchToItem:", v4);
  if (v5)
  {
    stateMachine = self->_stateMachine;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100150FB0;
    v8[3] = &unk_1003CFEB8;
    v8[4] = self;
    id v9 = v4;
    -[TVSStateMachine executeBlockAfterCurrentStateTransition:]( stateMachine,  "executeBlockAfterCurrentStateTransition:",  v8);
  }

  return v5;
}

- (BOOL)_shouldScrollToItem:(id)a3 scrollIfNeeded:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  appSwitcherDataSource = self->_appSwitcherDataSource;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](appSwitcherDataSource, "items"));
  id v11 = [v10 indexOfObject:v9];

  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v11,  0LL));
  unsigned int v14 = [v13 isEqual:self->_preferredIndexPath];
  char v12 = v14 ^ 1;
  if (v5 || ((!v6 | v14) & 1) == 0)
  {
    double v15 = (NSIndexPath *)[v13 copy];
    preferredIndexPath = self->_preferredIndexPath;
    self->_preferredIndexPath = v15;

    -[PBAppSwitcherCollectionViewController _preferredContentOffsetForIndexPath:]( self,  "_preferredContentOffsetForIndexPath:",  v13);
    double v18 = v17;
    double v20 = v19;
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    collectionView = self->_collectionView;
    if (IsReduceMotionEnabled)
    {
      -[_PBAppSwitcherCollectionView setContentOffset:animated:]( collectionView,  "setContentOffset:animated:",  0LL,  v18,  v20);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
      -[PBAppSwitcherCollectionViewController scrollViewDidEndScrollingAnimation:]( self,  "scrollViewDidEndScrollingAnimation:",  v23);
    }

    else
    {
      -[_PBAppSwitcherCollectionView setContentOffset:animated:]( collectionView,  "setContentOffset:animated:",  1LL,  v18,  v20);
    }
  }

  return v12;
}

- (void)_launchItem:(id)a3 shouldAnimateLayoutSwitch:(BOOL)a4
{
  id v6 = a3;
  -[_PBAppSwitcherCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  id v8 = [v7 indexOfObject:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v8,  0LL));
  id v10 = -[PBAppSwitcherFullFocusLayout initWithWorkspaceGeometry:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherFullFocusLayout),  "initWithWorkspaceGeometry:",  self->_workspaceGeometry);
  -[PBAppSwitcherFullFocusLayout setOriginIndexPath:](v10, "setOriginIndexPath:", v9);
  UIAccessibilityIsReduceMotionEnabled();
  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100151498;
  v28[3] = &unk_1003D9530;
  objc_copyWeak(&v30, &location);
  id v11 = v6;
  id v29 = v11;
  char v12 = objc_retainBlock(v28);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 snapshotViewAfterScreenUpdates:0]);

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v15 addSubview:v14];

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self, "view"));
    [v16 bringSubviewToFront:v14];

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    [v17 setCollectionViewLayout:v10 animated:0];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100151570;
    v26[3] = &unk_1003CFF08;
    id v27 = v14;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10015158C;
    v23[3] = &unk_1003D1610;
    id v18 = v27;
    id v24 = v18;
    v25 = v12;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327776LL,  v26,  v23,  0.5,  0.0);
  }

  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001515C4;
    v19[3] = &unk_1003D9558;
    void v19[4] = self;
    double v20 = v10;
    BOOL v22 = a4;
    id v21 = v12;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  v19,  0LL);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)_setKillGestureRecognizersEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UITapGestureRecognizer setEnabled:](self->_upRecognizer, "setEnabled:");
  -[UIPanGestureRecognizer setEnabled:](self->_panRecognizer, "setEnabled:", v3);
}

- (void)_updateKillSwipeWithOffset:(double)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherLayoutInvalidationContext);
  -[PBAppSwitcherLayoutInvalidationContext setSwipeUpProgress:](v5, "setSwipeUpProgress:", a3);
  -[PBAppSwitcherLayoutInvalidationContext setSwipeUpItem:](v5, "setSwipeUpItem:", self->_preferredIndexPath);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionViewLayout]);
  [v7 invalidateLayoutWithContext:v5];
}

- (void)_cancelKillSwipeWithVelocity:(double)a3 completion:(id)a4
{
  id v6 = a4;
  -[_PBAppSwitcherCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0LL);
  id v7 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherLayoutInvalidationContext);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionViewLayout]);
  [v9 invalidateLayoutWithContext:v7];

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_100151830;
  v11[3] = &unk_1003D5B38;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  v11[4] = self;
  id v12 = v10;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:",  327712LL,  v11,  0LL,  0.5,  0.0,  1.0,  -a3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_finishKillSwipeWithVelocity:(double)a3 completion:(id)a4
{
  id v6 = a4;
  -[_PBAppSwitcherCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0LL);
  id v7 = self->_preferredIndexPath;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  id v9 = (PBAppSwitcherItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", -[NSIndexPath item](v7, "item")));
  killedItem = self->_killedItem;
  self->_killedItem = v9;

  -[PBAppSwitcherDataSource handleKillRequestForItem:]( self->_appSwitcherDataSource,  "handleKillRequestForItem:",  self->_killedItem);
  AnalyticsSendEvent(@"com.apple.appletv.appswitcher.terminateapp", 0LL);
  id v11 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherLayoutInvalidationContext);
  -[PBAppSwitcherLayoutInvalidationContext setSwipeUpProgress:](v11, "setSwipeUpProgress:", -1500.0);
  -[PBAppSwitcherLayoutInvalidationContext setSwipeUpItem:](v11, "setSwipeUpItem:", v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  [v12 layoutIfNeeded];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionViewLayout]);
  [v14 invalidateLayoutWithContext:v11];

  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  _DWORD v16[2] = sub_100151B5C;
  v16[3] = &unk_1003D5B38;
  objc_copyWeak(&v18, &location);
  id v15 = v6;
  v16[4] = self;
  id v17 = v15;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:",  327712LL,  v16,  0LL,  0.5,  0.0,  1.0,  -a3);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_handleCollectionViewUpdatesWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[_PBAppSwitcherCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0LL);
  BOOL v7 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v4);
  objc_initWeak(&location, self);
  collectionView = self->_collectionView;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  _DWORD v16[2] = sub_100151DC0;
  v16[3] = &unk_1003CFF08;
  v16[4] = self;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100151DD8;
  id v13 = &unk_1003D1660;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v14 = v9;
  -[_PBAppSwitcherCollectionView performBatchUpdates:completion:]( collectionView,  "performBatchUpdates:completion:",  v16,  &v10);
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v7, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)__applyPendingUpdatesToCollectionView
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  BOOL v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource pendingUpdates](self->_appSwitcherDataSource, "pendingUpdates"));
  id v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472LL;
  v35 = sub_1001521F8;
  v36 = &unk_1003D9580;
  id v6 = v3;
  v37 = v6;
  BOOL v7 = v4;
  double v38 = v7;
  [v5 enumerateObjectsUsingBlock:&v33];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items", v33, v34, v35, v36));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", -[NSIndexPath item](self->_preferredIndexPath, "item")));

  id v10 = sub_100082664();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    id v13 = (NSMutableArray *)[v12 count];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    *(_DWORD *)buf = 134218242;
    id v40 = v13;
    __int16 v41 = 2112;
    double v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Items before update(%lu) %@", buf, 0x16u);
  }

  id v15 = sub_100082664();
  double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Delete index paths %@", buf, 0xCu);
  }

  id v17 = sub_100082664();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Insert index paths %@", buf, 0xCu);
  }

  -[PBAppSwitcherDataSource applyPendingUpdates](self->_appSwitcherDataSource, "applyPendingUpdates");
  id v19 = sub_100082664();
  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    BOOL v22 = (NSMutableArray *)[v21 count];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    *(_DWORD *)buf = 134218242;
    id v40 = v22;
    __int16 v41 = 2112;
    double v42 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Items after update(%lu) %@", buf, 0x16u);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
  v25 = (char *)[v24 indexOfObject:v9];

  if (v25 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = -[NSIndexPath item](self->_preferredIndexPath, "item");
    if (v26 <= 1) {
      uint64_t v27 = 1LL;
    }
    else {
      uint64_t v27 = v26;
    }
    double v28 = (char *)(v27 - 1);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    id v30 = (char *)[v29 count] - 1;

    if (v28 >= v30) {
      v25 = v30;
    }
    else {
      v25 = v28;
    }
  }

  id v31 = (NSIndexPath *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v25,  0LL));
  preferredIndexPath = self->_preferredIndexPath;
  self->_preferredIndexPath = v31;

  -[_PBAppSwitcherCollectionView deleteItemsAtIndexPaths:](self->_collectionView, "deleteItemsAtIndexPaths:", v6);
  -[_PBAppSwitcherCollectionView insertItemsAtIndexPaths:](self->_collectionView, "insertItemsAtIndexPaths:", v7);
}

- (BOOL)_servicePendingUpdatesWithAnimation:(BOOL)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource pendingUpdates](self->_appSwitcherDataSource, "pendingUpdates"));
  id v6 = [v5 count];

  if (v6)
  {
    stateMachine = self->_stateMachine;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    void v12[2] = sub_100152390;
    v12[3] = &unk_1003D2008;
    v12[4] = self;
    BOOL v13 = a3;
    id v8 = v12;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController pendingLaunchItem](self, "pendingLaunchItem"));

    if (!v9) {
      return 0;
    }
    stateMachine = self->_stateMachine;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_100152460;
    v11[3] = &unk_1003CFF08;
    v11[4] = self;
    id v8 = v11;
  }

  -[TVSStateMachine executeBlockAfterCurrentStateTransition:]( stateMachine,  "executeBlockAfterCurrentStateTransition:",  v8);
  return 1;
}

- (void)_prepareToLaunchItemImmediately:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController focusedItem](self, "focusedItem"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self->_appSwitcherDataSource, "items"));
    id v10 = [v9 indexOfObject:v4];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v10,  0LL));
    -[PBAppSwitcherCollectionViewController _preferredContentOffsetForIndexPath:]( self,  "_preferredContentOffsetForIndexPath:",  v11);
    double v13 = v12;
    double v15 = v14;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "setContentOffset:animated:", 0, v13, v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    -[PBAppSwitcherCollectionViewController scrollViewDidEndScrollingAnimation:]( self,  "scrollViewDidEndScrollingAnimation:",  v17);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
    [v19 contentOffset];
    objc_msgSend(v18, "setContentOffset:animated:", 0);

    -[PBAppSwitcherCollectionViewController _shouldScrollToItem:scrollIfNeeded:forced:]( self,  "_shouldScrollToItem:scrollIfNeeded:forced:",  v4,  1LL,  1LL);
  }
}

- (void)_invalidateSceneViewForCell:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 sceneView]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBApplicationSceneView);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0LL;
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  id v8 = v7;

  if (v8) {
    [v8 invalidateScenePresentation];
  }
}

- (CGPoint)_preferredContentOffsetForIndexPath:(id)a3
{
  uint64_t v4 = (char *)[a3 item];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController collectionView](self, "collectionView"));
  id v6 = (char *)[v5 numberOfItemsInSection:0];

  double v7 = 0.0;
  if (v6 == v4 + 1)
  {
    [(id)objc_opt_class(PBAppSwitcherFocusLayout) contentOffsetAdjustmentForLastItem];
    double v7 = v8;
  }

  -[_PBAppSwitcherCollectionView contentInset](self->_collectionView, "contentInset");
  double v10 = v7 - (v9 - (double)(uint64_t)v4 * 960.0);
  double v11 = 0.0;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  id v8 = a3;
  if (a4 == 2)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController stateMachine](self, "stateMachine"));
    double v10 = v9;
    double v11 = @"Switcher Layout Leve Active";
LABEL_5:
    [v9 postEvent:v11];

    goto LABEL_6;
  }

  if (a5 == 2)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController stateMachine](self, "stateMachine"));
    double v10 = v9;
    double v11 = @"Switcher Layout Level Inactive";
    goto LABEL_5;
  }

- (PBWorkspaceGeometry)workspaceGeometry
{
  return self->_workspaceGeometry;
}

- (PBAppSwitcherDataSource)appSwitcherDataSource
{
  return self->_appSwitcherDataSource;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (CGPoint)initialDragLocation
{
  double x = self->_initialDragLocation.x;
  double y = self->_initialDragLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragLocation:(CGPoint)a3
{
  self->_initialDragLocation = a3;
}

- (BOOL)isPanningVertically
{
  return self->_panningVertically;
}

- (void)setPanningVertically:(BOOL)a3
{
  self->_panningVerticalldouble y = a3;
}

- (BOOL)isPanningHorizontally
{
  return self->_panningHorizontally;
}

- (void)setPanningHorizontally:(BOOL)a3
{
  self->_panningHorizontalldouble y = a3;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (NSIndexPath)preferredIndexPath
{
  return self->_preferredIndexPath;
}

- (void)setPreferredIndexPath:(id)a3
{
}

- (_PBAppSwitcherCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (PBAppSwitcherTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (BOOL)peekEffectEnabled
{
  return self->_peekEffectEnabled;
}

- (UIInterpolatingMotionEffect)peekEffect
{
  return self->_peekEffect;
}

- (UIPanGestureRecognizer)panRecognizer
{
  return self->_panRecognizer;
}

- (UITapGestureRecognizer)upRecognizer
{
  return self->_upRecognizer;
}

- (PBAppSwitcherItem)focusedItem
{
  return self->_focusedItem;
}

- (void)setFocusedItem:(id)a3
{
}

- (PBAppSwitcherItem)pendingLaunchItem
{
  return self->_pendingLaunchItem;
}

- (void)setPendingLaunchItem:(id)a3
{
}

- (PBAppSwitcherItem)killedItem
{
  return self->_killedItem;
}

- (void)setKilledItem:(id)a3
{
}

- (id)launchCompletionHandler
{
  return self->_launchCompletionHandler;
}

- (void)setLaunchCompletionHandler:(id)a3
{
}

- (UIViewPropertyAnimator)switcherAnimator
{
  return self->_switcherAnimator;
}

- (void)setSwitcherAnimator:(id)a3
{
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end