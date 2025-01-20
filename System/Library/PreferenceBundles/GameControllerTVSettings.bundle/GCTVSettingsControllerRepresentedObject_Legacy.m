@interface GCTVSettingsControllerRepresentedObject_Legacy
- (BOOL)findingController;
- (CHHapticEngine)engine;
- (GCController)device;
- (GCTVSettingsControllerRepresentedObject_Legacy)init;
- (NSArray)appsWithSettings;
- (NSArray)appsWithoutSettings;
- (NSDictionary)settingsForBundleID;
- (void)findController;
- (void)loadFindControllerPattern;
- (void)setAppsWithSettings:(id)a3;
- (void)setAppsWithoutSettings:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEngine:(id)a3;
- (void)setFindingController:(BOOL)a3;
- (void)setSettingsForBundleID:(id)a3;
@end

@implementation GCTVSettingsControllerRepresentedObject_Legacy

- (GCTVSettingsControllerRepresentedObject_Legacy)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GCTVSettingsControllerRepresentedObject_Legacy;
  v2 = -[GCTVSettingsControllerRepresentedObject_Legacy init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    appsWithSettings = v2->_appsWithSettings;
    v2->_appsWithSettings = (NSArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    appsWithoutSettings = v2->_appsWithoutSettings;
    v2->_appsWithoutSettings = (NSArray *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    settingsForBundleID = v2->_settingsForBundleID;
    v2->_settingsForBundleID = (NSDictionary *)v7;

    -[GCTVSettingsControllerRepresentedObject_Legacy loadFindControllerPattern](v2, "loadFindControllerPattern");
  }

  return v2;
}

- (void)loadFindControllerPattern
{
  id v3 = sub_EA28();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = -[NSDataAsset initWithName:bundle:]( objc_alloc(&OBJC_CLASS___NSDataAsset),  "initWithName:bundle:",  @"AHAP/connect",  v4);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDataAsset data](v5, "data"));
    id v17 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v17));
    id v9 = v17;

    if (v9)
    {
      id GCSettingsLogger = getGCSettingsLogger();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_3A904((uint64_t)v9, v11);
      }
    }

    else
    {
      id v16 = 0LL;
      v12 = -[CHHapticPattern initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___CHHapticPattern),  "initWithDictionary:error:",  v8,  &v16);
      v11 = (os_log_s *)v16;
      findControllerPattern = self->_findControllerPattern;
      self->_findControllerPattern = v12;

      if (v11)
      {
        id v14 = getGCSettingsLogger();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_3A8A4();
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
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCController haptics](device, "haptics"));

    if (v4)
    {
      if (self->_findControllerPattern)
      {
        if (!self->_engine)
        {
          uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCController haptics](self->_device, "haptics"));
          v6 = (CHHapticEngine *)objc_claimAutoreleasedReturnValue([v5 createEngineWithLocality:GCHapticsLocalityDefault]);
          engine = self->_engine;
          self->_engine = v6;
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCAnalytics instance](&OBJC_CLASS___GCAnalytics, "instance"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCController productCategory](self->_device, "productCategory"));
        [v8 sendSettingsIdentifyControllerEventForProductCategory:v9];

        id GCSettingsLogger = getGCSettingsLogger();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsControllerRepresentedObject_Legacy device](self, "device"));
          *(_DWORD *)buf = 138412290;
          v28 = v12;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Begin find controller: %@", buf, 0xCu);
        }

        -[GCTVSettingsControllerRepresentedObject_Legacy setFindingController:](self, "setFindingController:", 1LL);
        v13 = self->_engine;
        id v26 = 0LL;
        -[CHHapticEngine startAndReturnError:](v13, "startAndReturnError:", &v26);
        id v14 = v26;
        if (v14)
        {
          id v15 = getGCSettingsLogger();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_3A9E8();
          }
        }

        else
        {
          id v17 = self->_engine;
          findControllerPattern = self->_findControllerPattern;
          id v25 = 0LL;
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[CHHapticEngine createPlayerWithPattern:error:]( v17,  "createPlayerWithPattern:error:",  findControllerPattern,  &v25));
          id v16 = (os_log_s *)v25;
          if (v16)
          {
            id v20 = getGCSettingsLogger();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_3A988();
            }
          }

          else
          {
            [v19 startAtTime:0 error:0.0];
            -[CHHapticPattern duration](self->_findControllerPattern, "duration");
            dispatch_time_t v23 = dispatch_time(0LL, (uint64_t)((v22 + 0.100000001) * 1000000000.0));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_EFE4;
            block[3] = &unk_4CAA0;
            block[4] = self;
            dispatch_after(v23, &_dispatch_main_q, block);
          }
        }
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

- (CHHapticEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
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

- (NSArray)appsWithSettings
{
  return self->_appsWithSettings;
}

- (void)setAppsWithSettings:(id)a3
{
}

- (NSArray)appsWithoutSettings
{
  return self->_appsWithoutSettings;
}

- (void)setAppsWithoutSettings:(id)a3
{
}

- (NSDictionary)settingsForBundleID
{
  return self->_settingsForBundleID;
}

- (void)setSettingsForBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end