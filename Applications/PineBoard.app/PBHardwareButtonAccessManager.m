@interface PBHardwareButtonAccessManager
+ (PBDependencyDescription)dependencyDescription;
+ (PBHardwareButtonAccessManager)sharedInstance;
- (NSString)appWithExclusivePlayPauseButtonAccess;
- (NSString)appWithVolumeButtonAccess;
- (PBHardwareButtonAccessManager)init;
- (void)_updateAppButtonAccess;
- (void)_updateApplicationState:(id)a3;
- (void)_updateApplicationStateForBundleIdentifier:(id)a3;
- (void)applicationProcessStateMonitor:(id)a3 updatedProcessState:(id)a4;
- (void)dealloc;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)setAppWithExclusivePlayPauseButtonAccess:(id)a3;
- (void)setAppWithVolumeButtonAccess:(id)a3;
- (void)setExclusivePlayPauseButtonAccessEnabled:(BOOL)a3 forApp:(id)a4;
- (void)setVolumeButtonAccessEnabled:(BOOL)a3 forApp:(id)a4;
@end

@implementation PBHardwareButtonAccessManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001CE468;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (PBHardwareButtonAccessManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CE500;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471398 != -1) {
    dispatch_once(&qword_100471398, block);
  }
  return (PBHardwareButtonAccessManager *)(id)qword_100471390;
}

- (PBHardwareButtonAccessManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBHardwareButtonAccessManager;
  v2 = -[PBHardwareButtonAccessManager init](&v18, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.PineBoard.hardwareButtonAccessManager", "HardwareButtonAccess");
    logObject = v2->_logObject;
    v2->_logObject = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    appsWithVolumeButtonAccess = v2->_appsWithVolumeButtonAccess;
    v2->_appsWithVolumeButtonAccess = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    appsWithExclusivePlayPauseButtonAccess = v2->_appsWithExclusivePlayPauseButtonAccess;
    v2->_appsWithExclusivePlayPauseButtonAccess = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    suspendedAppsWithVolumeButtonAccess = v2->_suspendedAppsWithVolumeButtonAccess;
    v2->_suspendedAppsWithVolumeButtonAccess = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    suspendedAppsWithExclusivePlayPauseButtonAccess = v2->_suspendedAppsWithExclusivePlayPauseButtonAccess;
    v2->_suspendedAppsWithExclusivePlayPauseButtonAccess = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___PBApplicationProcessStateMonitor);
    applicationStateMonitor = v2->_applicationStateMonitor;
    v2->_applicationStateMonitor = v13;

    -[PBApplicationProcessStateMonitor setDelegate:](v2->_applicationStateMonitor, "setDelegate:", v2);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001CE660;
    v16[3] = &unk_1003D0FA8;
    v17 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v17,  v16);
  }

  return v2;
}

- (void)dealloc
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v3 removeObserver:self];

  -[PBApplicationProcessStateMonitor invalidate](self->_applicationStateMonitor, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBHardwareButtonAccessManager;
  -[PBHardwareButtonAccessManager dealloc](&v4, "dealloc");
}

- (void)setVolumeButtonAccessEnabled:(BOOL)a3 forApp:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[PBHardwareButtonAccessManager setVolumeButtonAccessEnabled:forApp:]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  logObject,  OS_LOG_TYPE_DEFAULT,  "%s enabled:%d app:%@",  (uint8_t *)&v12,  0x1Cu);
  }

  -[NSMutableSet removeObject:](self->_suspendedAppsWithVolumeButtonAccess, "removeObject:", v6);
  -[NSMutableOrderedSet removeObject:](self->_appsWithVolumeButtonAccess, "removeObject:", v6);
  applicationStateMonitor = self->_applicationStateMonitor;
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationProcessStateMonitor applicationStateForBundleIdentifier:]( applicationStateMonitor,  "applicationStateForBundleIdentifier:",  v6));
    if (([v9 isForegroundVisible] & 1) != 0
      || (focusedSceneBundleIdentifier = self->_focusedSceneBundleIdentifier,
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]),
          LOBYTE(focusedSceneBundleIdentifier) = -[NSString isEqualToString:]( focusedSceneBundleIdentifier,  "isEqualToString:",  v11),  v11,  (focusedSceneBundleIdentifier & 1) != 0)
      || [v9 isViewService])
    {
      -[NSMutableOrderedSet insertObject:atIndex:](self->_appsWithVolumeButtonAccess, "insertObject:atIndex:", v6, 0LL);
    }

    else
    {
      -[NSMutableSet addObject:](self->_suspendedAppsWithVolumeButtonAccess, "addObject:", v6);
    }

    -[PBApplicationProcessStateMonitor addBundleIdentifier:](self->_applicationStateMonitor, "addBundleIdentifier:", v6);
  }

  else
  {
    -[PBApplicationProcessStateMonitor removeBundleIdentifier:](applicationStateMonitor, "removeBundleIdentifier:", v6);
  }

  -[PBHardwareButtonAccessManager _updateAppButtonAccess](self, "_updateAppButtonAccess");
}

- (void)setExclusivePlayPauseButtonAccessEnabled:(BOOL)a3 forApp:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[PBHardwareButtonAccessManager setExclusivePlayPauseButtonAccessEnabled:forApp:]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  logObject,  OS_LOG_TYPE_DEFAULT,  "%s enabled:%d app:%@",  (uint8_t *)&v12,  0x1Cu);
  }

  -[NSMutableOrderedSet removeObject:](self->_appsWithExclusivePlayPauseButtonAccess, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_suspendedAppsWithExclusivePlayPauseButtonAccess, "removeObject:", v6);
  applicationStateMonitor = self->_applicationStateMonitor;
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationProcessStateMonitor applicationStateForBundleIdentifier:]( applicationStateMonitor,  "applicationStateForBundleIdentifier:",  v6));
    if (([v9 isForegroundVisible] & 1) != 0
      || (focusedSceneBundleIdentifier = self->_focusedSceneBundleIdentifier,
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]),
          LOBYTE(focusedSceneBundleIdentifier) = -[NSString isEqualToString:]( focusedSceneBundleIdentifier,  "isEqualToString:",  v11),  v11,  (focusedSceneBundleIdentifier & 1) != 0)
      || [v9 isViewService])
    {
      -[NSMutableOrderedSet insertObject:atIndex:]( self->_appsWithExclusivePlayPauseButtonAccess,  "insertObject:atIndex:",  v6,  0LL);
    }

    else
    {
      -[NSMutableSet addObject:](self->_suspendedAppsWithExclusivePlayPauseButtonAccess, "addObject:", v6);
    }

    -[PBApplicationProcessStateMonitor addBundleIdentifier:](self->_applicationStateMonitor, "addBundleIdentifier:", v6);
  }

  else
  {
    -[PBApplicationProcessStateMonitor removeBundleIdentifier:](applicationStateMonitor, "removeBundleIdentifier:", v6);
  }

  -[PBHardwareButtonAccessManager _updateAppButtonAccess](self, "_updateAppButtonAccess");
}

- (void)_updateApplicationState:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  else {
    unsigned int v6 = [v5 isEqualToString:self->_focusedSceneBundleIdentifier];
  }
  unsigned int v7 = [v4 isViewService];
  unsigned int v8 = [v4 isTerminated];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
  unsigned int v10 = [v9 isActive];

  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v20 = "-[PBHardwareButtonAccessManager _updateApplicationState:]";
    __int16 v21 = 2112;
    v22 = v5;
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    __int16 v25 = 1024;
    unsigned int v26 = v7;
    __int16 v27 = 1024;
    unsigned int v28 = v8;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  logObject,  OS_LOG_TYPE_DEBUG,  "%s:%@ isForeground:%d isRunningAsViewService:%d isTerminated:%d isAppSwitcherActive:%d",  buf,  0x2Eu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CEC38;
  block[3] = &unk_1003DBF10;
  char v15 = v8;
  block[4] = self;
  id v14 = v5;
  char v16 = v6;
  char v17 = v10;
  char v18 = v7;
  id v12 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateApplicationStateForBundleIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationProcessStateMonitor applicationStateForBundleIdentifier:]( self->_applicationStateMonitor,  "applicationStateForBundleIdentifier:"));
    -[PBHardwareButtonAccessManager _updateApplicationState:](self, "_updateApplicationState:", v4);
  }

- (void)_updateAppButtonAccess
{
  os_log_t v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_appsWithExclusivePlayPauseButtonAccess, "firstObject"));
  id v4 = v3;
  if (v3 != self->_appWithExclusivePlayPauseButtonAccess
    && (-[NSString isEqual:](v3, "isEqual:") & 1) == 0)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  logObject,  OS_LOG_TYPE_DEFAULT,  "*Updated* Play/Pause override: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[PBHardwareButtonAccessManager setAppWithExclusivePlayPauseButtonAccess:]( self,  "setAppWithExclusivePlayPauseButtonAccess:",  v4);
  }

  unsigned int v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_appsWithVolumeButtonAccess, "firstObject"));
  unsigned int v7 = v6;
  if (v6 != self->_appWithVolumeButtonAccess && (-[NSString isEqual:](v6, "isEqual:") & 1) == 0)
  {
    unsigned int v8 = self->_logObject;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "*Updated* Volume override: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[PBHardwareButtonAccessManager setAppWithVolumeButtonAccess:](self, "setAppWithVolumeButtonAccess:", v7);
  }
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  p_focusedSceneBundleIdentifier = &self->_focusedSceneBundleIdentifier;
  unsigned int v8 = self->_focusedSceneBundleIdentifier;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([a5 clientProcessBundleIdentifier]);
  objc_storeStrong((id *)p_focusedSceneBundleIdentifier, v9);
  unsigned int v10 = (os_log_s *)*(p_focusedSceneBundleIdentifier - 5);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10028FAA4((uint64_t *)p_focusedSceneBundleIdentifier, v10);
  }
  -[PBHardwareButtonAccessManager _updateApplicationStateForBundleIdentifier:]( self,  "_updateApplicationStateForBundleIdentifier:",  v8);
  -[PBHardwareButtonAccessManager _updateApplicationStateForBundleIdentifier:]( self,  "_updateApplicationStateForBundleIdentifier:",  v9);
}

- (void)applicationProcessStateMonitor:(id)a3 updatedProcessState:(id)a4
{
}

- (NSString)appWithVolumeButtonAccess
{
  return self->_appWithVolumeButtonAccess;
}

- (void)setAppWithVolumeButtonAccess:(id)a3
{
}

- (NSString)appWithExclusivePlayPauseButtonAccess
{
  return self->_appWithExclusivePlayPauseButtonAccess;
}

- (void)setAppWithExclusivePlayPauseButtonAccess:(id)a3
{
}

- (void).cxx_destruct
{
}

@end