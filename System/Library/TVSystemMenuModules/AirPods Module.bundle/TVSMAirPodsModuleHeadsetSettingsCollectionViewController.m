@interface TVSMAirPodsModuleHeadsetSettingsCollectionViewController
- (BOOL)_allHeadsetsSupportSpatialWhileSharing;
- (BOOL)_currentAppCanBeIneligibleForSpatialization;
- (BOOL)_currentAppSupportsSpatial;
- (BOOL)_currentGlobalSpatialSetting;
- (BOOL)_deviceSupportsSpatial;
- (BOOL)_dolbyAtmosActive;
- (BOOL)_headTrackingDisabled;
- (BOOL)_isMultichannelAvailable;
- (BOOL)_isMusicSpatialEnabled;
- (BOOL)_musicHeadTrackingAvailable;
- (BOOL)_shouldShowSettingAsDisabled:(int64_t)a3;
- (BOOL)_shouldShowSettingAsSelected:(int64_t)a3;
- (BOOL)_spatialAndHeadTrackingEnabled;
- (BOOL)_spatialEnabled;
- (BOOL)_spatialFixedEnabled;
- (BOOL)_spatialUnavailable;
- (BOOL)_spatializeStereoEnabled;
- (BOOL)_splitterPreventingSpatial;
- (BOOL)_splitterSpatialActive;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)headTrackingEnabled;
- (BOOL)isContentEligibleForSpatialization;
- (BOOL)isMusicApp;
- (BOOL)isSharingAudio;
- (BOOL)isSpatialEnabledGlobally;
- (BOOL)musicHeadTrackingAvailable;
- (BOOL)spatialAudioFocused;
- (BOOL)splitterSpatialActive;
- (MRNowPlayingAudioFormatController)audioFormatController;
- (NSArray)headsetRoutes;
- (NSCopying)metadataObserverToken;
- (NSIndexPath)focusedIndexPath;
- (NSMutableDictionary)settings;
- (NSString)audioFormat;
- (NSString)currentAppBundleID;
- (NSString)foregroundAppBundleID;
- (NSString)nowPlayingApp;
- (NSString)nowPlayingBundleID;
- (NSTimer)listeningModeChangedTimer;
- (NSTimer)spatialModeChangedTimer;
- (TVCSSpatialTutorialStateObserver)tutorialStateObserver;
- (TVNPEndpointRouteConnection)routeConnection;
- (TVNPOutputDeviceRoute)currentRoute;
- (TVSBluetoothDevice)bluetoothDevice;
- (TVSMAirPodsModuleHeadsetSettingsCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (TVSMCAPackageView)spatialBlackPackageView;
- (TVSMCAPackageView)spatialWhitePackageView;
- (UICollectionViewDiffableDataSource)settingsDataSource;
- (id)_analyticsDictionaryWithMode:(int64_t)a3;
- (id)_currentAppBundleID;
- (id)_descriptionForListeningMode:(int64_t)a3;
- (id)_descriptionForSpatialMode:(int64_t)a3;
- (id)_headsetSettingsLayout;
- (id)_musicAppAudioFormat;
- (id)_packageNameForSetting:(int64_t)a3;
- (id)_packageViewWithName:(id)a3 activeStateName:(id)a4;
- (id)_resolvedAudioFormat;
- (id)_resolvedDetailText;
- (id)_stringForAirPodsSettingType:(int64_t)a3;
- (int64_t)_currentEnabledSettingForListeningMode;
- (int64_t)_currentEnabledSpatialMode;
- (int64_t)_listeningModeForSetting:(int64_t)a3;
- (int64_t)bestAvailableFormat;
- (int64_t)currentListeningMode;
- (int64_t)currentSpatialMode;
- (int64_t)focusedSetting;
- (void)_didSelectHeadsetListeningModeSetting:(int64_t)a3;
- (void)_didSelectSpatialSetting:(int64_t)a3;
- (void)_didSelectSpatializeStereo;
- (void)_optimisticallyUpdateListeningMode:(int64_t)a3;
- (void)_optimisticallyUpdateSpatialMode:(int64_t)a3 headTrackingEnabled:(BOOL)a4;
- (void)_recordListeningModeChangeAnalyticsEventWithMode:(int64_t)a3;
- (void)_recordSpatialChangeAnalyticsEventWithMode:(int64_t)a3;
- (void)_recordSpatialChangeAnalyticsEventWithMode:(int64_t)a3 headTrackingEnabled:(BOOL)a4;
- (void)_setHeadTrackingEnabledOnAllHeadsets:(BOOL)a3;
- (void)_setSpatialAudioModeOnAllHeadsets:(int64_t)a3;
- (void)_updateAudioFormat;
- (void)_updateCurrentListeningMode;
- (void)_updateCurrentSettings;
- (void)_updateCurrentSpatialMode;
- (void)_updateSpatialSections;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatApplication:(id)a4;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAudioFormat:(id)a3;
- (void)setAudioFormatController:(id)a3;
- (void)setBestAvailableFormat:(int64_t)a3;
- (void)setBluetoothDevice:(id)a3;
- (void)setCurrentListeningMode:(int64_t)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setCurrentSpatialMode:(int64_t)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setFocusedSetting:(int64_t)a3;
- (void)setForegroundAppBundleID:(id)a3;
- (void)setHeadTrackingEnabled:(BOOL)a3;
- (void)setHeadsetRoutes:(id)a3;
- (void)setIsContentEligibleForSpatialization:(BOOL)a3;
- (void)setIsMusicApp:(BOOL)a3;
- (void)setIsSharingAudio:(BOOL)a3;
- (void)setIsSpatialEnabledGlobally:(BOOL)a3;
- (void)setListeningModeChangedTimer:(id)a3;
- (void)setNowPlayingApp:(id)a3;
- (void)setNowPlayingApp:(id)a3 bundleID:(id)a4;
- (void)setNowPlayingBundleID:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsDataSource:(id)a3;
- (void)setSpatialAudioFocused:(BOOL)a3;
- (void)setSpatialBlackPackageView:(id)a3;
- (void)setSpatialModeChangedTimer:(id)a3;
- (void)setSpatialWhitePackageView:(id)a3;
- (void)setTutorialStateObserver:(id)a3;
- (void)updateListeningModeSection;
- (void)updateSnapshot;
- (void)viewDidLoad;
@end

@implementation TVSMAirPodsModuleHeadsetSettingsCollectionViewController

- (TVSMAirPodsModuleHeadsetSettingsCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v26;
  v26 = 0LL;
  v24.receiver = v3;
  v24.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController;
  v15 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController initWithCollectionViewLayout:]( &v24,  "initWithCollectionViewLayout:",  location[0]);
  v26 = v15;
  objc_storeStrong((id *)&v26, v15);
  if (v15)
  {
    v28 = (dispatch_once_t *)&unk_5F8F0;
    id v27 = 0LL;
    objc_storeStrong(&v27, &stru_50DA8);
    if (*v28 != -1) {
      dispatch_once(v28, v27);
    }
    objc_storeStrong(&v27, 0LL);
    v4 = objc_alloc_init(&OBJC_CLASS___MRNowPlayingAudioFormatController);
    audioFormatController = v26->_audioFormatController;
    v26->_audioFormatController = v4;

    -[MRNowPlayingAudioFormatController setDelegate:](v26->_audioFormatController, "setDelegate:", v26);
    v6 = objc_alloc_init(&OBJC_CLASS___TVCSSpatialTutorialStateObserver);
    tutorialStateObserver = v26->_tutorialStateObserver;
    v26->_tutorialStateObserver = v6;

    -[TVCSSpatialTutorialStateObserver addObserver:forKeyPath:options:context:]( v26->_tutorialStateObserver,  "addObserver:forKeyPath:options:context:",  v26,  @"tutorialState",  0LL,  off_5F600);
    id v23 = +[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute");
    v8 = -[TVNPEndpointRouteConnection initWithRoute:]( objc_alloc(&OBJC_CLASS___TVNPEndpointRouteConnection),  "initWithRoute:",  v23);
    routeConnection = v26->_routeConnection;
    v26->_routeConnection = v8;

    -[TVNPEndpointRouteConnection connectAndPair](v26->_routeConnection, "connectAndPair");
    objc_initWeak(&v22, v26);
    v14 = v26->_routeConnection;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_1C820;
    v20 = &unk_506C0;
    objc_copyWeak(&v21, &v22);
    v10 = (NSCopying *) -[TVNPEndpointRouteConnection registerMetadataUpdateHandler:]( v14,  "registerMetadataUpdateHandler:",  &v16);
    metadataObserverToken = v26->_metadataObserverToken;
    v26->_metadataObserverToken = v10;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v22);
    objc_storeStrong(&v23, 0LL);
  }

  v13 = v26;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  return v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVCSSpatialTutorialStateObserver invalidate](self->_tutorialStateObserver, "invalidate");
  -[TVNPOutputDeviceRoute removeObserver:forKeyPath:context:]( v4->_currentRoute,  "removeObserver:forKeyPath:context:",  v4,  @"outputDeviceRoute",  off_5F608);
  -[TVNPEndpointRouteConnection deregisterMetadataUpdateHandler:]( v4->_routeConnection,  "deregisterMetadataUpdateHandler:",  v4->_metadataObserverToken);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController;
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  v36 = self;
  location[1] = (id)a2;
  id v9 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](self, "collectionView");
  id v8 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _headsetSettingsLayout]( v36,  "_headsetSettingsLayout");
  objc_msgSend(v9, "setCollectionViewLayout:animated:");

  id v10 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v10 setContentInsetAdjustmentBehavior:2];

  id v11 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v11 setIndexDisplayMode:1];

  id v12 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v12 setClipsToBounds:0];

  id v15 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell);
  objc_super v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell);
  v14 = NSStringFromClass(v2);
  objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v13);

  id v18 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell);
  SEL v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell);
  int v17 = NSStringFromClass(v3);
  objc_msgSend(v18, "registerClass:forCellWithReuseIdentifier:", v16);

  id v19 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v19 registerClass:objc_opt_class(TVSMAirPodsModuleHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];

  id v20 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v20 registerClass:objc_opt_class(TVNPRoutesHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header-old"];

  id v21 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  [v21 setScrollEnabled:0];

  objc_initWeak(location, v36);
  id v22 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v36, "collectionView");
  v29 = _NSConcreteStackBlock;
  int v30 = -1073741824;
  int v31 = 0;
  v32 = sub_1CEBC;
  v33 = &unk_50DF0;
  objc_copyWeak(v34, location);
  v7 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v22,  "initWithCollectionView:cellProvider:",  v6,  &v29);
  settingsDataSource = v36->_settingsDataSource;
  v36->_settingsDataSource = v7;

  v5 = v36->_settingsDataSource;
  id v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1D5A0;
  id v27 = &unk_50E18;
  objc_copyWeak(&v28, location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v5, "setSupplementaryViewProvider:", &v23);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateAudioFormat](v36, "_updateAudioFormat");
  objc_destroyWeak(&v28);
  objc_destroyWeak(v34);
  objc_destroyWeak(location);
}

- (void)setCurrentRoute:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (([location[0] isEqual:v18->_currentRoute] & 1) == 0)
  {
    -[TVNPOutputDeviceRoute removeObserver:forKeyPath:context:]( v18->_currentRoute,  "removeObserver:forKeyPath:context:",  v18);
    objc_storeStrong((id *)&v18->_currentRoute, location[0]);
    -[TVNPOutputDeviceRoute addObserver:forKeyPath:options:context:]( v18->_currentRoute,  "addObserver:forKeyPath:options:context:",  v18,  @"outputDeviceRoute",  0LL,  off_5F608);
    v7 = -[TVNPOutputDeviceRoute outputDeviceRoute](v18->_currentRoute, "outputDeviceRoute");
    id v6 = objc_msgSend(-[MPAVOutputDeviceRoute logicalLeaderOutputDevice](v7, "logicalLeaderOutputDevice"), "uid");
    id v5 = [v6 componentsSeparatedByString:@"-"];
    id v16 = [v5 firstObject];

    id v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v8 = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");
    id v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    uint64_t v13 = sub_1DAE0;
    v14 = &unk_50D38;
    id v15 = v16;
    SEL v3 = (TVSBluetoothDevice *)objc_msgSend(v8, "msv_firstWhere:", &v10);
    bluetoothDevice = v18->_bluetoothDevice;
    v18->_bluetoothDevice = v3;

    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentSettings](v18, "_updateCurrentSettings");
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  uint64_t v13 = a6;
  if (a6 == off_5F608)
  {
    id v12 = [v14 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    id v6 = -[TVNPOutputDeviceRoute outputDeviceRoute](v17->_currentRoute, "outputDeviceRoute");
    BOOL v7 = v6 == v12;

    if (!v7) {
      -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentSettings](v17, "_updateCurrentSettings");
    }
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentListeningMode]( v17,  "_updateCurrentListeningMode");
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    v11.receiver = v17;
    v11.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController;
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v15,  v14,  v13);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateSnapshot
{
  v4 = self;
  v3[1] = (id)a2;
  v3[0] = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  if (-[TVNPOutputDeviceRoute spatialAudioSupported](v4->_currentRoute, "spatialAudioSupported")
    && -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppSupportsSpatial]( v4,  "_currentAppSupportsSpatial")
    && -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _deviceSupportsSpatial](v4, "_deviceSupportsSpatial"))
  {
    [v3[0] appendSectionsWithIdentifiers:&off_533D8];
    [v3[0] appendItemsWithIdentifiers:&off_533F0 intoSectionWithIdentifier:@"Spatial"];
    if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](v4, "_spatialUnavailable"))
    {
      [v3[0] appendSectionsWithIdentifiers:&off_53408];
      [v3[0] appendItemsWithIdentifiers:&off_53420 intoSectionWithIdentifier:@"SpatializeStereo"];
    }
  }

  if (-[TVNPOutputDeviceRoute noiseControlSupported](v4->_currentRoute, "noiseControlSupported"))
  {
    [v3[0] appendSectionsWithIdentifiers:&off_53438];
    [v3[0] appendItemsWithIdentifiers:&off_53450 intoSectionWithIdentifier:@"Noise Control"];
  }

  objc_super v2 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v4, "settingsDataSource");
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:]( v2,  "applySnapshot:animatingDifferences:",  v3[0],  0LL);

  objc_storeStrong(v3, 0LL);
}

- (void)updateListeningModeSection
{
  id v19 = self;
  SEL v18 = a2;
  id v10 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](self, "settingsDataSource");
  id v9 = -[UICollectionViewDiffableDataSource snapshot](v10, "snapshot");
  id v8 = [v9 sectionIdentifiers];
  unsigned __int8 v11 = [v8 containsObject:@"Noise Control"];

  char v17 = v11 & 1;
  if ((v11 & 1) != 0)
  {
    id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v19, "settingsDataSource");
    id v7 = -[UICollectionViewDiffableDataSource indexForSectionIdentifier:]( v6,  "indexForSectionIdentifier:",  @"Noise Control");

    id v16 = v7;
    for (uint64_t i = 0LL; i < 3; ++i)
    {
      id v14 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  i,  v16);
      id v2 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v19, "collectionView");
      id v13 = [v2 cellForItemAtIndexPath:v14];

      v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v19, "settingsDataSource");
      id v3 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v4, "itemIdentifierForIndexPath:", v14);
      id v5 = [v3 integerValue];

      id v12 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _listeningModeForSetting:]( v19,  "_listeningModeForSetting:",  v5);
      [v13 setDisplayAsSelected:v12 == (id)v19->_currentListeningMode];
      objc_storeStrong(&v13, 0LL);
      objc_storeStrong((id *)&v14, 0LL);
    }
  }

- (NSString)currentAppBundleID
{
  return (NSString *)-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID]( self,  "_currentAppBundleID",  a2,  self);
}

- (BOOL)musicHeadTrackingAvailable
{
  return -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _musicHeadTrackingAvailable]( self,  "_musicHeadTrackingAvailable",  a2,  self);
}

- (BOOL)splitterSpatialActive
{
  return -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterSpatialActive]( self,  "_splitterSpatialActive",  a2,  self);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v20 = 0LL;
  objc_storeStrong(&v20, a5);
  id v19 = [v21 nextFocusedIndexPath];
  id v18 = 0LL;
  if (v19)
  {
    unsigned __int8 v11 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v23, "settingsDataSource");
    id v5 =  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:]( v11,  "sectionIdentifierForIndex:",  [v19 section]);
    id v6 = v18;
    id v18 = v5;
  }

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setFocusedIndexPath:](v23, "setFocusedIndexPath:", v19);
  id v10 = v23;
  char v16 = 0;
  char v14 = 0;
  if (v19)
  {
    char v17 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v23, "settingsDataSource");
    char v16 = 1;
    id v15 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v17, "itemIdentifierForIndexPath:", v19);
    char v14 = 1;
    uint64_t v9 = (uint64_t)[v15 integerValue];
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setFocusedSetting:](v10, "setFocusedSetting:", v9);
  if ((v14 & 1) != 0) {

  }
  if ((v16 & 1) != 0) {
  id v7 = v23;
  }
  unsigned __int8 v8 = 1;
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setSpatialAudioFocused:]( v7,  "setSpatialAudioFocused:",  v8 & 1);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v12, "settingsDataSource");
  id v9 =  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:]( v5,  "sectionIdentifierForIndex:",  [v10 section]);

  id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v12, "settingsDataSource");
  id v8 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v6, "itemIdentifierForIndexPath:", v10);

  id v7 = [v8 integerValue];
  if ([v9 isEqualToString:@"Spatial"])
  {
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _didSelectSpatialSetting:]( v12,  "_didSelectSpatialSetting:",  v7);
  }

  else if ([v9 isEqualToString:@"SpatializeStereo"])
  {
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _didSelectSpatializeStereo]( v12,  "_didSelectSpatializeStereo");
  }

  else if ([v9 isEqualToString:@"Noise Control"])
  {
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _didSelectHeadsetListeningModeSetting:]( v12,  "_didSelectHeadsetListeningModeSetting:",  v7);
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v15 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController focusedIndexPath](v23, "focusedIndexPath");
  char v19 = 0;
  BOOL v16 = 0;
  if (v15)
  {
    id v13 = [v21 section];
    id v20 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController focusedIndexPath](v23, "focusedIndexPath");
    char v19 = 1;
    BOOL v16 = v13 == (id)-[NSIndexPath section](v20, "section");
  }

  if ((v19 & 1) != 0) {

  }
  if (v16)
  {
    char v24 = 1;
    int v18 = 1;
  }

  else
  {
    id v12 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v23, "settingsDataSource");
    id v17 =  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:]( v12,  "sectionIdentifierForIndex:",  [v21 section]);

    if ([v17 isEqualToString:@"Spatial"])
    {
      id v10 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v23, "settingsDataSource");
      id v9 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v10, "itemIdentifierForIndexPath:", v21);
      id v11 = [v9 integerValue];

      char v24 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsSelected:]( v23,  "_shouldShowSettingAsSelected:",  v11);
      int v18 = 1;
    }

    else
    {
      if ([v17 isEqualToString:@"Noise Control"])
      {
        id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v23, "settingsDataSource");
        id v5 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v6, "itemIdentifierForIndexPath:", v21);
        id v7 = [v5 integerValue];

        id v8 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _listeningModeForSetting:]( v23,  "_listeningModeForSetting:",  v7);
        char v24 = v8 == (id)-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController currentListeningMode]( v23,  "currentListeningMode");
      }

      else
      {
        char v24 = 1;
      }

      int v18 = 1;
    }

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
  return v24 & 1;
}

- (void)setNowPlayingApp:(id)a3 bundleID:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  if (!-[NSString isEqualToString:](v12->_nowPlayingApp, "isEqualToString:", location[0])
    || !-[NSString isEqualToString:](v12->_nowPlayingBundleID, "isEqualToString:", v10))
  {
    v4 = (NSString *)[location[0] copy];
    nowPlayingApp = v12->_nowPlayingApp;
    v12->_nowPlayingApp = v4;

    id v6 = (NSString *)[v10 copy];
    nowPlayingBundleID = v12->_nowPlayingBundleID;
    v12->_nowPlayingBundleID = v6;

    unsigned __int8 v8 = [v10 isEqualToString:@"com.apple.TVMusic"];
    v12->_isMusicApp = v8 & 1;
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentSpatialMode]( v12,  "_updateCurrentSpatialMode");
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController updateSnapshot](v12, "updateSnapshot");
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setIsContentEligibleForSpatialization:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (a3 != self->_isContentEligibleForSpatialization)
  {
    os_log_t oslog = (os_log_t)(id)qword_5F8F8;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1EB24((uint64_t)v7, v4);
      _os_log_impl(&dword_0, oslog, OS_LOG_TYPE_DEFAULT, "Eligible for spatialization: %d", v7, 8u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v6->_isContentEligibleForSpatialization = v4;
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController updateSnapshot](v6, "updateSnapshot");
  }

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatApplication:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v8 = (id)qword_5F8F8;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_126C0((uint64_t)v12, (uint64_t)v9);
    _os_log_impl(&dword_0, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "audioFormatApplication: %@", v12, 0xCu);
  }

  objc_storeStrong(&v8, 0LL);
  BOOL v4 = v11;
  id v6 = [v9 displayName];
  id v5 = [v9 bundleID];
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setNowPlayingApp:bundleID:]( v4,  "setNowPlayingApp:bundleID:",  v6);

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateAudioFormat](v11, "_updateAudioFormat");
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  os_log_t oslog = (os_log_t)(id)qword_5F8F8;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_126C0((uint64_t)v9, (uint64_t)v6);
    _os_log_impl(&dword_0, oslog, OS_LOG_TYPE_DEFAULT, "audiFormatContentInfo: %@", v9, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setIsContentEligibleForSpatialization:]( v8,  "setIsContentEligibleForSpatialization:",  (unint64_t)[v6 isEligibleForSpatialization] & 1);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateAudioFormat](v8, "_updateAudioFormat");
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_musicAppAudioFormat
{
  if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController isSpatialEnabledGlobally]( self,  "isSpatialEnabledGlobally")
    || !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _isMusicSpatialEnabled]( self,  "_isMusicSpatialEnabled")
    || !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](self, "_spatialEnabled"))
  {
    goto LABEL_8;
  }

  BOOL v7 = (char *)-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController bestAvailableFormat]( self,  "bestAvailableFormat") == (char *)&dword_0 + 2;
  BOOL v6 = (char *)-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController bestAvailableFormat]( self,  "bestAvailableFormat") == (char *)&dword_0 + 1;
  if (v7)
  {
    id v5 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v9 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"SpatialDolbyAtmosAudioFormat",  &stru_51218,  0LL);

    return v9;
  }

  if (v6)
  {
    BOOL v4 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v10 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"SpatialMultichannelAudioFormat",  &stru_51218,  0LL);

    return v10;
  }

  else
  {
LABEL_8:
    id v3 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v11 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"SpatialStereoAudioFormat",  &stru_51218,  0LL);

    return v11;
  }

- (void)_updateAudioFormat
{
  id v20 = self;
  SEL v19 = a2;
  id v10 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
  char v17 = 0;
  char v15 = 0;
  char v13 = 0;
  if ([v10 isEqualToString:@"com.apple.TVMusic"])
  {
    id v18 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _musicAppAudioFormat]( v20,  "_musicAppAudioFormat");
    char v17 = 1;
    objc_storeStrong((id *)&v20->_audioFormat, v18);
  }

  else
  {
    id v16 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( v20->_audioFormatController,  "audioFormatContentInfo");
    char v15 = 1;
    id v14 = [v16 audioFormatDescription];
    char v13 = 1;
    objc_storeStrong((id *)&v20->_audioFormat, v14);
  }

  if ((v13 & 1) != 0) {

  }
  if ((v15 & 1) != 0) {
  if ((v17 & 1) != 0)
  }

  id v8 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v20, "settingsDataSource");
  id v7 = -[UICollectionViewDiffableDataSource snapshot](v8, "snapshot");
  id v6 = [v7 sectionIdentifiers];
  unsigned __int8 v9 = [v6 containsObject:@"Spatial"];

  char v12 = v9 & 1;
  if ((v9 & 1) != 0)
  {
    id v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v20, "collectionView");
    id v2 = +[NSIndexPath indexPathForItem:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForItem:inSection:", 0LL);
    id v11 = objc_msgSend(v3, "supplementaryViewForElementKind:atIndexPath:", UICollectionElementKindSectionHeader);

    id v4 = v11;
    id v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _resolvedDetailText](v20, "_resolvedDetailText");
    objc_msgSend(v4, "setDetailText:");

    objc_msgSend( v11,  "setConfigureForAtmos:",  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _dolbyAtmosActive](v20, "_dolbyAtmosActive"));
    [v11 layoutIfNeeded];
    objc_storeStrong(&v11, 0LL);
  }

- (void)_updateCurrentSettings
{
  if (!-[NSTimer isValid](self->_listeningModeChangedTimer, "isValid")) {
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentListeningMode]( self,  "_updateCurrentListeningMode");
  }
  if (!-[NSTimer isValid](self->_spatialModeChangedTimer, "isValid")) {
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateCurrentSpatialMode]( self,  "_updateCurrentSpatialMode");
  }
}

- (void)_optimisticallyUpdateListeningMode:(int64_t)a3
{
  char v12 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  self->_currentListeningMode = a3;
  -[NSTimer invalidate](v12->_listeningModeChangedTimer, "invalidate");
  objc_storeStrong((id *)&v12->_listeningModeChangedTimer, 0LL);
  objc_initWeak(location, v12);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1F564;
  unsigned __int8 v9 = &unk_50E40;
  objc_copyWeak(&v10, location);
  id v3 =  +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  0LL,  &v5,  3.0);
  listeningModeChangedTimer = v12->_listeningModeChangedTimer;
  v12->_listeningModeChangedTimer = v3;

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController updateListeningModeSection]( v12,  "updateListeningModeSection");
  objc_destroyWeak(&v10);
  objc_destroyWeak(location);
}

- (void)_updateCurrentListeningMode
{
  int64_t v2 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentEnabledSettingForListeningMode]( self,  "_currentEnabledSettingForListeningMode");
  if (v2 != self->_currentListeningMode)
  {
    self->_currentListeningMode = v2;
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController updateListeningModeSection]( self,  "updateListeningModeSection");
  }

- (void)_optimisticallyUpdateSpatialMode:(int64_t)a3 headTrackingEnabled:(BOOL)a4
{
  id v16 = self;
  SEL v15 = a2;
  int64_t v14 = a3;
  BOOL v13 = a4;
  self->_currentSpatialMode = a3;
  v16->_headTrackingEnabled = v13;
  -[NSTimer invalidate](v16->_spatialModeChangedTimer, "invalidate");
  objc_storeStrong((id *)&v16->_spatialModeChangedTimer, 0LL);
  objc_initWeak(&location, v16);
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  unsigned __int8 v9 = sub_1F820;
  id v10 = &unk_50E40;
  objc_copyWeak(&v11, &location);
  id v4 =  +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  0LL,  &v6,  3.0);
  spatialModeChangedTimer = v16->_spatialModeChangedTimer;
  v16->_spatialModeChangedTimer = v4;

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateSpatialSections](v16, "_updateSpatialSections");
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateAudioFormat](v16, "_updateAudioFormat");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateCurrentSpatialMode
{
  self->_currentSpatialMode = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentEnabledSpatialMode]( self,  "_currentEnabledSpatialMode");
  self->_isSpatialEnabledGlobally = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentGlobalSpatialSetting]( self,  "_currentGlobalSpatialSetting");
  bluetoothDevice = self->_bluetoothDevice;
  id v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
  char v6 = 0;
  unsigned __int8 v5 = 0;
  if ((-[TVSBluetoothDevice headTrackingEnabledForBundleID:]( bluetoothDevice,  "headTrackingEnabledForBundleID:") & 1) != 0)
  {
    id v7 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
    char v6 = 1;
    unsigned __int8 v2 = 1;
    if ([v7 isEqualToString:@"com.apple.TVMusic"]) {
      unsigned __int8 v2 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _musicHeadTrackingAvailable]( self,  "_musicHeadTrackingAvailable");
    }
    unsigned __int8 v5 = v2;
  }

  self->_headTrackingEnabled = v5 & 1;
  if ((v6 & 1) != 0) {

  }
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _updateSpatialSections](self, "_updateSpatialSections");
}

- (void)_updateSpatialSections
{
  v32 = self;
  SEL v31 = a2;
  id v20 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](self, "settingsDataSource");
  id v19 = -[UICollectionViewDiffableDataSource snapshot](v20, "snapshot");
  id v18 = [v19 sectionIdentifiers];
  unsigned __int8 v21 = [v18 containsObject:@"Spatial"];

  char v30 = v21 & 1;
  if ((v21 & 1) != 0)
  {
    id v16 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v32, "settingsDataSource");
    id v17 = -[UICollectionViewDiffableDataSource indexForSectionIdentifier:]( v16,  "indexForSectionIdentifier:",  @"Spatial");

    id v29 = v17;
    for (uint64_t i = 0LL; i < 3; ++i)
    {
      id v27 =  +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  i,  v29);
      id v10 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v32, "collectionView");
      id location = [v10 cellForItemAtIndexPath:v27];

      char v12 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v32, "settingsDataSource");
      id v11 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v12, "itemIdentifierForIndexPath:", v27);
      id v13 = [v11 integerValue];

      id v25 = v13;
      objc_msgSend( location,  "setDisplayAsSelected:",  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsSelected:]( v32,  "_shouldShowSettingAsSelected:",  v13));
      id v14 = location;
      unsigned __int8 v15 = 1;
      if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](v32, "_spatialUnavailable")) {
        unsigned __int8 v15 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsDisabled:]( v32,  "_shouldShowSettingAsDisabled:",  v25);
      }
      [v14 setDisabled:v15 & 1];
      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v27, 0LL);
    }

    int v8 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v32, "settingsDataSource");
    id v7 = -[UICollectionViewDiffableDataSource snapshot](v8, "snapshot");
    id v6 = [v7 sectionIdentifiers];
    unsigned __int8 v9 = [v6 containsObject:@"SpatializeStereo"];

    char v24 = v9 & 1;
    if ((v9 & 1) != 0)
    {
      unsigned __int8 v2 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController settingsDataSource](v32, "settingsDataSource");
      id v23 =  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:]( v2,  "indexPathForItemIdentifier:",  &off_531E0);

      id v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController collectionView](v32, "collectionView");
      id v22 = [v3 cellForItemAtIndexPath:v23];

      id v4 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _packageNameForSetting:]( v32,  "_packageNameForSetting:",  4LL);
      objc_msgSend(v22, "setPackageName:");

      objc_msgSend( v22,  "setDisplayAsSelected:",  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatializeStereoEnabled]( v32,  "_spatializeStereoEnabled"));
      unsigned __int8 v5 = 1;
      if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](v32, "_spatialEnabled"))
      {
        unsigned __int8 v5 = 1;
        if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable]( v32,  "_spatialUnavailable")) {
          unsigned __int8 v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsDisabled:]( v32,  "_shouldShowSettingAsDisabled:",  4LL);
        }
      }

      [v22 setDisabled:v5 & 1];
      objc_storeStrong(&v22, 0LL);
      objc_storeStrong(&v23, 0LL);
    }
  }

- (BOOL)_isMultichannelAvailable
{
  id v3 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( self->_audioFormatController,  "audioFormatContentInfo");
  id v4 = (char *)[v3 bestAvailableAudioFormat];

  char v6 = 0;
  unsigned __int8 v5 = 1;
  if (v4 != (_BYTE *)&dword_0 + 2)
  {
    unsigned __int8 v5 = 1;
    if (v4 != (_BYTE *)&dword_0 + 1)
    {
      id v7 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( self->_audioFormatController,  "audioFormatContentInfo");
      char v6 = 1;
      unsigned __int8 v5 = [v7 isMultichannel];
    }
  }

  if ((v6 & 1) != 0) {

  }
  return v5 & 1;
}

- (BOOL)_isMusicSpatialEnabled
{
  id v3 = +[MPPlaybackUserDefaults standardUserDefaults](&OBJC_CLASS___MPPlaybackUserDefaults, "standardUserDefaults");
  unsigned __int8 v4 = [v3 prefersSpatialAudio];

  return v4 & 1;
}

- (BOOL)_spatialEnabled
{
  BOOL v3 = 0;
  if (self->_currentSpatialMode) {
    return self->_currentSpatialMode != 4;
  }
  return v3;
}

- (BOOL)_spatialUnavailable
{
  unsigned __int8 v3 = 1;
  if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController isSpatialEnabledGlobally]( self,  "isSpatialEnabledGlobally"))
  {
    if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController isContentEligibleForSpatialization]( self,  "isContentEligibleForSpatialization")
      || (unsigned __int8 v3 = 1,
          !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppCanBeIneligibleForSpatialization]( self,  "_currentAppCanBeIneligibleForSpatialization")))
    {
      unsigned __int8 v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterPreventingSpatial]( self,  "_splitterPreventingSpatial");
    }
  }

  return v3 & 1;
}

- (BOOL)_musicHeadTrackingAvailable
{
  if ((_os_feature_enabled_impl("CoreAudioServices", "tvOSAudioOnlySpatialization") & 1) != 0) {
    return 1;
  }
  unsigned __int8 v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](self, "routeConnection");
  char v5 = 0;
  unsigned __int8 v4 = 0;
  if (-[TVNPEndpointRouteConnection isVideo](v3, "isVideo"))
  {
    id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
    char v5 = 1;
    unsigned __int8 v4 = [v6 isEqualToString:@"com.apple.TVMusic"];
  }

  BOOL v8 = v4 & 1;
  if ((v5 & 1) != 0) {

  }
  return v8;
}

- (BOOL)_spatialFixedEnabled
{
  if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](self, "_spatialEnabled")) {
    return 0;
  }
  unsigned __int8 v3 = 1;
  if (self->_headTrackingEnabled) {
    unsigned __int8 v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _headTrackingDisabled]( self,  "_headTrackingDisabled");
  }
  return v3 & 1;
}

- (BOOL)_spatialAndHeadTrackingEnabled
{
  if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](self, "_spatialEnabled")) {
    return 0;
  }
  LOBYTE(v3) = 0;
  if (self->_headTrackingEnabled) {
    unsigned int v3 = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _headTrackingDisabled]( self,  "_headTrackingDisabled");
  }
  return v3 & 1;
}

- (BOOL)_spatializeStereoEnabled
{
  char v7 = 0;
  unsigned __int8 v4 = 0;
  if (self->_currentSpatialMode == 1)
  {
    id v8 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
    char v7 = 1;
    unsigned __int8 v4 = [v8 isEqualToString:@"com.apple.Fitness"];
  }

  if ((v7 & 1) != 0) {

  }
  if ((v4 & 1) != 0) {
    return 0;
  }
  char v5 = 0;
  LOBYTE(v3) = 0;
  if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](self, "_spatialEnabled"))
  {
    LOBYTE(v3) = 0;
    if (self->_currentSpatialMode != 3)
    {
      id v6 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID]( self,  "_currentAppBundleID");
      char v5 = 1;
      if (([v6 isEqualToString:@"com.apple.TVMusic"] & 1) == 0
        || (LOBYTE(v3) = 0,
            -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _musicHeadTrackingAvailable]( self,  "_musicHeadTrackingAvailable")))
      {
        unsigned int v3 = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterPreventingSpatial]( self,  "_splitterPreventingSpatial");
      }
    }
  }

  BOOL v10 = v3 & 1;
  if ((v5 & 1) != 0) {

  }
  return v10;
}

- (BOOL)_dolbyAtmosActive
{
  char v17 = 0;
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  if (+[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState")
    || (id v18 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](self, "routeConnection"),
        char v17 = 1,
        (char *)-[TVNPEndpointRouteConnection playbackState](v18, "playbackState") == (char *)&dword_0 + 2)
    || (id v16 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](self, "routeConnection"),
        char v15 = 1,
        unsigned __int8 v4 = 0,
        (int *)-[TVNPEndpointRouteConnection playbackState](v16, "playbackState") == &dword_4))
  {
    id v14 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
    char v13 = 1;
    char v12 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](self, "routeConnection");
    char v11 = 1;
    BOOL v10 = -[TVNPEndpointRouteConnection bundleID](v12, "bundleID");
    char v9 = 1;
    unsigned __int8 v4 = objc_msgSend(v14, "isEqualToString:");
  }

  if ((v9 & 1) != 0) {

  }
  if ((v11 & 1) != 0) {
  if ((v13 & 1) != 0)
  }

  if ((v15 & 1) != 0) {
  if ((v17 & 1) != 0)
  }

  char v7 = 0;
  char v5 = 0;
  BOOL v3 = 0;
  if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](self, "_spatialEnabled"))
  {
    BOOL v3 = 0;
    if (!-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](self, "_spatialUnavailable"))
    {
      id v8 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController audioFormatController]( self,  "audioFormatController");
      char v7 = 1;
      id v6 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v8, "audioFormatContentInfo");
      char v5 = 1;
      BOOL v3 = 0;
    }
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  return v3;
  }
}

- (BOOL)_headTrackingDisabled
{
  return _AXSSpatialAudioHeadTracking(self, a2) == 0;
}

- (BOOL)_splitterPreventingSpatial
{
  char v4 = 0;
  if (self->_isSharingAudio)
  {
    LOBYTE(v3) = 1;
    if ((_os_feature_enabled_impl("CoreAudioServices", "SpatialOnAggregateDevices") & 1) != 0) {
      unsigned int v3 = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _allHeadsetsSupportSpatialWhileSharing]( self,  "_allHeadsetsSupportSpatialWhileSharing");
    }
    char v4 = v3;
  }

  return v4 & 1;
}

- (BOOL)_splitterSpatialActive
{
  unsigned __int8 v3 = 0;
  if (self->_isSharingAudio)
  {
    unsigned __int8 v3 = 0;
    if ((_os_feature_enabled_impl("CoreAudioServices", "SpatialOnAggregateDevices") & 1) != 0) {
      unsigned __int8 v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _allHeadsetsSupportSpatialWhileSharing]( self,  "_allHeadsetsSupportSpatialWhileSharing");
    }
  }

  return v3 & 1;
}

- (BOOL)_currentAppCanBeIneligibleForSpatialization
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
  unsigned int v3 = [v4[0] isEqualToString:@"com.apple.TVMusic"] ^ 1;
  objc_storeStrong(v4, 0LL);
  return v3 & 1;
}

- (BOOL)_shouldShowSettingAsSelected:(int64_t)a3
{
  if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](self, "_spatialUnavailable"))
  {
    return a3 == 1;
  }

  else if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterSpatialActive]( self,  "_splitterSpatialActive") {
         && -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialAndHeadTrackingEnabled]( self,  "_spatialAndHeadTrackingEnabled"))
  }
  {
    return a3 == 2;
  }

  else
  {
    char v8 = 0;
    unsigned __int8 v7 = 0;
    if (self->_currentSpatialMode == 1)
    {
      id v9 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID]( self,  "_currentAppBundleID");
      char v8 = 1;
      unsigned __int8 v7 = [v9 isEqualToString:@"com.apple.Fitness"];
    }

    if ((v8 & 1) != 0) {

    }
    if ((v7 & 1) != 0)
    {
      return a3 == 1;
    }

    else
    {
      unsigned __int8 v6 = 0;
      if (a3 == 3) {
        unsigned __int8 v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialAndHeadTrackingEnabled]( self,  "_spatialAndHeadTrackingEnabled");
      }
      unsigned __int8 v5 = 0;
      if (a3 == 2) {
        unsigned __int8 v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialFixedEnabled]( self,  "_spatialFixedEnabled");
      }
      HIDWORD(v4) = 0;
      if (a3 == 1) {
        HIDWORD(v4) = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled]( self,  "_spatialEnabled");
      }
      if ((v6 & 1) != 0 || (v5 & 1) != 0 || (LODWORD(v4) = 0, (v4 & 0x100000000LL) != 0)) {
        LODWORD(v4) = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable]( self,  "_spatialUnavailable",  v4);
      }
      return v4 & 1;
    }
  }

- (BOOL)_shouldShowSettingAsDisabled:(int64_t)a3
{
  char v8 = 0;
  BOOL v5 = 0;
  if (self->_currentSpatialMode == 1)
  {
    id v9 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
    char v8 = 1;
    BOOL v5 = 0;
  }

  if ((v8 & 1) != 0) {

  }
  if (v5)
  {
    return 0;
  }

  else
  {
    char v6 = 0;
    if (a3 == 3 || (LOBYTE(v4) = 0, a3 == 4))
    {
      id v7 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID]( self,  "_currentAppBundleID");
      char v6 = 1;
      LOBYTE(v4) = 0;
      if ([v7 isEqualToString:@"com.apple.TVMusic"]) {
        unsigned int v4 = !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _musicHeadTrackingAvailable]( self,  "_musicHeadTrackingAvailable");
      }
    }

    if ((v6 & 1) != 0) {

    }
    return (v4 & 1) != 0
        || a3 == 3
        && -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _headTrackingDisabled]( self,  "_headTrackingDisabled")
        || a3 == 3
        && -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterSpatialActive]( self,  "_splitterSpatialActive");
  }

- (int64_t)_listeningModeForSetting:(int64_t)a3
{
  if (a3 == 5) {
    return 2LL;
  }
  if (a3 == 6) {
    return 3LL;
  }
  return a3 == 7;
}

- (int64_t)_currentEnabledSpatialMode
{
  bluetoothDevice = self->_bluetoothDevice;
  id v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
  id v5 = -[TVSBluetoothDevice spatialAudioModeForBundleID:](bluetoothDevice, "spatialAudioModeForBundleID:");

  return (int64_t)v5;
}

- (int64_t)_currentEnabledSettingForListeningMode
{
  return (int64_t)-[TVSBluetoothDevice listeningMode](self->_bluetoothDevice, "listeningMode", a2, self);
}

- (BOOL)_currentGlobalSpatialSetting
{
  unsigned int v3 = (char *)-[TVCSSpatialTutorialStateObserver tutorialState](self->_tutorialStateObserver, "tutorialState");
  if (v3) {
    char v5 = v3 == (_BYTE *)&dword_0 + 2;
  }
  else {
    char v5 = -[TVSBluetoothDevice spatialAudioAllowed](self->_bluetoothDevice, "spatialAudioAllowed") & 1;
  }
  return v5 & 1;
}

- (id)_packageNameForSetting:(int64_t)a3
{
  v5[3] = self;
  v5[2] = (id)a2;
  v5[1] = (id)a3;
  v5[0] = 0LL;
  if ((unint64_t)a3 <= 7) {
    __asm { BR              X8 }
  }

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)_packageViewWithName:(id)a3 activeStateName:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v7 = objc_alloc(&OBJC_CLASS___TVSMCAPackageView);
  id v6 = location[0];
  char v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v16));
  char v13 = -[TVSMCAPackageView initWithPackageName:inBundle:](v7, "initWithPackageName:inBundle:", v6);

  BOOL v10 = v13;
  id v9 = v14;
  id v11 = +[UITraitCollection currentTraitCollection](&OBJC_CLASS___UITraitCollection, "currentTraitCollection");
  -[TVSMCAPackageView setStateName:forPackageViewState:traitCollection:]( v10,  "setStateName:forPackageViewState:traitCollection:",  v9,  1LL);

  char v12 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

- (id)_stringForAirPodsSettingType:(int64_t)a3
{
  if ((unint64_t)a3 <= 7) {
    __asm { BR              X8 }
  }

  return 0LL;
}

- (void)_didSelectSpatialSetting:(int64_t)a3
{
  char v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  char v14 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](self, "_spatialUnavailable");
  if (v14
    || -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsDisabled:]( v17,  "_shouldShowSettingAsDisabled:",  v15))
  {
    id location = (id)qword_5F8F8;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v12;
      sub_804C(v11);
      _os_log_impl( &dword_0,  log,  type,  "Ignoring selection in spatial section because spatial audio is disabled in Settings or Audio Sharing is active",  v11,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

  else
  {
    uint64_t v10 = 4LL;
    char v9 = 0;
    switch(v15)
    {
      case 3LL:
        uint64_t v10 = 2LL;
        char v9 = 1;
        break;
      case 2LL:
        uint64_t v10 = 2LL;
        char v9 = 0;
        break;
      case 1LL:
        uint64_t v10 = 0LL;
        char v9 = 0;
        break;
    }

    if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterSpatialActive]( v17,  "_splitterSpatialActive"))
    {
      -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _setSpatialAudioModeOnAllHeadsets:]( v17,  "_setSpatialAudioModeOnAllHeadsets:",  v10);
      if (v15 != 1) {
        -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _setHeadTrackingEnabledOnAllHeadsets:]( v17,  "_setHeadTrackingEnabledOnAllHeadsets:",  v9 & 1);
      }
    }

    else
    {
      bluetoothDevice = v17->_bluetoothDevice;
      id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v17, "_currentAppBundleID");
      -[TVSBluetoothDevice setSpatialAudioMode:forBundleID:](bluetoothDevice, "setSpatialAudioMode:forBundleID:", v10);

      if (v15 != 1)
      {
        unsigned int v3 = v17->_bluetoothDevice;
        id v4 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID]( v17,  "_currentAppBundleID");
        -[TVSBluetoothDevice setHeadTrackingEnabled:forBundleID:](v3, "setHeadTrackingEnabled:forBundleID:", v9 & 1);
      }
    }

    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _optimisticallyUpdateSpatialMode:headTrackingEnabled:]( v17,  "_optimisticallyUpdateSpatialMode:headTrackingEnabled:",  v10,  v9 & 1);
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _recordSpatialChangeAnalyticsEventWithMode:headTrackingEnabled:]( v17,  "_recordSpatialChangeAnalyticsEventWithMode:headTrackingEnabled:",  v10,  v9 & 1);
  }

- (void)_didSelectSpatializeStereo
{
  int64_t v15 = self;
  SEL v14 = a2;
  char v13 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialUnavailable](self, "_spatialUnavailable");
  if (v13
    || -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _shouldShowSettingAsDisabled:]( v15,  "_shouldShowSettingAsDisabled:",  4LL))
  {
    id location = (id)qword_5F8F8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v11;
      sub_804C(v10);
      _os_log_impl( &dword_0,  log,  type,  "Ignoring selection in spatialize stereo section because spatial audio is disabled in Settings or Audio Sharing is active",  v10,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

  else if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](v15, "_spatialEnabled"))
  {
    if (v15->_currentSpatialMode == 3)
    {
      uint64_t v9 = 2LL;
      bluetoothDevice = v15->_bluetoothDevice;
      id v6 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v15, "_currentAppBundleID");
      -[TVSBluetoothDevice setSpatialAudioMode:forBundleID:](bluetoothDevice, "setSpatialAudioMode:forBundleID:", 2LL);
    }

    else
    {
      uint64_t v9 = 3LL;
      unsigned int v3 = v15->_bluetoothDevice;
      id v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v15, "_currentAppBundleID");
      -[TVSBluetoothDevice setSpatialAudioMode:forBundleID:](v3, "setSpatialAudioMode:forBundleID:", 3LL);
    }

    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _optimisticallyUpdateSpatialMode:headTrackingEnabled:]( v15,  "_optimisticallyUpdateSpatialMode:headTrackingEnabled:",  v9,  v15->_headTrackingEnabled,  &selRef_selectedMediaDestinationIdentifier);
    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _recordSpatialChangeAnalyticsEventWithMode:headTrackingEnabled:]( v15,  "_recordSpatialChangeAnalyticsEventWithMode:headTrackingEnabled:",  v9,  *((_BYTE *)&v15->super.super.super.super.isa + *(int *)(v2 + 1768)) & 1);
  }

- (void)_didSelectHeadsetListeningModeSetting:(int64_t)a3
{
  int64_t v3 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _listeningModeForSetting:]( self,  "_listeningModeForSetting:",  a3);
  -[TVSBluetoothDevice setListeningMode:](self->_bluetoothDevice, "setListeningMode:", v3);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _optimisticallyUpdateListeningMode:]( self,  "_optimisticallyUpdateListeningMode:",  v3);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _recordListeningModeChangeAnalyticsEventWithMode:]( self,  "_recordListeningModeChangeAnalyticsEventWithMode:",  v3);
}

- (id)_currentAppBundleID
{
  else {
    return self->_foregroundAppBundleID;
  }
}

- (BOOL)_currentAppSupportsSpatial
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = &off_53468;
  id v3 = v6[0];
  id v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v7, "_currentAppBundleID");
  unsigned int v5 = objc_msgSend(v3, "containsObject:") ^ 1;

  objc_storeStrong(v6, 0LL);
  return v5 & 1;
}

- (BOOL)_deviceSupportsSpatial
{
  return MGGetProductType(self, a2) != 1110205732;
}

- (id)_resolvedAudioFormat
{
  unsigned __int8 v21 = self;
  v20[1] = (id)a2;
  SEL v16 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
  v20[0] =  -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  @"SpatialStereoAudioFormat",  &stru_51218,  0LL);

  char v19 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _spatialEnabled](v21, "_spatialEnabled");
  id v17 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( v21->_audioFormatController,  "audioFormatContentInfo");
  id v18 = (char *)[v17 bestAvailableAudioFormat];

  if (v18)
  {
    if (v18 == (_BYTE *)&dword_0 + 1)
    {
      if ((v19 & 1) != 0)
      {
        int64_t v15 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
        uint64_t v2 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"SpatialMultichannelAudioFormat",  &stru_51218,  0LL);
        id v3 = v20[0];
        v20[0] = v2;
      }

      else
      {
        SEL v14 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
        id v4 =  -[NSBundle localizedStringForKey:value:table:]( v14,  "localizedStringForKey:value:table:",  @"SpatialMultichannelAvailableFormat",  &stru_51218,  0LL);
        id v5 = v20[0];
        v20[0] = v4;
      }
    }

    else if (v18 == (_BYTE *)&dword_0 + 2)
    {
      if ((v19 & 1) != 0)
      {
        char v13 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
        id v6 =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"SpatialDolbyAtmosAudioFormat",  &stru_51218,  0LL);
        id v7 = v20[0];
        v20[0] = v6;
      }

      else
      {
        os_log_type_t v12 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
        char v8 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"SpatialDolbyAtmosAvailableFormat",  &stru_51218,  0LL);
        id v9 = v20[0];
        v20[0] = v8;
      }
    }
  }

  id v11 = v20[0];
  objc_storeStrong(v20, 0LL);
  return v11;
}

- (id)_resolvedDetailText
{
  id v27 = self;
  location[1] = (id)a2;
  id v15 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](self, "_currentAppBundleID");
  id v14 =  +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:");
  location[0] = [v14 localizedName];

  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  if (+[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState")
    || (id v25 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](v27, "routeConnection"),
        char v24 = 1,
        (char *)-[TVNPEndpointRouteConnection playbackState](v25, "playbackState") == (char *)&dword_0 + 2)
    || (id v23 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](v27, "routeConnection"),
        char v22 = 1,
        unsigned __int8 v13 = 0,
        (int *)-[TVNPEndpointRouteConnection playbackState](v23, "playbackState") == &dword_4))
  {
    id v21 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v27, "_currentAppBundleID");
    char v20 = 1;
    char v19 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController routeConnection](v27, "routeConnection");
    char v18 = 1;
    id v17 = -[TVNPEndpointRouteConnection bundleID](v19, "bundleID");
    char v16 = 1;
    unsigned __int8 v13 = objc_msgSend(v21, "isEqualToString:");
  }

  if ((v16 & 1) != 0) {

  }
  if ((v18 & 1) != 0) {
  if ((v20 & 1) != 0)
  }

  if ((v22 & 1) != 0) {
  if ((v24 & 1) != 0)
  }

  if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _splitterPreventingSpatial]( v27,  "_splitterPreventingSpatial"))
  {
    os_log_type_t v12 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v28 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"SpatialAudioDisabledTextSplitterActive",  &stru_51218,  0LL);
  }

  else if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController isContentEligibleForSpatialization]( v27,  "isContentEligibleForSpatialization") {
         || !-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppCanBeIneligibleForSpatialization]( v27,  "_currentAppCanBeIneligibleForSpatialization"))
  }
  {
    if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController isSpatialEnabledGlobally]( v27,  "isSpatialEnabledGlobally"))
    {
      id v9 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController audioFormat](v27, "audioFormat");
      char v10 = 0;
      if (-[NSString length](v9, "length")) {
        char v10 = v13 & 1;
      }

      if ((v10 & 1) != 0)
      {
        if (-[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _dolbyAtmosActive](v27, "_dolbyAtmosActive"))
        {
          char v8 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
          id v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"SpatialAppAudioFormatAtmosDetailString",  &stru_51218,  0LL);
          id v28 =  +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  location[0]);
        }

        else
        {
          id v6 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
          id v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"SpatialAppAudioFormatDetailString",  &stru_51218,  0LL);
          id v4 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _resolvedAudioFormat]( v27,  "_resolvedAudioFormat");
          id v28 =  +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  location[0],  v4);
        }
      }

      else
      {
        id v28 = (NSString *)location[0];
      }
    }

    else
    {
      id v3 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
      id v28 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"SpatialAudioDisabledSettings",  &stru_51218,  0LL);
    }
  }

  else
  {
    id v11 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v28 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"SpatialAudioNotAvailable",  &stru_51218,  0LL);
  }

  objc_storeStrong(location, 0LL);
  return v28;
}

- (BOOL)_allHeadsetsSupportSpatialWhileSharing
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController headsetRoutes](self, "headsetRoutes");
  uint64_t v10 = 0LL;
  id v11 = &v10;
  int v12 = 0x20000000;
  int v13 = 32;
  char v14 = 1;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_228B8;
  char v8 = &unk_50E68;
  id v9 = &v10;
  [location[0] enumerateObjectsUsingBlock:&v4];
  char v3 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

- (void)_setSpatialAudioModeOnAllHeadsets:(int64_t)a3
{
  id v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController headsetRoutes](v17, "headsetRoutes");
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v8);
      id v12 = [v14 bluetoothDevice];
      id v4 = v12;
      int64_t v3 = v15;
      id v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v17, "_currentAppBundleID");
      objc_msgSend(v4, "setSpatialAudioMode:forBundleID:", v3);

      objc_storeStrong(&v12, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }
}

- (void)_setHeadTrackingEnabledOnAllHeadsets:(BOOL)a3
{
  id v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController headsetRoutes](v17, "headsetRoutes");
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v8);
      id v12 = [v14 bluetoothDevice];
      id v4 = v12;
      BOOL v3 = v15;
      id v5 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController _currentAppBundleID](v17, "_currentAppBundleID");
      objc_msgSend(v4, "setHeadTrackingEnabled:forBundleID:", v3);

      objc_storeStrong(&v12, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }
}

- (void)_recordSpatialChangeAnalyticsEventWithMode:(int64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  uint64_t v10 = (void *)a3;
  id v3 = (id)TVSMAnalyticsEventWithName(@"spatial_mode.changed");
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_22E44;
  uint64_t v8 = &unk_50E90;
  v9[0] = v12;
  v9[1] = v10;
  AnalyticsSendEventLazy(v3);

  objc_storeStrong(v9, 0LL);
}

- (void)_recordSpatialChangeAnalyticsEventWithMode:(int64_t)a3 headTrackingEnabled:(BOOL)a4
{
  BOOL v15 = self;
  SEL v14 = a2;
  int v13 = (void *)a3;
  BOOL v12 = a4;
  id v4 = (id)TVSMAnalyticsEventWithName(@"spatial_mode.changed");
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = sub_22F4C;
  id v9 = &unk_50EB8;
  v10[0] = v15;
  v10[1] = v13;
  BOOL v11 = v12;
  AnalyticsSendEventLazy(v4);

  objc_storeStrong(v10, 0LL);
}

- (void)_recordListeningModeChangeAnalyticsEventWithMode:(int64_t)a3
{
  BOOL v12 = self;
  SEL v11 = a2;
  uint64_t v10 = (void *)a3;
  id v3 = (id)TVSMAnalyticsEventWithName(@"listening_mode.changed");
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_231B4;
  uint64_t v8 = &unk_50E90;
  v9[0] = v12;
  v9[1] = v10;
  AnalyticsSendEventLazy(v3);

  objc_storeStrong(v9, 0LL);
}

- (id)_analyticsDictionaryWithMode:(int64_t)a3
{
  v9[0] = @"mode";
  int v6 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  v10[0] = v6;
  v9[1] = @"headset";
  id v7 = -[TVNPOutputDeviceRoute deviceTypeDescription](self->_currentRoute, "deviceTypeDescription");
  v10[1] = v7;
  id v9[2] = @"app";
  if (self->_nowPlayingApp) {
    nowPlayingApp = (const __CFString *)self->_nowPlayingApp;
  }
  else {
    nowPlayingApp = @"unavailable";
  }
  id v10[2] = nowPlayingApp;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL);

  return v4;
}

- (id)_descriptionForSpatialMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  return v4;
}

- (id)_descriptionForListeningMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  return v4;
}

- (id)_headsetSettingsLayout
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v4 = objc_alloc(&OBJC_CLASS___UICollectionViewCompositionalLayout);
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = sub_23748;
  id v9 = &unk_50EE0;
  objc_copyWeak(v10, location);
  SEL v11 = -[UICollectionViewCompositionalLayout initWithSectionProvider:](v4, "initWithSectionProvider:", &v5);
  id v3 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  return v3;
}

- (NSArray)headsetRoutes
{
  return self->_headsetRoutes;
}

- (void)setHeadsetRoutes:(id)a3
{
}

- (TVNPOutputDeviceRoute)currentRoute
{
  return self->_currentRoute;
}

- (BOOL)isSharingAudio
{
  return self->_isSharingAudio;
}

- (void)setIsSharingAudio:(BOOL)a3
{
  self->_isSharingAudio = a3;
}

- (int64_t)focusedSetting
{
  return self->_focusedSetting;
}

- (void)setFocusedSetting:(int64_t)a3
{
  self->_focusedSetting = a3;
}

- (BOOL)spatialAudioFocused
{
  return self->_spatialAudioFocused;
}

- (void)setSpatialAudioFocused:(BOOL)a3
{
  self->_spatialAudioFocused = a3;
}

- (NSString)foregroundAppBundleID
{
  return self->_foregroundAppBundleID;
}

- (void)setForegroundAppBundleID:(id)a3
{
}

- (UICollectionViewDiffableDataSource)settingsDataSource
{
  return self->_settingsDataSource;
}

- (void)setSettingsDataSource:(id)a3
{
}

- (NSMutableDictionary)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (int64_t)currentListeningMode
{
  return self->_currentListeningMode;
}

- (void)setCurrentListeningMode:(int64_t)a3
{
  self->_currentListeningMode = a3;
}

- (int64_t)currentSpatialMode
{
  return self->_currentSpatialMode;
}

- (void)setCurrentSpatialMode:(int64_t)a3
{
  self->_currentSpatialMode = a3;
}

- (BOOL)headTrackingEnabled
{
  return self->_headTrackingEnabled;
}

- (void)setHeadTrackingEnabled:(BOOL)a3
{
  self->_headTrackingEnabled = a3;
}

- (NSString)nowPlayingApp
{
  return self->_nowPlayingApp;
}

- (void)setNowPlayingApp:(id)a3
{
}

- (NSString)nowPlayingBundleID
{
  return self->_nowPlayingBundleID;
}

- (void)setNowPlayingBundleID:(id)a3
{
}

- (NSString)audioFormat
{
  return self->_audioFormat;
}

- (void)setAudioFormat:(id)a3
{
}

- (BOOL)isSpatialEnabledGlobally
{
  return self->_isSpatialEnabledGlobally;
}

- (void)setIsSpatialEnabledGlobally:(BOOL)a3
{
  self->_isSpatialEnabledGlobally = a3;
}

- (BOOL)isContentEligibleForSpatialization
{
  return self->_isContentEligibleForSpatialization;
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
}

- (TVSMCAPackageView)spatialWhitePackageView
{
  return self->_spatialWhitePackageView;
}

- (void)setSpatialWhitePackageView:(id)a3
{
}

- (TVSMCAPackageView)spatialBlackPackageView
{
  return self->_spatialBlackPackageView;
}

- (void)setSpatialBlackPackageView:(id)a3
{
}

- (BOOL)isMusicApp
{
  return self->_isMusicApp;
}

- (void)setIsMusicApp:(BOOL)a3
{
  self->_isMusicApp = a3;
}

- (int64_t)bestAvailableFormat
{
  return self->_bestAvailableFormat;
}

- (void)setBestAvailableFormat:(int64_t)a3
{
  self->_bestAvailableFormat = a3;
}

- (TVSBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (NSTimer)spatialModeChangedTimer
{
  return self->_spatialModeChangedTimer;
}

- (void)setSpatialModeChangedTimer:(id)a3
{
}

- (NSTimer)listeningModeChangedTimer
{
  return self->_listeningModeChangedTimer;
}

- (void)setListeningModeChangedTimer:(id)a3
{
}

- (TVCSSpatialTutorialStateObserver)tutorialStateObserver
{
  return self->_tutorialStateObserver;
}

- (void)setTutorialStateObserver:(id)a3
{
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (void)setFocusedIndexPath:(id)a3
{
}

- (TVNPEndpointRouteConnection)routeConnection
{
  return self->_routeConnection;
}

- (NSCopying)metadataObserverToken
{
  return self->_metadataObserverToken;
}

- (void).cxx_destruct
{
}

@end