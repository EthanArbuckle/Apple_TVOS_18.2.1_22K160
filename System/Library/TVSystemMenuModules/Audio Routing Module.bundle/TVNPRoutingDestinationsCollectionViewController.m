@interface TVNPRoutingDestinationsCollectionViewController
- (BOOL)_ignoreVolumeChangesWhilePendingSelection;
- (BOOL)initiatedByPicker;
- (BOOL)observingChanges;
- (BOOL)shouldFocusInitialIndex;
- (BOOL)shouldIgnoreChanges;
- (BOOL)volumeEditingInProgress;
- (NSDictionary)destinationsByIdentifier;
- (OS_dispatch_queue)volumeUpdateQueue;
- (PBSAssertion)volumeAssertion;
- (PBSBulletin)volumeBulletin;
- (TVNPRoutingController)routingController;
- (TVNPRoutingDestination)connectingRoutingDestination;
- (TVNPRoutingDestination)destinationForVolume;
- (TVNPRoutingDestinationsCollectionViewController)initWithCollectionViewLayout:(id)a3 routingController:(id)a4 options:(id)a5 initialUIDProvider:(id)a6;
- (TVNPRoutingDestinationsCollectionViewControllerDelegate)viewControllerDelegate;
- (UICollectionViewDiffableDataSource)destinationsDataSource;
- (id)_indexPathForCurrentDestination;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)initialUIDProvider;
- (unint64_t)initialFocusIndex;
- (void)_presentVolumeBulletinForDestination:(id)a3;
- (void)_showConnectionFailedAlertControllerForRoutingDestination:(id)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConnectingRoutingDestination:(id)a3;
- (void)setDestinationForVolume:(id)a3;
- (void)setDestinationsByIdentifier:(id)a3;
- (void)setDestinationsDataSource:(id)a3;
- (void)setInitialUIDProvider:(id)a3;
- (void)setObservingChanges:(BOOL)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)setVolumeBulletin:(id)a3;
- (void)setVolumeEditingInProgress:(BOOL)a3;
- (void)setVolumeUpdateQueue:(id)a3;
- (void)updateCollectionViewWithDestinations:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVNPRoutingDestinationsCollectionViewController

- (TVNPRoutingDestinationsCollectionViewController)initWithCollectionViewLayout:(id)a3 routingController:(id)a4 options:(id)a5 initialUIDProvider:(id)a6
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  id v26 = 0LL;
  objc_storeStrong(&v26, a5);
  id v25 = 0LL;
  objc_storeStrong(&v25, a6);
  v6 = v29;
  v29 = 0LL;
  v24.receiver = v6;
  v24.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  v23 = -[TVNPRoutingDestinationsCollectionViewController initWithCollectionViewLayout:]( &v24,  "initWithCollectionViewLayout:",  location[0]);
  v29 = v23;
  objc_storeStrong((id *)&v29, v23);
  if (v23)
  {
    id v17 = objc_alloc(&OBJC_CLASS___PBSVolumeButtonEventAssertion);
    v7 = (objc_class *)objc_opt_class(v29);
    v18 = NSStringFromClass(v7);
    v8 = (PBSAssertion *)objc_msgSend(v17, "initWithIdentifier:");
    volumeAssertion = v29->_volumeAssertion;
    v29->_volumeAssertion = v8;

    v29->_shouldFocusInitialIndex = 1;
    v29->_initialFocusIndex = 0LL;
    objc_storeStrong((id *)&v29->_routingController, v27);
    id v19 = [v26 objectForKeyedSubscript:PBSRoutingUIOptionInitiatedByPicker];
    unsigned __int8 v10 = [v19 BOOLValue];
    v29->_initiatedByPicker = v10 & 1;

    id v11 = [v25 copy];
    id initialUIDProvider = v29->_initialUIDProvider;
    v29->_id initialUIDProvider = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.TVNowPlayingService.VolumeUpdateQueue", 0LL);
    volumeUpdateQueue = v29->_volumeUpdateQueue;
    v29->_volumeUpdateQueue = (OS_dispatch_queue *)v13;
  }

  v16 = v29;
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  return v16;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[PBSAssertion relinquish](self->_volumeAssertion, "relinquish");
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destinationForVolume,  "removeObserver:forKeyPath:context:",  v4,  @"volumeLevel",  off_5E890);
  objc_storeStrong((id *)&v4->_destinationForVolume, 0LL);
  -[TVNPRoutingDestinationsCollectionViewController setObservingChanges:](v4, "setObservingChanges:", 0LL);
  -[TVNPRoutingDestinationsCollectionViewController setConnectingRoutingDestination:]( v4,  "setConnectingRoutingDestination:",  0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController viewDidLoad](&v22, "viewDidLoad");
  id v8 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v24, "collectionView");
  [v8 setContentInsetAdjustmentBehavior:2];

  id v9 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v24, "collectionView");
  [v9 setIndexDisplayMode:1];

  id v12 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v24, "collectionView");
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationCollectionViewCell);
  objc_super v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationCollectionViewCell);
  id v11 = NSStringFromClass(v2);
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", v10);

  id v13 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v24, "collectionView");
  [v13 setClipsToBounds:0];

  objc_initWeak(&location, v24);
  v14 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v6 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v24, "collectionView");
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_15E6C;
  id v19 = &unk_50D88;
  objc_copyWeak(v20, &location);
  v7 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v14,  "initWithCollectionView:cellProvider:",  v6,  &v15);
  destinationsDataSource = v24->_destinationsDataSource;
  v24->_destinationsDataSource = v7;

  v5 = v24;
  id v4 = -[TVNPRoutingController availableDestinations](v24->_routingController, "availableDestinations");
  -[TVNPRoutingDestinationsCollectionViewController updateCollectionViewWithDestinations:]( v5,  "updateCollectionViewWithDestinations:");

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v33 = self;
  SEL v32 = a2;
  BOOL v31 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController viewWillAppear:](&v30, "viewWillAppear:", a3);
  uint64_t v10 = +[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance");
  -[PBSBulletinService setDelegate:](v10, "setDelegate:", v33);

  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  if ((-[TVNPRoutingController allowsDestinationSelection]( v33->_routingController,  "allowsDestinationSelection") & 1) != 0 && v33->_initialUIDProvider)
  {
    id v28 = (id)(*((uint64_t (**)(void))v33->_initialUIDProvider + 2))();
    id initialUIDProvider = v33->_initialUIDProvider;
    v33->_id initialUIDProvider = 0LL;

    id location = &_os_log_default;
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_51B8((uint64_t)v35, (uint64_t)v28);
      _os_log_impl(&dword_0, (os_log_t)location, v26, "ROUTING: Active Endpoint UID %{public}@", v35, 0xCu);
    }

    objc_storeStrong(&location, 0LL);
    id v25 = -[TVNPRoutingController availableDestinations](v33->_routingController, "availableDestinations");
    id v9 = v25;
    id v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    objc_super v22 = sub_16528;
    SEL v23 = &unk_50DB0;
    id v24 = v28;
    uint64_t v29 = (uint64_t)[v9 indexOfObjectPassingTest:&v19];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_log_t oslog = &_os_log_default;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v5 = oslog;
        os_log_type_t v6 = v13;
        sub_E03C(v12);
        _os_log_impl(&dword_0, v5, v6, "ROUTING: No Matching Active Endpoint", v12, 2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    else
    {
      id v18 = &_os_log_default;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (os_log_s *)v18;
        os_log_type_t v8 = v17;
        sub_E03C(v16);
        _os_log_impl(&dword_0, v7, v8, "ROUTING: Found Active Endpoint", v16, 2u);
      }

      objc_storeStrong(&v18, 0LL);
      id v15 = [v25 objectAtIndexedSubscript:v29];
      -[TVNPRoutingController setCurrentDestination:](v33->_routingController, "setCurrentDestination:", v15);
      objc_storeStrong(&v15, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v28, 0LL);
  }

  if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0LL;
  }
  else {
    unint64_t v4 = v29;
  }
  v33->_initialFocusIndex = v4;
  os_log_t v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_165CC((uint64_t)v34, v33->_initialFocusIndex);
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "ROUTING: Initial Focus Index: %ld", v34, 0xCu);
  }

  objc_storeStrong((id *)&v11, 0LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  id location = -[TVNPRoutingDestinationsCollectionViewController parentViewController](v10, "parentViewController");
  char v4 = 0;
  unsigned __int8 v3 = 1;
  if ((-[TVNPRoutingDestinationsCollectionViewController isBeingDismissed](v10, "isBeingDismissed") & 1) == 0)
  {
    unsigned __int8 v3 = 1;
    if (([location isBeingDismissed] & 1) == 0)
    {
      id v5 = [location parentViewController];
      char v4 = 1;
      unsigned __int8 v3 = [v5 isBeingDismissed];
    }
  }

  if ((v4 & 1) != 0) {

  }
  v10->_shouldIgnoreChanges = v3 & 1;
  objc_storeStrong(&location, 0LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  unsigned __int8 v3 = +[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance");
  -[PBSBulletinService setDelegate:](v3, "setDelegate:", 0LL);
}

- (void)viewDidLayoutSubviews
{
  id v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  BOOL shouldFocusInitialIndex = v12->_shouldFocusInitialIndex;
  char v8 = 0;
  char v6 = 0;
  BOOL v4 = 0;
  if (shouldFocusInitialIndex)
  {
    SEL v9 = -[TVNPRoutingDestinationsCollectionViewController destinationsDataSource](v12, "destinationsDataSource");
    char v8 = 1;
    id v7 = -[UICollectionViewDiffableDataSource snapshot](v9, "snapshot");
    char v6 = 1;
    BOOL v4 = (uint64_t)[v7 numberOfItems] > 0;
  }

  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  if (v4)
  }
  {
    BOOL v5 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v12->_initialFocusIndex,  0LL);
    id v3 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v12, "collectionView");
    [v3 scrollToItemAtIndexPath:v5 atScrollPosition:16 animated:0];

    objc_storeStrong((id *)&v5, 0LL);
  }

  -[TVNPRoutingDestinationsCollectionViewController setObservingChanges:](v12, "setObservingChanges:", 1LL);
}

- (void)setObservingChanges:(BOOL)a3
{
  objc_super v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  if (a3 != self->_observingChanges)
  {
    if (v8 && v10->_shouldIgnoreChanges)
    {
      id location = &_os_log_default;
      char v6 = 16;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)location;
        os_log_type_t type = v6;
        sub_E03C(v5);
        _os_log_error_impl( &dword_0,  log,  type,  "We tried to begin observing changes while we were ignoring changes, skip adding observer",  v5,  2u);
      }

      objc_storeStrong(&location, 0LL);
    }

    else
    {
      v10->_observingChanges = v8;
      if (v8) {
        -[TVNPRoutingController addObserver:forKeyPath:options:context:]( v10->_routingController,  "addObserver:forKeyPath:options:context:",  v10,  @"availableDestinations",  3LL,  off_5E898);
      }
      else {
        -[TVNPRoutingController removeObserver:forKeyPath:context:]( v10->_routingController,  "removeObserver:forKeyPath:context:",  v10,  @"availableDestinations",  off_5E898);
      }
    }
  }

- (void)setVolumeEditingInProgress:(BOOL)a3
{
  int v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  if (self->_volumeEditingInProgress != a3)
  {
    v20->_volumeEditingInProgress = v18;
    os_log_type_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    for (unint64_t i = 0LL; ; ++i)
    {
      id v7 = -[TVNPRoutingDestinationsCollectionViewController routingController](v20, "routingController");
      id v6 = -[TVNPRoutingController availableDestinations](v7, "availableDestinations");
      BOOL v8 = i >= (unint64_t)[v6 count];

      if (v8) {
        break;
      }
      BOOL v5 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  i,  0LL);
      -[NSMutableArray addObject:](v17, "addObject:");
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext);
    -[TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext setEnabled:]( v15,  "setEnabled:",  !v20->_volumeEditingInProgress);
    -[TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext invalidateItemsAtIndexPaths:]( v15,  "invalidateItemsAtIndexPaths:",  v17);
    id v4 = -[TVNPRoutingDestinationsCollectionViewController collectionView](v20, "collectionView");
    id v3 = [v4 collectionViewLayout];
    [v3 invalidateLayoutWithContext:v15];

    SEL v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_16DD0;
    os_log_type_t v13 = &unk_50B50;
    v14 = v20;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  &v9);
    objc_storeStrong((id *)&v14, 0LL);
    objc_storeStrong((id *)&v15, 0LL);
    objc_storeStrong((id *)&v17, 0LL);
  }

- (void)setConnectingRoutingDestination:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_connectingRoutingDestination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_connectingRoutingDestination,  "removeObserver:forKeyPath:context:",  v4);
  objc_storeStrong((id *)&v4->_connectingRoutingDestination, location[0]);
  -[TVNPRoutingDestination addObserver:forKeyPath:options:context:]( v4->_connectingRoutingDestination,  "addObserver:forKeyPath:options:context:",  v4,  @"connected");
  -[TVNPRoutingDestination addObserver:forKeyPath:options:context:]( v4->_connectingRoutingDestination,  "addObserver:forKeyPath:options:context:",  v4,  @"disconnected",  0LL,  &unk_5EE18);
  objc_storeStrong(location, 0LL);
}

- (void)updateCollectionViewWithDestinations:(id)a3
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v19 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v19);

  id v34 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  [v34 appendSectionsWithIdentifiers:&off_52EC0];
  BOOL v18 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v33 = -[NSMutableDictionary initWithCapacity:](v18, "initWithCapacity:", [location[0] count]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v17 = [obj countByEnumeratingWithState:__b objects:v39 count:16];
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0LL;
    id v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v32 = *(id *)(__b[1] + 8 * v14);
      id v30 = [v32 uniqueIdentifier];
      if (v30)
      {
        [v33 setObject:v32 forKey:v30];
        id v11 = v34;
        id v38 = v30;
        int v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL);
        objc_msgSend(v11, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");
      }

      else
      {
        os_log_t oslog = &_os_log_default;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v9 = type;
          id v7 = [v32 title];
          id v27 = v7;
          sub_561C((uint64_t)v37, (uint64_t)v27);
          _os_log_error_impl(&dword_0, log, v9, "Destination %@ has no unique identifier", v37, 0xCu);

          objc_storeStrong(&v27, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }

      objc_storeStrong(&v30, 0LL);
      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        uint64_t v14 = 0LL;
        id v15 = [obj countByEnumeratingWithState:__b objects:v39 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  BOOL v5 = v36;
  id v6 = [v33 copy];
  -[TVNPRoutingDestinationsCollectionViewController setDestinationsByIdentifier:]( v5,  "setDestinationsByIdentifier:",  v6);

  objc_initWeak(&from, v36);
  id v3 = -[TVNPRoutingDestinationsCollectionViewController destinationsDataSource](v36, "destinationsDataSource");
  id v4 = v34;
  int v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  SEL v23 = sub_174E0;
  id v24 = &unk_50988;
  objc_copyWeak(v25, &from);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:]( v3,  "applySnapshot:animatingDifferences:completion:",  v4,  1LL,  &v20);

  objc_destroyWeak(v25);
  objc_destroyWeak(&from);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_showConnectionFailedAlertControllerForRoutingDestination:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
  id v4 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"ConnectionFailedAlertTitle");
  id v3 = [location[0] destinationName];
  uint64_t v13 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v4, v3);

  uint64_t v12 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  0LL);
  id v6 = v12;
  os_log_type_t v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
  BOOL v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"ConnectionFailedAlertButton",  &stru_51CA0,  0LL);
  id v7 = +[UIAlertAction actionWithTitle:style:handler:](&OBJC_CLASS___UIAlertAction, "actionWithTitle:style:handler:");
  -[UIAlertController addAction:](v6, "addAction:");

  int v10 = v12;
  id v11 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL);
  -[UIAlertController addAction:](v10, "addAction:");

  -[TVNPRoutingDestinationsCollectionViewController presentViewController:animated:completion:]( v15,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_ignoreVolumeChangesWhilePendingSelection
{
  uint64_t v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = -[TVNPRoutingController availableRoutes](v13->_routingController, "availableRoutes");
  id v8 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      if ([v10 selectionState] == (char *)&dword_0 + 1
        || [v10 selectionState] == (char *)&dword_0 + 3)
      {
        break;
      }

      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v6) {
          goto LABEL_10;
        }
      }
    }

    char v11 = 1;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v30 = 0LL;
  objc_storeStrong(&v30, a4);
  id v29 = 0LL;
  objc_storeStrong(&v29, a5);
  id v28 = a6;
  if (a6 == off_5E898)
  {
    if (v32->_shouldIgnoreChanges)
    {
      id v26 = &_os_log_default;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v26;
        os_log_type_t type = v25;
        sub_E03C(v24);
        _os_log_impl(&dword_0, log, type, "Destinations updated while we were ignoring changes", v24, 2u);
      }

      objc_storeStrong(&v26, 0LL);
    }

    else
    {
      id v27 = [v29 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      -[TVNPRoutingDestinationsCollectionViewController updateCollectionViewWithDestinations:]( v32,  "updateCollectionViewWithDestinations:",  v27);
      objc_storeStrong(&v27, 0LL);
    }
  }

  else if (v28 == off_5E890)
  {
    id v23 = -[TVNPRoutingDestination volumeLevel](v32->_destinationForVolume, "volumeLevel");
    if (v23)
    {
      id v22 = &_os_log_default;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        sub_D33C((uint64_t)v34, (uint64_t)v32->_destinationForVolume, (uint64_t)v23);
        _os_log_impl( &dword_0,  (os_log_t)v22,  v21,  "Destination %@ volume level changed to %@, acquiring volume button assertion",  v34,  0x16u);
      }

      objc_storeStrong(&v22, 0LL);
      -[PBSAssertion acquire](v32->_volumeAssertion, "acquire");
    }

    else
    {
      id v20 = &_os_log_default;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        sub_561C((uint64_t)v33, (uint64_t)v32->_destinationForVolume);
        _os_log_impl( &dword_0,  (os_log_t)v20,  v19,  "Destination %@ volume level removed, relinquishing volume button assertion",  v33,  0xCu);
      }

      objc_storeStrong(&v20, 0LL);
      -[PBSAssertion relinquish](v32->_volumeAssertion, "relinquish");
    }

    char v17 = 0;
    char v15 = 0;
    char v13 = 0;
    BOOL v6 = 0;
    if (v23)
    {
      BOOL v6 = 0;
      if (!v32->_volumeEditingInProgress)
      {
        id v18 = [v29 valueForKey:NSKeyValueChangeOldKey];
        char v17 = 1;
        id v16 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
        char v15 = 1;
        BOOL v6 = 0;
        if ((objc_msgSend(v18, "isEqual:") & 1) == 0)
        {
          id v14 = -[TVNPRoutingController currentRoutes](v32->_routingController, "currentRoutes");
          char v13 = 1;
          BOOL v6 = 0;
          if ((unint64_t)[v14 count] > 1)
          {
            BOOL v6 = 0;
            if (!-[TVNPRoutingDestinationsCollectionViewController _ignoreVolumeChangesWhilePendingSelection]( v32,  "_ignoreVolumeChangesWhilePendingSelection")) {
              BOOL v6 = !-[TVNPRoutingDestination isLocal](v32->_destinationForVolume, "isLocal");
            }
          }
        }
      }
    }

    if ((v13 & 1) != 0) {

    }
    if ((v15 & 1) != 0) {
    if ((v17 & 1) != 0)
    }

    if (v6) {
      -[TVNPRoutingDestinationsCollectionViewController _presentVolumeBulletinForDestination:]( v32,  "_presentVolumeBulletinForDestination:",  v32->_destinationForVolume);
    }
    objc_storeStrong(&v23, 0LL);
  }

  else if (v28 == &unk_5EE18)
  {
    if ([v30 isConnected])
    {
      -[TVNPRoutingDestinationsCollectionViewController setConnectingRoutingDestination:]( v32,  "setConnectingRoutingDestination:",  0LL);
    }

    else if ([v30 isDisconnected])
    {
      -[TVNPRoutingDestinationsCollectionViewController _showConnectionFailedAlertControllerForRoutingDestination:]( v32,  "_showConnectionFailedAlertControllerForRoutingDestination:",  v30);
      -[TVNPRoutingDestinationsCollectionViewController setConnectingRoutingDestination:]( v32,  "setConnectingRoutingDestination:",  0LL);
    }
  }

  else
  {
    v12.receiver = v32;
    v12.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
    -[TVNPRoutingDestinationsCollectionViewController observeValueForKeyPath:ofObject:change:context:]( &v12,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v30,  v29,  v28);
  }

  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  BOOL v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = 0LL;
  objc_storeStrong(&v29, a4);
  id v28 = 0LL;
  objc_storeStrong(&v28, a5);
  v27.receiver = v31;
  v27.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController;
  -[TVNPRoutingDestinationsCollectionViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v27,  "didUpdateFocusInContext:withAnimationCoordinator:",  v29,  v28);
  id v26 = [v29 nextFocusedIndexPath];
  if (v26)
  {
    v31->_BOOL shouldFocusInitialIndex = 0;
    v25[1] = &AVAudioSessionCategoryPlayback_ptr + 6;
    os_log_type_t v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = sub_1859C;
    id v23 = &unk_50DD8;
    id v24 = v31;
    v25[0] = v26;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327686LL,  &v19,  0LL,  0.3,  0.0);
    id v8 = -[TVNPRoutingDestinationsCollectionViewController destinationsDataSource](v31, "destinationsDataSource");
    id v18 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v8, "itemIdentifierForIndexPath:", v26);

    os_log_type_t v9 = -[TVNPRoutingDestinationsCollectionViewController destinationsByIdentifier](v31, "destinationsByIdentifier");
    id v17 = -[NSDictionary objectForKey:](v9, "objectForKey:", v18);

    -[TVNPRoutingController setCurrentDestination:](v31->_routingController, "setCurrentDestination:", v17);
    id v10 = [v17 volumeLevel];

    if (v10)
    {
      id v16 = &_os_log_default;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v16;
        os_log_type_t type = v15;
        id v7 = [v17 volumeLevel];
        id v14 = v7;
        sub_D33C((uint64_t)v33, (uint64_t)v17, (uint64_t)v14);
        _os_log_impl( &dword_0,  log,  type,  "Focused destination %@ has a volume level of %@, acquiring volume button assertion",  v33,  0x16u);

        objc_storeStrong(&v14, 0LL);
      }

      objc_storeStrong(&v16, 0LL);
      -[PBSAssertion acquire](v31->_volumeAssertion, "acquire");
    }

    else
    {
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_561C((uint64_t)v32, (uint64_t)v17);
        _os_log_impl( &dword_0,  oslog,  OS_LOG_TYPE_DEFAULT,  "Focused destination %@ has no volume level relinquishing volume button assertion",  v32,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      -[PBSAssertion relinquish](v31->_volumeAssertion, "relinquish");
    }

    -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v31->_destinationForVolume,  "removeObserver:forKeyPath:context:",  v31);
    [v17 addObserver:v31 forKeyPath:@"volumeLevel" options:3 context:off_5E890];
    objc_storeStrong((id *)&v31->_destinationForVolume, v17);
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(v25, 0LL);
    objc_storeStrong((id *)&v24, 0LL);
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v47 = 0LL;
  objc_storeStrong(&v47, a4);
  BOOL v46 = [v47 item] == 0;
  os_log_type_t v15 = -[TVNPRoutingDestinationsCollectionViewController destinationsDataSource](v49, "destinationsDataSource");
  id v45 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v15, "itemIdentifierForIndexPath:", v47);

  id v16 = -[TVNPRoutingDestinationsCollectionViewController destinationsByIdentifier](v49, "destinationsByIdentifier");
  id v44 = -[NSDictionary objectForKey:](v16, "objectForKey:", v45);

  if ([v44 isPaired])
  {
    char v13 = -[TVNPRoutingDestinationsCollectionViewController routingController](v49, "routingController");
    -[TVNPRoutingController targetDestination:](v13, "targetDestination:", v44);

    v37 = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    v40 = sub_18B84;
    v41 = &unk_50B50;
    v42 = v49;
    id v43 = objc_retainBlock(&v37);
    if (v49->_initiatedByPicker)
    {
      (*((void (**)(void))v43 + 2))();
    }

    else if ([v44 playbackState])
    {
      if (v46)
      {
        id v10 =  +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection");
        id v9 = [v10 systemServiceProxy];
        id v8 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
        os_log_type_t v25 = _NSConcreteStackBlock;
        int v26 = -1073741824;
        int v27 = 0;
        id v28 = sub_18D30;
        id v29 = &unk_50E00;
        id v30 = v43;
        [v9 presentNowPlayingWithOptions:v8 completion:&v25];

        objc_storeStrong(&v30, 0LL);
      }

      else
      {
        uint64_t v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        id v24 = -[NSMutableDictionary initWithObjectsAndKeys:]( v4,  "initWithObjectsAndKeys:",  &__kCFBooleanTrue,  PBSNowPlayingUIOptionShowActiveEndpoint,  0LL);
        id v23 = [v44 nowPlayingBundleIdentifier];
        if (v23) {
          -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, PBSNowPlayingUIOptionBundleIdentifier);
        }
        id v7 =  +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection");
        id v6 = [v7 systemServiceProxy];
        id v5 = -[NSMutableDictionary copy](v24, "copy");
        id v17 = _NSConcreteStackBlock;
        int v18 = -1073741824;
        int v19 = 0;
        int v20 = sub_18D6C;
        int v21 = &unk_50E00;
        id v22 = v43;
        [v6 presentNowPlayingWithOptions:v5 completion:&v17];

        objc_storeStrong(&v22, 0LL);
        objc_storeStrong(&v23, 0LL);
        objc_storeStrong((id *)&v24, 0LL);
      }
    }

    else
    {
      objc_super v12 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
      char v11 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"com.apple.TVMusic://");
      BOOL v31 = _NSConcreteStackBlock;
      int v32 = -1073741824;
      int v33 = 0;
      id v34 = sub_18CF4;
      v35 = &unk_50E00;
      id v36 = v43;
      -[UIApplication openURL:options:completionHandler:]( v12,  "openURL:options:completionHandler:",  v11,  &__NSDictionary0__struct,  &v31);

      objc_storeStrong(&v36, 0LL);
    }

    objc_storeStrong(&v43, 0LL);
    objc_storeStrong((id *)&v42, 0LL);
  }

  else
  {
    -[TVNPRoutingDestinationsCollectionViewController setConnectingRoutingDestination:]( v49,  "setConnectingRoutingDestination:",  v44);
    [v44 connectAndPair];
  }

  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVNPRoutingDestinationsCollectionViewController _indexPathForCurrentDestination]( v6,  "_indexPathForCurrentDestination");
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  v14[1] = (id)a5;
  queue = (dispatch_queue_s *)v17->_volumeUpdateQueue;
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  char v11 = sub_18F34;
  objc_super v12 = &unk_50DD8;
  id v13 = v15;
  v14[0] = v17;
  dispatch_async(queue, &v8);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentVolumeBulletinForDestination:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = [location[0] volumeLevel];
  [v12 floatValue];
  int v13 = v3;

  int v16 = v13;
  id v15 = 0LL;
  id v14 = location[0];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPEndpointRoutingDestination);
  if ((objc_opt_isKindOfClass(v14, v4) & 1) != 0)
  {
    id v5 = [location[0] endpointRoute];
    id v6 = v15;
    id v15 = v5;
  }

  id v11 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
  id v10 = [v11 systemServiceProxy];
  uint64_t v8 = PBSAudioRouteTypeFromRoute(v15);
  LODWORD(v7) = v16;
  int v9 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7);
  objc_msgSend(v10, "showVolumeHUDForRouteType:withLevel:", v8);

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_indexPathForCurrentDestination
{
  double v7 = self;
  location[1] = (id)a2;
  id v5 = -[TVNPRoutingDestinationsCollectionViewController routingController](self, "routingController");
  location[0] = -[TVNPRoutingController currentDestination](v5, "currentDestination");

  if (location[0])
  {
    uint64_t v4 = -[TVNPRoutingDestinationsCollectionViewController destinationsDataSource](v7, "destinationsDataSource");
    id v3 = [location[0] uniqueIdentifier];
    id v8 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](v4, "indexPathForItemIdentifier:");
  }

  else
  {
    id v8 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v8;
}

- (TVNPRoutingController)routingController
{
  return self->_routingController;
}

- (TVNPRoutingDestinationsCollectionViewControllerDelegate)viewControllerDelegate
{
  return (TVNPRoutingDestinationsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
}

- (BOOL)volumeEditingInProgress
{
  return self->_volumeEditingInProgress;
}

- (PBSAssertion)volumeAssertion
{
  return self->_volumeAssertion;
}

- (BOOL)shouldFocusInitialIndex
{
  return self->_shouldFocusInitialIndex;
}

- (unint64_t)initialFocusIndex
{
  return self->_initialFocusIndex;
}

- (BOOL)observingChanges
{
  return self->_observingChanges;
}

- (BOOL)shouldIgnoreChanges
{
  return self->_shouldIgnoreChanges;
}

- (BOOL)initiatedByPicker
{
  return self->_initiatedByPicker;
}

- (TVNPRoutingDestination)destinationForVolume
{
  return self->_destinationForVolume;
}

- (void)setDestinationForVolume:(id)a3
{
}

- (PBSBulletin)volumeBulletin
{
  return self->_volumeBulletin;
}

- (void)setVolumeBulletin:(id)a3
{
}

- (OS_dispatch_queue)volumeUpdateQueue
{
  return self->_volumeUpdateQueue;
}

- (void)setVolumeUpdateQueue:(id)a3
{
}

- (TVNPRoutingDestination)connectingRoutingDestination
{
  return self->_connectingRoutingDestination;
}

- (id)initialUIDProvider
{
  return self->_initialUIDProvider;
}

- (void)setInitialUIDProvider:(id)a3
{
}

- (UICollectionViewDiffableDataSource)destinationsDataSource
{
  return self->_destinationsDataSource;
}

- (void)setDestinationsDataSource:(id)a3
{
}

- (NSDictionary)destinationsByIdentifier
{
  return self->_destinationsByIdentifier;
}

- (void)setDestinationsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end