@interface PBKeyboardPlayPauseAccessManager
- (BOOL)isKeyboardOnScreen;
- (BSInvalidatable)stateCaptureHandle;
- (FBScene)currentlyFocusedScene;
- (NSString)appWithKeyboardOnScreen;
- (NSString)focusedSceneBundleIdentifier;
- (PBHardwareButtonAccessManager)hardwareButtonAccessManager;
- (PBKeyboardPlayPauseAccessManager)initWithHardwareButtonAccessManager:(id)a3 sceneManager:(id)a4;
- (PBSceneManager)sceneManager;
- (id)stateDumpBuilder;
- (void)_updateAppWithKeyboardOnScreen:(id)a3;
- (void)dealloc;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)setAppWithKeyboardOnScreen:(id)a3;
- (void)setCurrentlyFocusedScene:(id)a3;
- (void)setFocusedSceneBundleIdentifier:(id)a3;
- (void)setHardwareButtonAccessManager:(id)a3;
- (void)setKeyboardOnScreen:(BOOL)a3;
- (void)setSceneManager:(id)a3;
@end

@implementation PBKeyboardPlayPauseAccessManager

- (PBKeyboardPlayPauseAccessManager)initWithHardwareButtonAccessManager:(id)a3 sceneManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBKeyboardPlayPauseAccessManager;
  v9 = -[PBKeyboardPlayPauseAccessManager init](&v20, "init");
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.PineBoard.keyboardPlayPauseAccessManager", "KeyboardPlayPauseAccessManager");
    logObject = v9->_logObject;
    v9->_logObject = v10;

    objc_storeStrong((id *)&v9->_hardwareButtonAccessManager, a3);
    objc_storeStrong((id *)&v9->_sceneManager, a4);
    -[PBSceneManager addObserver:](v9->_sceneManager, "addObserver:", v9);
    objc_initWeak(&location, v9);
    v12 = &_dispatch_main_q;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000EDE8;
    v17[3] = &unk_1003D04B8;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( &_dispatch_main_q,  @"PBKeyboardPlayPauseAccessManager",  v17);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    stateCaptureHandle = v9->_stateCaptureHandle;
    v9->_stateCaptureHandle = (BSInvalidatable *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBKeyboardPlayPauseAccessManager;
  -[PBKeyboardPlayPauseAccessManager dealloc](&v3, "dealloc");
}

- (void)setAppWithKeyboardOnScreen:(id)a3
{
  id v4 = a3;
  if (!-[NSString isEqualToString:](self->_appWithKeyboardOnScreen, "isEqualToString:", v4))
  {
    v5 = self->_appWithKeyboardOnScreen;
    v6 = (NSString *)[v4 copy];
    appWithKeyboardOnScreen = self->_appWithKeyboardOnScreen;
    self->_appWithKeyboardOnScreen = v6;

    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEBUG)) {
      sub_10026FDE0((uint64_t)v5, (uint64_t)v4, logObject);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBKeyboardPlayPauseAccessManager hardwareButtonAccessManager](self, "hardwareButtonAccessManager"));
    if (v5)
    {
      os_log_t v10 = self->_logObject;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Removing Exclusive Keyboard Play/Pause access for: %@",  (uint8_t *)&v13,  0xCu);
      }

      [v9 setExclusivePlayPauseButtonAccessEnabled:0 forApp:v5];
    }

    if (self->_appWithKeyboardOnScreen)
    {
      v11 = self->_logObject;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_appWithKeyboardOnScreen;
        int v13 = 138412290;
        uint64_t v14 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Taking Exclusive Keyboard Play/Pause access for: %@",  (uint8_t *)&v13,  0xCu);
      }

      [v9 setExclusivePlayPauseButtonAccessEnabled:1 forApp:self->_appWithKeyboardOnScreen];
    }
  }
}

- (void)setCurrentlyFocusedScene:(id)a3
{
  v5 = (FBScene *)a3;
  currentlyFocusedScene = self->_currentlyFocusedScene;
  if (currentlyFocusedScene != v5)
  {
    -[FBScene removeObserver:](currentlyFocusedScene, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentlyFocusedScene, a3);
    -[FBScene addObserver:](self->_currentlyFocusedScene, "addObserver:", self);
    -[PBKeyboardPlayPauseAccessManager _updateAppWithKeyboardOnScreen:]( self,  "_updateAppWithKeyboardOnScreen:",  @"New Focused Scene");
  }
}

- (void)_updateAppWithKeyboardOnScreen:(id)a3
{
  id v4 = a3;
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  logObject,  OS_LOG_TYPE_DEFAULT,  "Starting update for app with keyboard on screen with reason: %@",  (uint8_t *)&v11,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBKeyboardPlayPauseAccessManager sceneManager](self, "sceneManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 focusedSceneHandle]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiClientSettings]);
  unsigned int v9 = [v8 systemInputActive];

  if (v9)
  {
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcessBundleIdentifier]);
    -[PBKeyboardPlayPauseAccessManager setAppWithKeyboardOnScreen:](self, "setAppWithKeyboardOnScreen:", v10);
  }

  else
  {
    -[PBKeyboardPlayPauseAccessManager setAppWithKeyboardOnScreen:](self, "setAppWithKeyboardOnScreen:", 0LL);
  }
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a5;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([a4 settingsByApplyingToMutableCopyOfSettings:v8]);
  if ([v9 isUISubclass])
  {
    id v10 = v8;
    unsigned int v11 = [v9 systemInputActive];
    if (v11 != [v10 systemInputActive]) {
      -[PBKeyboardPlayPauseAccessManager _updateAppWithKeyboardOnScreen:]( self,  "_updateAppWithKeyboardOnScreen:",  @"SystemInputActive Changed");
    }
  }
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBKeyboardPlayPauseAccessManager appWithKeyboardOnScreen](self, "appWithKeyboardOnScreen"));
  id v5 = [v3 appendString:v4 withKey:@"appWithKeyboardOnScreen"];

  id v6 =  objc_msgSend( v3,  "appendBool:withKey:",  -[PBKeyboardPlayPauseAccessManager isKeyboardOnScreen](self, "isKeyboardOnScreen"),  @"keyboardOnScreen");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBKeyboardPlayPauseAccessManager focusedSceneBundleIdentifier](self, "focusedSceneBundleIdentifier"));
  id v8 = [v3 appendString:v7 withKey:@"focusedSceneBundleIdentifier"];

  return v3;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (PBHardwareButtonAccessManager)hardwareButtonAccessManager
{
  return self->_hardwareButtonAccessManager;
}

- (void)setHardwareButtonAccessManager:(id)a3
{
}

- (PBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
}

- (NSString)focusedSceneBundleIdentifier
{
  return self->_focusedSceneBundleIdentifier;
}

- (void)setFocusedSceneBundleIdentifier:(id)a3
{
}

- (BOOL)isKeyboardOnScreen
{
  return self->_keyboardOnScreen;
}

- (void)setKeyboardOnScreen:(BOOL)a3
{
  self->_keyboardOnScreen = a3;
}

- (NSString)appWithKeyboardOnScreen
{
  return self->_appWithKeyboardOnScreen;
}

- (FBScene)currentlyFocusedScene
{
  return self->_currentlyFocusedScene;
}

- (void).cxx_destruct
{
}

@end