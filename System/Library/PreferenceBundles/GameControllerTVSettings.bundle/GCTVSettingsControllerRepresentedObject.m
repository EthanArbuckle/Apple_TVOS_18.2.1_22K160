@interface GCTVSettingsControllerRepresentedObject
- (BOOL)findingController;
- (CHHapticEngine)engine;
- (GCController)device;
- (GCSController)controller;
- (GCTVSettingsControllerRepresentedObject)initWithPrefsStore:(id)a3;
- (NSArray)profiles;
- (NSArray)wrappedCopilotFusedController;
- (NSArray)wrappedDefaultGame;
- (NSArray)wrappedGamesWithProfile;
- (NSArray)wrappedGamesWithoutProfile;
- (NSDictionary)appsWithSettings;
- (NSDictionary)appsWithoutSettings;
- (NSString)createNewProfileName;
- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore;
- (void)filterSupportedApps;
- (void)findController;
- (void)loadFindControllerPattern;
- (void)setAppsWithSettings:(id)a3;
- (void)setAppsWithoutSettings:(id)a3;
- (void)setController:(id)a3;
- (void)setCreateNewProfileName:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEngine:(id)a3;
- (void)setFindingController:(BOOL)a3;
- (void)setPrefsStore:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setWrappedCopilotFusedController:(id)a3;
- (void)setWrappedDefaultGame:(id)a3;
- (void)setWrappedGamesWithProfile:(id)a3;
- (void)setWrappedGamesWithoutProfile:(id)a3;
- (void)updateCopilotFusedControllers:(id)a3;
- (void)updateGames:(id)a3;
- (void)updateProfiles:(id)a3;
@end

@implementation GCTVSettingsControllerRepresentedObject

- (GCTVSettingsControllerRepresentedObject)initWithPrefsStore:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = &OBJC_CLASS___GCTVSettingsControllerRepresentedObject;
  v6 = -[GCTVSettingsControllerRepresentedObject init](&v21, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    appsWithSettings = v6->_appsWithSettings;
    v6->_appsWithSettings = (NSDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    appsWithoutSettings = v6->_appsWithoutSettings;
    v6->_appsWithoutSettings = (NSDictionary *)v9;

    id v11 = sub_EA9C(@"PROFILE_NAME_FIELD_DEFAULT_VALUE");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    createNewProfileName = v6->_createNewProfileName;
    v6->_createNewProfileName = (NSString *)v12;

    objc_storeStrong((id *)&v6->_prefsStore, a3);
    v14 = objc_opt_new(&OBJC_CLASS___NSArray);
    profiles = v6->_profiles;
    v6->_profiles = v14;

    wrappedDefaultGame = v6->_wrappedDefaultGame;
    v6->_wrappedDefaultGame = (NSArray *)&__NSArray0__struct;

    wrappedGamesWithProfile = v6->_wrappedGamesWithProfile;
    v6->_wrappedGamesWithProfile = (NSArray *)&__NSArray0__struct;

    wrappedGamesWithoutProfile = v6->_wrappedGamesWithoutProfile;
    v6->_wrappedGamesWithoutProfile = (NSArray *)&__NSArray0__struct;

    wrappedCopilotFusedController = v6->_wrappedCopilotFusedController;
    v6->_wrappedCopilotFusedController = (NSArray *)&__NSArray0__struct;

    -[GCTVSettingsControllerRepresentedObject loadFindControllerPattern](v6, "loadFindControllerPattern");
  }

  return v6;
}

- (void)filterSupportedApps
{
  if (self->_controller)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
    [v3 setFilter:&stru_4CA10];
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v4 appInfos]);

    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id obj = v3;
    id v5 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v66;
      uint64_t v47 = *(void *)v66;
      do
      {
        v8 = 0LL;
        id v48 = v6;
        do
        {
          if (*(void *)v66 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
          if (v10)
          {
            id v51 = v9;
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedGameControllers]);
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id v12 = v11;
            id v13 = [v12 countByEnumeratingWithState:&v61 objects:v71 count:16];
            v14 = v12;
            if (v13)
            {
              id v15 = v13;
              v50 = v10;
              uint64_t v16 = *(void *)v62;
              while (2)
              {
                for (i = 0LL; i != v15; i = (char *)i + 1)
                {
                  if (*(void *)v62 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  id v18 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)i) objectForKey:@"ProfileName" ofClass:objc_opt_class(NSString)];
                  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
                  unsigned __int8 v20 = [v19 isEqualToString:@"ExtendedGamepad"];

                  if ((v20 & 1) != 0)
                  {

                    v10 = v50;
                    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v50]);
                    v14 = v21;
                    if (v21 && ([v21 isHidden] & 1) == 0)
                    {
                      prefsStore = self->_prefsStore;
                      v23 = (void *)objc_claimAutoreleasedReturnValue([v51 bundleIdentifier]);
                      v24 = (void *)objc_claimAutoreleasedReturnValue( -[GCSPreferencesStore gameWithBundleIdentifier:controller:]( prefsStore,  "gameWithBundleIdentifier:controller:",  v23,  self->_controller));

                      if (v24) {
                        v25 = v43;
                      }
                      else {
                        v25 = v44;
                      }
                      [v25 addObject:v51];
                    }

                    uint64_t v7 = v47;
                    id v6 = v48;
                    goto LABEL_24;
                  }
                }

                id v15 = [v12 countByEnumeratingWithState:&v61 objects:v71 count:16];
                if (v15) {
                  continue;
                }
                break;
              }

              v14 = v12;
              uint64_t v7 = v47;
              id v6 = v48;
              v10 = v50;
            }

- (void)updateCopilotFusedControllers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4108;
  v5[3] = &unk_4CA38;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)updateGames:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_44D4;
  v4[3] = &unk_4CA38;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)updateProfiles:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4B24;
  v5[3] = &unk_4CA38;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)loadFindControllerPattern
{
  id v3 = sub_EA28();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[NSDataAsset initWithName:bundle:]( objc_alloc(&OBJC_CLASS___NSDataAsset),  "initWithName:bundle:",  @"AHAP/connect",  v4);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDataAsset data](v5, "data"));
    id v17 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v17));
    id v9 = v17;

    if (v9)
    {
      id GCSettingsLogger = getGCSettingsLogger();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_3A5D4((uint64_t)v9, v11);
      }
    }

    else
    {
      id v16 = 0LL;
      id v12 = -[CHHapticPattern initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___CHHapticPattern),  "initWithDictionary:error:",  v8,  &v16);
      id v11 = (os_log_s *)v16;
      findControllerPattern = self->_findControllerPattern;
      self->_findControllerPattern = v12;

      if (v11)
      {
        id v14 = getGCSettingsLogger();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_3A574();
        }
      }
    }
  }
}

- (void)findController
{
  device = self->_device;
  if (device)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCController haptics](device, "haptics"));

    if (v4)
    {
      if (self->_findControllerPattern)
      {
        if (!self->_engine)
        {
          id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCController haptics](self->_device, "haptics"));
          id v6 = (CHHapticEngine *)objc_claimAutoreleasedReturnValue([v5 createEngineWithLocality:GCHapticsLocalityDefault]);
          engine = self->_engine;
          self->_engine = v6;
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCAnalytics instance](&OBJC_CLASS___GCAnalytics, "instance"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCController productCategory](self->_device, "productCategory"));
        [v8 sendSettingsIdentifyControllerEventForProductCategory:v9];

        id GCSettingsLogger = getGCSettingsLogger();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsControllerRepresentedObject device](self, "device"));
          *(_DWORD *)buf = 138412290;
          v33 = v12;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Begin find controller: %@", buf, 0xCu);
        }

        -[GCTVSettingsControllerRepresentedObject setFindingController:](self, "setFindingController:", 1LL);
        id v13 = self->_engine;
        id v31 = 0LL;
        -[CHHapticEngine startAndReturnError:](v13, "startAndReturnError:", &v31);
        id v14 = v31;
        if (v14)
        {
          id v15 = getGCSettingsLogger();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_3A718();
          }

          -[GCTVSettingsControllerRepresentedObject setFindingController:](self, "setFindingController:", 0LL);
          goto LABEL_20;
        }

        id v17 = self->_engine;
        findControllerPattern = self->_findControllerPattern;
        id v30 = 0LL;
        v19 = (void *)objc_claimAutoreleasedReturnValue( -[CHHapticEngine createPlayerWithPattern:error:]( v17,  "createPlayerWithPattern:error:",  findControllerPattern,  &v30));
        id v20 = v30;
        if (v20)
        {
          objc_super v21 = v20;
          id v22 = getGCSettingsLogger();
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_3A6B8();
          }
        }

        else
        {
          id v29 = 0LL;
          [v19 startAtTime:&v29 error:0.0];
          id v24 = v29;
          if (!v24)
          {
            -[CHHapticPattern duration](self->_findControllerPattern, "duration");
            dispatch_time_t v27 = dispatch_time(0LL, (uint64_t)((v26 + 0.100000001) * 1000000000.0));
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472LL;
            v28[2] = sub_50C8;
            v28[3] = &unk_4CAA0;
            v28[4] = self;
            dispatch_after(v27, &_dispatch_main_q, v28);
            goto LABEL_19;
          }

          objc_super v21 = v24;
          id v25 = getGCSettingsLogger();
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_3A658();
          }
        }

        -[GCTVSettingsControllerRepresentedObject setFindingController:](self, "setFindingController:", 0LL);
LABEL_19:

LABEL_20:
      }
    }
  }

- (GCController)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (GCSController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (CHHapticEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (_TtC24GameControllerTVSettings19GCSPreferencesStore)prefsStore
{
  return self->_prefsStore;
}

- (void)setPrefsStore:(id)a3
{
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (BOOL)findingController
{
  return self->_findingController;
}

- (void)setFindingController:(BOOL)a3
{
  self->_findingController = a3;
}

- (NSDictionary)appsWithSettings
{
  return self->_appsWithSettings;
}

- (void)setAppsWithSettings:(id)a3
{
}

- (NSDictionary)appsWithoutSettings
{
  return self->_appsWithoutSettings;
}

- (void)setAppsWithoutSettings:(id)a3
{
}

- (NSString)createNewProfileName
{
  return self->_createNewProfileName;
}

- (void)setCreateNewProfileName:(id)a3
{
}

- (NSArray)wrappedDefaultGame
{
  return self->_wrappedDefaultGame;
}

- (void)setWrappedDefaultGame:(id)a3
{
}

- (NSArray)wrappedGamesWithProfile
{
  return self->_wrappedGamesWithProfile;
}

- (void)setWrappedGamesWithProfile:(id)a3
{
}

- (NSArray)wrappedGamesWithoutProfile
{
  return self->_wrappedGamesWithoutProfile;
}

- (void)setWrappedGamesWithoutProfile:(id)a3
{
}

- (NSArray)wrappedCopilotFusedController
{
  return self->_wrappedCopilotFusedController;
}

- (void)setWrappedCopilotFusedController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end