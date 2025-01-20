@interface TVSMGameControllersModuleOverlayViewController
+ (id)_batteryLevelForDevice:(id)a3;
+ (id)_deviceIdentifierForDiffableDataSourceItemIdentifier:(id)a3;
+ (id)_diffableDataSourceItemIdentifierComponents:(id)a3;
+ (id)_diffableDataSourceItemIdentifierForDevice:(id)a3 sectionIdentifier:(id)a4;
+ (id)_displayNameForDevice:(id)a3;
+ (id)_sectionIdentifierForDiffableDataSourceItemIdentifier:(id)a3;
- (BOOL)isObservingDevices;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager;
- (TVSMGameControllersModuleOverlayViewController)initWithBluetoothDeviceManager:(id)a3;
- (TVSMGameControllersModuleOverlayViewController)initWithCoder:(id)a3;
- (TVSMGameControllersModuleOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSMModuleOverlayContentViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)_collectionView;
- (id)_deviceCellWithItemIdentifier:(id)a3 atIndexPath:(id)a4;
- (id)_deviceForDiffableDataSourceItemIdentifier:(id)a3;
- (id)_indexPathForFocusedCell;
- (id)_overlayView;
- (id)_sectionIdentifierAtIndex:(int64_t)a3;
- (id)_settingsCellAtIndexPath:(id)a3;
- (void)_configureCell:(id)a3 withDevice:(id)a4;
- (void)_connectDevice:(id)a3;
- (void)_disconnectDevice:(id)a3;
- (void)_handleDidEnterBackgroundNotification:(id)a3;
- (void)_handleLongPressSelect:(id)a3;
- (void)_handleMenuPress:(id)a3;
- (void)_handlePairedDevicesUpdate:(id)a3 pairableDevicesUpdate:(id)a4 animated:(BOOL)a5;
- (void)_handleWillEnterForegroundNotification:(id)a3;
- (void)_presentAlertWithError:(id)a3 forDevice:(id)a4;
- (void)_unpairDevice:(id)a3;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairableDevices:(id)a4;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setObservingDevices:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSMGameControllersModuleOverlayViewController

- (TVSMGameControllersModuleOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9 = self;
  SEL v8 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  -[TVSMGameControllersModuleOverlayViewController doesNotRecognizeSelector:](v9, "doesNotRecognizeSelector:", v8);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return 0LL;
}

- (TVSMGameControllersModuleOverlayViewController)initWithCoder:(id)a3
{
  id v6 = self;
  SEL v5 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  -[TVSMGameControllersModuleOverlayViewController doesNotRecognizeSelector:](v6, "doesNotRecognizeSelector:", v5);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return 0LL;
}

- (TVSMGameControllersModuleOverlayViewController)initWithBluetoothDeviceManager:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v7.receiver = v3;
  v7.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModuleOverlayViewController;
  v9 = -[TVSMGameControllersModuleOverlayViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bluetoothDeviceManager, location[0]);
    id v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  v9,  "_handleDidEnterBackgroundNotification:",  UIApplicationDidEnterBackgroundNotification);
    -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  v9,  "_handleWillEnterForegroundNotification:",  UIApplicationWillEnterForegroundNotification,  0LL);
    objc_storeStrong((id *)&v6, 0LL);
  }

  SEL v5 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)dealloc
{
  SEL v5 = self;
  SEL v4 = a2;
  if (self->_observingDevices)
  {
    -[TVPSBluetoothDeviceManaging removePairedDevicesObserver:]( v5->_bluetoothDeviceManager,  "removePairedDevicesObserver:",  v5);
    -[TVPSBluetoothDeviceManaging removePairableDevicesObserver:]( v5->_bluetoothDeviceManager,  "removePairableDevicesObserver:",  v5);
  }

  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModuleOverlayViewController;
  -[TVSMGameControllersModuleOverlayViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  objc_super v3 = self;
  v2[1] = (id)a2;
  v2[0] = objc_alloc_init(&OBJC_CLASS___TVSMGameControllersModuleOverlayView);
  -[TVSMGameControllersModuleOverlayViewController setView:](v3, "setView:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)viewDidLoad
{
  v34 = self;
  SEL v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModuleOverlayViewController;
  -[TVSMGameControllersModuleOverlayViewController viewDidLoad](&v32, "viewDidLoad");
  id v31 = -[TVSMGameControllersModuleOverlayViewController _overlayView](v34, "_overlayView");
  objc_initWeak(&location, v34);
  id v8 = v31;
  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  v27 = sub_9BC4;
  v28 = &unk_143B8;
  objc_copyWeak(&v29, &location);
  [v8 setMenuButtonHandler:&v24];
  id v23 = [v31 collectionView];
  [v23 setDelegate:v34];
  [v23 registerClass:objc_opt_class(TVSMGameControllerCollectionViewCell) forCellWithReuseIdentifier:@"CellReuseIdentifier"];
  [v23 registerClass:objc_opt_class(TVSMPairableGameControllersSectionHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderViewReuseIdentifier"];
  objc_super v7 = objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer);
  id v22 = -[UILongPressGestureRecognizer initWithTarget:action:]( v7,  "initWithTarget:action:",  v34,  "_handleLongPressSelect:");
  [v22 setAllowedPressTypes:&off_149F8];
  [v23 addGestureRecognizer:v22];
  id v6 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v4 = v23;
  v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_9C30;
  v20 = &unk_143E0;
  objc_copyWeak(&v21, &location);
  SEL v5 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v6,  "initWithCollectionView:cellProvider:",  v4,  &v16);
  diffableDataSource = v34->_diffableDataSource;
  v34->_diffableDataSource = v5;

  objc_super v3 = v34->_diffableDataSource;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_9D40;
  v14 = &unk_14408;
  objc_copyWeak(&v15, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v3, "setSupplementaryViewProvider:", &v10);
  id v9 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v34, "bluetoothDeviceManager");
  [v9 addPairableDevicesObserver:v34];
  [v9 addPairedDevicesObserver:v34];
  -[TVSMGameControllersModuleOverlayViewController setObservingDevices:](v34, "setObservingDevices:", 1LL);
  -[TVSMGameControllersModuleOverlayViewController _handlePairedDevicesUpdate:pairableDevicesUpdate:animated:]( v34,  "_handlePairedDevicesUpdate:pairableDevicesUpdate:animated:",  0LL,  0LL,  0LL);
  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v21);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  objc_storeStrong(&v31, 0LL);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  int64_t v13 = a5;
  double v12 = 0.0;
  id v11 =  -[TVSMGameControllersModuleOverlayViewController _sectionIdentifierAtIndex:]( v16,  "_sectionIdentifierAtIndex:",  a5);
  if ([v11 isEqualToString:@"PairedDevicesSection"])
  {
    double v12 = 0.0;
  }

  else if ([v11 isEqualToString:@"SettingsSection"])
  {
    double v12 = 14.0;
  }

  else if ([v11 isEqualToString:@"PairableDevicesSection"])
  {
    double v12 = 73.0;
  }

  sub_A0C0();
  double v17 = v5;
  double v18 = v6;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  double v7 = v17;
  double v8 = v18;
  result.height = v8;
  result.width = v7;
  return result;
}

  ;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = -[TVSMGameControllersModuleOverlayViewController diffableDataSource](v19, "diffableDataSource");
  id v15 = [v16 itemIdentifierForIndexPath:v17];
  id v14 =  -[TVSMGameControllersModuleOverlayViewController _deviceForDiffableDataSourceItemIdentifier:]( v19,  "_deviceForDiffableDataSourceItemIdentifier:",  v15);
  if ([v15 isEqual:@"SettingsItem"])
  {
    int64_t v13 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=GameControllers");
    queue = dispatch_get_global_queue(0LL, 0LL);
    double v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_A314;
    id v11 = &unk_142A0;
    double v12 = v13;
    dispatch_async(queue, &v7);

    double v5 = -[TVSMGameControllersModuleOverlayViewController delegate](v19, "delegate");
    -[TVSMModuleOverlayContentViewControllerDelegate contentModuleViewControllerDidRequestSystemDismissal:animated:]( v5,  "contentModuleViewControllerDidRequestSystemDismissal:animated:",  v19,  1LL);

    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  else if (![v14 state])
  {
    -[TVSMGameControllersModuleOverlayViewController _connectDevice:](v19, "_connectDevice:", v14);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  id v10 = [v12 nextFocusedIndexPath];
  id v9 =  -[TVSMGameControllersModuleOverlayViewController _sectionIdentifierAtIndex:]( v14,  "_sectionIdentifierAtIndex:",  [v10 section]);
  BOOL v8 = ([v9 isEqual:@"PairedDevicesSection"] & 1) != 0;
  id v5 = -[TVSMGameControllersModuleOverlayViewController _overlayView](v14, "_overlayView");
  [v5 setShowingDeviceOptionsHint:v8];

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairableDevices:(id)a4
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v5);

  if ((-[TVSMGameControllersModuleOverlayViewController isViewLoaded](v8, "isViewLoaded") & 1) != 0) {
    -[TVSMGameControllersModuleOverlayViewController _handlePairedDevicesUpdate:pairableDevicesUpdate:animated:]( v8,  "_handlePairedDevicesUpdate:pairableDevicesUpdate:animated:",  0LL,  v6,  1LL);
  }
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v5);

  if ((-[TVSMGameControllersModuleOverlayViewController isViewLoaded](v8, "isViewLoaded") & 1) != 0) {
    -[TVSMGameControllersModuleOverlayViewController _handlePairedDevicesUpdate:pairableDevicesUpdate:animated:]( v8,  "_handlePairedDevicesUpdate:pairableDevicesUpdate:animated:",  v6,  0LL,  1LL);
  }
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSMGameControllersModuleOverlayViewController isObservingDevices](v5, "isObservingDevices"))
  {
    -[TVSMGameControllersModuleOverlayViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  0LL,  0LL);
    objc_super v3 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v5, "bluetoothDeviceManager");
    -[TVPSBluetoothDeviceManaging removePairableDevicesObserver:](v3, "removePairableDevicesObserver:", v5);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSMGameControllersModuleOverlayViewController isObservingDevices](v5, "isObservingDevices"))
  {
    objc_super v3 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v5, "bluetoothDeviceManager");
    -[TVPSBluetoothDeviceManaging addPairableDevicesObserver:](v3, "addPairableDevicesObserver:", v5);

    -[TVSMGameControllersModuleOverlayViewController _handlePairedDevicesUpdate:pairableDevicesUpdate:animated:]( v5,  "_handlePairedDevicesUpdate:pairableDevicesUpdate:animated:",  0LL,  0LL,  1LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_handleMenuPress:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v3 = -[TVSMGameControllersModuleOverlayViewController delegate](v5, "delegate");
  -[TVSMModuleOverlayContentViewControllerDelegate contentModuleViewControllerDidRequestDismissal:]( v3,  "contentModuleViewControllerDidRequestDismissal:",  v5);

  objc_storeStrong(location, 0LL);
}

- (void)_handleLongPressSelect:(id)a3
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 1)
  {
    id v38 = -[TVSMGameControllersModuleOverlayViewController _indexPathForFocusedCell](v41, "_indexPathForFocusedCell");
    if (v38)
    {
      id v37 =  -[TVSMGameControllersModuleOverlayViewController _sectionIdentifierAtIndex:]( v41,  "_sectionIdentifierAtIndex:",  [v38 section]);
      if ([v37 isEqual:@"PairedDevicesSection"])
      {
        id v15 = -[TVSMGameControllersModuleOverlayViewController diffableDataSource](v41, "diffableDataSource");
        id v36 =  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:]( v15,  "itemIdentifierForIndexPath:",  v38);

        id v35 =  -[TVSMGameControllersModuleOverlayViewController _deviceForDiffableDataSourceItemIdentifier:]( v41,  "_deviceForDiffableDataSourceItemIdentifier:",  v36);
        id v34 = [(id)objc_opt_class(v41) _displayNameForDevice:v35];
        id v33 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v34,  0LL,  1LL);
        objc_initWeak(&from, v41);
        if ([v35 state] == (char *)&dword_0 + 2)
        {
          if (((unint64_t)[v35 flags] & 8) == 8)
          {
            id v31 = TVSMGameControllersLog();
            os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
            {
              sub_B050((uint64_t)v42, (uint64_t)v35);
              _os_log_impl( &dword_0,  (os_log_t)v31,  v30,  "Connected device has been marked as having bad disconnect behavior. Will not show disconnect button. device=%@",  v42,  0xCu);
            }

            objc_storeStrong(&v31, 0LL);
          }

          else
          {
            id v14 = v33;
            int64_t v13 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
            id v12 =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleDisconnect",  &stru_14478,  0LL);
            id v23 = _NSConcreteStackBlock;
            int v24 = -1073741824;
            int v25 = 0;
            int v26 = sub_B090;
            v27 = &unk_14430;
            objc_copyWeak(&v29, &from);
            id v28 = v35;
            id v11 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  &v23);
            objc_msgSend(v14, "addAction:");

            objc_storeStrong(&v28, 0LL);
            objc_destroyWeak(&v29);
          }
        }

        id v10 = v33;
        id v9 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
        BOOL v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleUnpair",  &stru_14478,  0LL);
        id v16 = _NSConcreteStackBlock;
        int v17 = -1073741824;
        int v18 = 0;
        v19 = sub_B104;
        v20 = &unk_14430;
        objc_copyWeak(&v22, &from);
        id v21 = v35;
        double v7 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  2LL,  &v16);
        objc_msgSend(v10, "addAction:");

        id v6 = v33;
        id v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
        id v4 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleCancel",  &stru_14478,  0LL);
        objc_super v3 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
        objc_msgSend(v6, "addAction:");

        -[TVSMGameControllersModuleOverlayViewController presentViewController:animated:completion:]( v41,  "presentViewController:animated:completion:",  v33,  1LL,  0LL);
        objc_storeStrong(&v21, 0LL);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&from);
        objc_storeStrong(&v33, 0LL);
        objc_storeStrong(&v34, 0LL);
        objc_storeStrong(&v35, 0LL);
        objc_storeStrong(&v36, 0LL);
      }

      objc_storeStrong(&v37, 0LL);
    }

    objc_storeStrong(&v38, 0LL);
    int v39 = 0;
  }

  else
  {
    int v39 = 1;
  }

  objc_storeStrong(location, 0LL);
}

+ (id)_diffableDataSourceItemIdentifierForDevice:(id)a3 sectionIdentifier:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v6 = v9;
  id v7 = [location[0] uniqueIdentifier];
  BOOL v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v6, v7);

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

+ (id)_diffableDataSourceItemIdentifierComponents:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] componentsSeparatedByString:@"_"];
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)_deviceIdentifierForDiffableDataSourceItemIdentifier:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [v7 _diffableDataSourceItemIdentifierComponents:location[0]];
  id v5 = [v4 lastObject];

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_sectionIdentifierForDiffableDataSourceItemIdentifier:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [v7 _diffableDataSourceItemIdentifierComponents:location[0]];
  id v5 = [v4 firstObject];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)_overlayView
{
  return -[TVSMGameControllersModuleOverlayViewController view](self, "view", a2, self);
}

- (id)_collectionView
{
  id v3 = -[TVSMGameControllersModuleOverlayViewController _overlayView](self, "_overlayView");
  id v4 = [v3 collectionView];

  return v4;
}

- (id)_indexPathForFocusedCell
{
  id v15 = self;
  v14[1] = (id)a2;
  id v11 = +[UIFocusSystem focusSystemForEnvironment:](&OBJC_CLASS___UIFocusSystem, "focusSystemForEnvironment:", self);
  v14[0] = -[UIFocusSystem focusedItem](v11, "focusedItem");

  id v13 = v14[0];
  while (1)
  {
    LOBYTE(v10) = 0;
    if (v13)
    {
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell);
      int v10 = objc_opt_isKindOfClass(v13, v2) ^ 1;
    }

    if ((v10 & 1) == 0) {
      break;
    }
    id v3 = [v13 superview];
    id v4 = v13;
    id v13 = v3;
  }

  id v12 = 0LL;
  if (v13)
  {
    id v9 = -[TVSMGameControllersModuleOverlayViewController _collectionView](v15, "_collectionView");
    id v5 = [v9 indexPathForCell:v13];
    id v6 = v12;
    id v12 = v5;
  }

  id v8 = v12;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(v14, 0LL);
  return v8;
}

- (id)_sectionIdentifierAtIndex:(int64_t)a3
{
  id v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  id v10 = 0LL;
  id v8 = -[TVSMGameControllersModuleOverlayViewController diffableDataSource](self, "diffableDataSource");
  id v7 = -[UICollectionViewDiffableDataSource snapshot](v8, "snapshot");
  id location = [v7 sectionIdentifiers];

  if (v11 < (unint64_t)[location count])
  {
    id v3 = [location objectAtIndex:v11];
    id v4 = v10;
    id v10 = v3;
  }

  id v6 = v10;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v6;
}

- (id)_settingsCellAtIndexPath:(id)a3
{
  unint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSMGameControllersModuleOverlayViewController _collectionView](v11, "_collectionView");
  id v9 =  [v4 dequeueReusableCellWithReuseIdentifier:@"CellReuseIdentifier" forIndexPath:location[0]];

  id v5 = v9;
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
  id v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleControllerSettings",  &stru_14478,  0LL);
  objc_msgSend(v5, "setTitle:");

  [v9 setSubtitle:0];
  [v9 setImageSymbolName:@"gear"];
  [v9 setAccessoryImageSymbolName:@"chevron.forward"];
  [v9 setShowingActivityIndicator:0];
  id v8 = v9;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (id)_deviceCellWithItemIdentifier:(id)a3 atIndexPath:(id)a4
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v6 = -[TVSMGameControllersModuleOverlayViewController _collectionView](v12, "_collectionView");
  id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"CellReuseIdentifier" forIndexPath:v10];

  id v8 =  -[TVSMGameControllersModuleOverlayViewController _deviceForDiffableDataSourceItemIdentifier:]( v12,  "_deviceForDiffableDataSourceItemIdentifier:",  location[0]);
  -[TVSMGameControllersModuleOverlayViewController _configureCell:withDevice:]( v12,  "_configureCell:withDevice:",  v9,  v8);
  id v7 = v9;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)_deviceForDiffableDataSourceItemIdentifier:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v9, "bluetoothDeviceManager");
  id v3 = (void *)objc_opt_class(v9);
  id v5 = [v3 _deviceIdentifierForDiffableDataSourceItemIdentifier:location[0]];
  id v7 = -[TVPSBluetoothDeviceManaging deviceForUniqueIdentifier:](v6, "deviceForUniqueIdentifier:");

  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)_configureCell:(id)a3 withDevice:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  BOOL v12 = ((unint64_t)[v13 flags] & 3) != 0;
  id v11 = 0LL;
  char v10 = 0;
  id v9 = 0LL;
  id v8 = [v13 state];
  if ((unint64_t)v8 <= 3) {
    __asm { BR              X8 }
  }

  id v5 = location[0];
  id v4 = (void *)objc_opt_class(v15);
  id v6 = [v4 _displayNameForDevice:v13];
  objc_msgSend(v5, "setTitle:");

  [location[0] setSubtitle:v11];
  [location[0] setImageSymbolName:@"gamecontroller.fill"];
  [location[0] setAccessoryImageSymbolName:v9];
  [location[0] setShowingActivityIndicator:v10 & 1];
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_displayNameForDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = [location[0] name];
  char v7 = 0;
  char v5 = 0;
  if ([v9 length])
  {
    id v3 = (NSString *)v9;
  }

  else
  {
    id v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    char v7 = 1;
    id v6 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleGameController",  &stru_14478,  0LL);
    char v5 = 1;
    id v3 = v6;
  }

  id v11 = v3;
  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  objc_storeStrong(&v9, 0LL);
  }
  objc_storeStrong(location, 0LL);
  return v11;
}

+ (id)_batteryLevelForDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v10 = 0LL;
  id v9 = [location[0] batteryLevel];
  if ((TVPSBluetoothDeviceIsValidBatteryLevel(v9) & 1) != 0)
  {
    id v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    char v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleBatteryLevelFormat",  &stru_14478,  0LL);
    id v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9);
    id v4 = v10;
    char v10 = v3;
  }

  id v6 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)_handlePairedDevicesUpdate:(id)a3 pairableDevicesUpdate:(id)a4 animated:(BOOL)a5
{
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v66 = 0LL;
  objc_storeStrong(&v66, a4);
  BOOL v65 = a5;
  v64 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  v73[0] = @"PairedDevicesSection";
  v73[1] = @"SettingsSection";
  v73[2] = @"PairableDevicesSection";
  id v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 3LL);
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v64, "appendSectionsWithIdentifiers:");

  v63 = -[TVSMGameControllersModuleOverlayViewController diffableDataSource](v68, "diffableDataSource");
  id v62 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v68, "bluetoothDeviceManager");
  id v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v60 = [v62 pairedDevices];
  memset(__b, 0, sizeof(__b));
  id v37 = v60;
  id v38 = [v37 countByEnumeratingWithState:__b objects:v72 count:16];
  if (v38)
  {
    uint64_t v31 = *(void *)__b[2];
    uint64_t v32 = 0LL;
    id v33 = v38;
    while (1)
    {
      uint64_t v30 = v32;
      if (*(void *)__b[2] != v31) {
        objc_enumerationMutation(v37);
      }
      uint64_t v59 = *(void *)(__b[1] + 8 * v32);
      id v28 = v61;
      char v5 = (void *)objc_opt_class(v68);
      id v29 =  [v5 _diffableDataSourceItemIdentifierForDevice:v59 sectionIdentifier:@"PairedDevicesSection"];
      objc_msgSend(v28, "addObject:");

      ++v32;
      if (v30 + 1 >= (unint64_t)v33)
      {
        uint64_t v32 = 0LL;
        id v33 = [v37 countByEnumeratingWithState:__b objects:v72 count:16];
        if (!v33) {
          break;
        }
      }
    }
  }

  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v64,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v61,  @"PairedDevicesSection");
  int v24 = v64;
  v71 = @"SettingsItem";
  int v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL);
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v24,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:");

  id v57 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v56 = [v62 pairableDevices];
  memset(v54, 0, sizeof(v54));
  id v26 = v56;
  id v27 = [v26 countByEnumeratingWithState:v54 objects:v70 count:16];
  if (v27)
  {
    uint64_t v21 = *(void *)v54[2];
    uint64_t v22 = 0LL;
    id v23 = v27;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)v54[2] != v21) {
        objc_enumerationMutation(v26);
      }
      uint64_t v55 = *(void *)(v54[1] + 8 * v22);
      id v18 = v57;
      id v6 = (void *)objc_opt_class(v68);
      id v19 =  [v6 _diffableDataSourceItemIdentifierForDevice:v55 sectionIdentifier:@"PairableDevicesSection"];
      objc_msgSend(v18, "addObject:");

      ++v22;
      if (v20 + 1 >= (unint64_t)v23)
      {
        uint64_t v22 = 0LL;
        id v23 = [v26 countByEnumeratingWithState:v54 objects:v70 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }

  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v64,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v57,  @"PairableDevicesSection");
  id v53 = [location[0] updatedDevices];
  id v52 = [v66 updatedDevices];
  if ([v53 count] || objc_msgSend(v52, "count"))
  {
    id v51 = -[TVSMGameControllersModuleOverlayViewController _collectionView](v68, "_collectionView");
    id v50 = [v51 visibleCells];
    memset(v48, 0, sizeof(v48));
    id v16 = v50;
    id v17 = [v16 countByEnumeratingWithState:v48 objects:v69 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)v48[2];
      uint64_t v14 = 0LL;
      id v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)v48[2] != v13) {
          objc_enumerationMutation(v16);
        }
        v49 = *(void **)(v48[1] + 8 * v14);
        id v11 = v49;
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSMGameControllerCollectionViewCell);
        id v46 = sub_C984(v11, v7);
        id v47 = v46;
        if (v46)
        {
          id v44 = [v51 indexPathForCell:v49];
          id v43 =  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:]( v63,  "itemIdentifierForIndexPath:",  v44);
          id v8 = (void *)objc_opt_class(v68);
          id v42 = [v8 _deviceIdentifierForDiffableDataSourceItemIdentifier:v43];
          id v9 = (void *)objc_opt_class(v68);
          id v41 = [v9 _sectionIdentifierForDiffableDataSourceItemIdentifier:v43];
          if (v42 && v41)
          {
            id v40 = 0LL;
            else {
              objc_storeStrong(&v40, v52);
            }
            id v39 = [v40 objectForKey:v42];
            if (v39) {
              -[TVSMGameControllersModuleOverlayViewController _configureCell:withDevice:]( v68,  "_configureCell:withDevice:",  v47,  v39);
            }
            objc_storeStrong(&v39, 0LL);
            objc_storeStrong(&v40, 0LL);
          }

          objc_storeStrong(&v41, 0LL);
          objc_storeStrong(&v42, 0LL);
          objc_storeStrong(&v43, 0LL);
          objc_storeStrong(&v44, 0LL);
          int v45 = 0;
        }

        else
        {
          int v45 = 7;
        }

        objc_storeStrong(&v47, 0LL);
        ++v14;
        if (v12 + 1 >= (unint64_t)v15)
        {
          uint64_t v14 = 0LL;
          id v15 = [v16 countByEnumeratingWithState:v48 objects:v69 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v50, 0LL);
    objc_storeStrong(&v51, 0LL);
  }

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:]( v63,  "applySnapshot:animatingDifferences:",  v64,  v65,  &v63);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_disconnectDevice:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  id v4 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v14, "bluetoothDeviceManager");
  id v3 = location[0];
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_CBA4;
  id v9 = &unk_14458;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVPSBluetoothDeviceManaging disconnectDevice:withCompletionHandler:]( v4,  "disconnectDevice:withCompletionHandler:",  v3,  &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_connectDevice:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  id v4 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v14, "bluetoothDeviceManager");
  id v3 = location[0];
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_CD88;
  id v9 = &unk_14458;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVPSBluetoothDeviceManaging connectDevice:withCompletionHandler:]( v4,  "connectDevice:withCompletionHandler:",  v3,  &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_unpairDevice:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  id v4 = -[TVSMGameControllersModuleOverlayViewController bluetoothDeviceManager](v14, "bluetoothDeviceManager");
  id v3 = location[0];
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_CF6C;
  id v9 = &unk_14458;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVPSBluetoothDeviceManaging unpairDevice:withCompletionHandler:](v4, "unpairDevice:withCompletionHandler:", v3, &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_presentAlertWithError:(id)a3 forDevice:(id)a4
{
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v68 = 0LL;
  objc_storeStrong(&v68, a4);
  id v67 = 0LL;
  id v66 = 0LL;
  id v46 = (char *)[location[0] code];
  if (v46 == (_BYTE *)&dword_0 + 1)
  {
    if (([v68 isPaired] & 1) == 0)
    {
      id v39 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v38 =  -[NSBundle localizedStringForKey:value:table:]( v39,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorGenericPairingFormat");
      int v7 = (void *)objc_opt_class(v70);
      id v37 = [v7 _displayNameForDevice:v68];
      BOOL v65 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v38, v37);

      id v41 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
      id v40 =  -[NSBundle localizedStringForKey:value:table:]( v41,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorPairingTimeout",  &stru_14478,  0LL);
      id v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v40, v65);
      id v9 = v67;
      id v67 = v8;

      objc_storeStrong((id *)&v65, 0LL);
    }
  }

  else if (v46 == &stru_68.sectname[5])
  {
    id v44 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    id v43 =  -[NSBundle localizedStringForKey:value:table:]( v44,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorUnsupportedDeviceFormat",  &stru_14478,  0LL);
    id v4 = (void *)objc_opt_class(v70);
    id v42 = [v4 _displayNameForDevice:v68];
    char v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v43, v42);
    id v6 = v67;
    id v67 = v5;
  }

  else if (v46 == (_BYTE *)&stru_68.size + 7 && ([v68 isPaired] & 1) != 0)
  {
    id v36 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
    id v35 =  -[NSBundle localizedStringForKey:value:table:]( v36,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorLinkKeyFormat",  &stru_14478,  0LL);
    id v10 = (void *)objc_opt_class(v70);
    id v34 = [v10 _displayNameForDevice:v68];
    id v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v35, v34);
    id v12 = v67;
    id v67 = v11;

    objc_initWeak(&from, v70);
    id v33 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    uint64_t v32 =  -[NSBundle localizedStringForKey:value:table:]( v33,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleUnpair",  &stru_14478,  0LL);
    id v57 = _NSConcreteStackBlock;
    int v58 = -1073741824;
    int v59 = 0;
    id v60 = sub_DA40;
    id v61 = &unk_14430;
    objc_copyWeak(&v63, &from);
    id v62 = v68;
    uint64_t v13 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v32,  1LL,  &v57);
    uint64_t v14 = v66;
    id v66 = v13;

    objc_storeStrong(&v62, 0LL);
    objc_destroyWeak(&v63);
    objc_destroyWeak(&from);
  }

  if (!v67)
  {
    if ([v68 isPaired])
    {
      uint64_t v31 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
      uint64_t v30 =  -[NSBundle localizedStringForKey:value:table:]( v31,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorGenericFormat",  &stru_14478,  0LL);
      id v15 = (void *)objc_opt_class(v70);
      id v29 = [v15 _displayNameForDevice:v68];
      id v16 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v30, v29);
      id v17 = v67;
      id v67 = v16;
    }

    else
    {
      id v28 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
      id v27 =  -[NSBundle localizedStringForKey:value:table:]( v28,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorGenericPairingFormat",  &stru_14478,  0LL);
      id v18 = (void *)objc_opt_class(v70);
      id v26 = [v18 _displayNameForDevice:v68];
      id v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v27, v26);
      id v20 = v67;
      id v67 = v19;
    }
  }

  char v54 = 0;
  char v52 = 0;
  char v50 = 0;
  char v48 = 0;
  if ([v68 isPaired])
  {
    uint64_t v55 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    char v54 = 1;
    id v53 =  -[NSBundle localizedStringForKey:value:table:]( v55,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorConnectingTitle",  &stru_14478,  0LL);
    char v52 = 1;
    uint64_t v21 = v53;
  }

  else
  {
    id v51 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    char v50 = 1;
    v49 =  -[NSBundle localizedStringForKey:value:table:]( v51,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleErrorPairingTitle",  &stru_14478,  0LL);
    char v48 = 1;
    uint64_t v21 = v49;
  }

  id v56 = v21;
  if ((v48 & 1) != 0) {

  }
  if ((v50 & 1) != 0) {
  if ((v52 & 1) != 0)
  }

  if ((v54 & 1) != 0) {
  id v47 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v56,  v67,  1LL);
  }
  if (!v66)
  {
    int v25 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    int v24 =  -[NSBundle localizedStringForKey:value:table:]( v25,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleOK",  &stru_14478);
    uint64_t v22 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
    id v23 = v66;
    id v66 = v22;
  }

  -[UIAlertController addAction:](v47, "addAction:", v66);
  -[TVSMGameControllersModuleOverlayViewController presentViewController:animated:completion:]( v70,  "presentViewController:animated:completion:",  v47,  1LL);
  objc_storeStrong((id *)&v47, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong((id *)&v66, 0LL);
  objc_storeStrong(&v67, 0LL);
  objc_storeStrong(&v68, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleOverlayContentViewControllerDelegate)delegate
{
  return (TVSMModuleOverlayContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager
{
  return self->_bluetoothDeviceManager;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (BOOL)isObservingDevices
{
  return self->_observingDevices;
}

- (void)setObservingDevices:(BOOL)a3
{
  self->_observingDevices = a3;
}

- (void).cxx_destruct
{
}

@end