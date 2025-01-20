@interface PBFullDisplaySceneManager
+ (BOOL)_isProcessPinnedToFullDisplay:(id)a3;
+ (BOOL)_sceneClientSettingsResolveToWantingFullDisplay:(id)a3;
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)bundleIdWantsFullDisplay:(id)a3;
- (BSInvalidatable)stateCaptureHandle;
- (NSMutableSet)bundleIdsWithActiveFullDisplay;
- (PBFullDisplaySceneManager)init;
- (id)stateDumpBuilder;
- (void)_transitionToFullDisplay:(id)a3;
- (void)_transitionToWide:(id)a3;
- (void)_updateScenesActiveWithFullDisplay:(id)a3;
- (void)dealloc;
- (void)sceneManager:(id)a3 didUpdateDisablingFullDisplaySessions:(int64_t)a4 forFocusedScene:(id)a5;
- (void)sceneManager:(id)a3 didUpdatePlaybackControlState:(int64_t)a4 forFocusedScene:(id)a5;
- (void)sceneManager:(id)a3 didUpdateWantsFullDisplaySession:(int64_t)a4 forFocusedScene:(id)a5;
- (void)setBundleIdsWithActiveFullDisplay:(id)a3;
- (void)setStateCaptureHandle:(id)a3;
@end

@implementation PBFullDisplaySceneManager

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10011D5B0;
  v5[3] = &unk_1003CFF78;
  v5[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v5);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBSceneManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v3);

  return v2;
}

+ (id)sharedInstance
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10011D648;
  v3[3] = &unk_1003D32B0;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_100470F98 != -1) {
    dispatch_once(&qword_100470F98, v3);
  }
  return (id)qword_100470F90;
}

+ (BOOL)_isProcessPinnedToFullDisplay:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installedApplicationWithBundleIdentifier:v3]);

  unsigned __int8 v6 = [v5 isPinnedToFullDisplay];
  return v6;
}

- (PBFullDisplaySceneManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBFullDisplaySceneManager;
  v2 = -[PBFullDisplaySceneManager init](&v20, "init");
  id v3 = v2;
  if (v2)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10011D880;
    v18[3] = &unk_1003D0FA8;
    v4 = v2;
    v19 = v4;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v4,  v18);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    bundleIdsWithActiveFullDisplay = v4->_bundleIdsWithActiveFullDisplay;
    v4->_bundleIdsWithActiveFullDisplay = v5;

    objc_initWeak(&location, v4);
    v7 = &_dispatch_main_q;
    v8 = (objc_class *)objc_opt_class(v4);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10011D8E4;
    v15[3] = &unk_1003D04B8;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v10, v15);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    stateCaptureHandle = v4->_stateCaptureHandle;
    v4->_stateCaptureHandle = (BSInvalidatable *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBFullDisplaySceneManager;
  -[PBFullDisplaySceneManager dealloc](&v3, "dealloc");
}

- (BOOL)bundleIdWantsFullDisplay:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 installedApplicationWithBundleIdentifier:v4]);
  unsigned int v7 = [v6 supportsExtendedAspectRatiosForContentPlayback];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBFullDisplaySceneManager bundleIdsWithActiveFullDisplay](self, "bundleIdsWithActiveFullDisplay"));
    unsigned int v9 = [v8 containsObject:v4];

    unsigned int v10 = v9 | [(id)objc_opt_class(self) _isProcessPinnedToFullDisplay:v4];
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)_updateScenesActiveWithFullDisplay:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcessBundleIdentifier]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedApplicationWithBundleIdentifier:v5]);
  unsigned int v8 = [v7 supportsExtendedAspectRatiosForContentPlayback];

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBFullDisplaySceneManager bundleIdsWithActiveFullDisplay](self, "bundleIdsWithActiveFullDisplay"));
    unsigned int v10 = [v9 containsObject:v5];

    unsigned int v11 = [(id)objc_opt_class(self) _sceneClientSettingsResolveToWantingFullDisplay:v4];
    int v12 = v10 ^ 1;
    v13 = (void *)objc_opt_class(self);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcessBundleIdentifier]);
    unsigned int v15 = [v13 _isProcessPinnedToFullDisplay:v14];

    id v16 = sub_1000F7924();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v20 = 138543874;
      v21 = v18;
      __int16 v22 = 1024;
      unsigned int v23 = v10;
      __int16 v24 = 1024;
      unsigned int v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Scene('%{public}@') currentSceneActiveWithFullDisplay: %{BOOL}d, updateWantsFullDisplay: %{BOOL}d",  (uint8_t *)&v20,  0x18u);
    }

    if (((v12 | v11 | v15) & 1) == 0)
    {
      -[PBFullDisplaySceneManager _transitionToWide:](self, "_transitionToWide:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[PBFullDisplaySceneManager bundleIdsWithActiveFullDisplay]( self,  "bundleIdsWithActiveFullDisplay"));
      [v19 removeObject:v5];
      goto LABEL_8;
    }

    if ((v12 & v11) != 0)
    {
      -[PBFullDisplaySceneManager _transitionToFullDisplay:](self, "_transitionToFullDisplay:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[PBFullDisplaySceneManager bundleIdsWithActiveFullDisplay]( self,  "bundleIdsWithActiveFullDisplay"));
      [v19 addObject:v5];
LABEL_8:
    }
  }
}

- (void)sceneManager:(id)a3 didUpdatePlaybackControlState:(int64_t)a4 forFocusedScene:(id)a5
{
  id v7 = a5;
  id v8 = sub_1000F7924();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    int v11 = 138543618;
    int v12 = v10;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scene('%{public}@').didUpdatePlaybackControlState: %ld",  (uint8_t *)&v11,  0x16u);
  }

  -[PBFullDisplaySceneManager _updateScenesActiveWithFullDisplay:](self, "_updateScenesActiveWithFullDisplay:", v7);
}

- (void)sceneManager:(id)a3 didUpdateWantsFullDisplaySession:(int64_t)a4 forFocusedScene:(id)a5
{
  id v7 = a5;
  id v8 = sub_1000F7924();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    int v11 = 138543618;
    int v12 = v10;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scene(%{public}@').didUpdateWantsFullDisplaySession: %ld",  (uint8_t *)&v11,  0x16u);
  }

  -[PBFullDisplaySceneManager _updateScenesActiveWithFullDisplay:](self, "_updateScenesActiveWithFullDisplay:", v7);
}

- (void)sceneManager:(id)a3 didUpdateDisablingFullDisplaySessions:(int64_t)a4 forFocusedScene:(id)a5
{
  id v7 = a5;
  id v8 = sub_1000F7924();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    int v11 = 138543618;
    int v12 = v10;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scene(%{public}@').didUpdateDisablingFullDisplaySessions: %ld",  (uint8_t *)&v11,  0x16u);
  }

  -[PBFullDisplaySceneManager _updateScenesActiveWithFullDisplay:](self, "_updateScenesActiveWithFullDisplay:", v7);
}

- (void)_transitionToWide:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000F7924();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 clientProcessBundleIdentifier]);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Transitioned '%{public}@' to wide aspect ratio",  (uint8_t *)&v7,  0xCu);
  }

  [v3 updateSettingsWithBlock:&stru_1003D83C8];
}

- (void)_transitionToFullDisplay:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000F7924();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Transitioned '%{public}@' to full display",  (uint8_t *)&v7,  0xCu);
  }

  [v3 updateSettingsWithBlock:&stru_1003D83E8];
}

+ (BOOL)_sceneClientSettingsResolveToWantingFullDisplay:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientSettings]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 otherSettings]);

  BOOL v11 = 0;
  if ((BSSettingFlagIsYes([v5 flagForSetting:PBUIDisablingFullDisplaySessionsSettingKey]) & 1) == 0)
  {
    if ((BSSettingFlagIsYes([v5 flagForSetting:PBUIWantsFullDisplaySessionSettingKey]) & 1) != 0
      || (unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 clientSettings]),
          uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIApplicationSceneClientSettings),
          char isKindOfClass = objc_opt_isKindOfClass(v6, v7),
          v6,
          (isKindOfClass & 1) != 0)
      && (unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 clientSettings]),
          id v10 = [v9 playbackControlsState],
          v9,
          v10))
    {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBFullDisplaySceneManager bundleIdsWithActiveFullDisplay](self, "bundleIdsWithActiveFullDisplay"));
  id v5 = [v3 appendCollection:v4 withKey:@"bundleIdsWithActiveFullDisplay" skipIfEmpty:0];

  return v3;
}

- (NSMutableSet)bundleIdsWithActiveFullDisplay
{
  return self->_bundleIdsWithActiveFullDisplay;
}

- (void)setBundleIdsWithActiveFullDisplay:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end