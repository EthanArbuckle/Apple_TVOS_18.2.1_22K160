@interface TVSettingsBackgroundAppRefreshFacade
+ (id)_allowedSystemApps;
+ (id)sharedInstance;
- (BOOL)backgroundAppRefreshEnabled;
- (BOOL)needsUpdate;
- (NSArray)backgroundAppRefreshSettings;
- (TVSettingsBackgroundAppRefreshFacade)init;
- (id)backgroundAppRefreshSettingForIdentifier:(id)a3;
- (os_unfair_lock_s)updateLock;
- (void)_updateApps;
- (void)_updateAppsCoalesced;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)setBackgroundAppRefreshEnabled:(BOOL)a3;
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation TVSettingsBackgroundAppRefreshFacade

+ (id)sharedInstance
{
  if (qword_1001E1618 != -1) {
    dispatch_once(&qword_1001E1618, &stru_10018F6D0);
  }
  return (id)qword_1001E1610;
}

+ (id)_allowedSystemApps
{
  if (qword_1001E1628 != -1) {
    dispatch_once(&qword_1001E1628, &stru_10018F6F0);
  }
  return (id)qword_1001E1620;
}

- (TVSettingsBackgroundAppRefreshFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade;
  v2 = -[TVSettingsBackgroundAppRefreshFacade init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_updateLock._os_unfair_lock_opaque = 0;
    -[TVSettingsBackgroundAppRefreshFacade _updateApps](v2, "_updateApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v4 addObserver:v3];
  }

  return v3;
}

- (id)backgroundAppRefreshSettingForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsBackgroundAppRefreshFacade backgroundAppRefreshSettings]( self,  "backgroundAppRefreshSettings",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)setBackgroundAppRefreshEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 setAutomaticAppUpdatesAllowed:v3];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isAutomaticAppUpdatesAllowed]));
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Set background app refresh to %@",  (uint8_t *)&v7,  0xCu);
  }

- (BOOL)backgroundAppRefreshEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isAutomaticAppUpdatesAllowed];

  return v3;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
}

- (void)_updateApps
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appInfos]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027C14;
  v9[3] = &unk_10018F718;
  v9[4] = self;
  v10 = v3;
  v8 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  -[TVSettingsBackgroundAppRefreshFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"backgroundAppRefreshSettings");
  id v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));
  backgroundAppRefreshSettings = self->_backgroundAppRefreshSettings;
  self->_backgroundAppRefreshSettings = v6;

  -[TVSettingsBackgroundAppRefreshFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"backgroundAppRefreshSettings");
}

- (void)_updateAppsCoalesced
{
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  -[TVSettingsBackgroundAppRefreshFacade setNeedsUpdate:](self, "setNeedsUpdate:", 1LL);
  os_unfair_lock_unlock(p_updateLock);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100027D78;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSArray)backgroundAppRefreshSettings
{
  return self->_backgroundAppRefreshSettings;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (os_unfair_lock_s)updateLock
{
  return self->_updateLock;
}

- (void).cxx_destruct
{
}

@end