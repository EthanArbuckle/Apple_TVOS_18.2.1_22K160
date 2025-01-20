@interface CMSHomeManager
+ (id)sharedManager;
- (BOOL)homesLoaded;
- (CMSHomeManager)init;
- (CMSHomeManagerDelegate)delegate;
- (HMAccessory)getCurrentAccessory;
- (HMAccessorySettingsDataSource)dataSource;
- (HMHome)getCurrentHome;
- (HMHomeManager)homeManager;
- (MSHomeHubManager)homehubManager;
- (NSMutableArray)homesLoadedHandlers;
- (NSMutableSet)pendingAccessoryIDs;
- (OS_dispatch_queue)serialQueue;
- (void)_informSettingDelegateAboutChange:(id)a3;
- (void)_notifyManagerLoadedHomes:(id)a3;
- (void)_updateSiriEndpointSettings;
- (void)_updateSiriEndpointSettings:(id)a3 home:(id)a4;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
- (void)dealloc;
- (void)fetchEndpointSettings:(id)a3 completion:(id)a4;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)homehubManager:(id)a3 didAddEndpoint:(id)a4;
- (void)homehubManager:(id)a3 didRemoveEndpoint:(id)a4;
- (void)loadHomes:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomehubManager:(id)a3;
- (void)setHomesLoaded:(BOOL)a3;
- (void)setHomesLoadedHandlers:(id)a3;
- (void)setPendingAccessoryIDs:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5;
- (void)waitForHomesToLoad;
@end

@implementation CMSHomeManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005284;
  block[3] = &unk_10001C540;
  block[4] = a1;
  if (qword_100024420 != -1) {
    dispatch_once(&qword_100024420, block);
  }
  return (id)qword_100024428;
}

- (CMSHomeManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CMSHomeManager;
  v2 = -[CMSHomeManager init](&v24, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.agoraplayer.HomeServicesQueue", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    homesLoadedHandlers = v2->_homesLoadedHandlers;
    v2->_homesLoadedHandlers = v7;

    v2->_homesLoaded = 0;
    id v9 = [[HMMutableHomeManagerConfiguration alloc] initWithOptions:32824 cachePolicy:2];
    [v9 setDiscretionary:1];
    v10 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    [v9 setDelegateQueue:v10];
    v11 = -[HMHomeManager initWithHomeMangerConfiguration:]( objc_alloc(&OBJC_CLASS___HMHomeManager),  "initWithHomeMangerConfiguration:",  v9);
    homeManager = v2->_homeManager;
    v2->_homeManager = v11;

    -[HMHomeManager setDelegate:](v2->_homeManager, "setDelegate:", v2);
    id v13 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = _CMSQLoggingFacility(v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "HomeMediaSettings Feature disabled - Initializing data source",  v23,  2u);
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[MSHomeHubManager shared](&OBJC_CLASS___MSHomeHubManager, "shared"));
      homehubManager = v2->_homehubManager;
      v2->_homehubManager = (MSHomeHubManager *)v16;

      -[MSHomeHubManager registerForHomeHubMangerDelegate:]( v2->_homehubManager,  "registerForHomeHubMangerDelegate:",  v2);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[HMHomeManager createAccessorySettingsDataSource](v2->_homeManager, "createAccessorySettingsDataSource"));
      dataSource = v2->_dataSource;
      v2->_dataSource = (HMAccessorySettingsDataSource *)v18;

      -[HMAccessorySettingsDataSource setDelegate:](v2->_dataSource, "setDelegate:", v2);
      v20 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      pendingAccessoryIDs = v2->_pendingAccessoryIDs;
      v2->_pendingAccessoryIDs = v20;
    }
  }

  return v2;
}

- (void)dealloc
{
  if ((+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled") & 1) == 0) {
    -[MSHomeHubManager unregisterForHomeHubMangerDelegate:]( self->_homehubManager,  "unregisterForHomeHubMangerDelegate:",  self);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMSHomeManager;
  -[CMSHomeManager dealloc](&v3, "dealloc");
}

- (void)waitForHomesToLoad
{
  objc_super v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000557C;
  v6[3] = &unk_10001C748;
  v7 = v3;
  v4 = v3;
  -[CMSHomeManager loadHomes:](self, "loadHomes:", v6);
  dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
  dispatch_group_wait(v4, v5);
}

- (void)loadHomes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000563C;
  block[3] = &unk_10001C770;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyManagerLoadedHomes:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  dispatch_time_t v5 = self->_homesLoadedHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homes", (void)v12));
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_homesLoadedHandlers, "removeAllObjects");
}

- (HMAccessory)getCurrentAccessory
{
  if (!self->_homesLoaded) {
    -[CMSHomeManager waitForHomesToLoad](self, "waitForHomesToLoad");
  }
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  id v4 = v3;
  if (v3)
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);
    [v5 setDelegate:self];

    id v6 = v4;
  }

  else
  {
    uint64_t v7 = _CMSQLoggingFacility(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000F2AC(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return (HMAccessory *)v4;
}

- (HMHome)getCurrentHome
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentAccessory](self, "getCurrentAccessory"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 home]);

  return (HMHome *)v3;
}

- (void)fetchEndpointSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (v7)
  {
    if (v6)
    {
      dataSource = self->_dataSource;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentHome](self, "getCurrentHome"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CMSSettingsManager homeKitSettingsKeyPath]( &OBJC_CLASS___CMSSettingsManager,  "homeKitSettingsKeyPath"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100005A8C;
      v22[3] = &unk_10001C798;
      v23 = v8;
      -[HMAccessorySettingsDataSource fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:]( dataSource,  "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:",  v11,  v6,  v12,  v22);
    }

    else
    {
      uint64_t v13 = _CMSQLoggingFacility(v7);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000F2E0(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v8[2](v8, 0LL);
    }
  }
}

- (void)_informSettingDelegateAboutChange:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  char v6 = objc_opt_respondsToSelector(v5, "homeManager:didUpdateHomeAccessorySetting:");

  if ((v6 & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
    [v4 homeManager:self didUpdateHomeAccessorySetting:v7];
LABEL_4:
  }
}

- (void)_updateSiriEndpointSettings
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
  id v6 = [v4 copy];

  objc_sync_exit(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005C88;
  v7[3] = &unk_10001C7C0;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentHome](self, "getCurrentHome"));
  id v5 = v8;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)_updateSiriEndpointSettings:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoryWithUniqueIdentifier:v6]);
    if (v40)
    {
      v55[0] = 0LL;
      v55[1] = v55;
      v55[2] = 0x2020000000LL;
      char v56 = 1;
      uint64_t v10 = dispatch_group_create();
      dispatch_group_enter(v10);
      dataSource = self->_dataSource;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v40 uniqueIdentifier]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CMSSettingsManager homeKitSettingsKeyPath]( &OBJC_CLASS___CMSSettingsManager,  "homeKitSettingsKeyPath"));
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_1000060E4;
      v51[3] = &unk_10001C7E8;
      id v14 = v40;
      id v52 = v14;
      v54 = v55;
      uint64_t v15 = v10;
      v53 = v15;
      -[HMAccessorySettingsDataSource subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:]( dataSource,  "subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:",  v9,  v12,  v13,  1LL,  v51);

      id inited = objc_initWeak(&location, self);
      uint64_t v17 = _CMSQLoggingFacility(inited);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
        *(_DWORD *)buf = 138412546;
        v58 = v9;
        __int16 v59 = 2112;
        v60 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Fetching settings for HomeID %@, AccessoryID %@",  buf,  0x16u);
      }

      dispatch_group_enter(v15);
      uint64_t v20 = self->_dataSource;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[CMSSettingsManager homeKitSettingsKeyPath]( &OBJC_CLASS___CMSSettingsManager,  "homeKitSettingsKeyPath"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10000615C;
      v44[3] = &unk_10001C810;
      id v23 = v6;
      v48 = v55;
      id v45 = v23;
      v46 = self;
      objc_copyWeak(&v49, &location);
      objc_super v24 = v15;
      v47 = v24;
      -[HMAccessorySettingsDataSource fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:]( v20,  "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:",  v9,  v21,  v22,  v44);

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006274;
      block[3] = &unk_10001C838;
      v43 = v55;
      void block[4] = self;
      id v42 = v23;
      dispatch_group_notify(v24, v26, block);

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);

      _Block_object_dispose(v55, 8);
    }

    else
    {
      uint64_t v35 = _CMSQLoggingFacility(0LL);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10000F424((uint64_t)v6, v36, v37);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
      objc_sync_enter(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
      [v39 addObject:v6];

      objc_sync_exit(v38);
    }
  }

  else
  {
    uint64_t v27 = _CMSQLoggingFacility(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F3B4(v9, v28, v29, v30, v31, v32, v33, v34);
    }
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CMSQLoggingFacility(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMHomeManagerStatusToString([v4 status]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CMSHomeManager homeManagerDidUpdateHomes:]";
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s with HomeManager Status %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100006468;
  v11[3] = &unk_10001C860;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v10 = v4;
  dispatch_async(serialQueue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = _CMSQLoggingFacility(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMHomeManagerStatusToString([v5 status]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v24 = 136315394;
    v25 = "-[CMSHomeManager homeManager:didUpdateStatus:]";
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s with HomeManager Status %@",  (uint8_t *)&v24,  0x16u);
  }

  if (((unint64_t)[v5 status] & 0x31) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccessory]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 settings]);

    id v12 = [v11 setDelegate:self];
    if (v11)
    {
      -[CMSHomeManager _informSettingDelegateAboutChange:](self, "_informSettingDelegateAboutChange:", v11);
    }

    else
    {
      uint64_t v13 = _CMSQLoggingFacility(v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000F5C4(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccessory]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 home]);

    [v23 setDelegate:self];
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CMSQLoggingFacility(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CMSHomeManager home:didAddAccessory:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s home %@ accessory %@",  (uint8_t *)&v10,  0x20u);
  }
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  int v12 = (int)v11;
  uint64_t v13 = _CMSQLoggingFacility(v11);
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HomeMediaSettings feature enabled, skipping accessory setting update",  (uint8_t *)&v20,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      uint64_t v21 = "-[CMSHomeManager settings:didUpdateForIdentifier:keyPath:]";
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s for accessoryID %@ keyPath %@",  (uint8_t *)&v20,  0x20u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentAccessory](self, "getCurrentAccessory"));
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);

    id v17 = -[os_log_s isEqual:](v15, "isEqual:", v9);
    if ((v17 & 1) != 0)
    {
      if ([v10 isEqualToString:kHPSettingKeypathUpdateListeningHistory]
        || [v10 isEqualToString:allowExplicitContentSettingsKeyPath])
      {
        -[CMSHomeManager _informSettingDelegateAboutChange:](self, "_informSettingDelegateAboutChange:", v8);
      }
    }

    else
    {
      uint64_t v18 = _CMSQLoggingFacility(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Setting did not update for currentAccessory",  (uint8_t *)&v20,  2u);
      }
    }
  }
}

- (void)homehubManager:(id)a3 didAddEndpoint:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _CMSQLoggingFacility(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
    int v11 = 136315394;
    int v12 = "-[CMSHomeManager homehubManager:didAddEndpoint:]";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s for endpoint %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentHome](self, "getCurrentHome"));
  -[CMSHomeManager _updateSiriEndpointSettings:home:](self, "_updateSiriEndpointSettings:home:", v9, v10);
}

- (void)homehubManager:(id)a3 didRemoveEndpoint:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _CMSQLoggingFacility(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
    int v13 = 136315394;
    __int16 v14 = "-[CMSHomeManager homehubManager:didRemoveEndpoint:]";
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s for endpoint %@", (uint8_t *)&v13, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "homeManager:didRemoveSiriEndpoint:");

  if ((v11 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
    [v9 homeManager:self didRemoveSiriEndpoint:v12];

LABEL_6:
  }
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CMSQLoggingFacility(v10);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136315906;
    id v42 = "-[CMSHomeManager accessorySettingsDataSource:didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s, dataSource: %@ endpointID %@ settings: %@",  (uint8_t *)&v41,  0x2Au);
  }

  id v13 = [v8 isEqual:self->_dataSource];
  if ((v13 & 1) == 0)
  {
    uint64_t v17 = _CMSQLoggingFacility(v13);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000F714(v14, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_14;
  }

  if (!v10 || (id v13 = [v10 count]) == 0)
  {
    uint64_t v25 = _CMSQLoggingFacility(v13);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000F634(v14, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_14;
  }

  if (!v9)
  {
    uint64_t v33 = _CMSQLoggingFacility(v13);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000F6A4(v14, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_14;
  }

  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  if (!-[os_log_s conformsToProtocol:]( v14,  "conformsToProtocol:",  &OBJC_PROTOCOL___CMSHomeManagerDelegate))
  {
LABEL_14:

    goto LABEL_15;
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
  char v16 = objc_opt_respondsToSelector(v15, "homeManager:didUpdateSettings:siriEndpoint:");

  if ((v16 & 1) != 0)
  {
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager delegate](self, "delegate"));
    -[os_log_s homeManager:didUpdateSettings:siriEndpoint:]( v14,  "homeManager:didUpdateSettings:siriEndpoint:",  self,  v10,  v9);
    goto LABEL_14;
  }

- (CMSHomeManagerDelegate)delegate
{
  return (CMSHomeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)homesLoadedHandlers
{
  return self->_homesLoadedHandlers;
}

- (void)setHomesLoadedHandlers:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (BOOL)homesLoaded
{
  return self->_homesLoaded;
}

- (void)setHomesLoaded:(BOOL)a3
{
  self->_homesLoaded = a3;
}

- (MSHomeHubManager)homehubManager
{
  return self->_homehubManager;
}

- (void)setHomehubManager:(id)a3
{
}

- (HMAccessorySettingsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSMutableSet)pendingAccessoryIDs
{
  return self->_pendingAccessoryIDs;
}

- (void)setPendingAccessoryIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end