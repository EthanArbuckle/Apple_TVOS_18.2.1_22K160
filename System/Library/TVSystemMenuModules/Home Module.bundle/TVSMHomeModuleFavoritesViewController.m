@interface TVSMHomeModuleFavoritesViewController
- (BOOL)allowAnimatedUpdates;
- (BOOL)externalUpdatesDisabled;
- (BOOL)isInMultiCamMode;
- (BOOL)performedInitialReload;
- (BOOL)shouldFocusInitialIndexPath;
- (BOOL)viewControllerShouldDismissForAllCamerasButton:(id)a3;
- (NSArray)orderedCameraItems;
- (NSMutableArray)pendingSectionReloads;
- (NSMutableDictionary)contentViewControllersByID;
- (NSMutableDictionary)homeItemsByID;
- (NSUUID)focusedItemIdentifier;
- (TVHMCameraViewController)centeredCameraViewController;
- (TVSMHomeHeaderView)headerView;
- (TVSMHomeModuleFavoritesViewController)init;
- (TVSMHomeModuleItemManager)itemManager;
- (UICollectionView)favoritesCollectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UITapGestureRecognizer)selectRecognizer;
- (UIView)snapshotViewContainer;
- (UIViewController)dismissedCameraViewController;
- (UIViewController)selectedCameraViewController;
- (double)embeddedOffset;
- (id)animationContext;
- (id)favoritesLayout;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusEnvironments;
- (id)tvsm_synchronizedDrawingFence;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_endDisableNearbyAccessoryUpdatesForVisibleCells;
- (void)allCamerasViewControllerDidPresentFullSCreenCamera:(id)a3;
- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)checkContentOffsetWithScrollView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentModuleViewControllerDidTriggerAction:(id)a3;
- (void)dealloc;
- (void)focusCameraCell:(id)a3 withIdentifier:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)selectGestureRecognized:(id)a3;
- (void)setAllowAnimatedUpdates:(BOOL)a3;
- (void)setAnimationContext:(id)a3;
- (void)setCenteredCameraViewController:(id)a3;
- (void)setContentViewControllersByID:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDismissedCameraViewController:(id)a3;
- (void)setEmbeddedOffset:(double)a3;
- (void)setExternalUpdatesDisabled:(BOOL)a3;
- (void)setFavoritesCollectionView:(id)a3;
- (void)setFocusedItemIdentifier:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHomeItemsByID:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setOrderedCameraItems:(id)a3;
- (void)setPendingSectionReloads:(id)a3;
- (void)setPerformedInitialReload:(BOOL)a3;
- (void)setSelectRecognizer:(id)a3;
- (void)setSelectedCameraViewController:(id)a3;
- (void)setShouldFocusInitialIndexPath:(BOOL)a3;
- (void)setSnapshotViewContainer:(id)a3;
- (void)updateCollectionViewAnimated:(BOOL)a3;
- (void)viewController:(id)a3 presentedAllCamerasViewControllerWillPresentFullScreenCamera:(id)a4 completion:(id)a5;
- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 centered:(BOOL)a7 completion:(id)a8;
- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSMHomeModuleFavoritesViewController

- (TVSMHomeModuleFavoritesViewController)init
{
  SEL v10 = a2;
  v11 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  v11 = -[TVSMHomeModuleFavoritesViewController init](&v9, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v11->_shouldFocusInitialIndexPath = 1;
    v2 = objc_alloc(&OBJC_CLASS___TVSMHomeModuleItemManager);
    v3 = -[TVSMHomeModuleItemManager initWithDelegate:](v2, "initWithDelegate:", v11);
    itemManager = v11->_itemManager;
    v11->_itemManager = v3;

    -[TVSMHomeModuleItemManager disableExternalUpdatesWithReason:]( v11->_itemManager,  "disableExternalUpdatesWithReason:",  @"Inactive");
    v11->_externalUpdatesDisabled = 1;
    id v8 = +[HFHomeKitDispatcher sharedDispatcher](&OBJC_CLASS___HFHomeKitDispatcher, "sharedDispatcher");
    [v8 addHomeObserver:v11];

    if ((_os_feature_enabled_impl("TVHomeUI", "HomeKitCameraPIP") & 1) != 0)
    {
      v7 = +[TVHMSystemHomeUIMonitor sharedInstance](&OBJC_CLASS___TVHMSystemHomeUIMonitor, "sharedInstance");
      -[TVHMSystemHomeUIMonitor fetchCurrentStreamStateWithCompletion:]( v7,  "fetchCurrentStreamStateWithCompletion:",  &stru_18B88);
    }
  }

  v6 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  return v6;
}

- (void)viewDidLoad
{
  v75 = self;
  SEL v74 = a2;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  -[TVSMHomeModuleFavoritesViewController viewDidLoad](&v73, "viewDidLoad");
  -[TVSMHomeModuleFavoritesViewController setRestoresFocusAfterTransition:]( v75,  "setRestoresFocusAfterTransition:",  0LL);
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  homeItemsByID = v75->_homeItemsByID;
  v75->_homeItemsByID = v2;

  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  contentViewControllersByID = v75->_contentViewControllersByID;
  v75->_contentViewControllersByID = v4;

  v6 = objc_alloc_init(&OBJC_CLASS___TVSMHomeHeaderView);
  headerView = v75->_headerView;
  v75->_headerView = v6;

  -[TVSMHomeHeaderView setTranslatesAutoresizingMaskIntoConstraints:]( v75->_headerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v45 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  [v45 addSubview:v75->_headerView];

  v46 = objc_alloc(&OBJC_CLASS___UICollectionView);
  id v47 = -[TVSMHomeModuleFavoritesViewController favoritesLayout](v75, "favoritesLayout");
  id v8 = -[UICollectionView initWithFrame:collectionViewLayout:]( v46,  "initWithFrame:collectionViewLayout:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  favoritesCollectionView = v75->_favoritesCollectionView;
  v75->_favoritesCollectionView = v8;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:]( v75->_favoritesCollectionView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UICollectionView setDelegate:](v75->_favoritesCollectionView, "setDelegate:", v75);
  -[UICollectionView setRemembersLastFocusedIndexPath:]( v75->_favoritesCollectionView,  "setRemembersLastFocusedIndexPath:",  0LL);
  -[UICollectionView setContentInsetAdjustmentBehavior:]( v75->_favoritesCollectionView,  "setContentInsetAdjustmentBehavior:",  2LL);
  id v48 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  [v48 addSubview:v75->_favoritesCollectionView];

  v50 = v75->_favoritesCollectionView;
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___TVHMCameraCollectionViewCell);
  SEL v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVHMCameraCollectionViewCell);
  v51 = NSStringFromClass(v10);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v50, "registerClass:forCellWithReuseIdentifier:", v49);

  v53 = v75->_favoritesCollectionView;
  uint64_t v52 = objc_opt_class(&OBJC_CLASS___TVHMHomeAllCamerasCollectionViewCell);
  v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVHMHomeAllCamerasCollectionViewCell);
  v54 = NSStringFromClass(v11);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v53, "registerClass:forCellWithReuseIdentifier:", v52);

  v56 = v75->_favoritesCollectionView;
  uint64_t v55 = objc_opt_class(&OBJC_CLASS___TVSMHomeSceneCollectionViewCell);
  v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMHomeSceneCollectionViewCell);
  v57 = NSStringFromClass(v12);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v56, "registerClass:forCellWithReuseIdentifier:", v55);

  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( v75->_favoritesCollectionView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVSMHomeCollectionHeaderView),  UICollectionElementKindSectionHeader,  @"header");
  v13 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v14 = -[UITapGestureRecognizer initWithTarget:action:](v13, "initWithTarget:action:", v75, "selectGestureRecognized:");
  selectRecognizer = v75->_selectRecognizer;
  v75->_selectRecognizer = v14;

  -[UITapGestureRecognizer setAllowedPressTypes:](v75->_selectRecognizer, "setAllowedPressTypes:", &off_19888);
  -[UICollectionView addGestureRecognizer:]( v75->_favoritesCollectionView,  "addGestureRecognizer:",  v75->_selectRecognizer);
  objc_initWeak(&location, v75);
  v58 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  v43 = v75->_favoritesCollectionView;
  v66 = _NSConcreteStackBlock;
  int v67 = -1073741824;
  int v68 = 0;
  v69 = sub_7640;
  v70 = &unk_18BB0;
  objc_copyWeak(v71, &location);
  v44 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v58,  "initWithCollectionView:cellProvider:",  v43,  &v66);
  diffableDataSource = v75->_diffableDataSource;
  v75->_diffableDataSource = v44;

  v42 = v75->_diffableDataSource;
  v60 = _NSConcreteStackBlock;
  int v61 = -1073741824;
  int v62 = 0;
  v63 = sub_78D0;
  v64 = &unk_18BD8;
  objc_copyWeak(&v65, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v42, "setSupplementaryViewProvider:", &v60);
  -[TVSMHomeModuleFavoritesViewController updateCollectionViewAnimated:](v75, "updateCollectionViewAnimated:", 0LL);
  id v59 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v41 = -[TVSMHomeHeaderView topAnchor](v75->_headerView, "topAnchor");
  id v40 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  id v39 = [v40 topAnchor];
  id v38 = objc_msgSend(v41, "constraintEqualToAnchor:");
  objc_msgSend(v59, "addObject:");

  id v37 = -[TVSMHomeHeaderView widthAnchor](v75->_headerView, "widthAnchor");
  id v36 = [v37 constraintEqualToConstant:440.0];
  objc_msgSend(v59, "addObject:");

  id v35 = -[TVSMHomeHeaderView leadingAnchor](v75->_headerView, "leadingAnchor");
  id v34 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  id v33 = [v34 leadingAnchor];
  id v32 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 50.0);
  objc_msgSend(v59, "addObject:");

  id v31 = -[UICollectionView topAnchor](v75->_favoritesCollectionView, "topAnchor");
  id v30 = -[TVSMHomeHeaderView bottomAnchor](v75->_headerView, "bottomAnchor");
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  objc_msgSend(v59, "addObject:");

  id v28 = -[UICollectionView leadingAnchor](v75->_favoritesCollectionView, "leadingAnchor");
  id v27 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  id v26 = [v27 leadingAnchor];
  id v25 = objc_msgSend(v28, "constraintEqualToAnchor:");
  objc_msgSend(v59, "addObject:");

  id v24 = -[UICollectionView trailingAnchor](v75->_favoritesCollectionView, "trailingAnchor");
  id v23 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  id v22 = [v23 trailingAnchor];
  id v21 = objc_msgSend(v24, "constraintEqualToAnchor:");
  objc_msgSend(v59, "addObject:");

  id v20 = -[UICollectionView bottomAnchor](v75->_favoritesCollectionView, "bottomAnchor");
  id v19 = -[TVSMHomeModuleFavoritesViewController view](v75, "view");
  id v18 = [v19 bottomAnchor];
  id v17 = objc_msgSend(v20, "constraintEqualToAnchor:");
  objc_msgSend(v59, "addObject:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v59);
  objc_storeStrong(&v59, 0LL);
  objc_destroyWeak(&v65);
  objc_destroyWeak(v71);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v26 = self;
  SEL v25 = a2;
  BOOL v24 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  id v3 = -[TVSMHomeModuleFavoritesViewController viewWillAppear:](&v23, "viewWillAppear:", a3);
  id location = (id)home_module_log(v3);
  char v21 = 1;
  v13 = (os_log_s *)(id)home_module_log(location);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v26);

  os_signpost_id_t v20 = v14;
  if (v14 && v20 != -1LL && os_signpost_enabled((os_log_t)location))
  {
    log = (os_log_s *)location;
    os_signpost_type_t type = v21;
    os_signpost_id_t spid = v20;
    sub_7F70(v19);
    _os_signpost_emit_with_name_impl(&dword_0, log, type, spid, "FavoritesWillAppear", "", v19, 2u);
  }

  objc_storeStrong(&location, 0LL);
  if (v26->_externalUpdatesDisabled)
  {
    v26->_externalUpdatesDisabled = 0;
    id v4 = -[TVSMHomeModuleItemManager endDisableExternalUpdatesWithReason:]( v26->_itemManager,  "endDisableExternalUpdatesWithReason:",  @"Inactive");
  }

  id v18 = (id)home_module_log(v4);
  char v17 = 2;
  id v8 = (os_log_s *)(id)home_module_log(v18);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v26);

  os_signpost_id_t v16 = v9;
  if (v9 && v16 != -1LL && os_signpost_enabled((os_log_t)v18))
  {
    v5 = (os_log_s *)v18;
    os_signpost_type_t v6 = v17;
    os_signpost_id_t v7 = v16;
    sub_7F70(v15);
    _os_signpost_emit_with_name_impl(&dword_0, v5, v6, v7, "FavoritesWillAppear", "", v15, 2u);
  }

  objc_storeStrong(&v18, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  os_signpost_type_t v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  -[TVSMHomeModuleFavoritesViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  -[TVSMHomeModuleFavoritesViewController _endDisableNearbyAccessoryUpdatesForVisibleCells]( v6,  "_endDisableNearbyAccessoryUpdatesForVisibleCells");
}

- (void)viewDidLayoutSubviews
{
  v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  -[TVSMHomeModuleFavoritesViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  -[TVSMHomeModuleFavoritesViewController setAllowAnimatedUpdates:](v12, "setAllowAnimatedUpdates:", 1LL);
  if (v12->_shouldFocusInitialIndexPath)
  {
    v2 = v12;
    objc_super v3 = -[TVSMHomeModuleFavoritesViewController favoritesCollectionView](v12, "favoritesCollectionView");
    id v9 =  -[TVSMHomeModuleFavoritesViewController indexPathForPreferredFocusedViewInCollectionView:]( v2,  "indexPathForPreferredFocusedViewInCollectionView:");

    BOOL v4 = -[TVSMHomeModuleFavoritesViewController favoritesCollectionView](v12, "favoritesCollectionView");
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:]( v4,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v9,  16LL,  0LL);

    SEL v5 = -[TVSMHomeModuleFavoritesViewController favoritesCollectionView](v12, "favoritesCollectionView");
    id v8 = -[UICollectionView cellForItemAtIndexPath:](v5, "cellForItemAtIndexPath:", v9);

    os_signpost_type_t v6 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v12, "diffableDataSource");
    id v7 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v6, "itemIdentifierForIndexPath:", v9);

    -[TVSMHomeModuleFavoritesViewController focusCameraCell:withIdentifier:]( v12,  "focusCameraCell:withIdentifier:",  v8,  v7);
    objc_storeStrong(&v7, 0LL);
    objc_storeStrong((id *)&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

- (void)dealloc
{
  SEL v5 = self;
  SEL v4 = a2;
  v2 = -[TVSMHomeModuleFavoritesViewController centeredCameraViewController](self, "centeredCameraViewController");
  -[TVHMCameraViewController setCentered:](v2, "setCentered:", 0LL);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleFavoritesViewController;
  -[TVSMHomeModuleFavoritesViewController dealloc](&v3, "dealloc");
}

- (BOOL)isInMultiCamMode
{
  objc_super v3 = -[TVSMHomeModuleFavoritesViewController orderedCameraItems](self, "orderedCameraItems");
  BOOL v4 = -[NSArray count](v3, "count") > 1;

  return v4;
}

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  objc_super v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  os_signpost_id_t v16 = -[TVSMHomeModuleFavoritesViewController homeItemsByID](v23, "homeItemsByID");
  id v20 = -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v21);

  if ([v20 isActionSet])
  {
    v13 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v23, "contentViewControllersByID");
    id v19 = -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v21);

    id v4 = [location[0] lockupContainingViewController];
    BOOL v14 = v4 == v19;

    if (!v14)
    {
      -[TVSMHomeModuleFavoritesViewController addChildViewController:](v23, "addChildViewController:", v19);
      [location[0] setLockupContainingViewController:v19];
      [v19 didMoveToParentViewController:v23];
    }

    objc_storeStrong(&v19, 0LL);
  }

  else if ([v20 isCameraItem])
  {
    SEL v11 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v23, "contentViewControllersByID");
    id v18 = -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v21);

    [location[0] setHighContrastFocusIndicatorStyle:1];
    id v5 = [location[0] lockupContainingViewController];
    BOOL v12 = v5 == v18;

    if (!v12)
    {
      -[TVSMHomeModuleFavoritesViewController addChildViewController:](v23, "addChildViewController:", v18);
      [location[0] setLockupContainingViewController:v18];
      [v18 didMoveToParentViewController:v23];
    }

    objc_storeStrong(&v18, 0LL);
  }

  else
  {
    id v9 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v23, "contentViewControllersByID");
    id v17 = -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v21);

    [location[0] setHighContrastFocusIndicatorStyle:1];
    id v6 = [location[0] lockupContainingViewController];
    BOOL v10 = v6 == v17;

    if (!v10)
    {
      -[TVSMHomeModuleFavoritesViewController addChildViewController:](v23, "addChildViewController:", v17);
      [location[0] setLockupContainingViewController:v17];
      [v17 didMoveToParentViewController:v23];
      id v7 = location[0];
      id v8 = -[TVSMHomeModuleFavoritesViewController orderedCameraItems](v23, "orderedCameraItems");
      objc_msgSend(v7, "setCameraItems:");
    }

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)focusCameraCell:(id)a3 withIdentifier:(id)a4
{
  SEL v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v6 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v11, "contentViewControllersByID");
  id v8 = -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v9);

  id v4 = [location[0] lockupContainingViewController];
  BOOL v7 = v4 == v8;

  if (!v7)
  {
    -[TVSMHomeModuleFavoritesViewController addChildViewController:](v11, "addChildViewController:", v8);
    [location[0] setLockupContainingViewController:v8];
    [v8 didMoveToParentViewController:v11];
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateCollectionViewAnimated:(BOOL)a3
{
  id v76 = self;
  SEL v75 = a2;
  BOOL v74 = a3;
  id v73 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  id v47 = [v76 itemManager];
  id v72 = objc_msgSend(v47, "displayedItemsInSection:");

  id v48 = [v76 itemManager];
  id v71 = [v48 displayedItemsInSection:1];

  if ([v72 count])
  {
    [v76 setOrderedCameraItems:v72];
    [v73 appendSectionsWithIdentifiers:&off_198A0];
    if ((unint64_t)[v72 count] > 1)
    {
      id v70 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"069c61ff-8e2d-4a4c-a0a2-3444e947d2e9");
      id v81 = v70;
      v46 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL);
      objc_msgSend(v73, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

      id location = [*((id *)v76 + 8) objectForKeyedSubscript:v70];
      if (location)
      {
        [location setCameraItems:v72];
      }

      else
      {
        id location = objc_alloc_init(&OBJC_CLASS___TVHMAllCamerasPreviewViewController);

        [location setCameraItems:v72];
        [location setDelegate:v76];
        [*((id *)v76 + 8) setObject:location forKeyedSubscript:v70];
      }

      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v70, 0LL);
    }

    memset(__b, 0, sizeof(__b));
    id v44 = v72;
    id v45 = [v44 countByEnumeratingWithState:__b objects:v80 count:16];
    if (v45)
    {
      uint64_t v41 = *(void *)__b[2];
      uint64_t v42 = 0LL;
      id v43 = v45;
      while (1)
      {
        uint64_t v40 = v42;
        if (*(void *)__b[2] != v41) {
          objc_enumerationMutation(v44);
        }
        id v68 = *(id *)(__b[1] + 8 * v42);
        id v34 = [v68 homeKitObject];
        id v66 = [v34 uniqueIdentifier];

        id v35 = v73;
        id v79 = v66;
        id v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v79, 1LL);
        objc_msgSend(v35, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

        id v37 = [v76 homeItemsByID];
        [v37 setObject:v68 forKey:v66];

        id v38 = [v76 contentViewControllersByID];
        id v3 = [v38 objectForKey:v66];
        BOOL v39 = v3 != 0LL;

        if (v39)
        {
          id v32 = [v76 contentViewControllersByID];
          id v31 = [v32 objectForKey:v66];
          [v31 setCameraItem:v68];
        }

        else
        {
          id v4 = objc_alloc(&OBJC_CLASS___TVHMCameraViewController);
          id v65 = -[TVHMCameraViewController initWithCameraItem:](v4, "initWithCameraItem:", v68);
          -[TVHMCameraViewController setStyle:](v65, "setStyle:", 6LL);
          -[TVHMCameraViewController setDelegate:](v65, "setDelegate:", v76);
          id v33 = [v76 contentViewControllersByID];
          [v33 setObject:v65 forKey:v66];

          objc_storeStrong((id *)&v65, 0LL);
        }

        objc_storeStrong(&v66, 0LL);
        ++v42;
        if (v40 + 1 >= (unint64_t)v43)
        {
          uint64_t v42 = 0LL;
          id v43 = [v44 countByEnumeratingWithState:__b objects:v80 count:16];
          if (!v43) {
            break;
          }
        }
      }
    }
  }

  if ([v71 count])
  {
    [v73 appendSectionsWithIdentifiers:&off_198B8];
    memset(v63, 0, sizeof(v63));
    id v29 = v71;
    id v30 = [v29 countByEnumeratingWithState:v63 objects:v78 count:16];
    if (v30)
    {
      uint64_t v26 = *(void *)v63[2];
      uint64_t v27 = 0LL;
      id v28 = v30;
      while (1)
      {
        uint64_t v25 = v27;
        if (*(void *)v63[2] != v26) {
          objc_enumerationMutation(v29);
        }
        id v64 = *(id *)(v63[1] + 8 * v27);
        id v19 = [v64 homeKitObject];
        id v62 = [v19 uniqueIdentifier];

        id v20 = v73;
        id v77 = v62;
        id v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v77, 1LL);
        objc_msgSend(v20, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

        id v22 = [v76 homeItemsByID];
        [v22 setObject:v64 forKey:v62];

        id v23 = [v76 contentViewControllersByID];
        id v5 = [v23 objectForKey:v62];
        BOOL v24 = v5 != 0LL;

        if (!v24)
        {
          id v6 = objc_alloc(&OBJC_CLASS___TVSMHomeSceneButtonViewController);
          int v61 = -[TVSMHomeSceneButtonViewController initWithHFItem:](v6, "initWithHFItem:", v64);
          -[TVSMHomeSceneButtonViewController setDelegate:](v61, "setDelegate:", v76);
          id v18 = [v76 contentViewControllersByID];
          [v18 setObject:v61 forKey:v62];

          objc_storeStrong((id *)&v61, 0LL);
        }

        id v17 = [v76 contentViewControllersByID];
        id v16 = [v17 objectForKey:v62];
        [v16 updateContentViewController];

        objc_storeStrong(&v62, 0LL);
        ++v27;
        if (v25 + 1 >= (unint64_t)v28)
        {
          uint64_t v27 = 0LL;
          id v28 = [v29 countByEnumeratingWithState:v63 objects:v78 count:16];
          if (!v28) {
            break;
          }
        }
      }
    }
  }

  id v13 = v73;
  id v14 = [*((id *)v76 + 6) snapshot];
  unsigned __int8 v15 = objc_msgSend(v13, "isEqual:");

  if ((v15 & 1) != 0)
  {
    id v8 = [v76 favoritesCollectionView];
    id v7 = [v8 collectionViewLayout];
    [v7 invalidateLayout];
  }

  else if (v74 && ([v76 allowAnimatedUpdates] & 1) != 0)
  {
    id v12 = [v76 diffableDataSource];
    id v11 = v73;
    uint64_t v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_91E0;
    id v59 = &unk_18C00;
    id v60 = v76;
    [v12 applySnapshot:v11 animatingDifferences:1 completion:&v55];

    objc_storeStrong(&v60, 0LL);
  }

  else
  {
    id v10 = [v76 diffableDataSource];
    id v9 = v73;
    uint64_t v49 = _NSConcreteStackBlock;
    int v50 = -1073741824;
    int v51 = 0;
    uint64_t v52 = sub_9248;
    v53 = &unk_18C00;
    id v54 = v76;
    [v10 applySnapshotUsingReloadData:v9 completion:&v49];

    objc_storeStrong(&v54, 0LL);
  }

  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v73, 0LL);
}

- (id)favoritesLayout
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v4 = objc_alloc(&OBJC_CLASS___TVSMButtonGridCollectionViewLayout);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_93D4;
  id v9 = &unk_18C28;
  objc_copyWeak(v10, location);
  id v11 = [v4 initWithSectionProvider:&v5];
  id v3 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  return v3;
}

- (id)preferredFocusEnvironments
{
  favoritesCollectionView = self->_favoritesCollectionView;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &favoritesCollectionView,  1LL);
}

- (void)selectGestureRecognized:(id)a3
{
  id v62 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 3)
  {
    uint64_t v41 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v62, "contentViewControllersByID");
    id v60 = -[NSMutableDictionary objectForKey:](v41, "objectForKey:", v62->_focusedItemIdentifier);

    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSMHomeSceneButtonViewController);
    if ((objc_opt_isKindOfClass(v60, v3) & 1) != 0)
    {
      id v59 = v60;
      objc_msgSend( v59,  "toggleActionSetWithAppleRemote:",  (unint64_t)objc_msgSend(location[0], "tvhm_originatedFromAppleRemote") & 1);
      objc_storeStrong(&v59, 0LL);
    }

    else
    {
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHMCameraViewController);
      if ((objc_opt_isKindOfClass(v60, v4) & 1) != 0)
      {
        id v58 = v60;
        -[TVSMHomeModuleFavoritesViewController setSelectedCameraViewController:]( v62,  "setSelectedCameraViewController:",  v58);
        sub_A478();
        double v56 = v5;
        double v57 = v6;
        id v31 = [v58 cameraView];
        id v30 = [v31 cameraContentView];
        id v29 = [v58 cameraView];
        id v28 = [v29 cameraContentView];
        [v28 frame];
        v54[1] = v7;
        v54[2] = v8;
        v54[3] = v9;
        v54[4] = v10;
        objc_msgSend(v30, "convertRect:toView:", *(double *)&v7, *(double *)&v8, *(double *)&v9, *(double *)&v10);
        v55.origin.x = v11;
        v55.origin.y = v12;
        v55.size.width = v13;
        v55.size.height = v14;

        v54[0] = objc_alloc_init(&OBJC_CLASS___TVHMCameraAnimationContext);
        id v32 = v54[0];
        CGRect v63 = CGRectInset(v55, (v55.size.width - v56) / 2.0, (v55.size.height - v57) / 2.0);
        CGRect v53 = v63;
        objc_msgSend( v32,  "setContentViewOriginatingFrame:",  v63.origin.x,  v63.origin.y,  v63.size.width,  v63.size.height);
        objc_msgSend( v54[0],  "setContentViewDestinationFrame:",  v55.origin.x,  v55.origin.y,  v55.size.width,  v55.size.height);
        id v33 = v54[0];
        id v34 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
        [v34 floatingContentViewFocusSizeIncrease];
        objc_msgSend(v33, "setFocusSizeIncrease:");

        id v35 = v54[0];
        id v36 = +[TVHMCameraViewStyle defaultStyle](&OBJC_CLASS___TVHMCameraViewStyle, "defaultStyle");
        [v36 floatingContentViewCornerRadius];
        objc_msgSend(v35, "setCameraCornerRadius:");

        -[TVSMHomeModuleFavoritesViewController setAnimationContext:](v62, "setAnimationContext:", v54[0]);
        id v37 = objc_alloc(&OBJC_CLASS___TVHMFullScreenCameraViewController);
        BOOL v39 = -[TVSMHomeModuleFavoritesViewController orderedCameraItems](v62, "orderedCameraItems");
        id v38 = -[TVSMHomeModuleFavoritesViewController focusedItemIdentifier](v62, "focusedItemIdentifier");
        id v52 = objc_msgSend(v37, "initWithCameraItems:focusedIdentifier:cameraViewController:", v39);

        [v52 setModalPresentationStyle:4];
        [v52 setTransitioningDelegate:v62];
        [v52 setDismissalDelegate:v62];
        [v58 setFullScreenContainer:v52];
        -[TVSMHomeModuleFavoritesViewController presentViewController:animated:completion:]( v62,  "presentViewController:animated:completion:",  v52,  1LL,  0LL);
        id v40 = (id)TVSMAnalyticsEventWithName(@"camera.selected");
        AnalyticsSendEventLazy(v40, &stru_18C48);

        objc_storeStrong(&v52, 0LL);
        objc_storeStrong(v54, 0LL);
        objc_storeStrong(&v58, 0LL);
      }

      else
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVHMAllCamerasPreviewViewController);
        if ((objc_opt_isKindOfClass(v60, v15) & 1) != 0)
        {
          -[TVSMHomeModuleFavoritesViewController setSelectedCameraViewController:]( v62,  "setSelectedCameraViewController:",  v60);
          id v51 = objc_alloc_init(&OBJC_CLASS___TVHMAllCamerasAnimationContext);
          id v26 = [v60 view];
          id v25 = [v60 view];
          [v25 bounds];
          double v45 = v16;
          double v46 = v17;
          double v47 = v18;
          double v48 = v19;
          objc_msgSend(v26, "convertRect:toView:", v16, v17, v18, v19);
          *(double *)&__int128 v49 = v20;
          *((double *)&v49 + 1) = v21;
          *(double *)&__int128 v50 = v22;
          *((double *)&v50 + 1) = v23;
          __int128 v43 = v49;
          __int128 v44 = v50;
          objc_msgSend(v51, "setContentViewOriginatingFrame:", v20, v21, v22, v23);

          -[TVSMHomeModuleFavoritesViewController setAnimationContext:](v62, "setAnimationContext:", v51);
          id v24 = objc_alloc(&OBJC_CLASS___TVHMAllCamerasFullScreenViewController);
          id v42 = [v24 initWithDismissalDelegate:v62];
          [v42 setCameraItems:v62->_orderedCameraItems];
          id v27 =  +[TVHMCameraViewStyle multiCameraThumbnailStyle]( &OBJC_CLASS___TVHMCameraViewStyle,  "multiCameraThumbnailStyle");
          objc_msgSend(v42, "setInitialCameraViewStyle:");

          [v42 setModalPresentationStyle:4];
          [v42 setTransitioningDelegate:v62];
          -[TVSMHomeModuleFavoritesViewController presentViewController:animated:completion:]( v62,  "presentViewController:animated:completion:",  v42,  1LL,  0LL);
          objc_storeStrong(&v42, 0LL);
          objc_storeStrong(&v51, 0LL);
        }
      }
    }

    objc_storeStrong(&v60, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  if (([v18 isInitialUpdate] & 1) == 0
    && (-[TVSMHomeModuleFavoritesViewController isViewLoaded](v20, "isViewLoaded") & 1) != 0)
  {
    [v18 performWithOptions:1];
    -[TVSMHomeModuleFavoritesViewController updateCollectionViewAnimated:](v20, "updateCollectionViewAnimated:", 1LL);
  }

  else
  {
    [v18 performWithOptions:1];
    if ((-[TVSMHomeModuleFavoritesViewController isViewLoaded](v20, "isViewLoaded") & 1) != 0)
    {
      headerView = v20->_headerView;
      id v7 = [location[0] home];
      id v6 = [v7 name];
      -[TVSMHomeHeaderView setTitle:](headerView, "setTitle:");

      -[TVSMHomeModuleFavoritesViewController updateCollectionViewAnimated:](v20, "updateCollectionViewAnimated:", 0LL);
    }
  }

  if ([v18 isInitialUpdate])
  {
    id v17 = [location[0] displayedItemsInSection:0];
    id v16 = [location[0] displayedItemsInSection:1];
    id v4 = (id)TVSMAnalyticsEventWithName(@"homemodule.opened");
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    CGFloat v12 = sub_A744;
    CGFloat v13 = &unk_18C70;
    id v14 = v17;
    id v15 = v16;
    AnalyticsSendEventLazy(v4, &v9);

    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  if ([v13 isActionSet])
  {
    id v11 = v13;
    id v8 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v15, "contentViewControllersByID");
    id v7 = [v11 homeKitObject];
    id v6 = [v7 uniqueIdentifier];
    id v5 = -[NSMutableDictionary objectForKey:](v8, "objectForKey:");
    [v5 updateContentViewController];

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  [location[0] deselectItemAtIndexPath:v5 animated:1];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = 0LL;
  objc_storeStrong(&v9, a5);
  id v7 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v12, "diffableDataSource");
  id v8 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", v9);

  -[TVSMHomeModuleFavoritesViewController _configureCell:withIdentifier:]( v12,  "_configureCell:withIdentifier:",  v10,  v8);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v14 = v18;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSMHomeSceneCollectionViewCell);
  if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
  {
    id v16 = [v18 lockupContainingViewController];
    objc_msgSend(v16, "willMoveToParentViewController:");
    [v18 setLockupContainingViewController:0];
    [v16 removeFromParentViewController];
    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    id v11 = v18;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHMCameraCollectionViewCell);
    if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
    {
      id v9 =  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:]( v20->_diffableDataSource,  "itemIdentifierForIndexPath:",  v17);
      id v8 = [v9 UUIDString];
      id v7 = [@"069c61ff-8e2d-4a4c-a0a2-3444e947d2e9" uppercaseString];
      unsigned __int8 v10 = objc_msgSend(v8, "isEqualToString:");

      if ((v10 & 1) == 0)
      {
        id v15 = [v18 lockupContainingViewController];
        objc_msgSend(v15, "willMoveToParentViewController:");
        [v18 setLockupContainingViewController:0];
        [v15 removeFromParentViewController];
        objc_storeStrong(&v15, 0LL);
      }
    }
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = 0LL;
  objc_storeStrong(&v28, a4);
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  id v26 = [v28 previouslyFocusedIndexPath];
  id v25 = [v28 nextFocusedIndexPath];
  id v17 = [v26 section];
  BOOL v24 = v17 != [v25 section];
  if (v25) {
    v30->_shouldFocusInitialIndexPath = 0;
  }
  if (v25 && ([v25 isEqual:v26] & 1) == 0)
  {
    id v13 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v30, "diffableDataSource");
    id v23 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v13, "itemIdentifierForIndexPath:", v25);

    -[TVSMHomeModuleFavoritesViewController setFocusedItemIdentifier:](v30, "setFocusedItemIdentifier:", v23);
    id v14 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v30, "contentViewControllersByID");
    id v22 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v23);

    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHMCameraViewController);
    if ((objc_opt_isKindOfClass(v22, v5) & 1) != 0)
    {
      id v21 = v22;
      id v12 = [v21 cameraView];
      id v11 = [v12 cameraContentView];
      [v11 setSize:1];

      [v21 setCentered:1];
      -[TVSMHomeModuleFavoritesViewController setCenteredCameraViewController:]( v30,  "setCenteredCameraViewController:",  v21);
      objc_storeStrong(&v21, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
    objc_storeStrong(&v23, 0LL);
  }

  if (v26 && v25 && !v24 && ([v26 isEqual:v25] & 1) == 0)
  {
    id v9 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v30, "diffableDataSource");
    id v20 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v9, "itemIdentifierForIndexPath:", v26);

    unsigned __int8 v10 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v30, "contentViewControllersByID");
    id v19 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v20);

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHMCameraViewController);
    if ((objc_opt_isKindOfClass(v19, v6) & 1) != 0)
    {
      id v18 = v19;
      id v7 = -[TVSMHomeModuleFavoritesViewController selectedCameraViewController](v30, "selectedCameraViewController");
      unsigned __int8 v8 = objc_msgSend(v18, "isEqual:");

      if ((v8 & 1) == 0) {
        [v18 setCentered:0];
      }
      objc_storeStrong(&v18, 0LL);
    }

    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  unsigned __int8 v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v6 = -[TVSMHomeModuleFavoritesViewController focusedItemIdentifier](v8, "focusedItemIdentifier");

  if (v6)
  {
    uint64_t v5 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v8, "diffableDataSource");
    id v4 = -[TVSMHomeModuleFavoritesViewController focusedItemIdentifier](v8, "focusedItemIdentifier");
    id v9 = (NSIndexPath *) -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:]( v5,  "indexPathForItemIdentifier:");
  }

  else if (-[TVSMHomeModuleFavoritesViewController isInMultiCamMode](v8, "isInMultiCamMode"))
  {
    id v9 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  1LL,  0LL);
  }

  else
  {
    id v9 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v9;
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  +[NSObject cancelPreviousPerformRequestsWithTarget:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:",  v9);
  [v7 contentOffset];
  -[TVSMHomeModuleFavoritesViewController setEmbeddedOffset:](v9, "setEmbeddedOffset:", v5);
  -[TVSMHomeModuleFavoritesViewController performSelector:withObject:afterDelay:]( v9,  "performSelector:withObject:afterDelay:",  "checkContentOffsetWithScrollView:",  v7,  0.2);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)checkContentOffsetWithScrollView:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMHomeModuleFavoritesViewController embeddedOffset](v7, "embeddedOffset");
  double v5 = v3;
  [location[0] contentOffset];
  if (vabdd_f64(v5, v4) < 0.00000011920929) {
    -[TVSMHomeModuleFavoritesViewController _endDisableNearbyAccessoryUpdatesForVisibleCells]( v7,  "_endDisableNearbyAccessoryUpdatesForVisibleCells");
  }
  objc_storeStrong(location, 0LL);
}

- (void)contentModuleViewControllerDidTriggerAction:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  BOOL v12 = a6;
  id v11 = 0LL;
  objc_storeStrong(&v11, a7);
  -[TVSMHomeModuleFavoritesViewController viewControllerDidRequestDismissal:focusedIdentifier:focusedContentView:animated:centered:completion:]( v16,  "viewControllerDidRequestDismissal:focusedIdentifier:focusedContentView:animated:centered:completion:",  location[0],  v14,  v13,  v12,  1LL,  v11);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 focusedIdentifier:(id)a4 focusedContentView:(id)a5 animated:(BOOL)a6 centered:(BOOL)a7 completion:(id)a8
{
  __int128 v44 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v42 = 0LL;
  objc_storeStrong(&v42, a4);
  id v41 = 0LL;
  objc_storeStrong(&v41, a5);
  BOOL v40 = a6;
  BOOL v39 = a7;
  id v38 = 0LL;
  objc_storeStrong(&v38, a8);
  -[TVSMHomeModuleFavoritesViewController setFocusedItemIdentifier:](v44, "setFocusedItemIdentifier:", v42);
  id v37 = v44->_selectedCameraViewController;
  id v22 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v44, "contentViewControllersByID");
  id v36 = -[NSMutableDictionary objectForKey:](v22, "objectForKey:", v42);

  id v23 = -[TVSMHomeModuleFavoritesViewController selectedCameraViewController](v44, "selectedCameraViewController");
  unsigned __int8 v24 = objc_msgSend(v36, "isEqual:");

  if ((v24 & 1) == 0)
  {
    id v13 = -[UIViewController cameraView](v37, "cameraView");
    id v12 = -[UIViewController cameraView](v37, "cameraView");
    id v11 = [v12 cameraContentView];
    objc_msgSend(v13, "setCameraContentView:");

    favoritesCollectionView = v44->_favoritesCollectionView;
    id v16 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v44, "diffableDataSource");
    id v15 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](v16, "indexPathForItemIdentifier:", v42);
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:]( favoritesCollectionView,  "scrollToItemAtIndexPath:atScrollPosition:animated:");
  }

  [v41 removeNearbyAccessoryControlsFromParentViewControllerAnimated:0];
  id v8 = [v36 cameraView];
  [v8 updateFloatingContentViewControlState:8 animated:0];

  -[TVSMHomeModuleFavoritesViewController setDismissedCameraViewController:]( v44,  "setDismissedCameraViewController:",  v36);
  id v10 = location[0];
  BOOL v9 = v40;
  id v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  id v28 = sub_B9E4;
  id v29 = &unk_18C98;
  id v30 = v37;
  id v31 = v36;
  id v32 = v41;
  BOOL v35 = v39;
  id v33 = v44;
  id v34 = v38;
  [v10 dismissViewControllerAnimated:v9 completion:&v25];
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)viewControllerShouldDismissForAllCamerasButton:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (void)viewController:(id)a3 presentedAllCamerasViewControllerWillPresentFullScreenCamera:(id)a4 completion:(id)a5
{
  id v42 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v40 = 0LL;
  objc_storeStrong(&v40, a4);
  id v39 = 0LL;
  objc_storeStrong(&v39, a5);
  -[UIView removeFromSuperview](v42->_snapshotViewContainer, "removeFromSuperview");
  id v17 = objc_alloc(&OBJC_CLASS___UIView);
  id v19 = -[TVSMHomeModuleFavoritesViewController view](v42, "view");
  id v18 = [v19 window];
  [v18 bounds];
  v38[1] = v5;
  v38[2] = v6;
  v38[3] = v7;
  v38[4] = v8;
  BOOL v9 = -[UIView initWithFrame:](v17, "initWithFrame:", *(double *)&v5, *(double *)&v6, *(double *)&v7, *(double *)&v8);
  snapshotViewContainer = v42->_snapshotViewContainer;
  v42->_snapshotViewContainer = v9;

  id v20 = objc_alloc(&OBJC_CLASS___TVSMPlatterView);
  -[UIView bounds](v42->_snapshotViewContainer, "bounds");
  v37[1] = v11;
  v37[2] = v12;
  v37[3] = v13;
  v37[4] = v14;
  v38[0] = -[TVSMPlatterView initWithFrame:]( v20,  "initWithFrame:",  *(double *)&v11,  *(double *)&v12,  *(double *)&v13,  *(double *)&v14);
  -[UIView addSubview:](v42->_snapshotViewContainer, "addSubview:", v38[0]);
  id v21 = v42->_snapshotViewContainer;
  id v22 = [v40 requestSnapshotViewAfterScreenUpdates:0];
  -[UIView addSubview:](v21, "addSubview:");

  id v24 = -[TVSMHomeModuleFavoritesViewController view](v42, "view");
  id v23 = [v24 window];
  [v23 addSubview:v42->_snapshotViewContainer];

  id v25 = [v40 view];
  [v25 setAlpha:0.0];

  v37[0] = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"069c61ff-8e2d-4a4c-a0a2-3444e947d2e9");
  [v40 setTransitioningDelegate:v42];
  [v40 setDismissalDelegate:v42];
  id v26 = v40;
  int v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  id v30 = sub_BF88;
  id v31 = &unk_18CE8;
  id v32 = v42;
  id v33 = location[0];
  id v34 = v40;
  id v36 = v39;
  id v35 = v37[0];
  objc_msgSend(v26, "dismissViewControllerAnimated:completion:", 0);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong(v37, 0LL);
  objc_storeStrong(v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)allCamerasViewControllerDidPresentFullSCreenCamera:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIView removeFromSuperview](v4->_snapshotViewContainer, "removeFromSuperview");
  objc_storeStrong((id *)&v4->_snapshotViewContainer, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)allCamerasViewControllerDidRequestDismissal:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  [location[0] dismissViewControllerAnimated:v8 completion:v7];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)tvsm_synchronizedDrawingFence
{
  id location[2] = self;
  location[1] = (id)a2;
  id v5 = -[TVSMHomeModuleFavoritesViewController viewIfLoaded](self, "viewIfLoaded");
  id v4 = [v5 window];
  location[0] = [v4 windowScene];

  char v8 = 0;
  char v6 = 0;
  if (location[0])
  {
    id v9 = [location[0] _synchronizedDrawingFence];
    char v8 = 1;
    id v2 = v9;
  }

  else
  {
    id v7 = +[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence");
    char v6 = 1;
    id v2 = v7;
  }

  id v11 = v2;
  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v11;
}

- (void)_endDisableNearbyAccessoryUpdatesForVisibleCells
{
  id v18 = self;
  SEL v17 = a2;
  memset(__b, 0, sizeof(__b));
  id v9 = -[TVSMHomeModuleFavoritesViewController favoritesCollectionView](v18, "favoritesCollectionView");
  obj = -[UICollectionView indexPathsForVisibleItems](v9, "indexPathsForVisibleItems");

  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v19,  16LL);
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(__b[1] + 8 * v7);
      double v3 = -[TVSMHomeModuleFavoritesViewController diffableDataSource](v18, "diffableDataSource");
      id v14 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v3, "itemIdentifierForIndexPath:", v16);

      id v4 = -[TVSMHomeModuleFavoritesViewController homeItemsByID](v18, "homeItemsByID");
      id v13 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v14);

      if ([v13 isCameraItem])
      {
        id v2 = -[TVSMHomeModuleFavoritesViewController contentViewControllersByID](v18, "contentViewControllersByID");
        id v12 = -[NSMutableDictionary objectForKey:](v2, "objectForKey:", v14);

        [v12 endDisableExternalUpdatesForVisibleReason];
        objc_storeStrong(&v12, 0LL);
      }

      objc_storeStrong(&v13, 0LL);
      objc_storeStrong(&v14, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v19,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }
}

- (TVSMHomeModuleItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (BOOL)shouldFocusInitialIndexPath
{
  return self->_shouldFocusInitialIndexPath;
}

- (void)setShouldFocusInitialIndexPath:(BOOL)a3
{
  self->_shouldFocusInitialIndexPath = a3;
}

- (BOOL)allowAnimatedUpdates
{
  return self->_allowAnimatedUpdates;
}

- (void)setAllowAnimatedUpdates:(BOOL)a3
{
  self->_allowAnimatedUpdates = a3;
}

- (BOOL)externalUpdatesDisabled
{
  return self->_externalUpdatesDisabled;
}

- (void)setExternalUpdatesDisabled:(BOOL)a3
{
  self->_externalUpdatesDisabled = a3;
}

- (BOOL)performedInitialReload
{
  return self->_performedInitialReload;
}

- (void)setPerformedInitialReload:(BOOL)a3
{
  self->_performedInitialReload = a3;
}

- (NSMutableArray)pendingSectionReloads
{
  return self->_pendingSectionReloads;
}

- (void)setPendingSectionReloads:(id)a3
{
}

- (TVSMHomeHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UICollectionView)favoritesCollectionView
{
  return self->_favoritesCollectionView;
}

- (void)setFavoritesCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSMutableDictionary)homeItemsByID
{
  return self->_homeItemsByID;
}

- (void)setHomeItemsByID:(id)a3
{
}

- (NSMutableDictionary)contentViewControllersByID
{
  return self->_contentViewControllersByID;
}

- (void)setContentViewControllersByID:(id)a3
{
}

- (id)animationContext
{
  return self->_animationContext;
}

- (void)setAnimationContext:(id)a3
{
}

- (TVHMCameraViewController)centeredCameraViewController
{
  return self->_centeredCameraViewController;
}

- (void)setCenteredCameraViewController:(id)a3
{
}

- (UIViewController)selectedCameraViewController
{
  return self->_selectedCameraViewController;
}

- (void)setSelectedCameraViewController:(id)a3
{
}

- (UIViewController)dismissedCameraViewController
{
  return self->_dismissedCameraViewController;
}

- (void)setDismissedCameraViewController:(id)a3
{
}

- (NSArray)orderedCameraItems
{
  return self->_orderedCameraItems;
}

- (void)setOrderedCameraItems:(id)a3
{
}

- (NSUUID)focusedItemIdentifier
{
  return self->_focusedItemIdentifier;
}

- (void)setFocusedItemIdentifier:(id)a3
{
}

- (UIView)snapshotViewContainer
{
  return self->_snapshotViewContainer;
}

- (void)setSnapshotViewContainer:(id)a3
{
}

- (UITapGestureRecognizer)selectRecognizer
{
  return self->_selectRecognizer;
}

- (void)setSelectRecognizer:(id)a3
{
}

- (double)embeddedOffset
{
  return self->_embeddedOffset;
}

- (void)setEmbeddedOffset:(double)a3
{
  self->_embeddedOffset = a3;
}

- (void).cxx_destruct
{
}

@end