@interface TVSettingsHomeKitFacade
+ (id)keyPathsForValuesAffectingCanAccessHomeData;
+ (id)sharedInstance;
- (BOOL)canAccessHomeData;
- (BOOL)needsUpdate;
- (BOOL)odeonEnabled;
- (BOOL)odeonSupportsAtmos;
- (HFItemManager)itemManager;
- (HMHomeManager)homeManager;
- (NSArray)allowedRemoteTypes;
- (NSArray)cameraProfiles;
- (NSArray)favoriteCameraProfiles;
- (NSArray)nonFavoriteCameraProfiles;
- (NSArray)residentDevices;
- (NSArray)secureServices;
- (NSArray)significantEventTypes;
- (NSArray)smartNotificationsOptions;
- (NSArray)times;
- (TSKMappingFormatter)allowedRemotesDescriptionFormatter;
- (TSKMappingFormatter)allowedRemotesFormatter;
- (TSKMappingFormatter)significantEventTypesFormatter;
- (TSKMappingFormatter)smartNotificationsFormatter;
- (TSKMappingFormatter)smartNotificationsShortFormatter;
- (TSKMappingFormatter)timesFormatter;
- (TVCSHomeManager)settingsHomeManager;
- (TVSettingsHomeKitFacade)initWithServiceName:(id)a3;
- (int)cameraFilter;
- (int64_t)secureAccessoryAllowedRemotes;
- (void)_setNeedsResidentDeviceAndAccessoryUpdate;
- (void)_setupItemManager;
- (void)_updateCameraProfiles;
- (void)_updateResidentDevices;
- (void)_updateSecureServices;
- (void)addProfileIdentifierToDisabledList:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeProfileIdentifierFromDisabledList:(id)a3;
- (void)setCameraFilter:(int)a3;
- (void)setCameraProfiles:(id)a3;
- (void)setFavoriteCameraProfiles:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNonFavoriteCameraProfiles:(id)a3;
- (void)setResidentDevices:(id)a3;
- (void)setSecureAccessoryAllowedRemotes:(int64_t)a3;
- (void)setSecureServices:(id)a3;
@end

@implementation TVSettingsHomeKitFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AD474;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1AC8 != -1) {
    dispatch_once(&qword_1001E1AC8, block);
  }
  return (id)qword_1001E1AC0;
}

- (TVSettingsHomeKitFacade)initWithServiceName:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitFacade;
  v3 = -[TVSettingsTCCFacade initWithServiceName:](&v12, "initWithServiceName:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    settingsHomeManager = v3->_settingsHomeManager;
    v3->_settingsHomeManager = (TVCSHomeManager *)v4;

    -[TVCSHomeManager addObserver:forKeyPath:options:context:]( v3->_settingsHomeManager,  "addObserver:forKeyPath:options:context:",  v3,  @"localAccessory",  0LL,  off_1001E0340);
    -[TVCSHomeManager reloadHomeConfiguration](v3->_settingsHomeManager, "reloadHomeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[HMMutableHomeManagerConfiguration defaultConfiguration]( &OBJC_CLASS___HMMutableHomeManagerConfiguration,  "defaultConfiguration"));
    [v6 setDiscretionary:1];
    v7 = -[HMHomeManager initWithHomeMangerConfiguration:]( objc_alloc(&OBJC_CLASS___HMHomeManager),  "initWithHomeMangerConfiguration:",  v6);
    homeManager = v3->_homeManager;
    v3->_homeManager = v7;

    -[HMHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
    -[TVSettingsHomeKitFacade _updateResidentDevices](v3, "_updateResidentDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    v3->_cameraFilter = objc_msgSend(v9, "pbs_homeKitCamerasFilter");

    -[TVSettingsHomeKitFacade _updateSecureServices](v3, "_updateSecureServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
    v3->_secureAccessoryAllowedRemotes = (int64_t)objc_msgSend(v10, "pbs_secureHomeKitAccessoryAllowedRemotes");

    -[TVSettingsHomeKitFacade _setupItemManager](v3, "_setupItemManager");
  }

  return v3;
}

- (TSKMappingFormatter)smartNotificationsFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitMotionNotificationsOffValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v13[0] = v3;
  uint64_t v4 = TSKLocString(@"HomeKitMotionNotificationsClipsOnlyValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13[1] = v5;
  uint64_t v6 = TSKLocString(@"HomeKitMotionNotificationsAnyMotionValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[2] = v7;
  uint64_t v8 = TSKLocString(@"HomeKitMotionNotificationsSpecificMotionValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  v11 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AF160,  v10);
  return v11;
}

- (TSKMappingFormatter)smartNotificationsShortFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitMotionNotificationsOffShortValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v13[0] = v3;
  uint64_t v4 = TSKLocString(@"HomeKitMotionNotificationsClipsOnlyShortValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13[1] = v5;
  uint64_t v6 = TSKLocString(@"HomeKitMotionNotificationsAnyMotionShortValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[2] = v7;
  uint64_t v8 = TSKLocString(@"HomeKitMotionNotificationsSpecificMotionShortValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  v11 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AF178,  v10);
  return v11;
}

- (NSArray)smartNotificationsOptions
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitFacade smartNotificationsFormatter](self, "smartNotificationsFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputs]);

  return (NSArray *)v3;
}

- (TSKMappingFormatter)significantEventTypesFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitMotionNotificationsPeopleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v13[0] = v3;
  uint64_t v4 = TSKLocString(@"HomeKitMotionNotificationsAnimalsValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13[1] = v5;
  uint64_t v6 = TSKLocString(@"HomeKitMotionNotificationsVehiclesValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[2] = v7;
  uint64_t v8 = TSKLocString(@"HomeKitMotionNotificationsPackagesValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  v11 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AF190,  v10);
  return v11;
}

- (NSArray)significantEventTypes
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitFacade significantEventTypesFormatter](self, "significantEventTypesFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputs]);

  return (NSArray *)v3;
}

- (TSKMappingFormatter)timesFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitMotionNotificationsAnytimeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v12 = v3;
  uint64_t v4 = TSKLocString(@"HomeKitMotionNotificationsDayValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  uint64_t v6 = TSKLocString(@"HomeKitMotionNotificationsNightValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AF1A8, v8, v12, v13);

  return v10;
}

- (NSArray)times
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitFacade timesFormatter](self, "timesFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputs]);

  return (NSArray *)v3;
}

- (BOOL)canAccessHomeData
{
  return -[TVCSHomeManager needsOSUpdateToRunHH2](self->_settingsHomeManager, "needsOSUpdateToRunHH2") ^ 1;
}

+ (id)keyPathsForValuesAffectingCanAccessHomeData
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"settingsHomeManager.needsOSUpdateToRunHH2");
}

- (BOOL)odeonEnabled
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHomeManager localAccessory](self->_settingsHomeManager, "localAccessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hmAccessory]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioDestinationController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (BOOL)odeonSupportsAtmos
{
  if (-[TVSettingsHomeKitFacade odeonEnabled](self, "odeonEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHomeManager localAccessory](self->_settingsHomeManager, "localAccessory"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hmAccessory]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioDestinationController]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 destination]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___HMAccessory);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = v6;
      if (!v8)
      {
LABEL_9:
        BOOL v9 = 0;
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0) {
        goto LABEL_9;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 components]);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaProfile]);
      id v8 = (id)objc_claimAutoreleasedReturnValue([v13 accessory]);

      if (!v8) {
        goto LABEL_9;
      }
    }

    BOOL v9 = ((unint64_t)[v8 homePodVariant] & 0xFFFFFFFFFFFFFFFDLL) == 1;

LABEL_10:
    return v9;
  }

  return 0;
}

- (void)setSecureAccessoryAllowedRemotes:(int64_t)a3
{
  if (self->_secureAccessoryAllowedRemotes != a3)
  {
    self->_secureAccessoryAllowedRemotes = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
    objc_msgSend(v4, "pbs_setSecureHomeKitAccessoryAllowedRemotes:", a3);
  }

- (TSKMappingFormatter)allowedRemotesFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitUnlockSecureAccessoriesNotAllowedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v12 = v3;
  uint64_t v4 = TSKLocString(@"HomeKitUnlockSecureAccessoriesAppleTVRemotesTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  uint64_t v6 = TSKLocString(@"HomeKitUnlockSecureAccessoriesAllRemotesTitle");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  BOOL v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AF1C0, v8, v12, v13);

  return v10;
}

- (TSKMappingFormatter)allowedRemotesDescriptionFormatter
{
  uint64_t v2 = TSKLocString(@"HomeKitUnlockSecureAccessoriesNotAllowedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v12 = v3;
  uint64_t v4 = TSKLocString(@"HomeKitUnlockSecureAccessoriesAppleTVRemotesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  uint64_t v6 = TSKLocString(@"HomeKitUnlockSecureAccessoriesAllRemotesDescription");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  BOOL v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AF1D8, v8, v12, v13);

  return v10;
}

- (NSArray)allowedRemoteTypes
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitFacade allowedRemotesFormatter](self, "allowedRemotesFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputs]);

  return (NSArray *)v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0340 == a6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance", a3, a4, a5));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);

    if (v9)
    {
      id v10 =  -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:]( self->_itemManager,  "reloadAndUpdateAllItemsFromSenderSelector:",  a2);
      -[TVSettingsHomeKitFacade _updateCameraProfiles](self, "_updateCameraProfiles");
      -[TVSettingsHomeKitFacade _updateSecureServices](self, "_updateSecureServices");
    }
  }

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
}

- (void)_setNeedsResidentDeviceAndAccessoryUpdate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_needsUpdate = 1;
  objc_sync_exit(v2);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE0C0;
  block[3] = &unk_10018E440;
  block[4] = v2;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateResidentDevices
{
  v21 = self->_residentDevices;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = self;
  uint64_t v4 = self->_homeManager;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v20 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](v4, "homes"));
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 residentDevices]);
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
              if ([v16 isCurrentDevice])
              {
                -[NSMutableArray addObject:](v3, "addObject:", v16);
                goto LABEL_16;
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

- (void)_updateCameraProfiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pbs_homeKitDisabledCameras"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHomeManager localAccessory](self->_settingsHomeManager, "localAccessory"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 home]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v6 hmHome]);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v38 = self;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HFItemManager allItems](self->_itemManager, "allItems"));
  id v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 profile]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

        v16 = (void *)objc_claimAutoreleasedReturnValue([v12 profile]);
        LODWORD(v13) = objc_msgSend(v16, "hf_shouldBeOnForContextType:", 0);

        unsigned int v17 = [v4 containsObject:v15];
        if ((_DWORD)v13)
        {
          uint64_t v18 = v17 ^ 1;
          v19 = v40;
        }

        else
        {
          uint64_t v18 = (v17 & 1) == 0 && v38->_cameraFilter != 0;
          v19 = v39;
        }

        id v20 = v19;
        v21 = -[TVSettingsHomeKitCameraProfile initWithCameraItem:controlCenterAndSiriEnabled:]( objc_alloc(&OBJC_CLASS___TVSettingsHomeKitCameraProfile),  "initWithCameraItem:controlCenterAndSiriEnabled:",  v12,  v18);
        [v20 addObject:v21];
      }

      id v9 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }

    while (v9);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitFacade itemManager](v38, "itemManager"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sourceItem]);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 latestResults]);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:HFResultDisplayReorderableCameraItemListKey]);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000AE76C;
  v41[3] = &unk_100193578;
  id v26 = v25;
  id v42 = v26;
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v40 sortedArrayUsingComparator:v41]);
  favoriteCameraProfiles = v38->_favoriteCameraProfiles;
  v38->_favoriteCameraProfiles = (NSArray *)v27;

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v39 sortedArrayUsingComparator:&stru_1001935B8]);
  nonFavoriteCameraProfiles = v38->_nonFavoriteCameraProfiles;
  v38->_nonFavoriteCameraProfiles = (NSArray *)v29;

  if (v37) {
    v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( v38->_favoriteCameraProfiles,  "arrayByAddingObjectsFromArray:",  v38->_nonFavoriteCameraProfiles));
  }
  else {
    v31 = &__NSArray0__struct;
  }
  objc_storeStrong((id *)&v38->_cameraProfiles, v31);
  if (v37) {

  }
  uint64_t v34 = TVCSHomeLog(v32, v33);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    cameraProfiles = v38->_cameraProfiles;
    *(_DWORD *)buf = 138412546;
    v48 = cameraProfiles;
    __int16 v49 = 2112;
    v50 = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found cameras %@ in home %@", buf, 0x16u);
  }
}

- (void)_updateSecureServices
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHomeManager localAccessory](self->_settingsHomeManager, "localAccessory"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 home]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hmHome]);

  v30[0] = HMServiceTypeDoor;
  v30[1] = HMServiceTypeGarageDoorOpener;
  v30[2] = HMServiceTypeLockMechanism;
  v30[3] = HMServiceTypeSecuritySystem;
  v30[4] = HMServiceTypeWindow;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 5LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 servicesWithTypes:v6]);

  uint64_t v10 = TVCSHomeLog(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Found secure services %@ in home %@",  buf,  0x16u);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      unsigned int v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v17);
        v19 = objc_alloc(&OBJC_CLASS___TVSettingsHomeKitService);
        id v20 = -[TVSettingsHomeKitService initWithHMService:](v19, "initWithHMService:", v18, (void)v21);
        -[NSMutableArray addObject:](v12, "addObject:", v20);

        unsigned int v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v15);
  }

  -[TVSettingsHomeKitFacade setSecureServices:](self, "setSecureServices:", v12);
}

- (void)_setupItemManager
{
  uint64_t v4 = -[TVSettingsHomeKitFacadeCameraItemManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___TVSettingsHomeKitFacadeCameraItemManager),  "initWithDelegate:",  self);
  itemManager = self->_itemManager;
  self->_itemManager = (HFItemManager *)v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:]( self->_itemManager,  "reloadAndUpdateAllItemsFromSenderSelector:",  a2));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AEBB8;
  v8[3] = &unk_1001935E0;
  v8[4] = self;
  id v7 = [v6 addSuccessBlock:v8];
}

- (void)addProfileIdentifierToDisabledList:(id)a3
{
  id v16 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pbs_homeKitDisabledCameras"));
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  if (([v8 containsObject:v16] & 1) == 0)
  {
    -[TVSettingsHomeKitFacade setCameraFilter:](self, "setCameraFilter:", 2LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pbs_homeKitDisabledCameras"));
    v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = &__NSArray0__struct;
    }
    id v13 = v12;

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:v16]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    objc_msgSend(v15, "pbs_setHomeKitDisabledCameras:", v14);

    -[TVSettingsHomeKitFacade _updateCameraProfiles](self, "_updateCameraProfiles");
    id v8 = v13;
  }
}

- (void)removeProfileIdentifierFromDisabledList:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pbs_homeKitDisabledCameras"));
  id v6 = [v5 mutableCopy];

  if (!v6)
  {
    -[TVSettingsHomeKitFacade setCameraFilter:](self, "setCameraFilter:", 2LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pbs_homeKitDisabledCameras"));
    id v6 = [v8 mutableCopy];
  }

  [v6 removeObject:v10];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  objc_msgSend(v9, "pbs_setHomeKitDisabledCameras:", v6);

  -[TVSettingsHomeKitFacade _updateCameraProfiles](self, "_updateCameraProfiles");
}

- (void)setCameraFilter:(int)a3
{
  if (self->_cameraFilter != a3)
  {
    uint64_t v3 = *(void *)&a3;
    -[TVSettingsHomeKitFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"cameraFilter");
    self->_cameraFilter = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    objc_msgSend(v5, "pbs_setHomeKitCamerasFilter:", v3);

    -[TVSettingsHomeKitFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"cameraFilter");
    if (self->_cameraFilter == 1)
    {
      id v6 = (NSArray *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
      -[NSArray pbs_setHomeKitDisabledCameras:](v6, "pbs_setHomeKitDisabledCameras:", 0LL);
    }

    else
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v7 = self->_favoriteCameraProfiles;
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          v11 = 0LL;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            -[TVSettingsHomeKitFacade removeProfileIdentifierFromDisabledList:]( self,  "removeProfileIdentifierFromDisabledList:",  v12);

            v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
        }

        while (v9);
      }

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v6 = self->_nonFavoriteCameraProfiles;
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          id v16 = 0LL;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v6);
            }
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v16),  "profileIdentifier",  (void)v18));
            -[TVSettingsHomeKitFacade addProfileIdentifierToDisabledList:]( self,  "addProfileIdentifierToDisabledList:",  v17);

            id v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
        }

        while (v14);
      }
    }

    -[TVSettingsHomeKitFacade _updateCameraProfiles](self, "_updateCameraProfiles");
  }

- (NSArray)residentDevices
{
  return self->_residentDevices;
}

- (void)setResidentDevices:(id)a3
{
}

- (NSArray)secureServices
{
  return self->_secureServices;
}

- (void)setSecureServices:(id)a3
{
}

- (NSArray)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void)setCameraProfiles:(id)a3
{
}

- (int)cameraFilter
{
  return self->_cameraFilter;
}

- (int64_t)secureAccessoryAllowedRemotes
{
  return self->_secureAccessoryAllowedRemotes;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (TVCSHomeManager)settingsHomeManager
{
  return self->_settingsHomeManager;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (NSArray)favoriteCameraProfiles
{
  return self->_favoriteCameraProfiles;
}

- (void)setFavoriteCameraProfiles:(id)a3
{
}

- (NSArray)nonFavoriteCameraProfiles
{
  return self->_nonFavoriteCameraProfiles;
}

- (void)setNonFavoriteCameraProfiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end