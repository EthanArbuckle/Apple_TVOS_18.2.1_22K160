@interface TVSettingsUsageFacade
+ (void)initialize;
- (BOOL)loadingInstalledApps;
- (BOOL)useSpaceAttribution;
- (NSArray)installedUserApps;
- (NSNumber)totalAppStorage;
- (NSNumber)usedAppStorage;
- (SAAppSizer)appSizer;
- (TVSettingsUsageFacade)init;
- (void)_fetchAppUsageInfo;
- (void)_fetchAppUsageInfoLS;
- (void)_fetchAppUsageInfoSA;
- (void)dealloc;
- (void)setAppSizer:(id)a3;
- (void)setInstalledUserApps:(id)a3;
- (void)setLoadingInstalledApps:(BOOL)a3;
- (void)setUseSpaceAttribution:(BOOL)a3;
- (void)setUsedAppStorage:(id)a3;
- (void)uninstallApp:(id)a3;
@end

@implementation TVSettingsUsageFacade

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVSettingsUsageFacade) == a1)
  {
    v2 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"com.apple.fakeapp.System",  @"com.apple.fakeapp.SystemData",  @"com.apple.fakeapp.SoftwareUpdate",  @"com.apple.fakeapp.SyncedContent",  @"com.apple.FileProvider.LocalStorage",  @"com.apple.Bridge",  @"com.apple.MobileAsset.SystemEnvironmentAsset",  0LL);
    v3 = (void *)qword_1001E1950;
    qword_1001E1950 = (uint64_t)v2;
  }

- (TVSettingsUsageFacade)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsUsageFacade;
  v2 = -[TVSettingsUsageFacade init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    usedAppStorage = v2->_usedAppStorage;
    v2->_usedAppStorage = (NSNumber *)&off_1001AD530;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[TVSDevice applicationCapacity](&OBJC_CLASS___TVSDevice, "applicationCapacity")));
    totalAppStorage = v3->_totalAppStorage;
    v3->_totalAppStorage = (NSNumber *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.tvsettings.disk_usage", 0LL);
    usage_queue = v3->_usage_queue;
    v3->_usage_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
    v3->_useSpaceAttribution = [v9 supportsEnhancedAPFS];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v10 addObserver:v3];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  [v3 removeObserver:self];

  -[SAAppSizer stopObserving](self->_appSizer, "stopObserving");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsUsageFacade;
  -[TVSettingsUsageFacade dealloc](&v4, "dealloc");
}

- (NSArray)installedUserApps
{
  if (!self->_installedUserApps && !-[TVSettingsUsageFacade loadingInstalledApps](self, "loadingInstalledApps"))
  {
    -[TVSettingsUsageFacade setLoadingInstalledApps:](self, "setLoadingInstalledApps:", 1LL);
    -[TVSettingsUsageFacade _fetchAppUsageInfo](self, "_fetchAppUsageInfo");
  }

  return self->_installedUserApps;
}

- (void)uninstallApp:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lsRecord]);
    id v8 = objc_alloc_init(&OBJC_CLASS___IXUninstallOptions);
    [v8 setRequestUserConfirmation:1];
    if (([v7 isPlaceholder] & 1) == 0)
    {
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v10 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v9];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10008EB98;
    v13[3] = &unk_1001925D0;
    id v14 = v9;
    id v11 = v9;
    +[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithIdentity:options:completion:",  v10,  v8,  v13);
  }

  else
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"app != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F993C(a2, (uint64_t)self, (uint64_t)v12);
    }
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

- (void)_fetchAppUsageInfo
{
  if (self->_useSpaceAttribution) {
    -[TVSettingsUsageFacade _fetchAppUsageInfoSA](self, "_fetchAppUsageInfoSA");
  }
  else {
    -[TVSettingsUsageFacade _fetchAppUsageInfoLS](self, "_fetchAppUsageInfoLS");
  }
}

- (void)_fetchAppUsageInfoSA
{
  appSizer = self->_appSizer;
  if (appSizer)
  {
    -[SAAppSizer stopObserving](appSizer, "stopObserving");
    objc_super v4 = self->_appSizer;
    self->_appSizer = 0LL;
  }

  id v5 = objc_opt_new(&OBJC_CLASS___SAAppSizer);
  v6 = self->_appSizer;
  self->_appSizer = v5;

  objc_initWeak(&location, self);
  dispatch_queue_t v7 = self->_appSizer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008ED70;
  v8[3] = &unk_100192648;
  objc_copyWeak(&v9, &location);
  -[SAAppSizer startObservingWithUpdateHandler:](v7, "startObservingWithUpdateHandler:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_fetchAppUsageInfoLS
{
  usage_queue = (dispatch_queue_s *)self->_usage_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008F3F0;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(usage_queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSNumber)usedAppStorage
{
  return self->_usedAppStorage;
}

- (void)setUsedAppStorage:(id)a3
{
}

- (NSNumber)totalAppStorage
{
  return self->_totalAppStorage;
}

- (BOOL)loadingInstalledApps
{
  return self->_loadingInstalledApps;
}

- (void)setLoadingInstalledApps:(BOOL)a3
{
  self->_loadingInstalledApps = a3;
}

- (void)setInstalledUserApps:(id)a3
{
}

- (BOOL)useSpaceAttribution
{
  return self->_useSpaceAttribution;
}

- (void)setUseSpaceAttribution:(BOOL)a3
{
  self->_useSpaceAttribution = a3;
}

- (SAAppSizer)appSizer
{
  return self->_appSizer;
}

- (void)setAppSizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end