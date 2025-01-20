@interface TVSettingsBackgroundAppRefreshSettings
- (BOOL)allowsBackgroundAppRefresh;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (TVSettingsBackgroundAppRefreshSettings)initWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)setAllowsBackgroundAppRefresh:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TVSettingsBackgroundAppRefreshSettings

- (TVSettingsBackgroundAppRefreshSettings)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsBackgroundAppRefreshSettings;
  v6 = -[TVSettingsBackgroundAppRefreshSettings init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBackgroundAppRefreshSettings identifier](self, "identifier"));
    unsigned __int8 v8 = [v6 isEqual:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBackgroundAppRefreshSettings identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appInfos]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:self->_identifier]);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
    unsigned __int8 v8 = self->_displayName;
    self->_displayName = v7;

    displayName = self->_displayName;
  }

  return displayName;
}

- (void)setAllowsBackgroundAppRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBackgroundAppRefreshSettings identifier](self, "identifier"));
    int v12 = 138412546;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Set allows background app refresh to %@ for %@",  (uint8_t *)&v12,  0x16u);
  }

  v7 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  unsigned __int8 v8 = (NSMutableDictionary *)[v7 mutableCopy];

  if (!v8) {
    unsigned __int8 v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBackgroundAppRefreshSettings identifier](self, "identifier"));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v10);

  CFPreferencesSetAppValue(@"KeepAppsUpToDateAppList", v8, @"com.apple.mt");
  CFPreferencesAppSynchronize(@"com.apple.mt");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"kKeepAppsUpToDateEnabledChangedNotification",  0LL,  0LL,  1u);
}

- (BOOL)allowsBackgroundAppRefresh
{
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBackgroundAppRefreshSettings identifier](self, "identifier"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

  if (v5) {
    v6 = (void *)v5;
  }
  else {
    v6 = &__kCFBooleanTrue;
  }
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end