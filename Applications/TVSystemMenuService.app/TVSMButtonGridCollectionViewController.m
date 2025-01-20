@interface TVSMButtonGridCollectionViewController
+ (id)_overlayAnimationSettingsForTransition:(unint64_t)a3;
- (CGRect)selectedCellFrame;
- (NSMapTable)analyticsLocationsByModule;
- (NSMutableArray)analyticsImpressions;
- (NSString)currentFocusedIdentifier;
- (TVSMButtonGridCollectionViewController)init;
- (TVSMButtonGridCollectionViewController)initWithCoder:(id)a3;
- (TVSMDefaultModuleDataSource)buttonDataSource;
- (TVSMPeopleModuleDataSource)peopleDataSource;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)_audioRoutingPreferredIndexPath;
- (id)_locationAnalyticsForModule:(id)a3;
- (id)_moduleAtIndexPath:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)tvsm_synchronizedDrawingFence;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_buildAnalyticsForPeopleModules:(id)a3 andButtonModules:(id)a4 withLocations:(id)a5 impressions:(id)a6;
- (void)_configureCell:(id)a3 withModuleAtIndexPath:(id)a4;
- (void)_postPageAnalyticsEvent;
- (void)_updateLayoutElementWithOverlayTransition:(unint64_t)a3;
- (void)_updateSnapshotAnalyticsOnly:(BOOL)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)initialAnimationDidFinish;
- (void)moduleDidPerformAction:(id)a3;
- (void)moduleDidRequestDismissal:(id)a3;
- (void)moduleDidRequestExpansion:(id)a3;
- (void)moduleDidRequestOverlay:(id)a3;
- (void)moduleDidRequestSystemMenuDismissal:(id)a3 animated:(BOOL)a4 result:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentFocusedIdentifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSMButtonGridCollectionViewController

- (TVSMButtonGridCollectionViewController)init
{
  v21 = self;
  v20[1] = (id)a2;
  v23 = (dispatch_once_t *)&unk_100056CE0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100049668);
  if (*v23 != -1) {
    dispatch_once(v23, location);
  }
  objc_storeStrong(&location, 0LL);
  v20[0] = objc_alloc_init(&OBJC_CLASS___TVSMPeopleModuleDataSource);
  id v19 = sub_10001B630(v20[0]);
  v2 = v21;
  v21 = 0LL;
  v18.receiver = v2;
  v18.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  v17 = -[TVSMButtonGridCollectionViewController initWithCollectionViewLayout:]( &v18,  "initWithCollectionViewLayout:",  v19);
  v21 = v17;
  objc_storeStrong((id *)&v21, v17);
  if (v17)
  {
    v3 =  +[NSMapTable mapTableWithStrongToStrongObjects]( &OBJC_CLASS___NSMapTable,  "mapTableWithStrongToStrongObjects");
    analyticsLocationsByModule = v21->_analyticsLocationsByModule;
    v21->_analyticsLocationsByModule = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    analyticsImpressions = v21->_analyticsImpressions;
    v21->_analyticsImpressions = v5;

    objc_storeStrong((id *)&v21->_peopleDataSource, v20[0]);
    peopleDataSource = v21->_peopleDataSource;
    v11 = v21;
    v13 = NSStringFromSelector("childModules");
    -[TVSMPeopleModuleDataSource addObserver:forKeyPath:options:context:]( peopleDataSource,  "addObserver:forKeyPath:options:context:",  v11);

    v7 = objc_alloc_init(&OBJC_CLASS___TVSMDefaultModuleDataSource);
    buttonDataSource = v21->_buttonDataSource;
    v21->_buttonDataSource = v7;

    v15 = v21->_buttonDataSource;
    v14 = v21;
    v16 = NSStringFromSelector("availableModules");
    -[TVSMDefaultModuleDataSource addObserver:forKeyPath:options:context:]( v15,  "addObserver:forKeyPath:options:context:",  v14);
  }

  v10 = v21;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v10;
}

- (TVSMButtonGridCollectionViewController)initWithCoder:(id)a3
{
  v6 = self;
  SEL v5 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  -[TVSMButtonGridCollectionViewController doesNotRecognizeSelector:](v6, "doesNotRecognizeSelector:", v5);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return 0LL;
}

- (void)dealloc
{
  v9 = self;
  SEL v8 = a2;
  peopleDataSource = self->_peopleDataSource;
  v4 = NSStringFromSelector("childModules");
  -[TVSMPeopleModuleDataSource removeObserver:forKeyPath:context:]( peopleDataSource,  "removeObserver:forKeyPath:context:",  self);

  buttonDataSource = v9->_buttonDataSource;
  v6 = NSStringFromSelector("availableModules");
  -[TVSMDefaultModuleDataSource removeObserver:forKeyPath:context:]( buttonDataSource,  "removeObserver:forKeyPath:context:",  v9);

  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  -[TVSMButtonGridCollectionViewController dealloc](&v7, "dealloc");
}

- (void)initialAnimationDidFinish
{
  v11 = self;
  SEL v10 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSMModuleDataSource availableModules](v11->_buttonDataSource, "availableModules");
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v12,  16LL);
  if (v7)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0LL;
    id v5 = v7;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v4);
      if ((objc_opt_respondsToSelector(v9, "prewarmViewController") & 1) != 0) {
        [v9 prewarmViewController];
      }
      ++v4;
      if (v2 + 1 >= (unint64_t)v5)
      {
        uint64_t v4 = 0LL;
        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v12,  16LL);
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)viewDidLoad
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  -[TVSMButtonGridCollectionViewController viewDidLoad](&v22, "viewDidLoad");
  id v10 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  [v10 setContentInsetAdjustmentBehavior:2];

  id v11 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  sub_10001BD70();
  location[1] = v2;
  location[2] = v3;
  location[3] = v4;
  location[4] = v5;
  objc_msgSend(v11, "setContentInset:", *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);

  id v12 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  [v12 setRemembersLastFocusedIndexPath:1];

  id v13 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  [v13 registerClass:objc_opt_class(TVSMButtonGridCollectionViewCell) forCellWithReuseIdentifier:@"Cell"];

  objc_initWeak(location, v24);
  v14 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v8 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  objc_super v18 = sub_10001BDBC;
  id v19 = &unk_100049690;
  objc_copyWeak(v20, location);
  id v9 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v14,  "initWithCollectionView:cellProvider:",  v8,  &v15);
  diffableDataSource = v24->_diffableDataSource;
  v24->_diffableDataSource = v9;

  id v7 = -[TVSMButtonGridCollectionViewController collectionView](v24, "collectionView");
  [v7 setDataSource:v24->_diffableDataSource];

  -[TVSMButtonGridCollectionViewController _updateSnapshotAnalyticsOnly:](v24, "_updateSnapshotAnalyticsOnly:", 0LL);
  objc_destroyWeak(v20);
  objc_destroyWeak(location);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  -[TVSMButtonGridCollectionViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  uint64_t v4 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  id v5 = -[TVSMSystemMenuManager startupContext](v4, "startupContext");
  id v6 = -[TVSMSystemMenuStartupContext foregroundApp](v5, "foregroundApp");
  if (v6) {
    uint64_t v3 = (__CFString *)v6;
  }
  else {
    uint64_t v3 = @"com.apple.HeadBoard";
  }
  id v8 = v3;

  id v7 =  +[TVSMAnalyticsBaseInfo infoWithForegroundApp:]( &OBJC_CLASS___TVSMAnalyticsBaseInfo,  "infoWithForegroundApp:",  v8);
  +[TVSMAnalytics setBaseInfo:](&OBJC_CLASS___TVSMAnalytics, "setBaseInfo:", v7);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  -[TVSMButtonGridCollectionViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  -[TVSMButtonGridCollectionViewController _postPageAnalyticsEvent](v6, "_postPageAnalyticsEvent");
  -[TVSMButtonGridCollectionViewController _updateSnapshotAnalyticsOnly:](v6, "_updateSnapshotAnalyticsOnly:", 1LL);
  +[TVSMAnalytics reportImpressionsBegin:]( &OBJC_CLASS___TVSMAnalytics,  "reportImpressionsBegin:",  v6->_analyticsImpressions);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
  -[TVSMButtonGridCollectionViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  +[TVSMAnalytics reportImpressionsEnd:]( &OBJC_CLASS___TVSMAnalytics,  "reportImpressionsEnd:",  v6->_analyticsImpressions);
}

- (void)_configureCell:(id)a3 withModuleAtIndexPath:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v4 = [location[0] lockupContainingViewController];
  BOOL v6 = v4 != 0LL;

  if (!v6)
  {
    id v10 = -[TVSMButtonGridCollectionViewController _moduleAtIndexPath:](v13, "_moduleAtIndexPath:", v11);
    id v9 = [v10 contentViewController];
    id v8 = [v10 accessibilityIdentifierSuffix];
    id v7 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"UIA.ControlCenter.ButtonGridCollectionView.Module",  v8);
    [location[0] setAccessibilityIdentifier:v7];
    [v9 willMoveToParentViewController:v13];
    -[TVSMButtonGridCollectionViewController addChildViewController:](v13, "addChildViewController:", v9);
    [location[0] setLockupContainingViewController:v9];
    objc_msgSend(location[0], "setStyle:", objc_msgSend(v10, "style"));
    [v9 didMoveToParentViewController:v13];
    objc_storeStrong((id *)&v7, 0LL);
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 =  -[TVSMButtonGridCollectionViewController _audioRoutingPreferredIndexPath]( v9,  "_audioRoutingPreferredIndexPath");
  char v5 = 0;
  if (v7)
  {
    objc_super v3 = (NSIndexPath *)v7;
  }

  else
  {
    BOOL v6 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  1LL);
    char v5 = 1;
    objc_super v3 = v6;
  }

  id v10 = v3;
  if ((v5 & 1) != 0) {

  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 2LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (a4)
  {
    char v5 = -[TVSMModuleDataSource availableModules](v9->_buttonDataSource, "availableModules");
    id v10 = -[NSArray count](v5, "count");
  }

  else
  {
    id v6 = -[TVSMPeopleModuleDataSource childModules](v9->_peopleDataSource, "childModules");
    id v10 = [v6 count];
  }

  objc_storeStrong(location, 0LL);
  return (int64_t)v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  -[TVSMButtonGridCollectionViewController _configureCell:withModuleAtIndexPath:]( v10,  "_configureCell:withModuleAtIndexPath:",  v8,  v7);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = 0LL;
  objc_storeStrong(&v9, a5);
  id v8 = v10;
  id v7 = [v8 lockupContainingViewController];
  [v7 willMoveToParentViewController:0];
  [v8 setLockupContainingViewController:0];
  [v7 removeFromParentViewController];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  id v10 = [v12 nextFocusedIndexPath];
  if (v10)
  {
    id v9 =  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:]( v14->_diffableDataSource,  "itemIdentifierForIndexPath:",  v10);
    char v5 = (NSString *)[v9 identifier];
    currentFocusedIdentifier = v14->_currentFocusedIdentifier;
    v14->_currentFocusedIdentifier = v5;

    objc_storeStrong(&v9, 0LL);
  }

  else
  {
    objc_storeStrong((id *)&v14->_currentFocusedIdentifier, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)moduleDidPerformAction:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] analyticsElementInfo];
  id v3 = [location[0] analyticsActionType];
  id v7 =  +[TVSMClickAnalytics analyticsWithElementInfo:actionType:]( &OBJC_CLASS___TVSMClickAnalytics,  "analyticsWithElementInfo:actionType:",  v4);

  char v5 = v7;
  id v6 =  -[TVSMButtonGridCollectionViewController _locationAnalyticsForModule:]( v9,  "_locationAnalyticsForModule:",  location[0]);
  +[TVSMAnalytics reportClickEvent:locations:](&OBJC_CLASS___TVSMAnalytics, "reportClickEvent:locations:", v5);

  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)moduleDidRequestDismissal:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSMExpandingModule);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    id v5 = -[TVSMButtonGridCollectionViewController navigationController](v8, "navigationController");
    id v4 = [v5 popViewControllerAnimated:1];
  }

  else
  {
    -[TVSMButtonGridCollectionViewController _updateLayoutElementWithOverlayTransition:]( v8,  "_updateLayoutElementWithOverlayTransition:",  0LL);
    -[TVSMButtonGridCollectionViewController dismissViewControllerAnimated:completion:]( v8,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
    -[TVSMButtonGridCollectionViewController _postPageAnalyticsEvent](v8, "_postPageAnalyticsEvent");
  }

  objc_storeStrong(location, 0LL);
}

- (void)moduleDidRequestExpansion:(id)a3
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v33 = [location[0] expandedContentViewController];
  id v12 = objc_alloc(&OBJC_CLASS___TVSMButtonGridLayoutInfo);
  id v13 = [location[0] identifier];
  v32 = -[TVSMButtonGridLayoutInfo initWithIdentifier:style:]( v12,  "initWithIdentifier:style:",  v13,  [location[0] style]);

  id v15 = -[TVSMButtonGridCollectionViewController collectionView](v35, "collectionView");
  id v14 =  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:]( v35->_diffableDataSource,  "indexPathForItemIdentifier:",  v32);
  id v31 = objc_msgSend(v15, "layoutAttributesForItemAtIndexPath:");

  id v18 = -[TVSMButtonGridCollectionViewController collectionView](v35, "collectionView");
  [v31 frame];
  double v25 = v3;
  double v26 = v4;
  double v27 = v5;
  double v28 = v6;
  id v17 = -[TVSMButtonGridCollectionViewController collectionView](v35, "collectionView");
  id v16 = [v17 superview];
  objc_msgSend(v18, "convertRect:toView:", v25, v26, v27, v28);
  v29.x = v7;
  v29.y = v8;
  v30.width = v9;
  v30.height = v10;

  p_selectedCellFrame = &v35->_selectedCellFrame;
  v35->_selectedCellFrame.origin = v29;
  p_selectedCellFrame->size = v30;
  id v19 = -[TVSMButtonGridCollectionViewController navigationController](v35, "navigationController");
  [v19 pushViewController:v33 animated:1];

  id v21 = [location[0] analyticsElementInfo];
  id v20 = [location[0] analyticsActionType];
  v24 =  +[TVSMClickAnalytics analyticsWithElementInfo:actionType:]( &OBJC_CLASS___TVSMClickAnalytics,  "analyticsWithElementInfo:actionType:",  v21);

  objc_super v22 = v24;
  id v23 =  -[TVSMButtonGridCollectionViewController _locationAnalyticsForModule:]( v35,  "_locationAnalyticsForModule:",  location[0]);
  +[TVSMAnalytics reportClickEvent:locations:](&OBJC_CLASS___TVSMAnalytics, "reportClickEvent:locations:", v22);

  objc_storeStrong((id *)&v24, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)moduleDidRequestOverlay:(id)a3
{
  CGFloat v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = [location[0] overlayContentViewController];
  [v8 setModalPresentationStyle:8];
  -[TVSMButtonGridCollectionViewController _updateLayoutElementWithOverlayTransition:]( v10,  "_updateLayoutElementWithOverlayTransition:",  1LL);
  -[TVSMButtonGridCollectionViewController presentViewController:animated:completion:]( v10,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
  id v4 = [location[0] analyticsElementInfo];
  id v3 = [location[0] analyticsActionType];
  CGFloat v7 =  +[TVSMClickAnalytics analyticsWithElementInfo:actionType:]( &OBJC_CLASS___TVSMClickAnalytics,  "analyticsWithElementInfo:actionType:",  v4);

  double v5 = v7;
  id v6 =  -[TVSMButtonGridCollectionViewController _locationAnalyticsForModule:]( v10,  "_locationAnalyticsForModule:",  location[0]);
  +[TVSMAnalytics reportClickEvent:locations:](&OBJC_CLASS___TVSMAnalytics, "reportClickEvent:locations:", v5);

  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)moduleDidRequestSystemMenuDismissal:(id)a3 animated:(BOOL)a4 result:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  id v8 = 0LL;
  objc_storeStrong(&v8, a5);
  CGFloat v7 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  -[TVSMSystemMenuManager dismissSystemMenuAnimated:result:](v7, "dismissSystemMenuAnimated:result:", v9, v8);

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v16 = a6;
  if (a6 == off_1000564E8)
  {
    id v15 = (id)data_source_log();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v15;
      os_log_type_t type = v14;
      id v8 = -[TVSMModuleDataSource availableModules](v20->_buttonDataSource, "availableModules");
      id v13 = v8;
      sub_1000082C4((uint64_t)v21, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Available button modules updated: %{public}@", v21, 0xCu);

      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    -[TVSMButtonGridCollectionViewController _updateSnapshotAnalyticsOnly:](v20, "_updateSnapshotAnalyticsOnly:", 0LL);
  }

  else if (v16 == off_1000564E0)
  {
    -[TVSMButtonGridCollectionViewController _updateSnapshotAnalyticsOnly:](v20, "_updateSnapshotAnalyticsOnly:", 0LL);
  }

  else
  {
    v12.receiver = v20;
    v12.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewController;
    -[TVSMButtonGridCollectionViewController observeValueForKeyPath:ofObject:change:context:]( &v12,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v18,  v17,  v16);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_moduleAtIndexPath:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  if ([location[0] section])
  {
    BOOL v9 = -[TVSMModuleDataSource availableModules](v13->_buttonDataSource, "availableModules");
    id v5 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", [location[0] item]);
    id v6 = v11;
    id v11 = v5;
  }

  else
  {
    id v10 = -[TVSMPeopleModuleDataSource childModules](v13->_peopleDataSource, "childModules");
    id v3 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(location[0], "item"));
    id v4 = v11;
    id v11 = v3;
  }

  id v8 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)_updateSnapshotAnalyticsOnly:(BOOL)a3
{
  v56 = self;
  SEL v55 = a2;
  BOOL v54 = a3;
  id v53 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  [v53 appendSectionsWithIdentifiers:&off_10004BB10];
  id v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v51 = -[TVSMPeopleModuleDataSource childModules](v56->_peopleDataSource, "childModules");
  memset(__b, 0, sizeof(__b));
  id obj = v51;
  id v32 = [obj countByEnumeratingWithState:__b objects:v58 count:16];
  if (v32)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0LL;
    id v30 = v32;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(obj);
      }
      id v50 = *(id *)(__b[1] + 8 * v29);
      double v25 = objc_alloc(&OBJC_CLASS___TVSMButtonGridLayoutInfo);
      id v26 = [v50 identifier];
      v48 = -[TVSMButtonGridLayoutInfo initWithIdentifier:style:]( v25,  "initWithIdentifier:style:",  v26,  [v50 style]);

      [v52 addObject:v48];
      objc_storeStrong((id *)&v48, 0LL);
      ++v29;
      if (v27 + 1 >= (unint64_t)v30)
      {
        uint64_t v29 = 0LL;
        id v30 = [obj countByEnumeratingWithState:__b objects:v58 count:16];
        if (!v30) {
          break;
        }
      }
    }
  }

  [v53 appendItemsWithIdentifiers:v52 intoSectionWithIdentifier:&off_10004BA30];
  id v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v21 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  id v20 = -[TVSMSystemMenuManager startupContext](v21, "startupContext");
  unsigned __int8 v22 = -[TVSMSystemMenuStartupContext isHomeModuleAvailable](v20, "isHomeModuleAvailable");

  char v46 = v22 & 1;
  char v45 = -[TVSMDefaultModuleDataSource shouldShowAirPodsModule](v56->_buttonDataSource, "shouldShowAirPodsModule");
  char v44 = -[TVSMDefaultModuleDataSource shouldShowGameControllerModule]( v56->_buttonDataSource,  "shouldShowGameControllerModule");
  id v43 = -[TVSMModuleDataSource availableModules](v56->_buttonDataSource, "availableModules");
  memset(v41, 0, sizeof(v41));
  id v23 = v43;
  id v24 = [v23 countByEnumeratingWithState:v41 objects:v57 count:16];
  if (v24)
  {
    uint64_t v17 = *(void *)v41[2];
    uint64_t v18 = 0LL;
    id v19 = v24;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)v41[2] != v17) {
        objc_enumerationMutation(v23);
      }
      id v42 = *(id *)(v41[1] + 8 * v18);
      id v40 = [v42 identifier];
      id v39 = [v42 style];
      if ([v40 isEqualToString:@"com.apple.TVSystemMenu.Audio-Routing-Module"])
      {
        char v15 = 1;
        if ((v46 & 1) == 0)
        {
          char v15 = 1;
          if ((v45 & 1) == 0) {
            char v15 = v44;
          }
        }

        uint64_t v3 = 2LL;
        if ((v15 & 1) != 0) {
          uint64_t v3 = 1LL;
        }
        id v39 = (id)v3;
        id v4 = [v42 style];
        if (v4 != v39)
        {
          [v42 dumpViewController];
          id v14 = -[TVSMButtonGridCollectionViewController collectionView](v56, "collectionView");
          id v13 = [v14 collectionViewLayout];
          [v13 invalidateLayout];

          [v42 setStyle:v39];
        }
      }

      id v5 = objc_alloc(&OBJC_CLASS___TVSMButtonGridLayoutInfo);
      id v38 = -[TVSMButtonGridLayoutInfo initWithIdentifier:style:](v5, "initWithIdentifier:style:", v40, v39);
      [v47 addObject:v38];
      if ((objc_opt_respondsToSelector(v42, "setStartupContext:") & 1) != 0)
      {
        id v10 = v42;
        objc_super v12 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
        id v11 = -[TVSMSystemMenuManager startupContext](v12, "startupContext");
        objc_msgSend(v10, "setStartupContext:");
      }

      objc_storeStrong(&v38, 0LL);
      objc_storeStrong(&v40, 0LL);
      ++v18;
      if (v16 + 1 >= (unint64_t)v19)
      {
        uint64_t v18 = 0LL;
        id v19 = [v23 countByEnumeratingWithState:v41 objects:v57 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  [v53 appendItemsWithIdentifiers:v47 intoSectionWithIdentifier:&off_10004BA48];
  -[NSMapTable removeAllObjects](v56->_analyticsLocationsByModule, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v56->_analyticsImpressions, "removeAllObjects");
  -[TVSMButtonGridCollectionViewController _buildAnalyticsForPeopleModules:andButtonModules:withLocations:impressions:]( v56,  "_buildAnalyticsForPeopleModules:andButtonModules:withLocations:impressions:",  v51,  v43,  v56->_analyticsLocationsByModule,  v56->_analyticsImpressions);
  id v37 = -[UICollectionViewDiffableDataSource snapshot](v56->_diffableDataSource, "snapshot");
  if (!v54 && ([v53 isEqual:v37] & 1) == 0)
  {
    BOOL v36 = 0;
    id v8 = [v37 sectionIdentifiers];
    char v34 = 0;
    unsigned __int8 v9 = 0;
    if ([v8 containsObject:&off_10004BA30])
    {
      id v35 = [v53 sectionIdentifiers];
      char v34 = 1;
      unsigned __int8 v9 = [v35 containsObject:&off_10004BA30];
    }

    if ((v34 & 1) != 0) {

    }
    if ((v9 & 1) != 0)
    {
      id v33 = objc_msgSend(v37, "numberOfItemsInSection:");
      BOOL v36 = v33 != [v53 numberOfItemsInSection:&off_10004BA30];
    }

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:]( v56->_diffableDataSource,  "applySnapshot:animatingDifferences:",  v53,  v36);
    id v7 = -[TVSMButtonGridCollectionViewController collectionView](v56, "collectionView");
    id v6 = [v7 collectionViewLayout];
    [v6 invalidateLayout];
  }

  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
}

- (void)_buildAnalyticsForPeopleModules:(id)a3 andButtonModules:(id)a4 withLocations:(id)a5 impressions:(id)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v73 = 0LL;
  objc_storeStrong(&v73, a4);
  id v72 = 0LL;
  objc_storeStrong(&v72, a5);
  id v71 = 0LL;
  objc_storeStrong(&v71, a6);
  uint64_t v66 = 0LL;
  v67 = &v66;
  int v68 = 0x20000000;
  int v69 = 32;
  uint64_t v70 = 0LL;
  if ([location[0] count])
  {
    id v65 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"user shelf",  TVSMAnalyticsElementTypeShelf,  -1LL,  0LL);
    id v64 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v65,  v67[3]);
    id v63 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v65,  v67[3] + 1,  0LL,  0LL);
    [v71 addObject:v63];
    id v7 = location[0];
    BOOL v54 = _NSConcreteStackBlock;
    int v55 = -1073741824;
    int v56 = 0;
    v57 = sub_10001E350;
    v58 = &unk_1000496B8;
    id v59 = v72;
    id v60 = v64;
    id v61 = v63;
    id v62 = v71;
    [v7 enumerateObjectsUsingBlock:&v54];
    ++v67[3];
    objc_storeStrong(&v62, 0LL);
    objc_storeStrong(&v61, 0LL);
    objc_storeStrong(&v60, 0LL);
    objc_storeStrong(&v59, 0LL);
    objc_storeStrong(&v63, 0LL);
    objc_storeStrong(&v64, 0LL);
    objc_storeStrong(&v65, 0LL);
  }

  v50[0] = 0LL;
  v50[1] = v50;
  int v51 = 0x20000000;
  int v52 = 32;
  uint64_t v53 = 0LL;
  v46[0] = 0LL;
  v46[1] = v46;
  int v47 = 0x20000000;
  int v48 = 32;
  uint64_t v49 = 0LL;
  v40[0] = 0LL;
  v40[1] = v40;
  int v41 = 838860800;
  int v42 = 48;
  id v43 = sub_10001E568;
  char v44 = sub_10001E5BC;
  id v45 = 0LL;
  v34[0] = 0LL;
  v34[1] = v34;
  int v35 = 838860800;
  int v36 = 48;
  id v37 = sub_10001E568;
  id v38 = sub_10001E5BC;
  id v39 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  int v29 = 838860800;
  int v30 = 48;
  id v31 = sub_10001E568;
  id v32 = sub_10001E5BC;
  id v33 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  int v23 = 838860800;
  int v24 = 48;
  double v25 = sub_10001E568;
  id v26 = sub_10001E5BC;
  id v27 = 0LL;
  id v21 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"navigation shelf",  TVSMAnalyticsElementTypeShelf,  -1LL,  0LL);
  id v20 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"undefined shelf",  TVSMAnalyticsElementTypeShelf,  -1LL,  0LL);
  id v6 = v73;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_10001E5E8;
  char v15 = &unk_1000496E0;
  v19[1] = v34;
  id v16 = v20;
  v19[2] = &v66;
  v19[3] = v22;
  id v17 = v71;
  v19[4] = v46;
  id v18 = v72;
  v19[5] = v40;
  v19[0] = v21;
  v19[6] = v28;
  v19[7] = v50;
  [v6 enumerateObjectsUsingBlock:&v11];
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  _Block_object_dispose(v22, 8);
  objc_storeStrong(&v27, 0LL);
  _Block_object_dispose(v28, 8);
  objc_storeStrong(&v33, 0LL);
  _Block_object_dispose(v34, 8);
  objc_storeStrong(&v39, 0LL);
  _Block_object_dispose(v40, 8);
  objc_storeStrong(&v45, 0LL);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v66, 8);
  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_locationAnalyticsForModule:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[NSMapTable objectForKey:](v8->_analyticsLocationsByModule, "objectForKey:", location[0]);
  if (v6) {
    id v3 = v6;
  }
  else {
    id v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  objc_storeStrong(location, 0LL);
  return v5;
}

- (void)_postPageAnalyticsEvent
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] =  +[TVSMPageAnalytics infoWithPageContext:pageId:pageType:]( &OBJC_CLASS___TVSMPageAnalytics,  "infoWithPageContext:pageId:pageType:",  @"ControlCenter",  @"Main",  @"Controls");
  +[TVSMAnalytics reportPageEvent:](&OBJC_CLASS___TVSMAnalytics, "reportPageEvent:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (id)_audioRoutingPreferredIndexPath
{
  id v20 = self;
  v19[1] = (id)a2;
  v19[0] = @"com.apple.TVSystemMenu.Audio-Routing-Module";
  id v18 = @"com.apple.TVSystemMenu.AirPods-Module";
  id location = 0LL;
  if (-[NSString isEqualToString:](v20->_currentFocusedIdentifier, "isEqualToString:", v19[0])) {
    goto LABEL_5;
  }
  if (-[NSString isEqualToString:](v20->_currentFocusedIdentifier, "isEqualToString:", v18))
  {
    if (-[TVSMDefaultModuleDataSource shouldShowAirPodsModule](v20->_buttonDataSource, "shouldShowAirPodsModule"))
    {
      objc_storeStrong(&location, v18);
      goto LABEL_6;
    }

- (id)tvsm_synchronizedDrawingFence
{
  id location[2] = self;
  location[1] = (id)a2;
  id v5 = -[TVSMButtonGridCollectionViewController viewIfLoaded](self, "viewIfLoaded");
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

- (void)_updateLayoutElementWithOverlayTransition:(unint64_t)a3
{
  id v26 = self;
  SEL v25 = a2;
  unint64_t v24 = a3;
  id v7 = -[TVSMButtonGridCollectionViewController navigationController](self, "navigationController");
  id v23 = objc_msgSend(v7, "tvsm_layoutElement");

  if (v23)
  {
    BOOL v21 = v24 == 1;
    id v20 = [(id)objc_opt_class(v26) _overlayAnimationSettingsForTransition:v24];
    char v17 = 0;
    if (v20)
    {
      id v18 =  -[TVSMButtonGridCollectionViewController tvsm_synchronizedDrawingFence]( v26,  "tvsm_synchronizedDrawingFence");
      char v17 = 1;
      id v3 = v18;
    }

    else
    {
      id v3 = 0LL;
    }

    id v19 = v3;
    if ((v17 & 1) != 0) {

    }
    char v14 = 0;
    if (v20)
    {
      id v15 =  +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  v20,  v19);
      char v14 = 1;
      id v4 = v15;
    }

    else
    {
      id v4 = 0LL;
    }

    id v16 = v4;
    if ((v14 & 1) != 0) {

    }
    char v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = sub_10001F7C0;
    id v12 = &unk_100049700;
    BOOL v13 = v21;
    id v5 = objc_msgSend(v23, "updateElement:withTransitionContext:", &v8, v16, &v16);
    objc_storeStrong(location, 0LL);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
    int v22 = 0;
  }

  else
  {
    int v22 = 1;
  }

  objc_storeStrong(&v23, 0LL);
}

+ (id)_overlayAnimationSettingsForTransition:(unint64_t)a3
{
  v10[3] = a1;
  v10[2] = (id)a2;
  v10[1] = (id)a3;
  v10[0] = [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:a3 == 1];
  [v10[0] transitionDuration:0];
  double v9 = v3;
  id v8 = 0LL;
  id location =  +[_UIProgressiveBlurPresentationAnimator alphaAnimationFactory]( &OBJC_CLASS____UIProgressiveBlurPresentationAnimator,  "alphaAnimationFactory");
  if ((objc_opt_respondsToSelector(location, "_timingFunctionForAnimationInView:withKeyPath:") & 1) != 0)
  {
    id v4 = objc_msgSend(location, "_timingFunctionForAnimationInView:withKeyPath:", 0);
    id v5 = v8;
    id v8 = v4;
  }

  id v11 =  +[BSAnimationSettings settingsWithDuration:timingFunction:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:timingFunction:",  v8,  v9);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(v10, 0LL);
  return v11;
}

- (CGRect)selectedCellFrame
{
  double y = self->_selectedCellFrame.origin.y;
  double x = self->_selectedCellFrame.origin.x;
  double height = self->_selectedCellFrame.size.height;
  double width = self->_selectedCellFrame.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (TVSMPeopleModuleDataSource)peopleDataSource
{
  return self->_peopleDataSource;
}

- (TVSMDefaultModuleDataSource)buttonDataSource
{
  return self->_buttonDataSource;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (NSMapTable)analyticsLocationsByModule
{
  return self->_analyticsLocationsByModule;
}

- (NSMutableArray)analyticsImpressions
{
  return self->_analyticsImpressions;
}

- (NSString)currentFocusedIdentifier
{
  return self->_currentFocusedIdentifier;
}

- (void)setCurrentFocusedIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end