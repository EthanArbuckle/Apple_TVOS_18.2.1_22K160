@interface TVNPRoutingRoutesCollectionViewController
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)isShareAudioFocused;
- (BOOL)observingChanges;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDictionary)routesByUID;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSMutableDictionary)volumeHUDAssertionsByUID;
- (NSMutableSet)expandedGroupUIDs;
- (TVNPRoute)focusedRoute;
- (TVNPRoute)routeForVolume;
- (TVNPRoutingController)routingController;
- (TVNPRoutingRoutesCollectionViewController)initWithCollectionViewLayout:(id)a3 routingController:(id)a4;
- (TVNPRoutingRoutesCollectionViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)routesDataSource;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)menuRecognizer;
- (UITapGestureRecognizer)selectRecognizer;
- (id)_gradientMask;
- (id)indexPathForVolumeSliderInCollectionView:(id)a3 layout:(id)a4;
- (void)_acquireVolumeHUDAssertionForRouteWithUID:(id)a3;
- (void)_calculateVisibleVolumeCells;
- (void)_cleanupRouteForVolumeIfNeeded;
- (void)_pickRoute:(id)a3;
- (void)_relinquishVolumeHUDAssertionForRouteWithUID:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)handleEndVolumeControl:(id)a3;
- (void)handleVolumeDown;
- (void)handleVolumeUp;
- (void)longPressSelect:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)routeCellDidSelectAccessoryView:(id)a3;
- (void)routeCellDidSelectRouteView:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedGroupUIDs:(id)a3;
- (void)setFocusedRoute:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setObservingChanges:(BOOL)a3;
- (void)setRouteForVolume:(id)a3;
- (void)setRoutesByUID:(id)a3;
- (void)setRoutesDataSource:(id)a3;
- (void)setSelectRecognizer:(id)a3;
- (void)setShareAudioFocused:(BOOL)a3;
- (void)setVolumeHUDAssertionsByUID:(id)a3;
- (void)shareAudioSelected;
- (void)updateCollectionViewWithRoutes:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVNPRoutingRoutesCollectionViewController

- (TVNPRoutingRoutesCollectionViewController)initWithCollectionViewLayout:(id)a3 routingController:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  v4 = v16;
  v16 = 0LL;
  v13.receiver = v4;
  v13.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController;
  v12 = -[TVNPRoutingRoutesCollectionViewController initWithCollectionViewLayout:]( &v13,  "initWithCollectionViewLayout:",  location[0]);
  v16 = v12;
  objc_storeStrong((id *)&v16, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v16->_routingController, v14);
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    volumeHUDAssertionsByUID = v16->_volumeHUDAssertionsByUID;
    v16->_volumeHUDAssertionsByUID = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    expandedGroupUIDs = v16->_expandedGroupUIDs;
    v16->_expandedGroupUIDs = v7;

    -[TVNPRoutingRoutesCollectionViewController setInstallsStandardGestureForInteractiveMovement:]( v16,  "setInstallsStandardGestureForInteractiveMovement:",  0LL);
  }

  v10 = v16;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v10;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPRoutingRoutesCollectionViewController setObservingChanges:](self, "setObservingChanges:", 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController;
  -[TVNPRoutingRoutesCollectionViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  v43 = self;
  SEL v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController;
  -[TVNPRoutingRoutesCollectionViewController viewDidLoad](&v41, "viewDidLoad");
  id v20 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v20 setRemembersLastFocusedIndexPath:1];

  id v21 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v21 setIndexDisplayMode:1];

  id v24 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___TVNPRouteCollectionViewCell);
  objc_super v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPRouteCollectionViewCell);
  v23 = NSStringFromClass(v2);
  objc_msgSend(v24, "registerClass:forCellWithReuseIdentifier:", v22);

  id v25 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v25 registerClass:objc_opt_class(TVNPRouteCollectionViewCell) forCellWithReuseIdentifier:@"TVNPShareAudioItemIdentifier"];

  id v26 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v26 registerClass:objc_opt_class(TVNPRoutesHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];

  objc_initWeak(&location, v43);
  v27 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v18 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_2F718;
  v38 = &unk_50D88;
  objc_copyWeak(v39, &location);
  v19 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v27,  "initWithCollectionView:cellProvider:",  v18,  &v34);
  -[TVNPRoutingRoutesCollectionViewController setRoutesDataSource:](v43, "setRoutesDataSource:", v19);

  routesDataSource = v43->_routesDataSource;
  v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  v31 = sub_2FA3C;
  v32 = &unk_511B8;
  objc_copyWeak(&v33, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:]( routesDataSource,  "setSupplementaryViewProvider:",  &v28);
  v16 = objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer);
  v15 = -[UILongPressGestureRecognizer initWithTarget:action:](v16, "initWithTarget:action:", v43, "longPressSelect:");
  longPressRecognizer = v43->_longPressRecognizer;
  v43->_longPressRecognizer = v15;

  -[UILongPressGestureRecognizer setAllowedPressTypes:](v43->_longPressRecognizer, "setAllowedPressTypes:", &off_52EF0);
  id v14 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v14 addGestureRecognizer:v43->_longPressRecognizer];

  objc_super v13 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v12 = -[UITapGestureRecognizer initWithTarget:action:](v13, "initWithTarget:action:", v43, "handleEndVolumeControl:");
  menuRecognizer = v43->_menuRecognizer;
  v43->_menuRecognizer = v12;

  -[UITapGestureRecognizer setAllowedPressTypes:](v43->_menuRecognizer, "setAllowedPressTypes:", &off_52F08);
  -[UITapGestureRecognizer setEnabled:](v43->_menuRecognizer, "setEnabled:", 0LL);
  id v11 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v11 addGestureRecognizer:v43->_menuRecognizer];

  v10 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v9 = -[UITapGestureRecognizer initWithTarget:action:](v10, "initWithTarget:action:", v43, "handleEndVolumeControl:");
  selectRecognizer = v43->_selectRecognizer;
  v43->_selectRecognizer = v9;

  -[UITapGestureRecognizer setAllowedPressTypes:](v43->_selectRecognizer, "setAllowedPressTypes:", &off_52F20);
  -[UITapGestureRecognizer setEnabled:](v43->_selectRecognizer, "setEnabled:", 0LL);
  id v8 = -[TVNPRoutingRoutesCollectionViewController collectionView](v43, "collectionView");
  [v8 addGestureRecognizer:v43->_selectRecognizer];

  v7 = v43;
  id v6 = -[TVNPRoutingController availableRoutesAndGroups](v43->_routingController, "availableRoutesAndGroups");
  -[TVNPRoutingRoutesCollectionViewController updateCollectionViewWithRoutes:](v7, "updateCollectionViewWithRoutes:");

  objc_destroyWeak(&v33);
  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController;
  -[TVNPRoutingRoutesCollectionViewController viewDidLayoutSubviews](&v21, "viewDidLayoutSubviews");
  id v14 = -[TVNPRoutingRoutesCollectionViewController view](v23, "view");
  id v13 = [v14 layer];
  id location = [v13 mask];

  char v17 = 0;
  BOOL v15 = 1;
  if (location)
  {
    id v18 = -[TVNPRoutingRoutesCollectionViewController view](v23, "view");
    char v17 = 1;
    [v18 bounds];
    v19.origin.x = v2;
    v19.origin.y = v3;
    v19.size.width = v4;
    v19.size.height = v5;
    [location bounds];
    rect2.origin.x = v6;
    rect2.origin.y = v7;
    rect2.size.width = v8;
    rect2.size.height = v9;
    BOOL v15 = !CGRectEqualToRect(v19, rect2);
  }

  if ((v17 & 1) != 0) {

  }
  if (v15)
  {
    id v12 = -[TVNPRoutingRoutesCollectionViewController view](v23, "view");
    id v11 = [v12 layer];
    id v10 = -[TVNPRoutingRoutesCollectionViewController _gradientMask](v23, "_gradientMask");
    objc_msgSend(v11, "setMask:");
  }

  -[TVNPRoutingRoutesCollectionViewController setObservingChanges:](v23, "setObservingChanges:", 1LL);
  objc_storeStrong(&location, 0LL);
}

- (void)setObservingChanges:(BOOL)a3
{
  if (a3 != self->_observingChanges)
  {
    self->_observingChanges = a3;
    if (a3) {
      -[TVNPRoutingController addObserver:forKeyPath:options:context:]( self->_routingController,  "addObserver:forKeyPath:options:context:",  self,  @"availableRoutesAndGroups",  3LL,  off_5EB78);
    }
    else {
      -[TVNPRoutingController removeObserver:forKeyPath:context:]( self->_routingController,  "removeObserver:forKeyPath:context:",  self,  @"availableRoutesAndGroups",  off_5EB78);
    }
  }

- (void)updateCollectionViewWithRoutes:(id)a3
{
  id v93 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v58 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v58);

  id v91 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v90 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  [v90 appendSectionsWithIdentifiers:&off_52F38];
  id v89 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v88 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v87 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v86 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  char v85 = 0;
  uint64_t v84 = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v60 = [obj countByEnumeratingWithState:__b objects:v101 count:16];
  if (v60)
  {
    uint64_t v55 = *(void *)__b[2];
    uint64_t v56 = 0LL;
    id v57 = v60;
    while (1)
    {
      uint64_t v54 = v56;
      if (*(void *)__b[2] != v55) {
        objc_enumerationMutation(obj);
      }
      id v83 = *(id *)(__b[1] + 8 * v56);
      id v53 = v83;
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
      if ((objc_opt_isKindOfClass(v53, v3) & 1) != 0)
      {
        id v81 = [v83 outputDeviceRoute];
        id v51 = v91;
        id v50 = v83;
        id v52 = [v83 routeUID];
        objc_msgSend(v51, "setObject:forKey:", v50);

        if ([v81 routeSubtype] == (char *)&dword_8 + 2
          || ([v81 isDeviceRoute] & 1) != 0
          || ([v81 isAirPlayRoute] & 1) != 0)
        {
          [v89 addObject:v83];
        }

        else if ([v81 isSplitterCapable])
        {
          [v87 addObject:v83];
          if ([v83 selectionState] == (char *)&dword_0 + 2)
          {
            if ((v85 & 1) == 0) {
              char v85 = 1;
            }
            ++v84;
          }
        }

        else if ([v81 isHeadphonesRoute])
        {
          [v87 addObject:v83];
        }

        else
        {
          [v88 addObject:v83];
        }

        objc_storeStrong(&v81, 0LL);
      }

      else
      {
        id v49 = v83;
        uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
        if ((objc_opt_isKindOfClass(v49, v4) & 1) != 0)
        {
          id v80 = [v83 groupUID];
          if ([*((id *)v93 + 7) containsObject:v80] & 1)
          {
            id v78 = v83;
            id v41 = v89;
            id v42 = [v78 leader];
            objc_msgSend(v41, "addObject:");

            id v43 = v91;
            id v46 = [v78 leader];
            id v45 = [v78 leader];
            id v44 = [v45 routeUID];
            objc_msgSend(v43, "setObject:forKey:", v46);

            [v86 addObject:v80];
            memset(v76, 0, sizeof(v76));
            id v47 = [v78 members];
            id v48 = [v47 countByEnumeratingWithState:v76 objects:v100 count:16];
            if (v48)
            {
              uint64_t v38 = *(void *)v76[2];
              uint64_t v39 = 0LL;
              id v40 = v48;
              while (1)
              {
                uint64_t v37 = v39;
                if (*(void *)v76[2] != v38) {
                  objc_enumerationMutation(v47);
                }
                id v77 = *(id *)(v76[1] + 8 * v39);
                id v35 = v91;
                id v34 = v77;
                id v36 = [v77 routeUID];
                objc_msgSend(v35, "setObject:forKey:", v34);

                [v89 addObject:v77];
                ++v39;
                if (v37 + 1 >= (unint64_t)v40)
                {
                  uint64_t v39 = 0LL;
                  id v40 = [v47 countByEnumeratingWithState:v76 objects:v100 count:16];
                  if (!v40) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v78, 0LL);
          }

          else
          {
            id v33 = [v83 routeUID];
            id v75 = objc_msgSend(@"Group-", "stringByAppendingString:");

            [v91 setObject:v83 forKey:v75];
            [v89 addObject:v83];
            objc_storeStrong(&v75, 0LL);
          }

          objc_storeStrong(&v80, 0LL);
        }
      }

      ++v56;
      if (v54 + 1 >= (unint64_t)v57)
      {
        uint64_t v56 = 0LL;
        id v57 = [obj countByEnumeratingWithState:__b objects:v101 count:16];
        if (!v57) {
          break;
        }
      }
    }
  }

  id v31 = v90;
  id v32 = [v87 valueForKey:@"routeUID"];
  objc_msgSend(v31, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

  if ((v85 & 1) != 0 && v84 == 1)
  {
    if (MGGetBoolAnswer(@"2zyzecwSf2ZYRpB3tuQhOQ") & 1) {
      [v90 appendItemsWithIdentifiers:&off_52F50 intoSectionWithIdentifier:@"TVNPHeadphonesSectionIdentifier"];
    }
  }

  memset(v72, 0, sizeof(v72));
  id v29 = v89;
  id v30 = [v29 countByEnumeratingWithState:v72 objects:v99 count:16];
  if (v30)
  {
    uint64_t v26 = *(void *)v72[2];
    uint64_t v27 = 0LL;
    id v28 = v30;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)v72[2] != v26) {
        objc_enumerationMutation(v29);
      }
      id v73 = *(id *)(v72[1] + 8 * v27);
      id v24 = v73;
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
      if ((objc_opt_isKindOfClass(v24, v5) & 1) != 0)
      {
        id v21 = [v73 routeUID];
        id v71 = objc_msgSend(@"Group-", "stringByAppendingString:");

        id v22 = v90;
        id v98 = v71;
        v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v98, 1LL);
        objc_msgSend(v22, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

        objc_storeStrong(&v71, 0LL);
      }

      else
      {
        id v18 = v90;
        id v20 = [v73 routeUID];
        id v97 = v20;
        CGRect v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v97, 1LL);
        objc_msgSend(v18, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");
      }

      ++v27;
      if (v25 + 1 >= (unint64_t)v28)
      {
        uint64_t v27 = 0LL;
        id v28 = [v29 countByEnumeratingWithState:v72 objects:v99 count:16];
        if (!v28) {
          break;
        }
      }
    }
  }

  id v14 = v90;
  id v15 = [v88 valueForKey:@"routeUID"];
  objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

  memset(v69, 0, sizeof(v69));
  id v16 = [v90 sectionIdentifiers];
  id v17 = [v16 countByEnumeratingWithState:v69 objects:v96 count:16];
  if (v17)
  {
    uint64_t v11 = *(void *)v69[2];
    uint64_t v12 = 0LL;
    id v13 = v17;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)v69[2] != v11) {
        objc_enumerationMutation(v16);
      }
      uint64_t v70 = *(void *)(v69[1] + 8 * v12);
      if (![v90 numberOfItemsInSection:v70])
      {
        id v8 = v90;
        uint64_t v95 = v70;
        CGFloat v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v95, 1LL);
        objc_msgSend(v8, "deleteSectionsWithIdentifiers:");
      }

      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = [v16 countByEnumeratingWithState:v69 objects:v96 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)v93 + 4, v90);
  objc_storeStrong((id *)v93 + 8, v91);
  objc_storeStrong((id *)v93 + 7, v86);
  os_log_t oslog = &_os_log_default;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_51B8((uint64_t)v94, (uint64_t)v90);
    _os_log_impl( &dword_0,  oslog,  type,  "TVNPRoutingRoutesCollectionViewController: Applying snapshot %{public}@",  v94,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  id v7 = [v93 routesDataSource];
  id v6 = v90;
  v61 = _NSConcreteStackBlock;
  int v62 = -1073741824;
  int v63 = 0;
  v64 = sub_30E0C;
  v65 = &unk_50B50;
  id v66 = v93;
  [v7 applySnapshot:v6 animatingDifferences:1 completion:&v61];

  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)handleVolumeUp
{
  uint64_t v37 = self;
  v36[1] = (id)a2;
  v36[0] = -[TVNPRoute volumeLevel](self->_focusedRoute, "volumeLevel");
  id v19 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
  id v35 = [v19 volumeLevel];

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
    location[0] = &_os_log_default;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t focusedRoute = (uint64_t)v37->_focusedRoute;
      [v36[0] floatValue];
      sub_3134C((uint64_t)v39, focusedRoute, COERCE__INT64(v3), *(uint64_t *)&v33);
      _os_log_impl(&dword_0, (os_log_t)location[0], v29, "Focused route %@ volume up from %f to %f", v39, 0x20u);
    }

    objc_storeStrong(location, 0LL);
    id v15 = v37->_focusedRoute;
    id v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33);
    -[TVNPRoute setVolumeLevel:](v15, "setVolumeLevel:");
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
    id v28 = v14;
    oslog[0] = (os_log_t)&_os_log_default;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = oslog[0];
      os_log_type_t v12 = v24;
      id v13 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
      id v10 = v13;
      id v23 = v10;
      [v35 floatValue];
      sub_3134C((uint64_t)v38, (uint64_t)v10, COERCE__INT64(v5), (uint64_t)v28);
      _os_log_impl(&dword_0, v11, v12, "Focused destination %@ volume up from %f to %f", v38, 0x20u);

      objc_storeStrong(&v23, 0LL);
    }

    objc_storeStrong((id *)oslog, 0LL);
    id v9 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
    id v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v28);
    objc_msgSend(v9, "setVolumeLevel:");
  }

  else
  {
    os_log_t v22 = &_os_log_default;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v22;
      os_log_type_t v7 = v21;
      sub_E03C(v20);
      _os_log_impl(&dword_0, v6, v7, "Volume up not available", v20, 2u);
    }

    objc_storeStrong((id *)&v22, 0LL);
  }

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(v36, 0LL);
}

- (void)handleVolumeDown
{
  uint64_t v37 = self;
  v36[1] = (id)a2;
  v36[0] = -[TVNPRoute volumeLevel](self->_focusedRoute, "volumeLevel");
  id v19 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
  id v35 = [v19 volumeLevel];

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
    location[0] = &_os_log_default;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t focusedRoute = (uint64_t)v37->_focusedRoute;
      [v36[0] floatValue];
      sub_3134C((uint64_t)v39, focusedRoute, COERCE__INT64(v3), *(uint64_t *)&v33);
      _os_log_impl(&dword_0, (os_log_t)location[0], v29, "Focused route %@ volume down from %f to %f", v39, 0x20u);
    }

    objc_storeStrong(location, 0LL);
    id v15 = v37->_focusedRoute;
    id v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33);
    -[TVNPRoute setVolumeLevel:](v15, "setVolumeLevel:");
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
    id v28 = v14;
    oslog[0] = (os_log_t)&_os_log_default;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = oslog[0];
      os_log_type_t v12 = v24;
      id v13 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
      id v10 = v13;
      id v23 = v10;
      [v35 floatValue];
      sub_3134C((uint64_t)v38, (uint64_t)v10, COERCE__INT64(v5), (uint64_t)v28);
      _os_log_impl(&dword_0, v11, v12, "Focused destination %@ volume down from %f to %f", v38, 0x20u);

      objc_storeStrong(&v23, 0LL);
    }

    objc_storeStrong((id *)oslog, 0LL);
    id v9 = -[TVNPRoutingController currentDestination](v37->_routingController, "currentDestination");
    id v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v28);
    objc_msgSend(v9, "setVolumeLevel:");
  }

  else
  {
    os_log_t v22 = &_os_log_default;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v22;
      os_log_type_t v7 = v21;
      sub_E03C(v20);
      _os_log_impl(&dword_0, v6, v7, "Volume down not available", v20, 2u);
    }

    objc_storeStrong((id *)&v22, 0LL);
  }

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(v36, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  uint64_t v11 = a6;
  if (a6 == off_5EB78)
  {
    id v10 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    -[TVNPRoutingRoutesCollectionViewController updateCollectionViewWithRoutes:]( v15,  "updateCollectionViewWithRoutes:",  v10);
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    v9.receiver = v15;
    v9.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController;
    -[TVNPRoutingRoutesCollectionViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v13,  v12,  v11);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v13 = -[TVNPRoutingRoutesCollectionViewController routesByUID](v18, "routesByUID");
  id v12 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v18, "routesDataSource");
  id v11 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v12, "itemIdentifierForIndexPath:", v15);
  id v14 = -[NSDictionary objectForKey:](v13, "objectForKey:");

  [v16 estimatedItemSize];
  sub_31BAC();
  double v19 = v5;
  double v20 = v6;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  double v7 = v19;
  double v8 = v20;
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
  id v13 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v26, "routesDataSource");
  id v21 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v13, "itemIdentifierForIndexPath:", v22);

  char v18 = 0;
  char v16 = 0;
  if (v22)
  {
    double v19 = -[TVNPRoutingRoutesCollectionViewController routesByUID](v26, "routesByUID");
    char v18 = 1;
    id v17 = -[NSDictionary objectForKey:](v19, "objectForKey:", v21);
    char v16 = 1;
    id v5 = v17;
  }

  else
  {
    id v5 = 0LL;
  }

  id v20 = v5;
  if ((v16 & 1) != 0) {

  }
  if ((v18 & 1) != 0) {
  -[TVNPRoutingRoutesCollectionViewController setShareAudioFocused:]( v26,  "setShareAudioFocused:",  (unint64_t)[v21 isEqualToString:@"TVNPShareAudioItemIdentifier"] & 1);
  }
  -[TVNPRoutingRoutesCollectionViewController setFocusedRoute:](v26, "setFocusedRoute:", v20);
  id v9 = [v24 previouslyFocusedIndexPath];
  id v6 = [v24 nextFocusedIndexPath];
  BOOL v10 = v9 == v6;

  if (!v10)
  {
    id v15 = [location[0] cellForItemAtIndexPath:v22];
    [v15 setDisableFocus:1];
    [v15 setNeedsFocusUpdate];
    id v7 = location[0];
    id v8 = [v24 previouslyFocusedIndexPath];
    id v14 = objc_msgSend(v7, "cellForItemAtIndexPath:");

    [v14 setDisableFocus:0];
    [v14 setNeedsFocusUpdate];
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  float v4 = -[TVNPRoutingRoutesCollectionViewController routeForVolume](v10, "routeForVolume");
  BOOL v7 = v4 == 0LL;

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  BOOL v7 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v17, "routesDataSource");
  id v13 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", v14);

  id v8 = -[TVNPRoutingRoutesCollectionViewController routesByUID](v17, "routesByUID");
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
    -[TVNPRoutingRoutesCollectionViewController _acquireVolumeHUDAssertionForRouteWithUID:]( v17,  "_acquireVolumeHUDAssertionForRouteWithUID:",  v13);
  }
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  BOOL v7 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v17, "routesDataSource");
  id v13 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v7, "itemIdentifierForIndexPath:", v14);

  id v8 = -[TVNPRoutingRoutesCollectionViewController routesByUID](v17, "routesByUID");
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
    -[TVNPRoutingRoutesCollectionViewController _relinquishVolumeHUDAssertionForRouteWithUID:]( v17,  "_relinquishVolumeHUDAssertionForRouteWithUID:",  v13);
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
  id v8 = -[TVNPRoutingRoutesCollectionViewController routeForVolume](v12, "routeForVolume");

  if (v8)
  {
    BOOL v9 = -[TVNPRoutingRoutesCollectionViewController routeForVolume](v12, "routeForVolume");
    id v6 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v12, "routesDataSource");
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

- (void)longPressSelect:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 1)
  {
    float v3 = -[TVNPRoute volumeLevel](v6->_focusedRoute, "volumeLevel");
    BOOL v4 = 0;
    if (v3) {
      BOOL v4 = (char *)-[TVNPRoute selectionState](v6->_focusedRoute, "selectionState") == (char *)&dword_0 + 2;
    }

    if (v4) {
      -[TVNPRoutingRoutesCollectionViewController setRouteForVolume:](v6, "setRouteForVolume:", v6->_focusedRoute);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)handleEndVolumeControl:(id)a3
{
  BOOL v4 = self;
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
    id v4 = -[TVNPRoutingRoutesCollectionViewController collectionView](v13, "collectionView");
    id v3 = [v4 collectionViewLayout];
    [v3 invalidateLayout];

    id v11 = -[TVNPRoutingRoutesCollectionViewController delegate](v13, "delegate");
    if (v13->_routeForVolume || !location[0])
    {
      if (v13->_routeForVolume && !location[0]) {
        [v11 routingViewControllerWillEndEditingVolume:v13];
      }
    }

    else
    {
      [v11 routingViewControllerWillBeginEditingVolume:v13];
    }

    objc_storeStrong((id *)&v13->_routeForVolume, location[0]);
    -[UITapGestureRecognizer setEnabled:](v13->_menuRecognizer, "setEnabled:", location[0] != 0LL);
    -[UITapGestureRecognizer setEnabled:](v13->_selectRecognizer, "setEnabled:", location[0] != 0LL);
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_32848;
    BOOL v9 = &unk_50B50;
    id v10 = v13;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  &v5,  0LL);
    objc_storeStrong((id *)&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)shareAudioSelected
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = objc_alloc_init(&OBJC_CLASS___TVNPShareAudioMainViewController);
  [v3[0] setModalPresentationStyle:8];
  [v3[0] setDelegate:v4];
  float v2 = -[TVNPRoutingRoutesCollectionViewController delegate](v4, "delegate");
  -[TVNPRoutingRoutesCollectionViewControllerDelegate routingViewController:shareAudioPresentationRequested:]( v2,  "routingViewController:shareAudioPresentationRequested:",  v4,  v3[0]);

  objc_storeStrong(v3, 0LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0LL);
}

- (void)routeCellDidSelectRouteView:(id)a3
{
  id v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] shareAudio])
  {
    -[TVNPRoutingRoutesCollectionViewController shareAudioSelected](v46, "shareAudioSelected");
  }

  else
  {
    id v44 = [location[0] route];
    if ([v44 selectionState])
    {
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
      if ((objc_opt_isKindOfClass(v44, v3) & 1) != 0)
      {
        routingController = v46->_routingController;
        id v47 = v44;
        double v31 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL);
        id v30 = -[TVNPRoutingController currentDestination](v46->_routingController, "currentDestination");
        -[TVNPRoutingController unpickRoutes:forDestination:](routingController, "unpickRoutes:forDestination:", v31);
      }

      else
      {
        uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
        if ((objc_opt_isKindOfClass(v44, v4) & 1) != 0)
        {
          id v43 = v44;
          id v21 = [v43 members];
          id v42 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v21 count] + 1);

          id v22 = v42;
          id v23 = [v43 leader];
          -[NSMutableArray addObject:](v22, "addObject:");

          id v24 = v42;
          id v25 = [v43 members];
          -[NSMutableArray addObjectsFromArray:](v24, "addObjectsFromArray:");

          double v27 = v46->_routingController;
          double v26 = v42;
          id v28 = -[TVNPRoutingController currentDestination](v27, "currentDestination");
          -[TVNPRoutingController unpickRoutes:forDestination:](v27, "unpickRoutes:forDestination:", v26);

          objc_storeStrong((id *)&v42, 0LL);
          objc_storeStrong(&v43, 0LL);
        }
      }
    }

    else
    {
      id v17 = [v44 destination];
      BOOL v18 = [v17 playbackState] == (char *)&dword_0 + 1;

      BOOL v41 = v18;
      id v19 = [v44 destination];
      unsigned __int8 v20 = [v19 isCurrentDestination];

      char v40 = v20 & 1;
      if (!v18 || (v40 & 1) != 0)
      {
        -[TVNPRoutingRoutesCollectionViewController _pickRoute:](v46, "_pickRoute:", v44);
      }

      else
      {
        id v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v46));
        int v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"RoutingHijackNagTitle");
        int v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v46));
        id v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"RoutingHijackNagMessage",  &stru_51CA0,  0LL);
        uint64_t v39 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7);

        BOOL v9 = v39;
        id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v46));
        id v11 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"RoutingHijackNagCancel",  &stru_51CA0,  0LL);
        id v10 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
        -[UIAlertController addAction:](v9, "addAction:");

        id v13 = v39;
        char v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v46));
        id v15 =  -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  @"RoutingHijackNagConfirm",  &stru_51CA0,  0LL);
        double v32 = _NSConcreteStackBlock;
        int v33 = -1073741824;
        int v34 = 0;
        id v35 = sub_330B4;
        id v36 = &unk_511E0;
        uint64_t v37 = v46;
        id v38 = v44;
        id v14 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  &v32);
        -[UIAlertController addAction:](v13, "addAction:");

        -[TVNPRoutingRoutesCollectionViewController presentViewController:animated:completion:]( v46,  "presentViewController:animated:completion:",  v39,  1LL,  0LL);
        objc_storeStrong(&v38, 0LL);
        objc_storeStrong((id *)&v37, 0LL);
        objc_storeStrong((id *)&v39, 0LL);
      }
    }

    objc_storeStrong(&v44, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)routeCellDidSelectAccessoryView:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] route];
  expandedGroupUIDs = v9->_expandedGroupUIDs;
  id v4 = [v7 groupUID];
  -[NSMutableSet addObject:](expandedGroupUIDs, "addObject:");

  id v5 = v9;
  id v6 = -[TVNPRoutingController availableRoutesAndGroups](v9->_routingController, "availableRoutesAndGroups");
  -[TVNPRoutingRoutesCollectionViewController updateCollectionViewWithRoutes:](v5, "updateCollectionViewWithRoutes:");

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_gradientMask
{
  int v33 = self;
  SEL v32 = a2;
  id v9 = -[TVNPRoutingRoutesCollectionViewController view](self, "view");
  [v9 bounds];
  v31.origin.x = v2;
  v31.origin.y = v3;
  v31.size.width = v4;
  v31.size.height = v5;

  id v30 = -[TVNPRoutingRoutesCollectionViewController collectionViewLayout](v33, "collectionViewLayout");
  double v29 = 14.0;
  double v28 = 14.0;
  [v30 topGradientHeight];
  double v27 = v6;
  [v30 bottomGradientHeight];
  double v26 = v7;
  id v25 = +[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer");
  objc_msgSend(v25, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  id v10 = v25;
  id v15 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v35[0] = -[UIColor CGColor](v15, "CGColor");
  id v14 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v35[1] = -[UIColor CGColor](v14, "CGColor");
  id v13 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  v35[2] = -[UIColor CGColor](v13, "CGColor");
  id v12 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v35[3] = -[UIColor CGColor](v12, "CGColor");
  id v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35);
  objc_msgSend(v10, "setColors:");

  id v18 = v25;
  id v23 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (v29 - v27) / CGRectGetHeight(v31));
  v34[0] = v23;
  id v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29 / CGRectGetHeight(v31));
  v34[1] = v22;
  CGFloat v16 = CGRectGetHeight(v31) - v28;
  id v21 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v16 / CGRectGetHeight(v31));
  v34[2] = v21;
  CGFloat v17 = CGRectGetHeight(v31) - v28 + v26;
  unsigned __int8 v20 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 / CGRectGetHeight(v31));
  v34[3] = v20;
  id v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL);
  objc_msgSend(v18, "setLocations:");

  id v24 = v25;
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v30, 0LL);
  return v24;
}

- (void)_cleanupRouteForVolumeIfNeeded
{
  CGFloat v2 = -[TVNPRoutingRoutesCollectionViewController routeForVolume](self, "routeForVolume");
  char v8 = 0;
  char v6 = 0;
  char v4 = 0;
  LOBYTE(v3) = 0;
  if (v2)
  {
    id v9 = -[TVNPRoutingRoutesCollectionViewController routingController](self, "routingController");
    char v8 = 1;
    id v7 = -[TVNPRoutingController availableRoutes](v9, "availableRoutes");
    char v6 = 1;
    CGFloat v5 = -[TVNPRoutingRoutesCollectionViewController routeForVolume](self, "routeForVolume");
    char v4 = 1;
    unsigned int v3 = objc_msgSend(v7, "containsObject:") ^ 1;
  }

  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  if ((v8 & 1) != 0)
  }

  if ((v3 & 1) != 0) {
    -[TVNPRoutingRoutesCollectionViewController setRouteForVolume:](self, "setRouteForVolume:", 0LL);
  }
}

- (void)_calculateVisibleVolumeCells
{
  double v28 = self;
  SEL v27 = a2;
  memset(__b, 0, sizeof(__b));
  CGFloat v16 = -[TVNPRoutingRoutesCollectionViewController volumeHUDAssertionsByUID](v28, "volumeHUDAssertionsByUID");
  id obj = -[NSMutableDictionary allKeys](v16, "allKeys");

  id v18 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v18)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0LL;
    id v15 = v18;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(__b[1] + 8 * v14);
      -[TVNPRoutingRoutesCollectionViewController _relinquishVolumeHUDAssertionForRouteWithUID:]( v28,  "_relinquishVolumeHUDAssertionForRouteWithUID:",  v26);
      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        uint64_t v14 = 0LL;
        id v15 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  memset(v23, 0, sizeof(v23));
  id v9 = -[TVNPRoutingRoutesCollectionViewController collectionView](v28, "collectionView");
  id v10 = [v9 indexPathsForVisibleItems];

  id v11 = [v10 countByEnumeratingWithState:v23 objects:v29 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)v23[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)v23[2] != v6) {
        objc_enumerationMutation(v10);
      }
      uint64_t v24 = *(void *)(v23[1] + 8 * v7);
      CGFloat v2 = -[TVNPRoutingRoutesCollectionViewController routesDataSource](v28, "routesDataSource");
      id v22 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v2, "itemIdentifierForIndexPath:", v24);

      unsigned int v3 = -[TVNPRoutingRoutesCollectionViewController routesByUID](v28, "routesByUID");
      id location = -[NSDictionary objectForKey:](v3, "objectForKey:", v22);

      char v19 = 0;
      BOOL v4 = 0;
      if ([location selectionState] == (char *)&dword_0 + 2)
      {
        id v20 = [location volumeLevel];
        char v19 = 1;
        BOOL v4 = v20 != 0LL;
      }

      if ((v19 & 1) != 0) {

      }
      if (v4) {
        -[TVNPRoutingRoutesCollectionViewController _acquireVolumeHUDAssertionForRouteWithUID:]( v28,  "_acquireVolumeHUDAssertionForRouteWithUID:",  v22);
      }
      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v22, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [v10 countByEnumeratingWithState:v23 objects:v29 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
}

- (void)_acquireVolumeHUDAssertionForRouteWithUID:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    uint64_t v7 = -[TVNPRoutingRoutesCollectionViewController volumeHUDAssertionsByUID](v10, "volumeHUDAssertionsByUID");
    id v8 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", location[0]);

    if (v8)
    {
      [v8 acquire];
    }

    else
    {
      id v4 = objc_alloc(&OBJC_CLASS___PBSVolumeHUDAssertion);
      unsigned int v3 = (objc_class *)objc_opt_class(v10);
      uint64_t v5 = NSStringFromClass(v3);
      id v8 = objc_msgSend(v4, "initWithIdentifier:");

      [v8 acquire];
      uint64_t v6 = -[TVNPRoutingRoutesCollectionViewController volumeHUDAssertionsByUID](v10, "volumeHUDAssertionsByUID");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, location[0]);
    }

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_relinquishVolumeHUDAssertionForRouteWithUID:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v3 = -[TVNPRoutingRoutesCollectionViewController volumeHUDAssertionsByUID](v6, "volumeHUDAssertionsByUID");
  id v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", location[0]);

  if (v4) {
    [v4 relinquish];
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_pickRoute:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v17, v3) & 1) != 0)
  {
    routingController = v21->_routingController;
    id v22 = location[0];
    CGFloat v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL);
    id v15 = -[TVNPRoutingController currentDestination](v21->_routingController, "currentDestination");
    -[TVNPRoutingController pickRoutes:forDestination:](routingController, "pickRoutes:forDestination:", v16);
  }

  else
  {
    id v13 = location[0];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
    if ((objc_opt_isKindOfClass(v13, v4) & 1) != 0)
    {
      id v19 = location[0];
      id v5 = [v19 members];
      id v18 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v5 count] + 1);

      uint64_t v6 = v18;
      id v7 = [v19 leader];
      -[NSMutableArray addObject:](v6, "addObject:");

      id v8 = v18;
      id v9 = [v19 members];
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:");

      id v11 = v21->_routingController;
      id v10 = v18;
      id v12 = -[TVNPRoutingController currentDestination](v11, "currentDestination");
      -[TVNPRoutingController pickRoutes:forDestination:](v11, "pickRoutes:forDestination:", v10);

      objc_storeStrong((id *)&v18, 0LL);
      objc_storeStrong(&v19, 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (TVNPRoutingController)routingController
{
  return self->_routingController;
}

- (TVNPRoute)focusedRoute
{
  return self->_focusedRoute;
}

- (void)setFocusedRoute:(id)a3
{
}

- (BOOL)isShareAudioFocused
{
  return self->_shareAudioFocused;
}

- (void)setShareAudioFocused:(BOOL)a3
{
  self->_shareAudioFocused = a3;
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (TVNPRoutingRoutesCollectionViewControllerDelegate)delegate
{
  return (TVNPRoutingRoutesCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)observingChanges
{
  return self->_observingChanges;
}

- (TVNPRoute)routeForVolume
{
  return self->_routeForVolume;
}

- (NSMutableSet)expandedGroupUIDs
{
  return self->_expandedGroupUIDs;
}

- (void)setExpandedGroupUIDs:(id)a3
{
}

- (NSDictionary)routesByUID
{
  return self->_routesByUID;
}

- (void)setRoutesByUID:(id)a3
{
}

- (NSMutableDictionary)volumeHUDAssertionsByUID
{
  return self->_volumeHUDAssertionsByUID;
}

- (void)setVolumeHUDAssertionsByUID:(id)a3
{
}

- (UICollectionViewDiffableDataSource)routesDataSource
{
  return self->_routesDataSource;
}

- (void)setRoutesDataSource:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
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