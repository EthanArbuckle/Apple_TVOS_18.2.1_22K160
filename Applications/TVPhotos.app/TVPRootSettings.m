@interface TVPRootSettings
+ (id)_photosUICoreSettings;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (TVPAppSettings)applicationSettings;
- (id)parentSettings;
- (id)reparentedRootSettings;
- (void)createChildren;
- (void)setApplicationSettings:(id)a3;
@end

@implementation TVPRootSettings

+ (id)sharedInstance
{
  if (!qword_100103388)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([a1 createSharedInstance]);
    v4 = (void *)qword_100103388;
    qword_100103388 = v3;
  }

  os_unfair_lock_unlock(&PXSettingsSharedInstanceLock);
  return (id)qword_100103388;
}

- (id)parentSettings
{
  return 0LL;
}

+ (id)settingsControllerModule
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PTDrillDownRow rowWithTitle:childSettingsKeyPath:]( &OBJC_CLASS___PTDrillDownRow,  "rowWithTitle:childSettingsKeyPath:",  @"Application",  @"applicationSettings"));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PXStorySettings sharedInstance](&OBJC_CLASS___PXStorySettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PTDrillDownRow tvp_rowWithTitle:settings:]( &OBJC_CLASS___PTDrillDownRow,  "tvp_rowWithTitle:settings:",  @"Interactive Memories",  v4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _photosUICoreSettings]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedLibrarySettings]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PTDrillDownRow tvp_rowWithTitle:settings:]( &OBJC_CLASS___PTDrillDownRow,  "tvp_rowWithTitle:settings:",  @"Shared Library",  v7));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule sectionWithRows:title:]( &OBJC_CLASS___PTModule,  "sectionWithRows:title:",  v9,  @"Settings"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule px_restoreDefaultsSection](&OBJC_CLASS___PTModule, "px_restoreDefaultsSection"));
  v15[0] = v10;
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithTitle:contents:]( &OBJC_CLASS___PTModule,  "moduleWithTitle:contents:",  @"Photos",  v12));

  return v13;
}

- (void)createChildren
{
  uint64_t v3 = -[TVPAppSettings initWithDefaultValues](objc_alloc(&OBJC_CLASS___TVPAppSettings), "initWithDefaultValues");
  applicationSettings = self->_applicationSettings;
  self->_applicationSettings = v3;
}

+ (id)_photosUICoreSettings
{
  return +[PXRootSettings sharedInstance](&OBJC_CLASS___PXRootSettings, "sharedInstance");
}

- (id)reparentedRootSettings
{
  id v2 = objc_msgSend((id)objc_opt_class(self, a2), "_photosUICoreSettings");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (TVPAppSettings)applicationSettings
{
  return self->_applicationSettings;
}

- (void)setApplicationSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end