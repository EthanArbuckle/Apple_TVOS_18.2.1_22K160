@interface TVSettingsScreenSaverFacade
+ (id)keyPathsForValuesAffectingScreenSaverName;
+ (id)sharedInstance;
- (BOOL)allowsScreenSaverOverMusic;
- (BOOL)defaultUserSignedIn;
- (BOOL)hasPhotosCompletedInitialSync;
- (BOOL)isConferenceRoomDisplayEnabled;
- (BOOL)isPhotosSourceStateOn;
- (BOOL)myPhotosScreenSaverOptionShouldBeEnabled;
- (BOOL)myPhotosScreenSaverSelected;
- (BOOL)photosSourceHasMemories;
- (BOOL)primaryUseriCloudPhotoLibraryEnabled;
- (BOOL)primaryUseriCloudSharedPhotosEnabled;
- (BOOL)useIdleScreen;
- (NSArray)availableActivationDelays;
- (NSArray)availableIdleScreenRefreshIntervals;
- (NSArray)availablePhotoCollectionGroups;
- (NSArray)availablePhotoCollections;
- (NSArray)availableTimesPerSlide;
- (NSArray)iCloudPhotosAvailablePhotoCollectionGroups;
- (NSArray)idleScreenThemes;
- (NSArray)otherAvailablePhotoCollectionGroups;
- (NSArray)photosLibraryFilters;
- (NSString)conferenceRoomDisplayMessage;
- (NSString)photosSourceStateString;
- (NSString)screenSaverName;
- (NSString)screenSaverPhotoCollectionIdentifier;
- (NSString)screenSaverStyle;
- (NSString)selectedIdleScreenRefreshInterval;
- (NSString)selectedLibraryFilterName;
- (NSString)transitionType;
- (NSURL)conferenceRoomDisplayBackgroundPhotoURL;
- (OS_dispatch_queue)serialQueue;
- (PXCPLUIStatusProvider)statusProvider;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (TVISScreenSaverServiceController)serviceController;
- (TVPhotoCollection)selectedPhotoCollection;
- (TVPhotoCollectionGroup)selectedPhotoCollectionGroup;
- (TVSettingsScreenSaverFacade)init;
- (TVSettingsScreenSaverToggleViewModel)photosSourceFilter;
- (TVSettingsUserProfileFacade)userProfileFacade;
- (TVSettingsUserProfileListFacade)userProfileListFacade;
- (id)_iCloudPhotosScreenSaverIdentifier;
- (id)_memoryScreenSaverIdentifier;
- (id)_modelFromSettingsOption:(id)a3;
- (id)screenSaverType;
- (int64_t)activationDelay;
- (int64_t)idleScreenSaverType;
- (int64_t)timePerSlide;
- (void)_addUserProfileFacadeObservers;
- (void)_createCustomPhotoCollectionGroups;
- (void)_fetchPhotoCollections;
- (void)_invalidatePhotoCollections;
- (void)_openApplicationWithIdentifer:(id)a3;
- (void)_recalculatePhotoCollections;
- (void)_removeUserProfileFacadeObservers;
- (void)_updateActiveThemes;
- (void)_updateCPLStatus;
- (void)_updatePhotosSourceHasMemories;
- (void)_updateUserPhotoCollections;
- (void)dealloc;
- (void)disableScreenSaverProviders;
- (void)killPhotoSourcesDaemon;
- (void)launchPhotoSourcesDaemon;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prefetchScreensaverCollections;
- (void)screenSaverService:(id)a3 didUpdateActiveScreenSaver:(id)a4;
- (void)setActivationDelay:(int64_t)a3;
- (void)setAllowsScreenSaverOverMusic:(BOOL)a3;
- (void)setAuthenticationNeededToChangeiCloudPhotoOptions;
- (void)setConferenceRoomDisplayBackgroundPhotoURL:(id)a3;
- (void)setConferenceRoomDisplayEnabled:(BOOL)a3;
- (void)setConferenceRoomDisplayMessage:(id)a3;
- (void)setHasPhotosCompletedInitialSync:(BOOL)a3;
- (void)setIdleScreenLibraryFilterTypeToActiveStateWithIdentifier:(id)a3;
- (void)setIdleScreenSaverType:(int64_t)a3;
- (void)setIdleScreenThemeWithViewModel:(id)a3 toActiveState:(BOOL)a4;
- (void)setIsPhotosSourceStateOn:(BOOL)a3;
- (void)setPhotosSourceHasMemories:(BOOL)a3;
- (void)setScreenSaverStyle:(id)a3;
- (void)setSelectedIdleScreenRefreshInterval:(id)a3;
- (void)setSelectedLibraryFilterName:(id)a3;
- (void)setSelectedPhotoCollection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setStatusProvider:(id)a3;
- (void)setTimePerSlide:(int64_t)a3;
- (void)setTransitionType:(id)a3;
- (void)setUseIdleScreen:(BOOL)a3;
- (void)setiCloudPhotoLibraryEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5;
- (void)setiCloudSharedPhotosEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5;
@end

@implementation TVSettingsScreenSaverFacade

+ (id)sharedInstance
{
  if (qword_1001E1A40 != -1) {
    dispatch_once(&qword_1001E1A40, &stru_100193070);
  }
  return (id)qword_1001E1A30;
}

- (TVSettingsScreenSaverFacade)init
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverFacade;
  v2 = -[TVSettingsScreenSaverFacade init](&v47, "init");
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A47B4;
    block[3] = &unk_10018E440;
    v4 = v2;
    v46 = v4;
    if (qword_1001E1A48 != -1) {
      dispatch_once(&qword_1001E1A48, block);
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedScreenSaverPreferences](&OBJC_CLASS___TVSPreferences, "sharedScreenSaverPreferences"));
    id v6 = v4[3];
    v4[3] = (id)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4[3] domain]);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000A48DC;
    v43[3] = &unk_10018E440;
    v8 = v4;
    v44 = v8;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v7,  v43));
    id v10 = v8[5];
    v8[5] = (id)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v12 = v8[10];
    v8[10] = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v14 = v8[11];
    v8[11] = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.TVSettings.TVSettingsScreenSaverFacade.serialQueue", 0LL);
    id v16 = v8[22];
    v8[22] = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
    id v18 = v8[23];
    v8[23] = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8[23] primaryUser]);
    if (v19)
    {
      v20 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v19);
      id v21 = v8[24];
      v8[24] = v20;

      [v8 _addUserProfileFacadeObservers];
    }

    objc_initWeak(&location, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472LL;
    v39 = sub_1000A48E4;
    v40 = &unk_100193098;
    objc_copyWeak(&v41, &location);
    uint64_t v24 = objc_claimAutoreleasedReturnValue( [v22 addObserverForName:UIApplicationDidBecomeActiveNotification object:0 queue:v23 usingBlock:&v37]);
    id v25 = v8[7];
    v8[7] = (id)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVPhotoSourceManager defaultManager]( &OBJC_CLASS___TVPhotoSourceManager,  "defaultManager",  v37,  v38,  v39,  v40));
    [v26 setupPhotoSources];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TVPhotoSourceManager defaultManager](&OBJC_CLASS___TVPhotoSourceManager, "defaultManager"));
    [v27 addObserver:v8 selector:"_photoSourcesUpdated:" name:TVPhotoSourceManagerSourcesUpdatedNotification object:v28];

    [v8 prefetchScreensaverCollections];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
    v30 = -[PXStoryMemoryFeedDataSourceManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___PXStoryMemoryFeedDataSourceManager),  "initWithPhotoLibrary:",  v29);
    id v31 = v8[9];
    v8[9] = v30;

    [v8[9] registerChangeObserver:v8 context:off_1001E0200];
    *((_BYTE *)v8 + 96) = [v8[9] hasAnyMemories];
    v32 = -[PXCPLUIStatusProvider initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___PXCPLUIStatusProvider),  "initWithPhotoLibrary:",  v29);
    id v33 = v8[25];
    v8[25] = v32;

    [v8[25] registerChangeObserver:v8 context:off_1001E0208];
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v29));
    id v35 = v8[26];
    v8[26] = (id)v34;

    [v8[26] registerChangeObserver:v8 context:off_1001E0210];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)_addUserProfileFacadeObservers
{
  userProfileFacade = self->_userProfileFacade;
  if (userProfileFacade)
  {
    -[TVSettingsUserProfileFacade addObserver:forKeyPath:options:context:]( userProfileFacade,  "addObserver:forKeyPath:options:context:",  self,  @"iCloudPhotoLibraryEnabled",  0LL,  off_1001E0218);
    -[TVSettingsUserProfileFacade addObserver:forKeyPath:options:context:]( self->_userProfileFacade,  "addObserver:forKeyPath:options:context:",  self,  @"iCloudSharedPhotosEnabled",  0LL,  off_1001E0220);
  }

- (void)_removeUserProfileFacadeObservers
{
  userProfileFacade = self->_userProfileFacade;
  if (userProfileFacade)
  {
    -[TVSettingsUserProfileFacade removeObserver:forKeyPath:context:]( userProfileFacade,  "removeObserver:forKeyPath:context:",  self,  @"iCloudPhotoLibraryEnabled",  off_1001E0218);
    -[TVSettingsUserProfileFacade removeObserver:forKeyPath:context:]( self->_userProfileFacade,  "removeObserver:forKeyPath:context:",  self,  @"iCloudSharedPhotosEnabled",  off_1001E0220);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self->_didBecomeActiveObserver];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  -[TVISScreenSaverServiceController removeObserver:](self->_serviceController, "removeObserver:", self);
  -[TVSettingsScreenSaverFacade _removeUserProfileFacadeObservers](self, "_removeUserProfileFacadeObservers");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverFacade;
  -[TVSettingsScreenSaverFacade dealloc](&v5, "dealloc");
}

- (void)prefetchScreensaverCollections
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A4B04;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)keyPathsForValuesAffectingScreenSaverName
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"selectedPhotoCollection", 0LL);
}

- (NSArray)availableActivationDelays
{
  v5[0] = &off_1001AD680;
  v5[1] = &off_1001AD698;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVScreenSaverDefaultActivationDelay));
  v5[2] = v2;
  v5[3] = &off_1001AD6B0;
  v5[4] = &off_1001AD6C8;
  v5[5] = &off_1001AD6E0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 6LL));

  return (NSArray *)v3;
}

- (int64_t)activationDelay
{
  uint64_t v2 = (uint64_t)-[TVSPreferences activationDelay](self->_screenSaverAppPrefs, "activationDelay");
  return v2 & ~(v2 >> 63);
}

- (void)setActivationDelay:(int64_t)a3
{
}

- (BOOL)allowsScreenSaverOverMusic
{
  return -[TVSPreferences allowsScreenSaverOverMusic]( self->_screenSaverAppPrefs,  "allowsScreenSaverOverMusic");
}

- (void)setAllowsScreenSaverOverMusic:(BOOL)a3
{
}

- (NSArray)availablePhotoCollections
{
  availablePhotoCollections = self->_availablePhotoCollections;
  if (!availablePhotoCollections)
  {
    if (self->_isFetchingCollections)
    {
      availablePhotoCollections = 0LL;
    }

    else
    {
      -[TVSettingsScreenSaverFacade _fetchPhotoCollections](self, "_fetchPhotoCollections");
      availablePhotoCollections = self->_availablePhotoCollections;
    }
  }

  return availablePhotoCollections;
}

- (TVPhotoCollection)selectedPhotoCollection
{
  if (!self->_selectedPhotoCollection && !self->_isFetchingCollections) {
    -[TVSettingsScreenSaverFacade _fetchPhotoCollections](self, "_fetchPhotoCollections");
  }
  if (-[TVSettingsScreenSaverFacade useIdleScreen](self, "useIdleScreen")) {
    selectedPhotoCollection = 0LL;
  }
  else {
    selectedPhotoCollection = self->_selectedPhotoCollection;
  }
  return selectedPhotoCollection;
}

- (void)setSelectedPhotoCollection:(id)a3
{
  id v18 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v18 providerInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:PBScreensaverProvidesSettingsUI]);
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v18 providerInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:PBScreensaverSettingsURLScheme]);

    if ([v9 length])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@://open", v9));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
      [v10 openURL:v12 withCompletionHandler:0];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 collectionIdentifier]);
      -[TVSettingsScreenSaverFacade _openApplicationWithIdentifer:](self, "_openApplicationWithIdentifer:", v10);
    }
  }

  else
  {
    if (-[TVSettingsScreenSaverFacade useIdleScreen](self, "useIdleScreen")) {
      -[TVSettingsScreenSaverFacade setScreenSaverStyle:](self, "setScreenSaverStyle:", TVScreenSaverStyleRandom);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v18 providerInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:PBScreensaverStyle]);

    objc_storeStrong((id *)&self->_selectedPhotoCollection, a3);
    screenSaverAppPrefs = self->_screenSaverAppPrefs;
    dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue([v18 photoSource]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sourceIdentifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v18 collectionIdentifier]);
    -[TVSPreferences setScreenSaverWithPhotoSource:collection:name:style:userInfo:]( screenSaverAppPrefs,  "setScreenSaverWithPhotoSource:collection:name:style:userInfo:",  v16,  v17,  0LL,  v9,  0LL);

    -[TVSPreferences synchronize](self->_screenSaverAppPrefs, "synchronize");
  }
}

- (TVPhotoCollectionGroup)selectedPhotoCollectionGroup
{
  if (!-[TVSettingsScreenSaverFacade useIdleScreen](self, "useIdleScreen"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection"));
    if (v3)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverFacade availablePhotoCollectionGroups]( self,  "availablePhotoCollectionGroups",  0LL));
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v17;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 photoCollections]);
            unsigned __int8 v11 = [v10 containsObject:v3];

            if ((v11 & 1) != 0)
            {
              id v14 = v9;

              return (TVPhotoCollectionGroup *)v14;
            }
          }

          id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }

  int64_t v12 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
  if (v12 == TVISScreenSaverTypeMemory) {
    v13 = (void *)qword_1001E22F8;
  }
  else {
    v13 = (void *)qword_1001E22F0;
  }
  id v14 = v13;
  return (TVPhotoCollectionGroup *)v14;
}

- (void)_recalculatePhotoCollections
{
  if (!self->_availablePhotoCollectionGroups)
  {
    v53 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    v46 = self;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade availablePhotoCollections](self, "availablePhotoCollections"));
    id v4 = [v3 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v63 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 photoSource]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sourceIdentifier]);

          if ([v10 isEqualToString:TVPhotoSourceAppProviderIdentifier])
          {
            uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 collectionIdentifier]);

            id v10 = (void *)v11;
          }

          int64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v53, "objectForKey:", v10));
          if (!v12)
          {
            int64_t v12 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  1LL);
            -[NSMutableDictionary setObject:forKey:](v53, "setObject:forKey:", v12, v10);
          }

          -[NSMutableArray addObject:](v12, "addObject:", v8);
        }

        id v5 = [v3 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }

      while (v5);
    }

    v52 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v53, "allKeys"));
    id v14 = [v13 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)j);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v53, "objectForKey:", v18));
          if ([v19 count])
          {
            v20 = -[TVPhotoCollectionGroup initWithPhotoCollections:]( objc_alloc(&OBJC_CLASS___TVPhotoCollectionGroup),  "initWithPhotoCollections:",  v19);
            -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v20, v18);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }

      while (v15);
    }

    id v21 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableDictionary count](v52, "count"));
    -[NSMutableArray addObject:](v21, "addObject:", qword_1001E22F0);
    -[NSMutableArray addObject:](v21, "addObject:", qword_1001E2300);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](v46->_userProfileListFacade, "primaryUser"));
    if (!v22) {
      goto LABEL_27;
    }
    userProfileFacade = v46->_userProfileFacade;
    if (!userProfileFacade)
    {
      uint64_t v24 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v22);
      id v25 = v46->_userProfileFacade;
      v46->_userProfileFacade = v24;

      -[TVSettingsScreenSaverFacade _addUserProfileFacadeObservers](v46, "_addUserProfileFacadeObservers");
      userProfileFacade = v46->_userProfileFacade;
    }

    if (-[TVSettingsUserProfileFacade memoriesContentEnabled](userProfileFacade, "memoriesContentEnabled")
      || !-[TVSettingsUserProfileFacade iCloudPhotoLibraryEnabled](v46->_userProfileFacade, "iCloudPhotoLibraryEnabled"))
    {
LABEL_27:
      -[NSMutableArray addObject:](v21, "addObject:", qword_1001E22F8);
    }

    v45 = (void *)v22;
    v26 = v52;
    v27 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableDictionary count](v52, "count"));
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v52, "allKeys"));
    id v28 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v55;
      uint64_t v47 = TVScreenSaverEnabledKey;
      v48 = v21;
      v50 = v27;
      do
      {
        for (k = 0LL; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v55 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)k);
          id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v26, "objectForKey:", v32));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 photoCollectionGroupIdentifier]);
          unsigned int v35 = [v34 isEqualToString:@"com.apple.TVPhotos"];

          if (v35)
          {
            -[NSMutableArray addObject:](v21, "addObject:", v33);
          }

          else
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue([v33 photoCollectionGroupProviderInfo]);
            v37 = v36;
            if (v36
              && (objc_msgSend(v36, "tvs_BOOLForKey:defaultValue:", PBScreensaverShowInSettings, 1) & 1) == 0)
            {
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v33 photoCollectionGroupIdentifier]);
              if ([v38 length])
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue([v49 getScreenSaverDisplayStatusForBundleIdentifier:v38]);
                if ([v39 count]
                  && (v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:v47]),
                      unsigned int v41 = [v40 BOOLValue],
                      v40,
                      v26 = v52,
                      v41))
                {
                  -[NSMutableArray addObject:](v50, "addObject:", v33);
                }

                else
                {
                  -[NSMutableDictionary removeObjectForKey:](v26, "removeObjectForKey:", v32);
                }

                id v21 = v48;
                v27 = v50;
              }

              else
              {
                -[NSMutableArray addObject:](v27, "addObject:", v33);
              }
            }

            else
            {
              -[NSMutableArray addObject:](v27, "addObject:", v33);
            }
          }
        }

        id v29 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      }

      while (v29);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v27, "sortedArrayUsingComparator:", &stru_1001930D8));
    -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", v42);
    -[TVSettingsScreenSaverFacade willChangeValueForKey:]( v46,  "willChangeValueForKey:",  @"availablePhotoCollectionGroups");
    v43 = (NSArray *)-[NSMutableArray copy](v21, "copy");
    availablePhotoCollectionGroups = v46->_availablePhotoCollectionGroups;
    v46->_availablePhotoCollectionGroups = v43;

    -[TVSettingsScreenSaverFacade _createCustomPhotoCollectionGroups](v46, "_createCustomPhotoCollectionGroups");
    -[TVSettingsScreenSaverFacade didChangeValueForKey:]( v46,  "didChangeValueForKey:",  @"availablePhotoCollectionGroups");
  }

- (void)_createCustomPhotoCollectionGroups
{
  v22[0] = @"com.apple.TVPhotos";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade _memoryScreenSaverIdentifier](self, "_memoryScreenSaverIdentifier"));
  v22[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  availablePhotoCollectionGroups = self->_availablePhotoCollectionGroups;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int128 v17 = sub_1000A59D8;
  uint64_t v18 = &unk_100193100;
  id v19 = v4;
  v20 = v5;
  id v21 = v6;
  v8 = v6;
  uint64_t v9 = v5;
  id v10 = v4;
  -[NSArray enumerateObjectsUsingBlock:](availablePhotoCollectionGroups, "enumerateObjectsUsingBlock:", &v15);
  -[TVSettingsScreenSaverFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"iCloudPhotosAvailablePhotoCollectionGroups",  v15,  v16,  v17,  v18);
  -[TVSettingsScreenSaverFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"otherAvailablePhotoCollectionGroups");
  uint64_t v11 = (NSArray *)-[NSMutableArray copy](v9, "copy");
  iCloudPhotosAvailablePhotoCollectionGroups = self->_iCloudPhotosAvailablePhotoCollectionGroups;
  self->_iCloudPhotosAvailablePhotoCollectionGroups = v11;

  v13 = (NSArray *)-[NSMutableArray copy](v8, "copy");
  otherAvailablePhotoCollectionGroups = self->_otherAvailablePhotoCollectionGroups;
  self->_otherAvailablePhotoCollectionGroups = v13;

  -[TVSettingsScreenSaverFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iCloudPhotosAvailablePhotoCollectionGroups");
  -[TVSettingsScreenSaverFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"otherAvailablePhotoCollectionGroups");
}

- (id)screenSaverType
{
  int64_t v3 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
  if (v3 == TVISScreenSaverTypeAerial)
  {
    id v4 = (void *)qword_1001E22F0;
  }

  else
  {
    int64_t v5 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
    if (v5 != TVISScreenSaverTypeMemory)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection"));
      return v6;
    }

    id v4 = (void *)qword_1001E22F8;
  }

  id v6 = v4;
  return v6;
}

- (NSString)screenSaverPhotoCollectionIdentifier
{
  return (NSString *)-[TVSPreferences screenSaverPhotoCollectionIdentifier]( self->_screenSaverAppPrefs,  "screenSaverPhotoCollectionIdentifier");
}

- (NSString)screenSaverStyle
{
  int64_t v3 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
  if (v3 == TVISScreenSaverTypeMemory)
  {
    id v4 = @"Memory";
  }

  else
  {
    int64_t v5 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
    if (v5 == TVISScreenSaverTypeAerial) {
      id v4 = @"Flyovers";
    }
    else {
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVSPreferences screenSaverStyle](self->_screenSaverAppPrefs, "screenSaverStyle"));
    }
  }

  return (NSString *)v4;
}

- (void)setScreenSaverStyle:(id)a3
{
}

- (int64_t)idleScreenSaverType
{
  unsigned int v3 = -[TVSettingsScreenSaverFacade useIdleScreen](self, "useIdleScreen");
  p_idleScreenSaverType = (int64_t *)&TVISScreenSaverTypePhotoCollection;
  if (v3 && self->_serviceController) {
    p_idleScreenSaverType = &self->_idleScreenSaverType;
  }
  return *p_idleScreenSaverType;
}

- (void)setIdleScreenSaverType:(int64_t)a3
{
  if (TVISScreenSaverTypeAerial == a3 || TVISScreenSaverTypeMemory == a3)
  {
    -[TVSettingsScreenSaverFacade setUseIdleScreen:](self, "setUseIdleScreen:", 1LL);
    -[TVSPreferences setScreenSaverWithPhotoSource:collection:name:style:userInfo:]( self->_screenSaverAppPrefs,  "setScreenSaverWithPhotoSource:collection:name:style:userInfo:",  0LL,  0LL,  0LL,  0LL,  0LL);
    objc_initWeak(&location, self);
    serviceController = self->_serviceController;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000A5E70;
    v8[3] = &unk_100193128;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a3;
    -[TVISScreenSaverServiceController activateScreenSaverType:completion:]( serviceController,  "activateScreenSaverType:completion:",  a3,  v8);
    SFKillProcessNamed(@"IdleScreen", v7);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

  else
  {
    self->_idleScreenSaverType = a3;
    -[TVSettingsScreenSaverFacade setUseIdleScreen:](self, "setUseIdleScreen:", 0LL);
  }

- (NSString)screenSaverName
{
  if (!-[TVSettingsScreenSaverFacade useIdleScreen](self, "useIdleScreen"))
  {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 providerInfo]);

    if (v7
      && (objc_msgSend(v7, "tvs_BOOLForKey:defaultValue:", PBScreensaverShowInSettings, 1) & 1) == 0
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection")),
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionIdentifier]),
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 screenSaverPhotoCollectionIdentifier]),
          unsigned int v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          v8,
          v11))
    {
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 screenSaverName]);
      if ([v12 length])
      {
LABEL_11:

        return (NSString *)v12;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 collectionName]);

      int64_t v12 = (void *)v14;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollection](self, "selectedPhotoCollection"));
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionName]);
    }

    goto LABEL_11;
  }

  int64_t v3 = -[TVSettingsScreenSaverFacade idleScreenSaverType](self, "idleScreenSaverType");
  if (v3 == TVISScreenSaverTypeMemory) {
    id v4 = @"SaverBackdropMemoryTitle";
  }
  else {
    id v4 = @"SaverBackdropAerialTitle";
  }
  uint64_t v15 = TSKLocString(v4);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
  return (NSString *)v12;
}

- (NSArray)availableTimesPerSlide
{
  return (NSArray *)&off_1001AF118;
}

- (int64_t)timePerSlide
{
  return (int)-[TVSPreferences integerForKey:defaultValue:]( self->_screenSaverAppPrefs,  "integerForKey:defaultValue:",  TVScreenSaverTimePerSlideKey,  TVScreenSaverDefaultTimePerSlide);
}

- (void)setTimePerSlide:(int64_t)a3
{
}

- (NSString)transitionType
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPreferences stringForKey:]( self->_screenSaverAppPrefs,  "stringForKey:",  TVScreenSaverTransitionStyleKey));
  int64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)TVScreenSaverTransitionStyleDissolve;
  }
  id v4 = v2;

  return v4;
}

- (void)setTransitionType:(id)a3
{
}

- (NSString)conferenceRoomDisplayMessage
{
  return (NSString *)-[TVSPreferences stringForKey:]( self->_screenSaverAppPrefs,  "stringForKey:",  TVScreenSaverConferenceRoomMessageKey);
}

- (void)setConferenceRoomDisplayMessage:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = v5;
  }

  else
  {

    id v4 = 0LL;
  }

  id v6 = v4;
  -[TVSPreferences setObject:forKey:]( self->_screenSaverAppPrefs,  "setObject:forKey:",  v4,  TVScreenSaverConferenceRoomMessageKey);
}

- (void)setConferenceRoomDisplayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = TVScreenSaverConferenceRoomTypeKey;
  -[TVSPreferences setInteger:forKey:]( self->_screenSaverAppPrefs,  "setInteger:forKey:",  a3,  TVScreenSaverConferenceRoomTypeKey);
  -[TVSPreferences setBool:forKey:](self->_airPlayAppPrefs, "setBool:forKey:", v3, v5);
  -[TVSPreferences synchronize](self->_airPlayAppPrefs, "synchronize");
  notify_post("com.apple.airplay.prefsChanged");
}

- (BOOL)isConferenceRoomDisplayEnabled
{
  return -[TVSPreferences integerForKey:defaultValue:]( self->_screenSaverAppPrefs,  "integerForKey:defaultValue:",  TVScreenSaverConferenceRoomTypeKey,  0LL) == 1;
}

- (void)setConferenceRoomDisplayBackgroundPhotoURL:(id)a3
{
  screenSaverAppPrefs = self->_screenSaverAppPrefs;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  -[TVSPreferences setObject:forKey:]( screenSaverAppPrefs,  "setObject:forKey:",  v4,  TVScreenSaverConferenceRoomImagePathKey);
}

- (NSURL)conferenceRoomDisplayBackgroundPhotoURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPreferences stringForKey:]( self->_screenSaverAppPrefs,  "stringForKey:",  TVScreenSaverConferenceRoomImagePathKey));
  if (v2) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
  }
  else {
    BOOL v3 = 0LL;
  }

  return (NSURL *)v3;
}

- (BOOL)myPhotosScreenSaverOptionShouldBeEnabled
{
  if (-[TVSettingsUserProfileFacade iCloudPhotoLibraryEnabled](self->_userProfileFacade, "iCloudPhotoLibraryEnabled")
    || -[TVSettingsUserProfileFacade iCloudPhotoStreamEnabled](self->_userProfileFacade, "iCloudPhotoStreamEnabled"))
  {
    return 1;
  }

  else
  {
    return -[TVSettingsUserProfileFacade iCloudSharedPhotosEnabled]( self->_userProfileFacade,  "iCloudSharedPhotosEnabled");
  }

- (BOOL)primaryUseriCloudPhotoLibraryEnabled
{
  return -[TVSettingsUserProfileFacade iCloudPhotoLibraryEnabled](self->_userProfileFacade, "iCloudPhotoLibraryEnabled");
}

- (BOOL)defaultUserSignedIn
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileFacade user](self->_userProfileFacade, "user"));
  if (v3) {
    unsigned int v4 = !-[TVSettingsUserProfileFacade userHasBeenRemoved](self->_userProfileFacade, "userHasBeenRemoved");
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)primaryUseriCloudSharedPhotosEnabled
{
  return -[TVSettingsUserProfileFacade iCloudSharedPhotosEnabled](self->_userProfileFacade, "iCloudSharedPhotosEnabled");
}

- (BOOL)myPhotosScreenSaverSelected
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade selectedPhotoCollectionGroup](self, "selectedPhotoCollectionGroup"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 photoCollectionGroupIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.TVPhotos"];

  return v4;
}

- (void)setiCloudPhotoLibraryEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5
{
}

- (void)setiCloudSharedPhotosEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5
{
}

- (void)setAuthenticationNeededToChangeiCloudPhotoOptions
{
}

- (id)_modelFromSettingsOption:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___TVSettingsScreenSaverViewModel);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 previewImageURL]);
  id v9 = [v3 isDisabled];
  id v10 = [v3 preferredOrder];

  unsigned int v11 = -[TVSettingsScreenSaverViewModel initWithIdentifier:localizedName:localizedDescriptionText:previewImageURL:isDisabled:preferredOrder:]( v4,  "initWithIdentifier:localizedName:localizedDescriptionText:previewImageURL:isDisabled:preferredOrder:",  v5,  v6,  v7,  v8,  v9,  v10);
  return v11;
}

- (void)_updateActiveThemes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVISScreenSaverServiceController activeScreenSaver](self->_serviceController, "activeScreenSaver"));
  -[TVSettingsScreenSaverFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"idleScreenSaverType");
  self->_idleScreenSaverType = (int64_t)[v3 type];
  -[TVSettingsScreenSaverFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"idleScreenSaverType");
  id v4 = [v3 type];
  if (v4 == (id)TVISScreenSaverTypeAerial)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVISAerialScreenSaver);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      __int128 v62 = v3;
      id v6 = v3;
      -[TVSettingsScreenSaverFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"idleScreenThemes");
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 categories]);
      id v8 = [v7 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v69;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v69 != v10) {
              objc_enumerationMutation(v7);
            }
            int64_t v12 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
            idleScreenThemesById = self->_idleScreenThemesById;
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](idleScreenThemesById, "objectForKey:", v14));

            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverFacade _modelFromSettingsOption:]( self,  "_modelFromSettingsOption:",  v12));
            if (!v15 || ([v15 isEqual:v16] & 1) == 0)
            {
              id v17 = v16;

              uint64_t v18 = self->_idleScreenThemesById;
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
              -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, v19);

              uint64_t v15 = v17;
            }

            objc_msgSend(v15, "setActive:", objc_msgSend(v12, "isActive"));
          }

          id v9 = [v7 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }

        while (v9);
      }

      v20 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_idleScreenThemesById, "allValues"));
      idleScreenThemes = self->_idleScreenThemes;
      self->_idleScreenThemes = v20;

      -[TVSettingsScreenSaverFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"idleScreenThemes");
      id v3 = v62;
LABEL_45:

      goto LABEL_46;
    }
  }

  id v22 = [v3 type];
  if (v22 == (id)TVISScreenSaverTypeMemory)
  {
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___TVISMemoryScreenSaver);
    if ((objc_opt_isKindOfClass(v3, v23) & 1) != 0)
    {
      id v24 = v3;
      -[TVSettingsScreenSaverFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"selectedLibraryFilterName");
      -[TVSettingsScreenSaverFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"photosLibraryFilters");
      if (-[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview]( self->_sharedLibraryStatusProvider,  "hasSharedLibraryOrPreview")
        && (id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 photosSharingFilters]),
            id v26 = [v25 count],
            v25,
            v26))
      {
        id v61 = v24;
        __int128 v63 = v3;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v24 photosSharingFilters]);
        id v28 = [v27 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v65;
          do
          {
            for (j = 0LL; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v65 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)j);
              photosLibraryFiltersById = self->_photosLibraryFiltersById;
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
              unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](photosLibraryFiltersById, "objectForKey:", v34));

              v36 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverFacade _modelFromSettingsOption:]( self,  "_modelFromSettingsOption:",  v32));
              if (!v35 || ([v35 isEqual:v36] & 1) == 0)
              {
                id v37 = v36;

                uint64_t v38 = self->_photosLibraryFiltersById;
                v39 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
                -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v37, v39);

                unsigned int v35 = v37;
              }

              objc_msgSend(v35, "setActive:", objc_msgSend(v32, "isActive"));
              if ([v35 isActive])
              {
                v40 = (NSString *)objc_claimAutoreleasedReturnValue([v36 localizedName]);
                selectedLibraryFilterName = self->_selectedLibraryFilterName;
                self->_selectedLibraryFilterName = v40;
              }
            }

            id v29 = [v27 countByEnumeratingWithState:&v64 objects:v72 count:16];
          }

          while (v29);
        }

        id v24 = v61;
        id v3 = v63;
      }

      else
      {
        -[NSMutableDictionary removeAllObjects](self->_idleScreenThemesById, "removeAllObjects");
        -[NSMutableDictionary removeAllObjects](self->_photosLibraryFiltersById, "removeAllObjects");
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_photosLibraryFiltersById, "allValues"));
      v43 = (NSArray *)objc_claimAutoreleasedReturnValue([v42 sortedArrayUsingComparator:&stru_100193168]);
      photosLibraryFilters = self->_photosLibraryFilters;
      self->_photosLibraryFilters = v43;

      -[TVSettingsScreenSaverFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"photosLibraryFilters");
      -[TVSettingsScreenSaverFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"selectedLibraryFilterName");
      v45 = (void *)objc_claimAutoreleasedReturnValue([v24 photosSourceFilters]);
      if ([v45 count])
      {
        v46 = (TVSettingsScreenSaverToggleViewModel *)objc_claimAutoreleasedReturnValue([v45 firstObject]);
        uint64_t v47 = (TVSettingsScreenSaverToggleViewModel *)objc_claimAutoreleasedReturnValue([v45 lastObject]);
        uint64_t v48 = -[TVSettingsScreenSaverToggleViewModel isDisabled](v46, "isDisabled")
           || -[TVSettingsScreenSaverToggleViewModel isDisabled](v47, "isDisabled");
        unsigned int v50 = -[TVSettingsScreenSaverToggleViewModel onState](v46, "onState");
        if (v50) {
          v49 = v46;
        }
        else {
          v49 = v47;
        }
        if (v50) {
          v51 = v47;
        }
        else {
          v51 = v46;
        }
        v52 = v46;
        v53 = v47;
        __int128 v54 = -[TVSettingsScreenSaverToggleViewModel initWithOffSettingsOption:onSettingsOption:disabled:]( objc_alloc(&OBJC_CLASS___TVSettingsScreenSaverToggleViewModel),  "initWithOffSettingsOption:onSettingsOption:disabled:",  v51,  v49,  v48);
        unsigned __int8 v55 = -[TVSettingsScreenSaverToggleViewModel isActive](v49, "isActive");

        self->_isPhotosSourceStateOn = v55;
        __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverToggleViewModel toggleFormatter](v54, "toggleFormatter"));
        __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isPhotosSourceStateOn));
        __int128 v58 = (NSString *)objc_claimAutoreleasedReturnValue([v56 stringForObjectValue:v57]);
        photosSourceStateString = self->_photosSourceStateString;
        self->_photosSourceStateString = v58;

        photosSourceFilter = self->_photosSourceFilter;
        self->_photosSourceFilter = v54;
      }

      else
      {
        v49 = self->_photosSourceFilter;
        self->_photosSourceFilter = 0LL;
      }

      goto LABEL_45;
    }
  }

- (void)setIsPhotosSourceStateOn:(BOOL)a3
{
  serviceController = self->_serviceController;
  photosSourceFilter = self->_photosSourceFilter;
  if (a3) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverToggleViewModel onIdentifier](photosSourceFilter, "onIdentifier"));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverToggleViewModel offIdentifier](photosSourceFilter, "offIdentifier"));
  }
  id v8 = (void *)v7;
  -[TVISScreenSaverServiceController activatePhotosSourceFilter:completion:]( serviceController,  "activatePhotosSourceFilter:completion:",  v7,  0LL);

  self->_isPhotosSourceStateOn = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverToggleViewModel toggleFormatter](self->_photosSourceFilter, "toggleFormatter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPhotosSourceStateOn));
  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue([v12 stringForObjectValue:v9]);
  photosSourceStateString = self->_photosSourceStateString;
  self->_photosSourceStateString = v10;
}

- (BOOL)useIdleScreen
{
  return -[TVSPreferences idleScreenEnabled](self->_screenSaverAppPrefs, "idleScreenEnabled");
}

- (void)setUseIdleScreen:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    -[TVISScreenSaverServiceController activateScreenSaverType:completion:]( self->_serviceController,  "activateScreenSaverType:completion:",  TVISScreenSaverTypePhotoCollection,  0LL);
  }
  -[TVSPreferences setIdleScreenEnabled:](self->_screenSaverAppPrefs, "setIdleScreenEnabled:", v3);
  -[TVSPreferences synchronize](self->_screenSaverAppPrefs, "synchronize");
}

- (NSArray)availableIdleScreenRefreshIntervals
{
  v3[0] = TVScreenSaverIdleScreenRefreshIntervalNever;
  v3[1] = TVScreenSaverIdleScreenRefreshIntervalDaily;
  v3[2] = TVScreenSaverIdleScreenRefreshIntervalWeekly;
  v3[3] = TVScreenSaverIdleScreenRefreshIntervalMonthly;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  4LL));
}

- (NSString)selectedIdleScreenRefreshInterval
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPreferences stringForKey:]( self->_screenSaverAppPrefs,  "stringForKey:",  TVScreenSaverIdleScreenRefreshIntervalKey));
  BOOL v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)TVScreenSaverIdleScreenRefreshIntervalMonthly;
  }
  id v4 = v2;

  return v4;
}

- (void)setSelectedIdleScreenRefreshInterval:(id)a3
{
}

- (void)setIdleScreenThemeWithViewModel:(id)a3 toActiveState:(BOOL)a4
{
  BOOL v4 = a4;
  serviceController = self->_serviceController;
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v4) {
    -[TVISScreenSaverServiceController activateCategoryWithIdentifier:completion:]( serviceController,  "activateCategoryWithIdentifier:completion:",  v6,  0LL);
  }
  else {
    -[TVISScreenSaverServiceController deactivateCategoryWithIdentifier:completion:]( serviceController,  "deactivateCategoryWithIdentifier:completion:",  v6,  0LL);
  }

  [v7 setActive:v4];
}

- (void)setIdleScreenLibraryFilterTypeToActiveStateWithIdentifier:(id)a3
{
}

- (void)screenSaverService:(id)a3 didUpdateActiveScreenSaver:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A6E9C;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)disableScreenSaverProviders
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v19 = self;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade availablePhotoCollections](self, "availablePhotoCollections"));
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = TVScreenSaverDisableOnSignOut;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionIdentifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v11]);

        if ([v12 count])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v8]);
          unsigned int v14 = [v13 BOOLValue];

          if (v14)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionIdentifier]);
            [v3 setScreenSaverDisplayStatusForBundleIdentifier:v15 isEnabled:0 appInfo:0];

            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 screenSaverPhotoCollectionIdentifier]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionIdentifier]);
            unsigned int v18 = [v16 isEqualToString:v17];

            if (v18) {
              -[TVSettingsScreenSaverFacade setIdleScreenSaverType:]( v19,  "setIdleScreenSaverType:",  TVISScreenSaverTypeAerial);
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }
}

- (void)killPhotoSourcesDaemon
{
}

- (void)launchPhotoSourcesDaemon
{
}

- (void)_openApplicationWithIdentifer:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  [v6 setUserInteractionEnabled:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  id v9[2] = sub_1000A71BC;
  v9[3] = &unk_1001919A0;
  id v10 = v3;
  id v8 = v3;
  [v7 openApplication:v8 withOptions:0 completion:v9];
}

- (void)_fetchPhotoCollections
{
  self->_isFetchingCollections = 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPhotoSourceManager defaultManager](&OBJC_CLASS___TVPhotoSourceManager, "defaultManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A7398;
  v4[3] = &unk_100193190;
  void v4[4] = self;
  [v3 fetchPhotoCollectionsInfoWithCompletion:v4];
}

- (void)_invalidatePhotoCollections
{
  availablePhotoCollectionGroups = self->_availablePhotoCollectionGroups;
  self->_availablePhotoCollectionGroups = 0LL;

  iCloudPhotosAvailablePhotoCollectionGroups = self->_iCloudPhotosAvailablePhotoCollectionGroups;
  self->_iCloudPhotosAvailablePhotoCollectionGroups = 0LL;

  otherAvailablePhotoCollectionGroups = self->_otherAvailablePhotoCollectionGroups;
  self->_otherAvailablePhotoCollectionGroups = 0LL;

  -[TVSettingsScreenSaverFacade _recalculatePhotoCollections](self, "_recalculatePhotoCollections");
}

- (void)_updateUserPhotoCollections
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](self->_userProfileListFacade, "primaryUser"));
  if (v5)
  {
    uint64_t v2 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v5);
    uint64_t v3 = -[TVSettingsUserProfileFacade iCloudPhotoLibraryEnabled](v2, "iCloudPhotoLibraryEnabled")
      || -[TVSettingsUserProfileFacade iCloudPhotoStreamEnabled](v2, "iCloudPhotoStreamEnabled")
      || -[TVSettingsUserProfileFacade iCloudSharedPhotosEnabled](v2, "iCloudSharedPhotosEnabled");
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  [v4 setScreenSaverDisplayStatusForBundleIdentifier:@"com.apple.TVPhotos" isEnabled:v3 appInfo:0];
}

- (id)_memoryScreenSaverIdentifier
{
  return (id)TSKLocString(@"SaverBackdropMemoryTitle");
}

- (id)_iCloudPhotosScreenSaverIdentifier
{
  return (id)TSKLocString(@"SaverBackdropMyPhotosTitle");
}

- (void)_updateCPLStatus
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PXCPLUIStatusProvider status](self->_statusProvider, "status"));
  -[TVSettingsScreenSaverFacade setHasPhotosCompletedInitialSync:]( self,  "setHasPhotosCompletedInitialSync:",  [v3 hasCompletedInitialSync]);
}

- (void)_updatePhotosSourceHasMemories
{
  id v3 = -[PXStoryMemoryFeedDataSourceManager hasAnyMemories](self->_dataSourceManager, "hasAnyMemories");
  if (self->_photosSourceHasMemories != (_DWORD)v3)
  {
    -[TVSettingsScreenSaverFacade setPhotosSourceHasMemories:](self, "setPhotosSourceHasMemories:", v3);
    -[TVSettingsScreenSaverFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availablePhotoCollections");
    -[TVSettingsScreenSaverFacade invalidateCachedAvailablePhotoCollectionGroups]( self,  "invalidateCachedAvailablePhotoCollectionGroups");
    -[TVSettingsScreenSaverFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"availablePhotoCollections");
  }

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v8 = a3;
  if (off_1001E0200 == a5)
  {
    if ((v6 & 1) != 0)
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A784C;
      block[3] = &unk_10018E810;
      objc_copyWeak(&v18, &location);
      dispatch_async(&_dispatch_main_q, block);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    if ((v6 & 4) != 0)
    {
      objc_initWeak(&location, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000A7878;
      v15[3] = &unk_10018E810;
      id v9 = &v16;
      objc_copyWeak(&v16, &location);
      id v10 = v15;
      goto LABEL_12;
    }
  }

  else if (off_1001E0208 == a5)
  {
    if ((v6 & 0x10000) != 0)
    {
      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000A78A4;
      v13[3] = &unk_10018E810;
      id v9 = &v14;
      objc_copyWeak(&v14, &location);
      id v10 = v13;
      goto LABEL_12;
    }
  }

  else if ((v6 & 3) != 0 && off_1001E0210 == a5)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A78D0;
    v11[3] = &unk_10018E810;
    id v9 = &v12;
    objc_copyWeak(&v12, &location);
    id v10 = v11;
LABEL_12:
    dispatch_async(&_dispatch_main_q, v10);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0218 == a6 || off_1001E0220 == a6)
  {
    -[TVSettingsScreenSaverFacade _fetchPhotoCollections](self, "_fetchPhotoCollections", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverFacade;
    -[TVSettingsScreenSaverFacade observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (NSArray)availablePhotoCollectionGroups
{
  return self->_availablePhotoCollectionGroups;
}

- (NSArray)iCloudPhotosAvailablePhotoCollectionGroups
{
  return self->_iCloudPhotosAvailablePhotoCollectionGroups;
}

- (NSArray)otherAvailablePhotoCollectionGroups
{
  return self->_otherAvailablePhotoCollectionGroups;
}

- (BOOL)photosSourceHasMemories
{
  return self->_photosSourceHasMemories;
}

- (void)setPhotosSourceHasMemories:(BOOL)a3
{
  self->_photosSourceHasMemories = a3;
}

- (BOOL)hasPhotosCompletedInitialSync
{
  return self->_hasPhotosCompletedInitialSync;
}

- (void)setHasPhotosCompletedInitialSync:(BOOL)a3
{
  self->_hasPhotosCompletedInitialSync = a3;
}

- (NSArray)idleScreenThemes
{
  return self->_idleScreenThemes;
}

- (NSArray)photosLibraryFilters
{
  return self->_photosLibraryFilters;
}

- (NSString)selectedLibraryFilterName
{
  return self->_selectedLibraryFilterName;
}

- (void)setSelectedLibraryFilterName:(id)a3
{
}

- (TVSettingsScreenSaverToggleViewModel)photosSourceFilter
{
  return self->_photosSourceFilter;
}

- (BOOL)isPhotosSourceStateOn
{
  return self->_isPhotosSourceStateOn;
}

- (NSString)photosSourceStateString
{
  return self->_photosSourceStateString;
}

- (TVISScreenSaverServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (TVSettingsUserProfileListFacade)userProfileListFacade
{
  return self->_userProfileListFacade;
}

- (TVSettingsUserProfileFacade)userProfileFacade
{
  return self->_userProfileFacade;
}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setStatusProvider:(id)a3
{
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void).cxx_destruct
{
}

@end