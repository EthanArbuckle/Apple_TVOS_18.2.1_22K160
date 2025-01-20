@interface TVSMAirPodsModuleHeadsetsCollectionViewController
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)routes;
- (NSDictionary)routesByUID;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSMutableDictionary)volumeHUDAssertionsByUID;
- (TVNPGroupableRoutingController)routingController;
- (TVNPOutputDeviceRoute)focusedRoute;
- (TVNPOutputDeviceRoute)routeForVolume;
- (TVSMAirPodsModuleHeadsetsCollectionViewController)initWithCollectionViewLayout:(id)a3 routeController:(id)a4;
- (TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)headsetsDataSource;
- (UITapGestureRecognizer)menuRecognizer;
- (UITapGestureRecognizer)selectRecognizer;
- (id)indexPathForVolumeSliderInCollectionView:(id)a3 layout:(id)a4;
- (void)_acquireVolumeHUDAssertionForRouteWithUID:(id)a3;
- (void)_adjustVolume;
- (void)_handleLongPressSelect:(id)a3;
- (void)_handleTapSelect:(id)a3;
- (void)_relinquishVolumeHUDAssertionForRouteWithUID:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)handleEndVolumeControl:(id)a3;
- (void)handleVolumeDown;
- (void)handleVolumeUp;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setFocusedRoute:(id)a3;
- (void)setHeadsetsDataSource:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setRouteForVolume:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setRoutesByUID:(id)a3;
- (void)setRoutingController:(id)a3;
- (void)setSelectRecognizer:(id)a3;
- (void)setVolumeHUDAssertionsByUID:(id)a3;
- (void)updateSnapshot;
- (void)viewDidLoad;
@end

@implementation TVSMAirPodsModuleHeadsetsCollectionViewController

- (TVSMAirPodsModuleHeadsetsCollectionViewController)initWithCollectionViewLayout:(id)a3 routeController:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v4 = v14;
  v14 = 0LL;
  v11.receiver = v4;
  v11.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetsCollectionViewController;
  v10 = -[TVSMAirPodsModuleHeadsetsCollectionViewController initWithCollectionViewLayout:]( &v11,  "initWithCollectionViewLayout:",  location[0]);
  v14 = v10;
  objc_storeStrong((id *)&v14, v10);
  if (v10)
  {
    v16 = (dispatch_once_t *)&unk_5F8A0;
    id v15 = 0LL;
    objc_storeStrong(&v15, &stru_506E0);
    if (*v16 != -1) {
      dispatch_once(v16, v15);
    }
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong((id *)&v14->_routingController, v12);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    volumeHUDAssertionsByUID = v14->_volumeHUDAssertionsByUID;
    v14->_volumeHUDAssertionsByUID = v5;

    -[TVSMAirPodsModuleHeadsetsCollectionViewController setInstallsStandardGestureForInteractiveMovement:]( v14,  "setInstallsStandardGestureForInteractiveMovement:",  0LL);
  }

  v8 = v14;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v8;
}

- (void)viewDidLoad
{
  v36 = self;
  SEL v35 = a2;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetsCollectionViewController;
  -[TVSMAirPodsModuleHeadsetsCollectionViewController viewDidLoad](&v34, "viewDidLoad");
  id v18 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v18 setContentInsetAdjustmentBehavior:2];

  id v19 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v19 setIndexDisplayMode:1];

  id v20 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v20 setClipsToBounds:0];

  id v23 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRouteCollectionViewCell);
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRouteCollectionViewCell);
  v22 = NSStringFromClass(v2);
  objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", v21);

  objc_initWeak(&location, v36);
  v24 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v16 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_6EE8;
  v31 = &unk_50708;
  objc_copyWeak(v32, &location);
  v17 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v24,  "initWithCollectionView:cellProvider:",  v16,  &v27);
  headsetsDataSource = v36->_headsetsDataSource;
  v36->_headsetsDataSource = v17;

  id v15 = objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer);
  id v26 = -[UILongPressGestureRecognizer initWithTarget:action:]( v15,  "initWithTarget:action:",  v36,  "_handleLongPressSelect:");
  [v26 setAllowedPressTypes:&off_53318];
  id v14 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v14 addGestureRecognizer:v26];

  v13 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  id v25 = -[UITapGestureRecognizer initWithTarget:action:](v13, "initWithTarget:action:", v36, "_handleTapSelect:");
  [v25 setAllowedPressTypes:&off_53330];
  id v12 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v12 addGestureRecognizer:v25];

  objc_super v11 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v10 = -[UITapGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v36, "handleEndVolumeControl:");
  menuRecognizer = v36->_menuRecognizer;
  v36->_menuRecognizer = v10;

  -[UITapGestureRecognizer setAllowedPressTypes:](v36->_menuRecognizer, "setAllowedPressTypes:", &off_53348);
  -[UITapGestureRecognizer setEnabled:](v36->_menuRecognizer, "setEnabled:", 0LL);
  id v9 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v9 addGestureRecognizer:v36->_menuRecognizer];

  v8 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v7 = -[UITapGestureRecognizer initWithTarget:action:](v8, "initWithTarget:action:", v36, "handleEndVolumeControl:");
  selectRecognizer = v36->_selectRecognizer;
  v36->_selectRecognizer = v7;

  -[UITapGestureRecognizer setAllowedPressTypes:](v36->_selectRecognizer, "setAllowedPressTypes:", &off_53360);
  -[UITapGestureRecognizer setEnabled:](v36->_selectRecognizer, "setEnabled:", 0LL);
  id v6 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v36, "collectionView");
  [v6 addGestureRecognizer:v36->_selectRecognizer];

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPOutputDeviceRoute removeObserver:forKeyPath:context:]( self->_focusedRoute,  "removeObserver:forKeyPath:context:",  self,  @"volumeLevel",  off_5F240);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetsCollectionViewController;
  -[TVSMAirPodsModuleHeadsetsCollectionViewController dealloc](&v2, "dealloc");
}

- (void)setRoutes:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_routes, location[0]);
  -[TVSMAirPodsModuleHeadsetsCollectionViewController updateSnapshot](v4, "updateSnapshot");
  objc_storeStrong(location, 0LL);
}

- (void)updateSnapshot
{
  int v28 = self;
  v27[1] = (id)a2;
  v27[0] = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  [v27[0] appendSectionsWithIdentifiers:&off_53378];
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  obj = v28->_routes;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0LL;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v12);
      id v9 = v27[0];
      id v8 = [v25 routeUID];
      id v29 = v8;
      v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL);
      objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

      id v5 = v26;
      id v6 = v25;
      id v4 = [v25 routeUID];
      objc_msgSend(v5, "setObject:forKey:", v6);

      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
        if (!v13) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)&v28->_routesByUID, v26);
  objc_initWeak(&location, v28);
  headsetsDataSource = v28->_headsetsDataSource;
  id v3 = v27[0];
  id v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = sub_75D4;
  id v20 = &unk_50730;
  objc_copyWeak(&v22, &location);
  id v21 = v26;
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:]( headsetsDataSource,  "applySnapshot:animatingDifferences:completion:",  v3,  1LL,  &v16);
  objc_storeStrong(&v21, 0LL);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(v27, 0LL);
}

- (void)_handleLongPressSelect:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)_handleTapSelect:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMAirPodsModuleHeadsetsCollectionViewController _adjustVolume](v4, "_adjustVolume");
  objc_storeStrong(location, 0LL);
}

- (void)handleEndVolumeControl:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)setRouteForVolume:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v13->_routeForVolume != location[0])
  {
    id v4 = -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView](v13, "collectionView");
    id v3 = [v4 collectionViewLayout];
    [v3 invalidateLayout];

    uint64_t v11 = -[TVSMAirPodsModuleHeadsetsCollectionViewController delegate](v13, "delegate");
    if (v13->_routeForVolume || !location[0])
    {
      if (v13->_routeForVolume && !location[0]) {
        -[TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate headsetsViewControllerWillEndEditingVolume:]( v11,  "headsetsViewControllerWillEndEditingVolume:",  v13);
      }
    }

    else
    {
      -[TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate headsetsViewControllerWillBeginEditingVolume:]( v11,  "headsetsViewControllerWillBeginEditingVolume:",  v13);
    }

    objc_storeStrong((id *)&v13->_routeForVolume, location[0]);
    -[TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate headsetsViewController:didSetRouteForVolume:]( v11,  "headsetsViewController:didSetRouteForVolume:",  v13,  location[0]);
    -[UITapGestureRecognizer setEnabled:](v13->_menuRecognizer, "setEnabled:", location[0] != 0LL);
    -[UITapGestureRecognizer setEnabled:](v13->_selectRecognizer, "setEnabled:", location[0] != 0LL);
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_79DC;
    id v9 = &unk_50698;
    uint64_t v10 = v13;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  &v5,  0LL);
    objc_storeStrong((id *)&v10, 0LL);
    objc_storeStrong((id *)&v11, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_adjustVolume
{
  objc_super v2 = -[TVNPRoute volumeLevel](self->_focusedRoute, "volumeLevel");
  BOOL v3 = 0;
  if (v2) {
    BOOL v3 = (char *)-[TVNPRoute selectionState](self->_focusedRoute, "selectionState") == (char *)&dword_0 + 2;
  }

  if (v3) {
    -[TVSMAirPodsModuleHeadsetsCollectionViewController setRouteForVolume:]( self,  "setRouteForVolume:",  self->_focusedRoute);
  }
}

- (void)handleVolumeUp
{
  v37 = self;
  v36[1] = (id)a2;
  v36[0] = -[TVNPRoute volumeLevel](self->_focusedRoute, "volumeLevel");
  id v19 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
  id v35 = -[TVNPRoutingDestination volumeLevel](v19, "volumeLevel");

  BOOL v34 = (char *)-[TVNPRoute selectionState](v37->_focusedRoute, "selectionState") == (char *)&dword_0 + 2;
  if (v37->_focusedRoute && v36[0] && v34)
  {
    [v36[0] floatValue];
    double v32 = v2 + 0.0625;
    double v31 = 1.0;
    if (v32 >= 1.0) {
      double v18 = v31;
    }
    else {
      double v18 = v32;
    }
    location[1] = *(id *)&v18;
    double v33 = v18;
    location[0] = (id)qword_5F8A8;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t focusedRoute = (uint64_t)v37->_focusedRoute;
      [v36[0] floatValue];
      sub_7FE4((uint64_t)v39, focusedRoute, COERCE__INT64(v3), *(uint64_t *)&v33);
      _os_log_impl(&dword_0, (os_log_t)location[0], v29, "Focused route %@ volume up from %f to %f", v39, 0x20u);
    }

    objc_storeStrong(location, 0LL);
    id v15 = v37->_focusedRoute;
    id v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33);
    -[TVNPOutputDeviceRoute setVolumeLevel:](v15, "setVolumeLevel:");
  }

  else if (v35)
  {
    [v35 floatValue];
    double v27 = v4 + 0.0625;
    double v26 = 1.0;
    if (v27 >= 1.0) {
      id v14 = *(os_log_s **)&v26;
    }
    else {
      id v14 = *(os_log_s **)&v27;
    }
    oslog[1] = v14;
    int v28 = v14;
    oslog[0] = (os_log_t)(id)qword_5F8A8;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = oslog[0];
      os_log_type_t v12 = v24;
      id v13 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
      uint64_t v10 = v13;
      id v23 = v10;
      [v35 floatValue];
      sub_7FE4((uint64_t)v38, (uint64_t)v10, COERCE__INT64(v5), (uint64_t)v28);
      _os_log_impl(&dword_0, v11, v12, "Focused destination %@ volume up from %f to %f", v38, 0x20u);

      objc_storeStrong((id *)&v23, 0LL);
    }

    objc_storeStrong((id *)oslog, 0LL);
    id v9 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
    id v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v28);
    -[TVNPRoutingDestination setVolumeLevel:](v9, "setVolumeLevel:");
  }

  else
  {
    os_log_t v22 = (os_log_t)(id)qword_5F8A8;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = v22;
      os_log_type_t v7 = v21;
      sub_804C(v20);
      _os_log_impl(&dword_0, v6, v7, "Volume up not available", v20, 2u);
    }

    objc_storeStrong((id *)&v22, 0LL);
  }

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(v36, 0LL);
}

- (void)handleVolumeDown
{
  v37 = self;
  v36[1] = (id)a2;
  v36[0] = -[TVNPRoute volumeLevel](self->_focusedRoute, "volumeLevel");
  id v19 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
  id v35 = -[TVNPRoutingDestination volumeLevel](v19, "volumeLevel");

  BOOL v34 = (char *)-[TVNPRoute selectionState](v37->_focusedRoute, "selectionState") == (char *)&dword_0 + 2;
  if (v37->_focusedRoute && v36[0] && v34)
  {
    [v36[0] floatValue];
    double v32 = v2 - 0.0625;
    double v31 = 0.0;
    if (v32 >= 0.0) {
      double v18 = v32;
    }
    else {
      double v18 = v31;
    }
    location[1] = *(id *)&v18;
    double v33 = v18;
    location[0] = (id)qword_5F8A8;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t focusedRoute = (uint64_t)v37->_focusedRoute;
      [v36[0] floatValue];
      sub_7FE4((uint64_t)v39, focusedRoute, COERCE__INT64(v3), *(uint64_t *)&v33);
      _os_log_impl(&dword_0, (os_log_t)location[0], v29, "Focused route %@ volume down from %f to %f", v39, 0x20u);
    }

    objc_storeStrong(location, 0LL);
    id v15 = v37->_focusedRoute;
    id v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33);
    -[TVNPOutputDeviceRoute setVolumeLevel:](v15, "setVolumeLevel:");
  }

  else if (v35)
  {
    [v35 floatValue];
    double v27 = v4 - 0.0625;
    double v26 = 0LL;
    if (v27 >= 0.0) {
      id v14 = *(os_log_s **)&v27;
    }
    else {
      id v14 = v26;
    }
    oslog[1] = v14;
    int v28 = v14;
    oslog[0] = (os_log_t)(id)qword_5F8A8;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = oslog[0];
      os_log_type_t v12 = v24;
      id v13 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
      uint64_t v10 = v13;
      id v23 = v10;
      [v35 floatValue];
      sub_7FE4((uint64_t)v38, (uint64_t)v10, COERCE__INT64(v5), (uint64_t)v28);
      _os_log_impl(&dword_0, v11, v12, "Focused destination %@ volume down from %f to %f", v38, 0x20u);

      objc_storeStrong((id *)&v23, 0LL);
    }

    objc_storeStrong((id *)oslog, 0LL);
    id v9 = -[TVNPGroupableRoutingController currentDestination](v37->_routingController, "currentDestination");
    id v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v28);
    -[TVNPRoutingDestination setVolumeLevel:](v9, "setVolumeLevel:");
  }

  else
  {
    os_log_t v22 = (os_log_t)(id)qword_5F8A8;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = v22;
      os_log_type_t v7 = v21;
      sub_804C(v20);
      _os_log_impl(&dword_0, v6, v7, "Volume down not available", v20, 2u);
    }

    objc_storeStrong((id *)&v22, 0LL);
  }

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(v36, 0LL);
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
  if (a6 == off_5F240)
  {
    BOOL v6 = (char *)-[TVNPRoute selectionState](v20->_focusedRoute, "selectionState") != (char *)&dword_0 + 2;
    char v14 = 0;
    BOOL v9 = 0;
    if (!v6)
    {
      id v15 = -[TVNPRoute volumeLevel](v20->_focusedRoute, "volumeLevel");
      char v14 = 1;
      BOOL v9 = v15 != 0LL;
    }

    if ((v14 & 1) != 0) {

    }
    if (v9)
    {
      os_log_type_t v7 = v20;
      id v8 = -[TVNPRoute routeUID](v20->_focusedRoute, "routeUID");
      -[TVSMAirPodsModuleHeadsetsCollectionViewController _acquireVolumeHUDAssertionForRouteWithUID:]( v7,  "_acquireVolumeHUDAssertionForRouteWithUID:");
    }
  }

  else
  {
    v13.receiver = v20;
    v13.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetsCollectionViewController;
    -[TVSMAirPodsModuleHeadsetsCollectionViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v18,  v17,  v16);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  char v14 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routesByUID](v19, "routesByUID");
  objc_super v13 = -[TVSMAirPodsModuleHeadsetsCollectionViewController headsetsDataSource](v19, "headsetsDataSource");
  id v12 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v13, "itemIdentifierForIndexPath:", v16);
  id v15 = -[NSDictionary objectForKey:](v14, "objectForKey:");

  objc_msgSend(v17, "estimatedItemSize", &v17);
  sub_88FC();
  double v20 = v5;
  double v21 = v6;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  double v7 = v20;
  double v8 = v21;
  result.height = v8;
  result.width = v7;
  return result;
}

  ;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  double v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  id v23 = 0LL;
  objc_storeStrong(&v23, a5);
  id v22 = [v24 nextFocusedIndexPath];
  if (v22)
  {
    uint64_t v10 = -[TVSMAirPodsModuleHeadsetsCollectionViewController headsetsDataSource](v26, "headsetsDataSource");
    id v20 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v10, "itemIdentifierForIndexPath:", v22);

    id v18 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routesByUID](v26, "routesByUID");
    char v17 = 1;
    id v16 = -[NSDictionary objectForKey:](v18, "objectForKey:", v20);
    char v15 = 1;
    id v19 = v16;

    id v8 = [v24 previouslyFocusedIndexPath];
    id v5 = [v24 nextFocusedIndexPath];
    BOOL v9 = v8 == v5;

    if (!v9)
    {
      id v14 = [location[0] cellForItemAtIndexPath:v22];
      [v14 setNeedsFocusUpdate];
      id v6 = location[0];
      id v7 = [v24 previouslyFocusedIndexPath];
      id v13 = objc_msgSend(v6, "cellForItemAtIndexPath:");

      [v13 setNeedsFocusUpdate];
      -[TVNPOutputDeviceRoute removeObserver:forKeyPath:context:]( v26->_focusedRoute,  "removeObserver:forKeyPath:context:",  v26);
      [v19 addObserver:v26 forKeyPath:@"volumeLevel" options:0 context:off_5F240];
      -[TVSMAirPodsModuleHeadsetsCollectionViewController setFocusedRoute:](v26, "setFocusedRoute:", v19);
      objc_storeStrong(&v13, 0LL);
      objc_storeStrong(&v14, 0LL);
    }

    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
    int v21 = 0;
  }

  else
  {
    int v21 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  float v4 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routeForVolume](v10, "routeForVolume");
  BOOL v7 = v4 == 0LL;

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  BOOL v7 = -[TVSMAirPodsModuleHeadsetsCollectionViewController headsetsDataSource](v17, "headsetsDataSource");
  id v13 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", v14);

  id v8 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routesByUID](v17, "routesByUID");
  id v12 = -[NSDictionary objectForKey:](v8, "objectForKey:", v13);

  char v10 = 0;
  BOOL v9 = 0;
  if ([v12 selectionState] == (char *)&dword_0 + 2)
  {
    id v11 = [v12 volumeLevel];
    char v10 = 1;
    BOOL v9 = v11 != 0LL;
  }

  if ((v10 & 1) != 0) {

  }
  if (v9) {
    -[TVSMAirPodsModuleHeadsetsCollectionViewController _acquireVolumeHUDAssertionForRouteWithUID:]( v17,  "_acquireVolumeHUDAssertionForRouteWithUID:",  v13);
  }
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  BOOL v7 = -[TVSMAirPodsModuleHeadsetsCollectionViewController headsetsDataSource](v17, "headsetsDataSource");
  id v13 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", v14);

  id v8 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routesByUID](v17, "routesByUID");
  id v12 = -[NSDictionary objectForKey:](v8, "objectForKey:", v13);

  char v10 = 0;
  BOOL v9 = 0;
  if ([v12 selectionState] == (char *)&dword_0 + 2)
  {
    id v11 = [v12 volumeLevel];
    char v10 = 1;
    BOOL v9 = v11 != 0LL;
  }

  if ((v10 & 1) != 0) {

  }
  if (v9) {
    -[TVSMAirPodsModuleHeadsetsCollectionViewController _relinquishVolumeHUDAssertionForRouteWithUID:]( v17,  "_relinquishVolumeHUDAssertionForRouteWithUID:",  v13);
  }
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)indexPathForVolumeSliderInCollectionView:(id)a3 layout:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v8 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routeForVolume](v12, "routeForVolume");

  if (v8)
  {
    BOOL v9 = -[TVSMAirPodsModuleHeadsetsCollectionViewController routeForVolume](v12, "routeForVolume");
    id v6 = -[TVSMAirPodsModuleHeadsetsCollectionViewController headsetsDataSource](v12, "headsetsDataSource");
    id v5 = -[TVNPRoute routeUID](v9, "routeUID");
    id v13 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](v6, "indexPathForItemIdentifier:");

    objc_storeStrong((id *)&v9, 0LL);
  }

  else
  {
    id v13 = 0LL;
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

- (void)_acquireVolumeHUDAssertionForRouteWithUID:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    BOOL v7 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController volumeHUDAssertionsByUID]( v10,  "volumeHUDAssertionsByUID");
    id v8 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", location[0]);

    if (v8)
    {
      [v8 acquire];
    }

    else
    {
      id v4 = objc_alloc(&OBJC_CLASS___PBSVolumeHUDAssertion);
      float v3 = (objc_class *)objc_opt_class(v10);
      id v5 = NSStringFromClass(v3);
      id v8 = objc_msgSend(v4, "initWithIdentifier:");

      [v8 acquire];
      id v6 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController volumeHUDAssertionsByUID]( v10,  "volumeHUDAssertionsByUID");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, location[0]);
    }

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_relinquishVolumeHUDAssertionForRouteWithUID:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  float v3 = -[TVSMAirPodsModuleHeadsetsCollectionViewController volumeHUDAssertionsByUID](v6, "volumeHUDAssertionsByUID");
  id v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", location[0]);

  if (v4) {
    [v4 relinquish];
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (NSArray)routes
{
  return self->_routes;
}

- (TVNPOutputDeviceRoute)focusedRoute
{
  return self->_focusedRoute;
}

- (void)setFocusedRoute:(id)a3
{
}

- (TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate)delegate
{
  return (TVSMAirPodsModuleHeadsetsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionViewDiffableDataSource)headsetsDataSource
{
  return self->_headsetsDataSource;
}

- (void)setHeadsetsDataSource:(id)a3
{
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
}

- (NSDictionary)routesByUID
{
  return self->_routesByUID;
}

- (void)setRoutesByUID:(id)a3
{
}

- (TVNPOutputDeviceRoute)routeForVolume
{
  return self->_routeForVolume;
}

- (NSMutableDictionary)volumeHUDAssertionsByUID
{
  return self->_volumeHUDAssertionsByUID;
}

- (void)setVolumeHUDAssertionsByUID:(id)a3
{
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)selectRecognizer
{
  return self->_selectRecognizer;
}

- (void)setSelectRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end