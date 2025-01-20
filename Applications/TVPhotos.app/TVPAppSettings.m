@interface TVPAppSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)enableContentFiltering;
- (BOOL)enableInternalSettings;
- (BOOL)enablePhotosTab;
- (BOOL)replaceMemoriesFeed;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setEnableContentFiltering:(BOOL)a3;
- (void)setEnableInternalSettings:(BOOL)a3;
- (void)setEnablePhotosTab:(BOOL)a3;
- (void)setReplaceMemoriesFeed:(BOOL)a3;
@end

@implementation TVPAppSettings

+ (id)sharedInstance
{
  if (qword_100103360 != -1) {
    dispatch_once(&qword_100103360, &stru_1000CC380);
  }
  return (id)qword_100103358;
}

- (id)parentSettings
{
  return +[TVPRootSettings sharedInstance](&OBJC_CLASS___TVPRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPAppSettings;
  id v3 = -[TVPAppSettings setDefaultValues](&v5, "setDefaultValues");
  else {
    uint64_t v4 = 0LL;
  }
  -[TVPAppSettings setEnableInternalSettings:](self, "setEnableInternalSettings:", v4);
  -[TVPAppSettings setEnableContentFiltering:](self, "setEnableContentFiltering:", 0LL);
  -[TVPAppSettings setEnablePhotosTab:](self, "setEnablePhotosTab:", 1LL);
  -[TVPAppSettings setReplaceMemoriesFeed:](self, "setReplaceMemoriesFeed:", 0LL);
}

+ (id)settingsControllerModule
{
  v2 = NSStringFromSelector("enableContentFiltering");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueKeyPath:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueKeyPath:",  @"Enable Content Filtering",  v3));
  v17[0] = v4;
  objc_super v5 = NSStringFromSelector("enablePhotosTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueKeyPath:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueKeyPath:",  @"Enable Library Tab",  v6));
  v17[1] = v7;
  v8 = NSStringFromSelector("replaceMemoriesFeed");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueKeyPath:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueKeyPath:",  @"Replace Memories Feed",  v9));
  v17[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule sectionWithRows:title:]( &OBJC_CLASS___PTModule,  "sectionWithRows:title:",  v11,  @"Settings"));

  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithTitle:contents:]( &OBJC_CLASS___PTModule,  "moduleWithTitle:contents:",  @"Settings",  v13));

  return v14;
}

- (BOOL)enableInternalSettings
{
  return self->_enableInternalSettings;
}

- (void)setEnableInternalSettings:(BOOL)a3
{
  self->_enableInternalSettings = a3;
}

- (BOOL)enableContentFiltering
{
  return self->_enableContentFiltering;
}

- (void)setEnableContentFiltering:(BOOL)a3
{
  self->_enableContentFiltering = a3;
}

- (BOOL)enablePhotosTab
{
  return self->_enablePhotosTab;
}

- (void)setEnablePhotosTab:(BOOL)a3
{
  self->_enablePhotosTab = a3;
}

- (BOOL)replaceMemoriesFeed
{
  return self->_replaceMemoriesFeed;
}

- (void)setReplaceMemoriesFeed:(BOOL)a3
{
  self->_replaceMemoriesFeed = a3;
}

@end